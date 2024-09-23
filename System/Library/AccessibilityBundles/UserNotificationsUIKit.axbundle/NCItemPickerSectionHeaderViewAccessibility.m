@implementation NCItemPickerSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCItemPickerSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("countLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("backgroundView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("checkmarkButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("selected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("_checkmarkButtonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("_section"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerSectionHeaderView"), CFSTR("_section"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NCItemPickerViewController"), CFSTR("_isSectionExpanded"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[NCItemPickerSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCItemPickerSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("countLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  _BOOL4 v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[NCItemPickerSectionHeaderViewAccessibility accessibilityIsSelected](self, "accessibilityIsSelected");
  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[NCItemPickerSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("backgroundView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;

  -[NCItemPickerSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("backgroundView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)NCItemPickerSectionHeaderViewAccessibility;
  -[NCItemPickerSectionHeaderViewAccessibility accessibilityCustomActions](&v18, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  v5 = -[NCItemPickerSectionHeaderViewAccessibility accessibilityIsSelected](self, "accessibilityIsSelected");
  v6 = CFSTR("digest.apps.select.all");
  if (v5)
    v6 = CFSTR("digest.apps.unselect.all");
  v7 = v6;
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __72__NCItemPickerSectionHeaderViewAccessibility_accessibilityCustomActions__block_invoke;
  v15 = &unk_2503BDE88;
  objc_copyWeak(&v16, &location);
  v10 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v9, &v12);

  objc_msgSend(v3, "axSafelyAddObject:", v10, v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __72__NCItemPickerSectionHeaderViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __72__NCItemPickerSectionHeaderViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v2, "safeValueForKey:", CFSTR("checkmarkButton"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_checkmarkButtonPressed:", v1);

}

- (int64_t)_accessibilityExpandedStatus
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;

  -[NCItemPickerSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_section"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  -[NCItemPickerSectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("_isSectionExpanded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
    v9 = 1;
  else
    v9 = 2;

  return v9;
}

- (BOOL)accessibilityIsSelected
{
  return -[NCItemPickerSectionHeaderViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("selected"));
}

@end
