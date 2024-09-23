@implementation MTUITimerCountdownViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTUITimerCountdownView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTUITimerCountdownViewAccessibility;
  -[MTUITimerCountdownViewAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("timer.countdown.text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
