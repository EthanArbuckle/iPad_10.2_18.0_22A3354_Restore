@implementation LargeLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.LargeLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.LargeLockupCollectionViewCell"), CFSTR("accessibilityEmbeddedView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.LargeLockupCollectionViewCell"), CFSTR("deletionButton"), "Optional<MTMPButton>");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MTMPButton"), CFSTR("UIView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LargeLockupCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[LargeLockupCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  return (id)-[LargeLockupCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityEmbeddedView"));
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[4];
  id v20;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[LargeLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityEmbeddedView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityCustomActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);

  -[LargeLockupCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("deletionButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alpha");
  v7 = MEMORY[0x24BDAC760];
  if (v8 > 0.0)
  {
    v9 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("delete.button"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __72__LargeLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke;
    v19[3] = &unk_2502FD000;
    v20 = v6;
    v11 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v10, v19);

    objc_msgSend(v3, "axSafelyAddObject:", v11);
  }
  objc_initWeak(&location, self);
  v12 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("show.context.menu"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __72__LargeLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2;
  v16[3] = &unk_2502FD050;
  objc_copyWeak(&v17, &location);
  v14 = (void *)objc_msgSend(v12, "initWithName:actionHandler:", v13, v16);

  objc_msgSend(v3, "axSafelyAddObject:", v14);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v3;
}

uint64_t __72__LargeLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
  return 1;
}

uint64_t __72__LargeLockupCollectionViewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityShowContextMenuForElement:targetPointValue:", WeakRetained, 0);

  return 1;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  -[LargeLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityEmbeddedView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityUserInputLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
