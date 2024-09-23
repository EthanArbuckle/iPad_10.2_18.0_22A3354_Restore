@implementation _UIPreviewPresentationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPreviewPresentationController");
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
  id v9;
  id *v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIPreviewActionSheetItemView");
  objc_msgSend(location[0], "validateClass:");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIPreviewActionSheetView"), CFSTR("actions"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("action"), v6, 0);
  v7 = CFSTR("_UIPreviewPresentationController");
  v8 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("presentationContainerView"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_hasPreviewActions"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("leadingQuickActionView"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("trailingQuickActionView"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIPreviewQuickActionView"), CFSTR("quickAction"), v6, 0);
  v4 = CFSTR("UIPreviewMenuItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("handler"), "@?", 0);
  v5 = CFSTR("UIPresentationController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v7, v5);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_presentSubActionSheetForPreviewActionGroup:"), v8, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("presentationTransitionWillBegin"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("actionSheetContainerView"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("platterView"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("previewActionSheet"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_layoutForRevealTransition"), v8, 0);
  objc_storeStrong(v10, v9);
}

- (void)_axSetupContainerView
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v21 = a1;
  if (a1)
  {
    v20 = (id)objc_msgSend(v21, "safeValueForKey:", CFSTR("presentationContainerView"));
    v19 = (id)objc_msgSend(v20, "safeValueForKey:", CFSTR("platterView"));
    objc_msgSend(v19, "setIsAccessibilityElement:", 1);
    v7 = (id)UIKitAccessibilityLocalizedString();
    objc_msgSend(v19, "setAccessibilityLabel:");

    objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("PreviewContainerElement"));
    v18 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    if ((objc_msgSend(v21, "safeBoolForKey:", CFSTR("_hasPreviewActions")) & 1) != 0)
    {
      v5 = objc_alloc(MEMORY[0x24BDF6788]);
      v6 = (id)UIKitAccessibilityLocalizedString();
      v17 = (id)objc_msgSend(v5, "initWithName:target:selector:");

      objc_msgSend(v18, "addObject:", v17);
      objc_storeStrong(&v17, 0);
    }
    v16 = (id)objc_msgSend(v21, "safeValueForKey:", CFSTR("leadingQuickActionView"));
    v15 = (id)objc_msgSend(v21, "safeValueForKey:", CFSTR("trailingQuickActionView"));
    if (v16)
    {
      v14 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("quickAction"));
      v13 = -[_UIPreviewPresentationControllerAccessibility _axTitleForPreviewAction:]((uint64_t)v21, v14);
      if (objc_msgSend(v13, "length"))
      {
        v1 = objc_alloc(MEMORY[0x24BDF6788]);
        v12 = (id)objc_msgSend(v1, "initWithName:target:selector:", v13, v21, sel__axPerformLeadingAction);
        objc_msgSend(v18, "addObject:", v12);
        objc_storeStrong(&v12, 0);
      }
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    if (v15)
    {
      v11 = (id)objc_msgSend(v15, "safeValueForKey:", CFSTR("quickAction"));
      v10 = -[_UIPreviewPresentationControllerAccessibility _axTitleForPreviewAction:]((uint64_t)v21, v11);
      if (objc_msgSend(v10, "length"))
      {
        v2 = objc_alloc(MEMORY[0x24BDF6788]);
        v9 = (id)objc_msgSend(v2, "initWithName:target:selector:", v10, v21, sel__axPerformTrailingAction);
        objc_msgSend(v18, "addObject:", v9);
        objc_storeStrong(&v9, 0);
      }
      objc_storeStrong(&v10, 0);
      objc_storeStrong(&v11, 0);
    }
    v3 = objc_alloc(MEMORY[0x24BDF6788]);
    v4 = (id)UIKitAccessibilityLocalizedString();
    v8 = (id)objc_msgSend(v3, "initWithName:target:selector:");

    objc_msgSend(v18, "addObject:", v8);
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v19, "setAccessibilityCustomActions:", v18);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
  }
}

- (id)_axTitleForPreviewAction:(uint64_t)a1
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  int v10;
  id location;
  uint64_t v12;
  id v13;

  v12 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v12)
  {
    v8 = 0;
    objc_opt_class();
    v5 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("title"));
    v7 = (id)__UIAccessibilityCastAsClass();

    v6 = v7;
    objc_storeStrong(&v7, 0);
    v9 = v6;
    if (!objc_msgSend(v6, "length"))
    {
      v2 = (id)objc_msgSend(location, "accessibilityLabel");
      v3 = v9;
      v9 = v2;

    }
    v13 = v9;
    v10 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v13 = 0;
    v10 = 1;
  }
  objc_storeStrong(&location, 0);
  return v13;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  _UIPreviewPresentationControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  -[_UIPreviewPresentationControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[_UIPreviewPresentationControllerAccessibility _axSetupContainerView](v4);
}

- (BOOL)_axShowMoreActions:(id)a3
{
  id v4;
  id v5;
  char v6;
  _UIPreviewPresentationControllerAccessibility *v7;
  id location[2];
  _UIPreviewPresentationControllerAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend(location[0], "name");
  v4 = (id)UIKitAccessibilityLocalizedString();
  v6 = objc_msgSend(v5, "isEqualToString:");

  if ((v6 & 1) != 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFA0], 0);
    v7 = v9;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong((id *)&v7, 0);
  }
  objc_storeStrong(location, 0);
  return 1;
}

- (void)_axDismissPreview
{
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFA8], MEMORY[0x24BDBD1C0]);
  -[_UIPreviewPresentationControllerAccessibility _accessibilityDismissPresentation](self, "_accessibilityDismissPresentation");
}

- (BOOL)_axPerformLeadingAction
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  _UIPreviewPresentationControllerAccessibility *v10;
  id v11;
  id v12;
  id v13[2];
  _UIPreviewPresentationControllerAccessibility *v14;

  v14 = self;
  v13[1] = (id)a2;
  v3 = (id)-[_UIPreviewPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingQuickActionView"));
  v13[0] = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("quickAction"));

  v12 = (id)objc_msgSend(v13[0], "safeValueForKey:", CFSTR("handler"));
  if (v12)
  {
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __72___UIPreviewPresentationControllerAccessibility__axPerformLeadingAction__block_invoke;
    v8 = &unk_24FF3EC90;
    v11 = v12;
    v9 = v13[0];
    v10 = v14;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return 1;
}

- (BOOL)_axPerformTrailingAction
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  _UIPreviewPresentationControllerAccessibility *v10;
  id v11;
  id v12;
  id v13[2];
  _UIPreviewPresentationControllerAccessibility *v14;

  v14 = self;
  v13[1] = (id)a2;
  v3 = (id)-[_UIPreviewPresentationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingQuickActionView"));
  v13[0] = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("quickAction"));

  v12 = (id)objc_msgSend(v13[0], "safeValueForKey:", CFSTR("handler"));
  if (v12)
  {
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __73___UIPreviewPresentationControllerAccessibility__axPerformTrailingAction__block_invoke;
    v8 = &unk_24FF3EC90;
    v11 = v12;
    v9 = v13[0];
    v10 = v14;
    AXPerformSafeBlock();
    objc_storeStrong((id *)&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return 1;
}

- (void)_accessibilityDismissPresentation
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __82___UIPreviewPresentationControllerAccessibility__accessibilityDismissPresentation__block_invoke;
  v6 = &unk_24FF3DA40;
  v7[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
}

- (void)_presentSubActionSheetForPreviewActionGroup:(id)a3
{
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  _UIPreviewPresentationControllerAccessibility *v8;
  objc_super v9;
  id location[2];
  _UIPreviewPresentationControllerAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9.receiver = v11;
  v9.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  -[_UIPreviewPresentationControllerAccessibility _presentSubActionSheetForPreviewActionGroup:](&v9, sel__presentSubActionSheetForPreviewActionGroup_, location[0]);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __93___UIPreviewPresentationControllerAccessibility__presentSubActionSheetForPreviewActionGroup___block_invoke;
  v7 = &unk_24FF3DA40;
  v8 = v11;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)containerViewWillLayoutSubviews
{
  objc_super v2;
  SEL v3;
  _UIPreviewPresentationControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  -[_UIPreviewPresentationControllerAccessibility containerViewWillLayoutSubviews](&v2, sel_containerViewWillLayoutSubviews);
  -[_UIPreviewPresentationControllerAccessibility _axSetupContainerView](v4);
}

- (void)_layoutForRevealTransition
{
  objc_super v2;
  SEL v3;
  _UIPreviewPresentationControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  -[_UIPreviewPresentationControllerAccessibility _layoutForRevealTransition](&v2, sel__layoutForRevealTransition);
  -[_UIPreviewPresentationControllerAccessibility _axSetupContainerView](v4);
}

- (_UIPreviewPresentationControllerAccessibility)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  _UIPreviewPresentationControllerAccessibility *v4;
  id v7;
  _UIPreviewPresentationControllerAccessibility *v8;
  objc_super v9;
  _UIPreviewPresentationControllerAccessibility *v10;
  id v11;
  id location[2];
  _UIPreviewPresentationControllerAccessibility *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  v13 = -[_UIPreviewPresentationControllerAccessibility initWithPresentedViewController:presentingViewController:](&v9, sel_initWithPresentedViewController_presentingViewController_, location[0], v11);
  v10 = v13;
  v7 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v7, "addObserver:selector:name:object:", v13, sel__accessibilityDismissPresentation, CFSTR("accessibilityDismissActionSheet"), 0);

  v8 = v10;
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (void)presentationTransitionWillBegin
{
  id v2;
  objc_super v3;
  SEL v4;
  _UIPreviewPresentationControllerAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  -[_UIPreviewPresentationControllerAccessibility presentationTransitionWillBegin](&v3, sel_presentationTransitionWillBegin);
  if (UIAccessibilityIsSwitchControlRunning())
  {
    v2 = (id)-[_UIPreviewPresentationControllerAccessibility safeValueForKey:](v5, "safeValueForKey:", CFSTR("actionSheetContainerView"));
    objc_msgSend(v2, "setAccessibilityViewIsModal:", 1);

  }
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  _UIPreviewPresentationControllerAccessibility *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)_UIPreviewPresentationControllerAccessibility;
  -[_UIPreviewPresentationControllerAccessibility dealloc](&v3, sel_dealloc);
}

@end
