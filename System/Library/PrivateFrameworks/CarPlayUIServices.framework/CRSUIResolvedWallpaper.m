@implementation CRSUIResolvedWallpaper

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 color:(id)a4
{
  return -[CRSUIResolvedWallpaper initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:](self, "initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:", a3, 0, 0, 0, a4);
}

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 statefulPackage:(id)a4
{
  return -[CRSUIResolvedWallpaper initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:](self, "initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:", a3, 0, 0, a4, 0);
}

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4
{
  return -[CRSUIResolvedWallpaper initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:](self, "initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:", a3, a4, 0, 0, 0);
}

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4 thumbnailResolver:(id)a5
{
  return -[CRSUIResolvedWallpaper initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:](self, "initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:", a3, a4, a5, 0, 0);
}

- (CRSUIResolvedWallpaper)initWithWallpaperInformation:(id)a3 imageResolver:(id)a4 thumbnailResolver:(id)a5 statefulPackage:(id)a6 color:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CRSUIResolvedWallpaper *v18;
  CRSUIResolvedWallpaper *v19;
  uint64_t v20;
  id imageResolver;
  uint64_t v22;
  id thumbnailResolver;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)CRSUIResolvedWallpaper;
  v18 = -[CRSUIResolvedWallpaper init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_wallpaper, a3);
    v20 = MEMORY[0x212BA7864](v14);
    imageResolver = v19->_imageResolver;
    v19->_imageResolver = (id)v20;

    v22 = MEMORY[0x212BA7864](v15);
    thumbnailResolver = v19->_thumbnailResolver;
    v19->_thumbnailResolver = (id)v22;

    objc_storeStrong((id *)&v19->_statefulPackage, a6);
    objc_storeStrong((id *)&v19->_color, a7);
  }

  return v19;
}

- (id)view
{
  id v3;
  id imageResolver;
  uint64_t v5;
  CRSUIStatefulCAPackage *statefulPackage;
  NSObject *v8;

  if (self->_color)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v3, "setBackgroundColor:", self->_color);
    return v3;
  }
  imageResolver = self->_imageResolver;
  if (imageResolver)
  {
    CRSUIImageViewWithResolver(imageResolver);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v3 = (id)v5;
    return v3;
  }
  statefulPackage = self->_statefulPackage;
  if (statefulPackage)
  {
    CRSUICAPackageViewWithStatefulPackage(statefulPackage);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  CRSUILogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[CRSUIResolvedWallpaper view].cold.1(v8);

  v3 = 0;
  return v3;
}

- (id)thumbnailWithCompatibleTraitCollection:(id)a3
{
  void (**thumbnailResolver)(_QWORD, _QWORD);

  thumbnailResolver = (void (**)(_QWORD, _QWORD))self->_thumbnailResolver;
  if (thumbnailResolver)
  {
    ((void (**)(_QWORD, id))thumbnailResolver)[2](thumbnailResolver, a3);
    thumbnailResolver = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return thumbnailResolver;
}

- (CRSUIWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_statefulPackage, 0);
  objc_storeStrong(&self->_thumbnailResolver, 0);
  objc_storeStrong(&self->_imageResolver, 0);
}

- (void)view
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20D6CC000, log, OS_LOG_TYPE_FAULT, "Invalid wallpaper information", v1, 2u);
}

@end
