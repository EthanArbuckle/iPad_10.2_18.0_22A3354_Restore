@implementation HKDisplayTypeContextVerticalCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKDisplayTypeContextVerticalCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HKDisplayTypeContextVerticalCollectionViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionViewCell"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKDisplayTypeContextVerticalCollectionViewCell"), CFSTR("infoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKDisplayTypeContextVerticalCollectionViewCell"), CFSTR("infoButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKDisplayTypeContextVerticalCollectionViewCell"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKDisplayTypeContextVerticalCollectionViewCell"), CFSTR("valueAndUnitLabel"), "@", 0);

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
  void *v7;

  -[HKDisplayTypeContextVerticalCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKDisplayTypeContextVerticalCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("valueAndUnitLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKDisplayTypeContextVerticalCollectionViewCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[HKDisplayTypeContextVerticalCollectionViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[HKDisplayTypeContextVerticalCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("selected"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  char v13;

  v3 = (void *)objc_opt_new();
  -[HKDisplayTypeContextVerticalCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("infoButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("more.info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__HKDisplayTypeContextVerticalCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v11[3] = &unk_25022ACB8;
  v11[4] = self;
  v12 = v5;
  v8 = v5;
  v9 = (void *)objc_msgSend(v6, "initWithName:actionHandler:", v7, v11);
  objc_msgSend(v3, "addObject:", v9);

  return v3;
}

uint64_t __89__HKDisplayTypeContextVerticalCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;
  id v6;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_copyWeak(&v6, &location);
  v5 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return 1;
}

void __89__HKDisplayTypeContextVerticalCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "infoButtonTapped:", *(_QWORD *)(a1 + 32));

}

@end
