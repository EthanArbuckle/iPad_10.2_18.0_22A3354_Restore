@implementation PXPeopleConfirmationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPeopleConfirmationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPeopleConfirmationViewController"), CFSTR("suggestionDidDisplay"), "v", 0);
}

- (void)suggestionDidDisplay
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PXPeopleConfirmationViewControllerAccessibility;
  -[PXPeopleConfirmationViewControllerAccessibility suggestionDidDisplay](&v2, sel_suggestionDidDisplay);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
