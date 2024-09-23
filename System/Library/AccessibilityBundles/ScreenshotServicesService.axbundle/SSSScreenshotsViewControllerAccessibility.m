@implementation SSSScreenshotsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SSSScreenshotsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axDidPostNotification
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetDidPostNotification:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SSSScreenshotsViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSSScreenshotsViewController"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SSSScreenshotsViewController"), CFSTR("_configureBarsIfNecessary"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSScreenshotsViewController"), CFSTR("_undoItem"), "UIBarButtonItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SSSScreenshotsViewController"), CFSTR("_redoItem"), "UIBarButtonItem");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSScreenshotsViewControllerAccessibility;
  -[SSSScreenshotsViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SSSScreenshotsViewControllerAccessibility _axSetDidPostNotification:](self, "_axSetDidPostNotification:", 0);
  -[SSSScreenshotsViewControllerAccessibility _accessibilityPostLayoutChangeIfNecessary](self, "_accessibilityPostLayoutChangeIfNecessary");
}

- (void)_configureBarsIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSScreenshotsViewControllerAccessibility;
  -[SSSScreenshotsViewControllerAccessibility _configureBarsIfNecessary](&v3, sel__configureBarsIfNecessary);
  -[SSSScreenshotsViewControllerAccessibility _accessibilityAnnotateItems](self, "_accessibilityAnnotateItems");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSSScreenshotsViewControllerAccessibility;
  -[SSSScreenshotsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SSSScreenshotsViewControllerAccessibility _accessibilityAnnotateItems](self, "_accessibilityAnnotateItems");
  -[SSSScreenshotsViewControllerAccessibility _accessibilityPostLayoutChangeIfNecessary](self, "_accessibilityPostLayoutChangeIfNecessary");
}

- (void)_accessibilityAnnotateItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SSSScreenshotsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_undoItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("undo.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[SSSScreenshotsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_redoItem"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("redo.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

}

- (void)_accessibilityPostLayoutChangeIfNecessary
{
  void *v3;
  uint64_t v4;
  UIAccessibilityNotifications v5;
  void *v6;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_appearState") == 2
    && !-[SSSScreenshotsViewControllerAccessibility _axDidPostNotification](self, "_axDidPostNotification"))
  {
    v4 = -[SSSScreenshotsViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("state"));

    if (!v4)
    {
      v5 = *MEMORY[0x24BDF72C8];
      -[SSSScreenshotsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v5, v6);

      -[SSSScreenshotsViewControllerAccessibility _axSetDidPostNotification:](self, "_axSetDidPostNotification:", 1);
    }
  }
  else
  {

  }
}

@end
