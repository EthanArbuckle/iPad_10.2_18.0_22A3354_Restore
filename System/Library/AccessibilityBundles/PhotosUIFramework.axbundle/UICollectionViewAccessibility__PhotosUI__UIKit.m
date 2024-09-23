@implementation UICollectionViewAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UICollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("UICollectionView"), CFSTR("_supplementaryViewClassDict"), "NSMutableDictionary");
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  void *v3;
  char v4;
  objc_super v6;

  -[UICollectionViewAccessibility__PhotosUI__UIKit accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("photoSharingCollectionView"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewAccessibility__PhotosUI__UIKit;
  return -[UICollectionViewAccessibility__PhotosUI__UIKit _accessibilityOpaqueElementScrollsContentIntoView](&v6, sel__accessibilityOpaqueElementScrollsContentIntoView);
}

@end
