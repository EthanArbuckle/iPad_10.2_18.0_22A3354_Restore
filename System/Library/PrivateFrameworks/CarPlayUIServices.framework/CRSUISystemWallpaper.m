@implementation CRSUISystemWallpaper

+ (id)wallpaperWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:", v4);

  return v5;
}

+ (id)wallpapers
{
  if (wallpapers_onceToken != -1)
    dispatch_once(&wallpapers_onceToken, &__block_literal_global_10);
  return (id)wallpapers__systemWallpapers;
}

void __34__CRSUISystemWallpaper_wallpapers__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[11];

  v12[10] = *MEMORY[0x24BDAC8D0];
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaper2024BlueDynamic"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v0;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaper2024PurpleDynamic"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v1;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaper2024OchreDynamic"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v2;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaper2024GrayDynamic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v3;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaper2023MulticolorDynamic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v4;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaper2022ColorDynamic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v5;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaperWWDC2021MulticolorDynamic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v6;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaperRedBlueDynamic"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v7;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaperSolidDynamic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[8] = v8;
  +[CRSUISystemWallpaper wallpaperWithIdentifier:](CRSUISystemWallpaper, "wallpaperWithIdentifier:", CFSTR("CARWallpaperSolidBlack"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[9] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)wallpapers__systemWallpapers;
  wallpapers__systemWallpapers = v10;

}

+ (id)defaultWallpaper
{
  void *v2;
  void *v3;

  +[CRSUISystemWallpaper wallpapers](CRSUISystemWallpaper, "wallpapers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resolveWallpaper
{
  void *v3;
  void *v4;
  CRSUIResolvedWallpaper *v5;
  id v6;
  id v7;
  void *v8;
  CRSUIResolvedWallpaper *v9;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  -[CRSUISystemWallpaper wallpaperAssetCatalogName](self, "wallpaperAssetCatalogName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUISystemWallpaper thumbnailAssetCatalogName](self, "thumbnailAssetCatalogName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [CRSUIResolvedWallpaper alloc];
  v12 = v4;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __40__CRSUISystemWallpaper_resolveWallpaper__block_invoke;
  v13[3] = &unk_24C769C50;
  v14 = v3;
  v11 = MEMORY[0x24BDAC760];
  v6 = v4;
  v7 = v3;
  -[CRSUISystemWallpaper color](self, "color", v11, 3221225472, __40__CRSUISystemWallpaper_resolveWallpaper__block_invoke_2, &unk_24C769C50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CRSUIResolvedWallpaper initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:](v5, "initWithWallpaperInformation:imageResolver:thumbnailResolver:statefulPackage:color:", self, v13, &v11, 0, v8);

  return v9;
}

id __40__CRSUISystemWallpaper_resolveWallpaper__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "crsui_wallpaperImageNamed:compatibleWithTraitCollection:", v2, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

id __40__CRSUISystemWallpaper_resolveWallpaper__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "crsui_imageNamed:compatibleWithTraitCollection:", v2, a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (UIColor)color
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  int v7;

  -[CRSUISystemWallpaper systemIdentifier](self, "systemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("CARWallpaperSolidDynamic"));

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithDynamicProvider:", &__block_literal_global_52);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CRSUISystemWallpaper systemIdentifier](self, "systemIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("CARWallpaperSolidBlack"));

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }
  return (UIColor *)v5;
}

id __29__CRSUISystemWallpaper_color__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a2, "userInterfaceStyle") == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDF6F30];
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceIdiom:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "traitCollectionWithTraitsFromCollections:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "traitCollectionByReplacingNSIntegerValue:forTrait:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolvedColorWithTraitCollection:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

- (NSString)identifier
{
  return self->_systemIdentifier;
}

- (id)data
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE15278]);
  -[CRSUISystemWallpaper identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithIdentifier:", v4);

  return v5;
}

- (NSString)cacheID
{
  void *v3;
  NSString *systemIdentifier;
  NSString *v5;

  -[CRSUISystemWallpaper color](self, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    systemIdentifier = 0;
  else
    systemIdentifier = self->_systemIdentifier;
  v5 = systemIdentifier;

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRSUISystemWallpaper identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("identifier"));

  -[CRSUISystemWallpaper traits](self, "traits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("traits"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
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
    -[CRSUISystemWallpaper data](self, "data");
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

- (CRSUISystemWallpaper)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  CRSUISystemWallpaper *v8;
  CRSUISystemWallpaper *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  CRSUIWallpaperTraits *traits;
  uint64_t v18;
  NSString *wallpaperAssetCatalogName;
  uint64_t v20;
  NSString *thumbnailAssetCatalogName;
  CRSUISystemWallpaper *v22;
  NSObject *v23;
  unsigned int v25;
  CRSUIWallpaperTraits *v26;
  objc_super v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CRSUISystemWallpaper _wallpaperInfo](CRSUISystemWallpaper, "_wallpaperInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v27.receiver = self;
    v27.super_class = (Class)CRSUISystemWallpaper;
    v8 = -[CRSUISystemWallpaper init](&v27, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_systemIdentifier, a3);
      v26 = [CRSUIWallpaperTraits alloc];
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dynamicAppearance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v10, "BOOLValue");
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("dashboardPlatterMaterials"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iconLabelsBackground"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hideRoundedCorners"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[CRSUIWallpaperTraits initWithSupportsDynamicAppearance:supportsDashboardPlatterMaterials:iconLabelsRequireBackground:hideRoundedCorners:black:](v26, "initWithSupportsDynamicAppearance:supportsDashboardPlatterMaterials:iconLabelsRequireBackground:hideRoundedCorners:black:", v25, v12, v14, objc_msgSend(v15, "BOOLValue"), -[NSString isEqualToString:](v9->_systemIdentifier, "isEqualToString:", CFSTR("CARWallpaperSolidBlack")));
      traits = v9->_traits;
      v9->_traits = (CRSUIWallpaperTraits *)v16;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("wallpaperAssetCatalogName"));
      v18 = objc_claimAutoreleasedReturnValue();
      wallpaperAssetCatalogName = v9->_wallpaperAssetCatalogName;
      v9->_wallpaperAssetCatalogName = (NSString *)v18;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbnailAssetCatalogName"));
      v20 = objc_claimAutoreleasedReturnValue();
      thumbnailAssetCatalogName = v9->_thumbnailAssetCatalogName;
      v9->_thumbnailAssetCatalogName = (NSString *)v20;

    }
    self = v9;
    v22 = self;
  }
  else
  {
    CRSUILogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v5;
      _os_log_impl(&dword_20D6CC000, v23, OS_LOG_TYPE_DEFAULT, "[CRSUIWallpaperPreferences] Unknown wallpaper: %{public}@", buf, 0xCu);
    }

    v22 = 0;
  }

  return v22;
}

- (id)_imageURLWithCompatibleTraitCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[CRSUISystemWallpaper wallpaperAssetCatalogName](self, "wallpaperAssetCatalogName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v4, "userInterfaceStyle");
    v7 = CFSTR("-Dark");
    if (v6 == 1)
      v7 = CFSTR("-Light");
    v8 = v7;
    -[CRSUISystemWallpaper wallpaperAssetCatalogName](self, "wallpaperAssetCatalogName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CarPlayUIServices"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLForResource:withExtension:", v10, CFSTR("heic"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_thumbnailImageURLWithCompatibleTraitCollection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CRSUISystemWallpaper thumbnailAssetCatalogName](self, "thumbnailAssetCatalogName", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CarPlayUIServices"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSUISystemWallpaper thumbnailAssetCatalogName](self, "thumbnailAssetCatalogName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForResource:withExtension:", v6, CFSTR("heic"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_wallpaperInfo
{
  if (_wallpaperInfo_onceToken != -1)
    dispatch_once(&_wallpaperInfo_onceToken, &__block_literal_global_71);
  return (id)_wallpaperInfo__wallpaperInfo;
}

void __38__CRSUISystemWallpaper__wallpaperInfo__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD v15[4];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  _QWORD v23[6];
  _QWORD v24[6];
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[10];
  _QWORD v35[12];

  v35[10] = *MEMORY[0x24BDAC8D0];
  v34[0] = CFSTR("CARWallpaper2024BlueDynamic");
  v0 = MEMORY[0x24BDBD1C8];
  v32[0] = CFSTR("dynamicAppearance");
  v32[1] = CFSTR("dashboardPlatterMaterials");
  v33[0] = MEMORY[0x24BDBD1C8];
  v33[1] = MEMORY[0x24BDBD1C8];
  v32[2] = CFSTR("iconLabelsBackground");
  v32[3] = CFSTR("wallpaperAssetCatalogName");
  v33[2] = MEMORY[0x24BDBD1C8];
  v33[3] = CFSTR("Wallpaper2024Blue");
  v32[4] = CFSTR("thumbnailAssetCatalogName");
  v32[5] = CFSTR("hideRoundedCorners");
  v1 = MEMORY[0x24BDBD1C0];
  v33[4] = CFSTR("WallpaperCell2024Blue");
  v33[5] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v13;
  v34[1] = CFSTR("CARWallpaper2024PurpleDynamic");
  v30[0] = CFSTR("dynamicAppearance");
  v30[1] = CFSTR("dashboardPlatterMaterials");
  v31[0] = v0;
  v31[1] = v0;
  v31[2] = v0;
  v31[3] = CFSTR("Wallpaper2024Purple");
  v30[2] = CFSTR("iconLabelsBackground");
  v30[3] = CFSTR("wallpaperAssetCatalogName");
  v30[4] = CFSTR("thumbnailAssetCatalogName");
  v30[5] = CFSTR("hideRoundedCorners");
  v31[4] = CFSTR("WallpaperCell2024Purple");
  v31[5] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v12;
  v34[2] = CFSTR("CARWallpaper2024OchreDynamic");
  v28[0] = CFSTR("dynamicAppearance");
  v28[1] = CFSTR("dashboardPlatterMaterials");
  v29[0] = v0;
  v29[1] = v0;
  v29[2] = v0;
  v29[3] = CFSTR("Wallpaper2024Ochre");
  v28[2] = CFSTR("iconLabelsBackground");
  v28[3] = CFSTR("wallpaperAssetCatalogName");
  v28[4] = CFSTR("thumbnailAssetCatalogName");
  v28[5] = CFSTR("hideRoundedCorners");
  v29[4] = CFSTR("WallpaperCell2024Ochre");
  v29[5] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v11;
  v34[3] = CFSTR("CARWallpaper2024GrayDynamic");
  v26[0] = CFSTR("dynamicAppearance");
  v26[1] = CFSTR("dashboardPlatterMaterials");
  v27[0] = v0;
  v27[1] = v0;
  v27[2] = v0;
  v27[3] = CFSTR("Wallpaper2024Gray");
  v26[2] = CFSTR("iconLabelsBackground");
  v26[3] = CFSTR("wallpaperAssetCatalogName");
  v26[4] = CFSTR("thumbnailAssetCatalogName");
  v26[5] = CFSTR("hideRoundedCorners");
  v27[4] = CFSTR("WallpaperCell2024Gray");
  v27[5] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v10;
  v34[4] = CFSTR("CARWallpaper2023MulticolorDynamic");
  v24[0] = CFSTR("dynamicAppearance");
  v24[1] = CFSTR("dashboardPlatterMaterials");
  v25[0] = v0;
  v25[1] = v0;
  v25[2] = v0;
  v25[3] = CFSTR("Wallpaper2023Multicolor");
  v24[2] = CFSTR("iconLabelsBackground");
  v24[3] = CFSTR("wallpaperAssetCatalogName");
  v24[4] = CFSTR("thumbnailAssetCatalogName");
  v24[5] = CFSTR("hideRoundedCorners");
  v25[4] = CFSTR("WallpaperCell2023Multicolor");
  v25[5] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v9;
  v34[5] = CFSTR("CARWallpaper2022ColorDynamic");
  v22[0] = CFSTR("dynamicAppearance");
  v22[1] = CFSTR("dashboardPlatterMaterials");
  v23[0] = v0;
  v23[1] = v0;
  v23[2] = v0;
  v23[3] = CFSTR("Wallpaper2022Color");
  v22[2] = CFSTR("iconLabelsBackground");
  v22[3] = CFSTR("wallpaperAssetCatalogName");
  v22[4] = CFSTR("thumbnailAssetCatalogName");
  v22[5] = CFSTR("hideRoundedCorners");
  v23[4] = CFSTR("WallpaperCell2022Color");
  v23[5] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v8;
  v34[6] = CFSTR("CARWallpaperWWDC2021MulticolorDynamic");
  v20[0] = CFSTR("dynamicAppearance");
  v20[1] = CFSTR("dashboardPlatterMaterials");
  v21[0] = v0;
  v21[1] = v0;
  v21[2] = v0;
  v21[3] = CFSTR("WallpaperWWDC2021Multicolor");
  v20[2] = CFSTR("iconLabelsBackground");
  v20[3] = CFSTR("wallpaperAssetCatalogName");
  v20[4] = CFSTR("thumbnailAssetCatalogName");
  v20[5] = CFSTR("hideRoundedCorners");
  v21[4] = CFSTR("WallpaperCellWWDC2021Multicolor");
  v21[5] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v2;
  v34[7] = CFSTR("CARWallpaperRedBlueDynamic");
  v18[0] = CFSTR("dynamicAppearance");
  v18[1] = CFSTR("dashboardPlatterMaterials");
  v19[0] = v0;
  v19[1] = v0;
  v18[2] = CFSTR("iconLabelsBackground");
  v18[3] = CFSTR("wallpaperAssetCatalogName");
  v19[2] = v0;
  v19[3] = CFSTR("WallpaperRedBlue");
  v18[4] = CFSTR("thumbnailAssetCatalogName");
  v18[5] = CFSTR("hideRoundedCorners");
  v19[4] = CFSTR("WallpaperCellRedBlue");
  v19[5] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v3;
  v34[8] = CFSTR("CARWallpaperSolidDynamic");
  v16[0] = CFSTR("dynamicAppearance");
  v16[1] = CFSTR("dashboardPlatterMaterials");
  v17[0] = v0;
  v17[1] = v1;
  v16[2] = CFSTR("iconLabelsBackground");
  v16[3] = CFSTR("thumbnailAssetCatalogName");
  v17[2] = v1;
  v17[3] = CFSTR("WallpaperCellSolid");
  v16[4] = CFSTR("hideRoundedCorners");
  v17[4] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v4;
  v34[9] = CFSTR("CARWallpaperSolidBlack");
  v14[0] = CFSTR("dynamicAppearance");
  v14[1] = CFSTR("dashboardPlatterMaterials");
  v15[0] = v1;
  v15[1] = v1;
  v14[2] = CFSTR("iconLabelsBackground");
  v14[3] = CFSTR("hideRoundedCorners");
  v15[2] = v1;
  v15[3] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 10);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)_wallpaperInfo__wallpaperInfo;
  _wallpaperInfo__wallpaperInfo = v6;

}

- (CRSUIWallpaperTraits)traits
{
  return self->_traits;
}

- (NSString)systemIdentifier
{
  return self->_systemIdentifier;
}

- (NSString)wallpaperAssetCatalogName
{
  return self->_wallpaperAssetCatalogName;
}

- (NSString)thumbnailAssetCatalogName
{
  return self->_thumbnailAssetCatalogName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailAssetCatalogName, 0);
  objc_storeStrong((id *)&self->_wallpaperAssetCatalogName, 0);
  objc_storeStrong((id *)&self->_systemIdentifier, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
