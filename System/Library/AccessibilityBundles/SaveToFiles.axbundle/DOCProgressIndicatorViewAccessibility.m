@implementation DOCProgressIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SaveToFiles.DOCProgressIndicatorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SaveToFiles.DOCProgressIndicatorView"), CFSTR("fractionCompleted"), "d", 0);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7430];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("progress"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)_accessibilityAutomationType
{
  return 35;
}

- (id)accessibilityValue
{
  -[DOCProgressIndicatorViewAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("fractionCompleted"));
  return (id)AXFormatFloatWithPercentage();
}

@end
