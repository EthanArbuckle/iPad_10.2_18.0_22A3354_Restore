@implementation CRSUIClusterThemeCAPackageWallpaper

- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 state:(id)a5
{
  return -[CRSUIClusterThemeCAPackageWallpaper initWithAsset:type:lightModeState:darkModeState:supportsDynamicAppearance:](self, "initWithAsset:type:lightModeState:darkModeState:supportsDynamicAppearance:", a3, a4, a5, 0, 0);
}

- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 lightModeState:(id)a5 darkModeState:(id)a6
{
  return -[CRSUIClusterThemeCAPackageWallpaper initWithAsset:type:lightModeState:darkModeState:supportsDynamicAppearance:](self, "initWithAsset:type:lightModeState:darkModeState:supportsDynamicAppearance:", a3, a4, a5, a6, 1);
}

- (CRSUIClusterThemeCAPackageWallpaper)initWithAsset:(id)a3 type:(id)a4 lightModeState:(id)a5 darkModeState:(id)a6 supportsDynamicAppearance:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CRSUIClusterThemeCAPackageWallpaper *v17;
  CRSUIClusterThemeCAPackageWallpaper *v18;
  uint64_t v19;
  NSString *type;
  uint64_t v21;
  NSString *lightModeState;
  uint64_t v23;
  NSString *darkModeState;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CRSUIClusterThemeCAPackageWallpaper;
  v17 = -[CRSUIClusterThemeCAPackageWallpaper init](&v26, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_asset, a3);
    v19 = objc_msgSend(v14, "copy");
    type = v18->_type;
    v18->_type = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    lightModeState = v18->_lightModeState;
    v18->_lightModeState = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    darkModeState = v18->_darkModeState;
    v18->_darkModeState = (NSString *)v23;

    v18->_supportsDynamicAppearance = a7;
  }

  return v18;
}

- (id)stateForInterfaceStyle:(int64_t)a3
{
  uint64_t v4;

  if (a3 == 2 && -[CRSUIClusterThemeCAPackageWallpaper supportsDynamicAppearance](self, "supportsDynamicAppearance"))
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
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CRSUIClusterThemeCAPackageWallpaper asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("asset"));

  -[CRSUIClusterThemeCAPackageWallpaper type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("type"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_lightModeState, CFSTR("lightModeState"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_darkModeState, CFSTR("darkModeState"));
  objc_msgSend(v6, "encodeBool:forKey:", -[CRSUIClusterThemeCAPackageWallpaper supportsDynamicAppearance](self, "supportsDynamicAppearance"), CFSTR("supportsDynamicAppearance"));

}

- (CRSUIClusterThemeCAPackageWallpaper)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CRSUIClusterThemeCAPackageWallpaper *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("asset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lightModeState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("darkModeState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDynamicAppearance"));

  v10 = 0;
  if (v5 && v6)
  {
    self = -[CRSUIClusterThemeCAPackageWallpaper initWithAsset:type:lightModeState:darkModeState:supportsDynamicAppearance:](self, "initWithAsset:type:lightModeState:darkModeState:supportsDynamicAppearance:", v5, v6, v7, v8, v9);
    v10 = self;
  }

  return v10;
}

- (CRSUIClusterThemeCAPackageAsset)asset
{
  return self->_asset;
}

- (BOOL)supportsDynamicAppearance
{
  return self->_supportsDynamicAppearance;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_darkModeState, 0);
  objc_storeStrong((id *)&self->_lightModeState, 0);
}

@end
