@implementation PXPeopleCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)_axPeopleHomeCellSelectionMode
{
  return __UIAccessibilityGetAssociatedUnsignedInteger();
}

- (void)_setAXPeopleHomeCellSelectionMode:(unint64_t)a3
{
  __UIAccessibilitySetAssociatedUnsignedInteger();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewCell"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewCell"), CFSTR("toggleFavorite:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewCell"), CFSTR("isFavorite"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewCell"), CFSTR("badgeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleBadgeView"), CFSTR("favoriteButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleBadgeView"), CFSTR("unfavoriteButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewCell"), CFSTR("peopleCellDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXPeopleCollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleCollectionViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleSectionedDataSource"), CFSTR("memberAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPersonItem"), CFSTR("modelObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHPerson"), CFSTR("detectionType"), "s", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityPersonName
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_class();
  -[PXPeopleCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PXPeopleCollectionViewCellAccessibility isDetectionTypeHuman](self, "isDetectionTypeHuman"))
    v5 = CFSTR("people.name.unknown");
  else
    v5 = CFSTR("pet.name.unknown");
  accessibilityPhotosUICoreLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v7 = v4;
  else
    v7 = v6;
  v8 = v7;

  return v8;
}

- (BOOL)isDetectionTypeHuman
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  -[PXPeopleCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("peopleCellDelegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PXPeopleCollectionViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("dataSource"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPeopleCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityIndexPath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3;
    v16 = __Block_byref_object_dispose__3;
    v17 = 0;
    v10 = v4;
    v11 = v5;
    AXPerformSafeBlock();
    v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
    objc_msgSend(v6, "safeValueForKey:", CFSTR("modelObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (unsigned __int16)objc_msgSend(v7, "safeIntegerForKey:", CFSTR("detectionType")) == 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __63__PXPeopleCollectionViewCellAccessibility_isDetectionTypeHuman__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "memberAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)accessibilityValue
{
  void *v2;

  if (-[PXPeopleCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFavorite")))
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("people.favorite"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;
  objc_super v5;

  if (-[PXPeopleCollectionViewCellAccessibility _axPeopleHomeCellSelectionMode](self, "_axPeopleHomeCellSelectionMode"))
  {
    v4.receiver = self;
    v4.super_class = (Class)PXPeopleCollectionViewCellAccessibility;
    return -[PXPeopleCollectionViewCellAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PXPeopleCollectionViewCellAccessibility;
    return *MEMORY[0x24BDF73B0] | -[PXPeopleCollectionViewCellAccessibility accessibilityTraits](&v5, sel_accessibilityTraits) | *MEMORY[0x24BEBB110];
  }
}

- (id)_accessibilityFavoriteButton
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  -[PXPeopleCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("badgeView.favoriteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__PXPeopleCollectionViewCellAccessibility__accessibilityFavoriteButton__block_invoke;
  v5[3] = &unk_24FF06D90;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __71__PXPeopleCollectionViewCellAccessibility__accessibilityFavoriteButton__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityPhotosUICoreLocalizedString(CFSTR("add.favorite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityPersonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilityUnfavoriteButton
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  -[PXPeopleCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("badgeView.unfavoriteButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__PXPeopleCollectionViewCellAccessibility__accessibilityUnfavoriteButton__block_invoke;
  v5[3] = &unk_24FF06D90;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

id __73__PXPeopleCollectionViewCellAccessibility__accessibilityUnfavoriteButton__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityPhotosUICoreLocalizedString(CFSTR("remove.favorite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityPersonName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)automationElements
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXPeopleCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFavorite")))-[PXPeopleCollectionViewCellAccessibility _accessibilityUnfavoriteButton](self, "_accessibilityUnfavoriteButton");
  else
    -[PXPeopleCollectionViewCellAccessibility _accessibilityFavoriteButton](self, "_accessibilityFavoriteButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  return v3;
}

- (BOOL)_accessibilityToggleFavoriteActivate:(id)a3
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __80__PXPeopleCollectionViewCellAccessibility__accessibilityToggleFavoriteActivate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "toggleFavorite:", 0);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewCellAccessibility _accessibilityFavoriteButton](self, "_accessibilityFavoriteButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (-[PXPeopleCollectionViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFavorite")))v5 = CFSTR("remove.favorite");
    else
      v5 = CFSTR("add.favorite");
    accessibilityPhotosUICoreLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v6, self, sel__accessibilityToggleFavoriteActivate_);
    objc_msgSend(v3, "addObject:", v7);

  }
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleCollectionViewCellAccessibility;
  -[PXPeopleCollectionViewCellAccessibility accessibilityCustomActions](&v11, sel_accessibilityCustomActions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
