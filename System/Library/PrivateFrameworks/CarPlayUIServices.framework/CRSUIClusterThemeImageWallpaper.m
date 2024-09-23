@implementation CRSUIClusterThemeImageWallpaper

- (CRSUIClusterThemeImageWallpaper)initWithAsset:(id)a3
{
  return -[CRSUIClusterThemeImageWallpaper initWithLightModeAsset:darkModeAsset:supportsDynamicAppearance:](self, "initWithLightModeAsset:darkModeAsset:supportsDynamicAppearance:", a3, 0, 0);
}

- (CRSUIClusterThemeImageWallpaper)initWithLightModeAsset:(id)a3 darkModeAsset:(id)a4
{
  return -[CRSUIClusterThemeImageWallpaper initWithLightModeAsset:darkModeAsset:supportsDynamicAppearance:](self, "initWithLightModeAsset:darkModeAsset:supportsDynamicAppearance:", a3, a4, 1);
}

- (CRSUIClusterThemeImageWallpaper)initWithLightModeAsset:(id)a3 darkModeAsset:(id)a4 supportsDynamicAppearance:(BOOL)a5
{
  id v9;
  id v10;
  CRSUIClusterThemeImageWallpaper *v11;
  CRSUIClusterThemeImageWallpaper *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRSUIClusterThemeImageWallpaper;
  v11 = -[CRSUIClusterThemeImageWallpaper init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_lightModeAsset, a3);
    objc_storeStrong((id *)&v12->_darkModeAsset, a4);
    v12->_supportsDynamicAppearance = a5;
  }

  return v12;
}

- (id)assetForInterfaceStyle:(int64_t)a3
{
  uint64_t v4;

  if (a3 == 2 && -[CRSUIClusterThemeImageWallpaper supportsDynamicAppearance](self, "supportsDynamicAppearance"))
    v4 = 16;
  else
    v4 = 8;
  return *(id *)((char *)&self->super.isa + v4);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  CRSUIClusterThemeImageAsset *lightModeAsset;
  id v5;

  lightModeAsset = self->_lightModeAsset;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lightModeAsset, CFSTR("lightModeAsset"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_darkModeAsset, CFSTR("darkModeAsset"));
  objc_msgSend(v5, "encodeBool:forKey:", -[CRSUIClusterThemeImageWallpaper supportsDynamicAppearance](self, "supportsDynamicAppearance"), CFSTR("supportsDynamicAppearance"));

}

- (CRSUIClusterThemeImageWallpaper)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CRSUIClusterThemeImageWallpaper *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightModeAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("darkModeAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDynamicAppearance"));

  if (v5)
  {
    self = -[CRSUIClusterThemeImageWallpaper initWithLightModeAsset:darkModeAsset:supportsDynamicAppearance:](self, "initWithLightModeAsset:darkModeAsset:supportsDynamicAppearance:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)supportsDynamicAppearance
{
  return self->_supportsDynamicAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkModeAsset, 0);
  objc_storeStrong((id *)&self->_lightModeAsset, 0);
}

@end
