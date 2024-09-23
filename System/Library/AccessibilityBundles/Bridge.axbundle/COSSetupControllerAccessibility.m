@implementation COSSetupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSSetupController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSSetupController"), CFSTR("buddyControllerHold: beforePresentingBuddyController:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("COSSetupController"), CFSTR("blockGoingBackFromCurrentController"), "v", 0);

}

- (void)buddyControllerHold:(id)a3 beforePresentingBuddyController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)COSSetupControllerAccessibility;
  -[COSSetupControllerAccessibility buddyControllerHold:beforePresentingBuddyController:](&v13, sel_buddyControllerHold_beforePresentingBuddyController_, v6, v7);
  objc_opt_class();
  -[COSSetupControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = *MEMORY[0x24BDF7328];
  objc_msgSend(v11, "rightBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v10, v12);

}

- (void)blockGoingBackFromCurrentController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)COSSetupControllerAccessibility;
  -[COSSetupControllerAccessibility blockGoingBackFromCurrentController](&v9, sel_blockGoingBackFromCurrentController);
  objc_opt_class();
  -[COSSetupControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsAccessibilityElement:", 1);
    objc_msgSend(v8, "setAccessibilityTraits:", *MEMORY[0x24BEBB100] | *MEMORY[0x24BDF73B0]);

  }
}

@end
