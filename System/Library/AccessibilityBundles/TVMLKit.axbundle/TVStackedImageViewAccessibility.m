@implementation TVStackedImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVStackedImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("TVStackedImageView"), CFSTR("_imageStackLayer"), "_UIStackedImageContainerLayer");
}

- (id)_accessibilityFrameDelegate
{
  return (id)-[TVStackedImageViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_imageStackLayer"));
}

@end
