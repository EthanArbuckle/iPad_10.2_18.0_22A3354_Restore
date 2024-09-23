@implementation CRSUIClusterThemeLayout

- (CRSUIClusterThemeLayout)initWithIdentifier:(id)a3 displayName:(id)a4 palettes:(id)a5 wallpapers:(id)a6 preview:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRSUIClusterThemeLayout *v17;
  uint64_t v18;
  NSString *identifier;
  uint64_t v20;
  NSString *displayName;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)CRSUIClusterThemeLayout;
  v17 = -[CRSUIClusterThemeLayout init](&v23, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v20;

    objc_storeStrong((id *)&v17->_palettes, a5);
    objc_storeStrong((id *)&v17->_wallpapers, a6);
    objc_storeStrong((id *)&v17->_preview, a7);
  }

  return v17;
}

- (BOOL)isCustomizable
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CRSUIClusterThemeLayout palettes](self, "palettes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v5 = 1;
  }
  else
  {
    -[CRSUIClusterThemeLayout wallpapers](self, "wallpapers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  }
  return v5;
}

- (CRSUIClusterThemePalette)defaultPalette
{
  return (CRSUIClusterThemePalette *)-[NSArray bs_firstObjectPassingTest:](self->_palettes, "bs_firstObjectPassingTest:", &__block_literal_global_11);
}

uint64_t __41__CRSUIClusterThemeLayout_defaultPalette__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDefault");
}

- (CRSUIClusterThemeWallpaper)defaultWallpaper
{
  return (CRSUIClusterThemeWallpaper *)-[NSArray bs_firstObjectPassingTest:](self->_wallpapers, "bs_firstObjectPassingTest:", &__block_literal_global_19);
}

uint64_t __43__CRSUIClusterThemeLayout_defaultWallpaper__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDefault");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (CRSUIClusterThemeLayout)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CRSUIClusterThemeLayout *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v7, objc_opt_class(), CFSTR("palettes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v9, objc_opt_class(), CFSTR("wallpapers"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preview"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[CRSUIClusterThemeLayout initWithIdentifier:displayName:palettes:wallpapers:preview:](self, "initWithIdentifier:displayName:palettes:wallpapers:preview:", v5, v6, v8, v10, v11);
  return v12;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CRSUIClusterThemeLayout identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("identifier"));

  -[CRSUIClusterThemeLayout displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("displayName"));

  -[CRSUIClusterThemeLayout palettes](self, "palettes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeCollection:forKey:", v6, CFSTR("palettes"));

  -[CRSUIClusterThemeLayout wallpapers](self, "wallpapers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeCollection:forKey:", v7, CFSTR("wallpapers"));

  -[CRSUIClusterThemeLayout preview](self, "preview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CRSUIClusterThemeLayout preview](self, "preview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("preview"));

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSArray)palettes
{
  return self->_palettes;
}

- (NSArray)wallpapers
{
  return self->_wallpapers;
}

- (CRSUIClusterThemeLayoutPreview)preview
{
  return self->_preview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_wallpapers, 0);
  objc_storeStrong((id *)&self->_palettes, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
