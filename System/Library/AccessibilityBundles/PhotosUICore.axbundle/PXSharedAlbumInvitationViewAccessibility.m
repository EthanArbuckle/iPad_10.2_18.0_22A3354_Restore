@implementation PXSharedAlbumInvitationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXSharedAlbumInvitationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSharedAlbumInvitationView"), CFSTR("infoLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSharedAlbumInvitationView"), CFSTR("albumTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSharedAlbumInvitationView"), CFSTR("acceptButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSharedAlbumInvitationView"), CFSTR("declineButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXSharedAlbumInvitationView"), CFSTR("reportJunkLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PXSharedAlbumInvitationViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("infoLabel, albumTitleLabel"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[PXSharedAlbumInvitationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("acceptButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("declineButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedAlbumInvitationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("reportJunkLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v6 = (void *)MEMORY[0x24BDBCEB8];
  v10.receiver = self;
  v10.super_class = (Class)PXSharedAlbumInvitationViewAccessibility;
  -[PXSharedAlbumInvitationViewAccessibility _accessibilitySupplementaryFooterViews](&v10, sel__accessibilitySupplementaryFooterViews);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "axSafelyAddObject:", v3);
  objc_msgSend(v8, "axSafelyAddObject:", v4);
  objc_msgSend(v8, "axSafelyAddObject:", v5);

  return v8;
}

@end
