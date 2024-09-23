@implementation UIUndoGestureInteractionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIUndoGestureInteraction");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIUndoGestureInteraction"), CFSTR("setUndoHUDType:visibility:"), "v", "q", "B", 0);
  objc_storeStrong(v4, obj);
}

- (void)setUndoHUDType:(int64_t)a3 visibility:(BOOL)a4
{
  objc_super v4;
  BOOL v5;
  int64_t v6;
  SEL v7;
  UIUndoGestureInteractionAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5 = a4;
  v4.receiver = self;
  v4.super_class = (Class)UIUndoGestureInteractionAccessibility;
  -[UIUndoGestureInteractionAccessibility setUndoHUDType:visibility:](&v4, sel_setUndoHUDType_visibility_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
