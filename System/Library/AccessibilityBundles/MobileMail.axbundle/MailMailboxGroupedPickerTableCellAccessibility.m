@implementation MailMailboxGroupedPickerTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MailMailboxGroupedPickerTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  uint64_t v3;

  UIAXStringForAllChildren();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    accessibilityLocalizedString(CFSTR("mailbox.location"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

@end
