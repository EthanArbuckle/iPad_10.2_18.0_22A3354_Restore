@implementation TiltedTabViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TiltedTabViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TiltedTabViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TiltedTabViewController"), CFSTR("tiltedTabView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TiltedTabViewController"), CFSTR("dockedStates"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TiltedTabViewController"), CFSTR("tiltedTabViewDidPresent:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TiltedTabViewController"), CFSTR("tiltedTabViewDidDismiss:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TiltedTabViewController"), CFSTR("tiltedTabView:contentViewForItemAtIndex:"), "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TiltedTabViewController"), CFSTR("tiltedTabView:snapshotViewForItemAtIndex:"), "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TiltedTabViewController"), CFSTR("dismiss"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFTiltedTabView"), CFSTR("_visibleItems"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_MFTiltedTabItemView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MFTiltedTabItemView"), CFSTR("borrowedContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MFTiltedTabItemView"), CFSTR("contentShadowView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("DockedViewControllerState"), CFSTR("RestorableViewControllerState"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RestorableViewControllerState"), CFSTR("storedUserActivity"), "@", 0);

}

- (void)_axPrepareDockedLabelForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[TiltedTabViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tiltedTabView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("_visibleItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v9 = v6;
  AXPerformSafeBlock();
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  objc_msgSend(v7, "safeValueForKey:", CFSTR("borrowedContentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TiltedTabViewControllerAccessibility _accessibilityUpdateDraftLabelForBorrowedView:withActorAtIndex:](self, "_accessibilityUpdateDraftLabelForBorrowedView:withActorAtIndex:", v8, a3);
}

void __70__TiltedTabViewControllerAccessibility__axPrepareDockedLabelForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)tiltedTabViewDidPresent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TiltedTabViewControllerAccessibility;
  -[TiltedTabViewControllerAccessibility tiltedTabViewDidPresent:](&v8, sel_tiltedTabViewDidPresent_, v4);
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("_visibleItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
      -[TiltedTabViewControllerAccessibility _axPrepareDockedLabelForIndex:](self, "_axPrepareDockedLabelForIndex:", v6++);
    while (objc_msgSend(v5, "count") > v6);
  }
  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");
  -[TiltedTabViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityViewIsModal:", 1);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)dismiss
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TiltedTabViewControllerAccessibility;
  -[TiltedTabViewControllerAccessibility dismiss](&v2, sel_dismiss);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __47__TiltedTabViewControllerAccessibility_dismiss__block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)tiltedTabViewDidDismiss:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TiltedTabViewControllerAccessibility;
  -[TiltedTabViewControllerAccessibility tiltedTabViewDidDismiss:](&v3, sel_tiltedTabViewDidDismiss_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __64__TiltedTabViewControllerAccessibility_tiltedTabViewDidDismiss___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (id)tiltedTabView:(id)a3 contentViewForItemAtIndex:(unint64_t)a4
{
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TiltedTabViewControllerAccessibility;
  -[TiltedTabViewControllerAccessibility tiltedTabView:contentViewForItemAtIndex:](&v8, sel_tiltedTabView_contentViewForItemAtIndex_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TiltedTabViewControllerAccessibility _accessibilityUpdateDraftLabelForBorrowedView:withActorAtIndex:](self, "_accessibilityUpdateDraftLabelForBorrowedView:withActorAtIndex:", v6, a4);
  return v6;
}

- (id)tiltedTabView:(id)a3 snapshotViewForItemAtIndex:(unint64_t)a4
{
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TiltedTabViewControllerAccessibility;
  -[TiltedTabViewControllerAccessibility tiltedTabView:snapshotViewForItemAtIndex:](&v8, sel_tiltedTabView_snapshotViewForItemAtIndex_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TiltedTabViewControllerAccessibility _accessibilityUpdateDraftLabelForBorrowedView:withActorAtIndex:](self, "_accessibilityUpdateDraftLabelForBorrowedView:withActorAtIndex:", v6, a4);
  return v6;
}

- (void)_accessibilityUpdateDraftLabelForBorrowedView:(id)a3 withActorAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  v6 = a3;
  -[TiltedTabViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tiltedTabView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeArrayForKey:", CFSTR("_visibleItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TiltedTabViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("dockedStates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a4 >= 1 && objc_msgSend(v9, "count") >= (unint64_t)a4)
  {
    accessibilityLocalizedString(CFSTR("draft.label"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v12);

    objc_msgSend(v10, "objectAtIndex:", a4 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(location) = 0;
    objc_opt_class();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("storedUserActivity"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", CFSTR("ComposeNavTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityValue:", v16);

  }
  else
  {
    accessibilityLocalizedString(CFSTR("dismiss.draft.picker"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v11);
  }

  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_initWeak(&location, v6);
  v17 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __103__TiltedTabViewControllerAccessibility__accessibilityUpdateDraftLabelForBorrowedView_withActorAtIndex___block_invoke;
  v21[3] = &unk_250286078;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v6, "_setAccessibilityActivationPointBlock:", v21);
  if ((a4 & 0x8000000000000000) == 0 && objc_msgSend(v8, "count") > (unint64_t)a4)
  {
    objc_msgSend(v8, "objectAtIndex:", a4);
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __103__TiltedTabViewControllerAccessibility__accessibilityUpdateDraftLabelForBorrowedView_withActorAtIndex___block_invoke_2;
    v19[3] = &unk_2502860A0;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v18;
    objc_msgSend(v6, "_setAccessibilityPathBlock:", v19);

  }
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

double __103__TiltedTabViewControllerAccessibility__accessibilityUpdateDraftLabelForBorrowedView_withActorAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double MidX;
  CGRect v12;
  CGRect v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v12.origin.x = v3;
  v12.origin.y = v5;
  v12.size.width = v7;
  v12.size.height = v9;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = v3;
  v13.origin.y = v5;
  v13.size.width = v7;
  v13.size.height = v9;
  CGRectGetMinY(v13);
  return MidX;
}

id __103__TiltedTabViewControllerAccessibility__accessibilityUpdateDraftLabelForBorrowedView_withActorAtIndex___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  UIView *v4;
  void *v5;
  UIBezierPath *v6;
  void *v7;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("contentShadowView"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  if (v2)
    objc_msgSend(v2, "affineTransform");
  LOBYTE(v9[0]) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDF6870];
  -[UIView bounds](v4, "bounds");
  objc_msgSend(v5, "bezierPathWithRect:");
  v6 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  -[UIBezierPath applyTransform:](v6, "applyTransform:", v9);
  UIAccessibilityConvertPathToScreenCoordinates(v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
