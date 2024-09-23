@implementation GKTextBubbleControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GKTextBubbleControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKTextBubbleControl"), CFSTR("text"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[GKTextBubbleControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
