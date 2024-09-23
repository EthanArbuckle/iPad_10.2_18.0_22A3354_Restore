@implementation SocialProfileButtonUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SocialProfileButtonUIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicUI.SocialProfileButtonUIView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicUI.SocialProfileButtonUIView"), CFSTR("presenter"), "SocialProfilePresenter");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicUI.SocialProfileButtonUIView"), CFSTR("notificationBadgeView"), "NotificationBadgeView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicUI.SocialProfilePresenter"), CFSTR("userSocialProfileCoordinator"), "UserSocialProfileCoordinator");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPModelSocialPerson"), CFSTR("name"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SocialProfileButtonUIViewAccessibility;
  -[SocialProfileButtonUIViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  -[SocialProfileButtonUIViewAccessibility setIsAccessibilityElement:](self, "setIsAccessibilityElement:", 1);
  -[SocialProfileButtonUIViewAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__SocialProfileButtonUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_2502D8530;
  objc_copyWeak(&v10, &location);
  -[SocialProfileButtonUIViewAccessibility setAccessibilityLabelBlock:](self, "setAccessibilityLabelBlock:", v9);
  -[SocialProfileButtonUIViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("notificationBadgeView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "safeSwiftIntForKey:", CFSTR("value"));
    if (v5 >= 1)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      accessibilityMusicLocalizedString(CFSTR("FOLLOW_REQUEST"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SocialProfileButtonUIViewAccessibility setAccessibilityValue:](self, "setAccessibilityValue:", v8);

    }
  }

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __84__SocialProfileButtonUIViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeSwiftValueForKey:", CFSTR("presenter"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("userSocialProfileCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("_userSocialProfile"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityMusicUILocalizedString(CFSTR("account"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SocialProfileButtonUIViewAccessibility;
  -[SocialProfileButtonUIViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SocialProfileButtonUIViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
