@implementation SessionOverlayPresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.AccessibilitySessionOverlayPresenter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SeymourUI.AccessibilitySessionOverlayPresenter"), CFSTR("accessibilityAnnounceEvent:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SeymourUI.AccessibilitySessionOverlayPresenter"), CFSTR("accessibilityAnnounceTimer:start:"), "v", "d", "B", 0);

}

+ (void)accessibilityAnnounceEvent:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionOverlayPresenterAccessibility;
  v3 = a3;
  objc_msgSendSuper2(&v4, sel_accessibilityAnnounceEvent_, v3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v3);

}

+ (void)accessibilityAnnounceTimer:(double)a3 start:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  void *v8;
  UIAccessibilityNotifications v9;
  void *v10;
  UIAccessibilityNotifications v11;
  uint64_t v12;
  objc_super v13;

  v4 = a4;
  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_METACLASS___SessionOverlayPresenterAccessibility;
  objc_msgSendSuper2(&v13, sel_accessibilityAnnounceTimer_start_);
  if (v4)
  {
    v6 = ((int)a3 % 60);
    v7 = (void *)MEMORY[0x24BDD17C8];
    if ((int)a3 < 60)
    {
      accessibilityLocalizedString(CFSTR("timer.start.short.format"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v6, v12);
    }
    else
    {
      accessibilityLocalizedString(CFSTR("timer.start.long.format"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, (int)a3 / 0x3CuLL, v6);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x24BDF71E8];
  }
  else
  {
    v9 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("timer.end"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
  }
  UIAccessibilityPostNotification(v11, v10);

}

@end
