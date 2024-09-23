@implementation PosterCoupledTitlesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PosterBoard.PosterCoupledTitlesView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftFieldOfAnyClass:", CFSTR("PosterBoard.PosterCoupledTitlesView"), CFSTR("titleLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PosterBoard.PosterRackCollectionViewController"), CFSTR("layoutMode"), "Q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PosterBoard.PosterCoupledTitlesView"), CFSTR("UICollectionReusableView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICollectionReusableView"), CFSTR("didTransitionFromLayout:toLayout:"), "v", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PosterCoupledTitlesViewAccessibility;
  -[PosterCoupledTitlesViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PosterCoupledTitlesViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[PosterCoupledTitlesViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_accessibilitySortPriority
{
  return 100;
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PosterCoupledTitlesViewAccessibility;
  v6 = a4;
  -[PosterCoupledTitlesViewAccessibility didTransitionFromLayout:toLayout:](&v9, sel_didTransitionFromLayout_toLayout_, a3, v6);
  objc_msgSend(v6, "collectionView", v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "safeUnsignedIntForKey:", CFSTR("layoutMode"));

  if ((_DWORD)v6 == 3)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

@end
