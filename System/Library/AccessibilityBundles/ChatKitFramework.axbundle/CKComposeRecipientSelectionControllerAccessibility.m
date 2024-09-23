@implementation CKComposeRecipientSelectionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKComposeRecipientSelectionController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKComposeRecipientSelectionController"), CFSTR("_layoutFromFieldShouldHide:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKComposeRecipientSelectionController"), CFSTR("fromFieldContentStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKComposeRecipientSelectionController"), CFSTR("subscriptionSelectorButton"), "@", 0);

}

- (void)_layoutFromFieldShouldHide:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKComposeRecipientSelectionControllerAccessibility;
  -[CKComposeRecipientSelectionControllerAccessibility _layoutFromFieldShouldHide:](&v10, sel__layoutFromFieldShouldHide_);
  if (!a3)
  {
    -[CKComposeRecipientSelectionControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("fromFieldContentStackView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsAccessibilityElement:", 1);
    accessibilityLocalizedString(CFSTR("from.field"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposeRecipientSelectionControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subscriptionSelectorButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setAccessibilityLabel:", v7, v9, CFSTR("__AXStringForVariablesSentinel"));
    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    accessibilityLocalizedString(CFSTR("collapsed.from.field.hint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityHint:", v8);

  }
}

@end
