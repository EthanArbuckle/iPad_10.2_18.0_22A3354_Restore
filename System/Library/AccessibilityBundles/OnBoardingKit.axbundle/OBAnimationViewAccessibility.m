@implementation OBAnimationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBAnimationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end
