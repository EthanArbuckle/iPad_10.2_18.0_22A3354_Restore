@implementation CPNowPlayingImageButton

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPNowPlayingImageButton)initWithImage:(UIImage *)image handler:(void *)handler
{
  UIImage *v6;
  CPNowPlayingImageButton *v7;
  CPImageSet *v8;
  objc_class *v9;
  UIImage *v10;
  void *v11;
  void *v12;
  UIImage *v13;
  CPImageSet *v14;
  objc_super v16;

  v6 = image;
  v16.receiver = self;
  v16.super_class = (Class)CPNowPlayingImageButton;
  v7 = -[CPNowPlayingButton initWithHandler:](&v16, sel_initWithHandler_, handler);
  if (v7)
  {
    v8 = [CPImageSet alloc];
    v9 = (objc_class *)objc_opt_class();
    v10 = v6;
    -[UIImage images](v10, "images");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        CPSanitizeImage_cold_1(v9);
      -[UIImage images](v10, "images");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (UIImage *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = v10;
    }

    v14 = -[CPImageSet initWithImage:treatmentBlock:](v8, "initWithImage:treatmentBlock:", v13, &__block_literal_global_6);
    -[CPNowPlayingImageButton setImageSet:](v7, "setImageSet:", v14);

  }
  return v7;
}

id __49__CPNowPlayingImageButton_initWithImage_handler___block_invoke(uint64_t a1, void *a2)
{
  return CPImageByScalingImageToSize(a2, 20.0, 20.0);
}

- (CPNowPlayingImageButton)initWithCoder:(id)a3
{
  id v4;
  CPNowPlayingImageButton *v5;
  uint64_t v6;
  CPImageSet *imageSet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPNowPlayingImageButton;
  v5 = -[CPNowPlayingButton initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPNowPlayingButtonButtonImageSet"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageSet = v5->_imageSet;
    v5->_imageSet = (CPImageSet *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPNowPlayingImageButton;
  v4 = a3;
  -[CPNowPlayingButton encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CPNowPlayingImageButton imageSet](self, "imageSet", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPNowPlayingButtonButtonImageSet"));

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[CPNowPlayingImageButton imageSet](self, "imageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (CPImageSet)imageSet
{
  return self->_imageSet;
}

- (void)setImageSet:(id)a3
{
  objc_storeStrong((id *)&self->_imageSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSet, 0);
}

@end
