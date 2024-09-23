@implementation UIMapsImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
