@implementation UISearchBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISearchBar");
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
  v4 = CFSTR("UISearchBar");
  v6 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", "Q", 0);
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_searchFieldBeginEditing"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_searchFieldEndEditing"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISearchBarTextFieldAccessibility"), CFSTR("_accessibilityEditingModeChanged"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_viewForChildViews"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_visualProvider"), v6, 0);
  v5 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v4);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_viewControllerForAncestor"), v6, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UISearchBarVisualProviderBase"), CFSTR("searchField"), v6, 0);
  objc_storeStrong(v8, v7);
}

- (id)imageForSearchBarIcon:(int64_t)a3 state:(unint64_t)a4
{
  id v5;
  BOOL v6;
  objc_super v7;
  id location[2];
  unint64_t v9;
  SEL v10;
  UISearchBarAccessibility *v11;
  id v12;

  v11 = self;
  v10 = a2;
  v9 = a3;
  location[1] = (id)a4;
  v7.receiver = self;
  v7.super_class = (Class)UISearchBarAccessibility;
  location[0] = -[UISearchBarAccessibility imageForSearchBarIcon:state:](&v7, sel_imageForSearchBarIcon_state_, a3, a4);
  v5 = (id)objc_msgSend(location[0], "accessibilityLabel");
  v6 = objc_msgSend(v5, "length") == 0;

  if (v6 && v9 <= 3)
    __asm { BR              X8 }
  v12 = location[0];
  objc_storeStrong(location, 0);
  return v12;
}

- (id)_accessibilitySearchBarMaskView
{
  id location;
  id v3;
  id v4;

  v3 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("_viewForChildViews"));
    if (location == v3)
      objc_storeStrong(&location, 0);
    v4 = location;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  id v3;
  id v4;
  id v5;

  v4 = (id)-[UISearchBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v3 = (id)objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (id)objc_msgSend(v3, "allObjects");

  return v5;
}

- (id)_accessibilitySubviews
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  objc_super v8;
  id location;
  id v10[2];
  UISearchBarAccessibility *v11;

  v11 = self;
  v10[1] = (id)a2;
  v10[0] = 0;
  location = -[UISearchBarAccessibility _accessibilitySearchBarMaskView](self);
  if (location)
  {
    v2 = (id)objc_msgSend(location, "_accessibilitySubviews");
    v3 = v10[0];
    v10[0] = v2;

  }
  else
  {
    v8.receiver = v11;
    v8.super_class = (Class)UISearchBarAccessibility;
    v4 = -[UISearchBarAccessibility _accessibilitySubviews](&v8, sel__accessibilitySubviews);
    v5 = v10[0];
    v10[0] = v4;

  }
  v7 = v10[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v10, 0);
  return v7;
}

- (void)_searchFieldBeginEditing
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  UISearchBarAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UISearchBarAccessibility;
  -[UISearchBarAccessibility _searchFieldBeginEditing](&v5, sel__searchFieldBeginEditing);
  v2 = (id)-[UISearchBarAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_visualProvider"));
  v4 = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("searchField"));

  NSClassFromString(CFSTR("UISearchBarTextField"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;
    AXPerformSafeBlock();
    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong(&v4, 0);
}

uint64_t __52__UISearchBarAccessibility__searchFieldBeginEditing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityEditingModeChanged", a1, a1);
}

- (void)_searchFieldEndEditing
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  UISearchBarAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UISearchBarAccessibility;
  -[UISearchBarAccessibility _searchFieldEndEditing](&v5, sel__searchFieldEndEditing);
  v2 = (id)-[UISearchBarAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_visualProvider"));
  v4 = (id)objc_msgSend(v2, "safeValueForKey:", CFSTR("searchField"));

  NSClassFromString(CFSTR("UISearchBarTextField"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;
    AXPerformSafeBlock();
    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong(&v4, 0);
}

uint64_t __50__UISearchBarAccessibility__searchFieldEndEditing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityEditingModeChanged", a1, a1);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v5;
  char v6;
  BOOL v7;
  char v8;
  id v9;
  id v10;
  id v11;
  char v12;
  char v13;
  id v14;
  objc_super v15;
  id v16;
  int v17;
  id v18;
  id *v19;
  char v20;
  uint64_t v21;
  int v22;
  int v23;
  BOOL (*v24)(uint64_t);
  void *v25;
  UISearchBarAccessibility *v26;
  char v27;
  id location[2];
  UISearchBarAccessibility *v29;
  CGPoint v30;
  id v31;

  v30 = a3;
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v27 = -[UISearchBarAccessibility _accessibilityBoolValueForKey:](v29, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v20 = 0;
  v7 = 0;
  if (!v27)
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = -1073741824;
    v23 = 0;
    v24 = __60__UISearchBarAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v25 = &unk_24FF3E0C0;
    v26 = v29;
    v20 = 1;
    v19 = (id *)&v26;
    v7 = v24((uint64_t)&v21);
  }
  if (v7)
  {
    -[UISearchBarAccessibility _accessibilitySetBoolValue:forKey:](v29, "_accessibilitySetBoolValue:forKey:", 1);
    v18 = (id)-[UISearchBarAccessibility accessibilityHitTest:withEvent:](v29, "accessibilityHitTest:withEvent:", location[0], v30.x, v30.y);
    -[UISearchBarAccessibility _accessibilitySetBoolValue:forKey:](v29, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v31 = v18;
    v17 = 1;
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v17 = 0;
  }
  if ((v20 & 1) != 0)
    objc_storeStrong(v19, 0);
  if (!v17)
  {
    v15.receiver = v29;
    v15.super_class = (Class)UISearchBarAccessibility;
    v16 = -[UISearchBarAccessibility _accessibilityHitTest:withEvent:](&v15, sel__accessibilityHitTest_withEvent_, location[0], v30);
    v13 = 0;
    v8 = 0;
    if (!v16
      || (v5 = v16,
          v14 = -[UISearchBarAccessibility _accessibilitySearchBarMaskView](v29),
          v13 = 1,
          v6 = 0,
          v5 == v14))
    {
      v6 = 0;
      if ((objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) != 0)
      {
        v12 = 0;
        objc_opt_class();
        v11 = (id)__UIAccessibilityCastAsClass();
        v10 = v11;
        objc_storeStrong(&v11, 0);
        v9 = v10;
        v8 = 1;
        v6 = objc_msgSend(v10, "pointInside:withEvent:", location[0], v30.x, v30.y);
      }
    }
    if ((v8 & 1) != 0)

    if ((v13 & 1) != 0)
    if ((v6 & 1) != 0)
      objc_storeStrong(&v16, v29);
    v31 = v16;
    v17 = 1;
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(location, 0);
  return v31;
}

BOOL __60__UISearchBarAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&MACancelDownloadErrorDomain_block_invoke_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_31);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)MACancelDownloadErrorDomain_block_invoke_BaseImplementation_0;
}

void __60__UISearchBarAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    MACancelDownloadErrorDomain_block_invoke_BaseImplementation_0 = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UISearchBarAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISearchBarAccessibility;
  -[UISearchBarAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  objc_super v8;
  SEL v9;
  UISearchBarAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)UISearchBarAccessibility;
  -[UISearchBarAccessibility layoutSubviews](&v8, sel_layoutSubviews);
  v7 = 0;
  objc_opt_class();
  v4 = (id)-[UISearchBarAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("_viewControllerForAncestor"));
  v6 = (id)__UIAccessibilityCastAsClass();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  v3 = (id)objc_msgSend(v5, "navigationController");
  v2 = (id)objc_msgSend(v3, "navigationBar");
  objc_msgSend(v2, "_accessibility_navigationBarContentsDidChange");

}

- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForHoverText
{
  return 1;
}

- (BOOL)_accessibilityDisplayFocusIndicatorForHoverTextView
{
  return 1;
}

@end
