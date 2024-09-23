@implementation SUUICommenter

- (SUUICommenter)initWithAuthor:(id)a3
{
  id v4;
  SUUICommenter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUICommenter;
  v5 = -[SUUICommenter init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "thumbnailImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMediaSocialAuthor setThumbnailImageURL:](v5, "setThumbnailImageURL:", v6);

    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMediaSocialAuthor setName:](v5, "setName:", v7);

    objc_msgSend(v4, "authorType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMediaSocialAuthor setAuthorType:](v5, "setAuthorType:", v8);

    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMediaSocialAuthor setIdentifier:](v5, "setIdentifier:", v9);

  }
  return v5;
}

- (NSString)attributedName
{
  return self->_attributedName;
}

- (void)setAttributedName:(id)a3
{
  objc_storeStrong((id *)&self->_attributedName, a3);
}

- (BOOL)isAttributed
{
  return self->_isAttributed;
}

- (void)setIsAttributed:(BOOL)a3
{
  self->_isAttributed = a3;
}

- (BOOL)isMySelf
{
  return self->_isMySelf;
}

- (void)setIsMySelf:(BOOL)a3
{
  self->_isMySelf = a3;
}

- (BOOL)useImageCopy
{
  return self->_useImageCopy;
}

- (void)setUseImageCopy:(BOOL)a3
{
  self->_useImageCopy = a3;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_attributedName, 0);
}

@end
