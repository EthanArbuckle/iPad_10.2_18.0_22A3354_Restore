@implementation SUUIShowcaseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIShowcaseButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
