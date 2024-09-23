@implementation PXSubjectTrackingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXSubjectTrackingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSubjectTrackingView"), CFSTR("_axDescriptionForCacheKey:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSubjectTrackingView"), CFSTR("setCinematographyFrame:animate:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSubjectTrackingView"), CFSTR("detectionViewCache"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSubjectTrackingView"), CFSTR("focusStateBadge"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSubjectTrackingView"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXSubjectTrackingViewAccessibility;
  -[PXSubjectTrackingViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[PXSubjectTrackingViewAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("detectionViewCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__PXSubjectTrackingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_24FF06A58;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __80__PXSubjectTrackingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a2;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v7 = v5;
  AXPerformSafeBlock();
  v8 = (id)v15[5];

  objc_destroyWeak(&v13);
  _Block_object_dispose(&v14, 8);

  v9 = objc_msgSend(v6, "safeIntegerForKey:", CFSTR("shape"));
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v9 - 1) < 3)
  {
    accessibilityPhotosUICoreLocalizedString(off_24FF06A78[v9 - 1]);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v12, v10, CFSTR("__AXStringForVariablesSentinel"));

}

void __80__PXSubjectTrackingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_322(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_axDescriptionForCacheKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSubjectTrackingViewAccessibility;
  -[PXSubjectTrackingViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PXSubjectTrackingViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setCinematographyFrame:(id)a3 animate:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSubjectTrackingViewAccessibility;
  -[PXSubjectTrackingViewAccessibility setCinematographyFrame:animate:](&v5, sel_setCinematographyFrame_animate_, a3, a4);
  -[PXSubjectTrackingViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
