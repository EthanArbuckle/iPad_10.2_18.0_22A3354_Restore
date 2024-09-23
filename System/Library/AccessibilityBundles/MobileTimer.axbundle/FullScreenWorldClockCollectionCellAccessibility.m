@implementation FullScreenWorldClockCollectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FullScreenWorldClockCollectionCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
