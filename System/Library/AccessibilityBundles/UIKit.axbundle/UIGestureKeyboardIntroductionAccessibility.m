@implementation UIGestureKeyboardIntroductionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIGestureKeyboardIntroduction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIGestureKeyboardIntroduction");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v3 = "UIKBKeyView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIGestureKeyboardIntroduction"), CFSTR("m_firstKeyView"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIGestureKeyboardIntroduction"), CFSTR("m_secondKeyView"), "UIKBKeyView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIGestureKeyboardIntroduction"), CFSTR("showGestureKeyboardIntroduction"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBKeyView"), CFSTR("key"), "@", 0);
  objc_storeStrong(v6, obj);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id obj;
  uint64_t v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  _QWORD __b[8];
  id v29;
  id v30;
  id v31;
  char v32;
  id v33;
  id v34;
  id v35;
  char v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;
  SEL v42;
  UIGestureKeyboardIntroductionAccessibility *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v43 = self;
  v42 = a2;
  v41.receiver = self;
  v41.super_class = (Class)UIGestureKeyboardIntroductionAccessibility;
  -[UIGestureKeyboardIntroductionAccessibility _accessibilityLoadAccessibilityInformation](&v41, sel__accessibilityLoadAccessibilityInformation);
  v40 = (id)-[UIGestureKeyboardIntroductionAccessibility safeUIViewForKey:](v43, "safeUIViewForKey:", CFSTR("m_view"));
  v39 = (id)-[UIGestureKeyboardIntroductionAccessibility safeUIViewForKey:](v43, "safeUIViewForKey:", CFSTR("m_firstKeyView"));
  v38 = (id)-[UIGestureKeyboardIntroductionAccessibility safeUIViewForKey:](v43, "safeUIViewForKey:", CFSTR("m_secondKeyView"));
  v36 = 0;
  objc_opt_class();
  v22 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("key"));
  v35 = (id)__UIAccessibilityCastAsClass();

  v34 = v35;
  objc_storeStrong(&v35, 0);
  v37 = v34;
  v32 = 0;
  objc_opt_class();
  v21 = (id)objc_msgSend(v38, "safeValueForKey:", CFSTR("key"));
  v31 = (id)__UIAccessibilityCastAsClass();

  v30 = v31;
  objc_storeStrong(&v31, 0);
  v33 = v30;
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(v40, "subviews");
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
  if (v20)
  {
    v16 = *(_QWORD *)__b[2];
    v17 = 0;
    v18 = v20;
    while (1)
    {
      v15 = v17;
      if (*(_QWORD *)__b[2] != v16)
        objc_enumerationMutation(obj);
      v29 = *(id *)(__b[1] + 8 * v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = 0;
        objc_msgSend(v29, "center");
        v25 = v2;
        v26 = v3;
        objc_msgSend(v39, "center");
        if (__CGPointEqualToPoint_0(v25, v26, v4, v5))
        {
          objc_storeStrong(&v27, v37);
        }
        else
        {
          objc_msgSend(v29, "center");
          v23 = v6;
          v24 = v7;
          objc_msgSend(v38, "center");
          if (__CGPointEqualToPoint_0(v23, v24, v8, v9))
            objc_storeStrong(&v27, v33);
        }
        if (v27)
        {
          v13 = (id)objc_msgSend(v37, "displayString");
          v12 = (id)objc_msgSend(v37, "secondaryDisplayStrings");
          v11 = (id)MEMORY[0x2348C3584]();
          v10 = (id)__UIAXStringForVariables();
          objc_msgSend(v29, "setAccessibilityLabel:", v11, CFSTR("__AXStringForVariablesSentinel"));

          v14 = (id)accessibilityUIKitLocalizedString();
          objc_msgSend(v29, "setAccessibilityHint:");

        }
        objc_storeStrong(&v27, 0);
      }
      ++v17;
      if (v15 + 1 >= v18)
      {
        v17 = 0;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
        if (!v18)
          break;
      }
    }
  }

  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
}

- (BOOL)showGestureKeyboardIntroduction
{
  objc_super v3;
  char v4;
  SEL v5;
  UIGestureKeyboardIntroductionAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIGestureKeyboardIntroductionAccessibility;
  v4 = -[UIGestureKeyboardIntroductionAccessibility showGestureKeyboardIntroduction](&v3, sel_showGestureKeyboardIntroduction);
  -[UIGestureKeyboardIntroductionAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  return v4 & 1;
}

@end
