@implementation TLKSelectableGridButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TLKSelectableGridButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKSelectableGridButton"), CFSTR("topLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TLKSelectableGridButton"), CFSTR("bottomLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[TLKSelectableGridButtonAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("topLabel, bottomLabel"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TLKSelectableGridButtonAccessibility;
  v3 = -[TLKSelectableGridButtonAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[TLKSelectableGridButtonAccessibility layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "backgroundColor");

  v6 = *MEMORY[0x24BDF7400];
  if (!v5)
    v6 = 0;
  return v6 | v3;
}

@end
