@implementation UIKeyboardTypingStyleEstimatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardTypingStyleEstimator");
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
  v3 = CFSTR("UIKeyboardTypingStyleEstimator");
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("endedContinuousPath"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (BOOL)_accessibilityKeyboardIsContinuousPathTracking
{
  return -[UIKeyboardTypingStyleEstimatorAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("ContinuousPath"), a2, self) & 1;
}

- (void)beganContinuousPath
{
  objc_super v2;
  SEL v3;
  UIKeyboardTypingStyleEstimatorAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardTypingStyleEstimatorAccessibility;
  -[UIKeyboardTypingStyleEstimatorAccessibility beganContinuousPath](&v2, sel_beganContinuousPath);
  -[UIKeyboardTypingStyleEstimatorAccessibility _accessibilitySetBoolValue:forKey:](v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("ContinuousPath"));
}

- (void)endedContinuousPath
{
  objc_super v2;
  SEL v3;
  UIKeyboardTypingStyleEstimatorAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardTypingStyleEstimatorAccessibility;
  -[UIKeyboardTypingStyleEstimatorAccessibility endedContinuousPath](&v2, sel_endedContinuousPath);
  -[UIKeyboardTypingStyleEstimatorAccessibility _accessibilitySetBoolValue:forKey:](v4, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("ContinuousPath"));
}

@end
