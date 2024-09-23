@implementation CNAutocompleteSearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAutocompleteSearchController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAutocompleteSearchController"), CFSTR("autocompleteResultsController:didSelectRecipient:atIndex:"), "v", "@", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAutocompleteSearchController"), CFSTR("composeField"), "@", 0);

}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  UIAccessibilityNotifications v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNAutocompleteSearchControllerAccessibility;
  -[CNAutocompleteSearchControllerAccessibility autocompleteResultsController:didSelectRecipient:atIndex:](&v8, sel_autocompleteResultsController_didSelectRecipient_atIndex_, a3, a4, a5);
  v6 = *MEMORY[0x24BDF72C8];
  -[CNAutocompleteSearchControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("composeField"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v6, v7);

}

@end
