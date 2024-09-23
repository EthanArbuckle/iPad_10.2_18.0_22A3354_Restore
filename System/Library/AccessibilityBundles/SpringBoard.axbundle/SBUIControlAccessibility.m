@implementation SBUIControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[SBUIControlAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ShowcaseBlockingView"));

  if (v4)
  {
    if (AXSpringBoardIsAssistantVisible())
      UIAXPrivateLocalizedString();
    else
      accessibilityLocalizedString(CFSTR("dismiss.app.switcher.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUIControlAccessibility;
    -[SBUIControlAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[SBUIControlAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ShowcaseBlockingView"));

  if (v4)
  {
    if (AXSpringBoardIsAssistantVisible())
      UIAXPrivateLocalizedString();
    else
      accessibilityLocalizedString(CFSTR("dismiss.app.switcher.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUIControlAccessibility;
    -[SBUIControlAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  objc_super v6;

  -[SBUIControlAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ShowcaseBlockingView"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)SBUIControlAccessibility;
  return -[SBUIControlAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
}

@end
