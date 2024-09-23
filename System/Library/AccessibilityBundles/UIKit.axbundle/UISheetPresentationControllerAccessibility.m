@implementation UISheetPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISheetPresentationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  const __CFString *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const __CFString *v11;
  id v12;
  id *v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UISheetPresentationController");
  v3 = CFSTR("UIPresentationController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISheetPresentationController"), CFSTR("_containerViewLayoutSubviews"), 0);
  v9 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_layoutInfo"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_currentPresentedViewFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("presentedView"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("dropShadowView"), v9, 0);
  v8 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_shouldDismiss"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("delegate"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("animateChanges:"), v6, "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_sendDidChangeSelectedDetentIdentifier"), v6, 0);
  v5 = CFSTR("UIDropShadowView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_bottomGrabber"), v9, 0);
  v7 = CFSTR("_UISheetLayoutInfo");
  v10 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_indexOfCurrentActiveDetent"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_activeDetents"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_presentedViewController"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_setSelectedDetentIdentifier:"), v6, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_isInverted"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISheetActiveDetent"), CFSTR("_identifier"), v9, 0);
  v11 = CFSTR("UISheetPresentationControllerDetent");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, CFSTR("_type"), v10, 0);
  objc_msgSend(location[0], "validateClass:", v11);
  objc_storeStrong(v13, v12);
}

- (void)_containerViewLayoutSubviews
{
  objc_super v2;
  SEL v3;
  UISheetPresentationControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISheetPresentationControllerAccessibility;
  -[UISheetPresentationControllerAccessibility _containerViewLayoutSubviews](&v2, sel__containerViewLayoutSubviews);
  -[UISheetPresentationControllerAccessibility _axMarkupGrabbers](v4, "_axMarkupGrabbers");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UISheetPresentationControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISheetPresentationControllerAccessibility;
  -[UISheetPresentationControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UISheetPresentationControllerAccessibility _axMarkupGrabbers](v4, "_axMarkupGrabbers");
}

- (void)_axMarkupGrabbers
{
  UISheetPresentationControllerAccessibility *v2;
  id v3;
  UISheetPresentationControllerAccessibility *v4;
  id v5;
  id v6[2];
  UISheetPresentationControllerAccessibility *v7;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UISheetPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dropShadowView"));
  v2 = v7;
  v3 = (id)objc_msgSend(v6[0], "safeValueForKey:", CFSTR("_topGrabber"));
  -[UISheetPresentationControllerAccessibility _axMarkupGrabber:](v2, "_axMarkupGrabber:");

  v4 = v7;
  v5 = (id)objc_msgSend(v6[0], "safeValueForKey:", CFSTR("_bottomGrabber"));
  -[UISheetPresentationControllerAccessibility _axMarkupGrabber:](v4, "_axMarkupGrabber:");

  objc_storeStrong(v6, 0);
}

- (void)_axMarkupGrabber:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  id (*v11)(id *);
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19[5];
  uint64_t v20;
  int v21;
  int v22;
  uint64_t (*v23)(id *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id location[2];
  UISheetPresentationControllerAccessibility *v29;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&v27, v29);
  v20 = MEMORY[0x24BDAC760];
  v21 = -1073741824;
  v22 = 0;
  v23 = __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke;
  v24 = &unk_24FF3DA88;
  objc_copyWeak(&v25, &v27);
  v26 = (id)MEMORY[0x2348C3D88](&v20);
  objc_msgSend(location[0], "_accessibilitySetSortPriority:", 1);
  v7 = location[0];
  CGSizeMake();
  v19[1] = v3;
  v19[2] = v4;
  objc_msgSend(v7, "_accessibilitySetFrameExpansion:", *(double *)&v3, *(double *)&v4);
  objc_msgSend(location[0], "_setIsAccessibilityElementBlock:", v26);
  v6 = location[0];
  v14 = MEMORY[0x24BDAC760];
  v15 = -1073741824;
  v16 = 0;
  v17 = __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke_2;
  v18 = &unk_24FF3DDC0;
  v19[0] = v26;
  objc_msgSend(v6, "_setAccessibilityTraitsBlock:", &v14);
  v5 = location[0];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke_3;
  v12 = &unk_24FF3DC00;
  objc_copyWeak(&v13, &v27);
  objc_msgSend(v5, "_setAccessibilityHintBlock:", &v8);
  objc_destroyWeak(&v13);
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v26, 0);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_storeStrong(location, 0);
}

uint64_t __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke(id *a1)
{
  BOOL v2;
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  char v7;
  id v8;
  id location[3];
  char v10;

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (!location[0])
  {
    v10 = 0;
    goto LABEL_16;
  }
  v4 = objc_msgSend(location[0], "_axCurrentGrabberAction");
  if (!v4)
  {
LABEL_15:
    v10 = 1;
    goto LABEL_16;
  }
  if (v4 != 1)
  {
    if ((unint64_t)(v4 - 2) > 1)
    {
      v10 = 0;
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v3 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("delegate"));
  v7 = 0;
  v5 = 0;
  if (!v3
    || (v8 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("delegate")),
        v7 = 1,
        v2 = 0,
        (objc_msgSend(v8, "_accessibilityShouldAttemptToAddDismissalElement") & 1) != 0))
  {
    v6 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("_shouldDismiss"));
    v5 = 1;
    v2 = v6 != 0;
  }
  v10 = v2;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
LABEL_16:
  objc_storeStrong(location, 0);
  return v10 & 1;
}

uint64_t __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke_2(uint64_t a1)
{
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
    return *MEMORY[0x24BDF73B0];
  else
    return *MEMORY[0x24BDF73E0];
}

id __63__UISheetPresentationControllerAccessibility__axMarkupGrabber___block_invoke_3(id *a1)
{
  unint64_t v2;
  id location[3];
  id v4;

  location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    v2 = objc_msgSend(location[0], "_axCurrentGrabberAction");
    if (v2 <= 3)
      __asm { BR              X8 }
    v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (int64_t)_axCurrentGrabberAction
{
  id v3;
  int64_t v4;

  v3 = (id)-[UISheetPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layoutInfo"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("_grabberAction"));

  return v4;
}

- (BOOL)_accessibilityPresentationControllerModalizes
{
  id v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  id v8;
  id v9;
  id v10;
  id v11;
  BOOL v12;
  CGRect r2;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  unint64_t v25;
  id v26[2];
  UISheetPresentationControllerAccessibility *v27;
  char v28;
  CGRect v29;
  CGRect v30;

  v27 = self;
  v26[1] = (id)a2;
  v26[0] = (id)-[UISheetPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layoutInfo"));
  v25 = objc_msgSend(v26[0], "safeIntegerForKey:", CFSTR("_indexOfCurrentActiveDetent"));
  v24 = (id)objc_msgSend(v26[0], "safeArrayForKey:", CFSTR("_activeDetents"));
  v11 = (id)objc_msgSend(v26[0], "safeValueForKey:", CFSTR("_containerTraitCollection"));
  v12 = objc_msgSend(v11, "verticalSizeClass") == 1;

  v23 = v12;
  v20 = 0;
  if (v25 >= objc_msgSend(v24, "count"))
  {
    v2 = 0;
  }
  else
  {
    v21 = (id)objc_msgSend(v24, "objectAtIndexedSubscript:", v25);
    v20 = 1;
    v2 = v21;
  }
  v22 = v2;
  if ((v20 & 1) != 0)

  v18 = 0;
  objc_opt_class();
  v10 = (id)objc_msgSend(v26[0], "safeValueForKey:", CFSTR("_presentedViewController"));
  v17 = (id)__UIAccessibilityCastAsClass();

  v16 = v17;
  objc_storeStrong(&v17, 0);
  v19 = v16;
  v15 = 0;
  NSClassFromString(CFSTR("UISheetPresentationControllerDetent"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = objc_msgSend(v22, "safeIntegerForKey:", CFSTR("_type"));
  v14 = (id)objc_msgSend(v22, "safeStringForKey:", CFSTR("identifier"));
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.UIKit.ColorPicker")) & 1) != 0
    || (objc_msgSend(v14, "isEqualToString:", CFSTR("ComplicationGalleryDodge")) & 1) != 0
    || (objc_msgSend(v14, "isEqualToString:", CFSTR("homeScreenPickerDodge")) & 1) != 0
    || (objc_msgSend(v19, "_accessibilityPresentedControllerModalizes") & 1) != 0)
  {
    v28 = 1;
  }
  else if (v15 == 1 || (objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.UIKit.large")) & 1) != 0)
  {
    v28 = 1;
  }
  else if (v15 == 2 && v23)
  {
    v28 = 1;
  }
  else
  {
    if (v15 && v15 != 4)
      goto LABEL_25;
    v9 = (id)-[UISheetPresentationControllerAccessibility safeUIViewForKey:](v27, "safeUIViewForKey:", CFSTR("presentedView"));
    v8 = (id)objc_msgSend(v9, "window");
    objc_msgSend(v8, "frame");
    r2.origin.x = v3;
    r2.origin.y = v4;
    r2.size.width = v5;
    r2.size.height = v6;

    -[UISheetPresentationControllerAccessibility safeCGRectForKey:](v27, "safeCGRectForKey:", CFSTR("_currentPresentedViewFrame"));
    v30 = CGRectIntersection(v29, r2);
    if (v30.size.height / r2.size.height > 0.85 && v30.size.width / r2.size.width >= 0.4)
      goto LABEL_24;
    if ((AXProcessIsShortcuts() & 1) != 0)
LABEL_24:
      v28 = 1;
    else
LABEL_25:
      v28 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v26, 0);
  return v28 & 1;
}

- (BOOL)_accessibilityExpandSheet
{
  if (!-[UISheetPresentationControllerAccessibility _accessibilityCanExpandSheet](self, "_accessibilityCanExpandSheet"))
    return 0;
  -[UISheetPresentationControllerAccessibility _accessibilityChangeSize:](self, "_accessibilityChangeSize:", 1);
  return 1;
}

- (BOOL)_accessibilityCollapseSheet
{
  if (!-[UISheetPresentationControllerAccessibility _accessibilityCanCollapseSheet](self, "_accessibilityCanCollapseSheet"))return 0;
  -[UISheetPresentationControllerAccessibility _accessibilityChangeSize:](self, "_accessibilityChangeSize:", 0);
  return 1;
}

- (BOOL)_accessibilityCanCollapseSheet
{
  unint64_t v3;
  id v4;
  BOOL v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UISheetPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layoutInfo"));
  v3 = objc_msgSend(v6[0], "safeIntegerForKey:", CFSTR("_indexOfCurrentActiveDetent")) + 1;
  v4 = (id)objc_msgSend(v6[0], "safeArrayForKey:", CFSTR("_activeDetents"));
  v5 = v3 < objc_msgSend(v4, "count");

  objc_storeStrong(v6, 0);
  return v5;
}

- (BOOL)_accessibilityCanExpandSheet
{
  BOOL v3;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UISheetPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layoutInfo"));
  v3 = objc_msgSend(v4[0], "safeIntegerForKey:", CFSTR("_indexOfCurrentActiveDetent")) - 1 >= 0;
  objc_storeStrong(v4, 0);
  return v3;
}

- (BOOL)_accessibilityIsInverted
{
  id v3;
  char v4;

  v3 = (id)-[UISheetPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layoutInfo"));
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_isInverted"));

  return v4 & 1;
}

- (void)_accessibilityChangeSize:(BOOL)a3
{
  uint64_t v3;
  int v4;
  UISheetPresentationControllerAccessibility *v5;
  id v6;
  id v7[2];
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  SEL v13;
  UISheetPresentationControllerAccessibility *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = (id)-[UISheetPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layoutInfo"));
  v3 = objc_msgSend(v11, "safeIntegerForKey:", CFSTR("_indexOfCurrentActiveDetent"));
  v4 = 1;
  v10 = v3;
  v9 = 0;
  if (v12)
    v4 = -1;
  v9 = (void *)(v10 + v4);
  v8 = (id)objc_msgSend(v11, "safeArrayForKey:", CFSTR("_activeDetents"));
  if ((uint64_t)v9 >= 0 && (unint64_t)v9 < objc_msgSend(v8, "count"))
  {
    v5 = v14;
    v6 = v11;
    v7[0] = v8;
    v7[1] = v9;
    AXPerformSafeBlock();
    objc_storeStrong(v7, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong((id *)&v5, 0);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v11, 0);
}

void __71__UISheetPresentationControllerAccessibility__accessibilityChangeSize___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;
  id v10[4];

  v10[3] = a1;
  v10[2] = a1;
  v2 = a1[4];
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __71__UISheetPresentationControllerAccessibility__accessibilityChangeSize___block_invoke_2;
  v7 = &unk_24FF3DDE8;
  v8 = a1[5];
  v9 = a1[6];
  v10[1] = a1[7];
  v10[0] = a1[4];
  objc_msgSend(v2, "animateChanges:");
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v8, 0);
}

void __71__UISheetPresentationControllerAccessibility__accessibilityChangeSize___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
  v2 = (id)objc_msgSend(v3, "safeStringForKey:", CFSTR("_identifier"));
  objc_msgSend(v1, "_setSelectedDetentIdentifier:");

  objc_msgSend(*(id *)(a1 + 48), "_sendDidChangeSelectedDetentIdentifier");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
