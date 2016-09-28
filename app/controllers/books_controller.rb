class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
helper_method :sort_column, :sort_direction
  # GET /books
  # GET /books.json
  def index
    @books = Book.where(["title like ?","%#{params[:search]}%"])
     @books= Book.order(sort_column + " " + sort_direction)
    if(params[:sortway]=="Order By Desc"&&params[:sorttitle]=="Title")
    @books=@books.order(title: :desc)
    end
    if(params[:sortway]=="Order By Asc"&&params[:sorttitle]=="Title")
    @books=@books.order(title: :asc)
      end
    if(params[:sortway]=="Order By Desc"&&params[:sorttitle]=="Publish Year")
    @books=@books.order(publish_year: :desc)
    end
    if(params[:sortway]=="Order By Asc"&&params[:sorttitle]=="Publish Year")
    @books=@books.order(publish_year: :asc)
    end
    if(params[:sortway]=="Order By Desc"&&params[:sorttitle]=="Author")
    @books=@books.order(authors: :desc)
    end
    if(params[:sortway]=="Order By Asc"&&params[:sorttitle]=="Author")
    @books=@books.order(authors: :asc)
    end
    if(params[:sortway]=="Order By Desc"&&params[:sorttitle]=="Journal")
    @books=@books.order(journal: :desc)
    end
    if(params[:sortway]=="Order By Asc"&&params[:sorttitle]=="Journal")
    @books=@books.order(journal: :asc)
    end
    if(params[:sortway]=="Order By Desc"&&params[:sorttitle]=="Username")
    @books=@books.order(username: :desc)
    end
    if(params[:sortway]=="Order By Asc"&&params[:sorttitle]=="Username")
    @books=@books.order(username: :asc)
    end
   
 
   
  end 
  # GET /books/1s
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:username, :submitted_date, :paper_status, :moderated_id, :moderated_date, :analysed_id, :analysed_date, :authors, :title, :journal, :publish_year, :publish_volume, :publish_pages, :publish_month, :credibility_rate, :research_metrix, :research_aim, :research_method, :participant)
    end
   
  def sort_column
    params[:sort]||"title"
  end
  
  def sort_direction
   params[:direction]||"asc"
  end
end