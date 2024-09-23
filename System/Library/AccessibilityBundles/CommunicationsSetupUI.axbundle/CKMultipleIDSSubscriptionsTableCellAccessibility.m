@implementation CKMultipleIDSSubscriptionsTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMultipleIDSSubscriptionsTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMultipleIDSSubscriptionsTableCell"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMultipleIDSSubscriptionsTableCell"), CFSTR("numberLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMultipleIDSSubscriptionsTableCell"), CFSTR("centeredNameLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[CKMultipleIDSSubscriptionsTableCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("nameLabel, numberLabel, centeredNameLabel"));
}

@end
