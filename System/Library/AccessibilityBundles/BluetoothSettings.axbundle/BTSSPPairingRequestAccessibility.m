@implementation BTSSPPairingRequestAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BTSSPPairingRequest");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BTSSPPairingRequest"), CFSTR("_alert"), "UIAlertController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BTSSPPairingRequest"), CFSTR("show"), "v", 0);

}

- (void)show
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BTSSPPairingRequestAccessibility;
  -[BTSSPPairingRequestAccessibility show](&v7, sel_show);
  objc_opt_class();
  -[BTSSPPairingRequestAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_alert"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v4;
  v5 = v4;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __40__BTSSPPairingRequestAccessibility_show__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF71E8];
  objc_msgSend(*(id *)(a1 + 32), "message");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

@end
