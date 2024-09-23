@implementation PHEmergencyDialerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHEmergencyDialerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PHEmergencyDialerViewController"), CFSTR("_dialerView"), "PHEmergencyHandsetDialerView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHEmergencyHandsetDialerView"), CFSTR("PHAbstractDialerView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAbstractDialerView"), CFSTR("callButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHEmergencyDialerViewController"), CFSTR("medicalIDButtonTapped:"), "v", "@", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHEmergencyDialerViewControllerAccessibility;
  -[PHEmergencyDialerViewControllerAccessibility viewDidDisappear:](&v9, sel_viewDidDisappear_, a3);
  -[PHEmergencyDialerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAccessibilityIsMainWindow:", 0);

  -[PHEmergencyDialerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityViewIsModal:", 0);

  v8 = (id *)MEMORY[0x24BDF74F8];
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetAllowsNotificationsDuringSuspension:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  objc_msgSend(*v8, "_accessibilitySetAllowsNotificationsDuringSuspension:", 0);
}

- (void)medicalIDButtonTapped:(id)a3
{
  id *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHEmergencyDialerViewControllerAccessibility;
  -[PHEmergencyDialerViewControllerAccessibility medicalIDButtonTapped:](&v4, sel_medicalIDButtonTapped_, a3);
  v3 = (id *)MEMORY[0x24BDF74F8];
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetAllowsNotificationsDuringSuspension:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  objc_msgSend(*v3, "_accessibilitySetAllowsNotificationsDuringSuspension:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHEmergencyDialerViewControllerAccessibility;
  -[PHEmergencyDialerViewControllerAccessibility viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  -[PHEmergencyDialerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dialerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("callButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("call.text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[PHEmergencyDialerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setAccessibilityIsMainWindow:", 1);

  -[PHEmergencyDialerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityViewIsModal:", 1);

  v11 = (id *)MEMORY[0x24BDF74F8];
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySetAllowsNotificationsDuringSuspension:", 1);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  objc_msgSend(*v11, "_accessibilitySetAllowsNotificationsDuringSuspension:", 0);
}

@end
