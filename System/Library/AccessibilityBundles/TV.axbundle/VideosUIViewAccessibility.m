@implementation VideosUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosDetailViewController"), CFSTR("headerContainmentView"), "@", 0);
}

- (id)_accessibilityParentForFindingScrollParent
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VideosUIViewAccessibility;
  -[VideosUIViewAccessibility _accessibilityParentForFindingScrollParent](&v8, sel__accessibilityParentForFindingScrollParent);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosUIViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("AXContainedInCollectionView"));

  if (v5)
  {
    -[VideosUIViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

@end
