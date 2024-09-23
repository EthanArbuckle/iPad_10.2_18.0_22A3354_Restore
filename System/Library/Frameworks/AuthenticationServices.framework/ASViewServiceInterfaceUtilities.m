@implementation ASViewServiceInterfaceUtilities

+ (CGColor)iconBorderColor
{
  id v2;
  CGColor *v3;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray2Color");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (CGColor *)objc_msgSend(v2, "CGColor");

  return v3;
}

+ (double)iconBorderWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = 1.0 / v3;

  return v4;
}

+ (int64_t)tableViewStyle
{
  return 2;
}

+ (double)tableViewRowHeight
{
  return 60.0;
}

+ (UIBlurEffect)paneBackgroundBlurEffect
{
  return (UIBlurEffect *)objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 9);
}

+ (double)navigationBarHeight
{
  return 56.0;
}

+ (UIFont)headerTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
}

+ (UIColor)headerTitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (UIColor)headerMessageColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
}

+ (CGSize)headerIconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 54.0;
  v3 = 54.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)headerIconCornerRadius
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ASViewServiceInterfaceUtilities_headerIconCornerRadius__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (headerIconCornerRadius_onceToken != -1)
    dispatch_once(&headerIconCornerRadius_onceToken, block);
  return *(double *)&headerIconCornerRadius_cornerRadius;
}

uint64_t __57__ASViewServiceInterfaceUtilities_headerIconCornerRadius__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "_iconCornerRadiusForSize:", 54.0, 54.0);
  headerIconCornerRadius_cornerRadius = v2;
  return result;
}

+ (UIFont)cellTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
}

+ (UIColor)cellTitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (UIFont)cellSubtitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
}

+ (UIColor)cellSubtitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
}

+ (CGSize)cellIconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 36.0;
  v3 = 36.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (UIColor)cellIconTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (UIBackgroundConfiguration)cellBackgroundConfiguration
{
  return (UIBackgroundConfiguration *)objc_msgSend(MEMORY[0x24BEBD408], "listGroupedCellConfiguration");
}

+ (double)cellIconCornerRadius
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ASViewServiceInterfaceUtilities_cellIconCornerRadius__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cellIconCornerRadius_onceToken != -1)
    dispatch_once(&cellIconCornerRadius_onceToken, block);
  return *(double *)&cellIconCornerRadius_cornerRadius;
}

uint64_t __55__ASViewServiceInterfaceUtilities_cellIconCornerRadius__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(*(id *)(a1 + 32), "_iconCornerRadiusForSize:", 36.0, 36.0);
  cellIconCornerRadius_cornerRadius = v2;
  return result;
}

+ (double)cellIconMarginLeading
{
  return 18.0;
}

+ (double)cellIconMarginTrailing
{
  return 16.0;
}

+ (UIColor)cellIconBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemGroupedBackgroundColor");
}

+ (UIImageSymbolConfiguration)cellIconDefaultSymbolConfiguration
{
  return (UIImageSymbolConfiguration *)objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 17.0);
}

+ (UIImageSymbolConfiguration)cellIconPasskeySymbolConfiguration
{
  return (UIImageSymbolConfiguration *)objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 20.0);
}

+ (UIColor)continueButtonBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolvedColorWithTraitCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

+ (UIColor)continueButtonDisabledBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
}

+ (UIColor)continueButtonHighlightedBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "continueButtonBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

+ (UIFont)continueButtonTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:variant:", *MEMORY[0x24BEBE1D8], 1024);
}

+ (UIColor)continueButtonTitleColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
}

+ (double)continueButtonTitleMargin
{
  return 27.0;
}

+ (double)continueButtonCornerRadius
{
  return 10.0;
}

+ (double)continueButtonHeight
{
  return 44.0;
}

+ (double)otherAccountsCellSizeFactor
{
  return 0.8;
}

+ (CGSize)otherAccountsCellIconSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(a1, "cellIconSize");
  v4 = v3;
  objc_msgSend(a1, "otherAccountsCellSizeFactor");
  v6 = v4 * v5;
  objc_msgSend(a1, "cellIconSize");
  v8 = v7;
  objc_msgSend(a1, "otherAccountsCellSizeFactor");
  v10 = v8 * v9;
  v11 = v6;
  result.height = v10;
  result.width = v11;
  return result;
}

+ (double)_iconCornerRadiusForSize:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", a3.width, a3.height, 1.0);
  objc_msgSend(v3, "setShape:", 1);
  objc_msgSend(v3, "continuousCornerRadius");
  v5 = v4;

  return v5;
}

@end
