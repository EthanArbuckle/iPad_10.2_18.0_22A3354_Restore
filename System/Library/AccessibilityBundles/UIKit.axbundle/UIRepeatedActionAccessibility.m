@implementation UIRepeatedActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIRepeatedAction");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIRepeatedAction"), CFSTR("setDisableRepeat:"), "v", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIApplication"), CFSTR("_keyRepeatAction"), "UIRepeatedAction");
  objc_storeStrong(v4, obj);
}

- (void)setDisableRepeat:(BOOL)a3
{
  BOOL v3;
  objc_super v4;
  char v5;
  UIRepeatedActionAccessibility *v6;
  BOOL v7;
  SEL v8;
  UIRepeatedActionAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v5 = 0;
  v3 = 0;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v6 = (UIRepeatedActionAccessibility *)(id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "safeValueForKey:", CFSTR("_keyRepeatAction"));
    v5 = 1;
    v3 = v9 == v6;
  }
  if ((v5 & 1) != 0)

  if (v3)
    v7 = 1;
  v4.receiver = v9;
  v4.super_class = (Class)UIRepeatedActionAccessibility;
  -[UIRepeatedActionAccessibility setDisableRepeat:](&v4, sel_setDisableRepeat_, v7);
}

@end
