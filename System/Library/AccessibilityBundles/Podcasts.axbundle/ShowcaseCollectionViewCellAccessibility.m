@implementation ShowcaseCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ShowcaseCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ShowcaseCollectionViewCell"), CFSTR("accessibilityCaptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ShowcaseCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.ShowcaseCollectionViewCell"), CFSTR("accessibilitySubtitleLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[ShowcaseCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityCaptionLabel, accessibilityTitleLabel, accessibilitySubtitleLabel"));
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[ShowcaseCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityCaptionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234919BC8](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  v10 = __69__ShowcaseCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
  v11 = &unk_2502FD050;
  objc_copyWeak(&v12, &location);
  v6 = (void *)objc_msgSend(v4, "initWithName:actionHandler:", v5, &v8);

  objc_msgSend(v3, "axSafelyAddObject:", v6, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v3;
}

uint64_t __69__ShowcaseCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityShowContextMenuForElement:targetPointValue:", WeakRetained, 0);

  return 1;
}

@end
