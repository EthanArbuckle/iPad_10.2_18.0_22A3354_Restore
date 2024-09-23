@implementation PKPaymentAuthorizationServiceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentAuthorizationServiceViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPrevPaymentLabel
{
  JUMPOUT(0x234918CC4);
}

- (void)_axSetPrevPaymentLabel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("_addPassphraseViewControllerToHierarchy:withCompletion:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("_removePassphraseViewFromHierarchyWithCompletionHandler:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("stateMachine"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("_handleModelUpdate"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationStateMachine"), CFSTR("model"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationDataModel"), CFSTR("merchantName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("setFooterState:string:animated:withCompletion:"), "v", "q", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("_totalView"), "PKPaymentAuthorizationTotalView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationTotalView"), CFSTR("_labelView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationTotalView"), CFSTR("_valueView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("_passwordButtonView"), "PKPaymentAuthorizationPasswordButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("_footerView"), "PKPaymentAuthorizationFooterView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationFooterView"), CFSTR("_payWithPasscodeButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationFooterView"), CFSTR("_labelView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("_visibility"), "C");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKPaymentAuthorizationServiceViewController"), CFSTR("_physicalButtonState"), "NSInteger");

}

- (void)_accessibilitySetTotalMetaLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  -[PKPaymentAuthorizationServiceViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("stateMachine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeStringForKey:", CFSTR("merchantName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentAuthorizationServiceViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_totalView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_labelView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if (v14)
    v15 = v7;
  else
    v15 = 0;
  objc_msgSend(v11, "setAccessibilityLabel:", v15);

}

- (BOOL)_axPhysicalButtonIsVisible
{
  return -[PKPaymentAuthorizationServiceViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_physicalButtonState")) == 1;
}

- (BOOL)_axPaymentViewIsVisible
{
  return -[PKPaymentAuthorizationServiceViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_visibility"))- 1 < 2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  -[PKPaymentAuthorizationServiceViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PKPaymentAuthorizationServiceViewControllerAccessibility _accessibilitySetTotalMetaLabel](self, "_accessibilitySetTotalMetaLabel");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  -[PKPaymentAuthorizationServiceViewControllerAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)setFooterState:(int64_t)a3 string:(id)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  -[PKPaymentAuthorizationServiceViewControllerAccessibility setFooterState:string:animated:withCompletion:](&v7, sel_setFooterState_string_animated_withCompletion_, a3, a4, a5, a6);
  if (a3 != 9)
    AXPerformBlockOnMainThreadAfterDelay();
}

void __106__PKPaymentAuthorizationServiceViewControllerAccessibility_setFooterState_string_animated_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  UIAccessibilityNotifications v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_footerView"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeValueForKey:", CFSTR("_payWithPasscodeButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  objc_msgSend(v14, "safeValueForKey:", CFSTR("_labelView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "_axPaymentViewIsVisible"))
  {
    if (*(_QWORD *)(a1 + 40) == 4)
      v6 = v3;
    else
      v6 = 0;
    if (v6 == 1)
    {
      v7 = *MEMORY[0x24BDF72C8];
      v8 = v2;
LABEL_7:
      UIAccessibilityPostNotification(v7, v8);
      goto LABEL_13;
    }
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_axPrevPaymentLabel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9
        || (v10 = (void *)v9,
            objc_msgSend(*(id *)(a1 + 32), "_axPrevPaymentLabel"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "isEqual:", v5),
            v11,
            v10,
            (v12 & 1) == 0))
      {
        v13 = *(_QWORD *)(a1 + 40);
        switch(v13)
        {
          case 0:
          case 2:
          case 8:
            goto LABEL_12;
          case 1:
          case 4:
          case 5:
          case 6:
          case 7:
            goto LABEL_13;
          case 3:
            if (!objc_msgSend(*(id *)(a1 + 32), "_axPhysicalButtonIsVisible"))
              goto LABEL_13;
            v7 = *MEMORY[0x24BDF71E8];
            v8 = v5;
            break;
          default:
            if (v13 == 12)
            {
LABEL_12:
              UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);
              objc_msgSend(*(id *)(a1 + 32), "_axSetPrevPaymentLabel:", v5);
            }
            goto LABEL_13;
        }
        goto LABEL_7;
      }
    }
  }
LABEL_13:

}

- (void)_handleModelUpdate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  -[PKPaymentAuthorizationServiceViewControllerAccessibility _handleModelUpdate](&v3, sel__handleModelUpdate);
  -[PKPaymentAuthorizationServiceViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_addPassphraseViewControllerToHierarchy:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  v5 = a3;
  -[PKPaymentAuthorizationServiceViewControllerAccessibility _addPassphraseViewControllerToHierarchy:withCompletion:](&v8, sel__addPassphraseViewControllerToHierarchy_withCompletion_, v5, a4);
  objc_msgSend(v5, "view", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityViewIsModal:", 1);

  LODWORD(v6) = *MEMORY[0x24BDF7328];
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification((UIAccessibilityNotifications)v6, v7);
}

- (void)_removePassphraseViewFromHierarchyWithCompletionHandler:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  -[PKPaymentAuthorizationServiceViewControllerAccessibility _removePassphraseViewFromHierarchyWithCompletionHandler:](&v3, sel__removePassphraseViewFromHierarchyWithCompletionHandler_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)biometricAttemptFailed
{
  void *v3;
  int v4;
  objc_super v5;

  -[PKPaymentAuthorizationServiceViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_passwordButtonView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentAuthorizationServiceViewControllerAccessibility;
  -[PKPaymentAuthorizationServiceViewControllerAccessibility biometricAttemptFailed](&v5, sel_biometricAttemptFailed);
  if ((objc_msgSend(v3, "isHidden") & 1) == 0 && v4)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v3);

}

@end
