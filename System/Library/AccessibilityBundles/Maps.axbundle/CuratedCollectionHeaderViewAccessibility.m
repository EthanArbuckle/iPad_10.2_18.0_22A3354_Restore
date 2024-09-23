@implementation CuratedCollectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CuratedCollectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CuratedCollectionHeaderView"), CFSTR("_titleSingleLineLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CuratedCollectionHeaderView"), CFSTR("_titleMultiLineLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CuratedCollectionHeaderView"), CFSTR("_publisherLogoImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CuratedCollectionHeaderView"), CFSTR("curatedCollection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CuratedCollectionHeaderView"), CFSTR("_updateHeaderContent"), "v", 0);

}

- (void)_axAnnotatePublisherLogoImageView
{
  void *v3;
  void *v4;
  id v5;

  -[CuratedCollectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_publisherLogoImageView"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CuratedCollectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("curatedCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXPublisherDescriptionForCollection(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIsAccessibilityElement:", objc_msgSend(v4, "length") != 0);
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionHeaderViewAccessibility;
  -[CuratedCollectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0] | *MEMORY[0x24BDF7410];
  -[CuratedCollectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleSingleLineLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

  -[CuratedCollectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleMultiLineLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", v3);

  -[CuratedCollectionHeaderViewAccessibility _axAnnotatePublisherLogoImageView](self, "_axAnnotatePublisherLogoImageView");
}

- (void)_updateHeaderContent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionHeaderViewAccessibility;
  -[CuratedCollectionHeaderViewAccessibility _updateHeaderContent](&v3, sel__updateHeaderContent);
  -[CuratedCollectionHeaderViewAccessibility _axAnnotatePublisherLogoImageView](self, "_axAnnotatePublisherLogoImageView");
}

@end
