@implementation UIPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageViewController");
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
  v4 = CFSTR("UIPageViewController");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v5 = "B";
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPageViewController"), CFSTR("_viewControllerBefore: viewController:"), "B", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_pageControl"), v3, 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_setViewControllers: withScrollInDirection: animated: completion:"), v3, "q", v5, "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_pageControlValueChanged:"), v6, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPageControl"), CFSTR("_updateCurrentPageDisplayWithForceUpdate:"), v6, v5, 0);
  objc_storeStrong(v8, v7);
}

- (void)_accessibilitySendScrollStatus
{
  id v1;
  id v2;
  id v3;

  v3 = a1;
  if (a1)
  {
    if ((objc_msgSend(v3, "accessibilityScreenChangeOnScroll") & 1) != 0)
    {
      UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
    }
    else
    {
      v2 = (id)objc_msgSend(v3, "_accessibilityScrollStatus");
      v1 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v2);
      objc_msgSend(v1, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEF18]);
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], v1);
      objc_storeStrong(&v1, 0);
      objc_storeStrong(&v2, 0);
    }
  }
}

- (void)_pageControlValueChanged:(id)a3
{
  objc_super v3;
  id location[2];
  UIPageViewControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIPageViewControllerAccessibility;
  -[UIPageViewControllerAccessibility _pageControlValueChanged:](&v3, sel__pageControlValueChanged_, location[0]);
  -[UIPageViewControllerAccessibility _accessibilitySendScrollStatus](v5);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  char v14;
  id v15[2];
  UIPageViewControllerAccessibility *v16;
  id v17;

  v16 = self;
  v15[1] = (id)a2;
  v14 = 0;
  objc_opt_class();
  v7 = (id)-[UIPageViewControllerAccessibility safeValueForKey:](v16, "safeValueForKey:", CFSTR("_pageControl"));
  v13 = (id)__UIAccessibilityCastAsClass();

  v12 = v13;
  objc_storeStrong(&v13, 0);
  v15[0] = v12;
  if (v12)
  {
    v11 = objc_msgSend(v15[0], "currentPage");
    v10 = objc_msgSend(v15[0], "numberOfPages");
    v3 = (void *)MEMORY[0x24BDD17C8];
    v6 = accessibilityLocalizedString(CFSTR("scroll.page.summary"));
    v5 = (id)AXFormatInteger();
    v4 = (id)AXFormatInteger();
    v17 = (id)objc_msgSend(v3, "stringWithFormat:", v6, v5, v4);

  }
  else
  {
    v8.receiver = v16;
    v8.super_class = (Class)UIPageViewControllerAccessibility;
    v17 = -[UIPageViewControllerAccessibility _accessibilityScrollStatus](&v8, sel__accessibilityScrollStatus);
  }
  v9 = 1;
  objc_storeStrong(v15, 0);
  return v17;
}

- (uint64_t)_axScrollPageController:(void *)a1
{
  int v2;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  char v10;
  id v11[2];
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  int v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32[2];
  char v33;
  uint64_t v34;
  uint64_t *v35;
  int v36;
  int v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  id v41;
  id v42;
  unsigned __int8 v43;
  void *v44;
  char v45;

  v44 = a1;
  v43 = a2 & 1;
  if (a1)
  {
    v6 = (id)objc_msgSend(v44, "safeValueForKey:", CFSTR("_viewControllers"));
    v42 = (id)objc_msgSend(v6, "lastObject");

    v34 = 0;
    v35 = &v34;
    v36 = 838860800;
    v37 = 48;
    v38 = __Block_byref_object_copy__16;
    v39 = __Block_byref_object_dispose__16;
    v40 = 0;
    v26 = MEMORY[0x24BDAC760];
    v27 = -1073741824;
    v28 = 0;
    v29 = __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke;
    v30 = &unk_24FF3F0F0;
    v32[1] = &v34;
    v31 = v44;
    v33 = v43 & 1;
    v32[0] = v42;
    AXPerformSafeBlock();
    v25 = (id)v35[5];
    objc_storeStrong(v32, 0);
    objc_storeStrong(&v31, 0);
    _Block_object_dispose(&v34, 8);
    objc_storeStrong(&v40, 0);
    v41 = v25;
    if (v25)
    {
      v24 = (id)objc_msgSend(v44, "safeValueForKey:", CFSTR("_delegate"));
      v23 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v41);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v24, "pageViewController:willTransitionToViewControllers:", v44, v23);
      objc_initWeak(&v22, v44);
      v11[1] = (id)MEMORY[0x24BDAC760];
      v12 = -1073741824;
      v13 = 0;
      v14 = __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke_2;
      v15 = &unk_24FF3F140;
      v16 = v44;
      v17 = v23;
      v21 = v43 & 1;
      objc_copyWeak(&v20, &v22);
      v18 = v24;
      v19 = v42;
      AXPerformSafeBlock();
      v10 = 0;
      objc_opt_class();
      v5 = (id)objc_msgSend(v44, "safeValueForKey:", CFSTR("_pageControl"));
      v9 = (id)__UIAccessibilityCastAsClass();

      v8 = v9;
      objc_storeStrong(&v9, 0);
      v11[0] = v8;
      v4 = objc_msgSend(v8, "currentPage");
      if (((v43 ^ 1) & 1) != 0)
        v2 = 1;
      else
        v2 = -1;
      v7 = v4 + v2;
      if (v7 < 0)
        v7 = 0;
      objc_msgSend(v11[0], "setCurrentPage:", v7);
      objc_msgSend(v11[0], "_updateCurrentPageDisplayWithForceUpdate:", 1);
      -[UIPageViewControllerAccessibility _accessibilitySendScrollStatus](v44);
      v45 = 1;
      objc_storeStrong(v11, 0);
      objc_storeStrong(&v19, 0);
      objc_storeStrong(&v18, 0);
      objc_destroyWeak(&v20);
      objc_storeStrong(&v17, 0);
      objc_storeStrong(&v16, 0);
      objc_destroyWeak(&v22);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v24, 0);
    }
    else
    {
      v45 = 0;
    }
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
  }
  else
  {
    v45 = 0;
  }
  return v45 & 1;
}

void __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_viewControllerBefore:viewController:", *(_BYTE *)(a1 + 56) & 1, *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

void __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, char, char);
  void *v9;
  id v10;
  id v11;
  id v12[3];

  v12[2] = (id)a1;
  v12[1] = (id)a1;
  v4 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (*(_BYTE *)(a1 + 72) & 1) != 0;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke_3;
  v9 = &unk_24FF3F118;
  objc_copyWeak(v12, (id *)(a1 + 64));
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_setViewControllers:withScrollInDirection:animated:completion:", v2, v3, 0, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_destroyWeak(v12);
}

void __61__UIPageViewControllerAccessibility__axScrollPageController___block_invoke_3(id *a1, char a2, char a3)
{
  id v3;
  int v4;
  id v5;
  id v6;
  id *v7;
  id location[2];
  char v9;
  unsigned __int8 v10;
  id *v11;

  v7 = a1;
  v11 = a1;
  v10 = a2 & 1;
  v9 = a3 & 1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 6);
  if (location[0] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = v7[4];
    v3 = location[0];
    v4 = v10;
    v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v7[5], 0);
    objc_msgSend(v5, "pageViewController:didFinishAnimating:previousViewControllers:transitionCompleted:", v3, v4 & 1);

  }
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  objc_super v4;
  int64_t v5;
  SEL v6;
  UIPageViewControllerAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  if (a3 == 1)
    return -[UIPageViewControllerAccessibility _axScrollPageController:](v7, 1) & 1;
  if (v5 == 2)
    return -[UIPageViewControllerAccessibility _axScrollPageController:](v7, 0) & 1;
  v4.receiver = v7;
  v4.super_class = (Class)UIPageViewControllerAccessibility;
  return -[UIPageViewControllerAccessibility accessibilityScroll:](&v4, sel_accessibilityScroll_, v5);
}

@end
