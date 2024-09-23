@implementation MailboxOutlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MailboxOutlineCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxOutlineCell"), CFSTR("showFocusIcon"), "B", 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v6;
  objc_super v7;
  objc_super v8;

  if ((-[MailboxOutlineCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showFocusIcon")) & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)MailboxOutlineCellAccessibility;
    -[MailboxOutlineCellAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("mailbox.focus.filtered"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MailboxOutlineCellAccessibility;
    -[MailboxOutlineCellAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
