@implementation UIColor(PKUtilities)

+ (uint64_t)pk_paletteButtonBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
}

+ (uint64_t)pk_paletteBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)pk_buttonImageColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (id)pk_paletteStrokeColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  PencilKitBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("paletteStrokeColor"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)pk_paletteShadowColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
}

+ (uint64_t)pk_opacityTitleLabel
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)pk_opacityValueLabel
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
}

+ (uint64_t)pk_selectedPickerButtonBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)pk_selectedPickerButtonMaskColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)pk_thicknessButtonLightGray
{
  return objc_msgSend(a1, "pk_thicknessButtonLightGrayUseSystemColor:", 1);
}

+ (id)pk_thicknessButtonLightGrayUseSystemColor:()PKUtilities
{
  if ((a3 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)pk_thicknessButtonBlack
{
  return objc_msgSend(a1, "pk_thicknessButtonBlackUseSystemColor:", 1);
}

+ (id)pk_thicknessButtonBlackUseSystemColor:()PKUtilities
{
  if ((a3 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemLightMidGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)pk_thicknessButtonWhite
{
  return objc_msgSend(a1, "pk_thicknessButtonWhiteUseSystemColor:", 1);
}

+ (id)pk_thicknessButtonWhiteUseSystemColor:()PKUtilities
{
  if ((a3 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)pk_thicknessButtonBackgroundUseSystemColor:()PKUtilities
{
  if ((a3 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)pk_crosshairViewBorderColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)pk_crosshairViewShadowColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)pk_toolDockMaskColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

+ (uint64_t)pk_toolTintColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (uint64_t)pk_separatorLineColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
}

+ (uint64_t)pk_doneButtonTitleColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
}

+ (id)pk_doneButtonBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  PencilKitBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("doneButtonBackgroundColor"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)pk_toolSampleViewBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3658];
  PencilKitBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("toolSampleViewBackgroundColor"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)pk_removeActiveToolButtonColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (uint64_t)pk_linedPaperLineColor_dark
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.23, 1.0);
}

+ (uint64_t)pk_linedPaperLineColor_light
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
}

+ (uint64_t)pk_textInputDeletionPreviewColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.2);
}

+ (uint64_t)pk_textInputReserveSpaceColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 0.2);
}

+ (uint64_t)pk_convertColorPickerColor:()PKUtilities fromUserInterfaceStyle:to:
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "_convertColorPickerColor:fromUserInterfaceStyle:to:");
}

+ (uint64_t)pk_randomColor
{
  double v0;
  double v1;

  v0 = (double)arc4random_uniform(0xFFu) / 255.0;
  v1 = (double)arc4random_uniform(0xFFu) / 255.0;
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v0, v1, (double)arc4random_uniform(0xFFu) / 255.0, 1.0);
}

@end
