@implementation UIKeyboardImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardImpl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;
  const __CFString *v8;
  const char *v9;
  const __CFString *v10;
  const char *v11;
  id v12;
  id *v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = "{CGRect={CGPoint=dd}{CGSize=dd}}";
  v10 = CFSTR("UIKeyboardImpl");
  v6 = CFSTR("initWithFrame:");
  v9 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v10, CFSTR("m_geometryDelegate"), "<UIKeyboardImplGeometryDelegate>");
  v3 = CFSTR("UIKeyboardImplGeometryDelegate");
  objc_msgSend(location[0], "validateProtocol:hasRequiredInstanceMethod:");
  objc_msgSend(location[0], "validateProtocol:hasRequiredInstanceMethod:", v3, CFSTR("isMinimized"));
  v5 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v10);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, v6, v9, v4, 0);
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("showsCandidateBar"), 0);
  v11 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("showKeyboard"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("showKeyboardIfNeeded"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("hideKeyboard"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_showKeyboardIgnoringPolicyDelegate:"), v11, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("candidateController"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_shouldMinimizeForHardwareKeyboard"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardCandidateController"), CFSTR("activeViews"), v9, 0);
  v8 = CFSTR("UIKeyboardInputModeController");
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("suggestedInputModesForPreferredLanguages"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardInputMode"), CFSTR("identifier"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasClassMethod:withFullSignature:", v10, CFSTR("sharedInstance"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("setInputModeFromPreferences"), v11, 0);
  objc_storeStrong(v13, v12);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double v4;
  double v5;
  id obj;
  id v8;
  id v9;
  id v10;
  objc_super v11;
  int v12;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  id v21;
  char v22;
  id v23;
  id location[2];
  UIKeyboardImplAccessibility *v25;
  CGPoint v26;
  id v27;

  v26 = a3;
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if ((-[UIKeyboardImplAccessibility safeBoolForKey:](v25, "safeBoolForKey:", CFSTR("showsCandidateBar")) & 1) == 0)
    goto LABEL_6;
  v22 = 0;
  objc_opt_class();
  v10 = (id)-[UIKeyboardImplAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("candidateController"));
  v9 = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("activeViews"));
  v21 = (id)__UIAccessibilityCastAsClass();

  v20 = v21;
  objc_storeStrong(&v21, 0);
  v23 = v20;
  v18 = 0;
  objc_opt_class();
  v8 = (id)objc_msgSend(v23, "firstObject");
  v17 = (id)__UIAccessibilityCastAsClass();

  v16 = v17;
  objc_storeStrong(&v17, 0);
  v19 = v16;
  -[UIKeyboardImplAccessibility convertPoint:toView:](v25, "convertPoint:toView:", v16, v26.x, v26.y);
  v13 = v4;
  v14 = v5;
  v15 = (id)objc_msgSend(v16, "_accessibilityHitTest:withEvent:", location[0], v4, v5);
  if ((objc_msgSend(v15, "isAccessibilityElement") & 1) != 0)
  {
    v27 = v15;
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  obj = 0;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v23, 0);
  if (!v12)
  {
LABEL_6:
    v11.receiver = v25;
    v11.super_class = (Class)UIKeyboardImplAccessibility;
    v27 = -[UIKeyboardImplAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, location[0], v26.x, v26.y, obj);
    v12 = 1;
  }
  objc_storeStrong(location, 0);
  return v27;
}

- (UIKeyboardImplAccessibility)initWithFrame:(CGRect)a3
{
  UIKeyboardImplAccessibility *v4;
  objc_super v5;
  SEL v6;
  UIKeyboardImplAccessibility *v7;
  CGRect v8;

  v8 = a3;
  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardImplAccessibility;
  v7 = -[UIKeyboardImplAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  -[UIKeyboardImplAccessibility _accessibilityLoadAccessibilityInformation](v7, "_accessibilityLoadAccessibilityInformation");
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)updateAutocorrectPrompt:(id)a3
{
  id v3;
  id v4;
  char v5;
  objc_super v6;
  id location[2];
  UIKeyboardImplAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6.receiver = v8;
  v6.super_class = (Class)UIKeyboardImplAccessibility;
  -[UIKeyboardImplAccessibility updateAutocorrectPrompt:](&v6, sel_updateAutocorrectPrompt_, location[0]);
  v4 = (id)objc_msgSend(location[0], "candidate");
  v3 = (id)objc_msgSend(location[0], "input");
  v5 = objc_msgSend(v4, "isEqualToString:");

  if ((v5 & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAEB0], 0);
  objc_storeStrong(location, 0);
}

- (void)_showKeyboardIgnoringPolicyDelegate:(BOOL)a3
{
  id v3;
  int v4;
  objc_super v5;
  char v6;
  id v7;
  BOOL v8;
  SEL v9;
  UIKeyboardImplAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v3 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityValueForKey:", CFSTR("AXShowOnscreenKeyboardWithBraille"));
  LOBYTE(v4) = 0;
  if (v3)
    v4 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityBoolValueForKey:", CFSTR("AXShowOnscreenKeyboardWithBraille")) ^ 1;

  if ((v4 & 1) == 0)
  {
    v7 = (id)-[UIKeyboardImplAccessibility safeValueForKey:](v10, "safeValueForKey:", CFSTR("m_geometryDelegate"));
    v6 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("isMinimized")) & 1;
    v5.receiver = v10;
    v5.super_class = (Class)UIKeyboardImplAccessibility;
    -[UIKeyboardImplAccessibility _showKeyboardIgnoringPolicyDelegate:](&v5, sel__showKeyboardIgnoringPolicyDelegate_, v8);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    -[UIKeyboardImplAccessibility _accessibilityAnnounceHardwareKeyboardVisibilityChange:](v10, "_accessibilityAnnounceHardwareKeyboardVisibilityChange:", v6 & 1);
    objc_storeStrong(&v7, 0);
  }
}

- (void)hideKeyboard
{
  id v2;
  char v3;
  objc_super v4;
  char v5;
  id v6[2];
  UIKeyboardImplAccessibility *v7;

  v7 = self;
  v6[1] = (id)a2;
  v2 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityValueForKey:", CFSTR("AXShowOnscreenKeyboardWithBraille"));
  v3 = 0;
  if (v2)
    v3 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityBoolValueForKey:", CFSTR("AXShowOnscreenKeyboardWithBraille"));

  if ((v3 & 1) == 0)
  {
    v6[0] = (id)-[UIKeyboardImplAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("m_geometryDelegate"));
    v5 = objc_msgSend(v6[0], "safeBoolForKey:", CFSTR("isMinimized")) & 1;
    v4.receiver = v7;
    v4.super_class = (Class)UIKeyboardImplAccessibility;
    -[UIKeyboardImplAccessibility hideKeyboard](&v4, sel_hideKeyboard);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    -[UIKeyboardImplAccessibility _accessibilityAnnounceHardwareKeyboardVisibilityChange:](v7, "_accessibilityAnnounceHardwareKeyboardVisibilityChange:", v5 & 1);
    objc_storeStrong(v6, 0);
  }
}

- (void)dismissKeyboard
{
  objc_super v2;
  char v3;
  id v4[2];
  UIKeyboardImplAccessibility *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)-[UIKeyboardImplAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("m_geometryDelegate"));
  v3 = objc_msgSend(v4[0], "safeBoolForKey:", CFSTR("isMinimized")) & 1;
  v2.receiver = v5;
  v2.super_class = (Class)UIKeyboardImplAccessibility;
  -[UIKeyboardImplAccessibility dismissKeyboard](&v2, sel_dismissKeyboard);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  -[UIKeyboardImplAccessibility _accessibilityAnnounceHardwareKeyboardVisibilityChange:](v5, "_accessibilityAnnounceHardwareKeyboardVisibilityChange:", v3 & 1);
  objc_storeStrong(v4, 0);
}

- (void)_accessibilityAnnounceHardwareKeyboardVisibilityChange:(BOOL)a3
{
  UIAccessibilityNotifications v3;
  id v4;
  UIAccessibilityNotifications notification;
  id v6;
  char v7;
  id location;
  BOOL v9;
  SEL v10;
  UIKeyboardImplAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  location = (id)-[UIKeyboardImplAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("m_geometryDelegate"));
  if ((objc_msgSend(location, "safeBoolForKey:", CFSTR("isActive")) & 1) != 0)
  {
    v7 = objc_msgSend(location, "safeBoolForKey:", CFSTR("isMinimized")) & 1;
    if (!v7 || v9)
    {
      if ((v7 & 1) == 0 && v9)
      {
        v3 = *MEMORY[0x24BDF71E8];
        v4 = (id)accessibilityUIKitLocalizedString();
        UIAccessibilityPostNotification(v3, v4);

      }
    }
    else
    {
      notification = *MEMORY[0x24BDF71E8];
      v6 = (id)accessibilityUIKitLocalizedString();
      UIAccessibilityPostNotification(notification, v6);

    }
  }
  objc_storeStrong(&location, 0);
}

- (void)updateTextCandidateView
{
  objc_super v2;
  SEL v3;
  UIKeyboardImplAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardImplAccessibility;
  -[UIKeyboardImplAccessibility updateTextCandidateView](&v2, sel_updateTextCandidateView);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
}

- (void)showKeyboardIfNeeded
{
  objc_super v2;
  SEL v3;
  UIKeyboardImplAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardImplAccessibility;
  -[UIKeyboardImplAccessibility showKeyboardIfNeeded](&v2, sel_showKeyboardIfNeeded);
  if (-[UIKeyboardImplAccessibility _axShouldShowKeyboard]((uint64_t)v4))
    -[UIKeyboardImplAccessibility _axShowKeyboardIfHidden](v4);
}

- (BOOL)_axShouldShowKeyboard
{
  return a1 && UIAccessibilityIsSwitchControlRunning();
}

- (void)_axShowKeyboardIfHidden
{
  id v1;
  char v2;
  id v3;
  id v4;

  v4 = a1;
  if (a1)
  {
    v1 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("m_geometryDelegate"));
    v2 = objc_msgSend(v1, "safeBoolForKey:", CFSTR("isMinimized"));

    if ((v2 & 1) != 0)
    {
      v3 = v4;
      AXPerformSafeBlock();
      objc_storeStrong(&v3, 0);
    }
  }
}

- (BOOL)_shouldMinimizeForHardwareKeyboard
{
  objc_super v3;
  SEL v4;
  UIKeyboardImplAccessibility *v5;

  v5 = self;
  v4 = a2;
  if (-[UIKeyboardImplAccessibility _axShouldShowKeyboard]((uint64_t)self))
    return 0;
  v3.receiver = v5;
  v3.super_class = (Class)UIKeyboardImplAccessibility;
  return -[UIKeyboardImplAccessibility _shouldMinimizeForHardwareKeyboard](&v3, sel__shouldMinimizeForHardwareKeyboard);
}

uint64_t __54__UIKeyboardImplAccessibility__axShowKeyboardIfHidden__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showKeyboard", a1, a1);
}

@end
