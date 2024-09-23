@implementation CKRecipientSearchListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKRecipientSearchListController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKRecipientSearchListController"), CFSTR("didSelectRecipient:atIndex:"), "v", "@", "Q", 0);
}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKRecipientSearchListControllerAccessibility;
  -[CKRecipientSearchListControllerAccessibility didSelectRecipient:atIndex:](&v4, sel_didSelectRecipient_atIndex_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
