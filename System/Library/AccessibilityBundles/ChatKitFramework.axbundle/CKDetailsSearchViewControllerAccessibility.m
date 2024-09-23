@implementation CKDetailsSearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsSearchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKDetailsSearchViewController"), CFSTR("CKSearchViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKSearchViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CKSearchViewController"), CFSTR("UICollectionViewDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchViewController"), CFSTR("searchControllers"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKDetailsSearchResultsTitleHeaderCell"));
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("UICollectionViewDelegate"), CFSTR("collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:"), 1, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchController"), CFSTR("cellForItemInCollectionView:atIndexPath:withIdentifier:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("dequeueReusableCellWithReuseIdentifier:forIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionView"), CFSTR("dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:"), "@", "@", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  -[CKDetailsSearchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[CKDetailsSearchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __88__CKDetailsSearchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2501B1D58;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityElementsBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

id __88__CKDetailsSearchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("searchControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(WeakRetained, "_axSectionMap");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v8);

    }
  }

  return v2;
}

- (id)_axSectionMap
{
  JUMPOUT(0x23490A888);
}

- (void)_setAXSectionMap:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)cellForItemInCollectionView:(id)a3 atIndexPath:(id)a4 withIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  -[CKDetailsSearchViewControllerAccessibility cellForItemInCollectionView:atIndexPath:withIdentifier:](&v12, sel_cellForItemInCollectionView_atIndexPath_withIdentifier_, a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "section"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSearchViewControllerAccessibility _axAddCellToMapWithSection:cell:](self, "_axAddCellToMapWithSection:cell:", v10, v9);

  }
  return v9;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  id v10;
  id v11;
  void *v12;
  objc_super v13;

  v10 = a4;
  v11 = a6;
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  -[CKDetailsSearchViewControllerAccessibility collectionView:willDisplaySupplementaryView:forElementKind:atIndexPath:](&v13, sel_collectionView_willDisplaySupplementaryView_forElementKind_atIndexPath_, a3, v10, a5, v11);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v11, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSearchViewControllerAccessibility _axAddCellToMapWithSection:cell:](self, "_axAddCellToMapWithSection:cell:", v12, v10);

  }
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[CKDetailsSearchViewControllerAccessibility _setAXSectionMap:](self, "_setAXSectionMap:", 0);
  v10.receiver = self;
  v10.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  -[CKDetailsSearchViewControllerAccessibility dequeueReusableCellWithReuseIdentifier:forIndexPath:](&v10, sel_dequeueReusableCellWithReuseIdentifier_forIndexPath_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dequeueReusableSupplementaryViewOfKind:(id)a3 withReuseIdentifier:(id)a4 forIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKDetailsSearchViewControllerAccessibility _setAXSectionMap:](self, "_setAXSectionMap:", 0);
  v13.receiver = self;
  v13.super_class = (Class)CKDetailsSearchViewControllerAccessibility;
  -[CKDetailsSearchViewControllerAccessibility dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:](&v13, sel_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_, v10, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_axAddCellToMapWithSection:(id)a3 cell:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[CKDetailsSearchViewControllerAccessibility _axSectionMap](self, "_axSectionMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsSearchViewControllerAccessibility _setAXSectionMap:](self, "_setAXSectionMap:", v8);

  }
  -[CKDetailsSearchViewControllerAccessibility _axSectionMap](self, "_axSectionMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("CKDetailsSearchResultsTitleHeaderCell"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "axSafelyAddObject:", v6);
      objc_msgSend(v11, "axSafelyAddObjectsFromArray:", v10);
    }
    else
    {
      objc_msgSend(v11, "axSafelyAddObjectsFromArray:", v10);
      objc_msgSend(v11, "axSafelyAddObject:", v6);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKDetailsSearchViewControllerAccessibility _axSectionMap](self, "_axSectionMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v11, v13);

}

@end
