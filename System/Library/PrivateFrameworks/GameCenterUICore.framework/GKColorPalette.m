@implementation GKColorPalette

+ (id)sharedPalette
{
  if (sharedPalette_onceToken != -1)
    dispatch_once(&sharedPalette_onceToken, &__block_literal_global_3);
  return (id)sharedPalette_standardColors;
}

void __31__GKColorPalette_sharedPalette__block_invoke()
{
  __objc2_class **v0;
  id v1;
  void *v2;

  if (*MEMORY[0x24BE3A2C0])
    v0 = off_24DC26A80;
  else
    v0 = &off_24DC26A18;
  v1 = objc_alloc_init(*v0);
  v2 = (void *)sharedPalette_standardColors;
  sharedPalette_standardColors = (uint64_t)v1;

}

+ (id)paletteFromImage:(id)a3
{
  id v3;
  GKImageColorPalette *v4;

  v3 = a3;
  v4 = -[GKImageColorPalette initWithImage:]([GKImageColorPalette alloc], "initWithImage:", v3);

  return v4;
}

- (int64_t)windowBackgroundBlurStyle
{
  return 0;
}

- (UIColor)primaryTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

- (UIColor)standardTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

- (UIColor)disabledTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "tertiaryLabelColor");
}

- (UIColor)selectedTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

- (UIColor)emphasizedTextOnDarkBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
}

- (UIColor)emphasizedTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
}

- (UIColor)systemInteractionColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

- (UIColor)windowBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
}

- (UIColor)viewBackgroundColor
{
  return 0;
}

- (UIColor)opaqueViewBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "secondarySystemGroupedBackgroundColor");
}

- (UIColor)floatingHeaderViewBackgroundColor
{
  return 0;
}

- (UIColor)pinnedHeaderViewBackgroundColor
{
  return 0;
}

- (UIColor)activityIndicatorColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

- (UIColor)removeItemTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
}

- (UIColor)selectedCellBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (UIColor)separatorLineColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "separatorColor");
}

- (UIColor)friendTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", 0.55, 0.8, 1.0, 0.85);
}

- (UIColor)localPlayerTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", 0.68, 0.75, 0.78, 1.0);
}

- (UIColor)friendRequestTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", 0.14, 1.0, 1.0, 0.95);
}

- (UIColor)challengesTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.0, 0.8, 1.0);
}

- (UIColor)cellActionDestructiveColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
}

- (UIColor)cellActionColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
}

@end
