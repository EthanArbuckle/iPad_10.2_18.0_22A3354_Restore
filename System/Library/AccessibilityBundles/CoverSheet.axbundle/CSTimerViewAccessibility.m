@implementation CSTimerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSTimerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSTimerView"), CFSTR("_endDate"), "NSDate");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSTimerView"), CFSTR("UIView"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CSTimerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_endDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceNow");
  MEMORY[0x23490CA4C](1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilitySBLocalizedString(CFSTR("lock.screen.timer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSTimerViewAccessibility;
  -[CSTimerViewAccessibility setAlpha:](&v5, sel_setAlpha_);
  if (a3 == 1.0)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], self);
}

@end
