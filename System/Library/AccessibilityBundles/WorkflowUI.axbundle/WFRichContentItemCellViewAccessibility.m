@implementation WFRichContentItemCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFRichContentItemCellView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFRichContentItemCellView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFRichContentItemCellView"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFRichContentItemCellView"), CFSTR("altLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[WFRichContentItemCellViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, subtitleLabel, altLabel"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFRichContentItemCellViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[WFRichContentItemCellViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
