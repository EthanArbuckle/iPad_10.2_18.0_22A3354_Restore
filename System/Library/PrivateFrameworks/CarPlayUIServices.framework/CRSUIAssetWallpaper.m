@implementation CRSUIAssetWallpaper

- (CRSUIAssetWallpaper)initWithIdentifier:(id)a3 displayID:(id)a4 layoutID:(id)a5 cacheID:(id)a6 traits:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRSUIAssetWallpaper *v17;
  uint64_t v18;
  NSString *wallpaperIdentifier;
  uint64_t v20;
  NSString *displayID;
  uint64_t v22;
  NSString *layoutID;
  uint64_t v24;
  NSString *cacheID;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CRSUIAssetWallpaper;
  v17 = -[CRSUIAssetWallpaper init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    wallpaperIdentifier = v17->_wallpaperIdentifier;
    v17->_wallpaperIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    displayID = v17->_displayID;
    v17->_displayID = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    layoutID = v17->_layoutID;
    v17->_layoutID = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    cacheID = v17->_cacheID;
    v17->_cacheID = (NSString *)v24;

    objc_storeStrong((id *)&v17->_traits, a7);
  }

  return v17;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIAssetWallpaper wallpaperIdentifier](self, "wallpaperIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  -[CRSUIAssetWallpaper displayID](self, "displayID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("displayID"));

  -[CRSUIAssetWallpaper layoutID](self, "layoutID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("layoutID"));

  -[CRSUIAssetWallpaper traits](self, "traits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("traits"));

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    -[CRSUIAssetWallpaper data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)data
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BE15248]);
  -[CRSUIAssetWallpaper wallpaperIdentifier](self, "wallpaperIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIAssetWallpaper displayID](self, "displayID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUIAssetWallpaper layoutID](self, "layoutID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithWallpaperIdentifier:displayID:layoutID:", v4, v5, v6);

  return v7;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[CRSUIAssetWallpaper data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CRSUIWallpaperTraits)traits
{
  return self->_traits;
}

- (NSString)cacheID
{
  return self->_cacheID;
}

- (NSString)wallpaperIdentifier
{
  return self->_wallpaperIdentifier;
}

- (NSString)displayID
{
  return self->_displayID;
}

- (NSString)layoutID
{
  return self->_layoutID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutID, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_wallpaperIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheID, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
