@implementation PRSubviewHitTestingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRSubviewHitTestingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("PRSubviewHitTestingView"), CFSTR("UIView"));
}

- (id)automationElements
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
