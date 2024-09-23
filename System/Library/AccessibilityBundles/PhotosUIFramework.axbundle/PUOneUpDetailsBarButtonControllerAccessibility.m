@implementation PUOneUpDetailsBarButtonControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUOneUpDetailsBarButtonController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUAssetViewModel"), CFSTR("isAccessoryViewVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("assetViewModelForAssetReference:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUBrowsingViewModel"), CFSTR("currentAssetReference"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOneUpDetailsBarButtonController"), CFSTR("update"), "v", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PUOneUpDetailsBarButtonController"), CFSTR("browseViewModel"), "PUBrowsingViewModel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PUOneUpDetailsBarButtonController"), CFSTR("barButtonItem"), "AnimatableBarButtonItem");

}

- (id)_axAssetViewModel
{
  void *v2;
  void *v3;
  id v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[PUOneUpDetailsBarButtonControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("browseViewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("currentAssetReference"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v6 = v2;
  v7 = v3;
  AXPerformSafeBlock();
  v4 = (id)v9[5];

  _Block_object_dispose(&v8, 8);
  return v4;
}

void __67__PUOneUpDetailsBarButtonControllerAccessibility__axAssetViewModel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "assetViewModelForAssetReference:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_axDetailsShowing
{
  void *v2;
  char v3;

  -[PUOneUpDetailsBarButtonControllerAccessibility _axAssetViewModel](self, "_axAssetViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isAccessoryViewVisible"));

  return v3;
}

- (void)_axLoadDetailsButtonAccessibility:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (-[PUOneUpDetailsBarButtonControllerAccessibility _axDetailsShowing](self, "_axDetailsShowing"))
  {
    v4 = objc_msgSend(v7, "accessibilityTraits");
    v5 = *MEMORY[0x24BDF7400] | v4;
  }
  else
  {
    v6 = *MEMORY[0x24BDF7400];
    v5 = objc_msgSend(v7, "accessibilityTraits") & ~v6;
  }
  objc_msgSend(v7, "setAccessibilityTraits:", v5);

}

- (void)update
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PUOneUpDetailsBarButtonControllerAccessibility;
  -[PUOneUpDetailsBarButtonControllerAccessibility update](&v2, sel_update);
  AXPerformSafeBlock();
}

void __56__PUOneUpDetailsBarButtonControllerAccessibility_update__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeSwiftValueForKey:", CFSTR("barButtonItem"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axLoadDetailsButtonAccessibility:", v2);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
