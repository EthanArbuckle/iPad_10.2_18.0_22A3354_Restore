@implementation CNFRegModernTransparentDarkAppearanceController

- (int64_t)keyboardAppearance
{
  return 1;
}

- (BOOL)styleUsesCustomTableStyle
{
  return 1;
}

- (id)customBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)customBackgroundColor_color;
  if (!customBackgroundColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)customBackgroundColor_color;
    customBackgroundColor_color = v3;

    v2 = (void *)customBackgroundColor_color;
  }
  return v2;
}

- (id)userInteractionColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
}

- (id)tableBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableBackgroundColor_color;
  if (!tableBackgroundColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableBackgroundColor_color;
    tableBackgroundColor_color = v3;

    v2 = (void *)tableBackgroundColor_color;
  }
  return v2;
}

- (id)tableCellCheckmarkImageDisabled
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
  if (!tableCellCheckmarkImageDisabled_sTintedImage)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_flatImageWithColor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
    tableCellCheckmarkImageDisabled_sTintedImage = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage;
  }
  return v2;
}

- (id)tableCellEditableTextFieldClearButton
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEBD640];
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("UITextFieldClearButton-white"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tableCellEditableTextFieldClearButtonPressed
{
  return 0;
}

- (id)tableCellTextLabelBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableCellTextLabelBackgroundColor_color;
  if (!tableCellTextLabelBackgroundColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableCellTextLabelBackgroundColor_color;
    tableCellTextLabelBackgroundColor_color = v3;

    v2 = (void *)tableCellTextLabelBackgroundColor_color;
  }
  return v2;
}

- (id)tableCellBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.200000003);
}

- (id)tableCellTextLabelColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableCellTextLabelColor_color;
  if (!tableCellTextLabelColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableCellTextLabelColor_color;
    tableCellTextLabelColor_color = v3;

    v2 = (void *)tableCellTextLabelColor_color;
  }
  return v2;
}

- (id)tableCellDetailLabelColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableCellDetailLabelColor_color;
  if (!tableCellDetailLabelColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableCellDetailLabelColor_color;
    tableCellDetailLabelColor_color = v3;

    v2 = (void *)tableCellDetailLabelColor_color;
  }
  return v2;
}

- (id)tableCellDetailLabelBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableCellDetailLabelBackgroundColor_color;
  if (!tableCellDetailLabelBackgroundColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableCellDetailLabelBackgroundColor_color;
    tableCellDetailLabelBackgroundColor_color = v3;

    v2 = (void *)tableCellDetailLabelBackgroundColor_color;
  }
  return v2;
}

- (int64_t)tableSeparatorStyle
{
  return 1;
}

- (id)tableSeparatorColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5);
}

- (id)tableHeaderTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableHeaderTextColor_color;
  if (!tableHeaderTextColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableHeaderTextColor_color;
    tableHeaderTextColor_color = v3;

    v2 = (void *)tableHeaderTextColor_color;
  }
  return v2;
}

- (id)tableFooterTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableFooterTextColor_color;
  if (!tableFooterTextColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableFooterTextColor_color;
    tableFooterTextColor_color = v3;

    v2 = (void *)tableFooterTextColor_color;
  }
  return v2;
}

- (BOOL)splashScreenShowsIcon
{
  return 0;
}

- (id)splashTitleLabelTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashTitleLabelTextColor_color;
  if (!splashTitleLabelTextColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashTitleLabelTextColor_color;
    splashTitleLabelTextColor_color = v3;

    v2 = (void *)splashTitleLabelTextColor_color;
  }
  return v2;
}

- (id)splashEntryFieldTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashEntryFieldTextColor_color;
  if (!splashEntryFieldTextColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashEntryFieldTextColor_color;
    splashEntryFieldTextColor_color = v3;

    v2 = (void *)splashEntryFieldTextColor_color;
  }
  return v2;
}

- (id)splashEntryPlaceholderTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashEntryPlaceholderTextColor_color;
  if (!splashEntryPlaceholderTextColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.588235319, 0.588235319, 0.588235319, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashEntryPlaceholderTextColor_color;
    splashEntryPlaceholderTextColor_color = v3;

    v2 = (void *)splashEntryPlaceholderTextColor_color;
  }
  return v2;
}

- (id)splashEntryFieldLabelTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashEntryFieldLabelTextColor_color;
  if (!splashEntryFieldLabelTextColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashEntryFieldLabelTextColor_color;
    splashEntryFieldLabelTextColor_color = v3;

    v2 = (void *)splashEntryFieldLabelTextColor_color;
  }
  return v2;
}

- (id)splashSignInFieldsBorderColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashSignInFieldsBorderColor_color;
  if (!splashSignInFieldsBorderColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashSignInFieldsBorderColor_color;
    splashSignInFieldsBorderColor_color = v3;

    v2 = (void *)splashSignInFieldsBorderColor_color;
  }
  return v2;
}

- (id)splashSignInFieldsBackgroundColor
{
  return 0;
}

- (int64_t)splashSignInProgressIndicatorColor
{
  return 1;
}

- (int64_t)modalPresentationStyle
{
  return 3;
}

- (int64_t)navigationBarActivityIndicatorStyle
{
  return 1;
}

- (id)navigationBarTintColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)navigationBarTintColor_color;
  if (!navigationBarTintColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)navigationBarTintColor_color;
    navigationBarTintColor_color = v3;

    v2 = (void *)navigationBarTintColor_color;
  }
  return v2;
}

- (BOOL)navigationBarTranslucent
{
  return 1;
}

- (id)navigationBarBackgroundImage
{
  return objc_alloc_init(MEMORY[0x24BEBD640]);
}

- (int64_t)navigationBarStyle
{
  return 1;
}

@end
