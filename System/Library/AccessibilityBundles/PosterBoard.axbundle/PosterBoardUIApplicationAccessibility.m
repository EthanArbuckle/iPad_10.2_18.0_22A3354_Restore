@implementation PosterBoardUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoardApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return &stru_250307A98;
}

@end
