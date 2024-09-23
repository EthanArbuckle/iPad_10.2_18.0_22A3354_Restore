@implementation OBHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBHeaderView"), CFSTR("headerLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBHeaderView"), CFSTR("detailLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBHeaderView"), CFSTR("extendedInitWithTitle:detailText:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBHeaderView"), CFSTR("setTitle:"), "v", "@", 0);

}

- (void)extendedInitWithTitle:(id)a3 detailText:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBHeaderViewAccessibility;
  -[OBHeaderViewAccessibility extendedInitWithTitle:detailText:](&v5, sel_extendedInitWithTitle_detailText_, a3, a4);
  -[OBHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBHeaderViewAccessibility;
  -[OBHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0];
  -[OBHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("headerLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  char v14;

  v4 = a3;
  v14 = 0;
  objc_opt_class();
  -[OBHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_4;
  v8 = (void *)v7;
  objc_msgSend(v6, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v4) & 1) != 0)
  {

LABEL_4:
    v13.receiver = self;
    v13.super_class = (Class)OBHeaderViewAccessibility;
    -[OBHeaderViewAccessibility setTitle:](&v13, sel_setTitle_, v4);
    goto LABEL_5;
  }
  v10 = objc_msgSend(v4, "length");

  v13.receiver = self;
  v13.super_class = (Class)OBHeaderViewAccessibility;
  -[OBHeaderViewAccessibility setTitle:](&v13, sel_setTitle_, v4);
  if (v10)
  {
    -[OBHeaderViewAccessibility _axNavigationControllerParent](self, "_axNavigationControllerParent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "_isTransitioning"))
    {

    }
    else
    {
      objc_msgSend(v6, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v6);
    }
  }
LABEL_5:

}

- (void)setDetailText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  char v14;

  v4 = a3;
  v14 = 0;
  objc_opt_class();
  -[OBHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "text");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_4;
  v8 = (void *)v7;
  objc_msgSend(v6, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v4) & 1) != 0)
  {

LABEL_4:
    v13.receiver = self;
    v13.super_class = (Class)OBHeaderViewAccessibility;
    -[OBHeaderViewAccessibility setDetailText:](&v13, sel_setDetailText_, v4);
    goto LABEL_5;
  }
  v10 = objc_msgSend(v4, "length");

  v13.receiver = self;
  v13.super_class = (Class)OBHeaderViewAccessibility;
  -[OBHeaderViewAccessibility setDetailText:](&v13, sel_setDetailText_, v4);
  if (v10)
  {
    -[OBHeaderViewAccessibility _axNavigationControllerParent](self, "_axNavigationControllerParent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "_isTransitioning"))
    {

    }
    else
    {
      objc_msgSend(v6, "window");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v6);
    }
  }
LABEL_5:

}

- (id)_axNavigationControllerParent
{
  void *v2;
  void *v3;
  void *v4;

  -[OBHeaderViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __58__OBHeaderViewAccessibility__axNavigationControllerParent__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
