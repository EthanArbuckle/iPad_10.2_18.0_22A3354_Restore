@implementation PosterSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.PosterSectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityElements
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
