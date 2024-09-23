@implementation AEMessagesShelfViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AEMessagesShelfViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AEMessagesShelfViewController"), CFSTR("_toggleIris:"), "v", "@", 0);
}

- (void)_toggleIris:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEMessagesShelfViewControllerAccessibility;
  v3 = a3;
  -[AEMessagesShelfViewControllerAccessibility _toggleIris:](&v4, sel__toggleIris_, v3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v3);

}

@end
