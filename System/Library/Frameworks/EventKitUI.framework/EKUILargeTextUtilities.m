@implementation EKUILargeTextUtilities

+ (double)contentSizeCategoryScaledValueForDefaultValue:(double)a3 maximumValue:(double)a4 shouldScaleForSmallerSizes:(BOOL)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  double result;

  v6 = (void *)__fontForScaling;
  if (!__fontForScaling)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)__fontForScaling;
    __fontForScaling = v7;

    v6 = (void *)__fontForScaling;
  }
  objc_msgSend(v6, "_scaledValueForValue:", a3);
  CUIKRoundToScreenScale();
  return result;
}

+ (void)clearCache
{
  void *v2;

  v2 = (void *)__fontForScaling;
  __fontForScaling = 0;

}

+ (double)contentSizeCategoryScaledValueForDefaultValue:(double)a3 shouldScaleForSmallerSizes:(BOOL)a4
{
  double result;

  objc_msgSend(a1, "contentSizeCategoryScaledValueForDefaultValue:maximumValue:shouldScaleForSmallerSizes:", a4, a3, 1.79769313e308);
  return result;
}

+ (double)contentSizeCategoryScaledValueForLargestNonAccessibilityValue:(double)a3 maximumValue:(double)a4
{
  double result;

  objc_msgSend(a1, "contentSizeCategoryScaledValueFromContentSizeCategory:correspondingValue:maximumValue:", *MEMORY[0x1E0DC48F0], a3, a4);
  return result;
}

+ (double)contentSizeCategoryScaledValueForLargestValue:(double)a3
{
  double result;

  objc_msgSend(a1, "contentSizeCategoryScaledValueFromContentSizeCategory:correspondingValue:maximumValue:", *MEMORY[0x1E0DC48B8], a3, 1.79769313e308);
  return result;
}

+ (double)contentSizeCategoryScaledValueFromContentSizeCategory:(id)a3 correspondingValue:(double)a4 maximumValue:(double)a5
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v5 = (void *)MEMORY[0x1E0DC1350];
  v6 = *MEMORY[0x1E0DC4A88];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredFontForTextStyle:compatibleWithTraitCollection:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_bodyLeading");
  objc_msgSend(v8, "_bodyLeading");

  CUIKRoundToScreenScale();
  v11 = v10;

  return v11;
}

@end
