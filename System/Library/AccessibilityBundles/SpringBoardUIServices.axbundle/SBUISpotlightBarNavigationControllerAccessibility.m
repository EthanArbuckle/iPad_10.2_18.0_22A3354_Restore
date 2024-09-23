@implementation SBUISpotlightBarNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUISpotlightBarNavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBUISpotlightBarNavigationController"), CFSTR("UINavigationController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationControllerAccessibility"), CFSTR("_accessibilityNavigationControllerShouldSendScreenChange"), "B", 0);

}

- (BOOL)_accessibilityNavigationControllerShouldSendScreenChange
{
  void *v2;
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUISpotlightBarNavigationControllerAccessibility;
  if (-[SBUISpotlightBarNavigationControllerAccessibility _accessibilityNavigationControllerShouldSendScreenChange](&v6, sel__accessibilityNavigationControllerShouldSendScreenChange))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "parentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SBTodayViewController"));
    v4 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

@end
