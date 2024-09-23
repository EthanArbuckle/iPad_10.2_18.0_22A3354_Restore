@implementation _TVProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVProgressView"), CFSTR("progress"), "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("playback.progress.label"));
}

- (id)accessibilityValue
{
  -[_TVProgressViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("progress"));
  return (id)AXFormatFloatWithPercentage();
}

@end
