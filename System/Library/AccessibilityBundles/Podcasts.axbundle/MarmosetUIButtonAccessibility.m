@implementation MarmosetUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  -[MarmosetUIButtonAccessibility backgroundImageForState:](self, "backgroundImageForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MarmosetUIButtonAccessibility imageForState:](self, "imageForState:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("settingsglyph")) & 1) != 0
    || objc_msgSend(v6, "hasPrefix:", CFSTR("settingsglyph")))
  {
    v7 = CFSTR("settings.button");
  }
  else
  {
    if ((objc_msgSend(v5, "hasPrefix:", CFSTR("shareGlyph")) & 1) == 0
      && (objc_msgSend(v5, "hasPrefix:", CFSTR("barShareGlyph")) & 1) == 0
      && (objc_msgSend(v6, "hasPrefix:", CFSTR("shareGlyph")) & 1) == 0
      && !objc_msgSend(v6, "hasPrefix:", CFSTR("barShareGlyph")))
    {
      v11.receiver = self;
      v11.super_class = (Class)MarmosetUIButtonAccessibility;
      -[MarmosetUIButtonAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v7 = CFSTR("share.button");
  }
  accessibilityLocalizedString(v7);
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = (void *)v8;

  return v9;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[MarmosetUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SpeedButton"));

  if (v4)
  {
    -[MarmosetUIButtonAccessibility titleForState:](self, "titleForState:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MarmosetUIButtonAccessibility;
    -[MarmosetUIButtonAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  int v4;
  objc_super v6;

  -[MarmosetUIButtonAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("NowPlayingBackButton"));

  if (v4)
  {
    -[MarmosetUIButtonAccessibility sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MarmosetUIButtonAccessibility;
    return -[MarmosetUIButtonAccessibility accessibilityPerformEscape](&v6, sel_accessibilityPerformEscape);
  }
}

- (BOOL)isAccessibilityElement
{
  double v3;
  objc_super v5;

  -[MarmosetUIButtonAccessibility alpha](self, "alpha");
  if (v3 == 0.0)
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)MarmosetUIButtonAccessibility;
  return -[MarmosetUIButtonAccessibility isAccessibilityElement](&v5, sel_isAccessibilityElement);
}

@end
