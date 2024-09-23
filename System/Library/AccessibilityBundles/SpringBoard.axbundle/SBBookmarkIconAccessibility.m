@implementation SBBookmarkIconAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBBookmarkIcon");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
