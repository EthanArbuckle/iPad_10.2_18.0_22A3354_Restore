@implementation UIStatusBarForegroundViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarForegroundView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  char v9;
  id v10;
  objc_super v11;
  char v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18[2];
  int v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  int v23;
  char v24;
  char v25;
  int i;
  uint64_t v27;
  char v28;
  BOOL v29;
  unsigned int v30;
  id location[2];
  UIStatusBarForegroundViewAccessibility *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = a4;
  v29 = a5;
  v28 = 0;
  v27 = -[UIStatusBarForegroundViewAccessibility safeIvarForKey:](v32, "safeIvarForKey:", CFSTR("_itemIsEnabled"));
  for (i = 0; i < 46; ++i)
  {
    v25 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x20000000;
    v23 = 32;
    v24 = 0;
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __77__UIStatusBarForegroundViewAccessibility__setStatusBarData_actions_animated___block_invoke;
    v17 = &unk_24FF3F360;
    v18[1] = &v20;
    v18[0] = location[0];
    v19 = i;
    AXPerformSafeBlock();
    v12 = v21[3] & 1;
    objc_storeStrong(v18, 0);
    _Block_object_dispose(&v20, 8);
    v25 = v12 & 1;
    if ((*(_BYTE *)(v27 + i) & 1) != (v12 & 1) && i != 32)
    {
      v28 = 1;
      break;
    }
  }
  v11.receiver = v32;
  v11.super_class = (Class)UIStatusBarForegroundViewAccessibility;
  -[UIStatusBarForegroundViewAccessibility _setStatusBarData:actions:animated:](&v11, sel__setStatusBarData_actions_animated_, location[0], v30, v29);
  v9 = 0;
  objc_opt_class();
  v8 = (id)__UIAccessibilityCastAsClass();
  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10 = v7;
  if ((v28 & 1) != 0 && (objc_msgSend(v10, "_accessibilityViewIsVisible") & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

uint64_t __77__UIStatusBarForegroundViewAccessibility__setStatusBarData_actions_animated___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isItemEnabled:", *(unsigned int *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result & 1;
  return result;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)-[UIStatusBarForegroundViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"), a2, self);
}

@end
