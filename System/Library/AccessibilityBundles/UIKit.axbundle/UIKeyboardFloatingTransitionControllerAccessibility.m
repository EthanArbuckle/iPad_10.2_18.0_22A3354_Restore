@implementation UIKeyboardFloatingTransitionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardFloatingTransitionController");
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
  v3 = "d";
  v4 = CFSTR("UIKeyboardFloatingTransitionController");
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "d", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("progress"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("startedFromFloating"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("finalizeTransition"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)_axAnnounceFloating:(uint64_t)a1
{
  UIAccessibilityNotifications notification;
  char v3;
  id v4;
  char v5;
  id v6;

  if (a1)
  {
    notification = *MEMORY[0x24BDF71E8];
    v5 = 0;
    v3 = 0;
    if ((a2 & 1) != 0)
    {
      v6 = accessibilityLocalizedString(CFSTR("keyboard.update.floating"));
      v5 = 1;
      UIAccessibilityPostNotification(notification, v6);
    }
    else
    {
      v4 = accessibilityLocalizedString(CFSTR("keyboard.update.docked"));
      v3 = 1;
      UIAccessibilityPostNotification(notification, v4);
    }
    if ((v3 & 1) != 0)

    if ((v5 & 1) != 0)
  }
}

- (void)setProgress:(double)a3
{
  double v3;
  char v4;
  char v5;
  char v6;
  char v7;
  objc_super v8;
  char v9;
  char v10;
  double v11;
  double v12;
  SEL v13;
  UIKeyboardFloatingTransitionControllerAccessibility *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  -[UIKeyboardFloatingTransitionControllerAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("progress"));
  v11 = v3;
  v10 = -[UIKeyboardFloatingTransitionControllerAccessibility safeBoolForKey:](v14, "safeBoolForKey:", CFSTR("startedFromFloating")) & 1;
  v9 = 0;
  if (v11 >= 0.5 || (v7 = 1, (v10 & 1) == 0))
  {
    v6 = 0;
    if (v11 >= 0.5)
      v6 = v10 ^ 1;
    v7 = v6;
  }
  v9 = v7 & 1;
  v8.receiver = v14;
  v8.super_class = (Class)UIKeyboardFloatingTransitionControllerAccessibility;
  -[UIKeyboardFloatingTransitionControllerAccessibility setProgress:](&v8, sel_setProgress_, v12);
  if (v12 >= 0.5 || (v5 = 1, (v10 & 1) == 0))
  {
    v4 = 0;
    if (v12 >= 0.5)
      v4 = v10 ^ 1;
    v5 = v4;
  }
  if ((v9 & 1) != (v5 & 1))
    -[UIKeyboardFloatingTransitionControllerAccessibility _axAnnounceFloating:]((uint64_t)v14, v5 & 1);
}

- (void)finalizeTransition
{
  UIAccessibilityNotifications notification;
  id v3;
  objc_super v4;
  SEL v5;
  UIKeyboardFloatingTransitionControllerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardFloatingTransitionControllerAccessibility;
  -[UIKeyboardFloatingTransitionControllerAccessibility finalizeTransition](&v4, sel_finalizeTransition);
  -[UIKeyboardFloatingTransitionControllerAccessibility _axAnnounceFloating:]((uint64_t)v6, objc_msgSend(MEMORY[0x24BDF6B38], "isFloating") & 1);
  notification = *MEMORY[0x24BDF72C8];
  v3 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  UIAccessibilityPostNotification(notification, v3);

}

@end
