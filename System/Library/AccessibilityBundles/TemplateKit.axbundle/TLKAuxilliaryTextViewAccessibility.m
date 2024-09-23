@implementation TLKAuxilliaryTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKAuxilliaryTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKAuxilliaryTextView"), CFSTR("topLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKAuxilliaryTextView"), CFSTR("middleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKAuxilliaryTextView"), CFSTR("bottomLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[TLKAuxilliaryTextViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("topLabel, middleLabel, bottomLabel"));
}

@end
