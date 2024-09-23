@implementation MailboxPickerOutlineControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MailboxPickerOutlineController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxPickerOutlineController"), CFSTR("shelfButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxPickerOutlineController"), CFSTR("_updateToolbarItems:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MailboxPickerOutlineControllerAccessibility;
  -[MailboxPickerOutlineControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  AXPerformSafeBlock();
}

uint64_t __89__MailboxPickerOutlineControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateToolbarItems:", 0);
}

- (id)shelfButtonItem
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailboxPickerOutlineControllerAccessibility;
  -[MailboxPickerOutlineControllerAccessibility shelfButtonItem](&v5, sel_shelfButtonItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("app.shelf.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
