@implementation VUIAccessView_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIAccessView_iOS");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIAccessView_iOS"), CFSTR("layoutSubviews"), "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIAccessView_iOSAccessibility;
  -[VUIAccessView_iOSAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[VUIAccessView_iOSAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349244BC](CFSTR("UITransitionView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIAccessView_iOSAccessibility;
  -[VUIAccessView_iOSAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VUIAccessView_iOSAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
