@implementation HUIconPickerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUIconPickerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconPickerCollectionViewCell"), CFSTR("iconButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUIconPickerCollectionViewCell"), CFSTR("iconDescriptor"), "@", 0);

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

  objc_opt_class();
  -[HUIconPickerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLabelForIconIdentifier((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;

  objc_opt_class();
  -[HUIconPickerCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("iconButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isSelected");
  v6 = *MEMORY[0x24BDF7400];
  if (!v5)
    v6 = 0;
  v7 = v6 | *MEMORY[0x24BDF73B0];

  return v7;
}

@end
