@implementation VUIAccessView_tvOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIAccessView_tvOS");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VUIAccessView_tvOS"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VUIAccessView_tvOS"), CFSTR("_bodyLabel"), "UILabel");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VUIAccessView_tvOSAccessibility;
  -[VUIAccessView_tvOSAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[VUIAccessView_tvOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "accessibilityTraits");
  v6 = *MEMORY[0x24BDF73C0];
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v5);
  objc_opt_class();
  -[VUIAccessView_tvOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bodyLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAccessibilityTraits:", objc_msgSend(v8, "accessibilityTraits") | v6);
}

- (id)accessibilityHeaderElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[VUIAccessView_tvOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAccessView_tvOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bodyLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIAccessView_tvOSAccessibility;
  -[VUIAccessView_tvOSAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[VUIAccessView_tvOSAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
