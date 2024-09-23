@implementation ComposeNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ComposeNavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ComposeNavigationController"), CFSTR("setContentVisible:"), "v", "B", 0);
}

- (void)setContentVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ComposeNavigationControllerAccessibility;
  -[ComposeNavigationControllerAccessibility setContentVisible:](&v6, sel_setContentVisible_);
  -[ComposeNavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityElementsHidden:", !v3);

}

@end
