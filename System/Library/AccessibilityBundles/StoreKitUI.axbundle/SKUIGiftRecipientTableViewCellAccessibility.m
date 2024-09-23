@implementation SKUIGiftRecipientTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIGiftRecipientTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftRecipientTableViewCell"), CFSTR("_recipientView"), "CNComposeRecipientTextView");
}

- (BOOL)isAccessibilityElement
{
  return !-[SKUIGiftRecipientTableViewCellAccessibility _accessibilityIsRecipientViewFocused](self, "_accessibilityIsRecipientViewFocused");
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityHint
{
  return accessibilitySKUILocalizedString(CFSTR("gift.recipient.table.cell.hint"));
}

- (id)accessibilityLabel
{
  return (id)-[SKUIGiftRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SKUIGiftRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recipientAddresses"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C2B68]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[SKUIGiftRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recipientView"));
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

  -[SKUIGiftRecipientTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_recipientView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("focused"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

@end
