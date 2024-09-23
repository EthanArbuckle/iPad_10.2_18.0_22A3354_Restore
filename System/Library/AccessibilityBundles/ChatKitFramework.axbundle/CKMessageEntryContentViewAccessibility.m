@implementation CKMessageEntryContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageEntryContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("initWithFrame:shouldShowSubject:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "B", "B", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("subjectView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("clearPluginButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("clearPluginButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("shouldShowClearButton"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("pluginEntryViewController"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryContentViewAccessibility;
  -[CKMessageEntryContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[CKMessageEntryContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subjectView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("subject.view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[CKMessageEntryContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("clearPluginButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("plugin.cancel.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

}

- (CKMessageEntryContentViewAccessibility)initWithFrame:(CGRect)a3 shouldShowSubject:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldUseNonEmojiKeyboard:(BOOL)a6 shouldUseNonHandwritingKeyboard:(BOOL)a7 shouldDisableKeyboardStickers:(BOOL)a8
{
  CKMessageEntryContentViewAccessibility *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKMessageEntryContentViewAccessibility;
  v8 = -[CKMessageEntryContentViewAccessibility initWithFrame:shouldShowSubject:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:](&v10, sel_initWithFrame_shouldShowSubject_shouldDisableAttachments_shouldUseNonEmojiKeyboard_shouldUseNonHandwritingKeyboard_shouldDisableKeyboardStickers_, a4, a5, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CKMessageEntryContentViewAccessibility _accessibilityLoadAccessibilityInformation](v8, "_accessibilityLoadAccessibilityInformation");

  return v8;
}

- (void)setPluginEntryViewController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryContentViewAccessibility;
  -[CKMessageEntryContentViewAccessibility setPluginEntryViewController:](&v6, sel_setPluginEntryViewController_, v4);
  if (-[CKMessageEntryContentViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldShowClearButton")))
  {
    objc_opt_class();
    __UIAccessibilityCastAsSafeCategory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_axSetCloseActionProviderOnBubbleView:", self);

  }
}

- (BOOL)_accessibilityUsesScrollParentForOrdering
{
  return 0;
}

- (void)_accessibilityClearPlugin
{
  void *v3;

  AXPerformSafeBlock();
  -[CKMessageEntryContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v3);

}

uint64_t __67__CKMessageEntryContentViewAccessibility__accessibilityClearPlugin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearPluginButtonTapped:", 0);
}

@end
