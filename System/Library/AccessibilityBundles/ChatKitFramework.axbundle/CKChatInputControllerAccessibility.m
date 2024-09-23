@implementation CKChatInputControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKChatInputController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatInputController"), CFSTR("handwritingPresentationControllerDidShowHandwriting:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatInputController"), CFSTR("handwritingPresentationControllerWillHideHandwriting:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CKChatInputController"), CFSTR("CKSendMenuViewControllerDelegate"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKSendMenuViewControllerDelegate"), CFSTR("sendMenuViewControllerRequestDismiss:"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKHandwritingPresentationController"));

}

- (void)handwritingPresentationControllerDidShowHandwriting:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKChatInputControllerAccessibility;
  -[CKChatInputControllerAccessibility handwritingPresentationControllerDidShowHandwriting:](&v3, sel_handwritingPresentationControllerDidShowHandwriting_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)handwritingPresentationControllerWillHideHandwriting:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKChatInputControllerAccessibility;
  -[CKChatInputControllerAccessibility handwritingPresentationControllerWillHideHandwriting:](&v3, sel_handwritingPresentationControllerWillHideHandwriting_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)sendMenuViewControllerRequestDismiss:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKChatInputControllerAccessibility;
  -[CKChatInputControllerAccessibility sendMenuViewControllerRequestDismiss:](&v3, sel_sendMenuViewControllerRequestDismiss_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
