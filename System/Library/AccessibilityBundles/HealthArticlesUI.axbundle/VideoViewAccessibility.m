@implementation VideoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthArticlesUI.VideoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HealthArticlesUI.VideoView"), CFSTR("accessibilityVideoDescription"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[VideoViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityVideoDescription"));
}

@end
