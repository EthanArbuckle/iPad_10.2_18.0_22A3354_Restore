@implementation SessionRingsPresenterAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.AccessibilitySessionRingsPresenter");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SeymourUI.AccessibilitySessionRingsPresenter"), CFSTR("onMoveRingCompletion"), "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SeymourUI.AccessibilitySessionRingsPresenter"), CFSTR("onExerciseRingCompletion"), "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SeymourUI.AccessibilitySessionRingsPresenter"), CFSTR("onStandRingCompletion"), "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SeymourUI.AccessibilitySessionRingsPresenter"), CFSTR("onAllRingsCompletion"), "v", 0);

}

+ (void)onMoveRingCompletion
{
  UIAccessibilityNotifications v2;
  void *v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionRingsPresenterAccessibility;
  objc_msgSendSuper2(&v4, sel_onMoveRingCompletion);
  v2 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("rings.closed.move"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

+ (void)onExerciseRingCompletion
{
  UIAccessibilityNotifications v2;
  void *v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionRingsPresenterAccessibility;
  objc_msgSendSuper2(&v4, sel_onExerciseRingCompletion);
  v2 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("rings.closed.exercise"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

+ (void)onStandRingCompletion
{
  UIAccessibilityNotifications v2;
  void *v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionRingsPresenterAccessibility;
  objc_msgSendSuper2(&v4, sel_onStandRingCompletion);
  v2 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("rings.closed.stand"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

+ (void)onAllRingsCompletion
{
  UIAccessibilityNotifications v2;
  void *v3;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___SessionRingsPresenterAccessibility;
  objc_msgSendSuper2(&v4, sel_onAllRingsCompletion);
  v2 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("rings.closed.all"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);

}

@end
