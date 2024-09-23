@implementation PHDialerContactResultButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHDialerContactResultButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end
