@implementation _UITextChoiceAccelerationAssistantAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UITextChoiceAccelerationAssistant");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UITextChoiceAccelerationAssistant"), CFSTR("showPromptForReplacementCandidate:delay:"), "B", "@", "d", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)showPromptForReplacementCandidate:(id)a3 delay:(double)a4
{
  char v5;
  objc_super v7;
  char v8;
  double v9;
  id location[2];
  _UITextChoiceAccelerationAssistantAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v8 = 0;
  v7.receiver = v11;
  v7.super_class = (Class)_UITextChoiceAccelerationAssistantAccessibility;
  v8 = -[_UITextChoiceAccelerationAssistantAccessibility showPromptForReplacementCandidate:delay:](&v7, sel_showPromptForReplacementCandidate_delay_, location[0], a4);
  if (v8)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAEB0], 0);
  v5 = v8;
  objc_storeStrong(location, 0);
  return v5 & 1;
}

@end
