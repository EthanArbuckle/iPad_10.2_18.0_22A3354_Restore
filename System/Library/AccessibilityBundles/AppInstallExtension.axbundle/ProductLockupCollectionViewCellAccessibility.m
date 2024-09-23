@implementation ProductLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.ProductLockupCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityProductLockupCollectionViewCellElements
{
  JUMPOUT(0x234905C70);
}

- (void)_setAccessibilityProductLockupCollectionViewCellElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityArtworkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityDeveloperLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityTaglineLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityOfferButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityOfferSubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityDownloadProgressLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("expandedOfferTitleLabel"), "Optional<DynamicTypeLabel>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("expandedOfferSubtitleLabel"), "Optional<DynamicTypeLabel>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityShareButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.ProductLockupCollectionViewCell"), CFSTR("accessibilityVideoView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.VideoView"), CFSTR("accessibilityPlayButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.VideoView"), CFSTR("accessibilityPlayerViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.VideoView"), CFSTR("accessibilityIsPlaying"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppInstallExtension.VideoView"), CFSTR("accessibilityShouldBePlaying"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  -[ProductLockupCollectionViewCellAccessibility _accessibilityProductLockupCollectionViewCellElements](self, "_accessibilityProductLockupCollectionViewCellElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityVideoView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityPlayerViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeUIViewForKey:", CFSTR("view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessibilityIsPlaying"));
    v8 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessibilityShouldBePlaying"));
    if (objc_msgSend(v6, "_accessibilityViewIsVisible") && v7 && v8)
      objc_msgSend(v3, "axSafelyAddObject:", v6);
    objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityPlayButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "_accessibilityViewIsVisible"))
      objc_msgSend(v3, "axSafelyAddObject:", v9);
    objc_opt_class();
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAccessibilityRespondsToUserInteraction:", 1);
    v12 = objc_msgSend(v11, "accessibilityTraits");
    objc_msgSend(v11, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0] | v12);
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtworkView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityValue:", v14);

    objc_msgSend(v3, "axSafelyAddObject:", v13);
    objc_msgSend(v3, "axSafelyAddObject:", v11);
    objc_opt_class();
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDeveloperLabel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v13;
    objc_msgSend(v16, "setAccessibilityRespondsToUserInteraction:", 1);
    v36 = v16;
    objc_msgSend(v3, "axSafelyAddObject:", v16);
    objc_opt_class();
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTaglineLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v11;
    v33 = v9;
    v34 = v6;
    v35 = v4;
    objc_msgSend(v18, "setAccessibilityRespondsToUserInteraction:", 0);
    objc_msgSend(v18, "setAccessibilityTraits:", *MEMORY[0x24BDF7410]);
    v31 = v18;
    objc_msgSend(v3, "axSafelyAddObject:", v18);
    -[ProductLockupCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityBannerView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityRespondsToUserInteraction:", 1);
    v30 = v19;
    objc_msgSend(v3, "axSafelyAddObject:", v19);
    -[ProductLockupCollectionViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilitySecondaryBannerView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessibilityRespondsToUserInteraction:", 1);
    objc_msgSend(v3, "axSafelyAddObject:", v20);
    -[ProductLockupCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("expandedOfferTitleLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAccessibilityRespondsToUserInteraction:", 1);
    objc_msgSend(v3, "axSafelyAddObject:", v21);
    -[ProductLockupCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("expandedOfferSubtitleLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAccessibilityRespondsToUserInteraction:", 1);
    objc_msgSend(v3, "axSafelyAddObject:", v22);
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOfferButton"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v23);
    objc_opt_class();
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityOfferSubtitleLabel"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "setAccessibilityRespondsToUserInteraction:", 1);
    objc_msgSend(v3, "axSafelyAddObject:", v25);
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDownloadProgressLabel"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAccessibilityRespondsToUserInteraction:", 1);
    objc_msgSend(v26, "setAccessibilityTraits:", *MEMORY[0x24BDF7430]);
    objc_msgSend(v3, "axSafelyAddObject:", v26);
    -[ProductLockupCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityShareButton"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityAppStoreLocalizedString(CFSTR("share.button"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAccessibilityLabel:", v28);

    objc_msgSend(v3, "axSafelyAddObject:", v27);
    -[ProductLockupCollectionViewCellAccessibility _setAccessibilityProductLockupCollectionViewCellElements:](self, "_setAccessibilityProductLockupCollectionViewCellElements:", v3);

  }
  return v3;
}

- (ProductLockupCollectionViewCellAccessibility)initWithFrame:(CGRect)a3
{
  ProductLockupCollectionViewCellAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ProductLockupCollectionViewCellAccessibility;
  v3 = -[ProductLockupCollectionViewCellAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[ProductLockupCollectionViewCellAccessibility _setAccessibilityProductLockupCollectionViewCellElements:](v3, "_setAccessibilityProductLockupCollectionViewCellElements:", 0);

  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProductLockupCollectionViewCellAccessibility;
  -[ProductLockupCollectionViewCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[ProductLockupCollectionViewCellAccessibility _setAccessibilityProductLockupCollectionViewCellElements:](self, "_setAccessibilityProductLockupCollectionViewCellElements:", 0);
}

- (void)resetProductLockupCellAccessibilityElements
{
  -[ProductLockupCollectionViewCellAccessibility _setAccessibilityProductLockupCollectionViewCellElements:](self, "_setAccessibilityProductLockupCollectionViewCellElements:", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)ProductLockupCollectionViewCellAccessibility;
  -[ProductLockupCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ProductLockupCollectionViewCellAccessibility accessibilityHeaderElements](self, "accessibilityHeaderElements", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    v7 = *MEMORY[0x24BDF73C0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAccessibilityTraits:", v7);
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)canBecomeFocused
{
  return 0;
}

@end
