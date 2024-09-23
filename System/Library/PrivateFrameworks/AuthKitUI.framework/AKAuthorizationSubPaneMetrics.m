@implementation AKAuthorizationSubPaneMetrics

+ (double)bulletImageSize
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 44.0;
  else
    v3 = 36.0;

  return v3;
}

+ (double)bulletImagePixelAdjustmentOffset
{
  return 4.0;
}

+ (double)bulletLeadingSpacing
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 64.0;
  else
    v3 = 42.0;

  return v3;
}

+ (double)bulletTrailingSpacing
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = -64.0;
  else
    v3 = -36.0;

  return v3;
}

+ (double)bulletImageToInfoLabelSpacing
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 16.0;
  else
    v3 = 26.0;

  return v3;
}

+ (double)bulletInfoTitleToDescriptionVerticalSpacing
{
  return 4.0;
}

+ (double)infoLabelMarginInset
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 50.0;
  else
    v3 = 32.0;

  return v3;
}

+ (double)infoLabelMessageFontSize
{
  return 15.0;
}

+ (double)scopeImageViewSize
{
  return 36.0;
}

+ (double)scopeImageViewTopSpacing
{
  return 12.0;
}

+ (double)scopeRowCornerRadius
{
  return 10.0;
}

+ (double)scopeImageViewCornerRadius
{
  return 6.0;
}

+ (double)scopeImageViewLeadingSpacing
{
  return 18.0;
}

+ (double)scopeTitleLabelLeadingSpacing
{
  return 16.0;
}

+ (double)separatorInset
{
  return 70.0;
}

+ (double)checkmarkToLabelSpacing
{
  return 8.0;
}

+ (double)accessoryViewSize
{
  return 20.0;
}

+ (double)editInfoLabelToInputFieldSpacing
{
  return 14.0;
}

+ (double)privacyLinkMarginInset
{
  void *v2;
  double v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 76.0;
  else
    v3 = 42.0;

  return v3;
}

+ (double)sharedAccountIconSize
{
  return 22.0;
}

+ (double)sharedAccountIconPadding
{
  return 4.0;
}

@end
