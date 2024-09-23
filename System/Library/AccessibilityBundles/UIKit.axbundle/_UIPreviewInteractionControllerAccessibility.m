@implementation _UIPreviewInteractionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIPreviewInteractionController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = "@";
  v4 = CFSTR("_UIPreviewInteractionController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_dismissPreviewViewControllerIfNeededWithCompletion:"), "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("commitInteractivePreview"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("previewInteraction"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_dismissPreviewViewControllerIfNeeded"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("currentPresentationController"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("previewActionsController"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIPreviewActionsController"), CFSTR("previewActionsView"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("currentPreviewingContext"), v6, 0);
  v5 = CFSTR("_UIViewControllerPreviewingContext");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("sourceView"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIPreviewPresentationController2"), CFSTR("contentPlatterView"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)_accessibilityCustomActionsFromPresentedViewController:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  id v21;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int v28;
  id location;
  uint64_t v30;
  id v31;

  v30 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v30)
  {
    v27 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = objc_alloc(MEMORY[0x24BDF6788]);
    v14 = (id)UIKitAccessibilityLocalizedString();
    v26 = (id)objc_msgSend(v13, "initWithName:target:selector:");

    objc_msgSend(v27, "addObject:", v26);
    v25 = (id)objc_msgSend(location, "leadingPreviewAction");
    if (v25)
    {
      v12 = (id)objc_msgSend(v25, "accessibilityLabel");
      v22 = 0;
      if (v12)
      {
        v2 = v12;
      }
      else
      {
        v23 = (id)objc_msgSend(v25, "title");
        v22 = 1;
        v2 = v23;
      }
      v24 = v2;
      if ((v22 & 1) != 0)

      v3 = objc_alloc(MEMORY[0x24BDF6788]);
      v21 = (id)objc_msgSend(v3, "initWithName:target:selector:", v24, v30, sel__accessibilityPerformLeadingAction);
      objc_msgSend(v27, "addObject:", v21);
      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v24, 0);
    }
    v20 = (id)objc_msgSend(location, "trailingPreviewAction");
    if (v20)
    {
      v11 = (id)objc_msgSend(v20, "accessibilityLabel");
      v17 = 0;
      if (v11)
      {
        v4 = v11;
      }
      else
      {
        v18 = (id)objc_msgSend(v20, "title");
        v17 = 1;
        v4 = v18;
      }
      v19 = v4;
      if ((v17 & 1) != 0)

      if (objc_msgSend(v19, "length"))
      {
        v5 = objc_alloc(MEMORY[0x24BDF6788]);
        v16 = (id)objc_msgSend(v5, "initWithName:target:selector:", v19, v30, sel__accessibilityPerformTrailingAction);
        objc_msgSend(v27, "addObject:", v16);
        objc_storeStrong(&v16, 0);
      }
      objc_storeStrong(&v19, 0);
    }
    v9 = (id)objc_msgSend(location, "previewActionItems");
    v10 = objc_msgSend(v9, "count") == 0;

    if (!v10)
    {
      v7 = objc_alloc(MEMORY[0x24BDF6788]);
      v8 = (id)UIKitAccessibilityLocalizedString();
      v15 = (id)objc_msgSend(v7, "initWithName:target:selector:");

      objc_msgSend(v27, "addObject:", v15);
      objc_storeStrong(&v15, 0);
    }
    v31 = v27;
    v28 = 1;
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  else
  {
    v31 = 0;
    v28 = 1;
  }
  objc_storeStrong(&location, 0);
  return v31;
}

- (BOOL)_preparePreviewViewControllerPresentationFromPreviewInteraction:(id)a3
{
  id v4;
  _UIPreviewInteractionControllerAccessibility *v5;
  objc_super v6;
  char v7;
  int v8;
  objc_super v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  _UIPreviewInteractionControllerAccessibility *v17;
  char v18;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = (id)-[_UIPreviewInteractionControllerAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("currentPreviewingContext"));
  v14 = (id)objc_msgSend(v15, "safeValueForKey:", CFSTR("sourceView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v12 = 0;
  objc_opt_class();
  v11 = (id)__UIAccessibilityCastAsClass();
  v10 = v11;
  objc_storeStrong(&v11, 0);
  v13 = v10;
  if ((objc_msgSend(v10, "isEditing") & 1) != 0)
  {
    v9.receiver = v17;
    v9.super_class = (Class)_UIPreviewInteractionControllerAccessibility;
    v18 = -[_UIPreviewInteractionControllerAccessibility _preparePreviewViewControllerPresentationFromPreviewInteraction:](&v9, sel__preparePreviewViewControllerPresentationFromPreviewInteraction_, location[0]);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(&v13, 0);
  if (!v8)
  {
LABEL_6:
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFA8], MEMORY[0x24BDBD1C8]);
    v7 = 0;
    v6.receiver = v17;
    v6.super_class = (Class)_UIPreviewInteractionControllerAccessibility;
    v7 = -[_UIPreviewInteractionControllerAccessibility _preparePreviewViewControllerPresentationFromPreviewInteraction:](&v6, sel__preparePreviewViewControllerPresentationFromPreviewInteraction_, location[0]);
    if (v7)
    {
      v4 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      objc_msgSend(v4, "addObserver:selector:name:object:", v17, sel__accessibilityDismissPresentation, CFSTR("accessibilityDismissActionSheet"));

      v5 = v17;
      AXPerformBlockOnMainThreadAfterDelay();
      objc_storeStrong((id *)&v5, 0);
    }
    else
    {
      UIAccessibilityPostNotification(*MEMORY[0x24BEBAFA8], MEMORY[0x24BDBD1C0]);
    }
    v18 = v7 & 1;
    v8 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (uint64_t)_axPerformPreviewAction:(void *)a1
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  int v20;
  id v21;
  char v22;

  v21 = a1;
  v20 = a2;
  if (a1)
  {
    v18 = 0;
    objc_opt_class();
    v4 = (id)objc_msgSend(v21, "safeValueForKey:", CFSTR("currentPresentationController"));
    v17 = (id)__UIAccessibilityCastAsClass();

    v16 = v17;
    objc_storeStrong(&v17, 0);
    v19 = v16;
    v15 = (id)objc_msgSend(v16, "presentedViewController");
    v12 = 0;
    v10 = 0;
    if (v20)
    {
      v11 = (id)objc_msgSend(v15, "trailingPreviewAction");
      v10 = 1;
      v2 = v11;
    }
    else
    {
      v13 = (id)objc_msgSend(v15, "leadingPreviewAction");
      v12 = 1;
      v2 = v13;
    }
    v14 = v2;
    if ((v10 & 1) != 0)

    if ((v12 & 1) != 0)
    v9 = (id)objc_msgSend(v14, "handler");
    if (v9)
    {
      v8 = v9;
      v5 = v14;
      v6 = v15;
      v7 = v21;
      AXPerformSafeBlock();
      v22 = 1;
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v6, 0);
      objc_storeStrong(&v5, 0);
      objc_storeStrong(&v8, 0);
    }
    else
    {
      v22 = 0;
    }
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v22 = 0;
  }
  return v22 & 1;
}

- (BOOL)_accessibilityPerformTrailingAction
{
  return -[_UIPreviewInteractionControllerAccessibility _axPerformPreviewAction:](self, 1) & 1;
}

- (BOOL)_accessibilityPerformLeadingAction
{
  return -[_UIPreviewInteractionControllerAccessibility _axPerformPreviewAction:](self, 0) & 1;
}

- (BOOL)_accessibilityShowMoreActions
{
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  _UIPreviewInteractionControllerAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFA0], 0);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __77___UIPreviewInteractionControllerAccessibility__accessibilityShowMoreActions__block_invoke;
  v7 = &unk_24FF3DA40;
  v8[0] = v9;
  AXPerformBlockOnMainThreadAfterDelay();
  objc_storeStrong(v8, 0);
  return 1;
}

- (void)_accessibilityDismissPresentation
{
  id v2;
  _UIPreviewInteractionControllerAccessibility *v3;
  id v4;
  id v5;
  char v6;
  SEL v7;
  _UIPreviewInteractionControllerAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  objc_opt_class();
  v2 = (id)-[_UIPreviewInteractionControllerAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("previewInteraction"));
  v5 = (id)__UIAccessibilityCastAsClass();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_msgSend(v4, "cancelInteraction");

  v3 = v8;
  AXPerformSafeBlock();
  -[_UIPreviewInteractionControllerAccessibility _accessibilityTeardownPresentationState]((uint64_t)v8);
  objc_storeStrong((id *)&v3, 0);
}

- (void)_accessibilityTeardownPresentationState
{
  id v1;

  if (a1)
  {
    v1 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v1, "removeObserver:name:object:", a1, CFSTR("accessibilityDismissActionSheet"), 0);

    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFA8], MEMORY[0x24BDBD1C0]);
  }
}

- (void)_dismissPreviewViewControllerIfNeededWithCompletion:(id)a3
{
  objc_super v3;
  id location[2];
  _UIPreviewInteractionControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIPreviewInteractionControllerAccessibility;
  -[_UIPreviewInteractionControllerAccessibility _dismissPreviewViewControllerIfNeededWithCompletion:](&v3, sel__dismissPreviewViewControllerIfNeededWithCompletion_, location[0]);
  -[_UIPreviewInteractionControllerAccessibility _accessibilityTeardownPresentationState]((uint64_t)v5);
  objc_storeStrong(location, 0);
}

- (void)commitInteractivePreview
{
  objc_super v2;
  SEL v3;
  _UIPreviewInteractionControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIPreviewInteractionControllerAccessibility;
  -[_UIPreviewInteractionControllerAccessibility commitInteractivePreview](&v2, sel_commitInteractivePreview);
  -[_UIPreviewInteractionControllerAccessibility _accessibilityTeardownPresentationState]((uint64_t)v4);
}

@end
