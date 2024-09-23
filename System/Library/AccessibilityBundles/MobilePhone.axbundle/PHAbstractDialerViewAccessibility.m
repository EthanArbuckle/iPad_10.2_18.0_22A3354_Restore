@implementation PHAbstractDialerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHAbstractDialerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHAbstractDialerViewAccessibility;
  -[PHAbstractDialerViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PHAbstractDialerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_addContactButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("add.number.text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[PHAbstractDialerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_deleteButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("delete.text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[PHAbstractDialerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_deleteButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);

  -[PHAbstractDialerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_deleteButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("DeleteButton"));

}

- (PHAbstractDialerViewAccessibility)initWithFrame:(CGRect)a3
{
  PHAbstractDialerViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHAbstractDialerViewAccessibility;
  v3 = -[PHAbstractDialerViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PHAbstractDialerViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
