@implementation MUGroupedActionsRowViewConfiguration

- (MUGroupedActionsRowViewConfiguration)initWithStyle:(int64_t)a3 useVibrancy:(BOOL)a4
{
  MUGroupedActionsRowViewConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MUGroupedActionsRowViewConfiguration;
  result = -[MUGroupedActionsRowViewConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_style = a3;
    result->_useVibrancy = a4;
  }
  return result;
}

+ (id)defaultConfiguration
{
  unsigned int IsMacCatalyst;
  MUGroupedActionsRowViewConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  v3 = -[MUGroupedActionsRowViewConfiguration initWithStyle:useVibrancy:]([MUGroupedActionsRowViewConfiguration alloc], "initWithStyle:useVibrancy:", IsMacCatalyst, IsMacCatalyst ^ 1);
  if (MapKitIdiomIsMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUGroupedActionsRowViewConfiguration setTintColor:](v3, "setTintColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUGroupedActionsRowViewConfiguration setItemBackgroundColor:](v3, "setItemBackgroundColor:", v5);
  }
  else
  {
    +[MUInfoCardStyle actionRowTintColor](MUInfoCardStyle, "actionRowTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUGroupedActionsRowViewConfiguration setTintColor:](v3, "setTintColor:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUGroupedActionsRowViewConfiguration setItemBackgroundColor:](v3, "setItemBackgroundColor:", v7);

    +[MUInfoCardStyle rowSelectedColor](MUInfoCardStyle, "rowSelectedColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUGroupedActionsRowViewConfiguration setItemHighlightColor:](v3, "setItemHighlightColor:", v5);
  }

  return v3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (void)setUseVibrancy:(BOOL)a3
{
  self->_useVibrancy = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIColor)itemBackgroundColor
{
  return self->_itemBackgroundColor;
}

- (void)setItemBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_itemBackgroundColor, a3);
}

- (UIColor)itemHighlightColor
{
  return self->_itemHighlightColor;
}

- (void)setItemHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_itemHighlightColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemHighlightColor, 0);
  objc_storeStrong((id *)&self->_itemBackgroundColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
