@implementation AXSettingsVoiceResourceFootprintSpecifierData

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXSettingsVoiceResourceFootprintSpecifierData name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsVoiceResourceFootprintSpecifierData dialect](self, "dialect");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specificLanguageID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSettingsVoiceResourceFootprintSpecifierData resources](self, "resources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXSettingsVoiceResourceFootprintSpecifierData<%p> name:%@ dialect:%@ resources:%ld"), self, v4, v6, objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)showListItemStyle
{
  return self->_showListItemStyle;
}

- (void)setShowListItemStyle:(BOOL)a3
{
  self->_showListItemStyle = a3;
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (AXDialectMap)dialect
{
  return self->_dialect;
}

- (void)setDialect:(id)a3
{
  objc_storeStrong((id *)&self->_dialect, a3);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialect, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
