@implementation SessionTimerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SessionTimerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionTimerView"), CFSTR("updateDuration:"), "v", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)updateDuration:(double)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SessionTimerViewAccessibility;
  -[SessionTimerViewAccessibility updateDuration:](&v10, sel_updateDuration_);
  v5 = ((int)a3 % 60);
  v6 = (void *)MEMORY[0x24BDD17C8];
  if ((int)a3 < 60)
  {
    accessibilityLocalizedString(CFSTR("countdown.short.format"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v5, v9);
  }
  else
  {
    accessibilityLocalizedString(CFSTR("countdown.long.format"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, (int)a3 / 0x3CuLL, v5);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SessionTimerViewAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v8);
}

@end
