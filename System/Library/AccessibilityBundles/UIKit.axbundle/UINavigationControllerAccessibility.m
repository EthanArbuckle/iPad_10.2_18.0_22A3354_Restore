@implementation UINavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UINavigationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("navigationItem"), 0);
  v4 = CFSTR("UINavigationController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationItem"), CFSTR("_titleView"), v5, 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("transitionConductor:beginPinningInputViewsForTransitionFromViewController:toViewController:forTransitionType:"), v5, v5, v5, "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("transitionConductor:didEndTransitionFromView:toView:"), v3, v5, v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_isNestedNavigationController"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("navigationTransitionView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("disappearingViewController"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("topViewController"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  id v3;
  char v4;
  objc_super v5;
  SEL v6;
  UINavigationControllerAccessibility *v7;

  v7 = self;
  v6 = a2;
  v3 = (id)-[UINavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visibleViewController"));
  v4 = objc_msgSend(v3, "_accessibilityCanPerformEscapeAction");

  if ((v4 & 1) != 0)
    return 1;
  v5.receiver = v7;
  v5.super_class = (Class)UINavigationControllerAccessibility;
  return -[UINavigationControllerAccessibility _accessibilityCanPerformEscapeAction](&v5, sel__accessibilityCanPerformEscapeAction);
}

- (BOOL)accessibilityPerformEscape
{
  id v3;
  char v4;
  objc_super v5;
  SEL v6;
  UINavigationControllerAccessibility *v7;

  v7 = self;
  v6 = a2;
  v3 = (id)-[UINavigationControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visibleViewController"));
  v4 = objc_msgSend(v3, "accessibilityPerformEscape");

  if ((v4 & 1) != 0)
    return 1;
  v5.receiver = v7;
  v5.super_class = (Class)UINavigationControllerAccessibility;
  return -[UINavigationControllerAccessibility accessibilityPerformEscape](&v5, sel_accessibilityPerformEscape);
}

- (id)_accessibilitySpeakThisViewController
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  SEL v8;
  UINavigationControllerAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  objc_opt_class();
  v4 = (id)-[UINavigationControllerAccessibility topViewController](v9, "topViewController");
  v6 = (id)__UIAccessibilityCastAsSafeCategory();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  v3 = (id)objc_msgSend(v5, "_accessibilitySpeakThisViewController");

  return v3;
}

- (id)_accessibilityOutermostNavigationController
{
  id v1;
  id v2;
  id v4;
  id v5;
  id v6;

  v5 = a1;
  if (a1)
  {
    v4 = v5;
    while ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("_isNestedNavigationController")) & 1) != 0)
    {
      v1 = (id)objc_msgSend(v4, "navigationController");
      v2 = v4;
      v4 = v1;

    }
    v6 = v4;
    objc_storeStrong(&v4, 0);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)_accessibilityVoiceOverFocusIsInView:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *, _BYTE *);
  void *v8;
  id v9[2];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  int v16;
  id location;
  uint64_t v18;
  char v19;

  v18 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v18)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x20000000;
    v14 = 32;
    v15 = 0;
    if (UIAccessibilityIsVoiceOverRunning())
    {
      v10 = UIAccessibilityFocusedElement((UIAccessibilityAssistiveTechnologyIdentifier)*MEMORY[0x24BDF72D8]);
      v3 = v10;
      v4 = MEMORY[0x24BDAC760];
      v5 = -1073741824;
      v6 = 0;
      v7 = __76__UINavigationControllerAccessibility__accessibilityVoiceOverFocusIsInView___block_invoke;
      v8 = &unk_24FF3F0C8;
      v9[0] = location;
      v9[1] = &v11;
      objc_msgSend(v3, "accessibilityEnumerateAncestorsUsingBlock:", &v4);
      objc_storeStrong(v9, 0);
      objc_storeStrong(&v10, 0);
    }
    v19 = v12[3] & 1;
    v16 = 1;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v19 = 0;
    v16 = 1;
  }
  objc_storeStrong(&location, 0);
  return v19 & 1;
}

void __76__UINavigationControllerAccessibility__accessibilityVoiceOverFocusIsInView___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  objc_storeStrong(location, 0);
}

- (uint64_t)_accessibilityPostScreenChangeForAppearingView:(void *)a1
{
  void *v3;
  id v4;
  id v5;
  id argument;
  id v7;
  int v8;
  id location;
  void *v10;
  char v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v10)
  {
    v7 = (id)objc_msgSend(location, "_accessibilityElementToFocusForAppearanceScreenChange");
    if (v7)
    {
      v12[0] = *MEMORY[0x24BDFEF20];
      v13[0] = MEMORY[0x24BDBD1C8];
      v12[1] = *MEMORY[0x24BDFEF58];
      v3 = (void *)MEMORY[0x24BDD16E0];
      v5 = -[UINavigationControllerAccessibility _accessibilityOutermostNavigationController](v10);
      v4 = (id)objc_msgSend(v3, "numberWithUnsignedLongLong:");
      v13[1] = v4;
      v12[2] = *MEMORY[0x24BEBB038];
      v13[2] = v7;
      argument = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);

      UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], argument);
      v11 = 1;
      v8 = 1;
      objc_storeStrong(&argument, 0);
    }
    else
    {
      v11 = 0;
      v8 = 1;
    }
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v11 = 0;
    v8 = 1;
  }
  objc_storeStrong(&location, 0);
  return v11 & 1;
}

- (void)transitionConductor:(id)a3 beginPinningInputViewsForTransitionFromViewController:(id)a4 toViewController:(id)a5 forTransitionType:(int)a6
{
  id v6;
  NSObject *queue;
  id v8;
  BOOL v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(id *);
  void *v17;
  UINavigationControllerAccessibility *v18;
  objc_super v19;
  id v20;
  char v21;
  BOOL v22;
  unsigned int v23;
  id v24;
  id v25;
  id location[2];
  UINavigationControllerAccessibility *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = a6;
  v6 = (id)-[UINavigationControllerAccessibility safeValueForKey:](v27, "safeValueForKey:", CFSTR("navigationTransitionView"));
  v12 = v6 != 0;

  v22 = v12;
  v21 = 0;
  if (v12)
  {
    v8 = (id)-[UINavigationControllerAccessibility safeValueForKey:](v27, "safeValueForKey:", CFSTR("disappearingViewController"));
    v20 = (id)objc_msgSend(v8, "safeUIViewForKey:", CFSTR("view"));

    v21 = -[UINavigationControllerAccessibility _accessibilityVoiceOverFocusIsInView:]((uint64_t)v27, v20) & 1;
    objc_storeStrong(&v20, 0);
  }
  v19.receiver = v27;
  v19.super_class = (Class)UINavigationControllerAccessibility;
  -[UINavigationControllerAccessibility transitionConductor:beginPinningInputViewsForTransitionFromViewController:toViewController:forTransitionType:](&v19, sel_transitionConductor_beginPinningInputViewsForTransitionFromViewController_toViewController_forTransitionType_, location[0], v25, v24, v23);
  if (v22 && (v21 & 1) != 0)
  {
    queue = MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __148__UINavigationControllerAccessibility_transitionConductor_beginPinningInputViewsForTransitionFromViewController_toViewController_forTransitionType___block_invoke;
    v17 = &unk_24FF3DA40;
    v18 = v27;
    dispatch_async(queue, &v13);

    objc_storeStrong((id *)&v18, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

void __148__UINavigationControllerAccessibility_transitionConductor_beginPinningInputViewsForTransitionFromViewController_toViewController_forTransitionType___block_invoke(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = (id)objc_msgSend(a1[4], "safeValueForKey:", CFSTR("topViewController"));
  v2 = (id)objc_msgSend(v3[0], "safeValueForKey:", CFSTR("view"));
  -[UINavigationControllerAccessibility _accessibilityPostScreenChangeForAppearingView:](a1[4], v2);
  objc_storeStrong(&v2, 0);
  objc_storeStrong(v3, 0);
}

- (void)transitionConductor:(id)a3 didEndTransitionFromView:(id)a4 toView:(id)a5
{
  id v5;
  id v6;
  id v7;
  BOOL v10;
  id v11;
  char v12;
  char v13;
  id v14;
  BOOL v15;
  objc_super v16;
  id v17;
  id v18;
  id location[2];
  UINavigationControllerAccessibility *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17 = 0;
  objc_storeStrong(&v17, a5);
  v16.receiver = v20;
  v16.super_class = (Class)UINavigationControllerAccessibility;
  -[UINavigationControllerAccessibility transitionConductor:didEndTransitionFromView:toView:](&v16, sel_transitionConductor_didEndTransitionFromView_toView_, location[0], v18, v17);
  v5 = (id)-[UINavigationControllerAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("navigationTransitionView"));
  v10 = v5 != 0;

  v15 = v10;
  if (v17 && v15)
  {
    v7 = (id)-[UINavigationControllerAccessibility viewControllers](v20, "viewControllers");
    v14 = (id)objc_msgSend(v7, "lastObject");

    v13 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = objc_msgSend(v14, "_accessibilityHandleNavigationControllerDidEndTransition") & 1;
    if ((v13 & 1) == 0)
    {
      v12 = 0;
      if ((-[UINavigationControllerAccessibility _accessibilityVoiceOverFocusIsInView:]((uint64_t)v20, v18) & 1) != 0)
      {
        v6 = (id)objc_msgSend(v17, "_accessibilitySortedElementsWithin");
        v11 = (id)objc_msgSend(v6, "firstObject");

        v12 = -[UINavigationControllerAccessibility _accessibilityPostScreenChangeForAppearingView:](v20, v11) & 1;
        objc_storeStrong(&v11, 0);
      }
      if ((v12 & 1) == 0
        && (-[UINavigationControllerAccessibility _accessibilityVoiceOverFocusIsInView:]((uint64_t)v20, v17) & 1) == 0)
      {
        UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], (id)*MEMORY[0x24BDFEF20]);
      }
    }
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityNavigationControllerShouldSendScreenChange
{
  id v3;
  int v4;
  id v5;
  id v6;
  char v7;
  SEL v8;
  UINavigationControllerAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsClass();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v3 = (id)objc_msgSend(v5, "view");
  v4 = objc_msgSend(v3, "isHiddenOrHasHiddenAncestor") ^ 1;

  return v4 & 1;
}

@end
