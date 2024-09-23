@implementation PowerSwooshCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.PowerSwooshCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PowerSwooshCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PowerSwooshCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  UIAXStringForAllChildren();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    UIAXStringForAllChildren();
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PowerSwooshCellAccessibility;
    -[PowerSwooshCellAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)accessibilityCustomActions
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("show.context.menu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __58__PowerSwooshCellAccessibility_accessibilityCustomActions__block_invoke;
  v11 = &unk_2502FD050;
  objc_copyWeak(&v12, &location);
  v6 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v5, &v8);

  objc_msgSend(v3, "axSafelyAddObject:", v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __58__PowerSwooshCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityShowContextMenuForElement:targetPointValue:", WeakRetained, 0);

  return 1;
}

@end
