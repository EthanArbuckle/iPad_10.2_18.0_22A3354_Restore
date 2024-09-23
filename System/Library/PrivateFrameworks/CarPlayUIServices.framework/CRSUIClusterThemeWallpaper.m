@implementation CRSUIClusterThemeWallpaper

- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 image:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = a7;
  return -[CRSUIClusterThemeWallpaper initWithIdentifier:displayName:image:package:color:associatedPaletteID:isDefault:cacheID:data:traits:](self, "initWithIdentifier:displayName:image:package:color:associatedPaletteID:isDefault:cacheID:data:traits:", a3, a4, a5, 0, 0, a6, v11, a8, a9, a10);
}

- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 package:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = a7;
  return -[CRSUIClusterThemeWallpaper initWithIdentifier:displayName:image:package:color:associatedPaletteID:isDefault:cacheID:data:traits:](self, "initWithIdentifier:displayName:image:package:color:associatedPaletteID:isDefault:cacheID:data:traits:", a3, a4, 0, a5, 0, a6, v11, a8, a9, a10);
}

- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 color:(id)a5 associatedPaletteID:(id)a6 isDefault:(BOOL)a7 cacheID:(id)a8 data:(id)a9 traits:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = a7;
  return -[CRSUIClusterThemeWallpaper initWithIdentifier:displayName:image:package:color:associatedPaletteID:isDefault:cacheID:data:traits:](self, "initWithIdentifier:displayName:image:package:color:associatedPaletteID:isDefault:cacheID:data:traits:", a3, a4, 0, 0, a5, a6, v11, a8, a9, a10);
}

- (CRSUIClusterThemeWallpaper)initWithIdentifier:(id)a3 displayName:(id)a4 image:(id)a5 package:(id)a6 color:(id)a7 associatedPaletteID:(id)a8 isDefault:(BOOL)a9 cacheID:(id)a10 data:(id)a11 traits:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  CRSUIClusterThemeWallpaper *v22;
  uint64_t v23;
  NSString *identifier;
  uint64_t v25;
  NSString *displayName;
  uint64_t v27;
  NSString *associatedPaletteID;
  uint64_t v29;
  NSString *cacheID;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  v35 = a4;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v18 = a8;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v37.receiver = self;
  v37.super_class = (Class)CRSUIClusterThemeWallpaper;
  v22 = -[CRSUIClusterThemeWallpaper init](&v37, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v36, "copy");
    identifier = v22->_identifier;
    v22->_identifier = (NSString *)v23;

    v25 = objc_msgSend(v35, "copy");
    displayName = v22->_displayName;
    v22->_displayName = (NSString *)v25;

    objc_storeStrong((id *)&v22->_image, a5);
    objc_storeStrong((id *)&v22->_package, a6);
    objc_storeStrong((id *)&v22->_color, a7);
    v27 = objc_msgSend(v18, "copy");
    associatedPaletteID = v22->_associatedPaletteID;
    v22->_associatedPaletteID = (NSString *)v27;

    v22->_isDefault = a9;
    v29 = objc_msgSend(v19, "copy");
    cacheID = v22->_cacheID;
    v22->_cacheID = (NSString *)v29;

    objc_storeStrong((id *)&v22->_data, a11);
    objc_storeStrong((id *)&v22->_traits, a12);
  }

  return v22;
}

- (UIColor)color
{
  return -[CRSUIClusterThemeColor color](self->_color, "color");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[CRSUIClusterThemeWallpaper identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("wallpapers"));

  -[CRSUIClusterThemeWallpaper displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  -[CRSUIClusterThemeWallpaper image](self, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("image"));

  -[CRSUIClusterThemeWallpaper package](self, "package");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("package"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_color, CFSTR("color"));
  -[CRSUIClusterThemeWallpaper associatedPaletteID](self, "associatedPaletteID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("associatedPaletteID"));

  objc_msgSend(v4, "encodeBool:forKey:", -[CRSUIClusterThemeWallpaper isDefault](self, "isDefault"), CFSTR("default"));
  -[CRSUIClusterThemeWallpaper cacheID](self, "cacheID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("cacheID"));

  -[CRSUIClusterThemeWallpaper data](self, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("data"));

  -[CRSUIClusterThemeWallpaper traits](self, "traits");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("traits"));

}

- (CRSUIClusterThemeWallpaper)initWithBSXPCCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  CRSUIClusterThemeWallpaper *v13;
  CRSUIClusterThemeWallpaper *v14;
  uint64_t v16;
  uint64_t v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wallpapers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("package"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("color"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedPaletteID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("default"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traits"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v4 && v5 && (v13 = 0, v18 | v6 | v7) && v10 && v12)
  {
    LOBYTE(v16) = v9;
    v14 = -[CRSUIClusterThemeWallpaper initWithIdentifier:displayName:image:package:color:associatedPaletteID:isDefault:cacheID:data:traits:](self, "initWithIdentifier:displayName:image:package:color:associatedPaletteID:isDefault:cacheID:data:traits:", v4, v5, v18, v6, v7, v8, v16, v11, v10, v12);
    v13 = v14;
  }
  else
  {
    v14 = self;
  }

  return v13;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CRSUIClusterThemeImageWallpaper)image
{
  return self->_image;
}

- (CRSUIClusterThemeCAPackageWallpaper)package
{
  return self->_package;
}

- (NSString)associatedPaletteID
{
  return self->_associatedPaletteID;
}

- (BOOL)isDefault
{
  return self->_isDefault;
}

- (NSString)cacheID
{
  return self->_cacheID;
}

- (CRAssetWallpaperData)data
{
  return self->_data;
}

- (CRSUIWallpaperTraits)traits
{
  return self->_traits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_cacheID, 0);
  objc_storeStrong((id *)&self->_associatedPaletteID, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
