@implementation PHBannerButtonsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHBannerButtonsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilitySortPriority
{
  return -1;
}

@end
