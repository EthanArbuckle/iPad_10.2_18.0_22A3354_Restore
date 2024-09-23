@implementation CollectionSubHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CollectionSubHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionSubHeaderView"), CFSTR("_contentView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionSubHeaderView"), CFSTR("_sortButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CollectionSubHeaderView"), CFSTR("_saveButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionSubHeaderView"), CFSTR("createEditContent"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CollectionSubHeaderView"), CFSTR("createSaveContent"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id from;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CollectionSubHeaderViewAccessibility;
  -[CollectionSubHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[CollectionSubHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__CollectionSubHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_250258DB8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v8);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __82__CollectionSubHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_250258DE0;
  v5[4] = self;
  objc_copyWeak(&v6, &from);
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "_setAccessibilityActivationPointBlock:", v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

id __82__CollectionSubHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  UIAXStringForAllChildren();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double __82__CollectionSubHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v2 = objc_msgSend(a1[4], "safeUnsignedIntegerForKey:", CFSTR("type"));
  if (v2 == 2)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 5);
    v4 = WeakRetained;
    v5 = CFSTR("_saveButton");
  }
  else
  {
    if (v2 != 1)
    {
      v4 = objc_loadWeakRetained(a1 + 6);
      objc_msgSend(v4, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    WeakRetained = objc_loadWeakRetained(a1 + 5);
    v4 = WeakRetained;
    v5 = CFSTR("_sortButton");
  }
  objc_msgSend(WeakRetained, "safeUIViewForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = v6;
  objc_msgSend(v6, "accessibilityActivationPoint");
  v9 = v8;

  return v9;
}

- (void)createEditContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CollectionSubHeaderViewAccessibility;
  -[CollectionSubHeaderViewAccessibility createEditContent](&v3, sel_createEditContent);
  -[CollectionSubHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)createSaveContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CollectionSubHeaderViewAccessibility;
  -[CollectionSubHeaderViewAccessibility createSaveContent](&v3, sel_createSaveContent);
  -[CollectionSubHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
