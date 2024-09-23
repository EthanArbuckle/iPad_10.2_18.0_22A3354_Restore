@implementation CNSharingProfilePhotoPickerItem

- (id)originalImageWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void (**v7)(double, double);
  void *v8;

  height = a3.height;
  width = a3.width;
  -[CNSharingProfileAvatarItem originalImageProvider](self->_avatarItem, "originalImageProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNSharingProfileAvatarItem originalImageProvider](self->_avatarItem, "originalImageProvider");
    v7 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
    v7[2](width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)compositeImageWithSize:(CGSize)a3
{
  double height;
  double width;
  void (**v5)(double, double);
  void *v6;

  height = a3.height;
  width = a3.width;
  -[CNSharingProfileAvatarItem imageProvider](self->_avatarItem, "imageProvider");
  v5 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
  v5[2](width, height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UIImage)cachedPreviewImage
{
  return self->_cachedPreviewImage;
}

- (void)setCachedPreviewImage:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPreviewImage, a3);
}

- (CNSharingProfileAvatarItem)avatarItem
{
  return self->_avatarItem;
}

- (void)setAvatarItem:(id)a3
{
  objc_storeStrong((id *)&self->_avatarItem, a3);
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_avatarItem, 0);
  objc_storeStrong((id *)&self->_cachedPreviewImage, 0);
}

@end
