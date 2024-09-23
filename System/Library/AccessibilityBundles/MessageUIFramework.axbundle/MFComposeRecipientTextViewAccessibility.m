@implementation MFComposeRecipientTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeRecipientTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFComposeRecipientTextView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientTextView"), CFSTR("_updateInactiveTextView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientTextView"), CFSTR("_ensureAddButton"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFComposeRecipientTextView"), CFSTR("_inactiveTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFComposeRecipientTextView"), CFSTR("_atomContainerView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientTextView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeRecipientTextView"), CFSTR("_didRemoveRecipient:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("didMoveToWindow"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFComposeRecipientTextView"), CFSTR("_recipientsBeingRemoved"), "NSMutableArray");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  -[MFComposeRecipientTextViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[MFComposeRecipientTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_atomContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RecipientAtomContainerView"));

}

- (MFComposeRecipientTextViewAccessibility)initWithFrame:(CGRect)a3
{
  MFComposeRecipientTextViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  v3 = -[MFComposeRecipientTextViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[MFComposeRecipientTextViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  -[MFComposeRecipientTextViewAccessibility didMoveToWindow](&v3, sel_didMoveToWindow);
  -[MFComposeRecipientTextViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateInactiveTextView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  -[MFComposeRecipientTextViewAccessibility _updateInactiveTextView](&v4, sel__updateInactiveTextView);
  -[MFComposeRecipientTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_inactiveTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (void)_ensureAddButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  -[MFComposeRecipientTextViewAccessibility _ensureAddButton](&v3, sel__ensureAddButton);
  -[MFComposeRecipientTextViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_didRemoveRecipient:(id)a3
{
  id v4;
  void *v5;
  UIAccessibilityNotifications v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  -[MFComposeRecipientTextViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_recipientsBeingRemoved"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "indexOfObject:", v4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = *MEMORY[0x24BDF71E8];
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("remove.item.announce"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("displayString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v6, v10);

  }
  v11.receiver = self;
  v11.super_class = (Class)MFComposeRecipientTextViewAccessibility;
  -[MFComposeRecipientTextViewAccessibility _didRemoveRecipient:](&v11, sel__didRemoveRecipient_, v4);

}

@end
