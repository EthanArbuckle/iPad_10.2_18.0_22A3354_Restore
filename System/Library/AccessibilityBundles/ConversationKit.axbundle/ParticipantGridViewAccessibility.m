@implementation ParticipantGridViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.ParticipantGridView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("bannerPresentationManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.MultiwayViewController"), CFSTR("hasParticipantVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationKit.BannerPresentationManager"), CFSTR("inCallControlsVisible"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;

  -[ParticipantGridViewAccessibility _axMultiwayConversationViewController](self, "_axMultiwayConversationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("hasParticipantVideo"));

  if (v3)
    v4 = CFSTR("facetime.video");
  else
    v4 = CFSTR("facetime.call");
  accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityHint
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[ParticipantGridViewAccessibility _axBannerPresentationManager](self, "_axBannerPresentationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("inCallControlsVisible")))
    v3 = CFSTR("facetime.video.hint.hide.controls");
  else
    v3 = CFSTR("facetime.video.hint.show.controls");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityValue
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[ParticipantGridViewAccessibility _axBannerPresentationManager](self, "_axBannerPresentationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("inCallControlsVisible")))
    v3 = CFSTR("facetime.video.controls.shown");
  else
    v3 = CFSTR("facetime.video.controls.hidden");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  objc_super v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[ParticipantGridViewAccessibility subviews](self, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)ParticipantGridViewAccessibility;
    -[ParticipantGridViewAccessibility _accessibilitySupplementaryFooterViews](&v5, sel__accessibilitySupplementaryFooterViews);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_axBannerPresentationManager
{
  void *v2;
  void *v3;
  void *v4;

  -[ParticipantGridViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("bannerPresentationManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __64__ParticipantGridViewAccessibility__axBannerPresentationManager__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490C0EC](CFSTR("ConversationKit.MultiwayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axMultiwayConversationViewController
{
  void *v2;
  void *v3;

  -[ParticipantGridViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_209, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __73__ParticipantGridViewAccessibility__axMultiwayConversationViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490C0EC](CFSTR("ConversationKit.MultiwayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
