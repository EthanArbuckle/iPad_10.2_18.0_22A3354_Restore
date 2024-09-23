@implementation NCNotificationListCoalescingHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NCNotificationListCoalescingHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

@end
