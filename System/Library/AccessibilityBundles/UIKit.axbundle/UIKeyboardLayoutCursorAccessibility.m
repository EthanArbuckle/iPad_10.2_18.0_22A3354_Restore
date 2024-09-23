@implementation UIKeyboardLayoutCursorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardLayoutCursor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  id obj;
  id *v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UIKeyboardLayoutCursor");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("handleVisualDirectionalInput:"), "B", "i", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_keyplaneName"), "NSString");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_keyplane"), "UIKBTree");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKBTree"), CFSTR("componentName"), "@", 0);
  objc_storeStrong(v5, obj);
}

- (id)_accessibilityLastFocusChangeNotificationTimer
{
  return objc_getAssociatedObject(self, &__UIKeyboardLayoutCursorAccessibility___accessibilityLastFocusChangeNotificationTimer);
}

- (void)_accessibilitySetLastFocusChangeNotificationTimer:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (void)_axPostFocusChangeNotification
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)setSelectedKeyIndex:(int64_t)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13[3];
  id from;
  id v15;
  objc_super v16;
  int64_t v17;
  SEL v18;
  UIKeyboardLayoutCursorAccessibility *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardLayoutCursorAccessibility;
  -[UIKeyboardLayoutCursorAccessibility setSelectedKeyIndex:](&v16, sel_setSelectedKeyIndex_, a3);
  v3 = -[UIKeyboardLayoutCursorAccessibility _accessibilityLastFocusChangeNotificationTimer](v19, "_accessibilityLastFocusChangeNotificationTimer");
  v7 = v3 != 0;

  if (!v7)
  {
    v5 = objc_alloc(MEMORY[0x24BDFE490]);
    v6 = MEMORY[0x24BDAC9B8];
    v15 = (id)objc_msgSend(v5, "initWithTargetSerialQueue:");

    objc_msgSend(v15, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[UIKeyboardLayoutCursorAccessibility _accessibilitySetLastFocusChangeNotificationTimer:](v19, "_accessibilitySetLastFocusChangeNotificationTimer:", v15);
    objc_storeStrong(&v15, 0);
  }
  objc_initWeak(&from, v19);
  v4 = -[UIKeyboardLayoutCursorAccessibility _accessibilityLastFocusChangeNotificationTimer](v19, "_accessibilityLastFocusChangeNotificationTimer");
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __59__UIKeyboardLayoutCursorAccessibility_setSelectedKeyIndex___block_invoke;
  v12 = &unk_24FF3DCB0;
  objc_copyWeak(v13, &from);
  objc_msgSend(v4, "afterDelay:processBlock:", &v8, 0.1);

  objc_destroyWeak(v13);
  objc_destroyWeak(&from);
}

void __59__UIKeyboardLayoutCursorAccessibility_setSelectedKeyIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axPostFocusChangeNotification");

}

@end
