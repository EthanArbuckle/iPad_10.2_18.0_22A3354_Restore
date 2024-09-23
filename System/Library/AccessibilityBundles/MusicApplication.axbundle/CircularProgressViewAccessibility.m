@implementation CircularProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.CircularProgressView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.CircularProgressView"), CFSTR("accessibilityProgressValue"), "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  -[CircularProgressViewAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("accessibilityProgressValue"));
  return (id)AXFormatFloatWithPercentage();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CircularProgressViewAccessibility;
  return *MEMORY[0x24BDF7430] | -[CircularProgressViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
