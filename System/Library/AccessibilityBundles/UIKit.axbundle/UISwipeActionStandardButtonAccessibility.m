@implementation UISwipeActionStandardButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISwipeActionStandardButton");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISwipeActionStandardButton"), CFSTR("_buttonWidth"), "d");
  objc_storeStrong(location, 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  BOOL v11;
  objc_super v12;
  CGPoint point;
  CGRect rect;
  int v15;
  id v16;
  id *v17;
  char v18;
  uint64_t v19;
  int v20;
  int v21;
  BOOL (*v22)(uint64_t);
  void *v23;
  UISwipeActionStandardButtonAccessibility *v24;
  char v25;
  id location[2];
  UISwipeActionStandardButtonAccessibility *v27;
  CGPoint v28;
  UISwipeActionStandardButtonAccessibility *v29;

  v28 = a3;
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v25 = -[UISwipeActionStandardButtonAccessibility _accessibilityBoolValueForKey:](v27, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v18 = 0;
  v11 = 0;
  if (!v25)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = -1073741824;
    v21 = 0;
    v22 = __76__UISwipeActionStandardButtonAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v23 = &unk_24FF3E0C0;
    v24 = v27;
    v18 = 1;
    v17 = (id *)&v24;
    v11 = v22((uint64_t)&v19);
  }
  if (v11)
  {
    -[UISwipeActionStandardButtonAccessibility _accessibilitySetBoolValue:forKey:](v27, "_accessibilitySetBoolValue:forKey:", 1);
    v16 = (id)-[UISwipeActionStandardButtonAccessibility accessibilityHitTest:withEvent:](v27, "accessibilityHitTest:withEvent:", location[0], v28.x, v28.y);
    -[UISwipeActionStandardButtonAccessibility _accessibilitySetBoolValue:forKey:](v27, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v29 = (UISwipeActionStandardButtonAccessibility *)v16;
    v15 = 1;
    objc_storeStrong(&v16, 0);
  }
  else
  {
    v15 = 0;
  }
  if ((v18 & 1) != 0)
    objc_storeStrong(v17, 0);
  if (!v15)
  {
    -[UISwipeActionStandardButtonAccessibility accessibilityFrame](v27, "accessibilityFrame");
    rect.origin.x = v4;
    rect.origin.y = v5;
    rect.size.width = v6;
    rect.size.height = v7;
    UIAccessibilityPointForPoint();
    point.x = v8;
    point.y = v9;
    if (CGRectContainsPoint(rect, point))
    {
      v29 = v27;
    }
    else
    {
      v12.receiver = v27;
      v12.super_class = (Class)UISwipeActionStandardButtonAccessibility;
      v29 = (UISwipeActionStandardButtonAccessibility *)-[UISwipeActionStandardButtonAccessibility _accessibilityHitTest:withEvent:](&v12, sel__accessibilityHitTest_withEvent_, location[0], v28.x, v28.y);
    }
    v15 = 1;
  }
  objc_storeStrong(location, 0);
  return v29;
}

BOOL __76__UISwipeActionStandardButtonAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&MACancelDownloadErrorDomain_block_invoke_onceToken_1;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_34);
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
  return Implementation != (IMP)MACancelDownloadErrorDomain_block_invoke_BaseImplementation_1;
}

void __76__UISwipeActionStandardButtonAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
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
    MACancelDownloadErrorDomain_block_invoke_BaseImplementation_1 = (uint64_t)method_getImplementation(InstanceMethod);
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

- (CGRect)accessibilityFrame
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGRect rect;

  -[UISwipeActionStandardButtonAccessibility bounds](self, "bounds");
  rect.origin.x = v2;
  rect.origin.y = v3;
  rect.size.height = v4;
  -[UISwipeActionStandardButtonAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_buttonWidth"));
  rect.size.width = v5;
  return UIAccessibilityConvertFrameToScreenCoordinates(rect, (UIView *)self);
}

@end
