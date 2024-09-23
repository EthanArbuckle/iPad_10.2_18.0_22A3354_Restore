@implementation AKAuthorizationAppearance

+ (UIFont)titleFont
{
  void *v2;
  int v3;
  _QWORD *v4;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  v4 = (_QWORD *)MEMORY[0x1E0CEB5B0];
  if (v3)
    v4 = (_QWORD *)MEMORY[0x1E0CEB5B8];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *v4, 32770);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIFont)subtitleFont
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB568], 0);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E0CEB5F8]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIFont)smallTitleFont
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB568], 0);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E0CEB5E8]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)smallTitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
}

+ (UIFont)captionFont
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB550], 0);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForSize:weight:", 11.0, *MEMORY[0x1E0CEB5F8]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)captionTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
}

+ (UIFont)messageFont
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB590], 0);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E0CEB5F0]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIFont)bulletInfoLabelTitleFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB568], 0);
}

+ (UIFont)bulletInfoLabelDescriptionFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB558], *MEMORY[0x1E0CEB5F8]);
}

+ (id)clearButtonColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
}

+ (UIFont)scopeTitleFont
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB538], 0x8000);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E0CEB5F0]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)scopeTitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

+ (UIFont)scopeInfoLabelFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForSize:weight:", 13.0, *MEMORY[0x1E0CEB5F0]);
}

+ (UIColor)scopeInfoLabelTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
}

+ (UIColor)scopeRowBackgroundColor
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)paneBackgroundColor
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)paneBlurEffectStyle
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    return 9;
  else
    return 4;
}

+ (UIColor)translucentBackdropColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.800000012);
}

+ (int64_t)tableViewStyle
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    return 2;
  else
    return 1;
}

+ (int64_t)editingDoneButtonStyle
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    return 2;
  else
    return 0;
}

+ (UIColor)scopeImageViewTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

+ (UIColor)scopeImageViewBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
}

+ (UIFont)scopeSelectionTitleFont
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB590], 0);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForSize:weight:", 15.0, *MEMORY[0x1E0CEB5F0]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIFont)scopeSubtitleFont
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB558], 0x8000);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_preferredFontForSize:weight:", 13.0, *MEMORY[0x1E0CEB5F0]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)scopeSubtitleTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
}

+ (UIColor)linkColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "linkColor");
}

+ (UIColor)checkmarkDeselectedTintColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "separatorColor");
}

+ (UIColor)editScopeRowBackgroundColor
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemGroupedBackgroundColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)editScopeInfoLabelTextColor
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIFont)editScopeInfoLabelFont
{
  void *v2;
  int v3;
  uint64_t v4;
  _QWORD *v5;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    v4 = 2;
  else
    v4 = 0;
  v5 = (_QWORD *)MEMORY[0x1E0CEB538];
  if (!v3)
    v5 = (_QWORD *)MEMORY[0x1E0CEB558];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *v5, v4);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)editScopeInputFieldTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
}

+ (UIFont)editScopeInputFieldFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", *MEMORY[0x1E0CEB538], 0);
}

+ (BOOL)shouldShowBlurBackground
{
  return 1;
}

+ (UIColor)continueButtonDefaultColor
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.48, 1.0, 1.0);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)continueButtonDisabledColor
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray3Color");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.75, 0.75, 0.75, 1.0);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)continueButtonHighlightedColor
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.48, 1.0, 0.25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIColor *)v5;
}

+ (UIFont)continueButtonFont
{
  void *v2;
  int v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  v4 = *MEMORY[0x1E0CEB540];
  if (v3)
    objc_msgSend(MEMORY[0x1E0CEA5E8], "ak_dynamicFontWithStyle:traits:", v4, 2);
  else
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", v4, *MEMORY[0x1E0CEB3D0]);
  return (UIFont *)(id)objc_claimAutoreleasedReturnValue();
}

+ (UIColor)continueButtonTextColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
}

+ (id)useDifferentIDButtonTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
}

+ (UIImageSymbolConfiguration)emailSelectionSymbolConfiguration
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLisbonAvailable");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:", 7, 14.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (UIImageSymbolConfiguration *)v4;
}

+ (UIButtonConfiguration)dismissButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "tintedButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  objc_msgSend(v2, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 7, 2, 15.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredSymbolConfigurationForImage:", v4);

  objc_msgSend(v2, "setContentInsets:", 7.0, 8.0, 7.0, 8.0);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseForegroundColor:", v5);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseBackgroundColor:", v6);

  return (UIButtonConfiguration *)v2;
}

+ (UIButtonConfiguration)clearButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CEA3A8], "tintedButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  objc_msgSend(v2, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 7, -1, 10.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredSymbolConfigurationForImage:", v4);

  objc_msgSend(MEMORY[0x1E0D001E8], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLisbonAvailable");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBaseForegroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray2Color");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray5Color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBaseForegroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBaseBackgroundColor:", v9);

  return (UIButtonConfiguration *)v2;
}

+ (UIColor)sharedAccountIconBackgroundColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
}

@end
