@implementation NowPlayingRouteSharePlayTogetherControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Music.NowPlayingRouteSharePlayTogetherControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Music.NowPlayingRouteSharePlayTogetherControl"), CFSTR("sharePlayTogetherButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Music.NowPlayingRouteSharePlayTogetherControl"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NowPlayingRouteSharePlayTogetherControlAccessibility;
  -[NowPlayingRouteSharePlayTogetherControlAccessibility _accessibilityLoadAccessibilityInformation](&v12, sel__accessibilityLoadAccessibilityInformation);
  v11 = 0;
  objc_opt_class();
  -[NowPlayingRouteSharePlayTogetherControlAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("sharePlayTogetherButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityMusicLocalizedString(CFSTR("shareplay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __98__NowPlayingRouteSharePlayTogetherControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9[3] = &unk_2502C2520;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v4, "setAccessibilityValueBlock:", v9);

}

id __98__NowPlayingRouteSharePlayTogetherControlAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "integerValue"))
  {
    accessibilityMusicLocalizedString(CFSTR("PARTICIPANT_COUNT"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "integerValue");
    AXCFormattedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NowPlayingRouteSharePlayTogetherControlAccessibility;
  -[NowPlayingRouteSharePlayTogetherControlAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[NowPlayingRouteSharePlayTogetherControlAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
