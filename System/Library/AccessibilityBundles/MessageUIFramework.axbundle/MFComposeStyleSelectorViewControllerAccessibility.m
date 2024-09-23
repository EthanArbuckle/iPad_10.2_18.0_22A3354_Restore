@implementation MFComposeStyleSelectorViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeStyleSelectorViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeStyleSelectorViewController"), CFSTR("changeFontSizeAction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeStyleSelectorViewController"), CFSTR("currentFontSize"), "q", 0);

}

- (void)changeFontSizeAction:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFComposeStyleSelectorViewControllerAccessibility;
  -[MFComposeStyleSelectorViewControllerAccessibility changeFontSizeAction:](&v3, sel_changeFontSizeAction_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __74__MFComposeStyleSelectorViewControllerAccessibility_changeFontSizeAction___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF71E8];
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%ld"), objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("currentFontSize")));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

@end
