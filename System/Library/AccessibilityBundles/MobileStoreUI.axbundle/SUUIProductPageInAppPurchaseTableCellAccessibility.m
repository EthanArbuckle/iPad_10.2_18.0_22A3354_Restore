@implementation SUUIProductPageInAppPurchaseTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIProductPageInAppPurchaseTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageInAppPurchaseTableCell"), CFSTR("indexString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageInAppPurchaseTableCell"), CFSTR("productName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageInAppPurchaseTableCell"), CFSTR("priceString"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  -[SUUIProductPageInAppPurchaseTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("indexString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageInAppPurchaseTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("productName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageInAppPurchaseTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("priceString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
