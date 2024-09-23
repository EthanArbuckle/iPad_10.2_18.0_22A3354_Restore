@implementation PKEnhancedMerchantCollectionViewListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKEnhancedMerchantCollectionViewListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKEnhancedMerchantCollectionViewListCell"), CFSTR("detailedDescriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKEnhancedMerchantCollectionViewListCell"), CFSTR("_listContentView"), "UIListContentView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKEnhancedMerchantCollectionViewListCell"), CFSTR("_visibleButtons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIButton"), CFSTR("_targetActions"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIControlTargetAction"), CFSTR("_actionHandler"), "UIAction");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIAction"), CFSTR("_handler"), "@?");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[PKEnhancedMerchantCollectionViewListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_listContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXStringForAllChildren();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKEnhancedMerchantCollectionViewListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailedDescriptionLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PKEnhancedMerchantCollectionViewListCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_visibleButtons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
        {
          objc_initWeak(&location, v8);
          v9 = objc_alloc(MEMORY[0x24BDF6788]);
          objc_msgSend(v8, "accessibilityLabel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = __83__PKEnhancedMerchantCollectionViewListCellAccessibility_accessibilityCustomActions__block_invoke;
          v13[3] = &unk_2502E3910;
          objc_copyWeak(&v14, &location);
          v11 = (void *)objc_msgSend(v9, "initWithName:actionHandler:", v10, v13);
          objc_msgSend(v3, "addObject:", v11);

          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v3;
}

BOOL __83__PKEnhancedMerchantCollectionViewListCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("_targetActions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_actionHandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeValueForKey:", CFSTR("_handler"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v8);

  return v10 != 0;
}

@end
