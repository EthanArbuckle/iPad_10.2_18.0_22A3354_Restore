@implementation HUViewControllerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUViewControllerCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
