@implementation UIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = CFSTR("UIPageControl");
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", 0);
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_updateCurrentPageDisplayWithForceUpdate:"), v3, "B", 0);
  v5 = CFSTR("UIControl");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v6, v5);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v6, CFSTR("_visualProvider"), "_UIPageControlVisualProvider");
  v7 = CFSTR("_UIInteractivePageControlVisualProvider");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("contentView"), "@", 0);
  objc_storeStrong(v9, v8);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430] | *MEMORY[0x24BDF73A0];
}

- (int64_t)_accessibilityPageCount
{
  id v3;
  int64_t v4;

  v3 = (id)-[UIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberOfPages"));
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)_accessibilityPageIndex
{
  id v3;
  int64_t v4;

  v3 = (id)-[UIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentPage"));
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setCurrentPage:(int64_t)a3
{
  id v3;
  uint64_t v4;
  objc_super v5;
  uint64_t v6;
  int64_t v7;
  SEL v8;
  UIPageControlAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v3 = (id)-[UIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentPage"));
  v4 = objc_msgSend(v3, "integerValue");

  v6 = v4;
  v5.receiver = v9;
  v5.super_class = (Class)UIPageControlAccessibility;
  -[UIPageControlAccessibility setCurrentPage:](&v5, sel_setCurrentPage_, v7);
  if (v7 != v6)
    -[UIPageControlAccessibility _accessibilityCurrentPageDidChange](v9, "_accessibilityCurrentPageDidChange");
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  CGRect result;

  v6 = (id)-[UIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("bounds"));
  objc_msgSend(v6, "rectValue");

  UIAccessibilityFrameForBounds();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)accessibilityPath
{
  objc_super v3;
  int v4;
  CGRect rect;
  id v6;
  id v7[2];
  UIPageControlAccessibility *v8;
  id v9;
  CGRect v10;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)-[UIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visualProvider"));
  NSClassFromString(CFSTR("_UIInteractivePageControlVisualProvider"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (id)objc_msgSend(v7[0], "safeUIViewForKey:", CFSTR("contentView"));
    objc_msgSend(v6, "accessibilityFrame");
    rect = v10;
    v9 = (id)objc_msgSend(MEMORY[0x24BDF6870], "_bezierPathWithArcRoundedRect:cornerRadius:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height, CGRectGetHeight(v10) / 2.0);
    v4 = 1;
    objc_storeStrong(&v6, 0);
  }
  else
  {
    v3.receiver = v8;
    v3.super_class = (Class)UIPageControlAccessibility;
    v9 = -[UIPageControlAccessibility accessibilityPath](&v3, sel_accessibilityPath);
    v4 = 1;
  }
  objc_storeStrong(v7, 0);
  return v9;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  BOOL v7;
  CGPoint point;
  int v9;
  id v10;
  id *v11;
  char v12;
  uint64_t v13;
  int v14;
  int v15;
  BOOL (*v16)(uint64_t);
  void *v17;
  UIPageControlAccessibility *v18;
  char v19;
  id location[2];
  UIPageControlAccessibility *v21;
  CGPoint v22;
  UIPageControlAccessibility *v23;
  CGRect v24;

  v22 = a3;
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v19 = -[UIPageControlAccessibility _accessibilityBoolValueForKey:](v21, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v12 = 0;
  v7 = 0;
  if (!v19)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __62__UIPageControlAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v17 = &unk_24FF3E0C0;
    v18 = v21;
    v12 = 1;
    v11 = (id *)&v18;
    v7 = v16((uint64_t)&v13);
  }
  if (v7)
  {
    -[UIPageControlAccessibility _accessibilitySetBoolValue:forKey:](v21, "_accessibilitySetBoolValue:forKey:", 1);
    v10 = (id)-[UIPageControlAccessibility accessibilityHitTest:withEvent:](v21, "accessibilityHitTest:withEvent:", location[0], v22.x, v22.y);
    -[UIPageControlAccessibility _accessibilitySetBoolValue:forKey:](v21, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v23 = (UIPageControlAccessibility *)v10;
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
    UIAccessibilityPointForPoint();
    point.x = v4;
    point.y = v5;
    if (-[UIPageControlAccessibility isAccessibilityElement](v21, "isAccessibilityElement")
      && (-[UIPageControlAccessibility accessibilityFrame](v21, "accessibilityFrame"), CGRectContainsPoint(v24, point)))
    {
      v23 = v21;
    }
    else
    {
      v23 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v23;
}

BOOL __62__UIPageControlAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_27);
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
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_0;
}

void __62__UIPageControlAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
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
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_0 = (uint64_t)method_getImplementation(InstanceMethod);
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

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

- (unint64_t)_accessibilityAutomationType
{
  return 34;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  BOOL v10;

  v2 = (id)-[UIPageControlAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v8 = v2 == 0;

  if (v8)
  {
    v5 = (id)-[UIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberOfPages"));
    v6 = objc_msgSend(v5, "integerValue") >= 1;

    if (v6)
    {
      v4 = (id)-[UIPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("hidden"));
      v10 = (objc_msgSend(v4, "BOOLValue") ^ 1) & 1;

    }
    else
    {
      return 0;
    }
  }
  else
  {
    v7 = (id)-[UIPageControlAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v10 = objc_msgSend(v7, "BOOLValue") & 1;

  }
  return v10;
}

- (id)accessibilityValue
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12[3];
  id v13;
  id v14;
  char v15;
  id v16[2];
  UIPageControlAccessibility *v17;
  id v18;

  v17 = self;
  v16[1] = (id)a2;
  v2 = (id)-[UIPageControlAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  v11 = v2 == 0;

  if (v11)
  {
    v15 = 0;
    objc_opt_class();
    v14 = (id)__UIAccessibilityCastAsClass();
    v13 = v14;
    objc_storeStrong(&v14, 0);
    v16[0] = v13;
    v12[2] = (id)(objc_msgSend(v13, "currentPage") + 1);
    v12[1] = (id)objc_msgSend(v16[0], "numberOfPages");
    v12[0] = (id)objc_msgSend(v16[0], "progress");
    if (v12[0])
    {
      v10 = accessibilityLocalizedString(CFSTR("page.control.format.text.with.progress"));
      v9 = (id)AXFormatInteger();
      v8 = (id)AXFormatInteger();
      objc_msgSend(v12[0], "currentProgress");
      v6 = (id)AXFormatFloatWithPercentage();
      v18 = (id)AXCFormattedString();

    }
    else
    {
      v7 = accessibilityLocalizedString(CFSTR("page.control.format.text"));
      v4 = (id)AXFormatInteger();
      v5 = (id)AXFormatInteger();
      v18 = (id)AXCFormattedString();

    }
    objc_storeStrong(v12, 0);
    objc_storeStrong(v16, 0);
  }
  else
  {
    v18 = (id)-[UIPageControlAccessibility accessibilityUserDefinedValue](v17, "accessibilityUserDefinedValue");
  }
  return v18;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  -[UIPageControlAccessibility accessibilityIncrement](self, "accessibilityIncrement", a2, self);
  return 1;
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  objc_super v3;
  SEL v4;
  UIPageControlAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIPageControlAccessibility;
  return -[UIPageControlAccessibility _accessibilityIsUserInteractionEnabled](&v3, sel__accessibilityIsUserInteractionEnabled);
}

- (void)accessibilityIncrement
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6[3];
  void *v7;
  SEL v8;
  UIPageControlAccessibility *v9;

  v9 = self;
  v8 = a2;
  if (-[UIPageControlAccessibility _accessibilityIsUserInteractionEnabled](self, "_accessibilityIsUserInteractionEnabled"))
  {
    v2 = (id)-[UIPageControlAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("currentPage"));
    v3 = objc_msgSend(v2, "integerValue") + 1;

    v7 = (void *)v3;
    v4 = (id)-[UIPageControlAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("numberOfPages"));
    v5 = (void *)objc_msgSend(v4, "integerValue");

    v6[2] = v5;
    if (v3 < (uint64_t)v5)
    {
      v6[0] = v9;
      v6[1] = v7;
      AXPerformSafeBlock();
      objc_storeStrong(v6, 0);
    }
  }
}

void __52__UIPageControlAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setCurrentPage:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("defersCurrentPageDisplay")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateCurrentPageDisplayWithForceUpdate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 4096);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)accessibilityDecrement
{
  id v2;
  uint64_t v3;
  id v4[2];
  void *v5;
  SEL v6;
  UIPageControlAccessibility *v7;

  v7 = self;
  v6 = a2;
  if (-[UIPageControlAccessibility _accessibilityIsUserInteractionEnabled](self, "_accessibilityIsUserInteractionEnabled"))
  {
    v2 = (id)-[UIPageControlAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("currentPage"));
    v3 = objc_msgSend(v2, "integerValue") - 1;

    v5 = (void *)v3;
    if (v3 >= 0)
    {
      v4[0] = v7;
      v4[1] = v5;
      AXPerformSafeBlock();
      objc_storeStrong(v4, 0);
    }
  }
}

void __52__UIPageControlAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setCurrentPage:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("defersCurrentPageDisplay")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateCurrentPageDisplayWithForceUpdate:", 1);
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 4096);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_accessibilityRetainsFocusOnScreenChange
{
  return 1;
}

- (id)accessibilityUserInputLabels
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  id v11[2];
  UIPageControlAccessibility *v12;

  v12 = self;
  v11[1] = (id)a2;
  v10.receiver = self;
  v10.super_class = (Class)UIPageControlAccessibility;
  v11[0] = -[UIPageControlAccessibility accessibilityUserInputLabels](&v10, sel_accessibilityUserInputLabels);
  if (!objc_msgSend(v11[0], "count"))
  {
    v9 = (id)-[UIPageControlAccessibility accessibilityLabel](v12, "accessibilityLabel");
    v2 = (id)MEMORY[0x2348C3560]();
    v3 = v11[0];
    v11[0] = v2;

    if (!objc_msgSend(v11[0], "count"))
    {
      v8 = accessibilityLocalizedString(CFSTR("page.control.text"));
      v4 = (id)MEMORY[0x2348C3560]();
      v5 = v11[0];
      v11[0] = v4;

    }
  }
  v7 = v11[0];
  objc_storeStrong(v11, 0);
  return v7;
}

- (BOOL)canBecomeFocused
{
  objc_super v3;
  char v4;
  SEL v5;
  UIPageControlAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPageControlAccessibility;
  v4 = -[UIPageControlAccessibility canBecomeFocused](&v3, sel_canBecomeFocused);
  if ((-[UIPageControlAccessibility _accessibilityIsFKARunningForFocusItem](v6, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)v4 = 1;
  return v4 & 1;
}

@end
