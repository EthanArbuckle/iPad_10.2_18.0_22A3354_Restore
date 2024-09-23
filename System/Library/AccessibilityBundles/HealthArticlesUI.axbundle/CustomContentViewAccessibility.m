@implementation CustomContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthArticlesUI.CustomContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
