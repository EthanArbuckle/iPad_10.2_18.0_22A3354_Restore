@implementation SBCallAlertDisplayAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBCallAlertDisplay");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)newBottomLockBarForDisplay:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SBCallAlertDisplayAccessibility;
  v3 = objc_msgSendSuper2(&v6, sel_newBottomLockBarForDisplay_, a3);
  accessibilityLocalizedString(CFSTR("slide.to.answer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  return v3;
}

@end
