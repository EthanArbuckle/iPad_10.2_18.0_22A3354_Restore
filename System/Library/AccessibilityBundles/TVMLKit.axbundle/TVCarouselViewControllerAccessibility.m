@implementation TVCarouselViewControllerAccessibility

id __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("headerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234921D50]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "safeIntegerForKey:", CFSTR("currentPage"));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_collectionElement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("sections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v13 = v6;
  AXPerformSafeBlock();
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  objc_msgSend(v7, "safeDictionaryForKey:", CFSTR("_dataDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("ImageAX"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_215(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "elementForItemAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2_221(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityIncrement");

}

void __84___TVCarouselViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityDecrement");

}

@end
