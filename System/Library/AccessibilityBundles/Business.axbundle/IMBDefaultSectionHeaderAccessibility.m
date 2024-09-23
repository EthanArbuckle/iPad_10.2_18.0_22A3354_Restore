@implementation IMBDefaultSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Business.IMBDefaultSectionHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.IMBDefaultSectionHeader"), CFSTR("headerLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[IMBDefaultSectionHeaderAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("headerLabel"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMBDefaultSectionHeaderAccessibility;
  return *MEMORY[0x24BDF73C0] | -[IMBDefaultSectionHeaderAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
