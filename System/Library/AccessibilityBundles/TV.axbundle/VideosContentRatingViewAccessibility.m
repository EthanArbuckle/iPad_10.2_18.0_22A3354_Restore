@implementation VideosContentRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosContentRatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosContentRatingView"), CFSTR("text"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[VideosContentRatingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7410];
}

@end
