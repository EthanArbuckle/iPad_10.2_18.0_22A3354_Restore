@implementation MSTrackListCopyrightFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MSTrackListCopyrightFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MSTrackListCopyrightFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
}

@end
