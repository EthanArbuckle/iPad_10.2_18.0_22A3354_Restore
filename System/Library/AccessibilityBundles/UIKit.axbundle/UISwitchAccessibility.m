@implementation UISwitchAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISwitch");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UISwitchVisualElement"), CFSTR("UIView"));
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("UISwitch"), CFSTR("visualElement"), "@");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISwitchModernVisualElement"), CFSTR("_knobView"), "UIImageView");
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsAccessibleViaTableViewCell
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_accessibilitySetIsAccessibleViaTableViewCell:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)accessibilityActivate
{
  return 0;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_class *v2;
  id location;
  dispatch_once_t *v5;

  v5 = (dispatch_once_t *)&_accessibilitySupportsActivateAction_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_35);
  if (*v5 != -1)
    dispatch_once(v5, location);
  objc_storeStrong(&location, 0);
  v2 = (objc_class *)objc_opt_class();
  return class_getInstanceMethod(v2, sel_accessibilityActivate) != (Method)_accessibilitySupportsActivateAction_BaseActivate;
}

Method __61__UISwitchAccessibility__accessibilitySupportsActivateAction__block_invoke()
{
  objc_class *v0;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v0, sel_accessibilityActivate);
  _accessibilitySupportsActivateAction_BaseActivate = (uint64_t)result;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id obj;
  id v14;
  id v15;
  id v16;
  objc_super v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id v30;
  char v31;
  id v32;
  id v33;
  char v34;
  id v35;
  id v36[2];
  UISwitchAccessibility *v37;
  double v38;
  double v39;
  CGPoint result;

  v37 = self;
  v36[1] = (id)a2;
  v36[0] = (id)-[UISwitchAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("visualElement"));
  if (-[UISwitchAccessibility _accessibilityIsMacVisualAppearance](v37, "_accessibilityIsMacVisualAppearance"))
  {
    v34 = 0;
    v33 = (id)__UIAccessibilitySafeClass();
    v32 = v33;
    objc_storeStrong(&v33, 0);
    v15 = v32;
    v16 = (id)objc_msgSend(v32, "safeValueForKeyPath:", CFSTR("_macCheckbox.cell"));
    v27 = 0;
    v25 = 0;
    if (v16)
    {
      v2 = v16;
    }
    else
    {
      v31 = 0;
      v30 = (id)__UIAccessibilitySafeClass();
      v29 = v30;
      objc_storeStrong(&v30, 0);
      v28 = v29;
      v27 = 1;
      v26 = (id)objc_msgSend(v29, "safeValueForKeyPath:", CFSTR("_macSwitch.cell"));
      v25 = 1;
      v2 = v26;
    }
    v35 = v2;
    if ((v25 & 1) != 0)

    if ((v27 & 1) != 0)
    v23 = 0;
    objc_opt_class();
    v14 = (id)objc_msgSend(v35, "safeValueForKey:", CFSTR("accessibilityActivationPointAttribute"));
    v22 = (id)__UIAccessibilityCastAsClass();

    v21 = v22;
    objc_storeStrong(&v22, 0);
    v24 = v21;
    if (v21)
    {
      objc_msgSend(v24, "pointValue");
      v19 = v3;
      v20 = v4;
      UIAccessibilityPointForPoint();
      v38 = v5;
      v39 = v6;
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    obj = 0;
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v35, 0);
    if (!v18)
      goto LABEL_16;
  }
  else
  {
    if (!v36[0])
    {
LABEL_16:
      v17.receiver = v37;
      v17.super_class = (Class)UISwitchAccessibility;
      -[UISwitchAccessibility accessibilityActivationPoint](&v17, sel_accessibilityActivationPoint, obj);
      v38 = v9;
      v39 = v10;
      v18 = 1;
      goto LABEL_17;
    }
    objc_msgSend(v36[0], "accessibilityActivationPoint");
    v38 = v7;
    v39 = v8;
    v18 = 1;
  }
LABEL_17:
  objc_storeStrong(v36, 0);
  v11 = v38;
  v12 = v39;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  id v3;
  char v4;
  id v5;
  char v6;
  id location;
  char v8;
  objc_super v9;
  char v10;
  BOOL v11;
  SEL v12;
  UISwitchAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v3 = (id)-[UISwitchAccessibility safeValueForKey:](self, "safeValueForKey:");
  v4 = objc_msgSend(v3, "BOOLValue");

  v10 = v4 & 1;
  v9.receiver = v13;
  v9.super_class = (Class)UISwitchAccessibility;
  -[UISwitchAccessibility setEnabled:](&v9, sel_setEnabled_, v11);
  v5 = (id)-[UISwitchAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("isEnabled"));
  v6 = objc_msgSend(v5, "BOOLValue");

  v8 = v6 & 1;
  location = (id)-[UISwitchAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("superview"));
  if ((v10 & 1) != (v6 & 1))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(location, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    }
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  BOOL v5;
  int v6;
  id v7;
  id *v8;
  char v9;
  uint64_t v10;
  int v11;
  int v12;
  BOOL (*v13)(uint64_t);
  void *v14;
  UISwitchAccessibility *v15;
  char v16;
  id location[2];
  UISwitchAccessibility *v18;
  CGPoint v19;
  UISwitchAccessibility *v20;

  v19 = a3;
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v16 = -[UISwitchAccessibility _accessibilityBoolValueForKey:](v18, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v9 = 0;
  v5 = 0;
  if (!v16)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __57__UISwitchAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v14 = &unk_24FF3E0C0;
    v15 = v18;
    v9 = 1;
    v8 = (id *)&v15;
    v5 = v13((uint64_t)&v10);
  }
  if (v5)
  {
    -[UISwitchAccessibility _accessibilitySetBoolValue:forKey:](v18, "_accessibilitySetBoolValue:forKey:", 1);
    v7 = (id)-[UISwitchAccessibility accessibilityHitTest:withEvent:](v18, "accessibilityHitTest:withEvent:", location[0], v19.x, v19.y);
    -[UISwitchAccessibility _accessibilitySetBoolValue:forKey:](v18, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v20 = (UISwitchAccessibility *)v7;
    v6 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v6 = 0;
  }
  if ((v9 & 1) != 0)
    objc_storeStrong(v8, 0);
  if (!v6)
  {
    if (-[UISwitchAccessibility isAccessibilityElement](v18, "isAccessibilityElement")
      && (-[UISwitchAccessibility accessibilityElementsHidden](v18, "accessibilityElementsHidden") & 1) == 0)
    {
      if ((-[UISwitchAccessibility _accessibilityPointInside:withEvent:](v18, "_accessibilityPointInside:withEvent:", location[0], v19.x, v19.y) & 1) != 0)v20 = v18;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
  }
  objc_storeStrong(location, 0);
  return v20;
}

BOOL __57__UISwitchAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&MACancelDownloadErrorDomain_block_invoke_onceToken_2;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_219_0);
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
  return Implementation != (IMP)MACancelDownloadErrorDomain_block_invoke_BaseImplementation_2;
}

void __57__UISwitchAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
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
    MACancelDownloadErrorDomain_block_invoke_BaseImplementation_2 = (uint64_t)method_getImplementation(InstanceMethod);
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

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UISwitchAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return 1;
  v4 = (id)-[UISwitchAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (id)accessibilityLabel
{
  id v3;
  BOOL v4;
  id v5;
  BOOL v7;
  BOOL v8;
  id v9;
  id v10;
  char v11;
  id v12;
  int v13;
  id v14[2];
  UISwitchAccessibility *v15;
  __CFString *v16;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UISwitchAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (v14[0])
  {
    v16 = (__CFString *)v14[0];
    v13 = 1;
  }
  else
  {
    v11 = 0;
    objc_opt_class();
    v10 = (id)__UIAccessibilityCastAsClass();
    v9 = v10;
    objc_storeStrong(&v10, 0);
    v12 = v9;
    v3 = (id)objc_msgSend(v9, "title");
    v4 = objc_msgSend(v3, "length") != 0;

    v8 = v4;
    v7 = objc_msgSend(v12, "preferredStyle") == 1;
    if (v4 && v7)
    {
      v16 = (__CFString *)(id)objc_msgSend(v12, "title");
      v13 = 1;
    }
    else if (-[UISwitchAccessibility _accessibilityBoolValueForKey:](v15, "_accessibilityBoolValueForKey:", CFSTR("AXIsInRetrieval")) & 1)
    {
      v16 = CFSTR("--");
      v13 = 1;
    }
    else
    {
      -[UISwitchAccessibility _accessibilitySetBoolValue:forKey:](v15, "_accessibilitySetBoolValue:forKey:", 1);
      v5 = -[UIViewAccessibility _accessibilityRetrieveLabelFromTableViewCell](v15);
      -[UISwitchAccessibility _accessibilitySetBoolValue:forKey:](v15, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXIsInRetrieval"));
      v16 = (__CFString *)v5;
      v13 = 1;
      objc_storeStrong(&v5, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(v14, 0);
  return v16;
}

- (id)accessibilityValue
{
  if ((-[UISwitchAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isOn"), a2, self) & 1) != 0)
    return CFSTR("1");
  else
    return CFSTR("0");
}

- (unint64_t)_accessibilityAutomationType
{
  return 40;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  char v4;
  uint64_t v5;
  unint64_t v6;
  id location[2];
  UISwitchAccessibility *v8;
  unint64_t v9;

  v8 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UISwitchAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  if (location[0])
  {
    v9 = objc_msgSend(location[0], "unsignedLongLongValue");
  }
  else
  {
    v5 = *MEMORY[0x24BDF73B0];
    v3 = (id)-[UISwitchAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("isEnabled"));
    v4 = objc_msgSend(v3, "BOOLValue");

    if ((v4 & 1) == 0)
      v5 |= *MEMORY[0x24BDF73E8];
    v6 = v5 | *MEMORY[0x24BDF7428];
    if (-[UISwitchAccessibility _accessibilityIsAccessibleViaTableViewCell](v8, "_accessibilityIsAccessibleViaTableViewCell"))
    {
      v6 |= *MEMORY[0x24BEBB178];
    }
    v9 = v6;
  }
  objc_storeStrong(location, 0);
  return v9;
}

- (id)_accessibilityKeyCommands
{
  id v3;
  id v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v10 = (void *)MEMORY[0x24BDF6B10];
  v11 = *MEMORY[0x24BDF79A8];
  if ((-[UISwitchAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL") & 1) != 0)
    v9 = sel__fkaSwitchOff;
  else
    v9 = sel__fkaSwitchOn;
  v6 = (id)objc_msgSend(v10, "keyCommandWithInput:modifierFlags:action:", v11, 0, v9);
  v13[0] = v6;
  v7 = (void *)MEMORY[0x24BDF6B10];
  v8 = *MEMORY[0x24BDF79A0];
  if ((-[UISwitchAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL") & 1) != 0)
    v5 = sel__fkaSwitchOn;
  else
    v5 = sel__fkaSwitchOff;
  v3 = (id)objc_msgSend(v7, "keyCommandWithInput:modifierFlags:action:", v8, 0, v5);
  v13[1] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);

  return v4;
}

- (BOOL)_accessibilityIsMacVisualAppearance
{
  return 0;
}

- (void)_fkaSwitchOn
{
  if ((-[UISwitchAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isOn")) & 1) == 0)
    -[UISwitchAccessibility _keyboardActivate](self, "_keyboardActivate");
}

- (void)_fkaSwitchOff
{
  if ((-[UISwitchAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isOn")) & 1) != 0)
    -[UISwitchAccessibility _keyboardActivate](self, "_keyboardActivate");
}

- (void)_keyboardActivate
{
  uint64_t v2;
  int v3;
  int v4;
  id (*v5)(uint64_t);
  void *v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __42__UISwitchAccessibility__keyboardActivate__block_invoke;
  v6 = &unk_24FF3DA40;
  v7[0] = self;
  AXPerformSafeBlock();
  _UIAccessibilitySetAssociatedElementContextForNextNotification();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB1D0], MEMORY[0x24BDBD1B8]);
  objc_storeStrong(v7, 0);
}

id __42__UISwitchAccessibility__keyboardActivate__block_invoke(uint64_t a1)
{
  objc_super v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1;
  v3 = a1;
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UISwitchAccessibility;
  return objc_msgSendSuper2(&v2, sel__keyboardActivate);
}

- (id)accessibilityPath
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  UIBezierPath *v10;
  UIBezierPath *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  id v19;
  id v20;
  void *v21;
  UIBezierPath *path[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  SEL v37;
  UIView *v38;
  UIBezierPath *v39;

  v38 = (UIView *)self;
  v37 = a2;
  v36 = AXRequestingClient();
  if (v36 == 3 || v36 == 4)
  {
    v39 = 0;
  }
  else if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v19 = (id)-[UIView safeUIViewForKey:](v38, "safeUIViewForKey:", CFSTR("visualElement"));
    v35 = (id)objc_msgSend(v19, "safeUIViewForKey:", CFSTR("_knobView"));

    v20 = v35;
    objc_msgSend(v35, "bounds");
    v27 = v2;
    v28 = v3;
    v29 = v4;
    v30 = v5;
    objc_msgSend(v20, "convertRect:toView:", v38, v2, v3, v4, v5);
    v31 = v6;
    v33 = v7;
    v34 = v8;
    v32 = v9 - 3.0;
    CGRectMake_3();
    AX_CGRectGetCenter();
    path[2] = v10;
    path[3] = v11;
    UIRectCenteredAboutPoint();
    *(_QWORD *)&v23 = v12;
    *((_QWORD *)&v23 + 1) = v13;
    *(_QWORD *)&v24 = v14;
    *((_QWORD *)&v24 + 1) = v15;
    v25 = v23;
    v26 = v24;
    path[1] = COERCE_UIBEZIERPATH_(3.0);
    v21 = (void *)MEMORY[0x24BDF6870];
    AX_CGRectGetCenter();
    path[0] = (UIBezierPath *)(id)objc_msgSend(v21, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v16, v17, *(double *)&v24 / 2.0 + 3.0, 0.0, 6.28318531);
    v39 = UIAccessibilityConvertPathToScreenCoordinates(path[0], v38);
    objc_storeStrong((id *)path, 0);
    objc_storeStrong(&v35, 0);
  }
  else
  {
    v39 = 0;
  }
  return v39;
}

- (id)_viewToAddFocusLayer
{
  id v3;
  id v4;

  v3 = (id)-[UISwitchAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("visualElement"));
  v4 = (id)objc_msgSend(v3, "safeUIViewForKey:", CFSTR("_knobView"));

  return v4;
}

@end
