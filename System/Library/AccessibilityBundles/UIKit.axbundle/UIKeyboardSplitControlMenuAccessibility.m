@implementation UIKeyboardSplitControlMenuAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardSplitControlMenu");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIInputSwitcherTableView"), CFSTR("UITableView"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIKeyboardSplitControlMenu"), CFSTR("UIKeyboardMenuView"));
  objc_storeStrong(location, 0);
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  UIAccessibilityNotifications v3;
  id v4;
  id v5;
  UIAccessibilityNotifications notification;
  id v7;
  id v8;
  id v9;
  id v10;
  objc_super v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16[2];
  UIKeyboardSplitControlMenuAccessibility *v17;
  CGPoint v18;

  v18 = a3;
  v17 = self;
  v16[1] = (id)a2;
  v15 = 0;
  objc_opt_class();
  v8 = (id)-[UIKeyboardSplitControlMenuAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("m_table"));
  v14 = (id)__UIAccessibilityCastAsClass();

  v13 = v14;
  objc_storeStrong(&v14, 0);
  v16[0] = v13;
  v12 = (id)objc_msgSend(v13, "indexPathForSelectedRow");
  v11.receiver = v17;
  v11.super_class = (Class)UIKeyboardSplitControlMenuAccessibility;
  -[UIKeyboardSplitControlMenuAccessibility updateSelectionWithPoint:](&v11, sel_updateSelectionWithPoint_, v18.x, v18.y);
  v10 = (id)objc_msgSend(v16[0], "indexPathForSelectedRow");
  if (v12 != v10 && (objc_msgSend(v12, "isEqual:", v10) & 1) == 0)
  {
    if (v10)
    {
      v9 = (id)objc_msgSend(v16[0], "cellForRowAtIndexPath:", v10);
      if (v9)
      {
        v3 = *MEMORY[0x24BDF71E8];
        v5 = (id)objc_msgSend(v9, "textLabel");
        v4 = (id)objc_msgSend(v5, "text");
        UIAccessibilityPostNotification(v3, v4);

      }
      objc_storeStrong(&v9, 0);
    }
    else
    {
      notification = *MEMORY[0x24BDF71E8];
      v7 = accessibilityLocalizedString(CFSTR("keyboard.cancel"));
      UIAccessibilityPostNotification(notification, v7);

    }
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v16, 0);
}

@end
