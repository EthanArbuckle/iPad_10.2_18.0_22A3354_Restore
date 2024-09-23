@implementation GKAvatarImage

- (GKAvatarImage)initWithPNGData:(id)a3 useUIImage:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  GKAvatarImage *v7;
  GKAvatarImage *v8;
  id v9;
  void *v10;
  objc_super v12;

  v4 = a4;
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKAvatarImage;
  v7 = -[GKAvatarImage init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    if (v4)
      v9 = 0;
    else
      v9 = v6;
    -[GKAvatarImage setImageData:](v7, "setImageData:", v9);
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "_gkImageWithCheckedData:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKAvatarImage setImage:](v8, "setImage:", v10);

    }
    else
    {
      -[GKAvatarImage setImage:](v8, "setImage:", 0);
    }
  }

  return v8;
}

- (void)prepareForUsingUIImage:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *v9;

  if (a3)
  {
    -[GKAvatarImage image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[GKAvatarImage imageData](self, "imageData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        return;
      v6 = (void *)MEMORY[0x24BDF6AC8];
      -[GKAvatarImage imageData](self, "imageData");
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_gkImageWithCheckedData:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKAvatarImage setImage:](self, "setImage:", v7);
LABEL_8:

      v4 = v9;
    }
  }
  else
  {
    -[GKAvatarImage imageData](self, "imageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[GKAvatarImage image](self, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        return;
      -[GKAvatarImage image](self, "image");
      v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
      UIImagePNGRepresentation(v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKAvatarImage setImageData:](self, "setImageData:", v7);
      goto LABEL_8;
    }
  }

}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
