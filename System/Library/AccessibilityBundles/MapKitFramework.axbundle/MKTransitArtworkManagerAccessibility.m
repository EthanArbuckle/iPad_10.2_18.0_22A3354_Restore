@implementation MKTransitArtworkManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKTransitArtworkManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
