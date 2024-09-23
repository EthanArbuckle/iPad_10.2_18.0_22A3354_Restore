@implementation CNFRegModernAppearanceController

- (BOOL)styleUsesCustomTableStyle
{
  return 1;
}

- (id)tableBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableBackgroundColor_color_0;
  if (!tableBackgroundColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableBackgroundColor_color_0;
    tableBackgroundColor_color_0 = v3;

    v2 = (void *)tableBackgroundColor_color_0;
  }
  return v2;
}

- (BOOL)firstNavigationBarHidden
{
  return 1;
}

- (BOOL)navigationBarHidesTitle
{
  return 1;
}

- (BOOL)navigationBarHidesShadow
{
  return 1;
}

- (id)tableCellTextLabelBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableCellTextLabelBackgroundColor_color_0;
  if (!tableCellTextLabelBackgroundColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableCellTextLabelBackgroundColor_color_0;
    tableCellTextLabelBackgroundColor_color_0 = v3;

    v2 = (void *)tableCellTextLabelBackgroundColor_color_0;
  }
  return v2;
}

- (id)tableCellTextLabelColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableCellTextLabelColor_color_0;
  if (!tableCellTextLabelColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableCellTextLabelColor_color_0;
    tableCellTextLabelColor_color_0 = v3;

    v2 = (void *)tableCellTextLabelColor_color_0;
  }
  return v2;
}

- (id)tableCellDetailLabelColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableCellDetailLabelColor_color_0;
  if (!tableCellDetailLabelColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableCellDetailLabelColor_color_0;
    tableCellDetailLabelColor_color_0 = v3;

    v2 = (void *)tableCellDetailLabelColor_color_0;
  }
  return v2;
}

- (id)tableCellDetailLabelBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableCellDetailLabelBackgroundColor_color_0;
  if (!tableCellDetailLabelBackgroundColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableCellDetailLabelBackgroundColor_color_0;
    tableCellDetailLabelBackgroundColor_color_0 = v3;

    v2 = (void *)tableCellDetailLabelBackgroundColor_color_0;
  }
  return v2;
}

- (id)tableHeaderFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "_thinSystemFontOfSize:", 35.0);
}

- (id)tableFooterFont
{
  return (id)objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
}

- (id)tableHeaderTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableHeaderTextColor_color_0;
  if (!tableHeaderTextColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.145098045, 0.145098045, 0.145098045, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableHeaderTextColor_color_0;
    tableHeaderTextColor_color_0 = v3;

    v2 = (void *)tableHeaderTextColor_color_0;
  }
  return v2;
}

- (id)tableFooterTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableFooterTextColor_color_0;
  if (!tableFooterTextColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.145098045, 0.145098045, 0.145098045, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableFooterTextColor_color_0;
    tableFooterTextColor_color_0 = v3;

    v2 = (void *)tableFooterTextColor_color_0;
  }
  return v2;
}

- (int64_t)tableHeaderTextAlignment
{
  return 1;
}

- (int64_t)tableFooterTextAlignment
{
  return 4;
}

- (id)tableCellCheckmarkImage
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)tableCellCheckmarkImage_sTintedImage_0;
  if (!tableCellCheckmarkImage_sTintedImage_0)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegAppearanceController userInteractionColor](self, "userInteractionColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_flatImageWithColor:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)tableCellCheckmarkImage_sTintedImage_0;
    tableCellCheckmarkImage_sTintedImage_0 = v6;

    v3 = (void *)tableCellCheckmarkImage_sTintedImage_0;
  }
  return v3;
}

- (id)tableCellCheckmarkImageDisabled
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_1;
  if (!tableCellCheckmarkImageDisabled_sTintedImage_1)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.698039216, 0.698039216, 0.698039216, 1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_flatImageWithColor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_1;
    tableCellCheckmarkImageDisabled_sTintedImage_1 = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_1;
  }
  return v2;
}

- (int64_t)modalPresentationStyle
{
  return 2 * (UserInterfaceIdiom() != 1);
}

- (id)webViewBackgroundView
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F0]), "initWithFrame:style:", 1, 0.0, 0.0, 1.0, 1.0);
  objc_msgSend(v2, "setAutoresizingMask:", 18);
  return v2;
}

- (id)webViewBackgroundColor
{
  return 0;
}

- (BOOL)webViewIsOpaque
{
  return 0;
}

- (BOOL)webViewDrawsShadows
{
  return 0;
}

@end
