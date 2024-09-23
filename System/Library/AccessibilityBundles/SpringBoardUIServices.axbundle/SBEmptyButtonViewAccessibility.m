@implementation SBEmptyButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBEmptyButtonView");
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
