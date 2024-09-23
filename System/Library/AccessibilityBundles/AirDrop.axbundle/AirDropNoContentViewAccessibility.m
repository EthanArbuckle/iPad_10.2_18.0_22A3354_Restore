@implementation AirDropNoContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AirDropNoContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AirDropNoContentView"), CFSTR("actionButton"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

@end
