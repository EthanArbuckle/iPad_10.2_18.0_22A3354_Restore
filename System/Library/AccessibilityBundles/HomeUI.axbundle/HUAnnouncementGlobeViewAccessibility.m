@implementation HUAnnouncementGlobeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUAnnouncementGlobeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUAnnouncementGlobeView"), CFSTR("_tappableCoverView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAnnouncementGlobeView"), CFSTR("_setupSubviewsForAnnouncementInfo:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAnnouncementGlobeView"), CFSTR("_playAnnouncementWithInfo:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUAnnouncementGlobeView"), CFSTR("audioPlayer"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUAnnouncementGlobeViewAccessibility;
  -[HUAnnouncementGlobeViewAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[HUAnnouncementGlobeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_tappableCoverView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __82__HUAnnouncementGlobeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9 = &unk_250234568;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", &v6);

  -[HUAnnouncementGlobeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_tappableCoverView"), v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setAccessibilityHintBlock:", &__block_literal_global_1);

  -[HUAnnouncementGlobeViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_tappableCoverView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0]);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __82__HUAnnouncementGlobeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("audioPlayer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = CFSTR("stop.button");
  else
    v3 = CFSTR("play.button");
  accessibilityHomeUILocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __82__HUAnnouncementGlobeViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return 0;
}

- (void)_setupSubviewsForAnnouncementInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUAnnouncementGlobeViewAccessibility;
  -[HUAnnouncementGlobeViewAccessibility _setupSubviewsForAnnouncementInfo:](&v4, sel__setupSubviewsForAnnouncementInfo_, a3);
  -[HUAnnouncementGlobeViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_playAnnouncementWithInfo:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUAnnouncementGlobeViewAccessibility;
  -[HUAnnouncementGlobeViewAccessibility _playAnnouncementWithInfo:](&v3, sel__playAnnouncementWithInfo_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], &stru_2502359A8);
}

@end
