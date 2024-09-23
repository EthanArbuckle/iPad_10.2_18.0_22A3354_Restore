@implementation UIControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIControl"));
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_containingScrollView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_systemDefaultFocusGroupIdentifier"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (id)_systemDefaultFocusGroupIdentifier
{
  BOOL v3;
  objc_super v4;
  char v5;
  id v6;
  SEL v7;
  UIControlAccessibility *v8;
  id v9;

  v8 = self;
  v7 = a2;
  v5 = 0;
  v3 = 0;
  if ((-[UIControlAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v6 = (id)-[UIControlAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_containingScrollView"));
    v5 = 1;
    v3 = v6 != 0;
  }
  if ((v5 & 1) != 0)

  if (v3)
  {
    v9 = 0;
  }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UIControlAccessibility;
    v9 = -[UIControlAccessibility _systemDefaultFocusGroupIdentifier](&v4, sel__systemDefaultFocusGroupIdentifier);
  }
  return v9;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  id v3;
  char v4;
  objc_super v5;
  id location;
  id v7;
  id v8[2];
  UIControlAccessibility *v9;
  id v10;

  v9 = self;
  v8[1] = (id)a2;
  v3 = (id)-[UIControlAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("UISearchControlDimmingView"));

  if ((v4 & 1) != 0)
  {
    v8[0] = (id)-[UIControlAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("superview"));
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      location = (id)objc_msgSend(v8[0], "_accessibilitySupplementaryHeaderViews");
      if (objc_msgSend(location, "count"))
        objc_msgSend(v7, "addObjectsFromArray:", location);
      objc_storeStrong(&location, 0);
    }
    v10 = v7;
    objc_storeStrong(&v7, 0);
    objc_storeStrong(v8, 0);
  }
  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)UIControlAccessibility;
    v10 = -[UIControlAccessibility _accessibilityObscuredScreenAllowedViews](&v5, sel__accessibilityObscuredScreenAllowedViews);
  }
  return v10;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_class *v2;
  objc_class *v3;
  objc_super v5;
  Method InstanceMethod;
  SEL v7;
  UIControlAccessibility *v8;
  BOOL v9;

  v8 = self;
  v7 = a2;
  if (!_accessibilitySupportsActivateAction_BaseActivateAction)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilitySupportsActivateAction_BaseActivateAction = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityActivate);
  }
  v3 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v3, sel_accessibilityActivate);
  v9 = InstanceMethod != (Method)_accessibilitySupportsActivateAction_BaseActivateAction
    || (v5.receiver = v8,
        v5.super_class = (Class)UIControlAccessibility,
        -[UIControlAccessibility _accessibilitySupportsActivateAction](&v5, sel__accessibilitySupportsActivateAction));
  return v9;
}

- (BOOL)accessibilityActivate
{
  objc_super v3;
  SEL v4;
  UIControlAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIControlAccessibility;
  return -[UIControlAccessibility accessibilityActivate](&v3, sel_accessibilityActivate);
}

- (id)accessibilityLabel
{
  objc_super v3;
  id location[2];
  UIControlAccessibility *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  v3.receiver = self;
  v3.super_class = (Class)UIControlAccessibility;
  location[0] = -[UIControlAccessibility accessibilityLabel](&v3, sel_accessibilityLabel);
  if (location[0])
    v6 = location[0];
  else
    v6 = -[UIViewAccessibility _accessibilityRetrieveIvarText](v5);
  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  double v3;
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  int v9;
  double v10;
  id location[2];
  UIControlAccessibility *v12;
  char v13;
  CGRect v14;

  v12 = self;
  location[1] = (id)a2;
  v2 = (id)-[UIControlAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v8 = v2 == 0;

  if (v8)
  {
    v5 = (id)-[UIControlAccessibility _accessibilitySubviews](v12, "_accessibilitySubviews");
    v6 = objc_msgSend(v5, "count") != 0;

    if (v6
      || ((location[0] = -[UIViewAccessibility _accessibilityRetrieveIvarText](v12),
           -[UIControlAccessibility bounds](v12, "bounds"),
           v10 = v3,
           !objc_msgSend(location[0], "length"))
       || (AXDeviceGetMainScreenPixelBounds(), v10 >= CGRectGetHeight(v14) / 2.0)
        ? (v9 = 0)
        : (v13 = 1, v9 = 1),
          objc_storeStrong(location, 0),
          !v9))
    {
      v13 = 0;
    }
  }
  else
  {
    v7 = (id)-[UIControlAccessibility isAccessibilityUserDefinedElement](v12, "isAccessibilityUserDefinedElement");
    v13 = objc_msgSend(v7, "BOOLValue") & 1;

  }
  return v13 & 1;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  char v8;
  id v9;
  BOOL v10;
  objc_super v11;
  unint64_t v12;
  SEL v13;
  UIControlAccessibility *v14;
  unint64_t v15;

  v14 = self;
  v13 = a2;
  v2 = (id)-[UIControlAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v10 = v2 == 0;

  if (v10)
  {
    v12 = 0;
    v11.receiver = v14;
    v11.super_class = (Class)UIControlAccessibility;
    v12 = -[UIControlAccessibility accessibilityTraits](&v11, sel_accessibilityTraits);
    v7 = (id)-[UIControlAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("isUserInteractionEnabled"));
    v8 = objc_msgSend(v7, "BOOLValue");

    if ((v8 & 1) == 0)
      v12 |= *MEMORY[0x24BDF73E8];
    v6 = v12;
    if ((-[UIControlAccessibility safeBoolForKey:](v14, "safeBoolForKey:", CFSTR("isEnabled")) & 1) != 0)
      v5 = 0;
    else
      v5 = *MEMORY[0x24BDF73E8];
    if ((-[UIControlAccessibility safeBoolForKey:](v14, "safeBoolForKey:", CFSTR("isSelected")) & 1) != 0)
      v4 = *MEMORY[0x24BDF7400];
    else
      v4 = 0;
    return v6 | v5 | v4;
  }
  else
  {
    v9 = (id)-[UIControlAccessibility accessibilityUserDefinedTraits](v14, "accessibilityUserDefinedTraits");
    v15 = objc_msgSend(v9, "unsignedLongLongValue");

  }
  return v15;
}

- (id)_accessibilityAuditIssuesWithOptions:(id)a3
{
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  char v11;
  id v12;
  objc_super v13;
  id v14;
  id location[2];
  UIControlAccessibility *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13.receiver = v16;
  v13.super_class = (Class)UIControlAccessibility;
  v14 = -[UIControlAccessibility _accessibilityAuditIssuesWithOptions:](&v13, sel__accessibilityAuditIssuesWithOptions_, location[0]);
  if (!v14)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = v14;
    v14 = v3;

  }
  v12 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "optionsDictionaryForAuditTest:inDictionary:", *MEMORY[0x24BDFE8A0], location[0]);
  v11 = 0;
  v11 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", *MEMORY[0x24BDFE8B0], v12) & 1;
  if (v11)
  {
    v10 = -[UIControlAccessibility safeBoolForKey:](v16, "safeBoolForKey:", CFSTR("isEnabled")) & 1;
    v9 = -[UIControlAccessibility accessibilityTraits](v16, "accessibilityTraits");
    if ((v10 & 1) == 0 && (v9 & *MEMORY[0x24BDF73E8]) != *MEMORY[0x24BDF73E8])
    {
      v8 = (id)objc_msgSend(MEMORY[0x24BEBAE08], "_axAuditGetTextFromObject:", v16);
      v7 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "dictionaryWithAXAuditIssue:element:additionalInfo:identifier:foregroundColor:backgroundColor:fontSize:elementRect:text:", 1003, v16, 0, 0, 0, 0, 0, v8);
      objc_msgSend(v14, "addObject:", v7);
      objc_storeStrong(&v7, 0);
      objc_storeStrong(&v8, 0);
    }
  }
  v6 = v14;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)canBecomeFocused
{
  char v3;
  objc_super v4;
  char v5;
  SEL v6;
  UIControlAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIControlAccessibility;
  v5 = -[UIControlAccessibility canBecomeFocused](&v4, sel_canBecomeFocused);
  if ((-[UIControlAccessibility _accessibilityIsFKARunningForFocusItem](v7, "_accessibilityIsFKARunningForFocusItem") & 1) == 0)
    return v5 & 1;
  v3 = 0;
  if (-[UIControlAccessibility isAccessibilityElement](v7, "isAccessibilityElement"))
    v3 = -[UIControlAccessibility accessibilityRespondsToUserInteraction](v7, "accessibilityRespondsToUserInteraction");
  return v3 & 1;
}

@end
