@implementation SKUIShowcaseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIShowcaseButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
