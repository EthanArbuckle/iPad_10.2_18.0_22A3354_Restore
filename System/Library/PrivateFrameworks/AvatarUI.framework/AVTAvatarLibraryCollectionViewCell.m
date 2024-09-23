@implementation AVTAvatarLibraryCollectionViewCell

+ (id)cellIdentifier
{
  return CFSTR("AVTAvatarLibraryCollectionViewCell");
}

- (AVTAvatarLibraryCollectionViewCell)initWithFrame:(CGRect)a3
{
  AVTAvatarLibraryCollectionViewCell *v3;
  id v4;
  void *v5;
  UIImageView *v6;
  void *v7;
  UIImageView *imageView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVTAvatarLibraryCollectionViewCell;
  v3 = -[AVTAvatarLibraryCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[AVTAvatarLibraryCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");

    -[UIImageView setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
    -[AVTAvatarLibraryCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    imageView = v3->_imageView;
    v3->_imageView = v6;

  }
  return v3;
}

- (void)updateAvatarImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AVTAvatarLibraryCollectionViewCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
