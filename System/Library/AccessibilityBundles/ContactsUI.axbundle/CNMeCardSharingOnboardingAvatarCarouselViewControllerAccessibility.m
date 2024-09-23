@implementation CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNMeCardSharingOnboardingAvatarCarouselViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNMeCardSharingOnboardingAvatarCarouselViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CNMeCardSharingOnboardingAvatarCarouselViewController"), CFSTR("UICollectionViewDataSource"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNMeCardSharingOnboardingAvatarCarouselViewController"), CFSTR("items"), "@", 0);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility;
  -[CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility collectionView:cellForItemAtIndexPath:](&v13, sel_collectionView_cellForItemAtIndexPath_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[CNMeCardSharingOnboardingAvatarCarouselViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("items"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_axSetCarouselItem:", v11);

  }
  return v8;
}

@end
