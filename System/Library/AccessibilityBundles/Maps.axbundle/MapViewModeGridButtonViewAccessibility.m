@implementation MapViewModeGridButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MapViewModeGridButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MapViewModeGridButtonView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapViewModeGridButtonView"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapViewModeGridButtonViewModel"), CFSTR("selected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MapViewModeGridButtonViewModel"), CFSTR("overflowMenu"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[MapViewModeGridButtonViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityViewModel
{
  return (id)-[MapViewModeGridButtonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewModel"));
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;

  v2 = *MEMORY[0x24BDF73B0];
  -[MapViewModeGridButtonViewAccessibility _accessibilityViewModel](self, "_accessibilityViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("selected"));

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v2;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_initWeak(&location, self);
  -[MapViewModeGridButtonViewAccessibility _accessibilityViewModel](self, "_accessibilityViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("overflowMenu"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    AXMapsLocString(CFSTR("ADDITIONAL_FILTERS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __68__MapViewModeGridButtonViewAccessibility_accessibilityCustomActions__block_invoke;
    v13 = &unk_250258EA8;
    objc_copyWeak(&v14, &location);
    v7 = (void *)objc_msgSend(v5, "initWithName:actionHandler:", v6, &v10);
    v16[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v14);
  }
  else
  {
    v8 = 0;
  }

  objc_destroyWeak(&location);
  return v8;
}

uint64_t __68__MapViewModeGridButtonViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_overflowButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "_accessibilityShowContextMenuForElement:targetPointValue:", v2, 0);
  return 1;
}

@end
