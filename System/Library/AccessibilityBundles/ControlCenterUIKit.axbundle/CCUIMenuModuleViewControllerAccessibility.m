@implementation CCUIMenuModuleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIMenuModuleViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CCUIMenuModuleViewController"), CFSTR("CCUIButtonModuleViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CCUIMenuModuleViewController"), CFSTR("title"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIMenuModuleViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIMenuModuleViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIMenuModuleViewController"), CFSTR("shouldBeginTransitionToExpandedContentModule"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIButtonModuleViewController"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIMenuModuleViewController"), CFSTR("_menuItemsContainer"), "UIStackView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUIMenuModuleViewControllerAccessibility;
  -[CCUIMenuModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[CCUIMenuModuleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __87__CCUIMenuModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_2501E31A0;
  v9[4] = self;
  objc_msgSend(v3, "setIsAccessibilityElementBlock:", v9);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_initWeak(&location, self);
  -[CCUIMenuModuleViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_menuItemsContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __87__CCUIMenuModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v6[3] = &unk_2501E31C8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "_setAccessibilityElementsBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

uint64_t __87__CCUIMenuModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isExpanded"));
}

id __87__CCUIMenuModuleViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityModuleViewElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_accessibilityControlCenterButtonLabel
{
  void *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v12;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIMenuModuleViewControllerAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      return v3;

  }
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SleepModeControlCenterButton.SleepModeButtonViewController"));

  if (v6)
  {
    accessibilityLocalizedString(CFSTR("sleep.mode.module.label"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedInfoDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDBD1D0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    v11 = v10;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CCUIMenuModuleViewControllerAccessibility;
    -[CCUIMenuModuleViewControllerAccessibility accessibilityLabel](&v12, sel_accessibilityLabel);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v11;

  return v3;
}

- (id)_accessibilityControlCenterButtonIdentifier
{
  void *v3;
  objc_super v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CCUIMenuModuleViewControllerAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CCUIMenuModuleViewControllerAccessibility;
    -[CCUIMenuModuleViewControllerAccessibility accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilityControlCenterButtonHint
{
  return 0;
}

- (BOOL)_accessibilityControlCenterShouldExpandContentModule
{
  int v3;

  v3 = -[CCUIMenuModuleViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldBeginTransitionToExpandedContentModule"));
  if (v3)
    LOBYTE(v3) = -[CCUIMenuModuleViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1;
  return v3;
}

- (CGRect)_accessibilityControlCenterButtonFrame
{
  void *v3;
  UIView *v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  objc_opt_class();
  -[CCUIMenuModuleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_buttonModuleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();

  -[UIView bounds](v4, "bounds");
  v20 = UIAccessibilityConvertFrameToScreenCoordinates(v19, v4);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  if (-[CCUIMenuModuleViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))
  {
    -[CCUIMenuModuleViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "accessibilityFrame");
      v24.origin.x = v11;
      v24.origin.y = v12;
      v24.size.width = v13;
      v24.size.height = v14;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v22 = CGRectUnion(v21, v24);
      x = v22.origin.x;
      y = v22.origin.y;
      width = v22.size.width;
      height = v22.size.height;
    }

  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUIMenuModuleViewControllerAccessibility;
  -[CCUIMenuModuleViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CCUIMenuModuleViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_accessibilityModuleViewElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  AXCCMenuModuleElement *v12;
  _QWORD v14[5];
  id v15;
  id location;

  -[CCUIMenuModuleViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXChildren"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIMenuModuleViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXChildren"));
  }
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CCUIMenuModuleViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_menuItemsContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = objc_msgSend(v3, "count");
  v9 = objc_msgSend(v3, "count");
  if (v8 <= v7)
  {
    if (v9 < v7)
    {
      objc_initWeak(&location, self);
      v10 = 0;
      v11 = MEMORY[0x24BDAC760];
      while (v10 < v7 - objc_msgSend(v3, "count"))
      {
        v12 = -[AXCCMenuModuleElement initWithAccessibilityContainer:]([AXCCMenuModuleElement alloc], "initWithAccessibilityContainer:", self);
        v14[0] = v11;
        v14[1] = 3221225472;
        v14[2] = __77__CCUIMenuModuleViewControllerAccessibility__accessibilityModuleViewElements__block_invoke;
        v14[3] = &unk_2501E31F0;
        objc_copyWeak(&v15, &location);
        v14[4] = self;
        -[AXCCMenuModuleElement setProvider:](v12, "setProvider:", v14);
        -[AXCCMenuModuleElement setIndex:](v12, "setIndex:", objc_msgSend(v3, "count"));
        objc_msgSend(v3, "addObject:", v12);
        objc_destroyWeak(&v15);

        ++v10;
      }
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v3, "removeObjectsInRange:", v7, v9 - v7);
  }
  return v3;
}

id __77__CCUIMenuModuleViewControllerAccessibility__accessibilityModuleViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "index");
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_menuItemsContainer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "arrangedSubviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 < objc_msgSend(v8, "count")
    && objc_msgSend(*(id *)(a1 + 32), "_accessibilityControlCenterMenuItemAtIndexIsValid:", v4))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_accessibilityControlCenterMenuItemAtIndexIsValid:(int64_t)a3
{
  return 1;
}

@end
