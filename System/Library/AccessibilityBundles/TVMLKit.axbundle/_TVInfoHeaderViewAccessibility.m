@implementation _TVInfoHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVInfoHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("_TVInfoHeaderView"), CFSTR("infoHeaderViewWithElement:existingView:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVInfoHeaderView"), CFSTR("headerView"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C0];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[_TVInfoHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVInfoHeaderViewAccessibility;
  -[_TVInfoHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[_TVInfoHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

+ (id)infoHeaderViewWithElement:(id)a3 existingView:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____TVInfoHeaderViewAccessibility;
  objc_msgSendSuper2(&v6, sel_infoHeaderViewWithElement_existingView_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

@end
