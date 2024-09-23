@implementation IMBTimeslotViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Business.IMBTimeslotView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Business.IMBTimeslotView"), CFSTR("timeLabel"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  return (id)-[IMBTimeslotViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("timeLabel"));
}

@end
