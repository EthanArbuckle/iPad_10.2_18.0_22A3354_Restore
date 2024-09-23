@implementation AttributionWeeAppControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AttributionWeeAppController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AttributionWeeAppController"), CFSTR("_stocksAttributionAttributionString"), "@", 0);
}

- (id)_stocksAttributionAttributionString
{
  void *v2;
  objc_super v4;

  AXCaptureImageAttachmentSetYahooLogo = 1;
  v4.receiver = self;
  v4.super_class = (Class)AttributionWeeAppControllerAccessibility;
  -[AttributionWeeAppControllerAccessibility _stocksAttributionAttributionString](&v4, sel__stocksAttributionAttributionString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXCaptureImageAttachmentSetYahooLogo = 0;
  return v2;
}

@end
