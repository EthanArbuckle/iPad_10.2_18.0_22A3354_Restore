@implementation VibrancyLabelCompositingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.VibrancyLabelCompositingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.VibrancyLabelCompositingView"), CFSTR("text"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[VibrancyLabelCompositingViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
}

@end
