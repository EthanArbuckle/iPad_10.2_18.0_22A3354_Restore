@implementation VUINowPlayingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUINowPlayingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUINowPlayingViewController"), CFSTR("promoMetadataView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUINowPlayingViewController"), CFSTR("mediaController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIMediaController"), CFSTR("avPlayerViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerViewController"), CFSTR("nowPlayingPlaybackControlsViewController"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("AVPlaybackControlsProtocol"), CFSTR("contextualBarViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVUnifiedPlayerActionBarViewController"), CFSTR("_actionButtonForIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUINowPlayingViewController"), CFSTR("showSkipAndPromoView:animated:skipInfo:"), "v", "B", "B", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VUINowPlayingViewControllerAccessibility;
  -[VUINowPlayingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v13, sel__accessibilityLoadAccessibilityInformation);
  -[VUINowPlayingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("promoMetadataView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_axMetadataLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_axCanonicalId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UpNext%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUINowPlayingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mediaController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("avPlayerViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("nowPlayingPlaybackControlsViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("contextualBarViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_actionButtonForIdentifier:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "setAccessibilityValue:", v4);

}

- (void)showSkipAndPromoView:(BOOL)a3 animated:(BOOL)a4 skipInfo:(id)a5
{
  _BOOL4 v5;
  objc_super v7;

  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VUINowPlayingViewControllerAccessibility;
  -[VUINowPlayingViewControllerAccessibility showSkipAndPromoView:animated:skipInfo:](&v7, sel_showSkipAndPromoView_animated_skipInfo_, a3, a4, a5);
  if (v5)
    -[VUINowPlayingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
