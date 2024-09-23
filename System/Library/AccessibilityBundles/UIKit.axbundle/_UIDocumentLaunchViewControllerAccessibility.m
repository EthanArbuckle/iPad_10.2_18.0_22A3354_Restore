@implementation _UIDocumentLaunchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDocumentLaunchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  const __CFString *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = CFSTR("_UIDocumentLaunchViewController");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v4 = CFSTR("UISheetPresentationController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIDocumentUnavailableBrowserPresentationController"));
  v3 = CFSTR("UIPresentationController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UISheetPresentationController"));
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPresentationController"), CFSTR("containerView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("selectedDetentIdentifier"), v5, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIRemoteView"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v6, CFSTR("_pageContainerView"), "UIView");
  objc_storeStrong(v8, v7);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  objc_super v20;
  SEL v21;
  _UIDocumentLaunchViewControllerAccessibility *v22;

  v22 = self;
  v21 = a2;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentLaunchViewControllerAccessibility;
  -[_UIDocumentLaunchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v20, sel__accessibilityLoadAccessibilityInformation);
  v19 = (id)-[_UIDocumentLaunchViewControllerAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("_pageContainerView"));
  objc_msgSend(v19, "_accessibilitySetSortPriority:", 1000);
  v4 = (id)-[_UIDocumentLaunchViewControllerAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("_browserPresentationController"));
  v3 = (id)objc_msgSend(v4, "safeUIViewForKey:", CFSTR("containerView"));
  v18 = (id)objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);

  v16 = 0;
  objc_opt_class();
  v6 = (id)objc_msgSend(v18, "accessibilityElements");
  v5 = (id)objc_msgSend(v6, "firstObject");
  v15 = (id)__UIAccessibilityCastAsClass();

  v14 = v15;
  objc_storeStrong(&v15, 0);
  v17 = v14;
  objc_initWeak(&v13, v22);
  v2 = v17;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __90___UIDocumentLaunchViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v11 = &unk_24FF3DA88;
  objc_copyWeak(&v12, &v13);
  objc_msgSend(v2, "_setAccessibilityRemoteElementShouldHitTestHostProcessBlock:", &v7);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v13);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
}

@end
