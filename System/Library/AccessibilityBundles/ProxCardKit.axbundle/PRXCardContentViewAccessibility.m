@implementation PRXCardContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRXCardContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRXCardContentView"), CFSTR("dismissButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRXCardContentView"), CFSTR("titleView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PRXCardContentView"), CFSTR("UIView"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRXCardContentViewAccessibility;
  -[PRXCardContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PRXCardContentViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetSortPriority:", 20);

  -[PRXCardContentViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("dismissButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetSortPriority:", 10);

  accessibilityLocalizedString(CFSTR("close.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXCardContentViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("dismissButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  v7 = *MEMORY[0x24BDF73C0];
  -[PRXCardContentViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityTraits:", v7);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXCardContentViewAccessibility;
  -[PRXCardContentViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PRXCardContentViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
