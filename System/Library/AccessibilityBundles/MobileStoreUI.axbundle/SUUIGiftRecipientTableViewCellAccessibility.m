@implementation SUUIGiftRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIGiftRecipientTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIGiftRecipientTableViewCell"), CFSTR("_recipientView"), "CNComposeRecipientTextView");
}

- (BOOL)isAccessibilityElement
{
  return !-[SUUIGiftRecipientTableViewCellAccessibility _accessibilityIsRecipientViewFocused](self, "_accessibilityIsRecipientViewFocused");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("gift.recipient.table.cell.hint"));
}

- (id)accessibilityLabel
{
  return (id)-[SUUIGiftRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SUUIGiftRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipientAddresses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234916290]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[SUUIGiftRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recipientView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsRecipientViewFocused
{
  void *v2;
  void *v3;
  char v4;

  -[SUUIGiftRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recipientView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("focused"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end
