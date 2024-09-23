@implementation CNFRegModernTransparentLightAppearanceController

- (id)tableBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)tableBackgroundColor_color_1;
  if (!tableBackgroundColor_color_1)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)tableBackgroundColor_color_1;
    tableBackgroundColor_color_1 = v3;

    v2 = (void *)tableBackgroundColor_color_1;
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

  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_2;
  if (!tableCellCheckmarkImageDisabled_sTintedImage_2)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_flatImageWithColor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_2;
    tableCellCheckmarkImageDisabled_sTintedImage_2 = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_2;
  }
  return v2;
}

- (BOOL)splashScreenShowsIcon
{
  return 0;
}

- (id)splashEntryFieldTextColor
{
  return 0;
}

- (id)splashEntryPlaceholderTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashEntryPlaceholderTextColor_color_0;
  if (!splashEntryPlaceholderTextColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.266666681, 0.266666681, 0.266666681, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashEntryPlaceholderTextColor_color_0;
    splashEntryPlaceholderTextColor_color_0 = v3;

    v2 = (void *)splashEntryPlaceholderTextColor_color_0;
  }
  return v2;
}

- (id)splashEntryFieldLabelTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashEntryFieldLabelTextColor_color_0;
  if (!splashEntryFieldLabelTextColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.00392156886, 0.00392156886, 0.00392156886, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashEntryFieldLabelTextColor_color_0;
    splashEntryFieldLabelTextColor_color_0 = v3;

    v2 = (void *)splashEntryFieldLabelTextColor_color_0;
  }
  return v2;
}

- (id)splashSignInFieldsBorderColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashSignInFieldsBorderColor_color_1;
  if (!splashSignInFieldsBorderColor_color_1)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.00392156886, 0.00392156886, 0.00392156886, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashSignInFieldsBorderColor_color_1;
    splashSignInFieldsBorderColor_color_1 = v3;

    v2 = (void *)splashSignInFieldsBorderColor_color_1;
  }
  return v2;
}

- (id)splashSignInFieldsBackgroundColor
{
  return 0;
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

  v2 = (void *)navigationBarTintColor_color_0;
  if (!navigationBarTintColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)navigationBarTintColor_color_0;
    navigationBarTintColor_color_0 = v3;

    v2 = (void *)navigationBarTintColor_color_0;
  }
  return v2;
}

@end
