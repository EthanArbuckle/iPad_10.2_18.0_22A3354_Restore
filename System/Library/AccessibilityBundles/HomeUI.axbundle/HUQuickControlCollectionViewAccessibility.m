@implementation HUQuickControlCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("HUQuickControlCollectionView"), CFSTR("UICollectionView"));
}

- (int64_t)accessibilityContainerType
{
  return 0;
}

@end
