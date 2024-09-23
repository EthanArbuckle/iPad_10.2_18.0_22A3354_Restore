@implementation VideosContentRatingWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosContentRatingWrapperView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("VideosContentRatingWrapperView"), CFSTR("_ratingText"), "NSString");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[VideosContentRatingWrapperViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_ratingText"));
}

@end
