@implementation MKIconStyle

- (MKIconStyle)initWithStyleAttributes:(id)a3 isHybridMap:(BOOL)a4
{
  id v7;
  MKIconStyle *v8;
  MKIconStyle *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKIconStyle;
  v8 = -[MKIconStyle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_styleAttributes, a3);
    v9->_isHybridMap = a4;
    -[MKIconStyle _setColorAndImages](v9, "_setColorAndImages");
  }

  return v9;
}

- (UIColor)backgroundColor
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__MKIconStyle_backgroundColor__block_invoke;
  v3[3] = &unk_1E20DBBF0;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithDynamicProvider:", v3);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

id __30__MKIconStyle_backgroundColor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = objc_msgSend(a2, "userInterfaceStyle");
  v4 = *(_QWORD *)(a1 + 32);
  if (v3 != 2)
  {
    v5 = *(void **)(v4 + 16);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    goto LABEL_5;
  }
  v5 = *(void **)(v4 + 24);
  if (v5)
  {
LABEL_5:
    v6 = v5;
    return v6;
  }
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (UIImage)image
{
  UIImageAsset *combinedImageAsset;
  void *v3;
  void *v4;
  void *v5;

  combinedImageAsset = self->_combinedImageAsset;
  if (combinedImageAsset)
  {
    objc_msgSend(MEMORY[0x1E0CEAB40], "_currentTraitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageAsset imageWithTraitCollection:](combinedImageAsset, "imageWithTraitCollection:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("mappin"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithTintColor:renderingMode:", v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIImage *)v4;
}

- (void)_setColorAndImages
{
  id v3;
  GEOFeatureStyleAttributes *v4;
  GEOFeatureStyleAttributes *styleAttributes;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  UIImageAsset *v10;
  UIImageAsset *combinedImageAsset;
  UIColor *v12;
  UIColor *backgroundColorLight;
  UIColor *v14;
  UIColor *backgroundColorDark;
  id v16;

  v16 = objc_alloc_init(MEMORY[0x1E0DC6508]);
  objc_msgSend(v16, "setGlyphOnly:", 1);
  v3 = objc_alloc_init(MEMORY[0x1E0DC6508]);
  objc_msgSend(v3, "setGlyphOnly:", 1);
  objc_msgSend(v3, "setNightMode:", 1);
  objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForMapFeatureAttributes:elevatedGround:", self->_styleAttributes, -[MKIconStyle _elevationForIcons](self, "_elevationForIcons"));
  v4 = (GEOFeatureStyleAttributes *)objc_claimAutoreleasedReturnValue();
  styleAttributes = self->_styleAttributes;
  self->_styleAttributes = v4;

  -[MKIconStyle iconForModifiers:](self, "iconForModifiers:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKIconStyle iconForModifiers:](self, "iconForModifiers:", v3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = (UIImageAsset *)objc_alloc_init(MEMORY[0x1E0CEA640]);
    combinedImageAsset = self->_combinedImageAsset;
    self->_combinedImageAsset = v10;

    -[MKIconStyle registerImage:darkMode:](self, "registerImage:darkMode:", v6, 0);
    -[MKIconStyle registerImage:darkMode:](self, "registerImage:darkMode:", v8, 1);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(v6, "fillColor"));
    v12 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColorLight = self->_backgroundColorLight;
    self->_backgroundColorLight = v12;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", objc_msgSend(v8, "fillColor"));
    v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColorDark = self->_backgroundColorDark;
    self->_backgroundColorDark = v14;

  }
}

- (id)iconForModifiers:(id)a3
{
  id v4;
  void *v5;
  GEOFeatureStyleAttributes *styleAttributes;
  void *v7;
  double v8;
  void *v9;

  v4 = a3;
  +[MKIconManager iconManager](MKIconManager, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  styleAttributes = self->_styleAttributes;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  *(float *)&v8 = v8;
  objc_msgSend(v5, "imageForStyleAttributes:withStylesheetName:contentScale:sizeGroup:modifiers:", styleAttributes, CFSTR("default"), 8, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)registerImage:(id)a3 darkMode:(BOOL)a4
{
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  float v10;
  float v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  BOOL v15;

  v6 = (objc_class *)MEMORY[0x1E0CEA638];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = objc_msgSend(v7, "image");
  objc_msgSend(v7, "contentScale");
  v11 = v10;

  v13 = (id)objc_msgSend(v8, "initWithCGImage:scale:orientation:", v9, 0, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __38__MKIconStyle_registerImage_darkMode___block_invoke;
  v14[3] = &__block_descriptor_33_e27_v16__0___UIMutableTraits__8l;
  v15 = a4;
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithTraits:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageAsset registerImage:withTraitCollection:](self->_combinedImageAsset, "registerImage:withTraitCollection:", v13, v12);

}

void __38__MKIconStyle_registerImage_darkMode___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CEA950];
  v6 = a2;
  objc_msgSend(v3, "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  objc_msgSend(v6, "setDisplayScale:");

  if (*(_BYTE *)(a1 + 32))
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v6, "setUserInterfaceStyle:", v5);

}

- (BOOL)_elevationForIcons
{
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsAdvancedMap"))
    v4 = !self->_isHybridMap;
  else
    v4 = 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedImageAsset, 0);
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
}

@end
