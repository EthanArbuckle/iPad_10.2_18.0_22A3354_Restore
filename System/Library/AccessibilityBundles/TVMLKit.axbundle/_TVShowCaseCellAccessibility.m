@implementation _TVShowCaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVShowcaseCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVShowcaseCell"), CFSTR("imageView"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (id)_accessibilityFrameDelegate
{
  return (id)-[_TVShowCaseCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
}

@end
