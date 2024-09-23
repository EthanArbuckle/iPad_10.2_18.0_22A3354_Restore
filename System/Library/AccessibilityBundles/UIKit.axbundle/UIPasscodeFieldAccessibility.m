@implementation UIPasscodeFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPasscodeField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setShowsOKButton:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  UIPasscodeFieldAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UIPasscodeFieldAccessibility;
  -[UIPasscodeFieldAccessibility setShowsOKButton:](&v3, sel_setShowsOKButton_, a3);
  -[UIPasscodeFieldAccessibility _accessibilityRemoveValueForKey:](v6, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_accessibilityChildren
{
  id v2;
  id v3;
  id v4;
  char v5;
  void *v6;
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  double (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id location;
  id v16;
  id v17;
  id v18;

  v17 = a1;
  if (a1)
  {
    v16 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
    objc_initWeak(&location, v17);
    v14 = (id)objc_msgSend(v17, "_accessibilityValueForKey:", CFSTR("TextElement"));
    if (!v14)
    {
      v7 = objc_alloc(MEMORY[0x24BDF67A0]);
      v6 = (void *)objc_msgSend(v7, "initWithAccessibilityContainer:", v17);
      v14 = v6;

      objc_msgSend(v17, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("TextElement"));
      objc_msgSend(v6, "setAccessibilityDelegate:", v17);
      v8 = MEMORY[0x24BDAC760];
      v9 = -1073741824;
      v10 = 0;
      v11 = __54__UIPasscodeFieldAccessibility__accessibilityChildren__block_invoke;
      v12 = &unk_24FF3DD28;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v6, "_setAccessibilityFrameBlock:", &v8);
      objc_msgSend(v14, "setAccessibilityTraits:", *MEMORY[0x24BEBB168] | *MEMORY[0x24BEBB198] | *MEMORY[0x24BEBB128]);
      objc_destroyWeak(&v13);
    }
    objc_msgSend(v16, "addObject:", v14);
    v4 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("showsOKButton"));
    v5 = objc_msgSend(v4, "BOOLValue");

    if ((v5 & 1) != 0)
    {
      v3 = v16;
      v2 = (id)objc_msgSend(v17, "safeValueForKey:", CFSTR("_okButton"));
      objc_msgSend(v3, "axSafelyAddObject:");

    }
    v18 = v16;
    objc_storeStrong(&v14, 0);
    objc_destroyWeak(&location);
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

double __54__UIPasscodeFieldAccessibility__accessibilityChildren__block_invoke(uint64_t a1)
{
  double v1;
  id WeakRetained;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v4 = v1;

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  id v7;
  BOOL v8;
  objc_super v9;
  CGRect rect;
  id v11;
  id v12;
  CGPoint point;
  int v14;
  id v15;
  id *v16;
  char v17;
  uint64_t v18;
  int v19;
  int v20;
  BOOL (*v21)(uint64_t);
  void *v22;
  UIPasscodeFieldAccessibility *v23;
  char v24;
  id location[2];
  UIPasscodeFieldAccessibility *v26;
  CGPoint v27;
  id v28;
  CGRect v29;

  v27 = a3;
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v24 = -[UIPasscodeFieldAccessibility _accessibilityBoolValueForKey:](v26, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v17 = 0;
  v8 = 0;
  if (!v24)
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __64__UIPasscodeFieldAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v22 = &unk_24FF3E0C0;
    v23 = v26;
    v17 = 1;
    v16 = (id *)&v23;
    v8 = v21((uint64_t)&v18);
  }
  if (v8)
  {
    -[UIPasscodeFieldAccessibility _accessibilitySetBoolValue:forKey:](v26, "_accessibilitySetBoolValue:forKey:", 1);
    v15 = (id)-[UIPasscodeFieldAccessibility accessibilityHitTest:withEvent:](v26, "accessibilityHitTest:withEvent:", location[0], v27.x, v27.y);
    -[UIPasscodeFieldAccessibility _accessibilitySetBoolValue:forKey:](v26, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v28 = v15;
    v14 = 1;
    objc_storeStrong(&v15, 0);
  }
  else
  {
    v14 = 0;
  }
  if ((v17 & 1) != 0)
    objc_storeStrong(v16, 0);
  if (!v14)
  {
    v7 = (id)-[UIPasscodeFieldAccessibility _accessibilityParentView](v26, "_accessibilityParentView");
    UIAccessibilityPointForPoint();
    point.x = v4;
    point.y = v5;

    v12 = -[UIPasscodeFieldAccessibility _accessibilityChildren](v26);
    if (objc_msgSend(v12, "count") != 2
      || ((v11 = (id)objc_msgSend(v12, "objectAtIndex:", 1),
           objc_msgSend(v11, "accessibilityFrame"),
           rect = v29,
           !CGRectContainsPoint(v29, point))
        ? (v14 = 0)
        : (v28 = v11, v14 = 1),
          objc_storeStrong(&v11, 0),
          !v14))
    {
      v9.receiver = v26;
      v9.super_class = (Class)UIPasscodeFieldAccessibility;
      v28 = -[UIPasscodeFieldAccessibility _accessibilityHitTest:withEvent:](&v9, sel__accessibilityHitTest_withEvent_, location[0], v27.x, v27.y, v7);
      v14 = 1;
    }
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(location, 0);
  return v28;
}

BOOL __64__UIPasscodeFieldAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_1;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_28);
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
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_1;
}

void __64__UIPasscodeFieldAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
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
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_1 = (uint64_t)method_getImplementation(InstanceMethod);
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

- (id)accessibilityElements
{
  return -[UIPasscodeFieldAccessibility _accessibilityChildren](self);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilitySetValue:(id)a3
{
  id location[2];
  UIPasscodeFieldAccessibility *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[UIPasscodeFieldAccessibility setStringValue:](v4, "setStringValue:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v2;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  SEL v16;
  UIPasscodeFieldAccessibility *v17;

  v17 = self;
  v16 = a2;
  v6 = (id)-[UIPasscodeFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberOfEntryFields"));
  v7 = objc_msgSend(v6, "integerValue");

  v15 = v7;
  v8 = (id)-[UIPasscodeFieldAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("stringValue"));
  v12 = 0;
  v10 = 0;
  if (objc_msgSend(v8, "length"))
  {
    v13 = accessibilityLocalizedString(CFSTR("secure.password.field"));
    v12 = 1;
    v2 = v13;
  }
  else
  {
    v11 = accessibilityLocalizedString(CFSTR("secure.password.field.empty"));
    v10 = 1;
    v2 = v11;
  }
  v14 = v2;
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  v9 = accessibilityLocalizedString(CFSTR("secure.password.field.numchars.required"));
  v4 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v9, v15);
  v5 = (id)__UIAXStringForVariables();

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v14, 0);
  return v5;
}

- (id)accessibilityValue
{
  return (id)-[UIPasscodeFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stringValue"), a2, self);
}

@end
