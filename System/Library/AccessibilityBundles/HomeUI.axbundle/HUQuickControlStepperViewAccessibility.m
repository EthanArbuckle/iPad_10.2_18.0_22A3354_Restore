@implementation HUQuickControlStepperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlStepperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlContainerView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlContainerView"), CFSTR("summaryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlStepperView"), CFSTR("segmentViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlStepperView"), CFSTR("_handleGesture:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlStepperView"), CFSTR("selectedSegmentIndex"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlStepperSegmentView"), CFSTR("isSegmentViewHighlighted"), "B", 0);

}

- (id)_accessibilitySelectedStepperSegment
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  objc_opt_class();
  -[HUQuickControlStepperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("segmentViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__HUQuickControlStepperViewAccessibility__accessibilitySelectedStepperSegment__block_invoke;
  v7[3] = &unk_250234A88;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __78__HUQuickControlStepperViewAccessibility__accessibilitySelectedStepperSegment__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "safeBoolForKey:", CFSTR("isSegmentViewHighlighted")))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_handleGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[HUQuickControlStepperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedSegmentIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlStepperViewAccessibility;
  -[HUQuickControlStepperViewAccessibility _handleGesture:](&v7, sel__handleGesture_, v4);

  -[HUQuickControlStepperViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedSegmentIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
    AXPerformBlockOnMainThreadAfterDelay();

}

uint64_t __57__HUQuickControlStepperViewAccessibility__handleGesture___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityAnnounceState");
}

- (void)_accessibilityAnnounceState
{
  void *v2;
  void *v3;
  id v4;

  -[HUQuickControlStepperViewAccessibility _accessibilitySummaryView](self, "_accessibilitySummaryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", v4);
    objc_msgSend(v3, "setAttribute:forKey:", &unk_250242DF0, *MEMORY[0x24BDFEAD8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v3);

  }
}

- (id)_accessibilitySummaryView
{
  void *v2;
  void *v3;

  -[HUQuickControlStepperViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_10, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("summaryView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __67__HUQuickControlStepperViewAccessibility__accessibilitySummaryView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234911848](CFSTR("HUQuickControlContainerView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
