@implementation SFDialogControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFDialogController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFDialogController"), CFSTR("_presentDialog:forWebProcessID:withAdditionalAnimations:"), "q", "@", "i", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFDialogController"), CFSTR("_dismissDialogWithAdditionalAnimations:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFDialogController"), CFSTR("_dialogView"), "SFDialogView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFDialogView"), CFSTR("_contentView"), "SFDialogContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFDialogContentView"), CFSTR("_messageTextView"), "SFDialogTextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFDialogTextView"), CFSTR("_textView"), "UITextView");

}

- (int64_t)_presentDialog:(id)a3 forWebProcessID:(int)a4 withAdditionalAnimations:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFDialogControllerAccessibility;
  v6 = -[SFDialogControllerAccessibility _presentDialog:forWebProcessID:withAdditionalAnimations:](&v14, sel__presentDialog_forWebProcessID_withAdditionalAnimations_, a3, *(_QWORD *)&a4, a5);
  if (!v6)
  {
    -[SFDialogControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dialogView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityViewIsModal:", 1);

    -[SFDialogControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dialogView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("_contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("_messageTextView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("_textView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(0x3EEu, v12);
  }
  return (int64_t)v6;
}

- (void)_dismissDialogWithAdditionalAnimations:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFDialogControllerAccessibility;
  -[SFDialogControllerAccessibility _dismissDialogWithAdditionalAnimations:](&v5, sel__dismissDialogWithAdditionalAnimations_, a3);
  -[SFDialogControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dialogView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityViewIsModal:", 0);

  AXPerformBlockOnMainThreadAfterDelay();
}

void __74__SFDialogControllerAccessibility__dismissDialogWithAdditionalAnimations___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
