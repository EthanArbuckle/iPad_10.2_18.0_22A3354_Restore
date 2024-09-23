@implementation UIInputWindowControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputWindowController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardImpl"), CFSTR("candidateController"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardCandidateController"), CFSTR("isExtended"), "B", 0);
  v4 = CFSTR("UIInputWindowController");
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputViewSet"), CFSTR("inputView"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("updateInputAssistantViewForInputViewSet:"), v5, v3, 0);
  objc_storeStrong(v7, v6);
}

- (void)resetBackdropHeight
{
  char v2;
  objc_super v3;
  char v4;
  id v5;
  char v6;
  id v7;
  SEL v8;
  UIInputWindowControllerAccessibility *v9;

  v9 = self;
  v8 = a2;
  v6 = 0;
  v4 = 0;
  v2 = 0;
  if (UIAccessibilityIsSwitchControlRunning())
  {
    v7 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
    v6 = 1;
    v5 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("candidateController"));
    v4 = 1;
    v2 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isExtended"));
  }
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if ((v2 & 1) == 0)
  {
    v3.receiver = v9;
    v3.super_class = (Class)UIInputWindowControllerAccessibility;
    -[UIInputWindowControllerAccessibility resetBackdropHeight](&v3, sel_resetBackdropHeight);
  }
}

- (void)updateInputAssistantViewForInputViewSet:(id)a3
{
  id argument;
  id v4;
  objc_super v5;
  id location[2];
  UIInputWindowControllerAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UIInputWindowControllerAccessibility;
  -[UIInputWindowControllerAccessibility updateInputAssistantViewForInputViewSet:](&v5, sel_updateInputAssistantViewForInputViewSet_, location[0]);
  v4 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("inputView"));
  NSClassFromString(CFSTR("_UIRemoteKeyboardPlaceholderView"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    argument = (id)objc_msgSend(v4, "_accessibilityDescendantOfType:", objc_opt_class());
    if (argument)
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
    objc_storeStrong(&argument, 0);
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

@end
