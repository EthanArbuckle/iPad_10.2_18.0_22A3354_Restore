@implementation UIViewControllerAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  id location;
  objc_super v8;
  SEL v9;
  UIViewControllerAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  location = (id)-[UIViewControllerAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("contentScrollView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (id)-[UIViewControllerAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("_navigationControllerContentInsetAdjustment"));
    objc_msgSend(v6, "UIEdgeInsetsValue");
    objc_msgSend(location, "_accessibilitySetNavigationControllerInset:", v2, v3, v4, v5);

  }
  objc_storeStrong(&location, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  UIViewControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility viewDidLoad](&v2, sel_viewDidLoad);
  if ((-[UIViewControllerAccessibility _accessibilityDidLoadAccessibilityInformation]((uint64_t)v4) & 1) == 0)
  {
    -[UIViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
    -[UIViewControllerAccessibility _setAccessibilityDidLoadAccessibilityInformation:]((uint64_t)v4);
  }
}

- (uint64_t)_setAccessibilityDidLoadAccessibilityInformation:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (uint64_t)_accessibilityDidLoadAccessibilityInformation
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  unsigned __int8 v3;
  UIViewControllerAccessibility *v4;
  id argument;
  os_log_type_t type;
  os_log_t oslog;
  objc_super v8;
  BOOL v9;
  SEL v10;
  UIViewControllerAccessibility *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  oslog = (os_log_t)(id)AXLogUIA();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    v4 = v11;
    v3 = _AXSAutomationEnabled();
    __os_log_helper_16_2_2_8_64_4_0((uint64_t)v12, (uint64_t)v4, v3);
    _os_log_debug_impl(&dword_230C4A000, oslog, type, "View did appear: %@ %d", v12, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (_AXSAutomationEnabled())
  {
    argument = -[UIViewControllerAccessibility _accessibilityUserTestingViewControllerInfo](v11);
    objc_msgSend(argument, "setObject:forKeyedSubscript:", CFSTR("ViewDidAppear"), CFSTR("event"));
    UIAccessibilityPostNotification(0xFA2u, argument);
    objc_storeStrong(&argument, 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  unsigned __int8 v3;
  UIViewControllerAccessibility *v4;
  id argument;
  os_log_type_t type;
  os_log_t oslog;
  objc_super v8;
  BOOL v9;
  SEL v10;
  UIViewControllerAccessibility *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  oslog = (os_log_t)(id)AXLogUIA();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    v4 = v11;
    v3 = _AXSAutomationEnabled();
    __os_log_helper_16_2_2_8_64_4_0((uint64_t)v12, (uint64_t)v4, v3);
    _os_log_debug_impl(&dword_230C4A000, oslog, type, "View did disappear: %@ %d", v12, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (_AXSAutomationEnabled())
  {
    argument = -[UIViewControllerAccessibility _accessibilityUserTestingViewControllerInfo](v11);
    objc_msgSend(argument, "setObject:forKeyedSubscript:", CFSTR("ViewDidDisappear"), CFSTR("event"));
    UIAccessibilityPostNotification(0xFA2u, argument);
    objc_storeStrong(&argument, 0);
  }
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const __CFString *v8;
  const char *v9;
  id v10;
  id *v11;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = CFSTR("UIViewController");
  v9 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_existingTabBarItem"), v9, 0);
  v3 = "i";
  v6 = "@?";
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("presentViewController: withTransition: completion:"), v9, "i", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("dismissViewControllerWithTransition: completion:"), v7, v3, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("presentingViewController"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("modalPresentationStyle"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("popoverPresentationController"), v9, 0);
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("presentViewController: animated: completion:"), v7, v9, "B", v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("dismissViewControllerAnimated: completion:"), v7, v4, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("performSegueWithIdentifier: sender:"), v7, v9, v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("setEditing: animated:"), v7, v4, v4, 0);
  v5 = "{UIEdgeInsets=dddd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_primitiveSetNavigationControllerContentInsetAdjustment:"), v7, "{UIEdgeInsets=dddd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_setNavigationControllerContentInsetAdjustment:"), v7, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_presentViewController:modalSourceViewController:presentationController:animationController:interactionController:handoffData:completion:"), v7, v9, v9, v9, v9, v9, v9, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("contentScrollView"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_overridingPreferredFocusEnvironment"), v9, 0);
  objc_storeStrong(v11, v10);
}

- (BOOL)accessibilityPostScreenChangedForChildViewController:(id)a3 isAddition:(BOOL)a4
{
  char v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_msgSend(location[0], "_accessibilityShouldPostScreenChangedOnPresentation");
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)_accessibilityShouldPostScreenChangedOnPresentation
{
  return 1;
}

- (void)_primitiveSetNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3
{
  id location;
  objc_super v4;
  SEL v5;
  UIViewControllerAccessibility *v6;
  UIEdgeInsets v7;

  v7 = a3;
  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility _primitiveSetNavigationControllerContentInsetAdjustment:](&v4, sel__primitiveSetNavigationControllerContentInsetAdjustment_, a3.top, a3.left, a3.bottom, a3.right);
  location = (id)-[UIViewControllerAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("contentScrollView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(location, "_accessibilitySetNavigationControllerInset:", v7.top, v7.left, v7.bottom, v7.right);
  objc_storeStrong(&location, 0);
}

- (void)_setNavigationControllerContentInsetAdjustment:(UIEdgeInsets)a3
{
  id location;
  objc_super v4;
  SEL v5;
  UIViewControllerAccessibility *v6;
  UIEdgeInsets v7;

  v7 = a3;
  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility _setNavigationControllerContentInsetAdjustment:](&v4, sel__setNavigationControllerContentInsetAdjustment_, a3.top, a3.left, a3.bottom, a3.right);
  location = (id)-[UIViewControllerAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("contentScrollView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(location, "_accessibilitySetNavigationControllerInset:", v7.top, v7.left, v7.bottom, v7.right);
  objc_storeStrong(&location, 0);
}

- (void)setAccessibilityLabel:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UIViewControllerAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility setAccessibilityLabel:](&v5, sel_setAccessibilityLabel_, location[0]);
  v3 = (id)-[UIViewControllerAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_existingNavigationItem"));
  objc_msgSend(v3, "setAccessibilityLabel:", location[0]);

  v4 = (id)-[UIViewControllerAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_existingTabBarItem"));
  objc_msgSend(v4, "setAccessibilityLabel:", location[0]);

  objc_storeStrong(location, 0);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_super v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  BOOL v22;
  id location[2];
  UIViewControllerAccessibility *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  if ((objc_msgSend(location[0], "_accessibilityPresentsAsPopup") & 1) != 0)
    objc_storeStrong(&v20, (id)*MEMORY[0x24BDFEF50]);
  if (-[UIViewControllerAccessibility accessibilityPostScreenChangedForChildViewController:isAddition:](v24, "accessibilityPostScreenChangedForChildViewController:isAddition:", location[0], 1))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB098], v20);
  }
  objc_initWeak(&v19, v24);
  objc_initWeak(&v18, location[0]);
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __75__UIViewControllerAccessibility_presentViewController_animated_completion___block_invoke;
  v12 = &unk_24FF3FFC8;
  objc_copyWeak(&v15, &v18);
  v14 = v21;
  objc_copyWeak(&v16, &v19);
  v13 = v20;
  v17 = (id)MEMORY[0x2348C3D88](&v8);
  v7.receiver = v24;
  v7.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility presentViewController:animated:completion:](&v7, sel_presentViewController_animated_completion_, location[0], v22, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v13, 0);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v14, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v19);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __75__UIViewControllerAccessibility_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  int v3;
  id v4;
  id WeakRetained;
  char v7;
  id v8;
  char v9;
  id v10;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = (id)objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("view"));
    objc_msgSend(v4, "setAccessibilityViewIsModal:", 1);

  }
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v1 = objc_loadWeakRetained((id *)(a1 + 56));
  v2 = objc_loadWeakRetained((id *)(a1 + 48));
  v9 = 0;
  v7 = 0;
  LOBYTE(v3) = 0;
  if ((objc_msgSend(v1, "accessibilityPostScreenChangedForChildViewController:isAddition:") & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = 1;
    v8 = (id)objc_msgSend(v10, "view");
    v7 = 1;
    v3 = objc_msgSend(v8, "accessibilityElementsHidden") ^ 1;
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if ((v3 & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], *(id *)(a1 + 32));
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  id v4;
  objc_super v5;
  id v6;
  id location;
  BOOL v8;
  SEL v9;
  UIViewControllerAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v6 = (id)-[UIViewControllerAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("presentedViewController"));
  v5.receiver = v10;
  v5.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility dismissViewControllerAnimated:completion:](&v5, sel_dismissViewControllerAnimated_completion_, v8, location);
  v4 = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("view"));
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

  objc_storeStrong(&v6, 0);
  objc_storeStrong(&location, 0);
}

- (void)presentViewController:(id)a3 withTransition:(int)a4 completion:(id)a5
{
  objc_super v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  UIViewControllerAccessibility *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  unsigned int v20;
  id location[2];
  UIViewControllerAccessibility *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = 0;
  if ((objc_msgSend(location[0], "_accessibilityPresentsAsPopup") & 1) != 0)
    objc_storeStrong(&v18, (id)*MEMORY[0x24BDFEF50]);
  if (-[UIViewControllerAccessibility accessibilityPostScreenChangedForChildViewController:isAddition:](v22, "accessibilityPostScreenChangedForChildViewController:isAddition:", location[0], 1))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB098], v18);
  }
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __81__UIViewControllerAccessibility_presentViewController_withTransition_completion___block_invoke;
  v12 = &unk_24FF3FFF0;
  v13 = location[0];
  v16 = v19;
  v14 = v22;
  v15 = v18;
  v17 = (id)MEMORY[0x2348C3D88](&v8);
  v7.receiver = v22;
  v7.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility presentViewController:withTransition:completion:](&v7, sel_presentViewController_withTransition_completion_, location[0], v20, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

void __81__UIViewControllerAccessibility_presentViewController_withTransition_completion___block_invoke(uint64_t a1)
{
  id v1;

  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    v1 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
    objc_msgSend(v1, "setAccessibilityViewIsModal:", 1);

  }
  if (*(_QWORD *)(a1 + 56))
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if ((objc_msgSend(*(id *)(a1 + 40), "accessibilityPostScreenChangedForChildViewController:isAddition:", *(_QWORD *)(a1 + 32), 1) & 1) != 0)UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], *(id *)(a1 + 48));
}

- (void)dismissViewControllerWithTransition:(int)a3 completion:(id)a4
{
  id v4;
  id v5;
  UIViewControllerAccessibility *v6;
  unsigned int v7;
  char v8;
  UIViewControllerAccessibility *v9;
  id v10;
  char v11;
  char v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;
  objc_super v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id v30;
  char v31;
  char v32;
  id v33;
  char v34;
  id from;
  id location;
  unsigned int v37;
  SEL v38;
  UIViewControllerAccessibility *v39;

  v39 = self;
  v38 = a2;
  v37 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v14 = (id)-[UIViewControllerAccessibility safeValueForKey:](v39, "safeValueForKey:", CFSTR("presentedViewController"));
  objc_initWeak(&from, v14);

  v34 = 0;
  v15 = objc_loadWeakRetained(&from);
  v32 = 0;
  v27 = 0;
  v25 = 0;
  v13 = (id)objc_msgSend(v15, "safeValueForKey:", CFSTR("view"));
  v12 = 1;
  if ((objc_msgSend(v13, "accessibilityElementsHidden") & 1) == 0)
  {
    v33 = objc_loadWeakRetained(&from);
    v32 = 1;
    v11 = 0;
    if (!v33)
    {
      v31 = 0;
      objc_opt_class();
      v30 = (id)__UIAccessibilityCastAsClass();
      v29 = v30;
      objc_storeStrong(&v30, 0);
      v28 = v29;
      v27 = 1;
      v26 = (id)objc_msgSend(v29, "view");
      v25 = 1;
      v11 = objc_msgSend(v26, "accessibilityElementsHidden");
    }
    v12 = v11;
  }
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  if ((v32 & 1) != 0)

  v34 = v12 & 1;
  v9 = v39;
  v10 = objc_loadWeakRetained(&from);
  v8 = 0;
  if (-[UIViewControllerAccessibility accessibilityPostScreenChangedForChildViewController:isAddition:](v9, "accessibilityPostScreenChangedForChildViewController:isAddition:"))
  {
    v8 = v34 ^ 1;
  }

  if ((v8 & 1) != 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB098], 0);
    v6 = v39;
    v7 = v37;
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __80__UIViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke;
    v22 = &unk_24FF40018;
    objc_copyWeak(&v24, &from);
    v23 = location;
    v17.receiver = v6;
    v17.super_class = (Class)UIViewControllerAccessibility;
    -[UIViewControllerAccessibility dismissViewControllerWithTransition:completion:](&v17, sel_dismissViewControllerWithTransition_completion_, v7, &v18);
    objc_storeStrong(&v23, 0);
    objc_destroyWeak(&v24);
  }
  else
  {
    v16.receiver = v39;
    v16.super_class = (Class)UIViewControllerAccessibility;
    -[UIViewControllerAccessibility dismissViewControllerWithTransition:completion:](&v16, sel_dismissViewControllerWithTransition_completion_, v37, location);
    v5 = objc_loadWeakRetained(&from);
    v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("view"));
    objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

  }
  objc_destroyWeak(&from);
  objc_storeStrong(&location, 0);
}

uint64_t __80__UIViewControllerAccessibility_dismissViewControllerWithTransition_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (id)objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("view"));
  objc_msgSend(v2, "setAccessibilityViewIsModal:", 0);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  result = a1;
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (void)_presentViewController:(id)a3 modalSourceViewController:(id)a4 presentationController:(id)a5 animationController:(id)a6 interactionController:(id)a7 handoffData:(id)a8 completion:(id)a9
{
  UIViewControllerAccessibility *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location[2];
  UIViewControllerAccessibility *v37;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  v34 = 0;
  objc_storeStrong(&v34, a5);
  v33 = 0;
  objc_storeStrong(&v33, a6);
  v32 = 0;
  objc_storeStrong(&v32, a7);
  v31 = 0;
  objc_storeStrong(&v31, a8);
  v30 = 0;
  objc_storeStrong(&v30, a9);
  if (-[UIViewControllerAccessibility accessibilityPostScreenChangedForChildViewController:isAddition:](v37, "accessibilityPostScreenChangedForChildViewController:isAddition:", location[0], 0))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB098], 0);
  }
  objc_initWeak(&v29, v34);
  v9 = v37;
  v10 = location[0];
  v11 = v35;
  v12 = v34;
  v13 = v33;
  v14 = v32;
  v15 = v31;
  v22 = MEMORY[0x24BDAC760];
  v23 = -1073741824;
  v24 = 0;
  v25 = __170__UIViewControllerAccessibility__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion___block_invoke;
  v26 = &unk_24FF40040;
  objc_copyWeak(&v28, &v29);
  v27 = v30;
  v21.receiver = v9;
  v21.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility _presentViewController:modalSourceViewController:presentationController:animationController:interactionController:handoffData:completion:](&v21, sel__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion_, v10, v11, v12, v13, v14, v15, &v22);
  objc_storeStrong(&v27, 0);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v29);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

uint64_t __170__UIViewControllerAccessibility__presentViewController_modalSourceViewController_presentationController_animationController_interactionController_handoffData_completion___block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v1 = (id)objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_accessibilityModalizePresentationView"));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  objc_super v10;
  int v11;
  _QWORD __b[8];
  id v13;
  id location;
  int64_t v15;
  SEL v16;
  UIViewControllerAccessibility *v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  if (a3 != 2 && v15 != 1)
    goto LABEL_15;
  location = (id)-[UIViewControllerAccessibility childViewControllers](v17, "childViewControllers");
  memset(__b, 0, sizeof(__b));
  obj = location;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v13 = *(id *)(__b[1] + 8 * v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v19, 16);
        if (!v7)
          goto LABEL_11;
      }
    }
    v18 = objc_msgSend(v13, "accessibilityScroll:", v15) & 1;
    v11 = 1;
  }
  else
  {
LABEL_11:
    v11 = 0;
  }

  if (!v11)
    v11 = 0;
  objc_storeStrong(&location, 0);
  if (!v11)
  {
LABEL_15:
    v10.receiver = v17;
    v10.super_class = (Class)UIViewControllerAccessibility;
    v18 = -[UIViewControllerAccessibility accessibilityScroll:](&v10, sel_accessibilityScroll_, v15);
  }
  return v18 & 1;
}

- (void)performSegueWithIdentifier:(id)a3 sender:(id)a4
{
  objc_super v5;
  id v6;
  id location[2];
  UIViewControllerAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB098], 0);
  v5.receiver = v8;
  v5.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility performSegueWithIdentifier:sender:](&v5, sel_performSegueWithIdentifier_sender_, location[0], v6);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;
  BOOL v5;
  BOOL v6;
  SEL v7;
  UIViewControllerAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)UIViewControllerAccessibility;
  -[UIViewControllerAccessibility setEditing:animated:](&v4, sel_setEditing_animated_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_accessibilityPresentsAsPopup
{
  BOOL v3;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("popoverPresentationController"));
  v3 = location[0] != 0;
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_accessibilitySpeakThisViewController
{
  id v3;
  id v4;
  id location[2];
  UIViewControllerAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  v4 = (id)-[UIViewControllerAccessibility presentedViewController](self, "presentedViewController");
  location[0] = (id)objc_msgSend(v4, "_accessibilitySpeakThisViewController");

  if (!location[0])
    objc_storeStrong(location, v6);
  v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_accessibilitySpeakThisViews
{
  id v2;
  id v3;
  id v5;
  id location;
  id v7[3];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v7[2] = self;
  v7[1] = (id)a2;
  v7[0] = 0;
  location = -[UIViewControllerAccessibility _accessibilitySpeakThisView](self, "_accessibilitySpeakThisView");
  if (location)
  {
    v8[0] = location;
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v3 = v7[0];
    v7[0] = v2;

  }
  v5 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v5;
}

- (id)_accessibilitySpeakThisView
{
  return (id)-[UIViewControllerAccessibility view](self, "view", a2, self);
}

- (id)_accessibilityUserTestingViewControllerInfo
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  id v6;
  BOOL v7;
  id v8;
  BOOL v9;
  id v10;
  id v11;
  id v12;
  NSString *v13;
  BOOL v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v24 = a1;
  if (a1)
  {
    v23 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v1 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v1);
    objc_msgSend(v23, "setObject:forKeyedSubscript:");

    v2 = (id)objc_msgSend(v24, "title");
    v14 = v2 == 0;

    if (!v14)
    {
      v12 = (id)objc_msgSend(v24, "title");
      objc_msgSend(v23, "setObject:forKeyedSubscript:");

    }
    v21 = 0;
    objc_opt_class();
    v11 = (id)objc_msgSend(v24, "safeValueForKey:", CFSTR("_existingTabBarItem"));
    v20 = (id)__UIAccessibilityCastAsClass();

    v19 = v20;
    objc_storeStrong(&v20, 0);
    v22 = v19;
    v17 = 0;
    objc_opt_class();
    v10 = (id)objc_msgSend(v24, "safeValueForKey:", CFSTR("_existingNavigationItem"));
    v16 = (id)__UIAccessibilityCastAsClass();

    v15 = v16;
    objc_storeStrong(&v16, 0);
    v18 = v15;
    v3 = (id)objc_msgSend(v15, "title");
    v9 = v3 == 0;

    if (v9)
    {
      v4 = (id)objc_msgSend(v22, "title");
      v7 = v4 == 0;

      if (!v7)
      {
        v6 = (id)objc_msgSend(v22, "title");
        objc_msgSend(v23, "setObject:forKeyedSubscript:");

      }
    }
    else
    {
      v8 = (id)objc_msgSend(v18, "title");
      objc_msgSend(v23, "setObject:forKeyedSubscript:");

    }
    v25 = v23;
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  else
  {
    v25 = 0;
  }
  return v25;
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id obj;
  uint64_t v11;
  _QWORD __b[8];
  id v13;
  id v14[2];
  UIViewControllerAccessibility *v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = -[UIViewControllerAccessibility _accessibilitySpeakThisViews](v15, "_accessibilitySpeakThisViews");
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
  if (v11)
  {
    v7 = *(_QWORD *)__b[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)__b[2] != v7)
        objc_enumerationMutation(obj);
      v13 = *(id *)(__b[1] + 8 * v8);
      v4 = v14[0];
      v5 = (id)objc_msgSend(v13, "_accessibilitySpeakThisElementsAndStrings");
      objc_msgSend(v4, "addObjectsFromArray:");

      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
        if (!v9)
          break;
      }
    }
  }

  v3 = v14[0];
  objc_storeStrong(v14, 0);
  return v3;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  id v3;
  char v4;

  v3 = (id)-[UIViewControllerAccessibility view](self, "view");
  v4 = objc_msgSend(v3, "_accessibilityIsFKARunningForFocusItem");

  return v4 & 1;
}

- (id)_overridingPreferredFocusEnvironment
{
  id v3;
  id v4;
  id v5;
  char v6;
  char v7;
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  objc_super v16;
  id v17[2];
  UIViewControllerAccessibility *v18;

  v18 = self;
  v17[1] = (id)a2;
  v16.receiver = self;
  v16.super_class = (Class)UIViewControllerAccessibility;
  v17[0] = -[UIViewControllerAccessibility _overridingPreferredFocusEnvironment](&v16, sel__overridingPreferredFocusEnvironment);
  if (v17[0]
    && -[UIViewControllerAccessibility _accessibilityIsFKARunningForFocusItem](v18, "_accessibilityIsFKARunningForFocusItem"))
  {
    v15 = (id)-[UIViewControllerAccessibility presentedViewController](v18, "presentedViewController");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = 0;
      objc_opt_class();
      v12 = (id)__UIAccessibilityCastAsClass();
      v11 = v12;
      objc_storeStrong(&v12, 0);
      v14 = v11;
      v4 = (id)objc_msgSend(v11, "searchResultsController");
      v5 = (id)objc_msgSend(v4, "view");
      v9 = 0;
      v7 = 0;
      v6 = 0;
      if (v5)
      {
        v10 = (id)objc_msgSend(v14, "searchResultsController");
        v9 = 1;
        v8 = (id)objc_msgSend(v10, "view");
        v7 = 1;
        v6 = objc_msgSend(v8, "isHidden");
      }
      if ((v7 & 1) != 0)

      if ((v9 & 1) != 0)
      if ((v6 & 1) != 0)
        objc_storeStrong(v17, 0);
      objc_storeStrong(&v14, 0);
    }
    objc_storeStrong(&v15, 0);
  }
  v3 = v17[0];
  objc_storeStrong(v17, 0);
  return v3;
}

- (BOOL)_accessibilityPresentedControllerModalizes
{
  return 0;
}

@end
