@implementation _UIKeyboardTextSelectionGestureControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIKeyboardTextSelectionGestureController");
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
  v4 = "q";
  v3 = CFSTR("_UIKeyboardTextSelectionGestureController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("panGestureState"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)setPanGestureState:(int64_t)a3
{
  UIAccessibilityNotifications v3;
  id v4;
  UIAccessibilityNotifications notification;
  id v6;
  id v7;
  uint64_t v8;
  objc_super v9;
  uint64_t v10;
  int64_t v11;
  SEL v12;
  _UIKeyboardTextSelectionGestureControllerAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v7 = (id)-[_UIKeyboardTextSelectionGestureControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("panGestureState"));
  v8 = objc_msgSend(v7, "integerValue");

  v10 = v8;
  v9.receiver = v13;
  v9.super_class = (Class)_UIKeyboardTextSelectionGestureControllerAccessibility;
  -[_UIKeyboardTextSelectionGestureControllerAccessibility setPanGestureState:](&v9, sel_setPanGestureState_, v11);
  if (v11 != v10)
  {
    if (v10 || v11 != 1)
    {
      if (v10 == 1 || !v11)
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
}

@end
