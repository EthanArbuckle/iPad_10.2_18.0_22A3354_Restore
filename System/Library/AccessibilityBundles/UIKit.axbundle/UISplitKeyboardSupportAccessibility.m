@implementation UISplitKeyboardSupportAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISplitKeyboardSupport");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISplitKeyboardSupport"), CFSTR("translateDetected:"), "v", "@", 0);
  objc_storeStrong(v4, obj);
}

- (id)_axLastLocationDescription
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UISplitKeyboardSupportAccessibility___axLastLocationDescription);
  else
    return 0;
}

- (void)_axSetLastLocationDescription:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (void)translateDetected:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UISplitKeyboardSupportAccessibility *v7;
  UIAccessibilityNotifications notification;
  id v9;
  id argument;
  double Height;
  double Width;
  CGRect v13;
  id v14;
  id v15;
  id v16;
  objc_super v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id location[2];
  UISplitKeyboardSupportAccessibility *v23;
  CGRect v24;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_opt_class();
  v19 = (id)__UIAccessibilityCastAsClass();
  v18 = v19;
  objc_storeStrong(&v19, 0);
  v21 = v18;
  v17.receiver = v23;
  v17.super_class = (Class)UISplitKeyboardSupportAccessibility;
  -[UISplitKeyboardSupportAccessibility translateDetected:](&v17, sel_translateDetected_, location[0]);
  if ((objc_msgSend(MEMORY[0x24BDF6B38], "isFloating") & 1) != 0)
  {
    if (objc_msgSend(v21, "state") == 1)
    {
      notification = *MEMORY[0x24BDF71E8];
      v9 = accessibilityLocalizedString(CFSTR("keyboard.floating.begin.move"));
      UIAccessibilityPostNotification(notification, v9);

    }
    else if (objc_msgSend(v21, "state") == 2)
    {
      v16 = -[UISplitKeyboardSupportAccessibility _axLastLocationDescription](v23);
      v15 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
      v14 = (id)objc_msgSend(v15, "window");
      objc_msgSend(v14, "bounds");
      v13 = v24;
      Width = CGRectGetWidth(v24);
      Height = CGRectGetHeight(v13);
      v7 = v23;
      objc_msgSend(v15, "bounds");
      AX_CGRectGetCenter();
      objc_msgSend(v15, "convertPoint:toView:", 0, v3, v4);
      argument = -[UISplitKeyboardSupportAccessibility _axDescriptionForPoint:windowWidth:windowHeight:]((uint64_t)v7, v5, v6, Width, Height);
      if ((objc_msgSend(v16, "isEqualToString:", argument) & 1) == 0)
      {
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
        -[UISplitKeyboardSupportAccessibility _axSetLastLocationDescription:]((uint64_t)v23, argument);
      }
      objc_storeStrong(&argument, 0);
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v16, 0);
    }
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (id)_axDescriptionForPoint:(double)a3 windowWidth:(double)a4 windowHeight:(double)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  id v20;

  v18 = a2;
  v19 = a3;
  v17 = a1;
  v16 = a4;
  v15 = a5;
  if (a1)
  {
    v14 = 0;
    if (v18 >= v16 / 3.0)
    {
      if (v18 <= 2.0 * v16 / 3.0)
      {
        if (v19 < v15 / 3.0)
        {
          v10 = accessibilityLocalizedString(CFSTR("keyboard.floating.top"));
          v11 = v14;
          v14 = v10;

          goto LABEL_21;
        }
        if (v19 <= 2.0 * v15 / 3.0)
          v7 = accessibilityLocalizedString(CFSTR("keyboard.floating.center"));
        else
          v7 = accessibilityLocalizedString(CFSTR("keyboard.floating.bottom"));
      }
      else
      {
        if (v19 < v15 / 3.0)
        {
          v8 = accessibilityLocalizedString(CFSTR("keyboard.floating.top.right"));
          v9 = v14;
          v14 = v8;

          goto LABEL_21;
        }
        if (v19 <= 2.0 * v15 / 3.0)
          v7 = accessibilityLocalizedString(CFSTR("keyboard.floating.right"));
        else
          v7 = accessibilityLocalizedString(CFSTR("keyboard.floating.bottom.right"));
      }
    }
    else
    {
      if (v19 < v15 / 3.0)
      {
        v5 = accessibilityLocalizedString(CFSTR("keyboard.floating.top.left"));
        v6 = v14;
        v14 = v5;

LABEL_21:
        v20 = v14;
        objc_storeStrong(&v14, 0);
        return v20;
      }
      if (v19 <= 2.0 * v15 / 3.0)
        v7 = accessibilityLocalizedString(CFSTR("keyboard.floating.left"));
      else
        v7 = accessibilityLocalizedString(CFSTR("keyboard.floating.bottom.left"));
    }
    v12 = v14;
    v14 = v7;

    goto LABEL_21;
  }
  v20 = 0;
  return v20;
}

@end
