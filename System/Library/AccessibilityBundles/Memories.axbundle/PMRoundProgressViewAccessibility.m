@implementation PMRoundProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PMRoundProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PMRoundProgressView"), CFSTR("progress"), "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMemoriesLocalizedString(CFSTR("loading.progress.description"));
}

- (id)accessibilityValue
{
  -[PMRoundProgressViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("progress"));
  return (id)AXFormatFloatWithPercentage();
}

@end
