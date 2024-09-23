@implementation PXCloudQuotaBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXCloudQuotaBannerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
