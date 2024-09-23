@implementation PKPeerPaymentMessagesNumberPadViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPeerPaymentMessagesNumberPadView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessagesNumberPadView"), CFSTR("actionHandler"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessagesNumberPadView"), CFSTR("enabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPeerPaymentMessagesNumberPadView"), CFSTR("_handleActionButton:"), "v", "@", 0);

}

- (void)_handleActionButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPeerPaymentMessagesNumberPadViewAccessibility;
  -[PKPeerPaymentMessagesNumberPadViewAccessibility _handleActionButton:](&v9, sel__handleActionButton_, v4);
  -[PKPeerPaymentMessagesNumberPadViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionHandler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || !-[PKPeerPaymentMessagesNumberPadViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("enabled")))
  {
    goto LABEL_5;
  }

  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDFEA60];
    objc_msgSend(v4, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axAttributedStringWithString:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *MEMORY[0x24BDBD270];
    objc_msgSend(v5, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEB60]);
    objc_msgSend(v5, "setAttribute:forKey:", v8, *MEMORY[0x24BDFECC8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);
LABEL_5:

  }
}

@end
