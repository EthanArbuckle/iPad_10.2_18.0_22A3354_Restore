@implementation STSingleLineDetailTextHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STSingleLineDetailTextHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STSingleLineDetailTextHeaderView"), CFSTR("STSingleLineHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSingleLineHeaderView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STSingleLineDetailTextHeaderView"), CFSTR("detailLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[STSingleLineDetailTextHeaderViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, detailLabel"));
}

@end
