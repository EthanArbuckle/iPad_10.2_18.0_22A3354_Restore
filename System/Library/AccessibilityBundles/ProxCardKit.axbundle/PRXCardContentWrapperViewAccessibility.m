@implementation PRXCardContentWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRXCardContentWrapperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRXCardContentWrapperView"), CFSTR("scrollView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRXCardContentWrapperViewAccessibility;
  -[PRXCardContentWrapperViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73E0];
  -[PRXCardContentWrapperViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("scrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityContainerType:", v3);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXCardContentWrapperViewAccessibility;
  -[PRXCardContentWrapperViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PRXCardContentWrapperViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
