@implementation ACSportsMatchupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsMatchupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ACSportsMatchupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scoreboardView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
