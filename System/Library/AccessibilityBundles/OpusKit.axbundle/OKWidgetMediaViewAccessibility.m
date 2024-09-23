@implementation OKWidgetMediaViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OKWidgetMediaView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("OKWidgetMediaView"), CFSTR("OKWidgetMediaViewProxy"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OKWidgetViewProxy"), CFSTR("mediaURLs"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OKWidgetViewProxy"), CFSTR("pageViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OKPageViewController"), CFSTR("presentationViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OKPresentationViewControllerProxy"), CFSTR("presentation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OKPresentation"), CFSTR("mediaItemForURL:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("OKMediaPhotoKitItem"), CFSTR("_asset"), "PHAsset");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[OKWidgetMediaViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaURLs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[OKWidgetMediaViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("presentationViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeValueForKey:", CFSTR("presentation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v15 = v10;
  v16 = v4;
  AXPerformSafeBlock();
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  objc_msgSend(v11, "safeValueForKey:", CFSTR("_asset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __52__OKWidgetMediaViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaItemForURL:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
