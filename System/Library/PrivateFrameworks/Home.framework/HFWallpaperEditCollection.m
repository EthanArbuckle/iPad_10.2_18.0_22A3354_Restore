@implementation HFWallpaperEditCollection

- (HFWallpaperEditCollection)initWithWallpaper:(id)a3 originalImage:(id)a4 processedImage:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFWallpaperEditCollection *v12;
  HFWallpaperEditCollection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFWallpaperEditCollection;
  v12 = -[HFWallpaperEditCollection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_wallpaper, a3);
    objc_storeStrong((id *)&v13->_originalImage, a4);
    objc_storeStrong((id *)&v13->_processedImage, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFWallpaperEditCollection wallpaper](self, "wallpaper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, wallpaper = %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HFWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (UIImage)originalImage
{
  return self->_originalImage;
}

- (UIImage)processedImage
{
  return self->_processedImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedImage, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end
