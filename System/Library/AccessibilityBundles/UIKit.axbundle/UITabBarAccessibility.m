@implementation UITabBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITabBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITabBar"), CFSTR("_items"), "NSArray");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITabBarItem"), CFSTR("_view"), "UITabBarButton");
  objc_storeStrong(location, 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 22;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  _QWORD __b[9];
  id v19;
  id v20;
  char v21;
  id v22;
  objc_super v23;
  SEL v24;
  UITabBarAccessibility *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)UITabBarAccessibility;
  -[UITabBarAccessibility _accessibilityLoadAccessibilityInformation](&v23, sel__accessibilityLoadAccessibilityInformation);
  v21 = 0;
  objc_opt_class();
  v9 = (id)-[UITabBarAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_items"));
  v20 = (id)__UIAccessibilityCastAsClass();

  v19 = v20;
  objc_storeStrong(&v20, 0);
  v22 = v19;
  memset(__b, 0, 0x40uLL);
  obj = v19;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      __b[8] = *(_QWORD *)(__b[1] + 8 * v5);
      v16 = 0;
      objc_opt_class();
      v15 = (id)__UIAccessibilityCastAsClass();
      if ((v16 & 1) != 0)
        abort();
      v14 = v15;
      objc_storeStrong(&v15, 0);
      v17 = v14;
      v12 = 0;
      objc_opt_class();
      v2 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("_view"));
      v11 = (id)__UIAccessibilityCastAsClass();

      if ((v12 & 1) != 0)
        abort();
      v10 = v11;
      objc_storeStrong(&v11, 0);
      v13 = v10;
      if (v17 && v13)
        AXApplyTabBarItemPropertiesToView(v17, v13);
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v17, 0);
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
        if (!v6)
          break;
      }
    }
  }

  objc_storeStrong(&v22, 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityFuzzyHitTestElements
{
  return (id)-[UITabBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"), a2, self);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  BOOL v5;
  objc_super v6;
  objc_super v7;
  id v8;
  int v9;
  id v10;
  id *v11;
  char v12;
  uint64_t v13;
  int v14;
  int v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  UITabBarAccessibility *v18;
  char v19;
  id location[2];
  UITabBarAccessibility *v21;
  CGPoint v22;
  id v23;

  v22 = a3;
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v19 = -[UITabBarAccessibility _accessibilityBoolValueForKey:](v21, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v12 = 0;
  v5 = 0;
  if (!v19)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __57__UITabBarAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v17 = &unk_24FF3E0C0;
    v18 = v21;
    v12 = 1;
    v11 = (id *)&v18;
    v5 = v16((uint64_t)&v13);
  }
  if (v5)
  {
    -[UITabBarAccessibility _accessibilitySetBoolValue:forKey:](v21, "_accessibilitySetBoolValue:forKey:", 1);
    v10 = (id)-[UITabBarAccessibility accessibilityHitTest:withEvent:](v21, "accessibilityHitTest:withEvent:", location[0], v22.x, v22.y);
    -[UITabBarAccessibility _accessibilitySetBoolValue:forKey:](v21, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v23 = v10;
    v9 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v9 = 0;
  }
  if ((v12 & 1) != 0)
    objc_storeStrong(v11, 0);
  if (!v9)
  {
    v8 = (id)-[UITabBarAccessibility safeValueForKey:](v21, "safeValueForKey:", CFSTR("_customizeView"));
    if (v8)
    {
      if ((-[UITabBarAccessibility pointInside:withEvent:](v21, "pointInside:withEvent:", location[0], v22.x, v22.y) & 1) != 0)
      {
        v7.receiver = v21;
        v7.super_class = (Class)UITabBarAccessibility;
        v23 = -[UITabBarAccessibility _accessibilityHitTest:withEvent:](&v7, sel__accessibilityHitTest_withEvent_, location[0], v22.x, v22.y);
      }
      else
      {
        v23 = 0;
      }
      v9 = 1;
    }
    else
    {
      v6.receiver = v21;
      v6.super_class = (Class)UITabBarAccessibility;
      v23 = -[UITabBarAccessibility _accessibilityHitTest:withEvent:](&v6, sel__accessibilityHitTest_withEvent_, location[0], v22.x, v22.y);
      v9 = 1;
    }
    objc_storeStrong(&v8, 0);
  }
  objc_storeStrong(location, 0);
  return v23;
}

BOOL __57__UITabBarAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_2_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_364);
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
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_2_BaseImplementation_0;
}

void __57__UITabBarAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
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
    UIKBEmojiZeroWidthJoiner_block_invoke_2_BaseImplementation_0 = (uint64_t)method_getImplementation(InstanceMethod);
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

- (void)_dismissCustomizeSheet:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  UITabBarAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UITabBarAccessibility;
  -[UITabBarAccessibility _dismissCustomizeSheet:](&v3, sel__dismissCustomizeSheet_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)beginCustomizingItems:(id)a3
{
  objc_super v3;
  id location[2];
  UITabBarAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITabBarAccessibility;
  -[UITabBarAccessibility beginCustomizingItems:](&v3, sel_beginCustomizingItems_, location[0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id location[3];
  id v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITabBarAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (location[0])
    v4 = location[0];
  else
    v4 = accessibilityLocalizedString(CFSTR("tab.bar.label"));
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  char v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = objc_msgSend(location[0], "isEqual:", *MEMORY[0x24BDF76A0]);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

@end
