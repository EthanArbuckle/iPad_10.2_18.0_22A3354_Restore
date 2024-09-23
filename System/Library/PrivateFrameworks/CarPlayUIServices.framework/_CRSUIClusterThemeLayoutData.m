@implementation _CRSUIClusterThemeLayoutData

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_CRSUIClusterThemeLayoutData)initWithBSXPCCoder:(id)a3
{
  id v4;
  _CRSUIClusterThemeLayoutData *v5;
  uint64_t v6;
  NSDictionary *themeData;
  uint64_t v8;
  uint64_t v9;
  NSArray *displays;
  uint64_t v11;
  NSSecurityScopedURLWrapper *extraAssetsURL;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CRSUIClusterThemeLayoutData;
  v5 = -[_CRSUIClusterThemeLayoutData init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDictionaryOfClass:forKey:", objc_opt_class(), CFSTR("themeData"));
    v6 = objc_claimAutoreleasedReturnValue();
    themeData = v5->_themeData;
    v5->_themeData = (NSDictionary *)v6;

    v8 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v8, objc_opt_class(), CFSTR("displays"));
    v9 = objc_claimAutoreleasedReturnValue();
    displays = v5->_displays;
    v5->_displays = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extraAssetsURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    extraAssetsURL = v5->_extraAssetsURL;
    v5->_extraAssetsURL = (NSSecurityScopedURLWrapper *)v11;

    v5->_assetVersion = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("assetVersion"));
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_CRSUIClusterThemeLayoutData themeData](self, "themeData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeDictionary:forKey:", v4, CFSTR("themeData"));

  -[_CRSUIClusterThemeLayoutData displays](self, "displays");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeCollection:forKey:", v5, CFSTR("displays"));

  -[_CRSUIClusterThemeLayoutData extraAssetsURL](self, "extraAssetsURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("extraAssetsURL"));

  objc_msgSend(v7, "encodeUInt64:forKey:", -[_CRSUIClusterThemeLayoutData assetVersion](self, "assetVersion"), CFSTR("assetVersion"));
}

- (NSDictionary)themeData
{
  return self->_themeData;
}

- (void)setThemeData:(id)a3
{
  objc_storeStrong((id *)&self->_themeData, a3);
}

- (NSArray)displays
{
  return self->_displays;
}

- (void)setDisplays:(id)a3
{
  objc_storeStrong((id *)&self->_displays, a3);
}

- (NSSecurityScopedURLWrapper)extraAssetsURL
{
  return self->_extraAssetsURL;
}

- (void)setExtraAssetsURL:(id)a3
{
  objc_storeStrong((id *)&self->_extraAssetsURL, a3);
}

- (unint64_t)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(unint64_t)a3
{
  self->_assetVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraAssetsURL, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_themeData, 0);
}

@end
