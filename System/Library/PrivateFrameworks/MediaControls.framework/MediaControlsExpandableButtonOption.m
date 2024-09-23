@implementation MediaControlsExpandableButtonOption

- (MediaControlsExpandableButtonOption)init
{
  MediaControlsExpandableButtonOption *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsExpandableButtonOption;
  result = -[MediaControlsExpandableButtonOption init](&v3, sel_init);
  if (result)
    result->_enabled = 1;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MediaControlsExpandableButtonOption identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifer: %@ | asset: %@ | title: %@ | state: %@>"), v4, self, v5, self->_asset, self->_title, self->_selectedState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong(&self->_identifier, a3);
}

- (MRUAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)selectedState
{
  return self->_selectedState;
}

- (void)setSelectedState:(id)a3
{
  objc_storeStrong((id *)&self->_selectedState, a3);
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (void)setSelectedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBackgroundColor, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int64_t)selectedBackground
{
  return self->_selectedBackground;
}

- (void)setSelectedBackground:(int64_t)a3
{
  self->_selectedBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedState, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->_identifier, 0);
}

@end
