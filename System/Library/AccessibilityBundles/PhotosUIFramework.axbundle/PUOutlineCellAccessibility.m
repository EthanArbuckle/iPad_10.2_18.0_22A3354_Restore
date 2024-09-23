@implementation PUOutlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUOutlineCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUOutlineCell"), CFSTR("text"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PUOutlineCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("text"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOutlineCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PUOutlineCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
