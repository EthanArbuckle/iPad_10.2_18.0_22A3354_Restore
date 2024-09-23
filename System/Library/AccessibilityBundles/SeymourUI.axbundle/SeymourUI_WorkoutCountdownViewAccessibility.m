@implementation SeymourUI_WorkoutCountdownViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.WorkoutCountdownView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.WorkoutCountdownView"), CFSTR("accessibilityUpdateCountdownToStep:"), "v", "q", 0);
}

- (void)accessibilityUpdateCountdownToStep:(int64_t)a3
{
  void *v4;
  UIAccessibilityNotifications v5;
  UIAccessibilityNotifications v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SeymourUI_WorkoutCountdownViewAccessibility;
  -[SeymourUI_WorkoutCountdownViewAccessibility accessibilityUpdateCountdownToStep:](&v7, sel_accessibilityUpdateCountdownToStep_);
  if ((unint64_t)(a3 - 1) > 2)
  {
    if (a3)
      return;
    v6 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("ready"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BDF71E8];
  }
  UIAccessibilityPostNotification(v5, v4);

}

@end
