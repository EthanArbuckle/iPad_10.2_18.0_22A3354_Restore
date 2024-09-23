@implementation UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UISplitViewControllerPanelImplView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MailAppController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailAppController"), CFSTR("mostRecentMainScene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailMainScene"), CFSTR("splitViewController"), "@", 0);

}

- (id)_accessibilityScannerGroupElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit *v8;
  void *v9;
  void *v10;
  objc_super v12;
  char v13;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MailAppController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("mostRecentMainScene"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    objc_opt_class();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("splitViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "view");
    v8 = (UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit *)objc_claimAutoreleasedReturnValue();

    if (v8 != self
      || (v13 = 0,
          objc_opt_class(),
          __UIAccessibilityCastAsSafeCategory(),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "_accessibilitySplitViewControllerScannerGroupElements"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          !v9))
    {
      v12.receiver = self;
      v12.super_class = (Class)UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit;
      -[UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit _accessibilityScannerGroupElements](&v12, sel__accessibilityScannerGroupElements);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
