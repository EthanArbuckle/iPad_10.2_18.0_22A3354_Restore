@implementation ContainerHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ContainerHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ContainerHeaderView"), CFSTR("_customInit"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ContainerHeaderView"), CFSTR("_defaultTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ContainerHeaderView"), CFSTR("_buttonView"), "CardButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ContainerHeaderView"), CFSTR("UIView"));

}

- (void)_axAnnotateSubviews
{
  uint64_t v2;
  id v3;

  -[ContainerHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_defaultTitleLabel"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v2);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  -[ContainerHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttonView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContainerHeaderViewAccessibility _accessibilitySubviews](self, "_accessibilitySubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "indexOfObject:", v3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    v8 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v8, "exchangeObjectAtIndex:withObjectAtIndex:", objc_msgSend(v8, "count") - 1, v7);
    v5 = v8;
  }

  return v5;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContainerHeaderViewAccessibility;
  -[ContainerHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[ContainerHeaderViewAccessibility _axAnnotateSubviews](self, "_axAnnotateSubviews");
}

- (void)_customInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContainerHeaderViewAccessibility;
  -[ContainerHeaderViewAccessibility _customInit](&v3, sel__customInit);
  -[ContainerHeaderViewAccessibility _axAnnotateSubviews](self, "_axAnnotateSubviews");
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContainerHeaderViewAccessibility;
  -[ContainerHeaderViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[ContainerHeaderViewAccessibility _axAnnotateSubviews](self, "_axAnnotateSubviews");
}

@end
