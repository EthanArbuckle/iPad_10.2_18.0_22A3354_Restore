@implementation MTATimerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTATimerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (MTATimerViewControllerAccessibility)init
{
  MTATimerViewControllerAccessibility *v2;
  MTATimerViewControllerAccessibility *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTATimerViewControllerAccessibility;
  v2 = -[MTATimerViewControllerAccessibility init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[MTATimerViewControllerAccessibility safeValueForKey:](v2, "safeValueForKey:", CFSTR("navigationItem"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("leftBarButtonItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityLocalizedString(CFSTR("timer.alert.tone.edit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityHint:", v6);

  }
  return v3;
}

- (void)startUpdatingTimerUI
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTATimerViewControllerAccessibility;
  -[MTATimerViewControllerAccessibility startUpdatingTimerUI](&v2, sel_startUpdatingTimerUI);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)stopUpdatingTimerUI
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTATimerViewControllerAccessibility;
  -[MTATimerViewControllerAccessibility stopUpdatingTimerUI](&v2, sel_stopUpdatingTimerUI);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
