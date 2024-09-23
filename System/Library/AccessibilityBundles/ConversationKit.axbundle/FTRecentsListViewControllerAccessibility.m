@implementation FTRecentsListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FTRecentsListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FTRecentsListViewController"), CFSTR("accessibilityPrepareHeaderView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("FTRecentsListViewController"), CFSTR("collectionView"), "UICollectionView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FTRecentsListViewControllerAccessibility;
  -[FTRecentsListViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[FTRecentsListViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("recentList.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  v6 = objc_msgSend(v4, "numberOfSections");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    v9 = *MEMORY[0x24BDF7630];
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_msgSend(v4, "supplementaryViewForElementKind:atIndexPath:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[FTRecentsListViewControllerAccessibility _axPrepareHeaderView:](self, "_axPrepareHeaderView:", v12);
      ++v8;
    }
    while (v7 != v8);
  }

}

- (void)accessibilityPrepareHeaderView:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FTRecentsListViewControllerAccessibility;
  v4 = a3;
  -[FTRecentsListViewControllerAccessibility accessibilityPrepareHeaderView:](&v5, sel_accessibilityPrepareHeaderView_, v4);
  -[FTRecentsListViewControllerAccessibility _axPrepareHeaderView:](self, "_axPrepareHeaderView:", v4, v5.receiver, v5.super_class);

}

- (void)_axPrepareHeaderView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "contentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6);

}

@end
