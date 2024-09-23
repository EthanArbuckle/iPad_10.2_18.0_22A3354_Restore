@implementation PosterBoardFrameworkUIButtonAccessibility

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
  int v4;
  __CFString *v5;
  void *v6;
  objc_super v8;

  -[PosterBoardFrameworkUIButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("poster.switcher.focus.button"));

  if (v4)
  {
    if (-[PosterBoardFrameworkUIButtonAccessibility overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle") == 1)
      v5 = CFSTR("poster.switcher.focus.button.linked.label");
    else
      v5 = CFSTR("poster.switcher.focus.button.link.focus.label");
    accessibilityLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PosterBoardFrameworkUIButtonAccessibility;
    -[PosterBoardFrameworkUIButtonAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  char **v5;
  PosterBoardFrameworkUIButtonAccessibility **v6;
  PosterBoardFrameworkUIButtonAccessibility *v8;
  PosterBoardFrameworkUIButtonAccessibility *v9;

  -[PosterBoardFrameworkUIButtonAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("poster.switcher.focus.button"));

  if (v4
    && -[PosterBoardFrameworkUIButtonAccessibility overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle") == 1)
  {
    v9 = self;
    v5 = &selRef_accessibilityLabel;
    v6 = &v9;
  }
  else
  {
    v8 = self;
    v5 = &selRef_accessibilityValue;
    v6 = &v8;
  }
  v6[1] = (PosterBoardFrameworkUIButtonAccessibility *)PosterBoardFrameworkUIButtonAccessibility;
  objc_msgSendSuper2((objc_super *)v6, *v5, v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
