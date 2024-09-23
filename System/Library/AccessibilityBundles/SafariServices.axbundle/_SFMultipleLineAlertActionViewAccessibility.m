@implementation _SFMultipleLineAlertActionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_SFMultipleLineAlertActionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFMultipleLineAlertActionView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFMultipleLineAlertActionView"), CFSTR("detailLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[_SFMultipleLineAlertActionViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, detailLabel"));
}

@end
