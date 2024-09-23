@implementation CNAvatarPosterPairCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ContactsUI.CNAvatarPosterPairCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ContactsUI.CNAvatarPosterPairCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ContactsUI.CNAvatarPosterPairCollectionViewController"), CFSTR("centeredPosterButton"), "Optional<UIButton>");

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CNAvatarPosterPairCollectionViewControllerAccessibility;
  v7 = a3;
  -[CNAvatarPosterPairCollectionViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v20, sel_collectionView_cellForItemAtIndexPath_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  v9 = -[CNAvatarPosterPairCollectionViewControllerAccessibility collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v7, objc_msgSend(v6, "section"));

  v10 = objc_msgSend(v6, "item");
  v11 = v9 - 1;
  objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  if (v10 == v9 - 1)
  {
    accessibilityLocalizedString(CFSTR("add.new.poster"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v12);

    objc_msgSend(v8, "setAccessibilityValue:", 0);
    objc_msgSend(v8, "setAccessibilityHint:", 0);
  }
  else
  {
    accessibilityLocalizedString(CFSTR("contact.photo.and.poster"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v13);

    v14 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("contact.poster.position"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, objc_msgSend(v6, "item") + 1, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityValue:", v16);

    accessibilityLocalizedString(CFSTR("contact.photo.customize.hint"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityHint:", v17);

  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __97__CNAvatarPosterPairCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke;
  v19[3] = &unk_2501D8320;
  v19[4] = self;
  objc_msgSend(v8, "setAccessibilityActivateBlock:", v19);

  return v8;
}

uint64_t __97__CNAvatarPosterPairCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke()
{
  AXPerformSafeBlock();
  return 1;
}

void __97__CNAvatarPosterPairCollectionViewControllerAccessibility_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeSwiftValueForKey:", CFSTR("centeredPosterButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sendActionsForControlEvents:", 0x2000);
}

@end
