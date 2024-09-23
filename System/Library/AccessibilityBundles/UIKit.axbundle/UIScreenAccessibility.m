@implementation UIScreenAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIScreen");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIScreen");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("didUpdateFocusInContext: withAnimationCoordinator:"), v4, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_focusSystem"), v4, 0);
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_isFocusSystemLoaded"), 0);
  v6 = CFSTR("UIFocusSystem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_setEnabled:"), v7, v5, 0);
  objc_storeStrong(v9, v8);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  UIView *v9;
  id v10;
  id v12;
  BOOL v13;
  CGRect frame;
  id v15;
  BOOL v16;
  objc_super v17;
  id v18;
  id location[2];
  UIScreenAccessibility *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  objc_storeStrong(&v18, a4);
  v17.receiver = v20;
  v17.super_class = (Class)UIScreenAccessibility;
  -[UIScreenAccessibility didUpdateFocusInContext:withAnimationCoordinator:](&v17, sel_didUpdateFocusInContext_withAnimationCoordinator_, location[0], v18);
  v12 = (id)objc_msgSend(location[0], "previouslyFocusedItem");
  v4 = (id)objc_msgSend(location[0], "nextFocusedItem");
  v13 = v12 != v4;

  v16 = v13;
  if (v13)
  {
    v15 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityNativeFocusPreferredElement");
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB040], v15);
    v10 = (id)objc_msgSend(location[0], "nextFocusedView");
    objc_msgSend(v10, "bounds");
    frame.origin.x = v5;
    frame.origin.y = v6;
    frame.size.width = v7;
    frame.size.height = v8;
    v9 = (UIView *)(id)objc_msgSend(location[0], "nextFocusedView");
    UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)5, frame, v9);

    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityNativeFocusElement
{
  id v2;
  id v3;
  id v5;
  os_log_t oslog;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12[3];
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = (id)-[UIScreenAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_focusSystem"));
  v10 = 0;
  objc_opt_class();
  v9 = (id)__UIAccessibilityCastAsClass();
  v8 = v9;
  objc_storeStrong(&v9, 0);
  v11 = (id)objc_msgSend(v8, "focusedItem");

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = (id)objc_msgSend(v11, "_accessibilityUnderlyingElementForFocusItem");
    v3 = v11;
    v11 = v2;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (id)objc_msgSend(v12[0], "safeValueForKey:", CFSTR("_preferredFirstResponder"));
      oslog = (os_log_t)(id)AXLogUIA();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v13, (uint64_t)v11, (uint64_t)v7);
        _os_log_impl(&dword_230C4A000, oslog, OS_LOG_TYPE_INFO, "focused item is a first responder: %@. Preferred item is %@", v13, 0x16u);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (v7)
        objc_storeStrong(&v11, v7);
      objc_storeStrong(&v7, 0);
    }
  }
  v5 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  return v5;
}

- (id)_focusSystem
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  char v8;
  id v9;
  objc_super v10;
  id v11;
  char v12;
  SEL v13;
  UIScreenAccessibility *v14;

  v14 = self;
  v13 = a2;
  v12 = (-[UIScreenAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isFocusSystemLoaded")) ^ 1) & 1;
  v10.receiver = v14;
  v10.super_class = (Class)UIScreenAccessibility;
  v11 = -[UIScreenAccessibility _focusSystem](&v10, sel__focusSystem);
  if ((v12 & 1) != 0
    && (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0
    && (_UIApplicationIsExtension() & 1) != 0)
  {
    v8 = 0;
    objc_opt_class();
    v7 = (id)__UIAccessibilityCastAsClass();
    v6 = v7;
    objc_storeStrong(&v7, 0);
    v9 = v6;
    v5 = objc_msgSend(v6, "_userInterfaceIdiom");
    if (v5 != 3 && v5 != 2)
    {
      v4 = v11;
      AXPerformBlockOnMainThreadAfterDelay();
      objc_storeStrong(&v4, 0);
    }
    objc_storeStrong(&v9, 0);
  }
  v3 = v11;
  objc_storeStrong(&v11, 0);
  return v3;
}

void __37__UIScreenAccessibility__focusSystem__block_invoke(id *a1)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t (*v4)(uint64_t);
  void *v5;
  id v6[3];

  v6[2] = a1;
  v6[1] = a1;
  v1 = MEMORY[0x24BDAC760];
  v2 = -1073741824;
  v3 = 0;
  v4 = __37__UIScreenAccessibility__focusSystem__block_invoke_2;
  v5 = &unk_24FF3DA40;
  v6[0] = a1[4];
  AXPerformSafeBlock();
  objc_storeStrong(v6, 0);
}

uint64_t __37__UIScreenAccessibility__focusSystem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setEnabled:", 0, a1, a1);
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  BOOL v3;
  uint64_t v4;

  v4 = -[UIScreenAccessibility _userInterfaceIdiom](self, "_userInterfaceIdiom");
  v3 = 0;
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v3 = 0;
    if (v4 != 3)
      return v4 != 2;
  }
  return v3;
}

@end
