@implementation PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell"), CFSTR("paymentCredentialType"), "q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCell"), CFSTR("UITableViewCell"));

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("paymentCredentialType"));
  PKDisplayablePaymentNetworkNameForPaymentCredentialType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupBuiltInCardOnFilePrimaryAccountNumberFieldCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
