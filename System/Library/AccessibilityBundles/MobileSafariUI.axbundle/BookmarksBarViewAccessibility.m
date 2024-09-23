@implementation BookmarksBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BookmarksBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("bookmarks.bar"));
}

@end
