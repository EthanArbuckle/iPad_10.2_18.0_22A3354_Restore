@implementation _UIContextMenuUIControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIContextMenuUIController");
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
  v5 = CFSTR("_UIContextMenuUIController");
  v4 = CFSTR("platterContainerView");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("presentationTransitionDidEnd"), 0);
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", v5, CFSTR("delegate"), v6);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("dismissalTransitionDidEnd"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_createMenuViewIfNecessaryForMenu:"), v3, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("menuConfiguration"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIFulfilledContextMenuConfiguration"), CFSTR("menu"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, v4, v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("menuView"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIContextMenuView"), CFSTR("currentListView"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (uint64_t)_axPerformEscape
{
  id v2;
  id v3;
  char v4;

  v3 = a1;
  if (a1)
  {
    v2 = v3;
    AXPerformSafeBlock();
    v4 = 1;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (id)platterContainerView
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(id *);
  void *v9;
  id v10;
  id location;
  objc_super v12;
  id v13[2];
  _UIContextMenuUIControllerAccessibility *v14;

  v14 = self;
  v13[1] = (id)a2;
  v12.receiver = self;
  v12.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  v13[0] = -[_UIContextMenuUIControllerAccessibility platterContainerView](&v12, sel_platterContainerView);
  objc_msgSend(v13[0], "setAccessibilityViewIsModal:", 1);
  objc_initWeak(&location, v14);
  v4 = v13[0];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __63___UIContextMenuUIControllerAccessibility_platterContainerView__block_invoke;
  v9 = &unk_24FF3DA88;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v4, "_setAccessibilityPerformEscapeBlock:", &v5);
  v3 = v13[0];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  objc_storeStrong(v13, 0);
  return v3;
}

- (void)presentationTransitionDidEnd
{
  id v2;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  _UIContextMenuUIControllerAccessibility *v8;
  objc_super v9;
  SEL v10;
  _UIContextMenuUIControllerAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  -[_UIContextMenuUIControllerAccessibility presentationTransitionDidEnd](&v9, sel_presentationTransitionDidEnd);
  v2 = (id)-[_UIContextMenuUIControllerAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("platterContainerView"));
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetContainerToStopVisibilityCheck:");

  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __71___UIContextMenuUIControllerAccessibility_presentationTransitionDidEnd__block_invoke;
  v7 = &unk_24FF3DA40;
  v8 = v11;
  AXPerformBlockOnMainThreadAfterDelay();
  MEMORY[0x2348C39BC](*MEMORY[0x24BDF7328]);
  objc_storeStrong((id *)&v8, 0);
}

- (void)dismissalTransitionDidEnd
{
  objc_super v2;
  SEL v3;
  _UIContextMenuUIControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  -[_UIContextMenuUIControllerAccessibility dismissalTransitionDidEnd](&v2, sel_dismissalTransitionDidEnd);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetContainerToStopVisibilityCheck:", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(id *);
  void *v13;
  id v14;
  id from;
  uint64_t v16;
  int v17;
  int v18;
  double (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;
  id v23;
  id v24;
  id v25;
  objc_super v26;
  SEL v27;
  _UIContextMenuUIControllerAccessibility *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v28 = self;
  v27 = a2;
  v26.receiver = self;
  v26.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  -[_UIContextMenuUIControllerAccessibility _accessibilityLoadAccessibilityInformation](&v26, sel__accessibilityLoadAccessibilityInformation);
  v8 = (id)-[_UIContextMenuUIControllerAccessibility safeValueForKey:](v28, "safeValueForKey:", CFSTR("menuConfiguration"));
  v25 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("menu"));

  v24 = (id)-[_UIContextMenuUIControllerAccessibility safeValueForKey:](v28, "safeValueForKey:", CFSTR("platterContainerView"));
  if (v24)
  {
    v7 = (id)objc_msgSend(v25, "accessibilityIdentifier");
    objc_msgSend(v24, "setAccessibilityIdentifier:");

    v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", v24);
    objc_initWeak(&location, v24);
    v6 = v23;
    v16 = MEMORY[0x24BDAC760];
    v17 = -1073741824;
    v18 = 0;
    v19 = __85___UIContextMenuUIControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v20 = &unk_24FF3DD28;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v6, "_setAccessibilityFrameBlock:", &v16);
    objc_msgSend(v23, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    v5 = accessibilityLocalizedString(CFSTR("context.menu.dismiss"));
    objc_msgSend(v23, "setAccessibilityLabel:");

    objc_msgSend(v23, "_accessibilitySetAdditionalElementOrderedLast:", 1);
    v4 = v24;
    v29[0] = v23;
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    objc_msgSend(v4, "_accessibilitySetAdditionalElements:");

    objc_msgSend(v23, "_accessibilitySetSortPriority:", -1);
    objc_initWeak(&from, v28);
    v2 = v23;
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __85___UIContextMenuUIControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v13 = &unk_24FF3DA88;
    objc_copyWeak(&v14, &from);
    objc_msgSend(v2, "_setAccessibilityActivateBlock:", &v9);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
}

- (void)_createMenuViewIfNecessaryForMenu:(id)a3
{
  objc_super v3;
  id location[2];
  _UIContextMenuUIControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)_UIContextMenuUIControllerAccessibility;
  -[_UIContextMenuUIControllerAccessibility _createMenuViewIfNecessaryForMenu:](&v3, sel__createMenuViewIfNecessaryForMenu_, location[0]);
  -[_UIContextMenuUIControllerAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");
  objc_storeStrong(location, 0);
}

@end
