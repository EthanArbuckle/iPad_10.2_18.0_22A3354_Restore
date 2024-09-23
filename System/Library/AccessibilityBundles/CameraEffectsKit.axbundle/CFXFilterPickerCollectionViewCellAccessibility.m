@implementation CFXFilterPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CFXFilterPickerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterPickerCollectionViewCell"), CFSTR("titleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectPickerCollectionViewCell"), CFSTR("effect"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffect"), CFSTR("identifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterPickerCollectionViewCell"), CFSTR("isInCompactMode"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXFilterPickerCollectionViewCell"), CFSTR("configureCellAppearence"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
  -[CFXFilterPickerCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CFXFilterPickerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (BOOL)isAccessibilityElement
{
  return -[CFXFilterPickerCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isInCompactMode")) ^ 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;
  objc_super v5;

  if (-[CFXFilterPickerCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("selected")))
  {
    v5.receiver = self;
    v5.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
    return *MEMORY[0x24BDF7400] | -[CFXFilterPickerCollectionViewCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
    return -[CFXFilterPickerCollectionViewCellAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
  }
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  char v10;

  v10 = 0;
  objc_opt_class();
  -[CFXFilterPickerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("effect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("737C8717-70E0-4CCE-8F19-17A0532E836F")) & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
    -[CFXFilterPickerCollectionViewCellAccessibility accessibilityHint](&v9, sel_accessibilityHint);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("filter.hint-%@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)configureCellAppearence
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CFXFilterPickerCollectionViewCellAccessibility;
  -[CFXFilterPickerCollectionViewCellAccessibility configureCellAppearence](&v3, sel_configureCellAppearence);
  -[CFXFilterPickerCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
