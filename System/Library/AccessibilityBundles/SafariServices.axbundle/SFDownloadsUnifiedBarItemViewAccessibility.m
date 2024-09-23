@implementation SFDownloadsUnifiedBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFDownloadsUnifiedBarItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilitySafariServicesLocalizedString(CFSTR("downloads.button"));
}

@end
