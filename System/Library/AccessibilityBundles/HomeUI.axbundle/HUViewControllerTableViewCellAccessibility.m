@implementation HUViewControllerTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUViewControllerTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityScrollToVisible
{
  return 0;
}

@end
