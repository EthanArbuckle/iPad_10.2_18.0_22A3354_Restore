@implementation AVTAvatarAttributeEditorSectionColorItem

- (AVTAvatarAttributeEditorSectionColorItem)initWithColor:(id)a3 imageProvider:(id)a4 colorLayerProvider:(id)a5 avatarUpdater:(id)a6 derivedColorDependent:(BOOL)a7 selected:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[AVTAvatarAttributeEditorSectionColorItem initWithColor:skinColor:imageProvider:colorLayerProvider:avatarUpdater:derivedColorDependent:selected:](self, "initWithColor:skinColor:imageProvider:colorLayerProvider:avatarUpdater:derivedColorDependent:selected:", a3, 0, a4, a5, a6, a7, v9);
}

- (AVTAvatarAttributeEditorSectionColorItem)initWithColor:(id)a3 skinColor:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 avatarUpdater:(id)a7 derivedColorDependent:(BOOL)a8 selected:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  AVTAvatarAttributeEditorSectionColorItem *v21;
  uint64_t v22;
  NSString *identifier;
  void *v24;
  uint64_t v25;
  NSString *localizedName;
  uint64_t v27;
  id layerContentProvider;
  uint64_t v29;
  id gradientProvider;
  uint64_t v31;
  id avatarUpdater;
  objc_super v34;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a6;
  objc_msgSend(v18, "providerForColorIntoLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "providerForGradientFromColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v34.receiver = self;
  v34.super_class = (Class)AVTAvatarAttributeEditorSectionColorItem;
  v21 = -[AVTAvatarAttributeEditorSectionColorItem init](&v34, sel_init);
  if (v21)
  {
    objc_msgSend(v15, "identifier");
    v22 = objc_claimAutoreleasedReturnValue();
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    objc_msgSend(v15, "localizedName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    localizedName = v21->_localizedName;
    v21->_localizedName = (NSString *)v25;

    v27 = objc_msgSend(v19, "copy");
    layerContentProvider = v21->_layerContentProvider;
    v21->_layerContentProvider = (id)v27;

    v29 = objc_msgSend(v20, "copy");
    gradientProvider = v21->_gradientProvider;
    v21->_gradientProvider = (id)v29;

    objc_storeStrong((id *)&v21->_color, a3);
    objc_storeStrong((id *)&v21->_skinColor, a4);
    v31 = objc_msgSend(v17, "copy");
    avatarUpdater = v21->_avatarUpdater;
    v21->_avatarUpdater = (id)v31;

    v21->_hasDerivedColorDependency = a8;
    v21->_selected = a9;
  }

  return v21;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTAvatarAttributeEditorSectionColorItem;
  -[AVTAvatarAttributeEditorSectionColorItem description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTAvatarAttributeEditorSectionColorItem localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" color name: %@"), v5);

  if (-[AVTAvatarAttributeEditorSectionColorItem isSelected](self, "isSelected"))
    objc_msgSend(v4, "appendString:", CFSTR(" SELECTED"));
  v6 = (void *)objc_msgSend(v4, "copy");

  return (NSString *)v6;
}

- (id)colorPreset
{
  void *v2;
  void *v3;

  -[AVTAvatarAttributeEditorSectionColorItem color](self, "color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseColorPreset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)avatarUpdater
{
  return self->_avatarUpdater;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (AVTCoreModelColor)color
{
  return self->_color;
}

- (id)layerContentProvider
{
  return self->_layerContentProvider;
}

- (id)gradientProvider
{
  return self->_gradientProvider;
}

- (AVTColorPreset)skinColor
{
  return self->_skinColor;
}

- (BOOL)hasDerivedColorDependency
{
  return self->_hasDerivedColorDependency;
}

- (void)setHasDerivedColorDependency:(BOOL)a3
{
  self->_hasDerivedColorDependency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skinColor, 0);
  objc_storeStrong(&self->_gradientProvider, 0);
  objc_storeStrong(&self->_layerContentProvider, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong(&self->_avatarUpdater, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
