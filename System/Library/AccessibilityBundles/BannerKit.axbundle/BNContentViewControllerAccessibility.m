@implementation BNContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BNContentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BNContentViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BNContentViewController"), CFSTR("_presentables"), "BNTieredArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BNTieredArray"), CFSTR("allObjects"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("BNPresentable"), CFSTR("viewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BNContentViewController"), CFSTR("_dismissPresentable:withReason:animated:userInfo:"), "v", "@", "@", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BNContentViewController"), CFSTR("presentPresentable:withOptions:userInfo:"), "v", "@", "Q", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)BNContentViewControllerAccessibility;
  -[BNContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  v13 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "childViewControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[BNContentViewControllerAccessibility _axMarkupBannerVC:](self, "_axMarkupBannerVC:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v6);
  }

}

- (void)addChildViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BNContentViewControllerAccessibility;
  v4 = a3;
  -[BNContentViewControllerAccessibility addChildViewController:](&v5, sel_addChildViewController_, v4);
  -[BNContentViewControllerAccessibility _axMarkupBannerVC:](self, "_axMarkupBannerVC:", v4, v5.receiver, v5.super_class);

}

- (void)presentPresentable:(id)a3 withOptions:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("com.apple.DragUI.druid.DRPasteAnnouncementAccessibilityDescriptionKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setAccessibilityLabel:", v10);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v10);
  }
  v11.receiver = self;
  v11.super_class = (Class)BNContentViewControllerAccessibility;
  -[BNContentViewControllerAccessibility presentPresentable:withOptions:userInfo:](&v11, sel_presentPresentable_withOptions_userInfo_, v8, a4, v9);

}

- (void)_axMarkupBannerVC:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id from;
  id location;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAccessibilityAutomationType:", 8);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __58__BNContentViewControllerAccessibility__axMarkupBannerVC___block_invoke;
  v15 = &unk_25018F210;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_msgSend(v6, "_setAccessibilityPerformEscapeBlock:", &v12);

  -[BNContentViewControllerAccessibility _axPresentableForViewController:](self, "_axPresentableForViewController:", v4, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsAccessibilityElement:", objc_msgSend(v9, "length") != 0);

  objc_msgSend(v4, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

BOOL __58__BNContentViewControllerAccessibility__axMarkupBannerVC___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axPresentableForViewController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v3;
    AXPerformSafeBlock();

  }
  return v4 != 0;
}

void __58__BNContentViewControllerAccessibility__axMarkupBannerVC___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_axPresentableForViewController:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_dismissPresentable:withReason:animated:userInfo:", v2, CFSTR("Accessibility"), 1, 0);

}

- (id)_axPresentableForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[BNContentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_presentables"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("allObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__BNContentViewControllerAccessibility__axPresentableForViewController___block_invoke;
  v10[3] = &unk_25018F238;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __72__BNContentViewControllerAccessibility__axPresentableForViewController___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "safeValueForKey:", CFSTR("viewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
