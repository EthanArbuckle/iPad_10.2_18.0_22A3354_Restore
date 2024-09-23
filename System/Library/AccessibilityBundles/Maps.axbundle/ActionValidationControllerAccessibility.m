@implementation ActionValidationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ActionValidationController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("ActionValidationController"), CFSTR("presentAttributedString:inWindow:"), "v", "@", "@", 0);
}

+ (void)presentAttributedString:(id)a3 inWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  UIAccessibilityNotifications v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___ActionValidationControllerAccessibility;
  objc_msgSendSuper2(&v11, sel_presentAttributedString_inWindow_, v6, v7);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDF71E8];
  objc_msgSend(v8, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v9, v10);

}

@end
