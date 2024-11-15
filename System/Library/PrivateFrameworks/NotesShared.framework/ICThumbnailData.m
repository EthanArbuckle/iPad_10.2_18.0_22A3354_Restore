@implementation ICThumbnailData

- (ICThumbnailData)initWithImage:(id)a3 imageScaling:(unint64_t)a4 showAsFileIcon:(BOOL)a5 isMovie:(BOOL)a6
{
  id v11;
  ICThumbnailData *v12;
  ICThumbnailData *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICThumbnailData;
  v12 = -[ICThumbnailData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    v13->_imageScaling = a4;
    v13->_showAsFileIcon = a5;
    v13->_isMovie = a6;
  }

  return v13;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (unint64_t)imageScaling
{
  return self->_imageScaling;
}

- (void)setImageScaling:(unint64_t)a3
{
  self->_imageScaling = a3;
}

- (BOOL)showAsFileIcon
{
  return self->_showAsFileIcon;
}

- (void)setShowAsFileIcon:(BOOL)a3
{
  self->_showAsFileIcon = a3;
}

- (BOOL)isMovie
{
  return self->_isMovie;
}

- (void)setIsMovie:(BOOL)a3
{
  self->_isMovie = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
