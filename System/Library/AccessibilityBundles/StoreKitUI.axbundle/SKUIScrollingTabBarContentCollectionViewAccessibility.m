@implementation SKUIScrollingTabBarContentCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIScrollingTabBarContentCollectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SKUIScrollingTabBarContentCollectionView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SKUIScrollingTabBarContentCollectionView"), CFSTR("UICollectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIScrollingTabBarController"), CFSTR("_focusedViewController"), "UIViewController");

}

- (BOOL)accessibilityCollectionViewBehavesLikeUIViewAccessibility
{
  return 1;
}

- (BOOL)_accessibilityOpaqueElementScrollsContentIntoView
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_focusedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "tabBarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
