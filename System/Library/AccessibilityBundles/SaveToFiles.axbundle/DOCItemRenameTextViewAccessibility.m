@implementation DOCItemRenameTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SaveToFiles.DOCItemRenameTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SaveToFiles.DOCItemRenameTextView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCItemRenameTextView"), CFSTR("accessibilityClearButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCItemRenameTextView"), CFSTR("installClearButton"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCItemRenameTextViewAccessibility;
  -[DOCItemRenameTextViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[DOCItemRenameTextViewAccessibility _axMarkupClearButton](self, "_axMarkupClearButton");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)didMoveToSuperview
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DOCItemRenameTextViewAccessibility;
  -[DOCItemRenameTextViewAccessibility didMoveToSuperview](&v2, sel_didMoveToSuperview);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __56__DOCItemRenameTextViewAccessibility_didMoveToSuperview__block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], *(id *)(a1 + 32));
}

- (void)installClearButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DOCItemRenameTextViewAccessibility;
  -[DOCItemRenameTextViewAccessibility installClearButton](&v3, sel_installClearButton);
  -[DOCItemRenameTextViewAccessibility _axMarkupClearButton](self, "_axMarkupClearButton");
}

- (void)_axMarkupClearButton
{
  void *v2;
  id v3;

  -[DOCItemRenameTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityClearButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("text.view.clear"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (int64_t)_accessibilitySortPriority
{
  objc_super v4;

  if (-[DOCItemRenameTextViewAccessibility _axIsClearButtonInstalled](self, "_axIsClearButtonInstalled"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)DOCItemRenameTextViewAccessibility;
  return -[DOCItemRenameTextViewAccessibility _accessibilitySortPriority](&v4, sel__accessibilitySortPriority);
}

- (BOOL)_axIsClearButtonInstalled
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[DOCItemRenameTextViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("superview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCItemRenameTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityClearButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

@end
