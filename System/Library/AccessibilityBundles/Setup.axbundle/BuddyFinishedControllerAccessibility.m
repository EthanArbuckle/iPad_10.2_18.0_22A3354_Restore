@implementation BuddyFinishedControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BuddyFinishedController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("BuddyFinishedController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("BuddyFinishedController"), CFSTR("instructionalLabel"), "@");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6.receiver = self;
  v6.super_class = (Class)BuddyFinishedControllerAccessibility;
  -[BuddyFinishedControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[BuddyFinishedControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("instructionalLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setIsAccessibilityElement:", 1);
    objc_msgSend(v4, "setAccessibilityRespondsToUserInteraction:", 1);
    v7[0] = *MEMORY[0x24BE00358];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_iosAccessibilitySetValue:forAttribute:", v5, 12015);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BuddyFinishedControllerAccessibility;
  -[BuddyFinishedControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[BuddyFinishedControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
