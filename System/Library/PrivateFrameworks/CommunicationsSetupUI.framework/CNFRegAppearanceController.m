@implementation CNFRegAppearanceController

- (int64_t)keyboardAppearance
{
  return 0;
}

- (BOOL)styleUsesCustomTableStyle
{
  return 0;
}

- (BOOL)styleUsesCustomAccessoryView
{
  return 0;
}

- (BOOL)styleUsesCustomSeparatorStyle
{
  return 0;
}

- (BOOL)styleUsesCustomSearchResultsStyle
{
  return 0;
}

- (UIColor)customBackgroundColor
{
  return 0;
}

- (UIColor)userInteractionColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)userInteractionColor_color;
  if (!userInteractionColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0784313753, 0.435294122, 0.874509811, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)userInteractionColor_color;
    userInteractionColor_color = v3;

    v2 = (void *)userInteractionColor_color;
  }
  return (UIColor *)v2;
}

- (UIColor)tableBackgroundColor
{
  return 0;
}

- (int64_t)tableSeparatorStyle
{
  return 1;
}

- (UIColor)tableSeparatorColor
{
  return 0;
}

- (UIColor)tableSeparatorTopShadowColor
{
  return 0;
}

- (UIColor)tableSeparatorBottomShadowColor
{
  return 0;
}

- (UIColor)tableCellBackgroundColor
{
  return 0;
}

- (UIColor)tableCellTextLabelColor
{
  return 0;
}

- (UIColor)tableCellTextLabelBackgroundColor
{
  return 0;
}

- (UIColor)tableCellDetailLabelColor
{
  return 0;
}

- (UIColor)tableCellDetailLabelBackgroundColor
{
  return 0;
}

- (UIImage)tableCellButtonImage
{
  return 0;
}

- (UIImage)tableCellButtonImageSelected
{
  return 0;
}

- (UIColor)tableCellEditableTextColor
{
  return 0;
}

- (UIColor)tableCellEditableTextPlaceholderColor
{
  return 0;
}

- (UIColor)tableSectionBorderColor
{
  return 0;
}

- (UIImage)tableSectionShadowImage
{
  return 0;
}

- (UIColor)tableCellEditableInsertionPointColor
{
  return 0;
}

- (UIImage)tableCellEditableTextFieldClearButton
{
  return 0;
}

- (UIImage)tableCellEditableTextFieldClearButtonPressed
{
  return 0;
}

- (UIView)tableCellCustomAccessoryViewDisclosureIndicator
{
  return 0;
}

- (UIImage)tableCellCheckmarkImage
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)tableCellCheckmarkImage_sTintedImage;
  if (!tableCellCheckmarkImage_sTintedImage)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_flatImageWithColor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tableCellCheckmarkImage_sTintedImage;
    tableCellCheckmarkImage_sTintedImage = v5;

    v2 = (void *)tableCellCheckmarkImage_sTintedImage;
  }
  return (UIImage *)v2;
}

- (UIImage)tableCellCheckmarkImageSelected
{
  return (UIImage *)objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesWhiteCheck.png"));
}

- (UIImage)tableCellCheckmarkImageDisabled
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_0;
  if (!tableCellCheckmarkImageDisabled_sTintedImage_0)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "kitImageNamed:", CFSTR("UIPreferencesBlueCheck.png"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "_tertiaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_flatImageWithColor:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_0;
    tableCellCheckmarkImageDisabled_sTintedImage_0 = v5;

    v2 = (void *)tableCellCheckmarkImageDisabled_sTintedImage_0;
  }
  return (UIImage *)v2;
}

- (UIColor)tableHeaderTextShadowColor
{
  return 0;
}

- (CGSize)tableHeaderTextShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)tableHeaderTextAlignment
{
  return 4;
}

- (int64_t)tableFooterTextAlignment
{
  return 4;
}

- (int64_t)searchResultsTableSeparatorStyle
{
  return 1;
}

- (UIColor)searchResultsTableSeparatorColor
{
  return 0;
}

- (UIColor)searchResultsTableSeparatorTopShadowColor
{
  return 0;
}

- (UIColor)searchResultsTableSeparatorBottomShadowColor
{
  return 0;
}

- (int64_t)modalPresentationStyle
{
  return 0;
}

- (UIView)webViewBackgroundView
{
  return 0;
}

- (UIColor)webViewBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
}

- (BOOL)webViewIsOpaque
{
  return 1;
}

- (BOOL)webViewDrawsShadows
{
  return 1;
}

- (BOOL)splashScreenShowsIcon
{
  return 1;
}

- (UIColor)splashTitleLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDynamicProvider:", &__block_literal_global_0);
}

id __55__CNFRegAppearanceController_splashTitleLabelTextColor__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_msgSend(a2, "userInterfaceStyle");
  if ((unint64_t)v2 < 2)
  {
    v3 = (void *)MEMORY[0x24BEBD4B8];
    v4 = 0.145098039;
LABEL_5:
    objc_msgSend(v3, "colorWithRed:green:blue:alpha:", v4, v4, v4, 1.0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (v2 == (void *)2)
  {
    v3 = (void *)MEMORY[0x24BEBD4B8];
    v4 = 0.854901961;
    goto LABEL_5;
  }
  return v2;
}

- (UIColor)splashEntryFieldTextColor
{
  return 0;
}

- (UIColor)splashEntryPlaceholderTextColor
{
  return 0;
}

- (UIColor)splashEntryFieldLabelTextColor
{
  return 0;
}

- (UIColor)splashSignInFieldsBorderColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashSignInFieldsBorderColor_color_0;
  if (!splashSignInFieldsBorderColor_color_0)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.298039228);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashSignInFieldsBorderColor_color_0;
    splashSignInFieldsBorderColor_color_0 = v3;

    v2 = (void *)splashSignInFieldsBorderColor_color_0;
  }
  return (UIColor *)v2;
}

- (UIColor)splashSignInFieldsBackgroundColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)splashSignInFieldsBackgroundColor_color;
  if (!splashSignInFieldsBackgroundColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)splashSignInFieldsBackgroundColor_color;
    splashSignInFieldsBackgroundColor_color = v3;

    v2 = (void *)splashSignInFieldsBackgroundColor_color;
  }
  return (UIColor *)v2;
}

- (int64_t)splashSignInProgressIndicatorColor
{
  return 2;
}

- (int64_t)navigationBarStyle
{
  return 0;
}

- (BOOL)navigationBarIsTranslucent
{
  return 0;
}

- (int64_t)navigationBarActivityIndicatorStyle
{
  return 2;
}

- (BOOL)firstNavigationBarHidden
{
  return 0;
}

- (BOOL)navigationBarHidesTitle
{
  return 0;
}

- (BOOL)navigationBarHidesShadow
{
  return 0;
}

- (UIColor)navigationBarTintColor
{
  return 0;
}

- (BOOL)navigationBarTranslucent
{
  return 1;
}

- (UIImage)navigationBarBackgroundImage
{
  return 0;
}

- (UIColor)learnMoreTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)learnMoreTextColor_color;
  if (!learnMoreTextColor_color)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.298039228, 0.337254912, 0.423529416, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)learnMoreTextColor_color;
    learnMoreTextColor_color = v3;

    v2 = (void *)learnMoreTextColor_color;
  }
  return (UIColor *)v2;
}

- (UIColor)learnMoreShadowColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
}

- (UIImage)learnMoreArrowImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BEBD640];
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("arrowbutton-default"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (BOOL)learnMoreButtonDrawsUnderline
{
  return 1;
}

- (BOOL)actionSheetsUsePopoverStyle
{
  return 0;
}

+ (id)globalAppearanceController
{
  return (id)objc_msgSend(a1, "appearanceControllerForStyle:", CNFRegGlobalAppearanceStyle());
}

+ (id)appearanceControllerForStyle:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 1:
      objc_msgSend(a1, "stripedAppearanceController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "gradientAppearanceController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
    case 6:
      objc_msgSend(a1, "modernTransparentDarkAppearanceController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(a1, "modernAppearanceController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(a1, "modernTransparentLightAppearanceController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(a1, "defaultAppearanceController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

+ (id)stripedAppearanceController
{
  void *v2;
  CNFRegStripedAppearanceController *v3;
  void *v4;

  v2 = (void *)stripedAppearanceController_controller;
  if (!stripedAppearanceController_controller)
  {
    v3 = objc_alloc_init(CNFRegStripedAppearanceController);
    v4 = (void *)stripedAppearanceController_controller;
    stripedAppearanceController_controller = (uint64_t)v3;

    v2 = (void *)stripedAppearanceController_controller;
  }
  return v2;
}

+ (id)gradientAppearanceController
{
  void *v2;
  CNFRegGradientAppearanceController *v3;
  void *v4;

  v2 = (void *)gradientAppearanceController_controller;
  if (!gradientAppearanceController_controller)
  {
    v3 = objc_alloc_init(CNFRegGradientAppearanceController);
    v4 = (void *)gradientAppearanceController_controller;
    gradientAppearanceController_controller = (uint64_t)v3;

    v2 = (void *)gradientAppearanceController_controller;
  }
  return v2;
}

+ (id)modernAppearanceController
{
  void *v2;
  CNFRegModernAppearanceController *v3;
  void *v4;

  v2 = (void *)modernAppearanceController_controller;
  if (!modernAppearanceController_controller)
  {
    v3 = objc_alloc_init(CNFRegModernAppearanceController);
    v4 = (void *)modernAppearanceController_controller;
    modernAppearanceController_controller = (uint64_t)v3;

    v2 = (void *)modernAppearanceController_controller;
  }
  return v2;
}

+ (id)modernTransparentLightAppearanceController
{
  void *v2;
  CNFRegModernTransparentLightAppearanceController *v3;
  void *v4;

  v2 = (void *)modernTransparentLightAppearanceController_controller;
  if (!modernTransparentLightAppearanceController_controller)
  {
    v3 = objc_alloc_init(CNFRegModernTransparentLightAppearanceController);
    v4 = (void *)modernTransparentLightAppearanceController_controller;
    modernTransparentLightAppearanceController_controller = (uint64_t)v3;

    v2 = (void *)modernTransparentLightAppearanceController_controller;
  }
  return v2;
}

+ (id)modernTransparentDarkAppearanceController
{
  void *v2;
  CNFRegModernTransparentDarkAppearanceController *v3;
  void *v4;

  v2 = (void *)modernTransparentDarkAppearanceController_controller;
  if (!modernTransparentDarkAppearanceController_controller)
  {
    v3 = objc_alloc_init(CNFRegModernTransparentDarkAppearanceController);
    v4 = (void *)modernTransparentDarkAppearanceController_controller;
    modernTransparentDarkAppearanceController_controller = (uint64_t)v3;

    v2 = (void *)modernTransparentDarkAppearanceController_controller;
  }
  return v2;
}

@end
