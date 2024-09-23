@implementation ACSportsAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsAttributionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsAttributionView"), CFSTR("setAttributionPunchOut:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsAttributionView"), CFSTR("setLeagueAppPunchOut:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsAttributionView"), CFSTR("_attributionButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsAttributionView"), CFSTR("_leagueAppButton"), "UIButton");

}

- (void)setAttributionPunchOut:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACSportsAttributionViewAccessibility;
  -[ACSportsAttributionViewAccessibility setAttributionPunchOut:](&v8, sel_setAttributionPunchOut_, a3);
  -[ACSportsAttributionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributionButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("scores.source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[ACSportsAttributionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributionButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("scores.source.hint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityHint:", v7);

}

- (void)setLeagueAppPunchOut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ACSportsAttributionViewAccessibility;
  v4 = a3;
  -[ACSportsAttributionViewAccessibility setLeagueAppPunchOut:](&v9, sel_setLeagueAppPunchOut_, v4);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("appDisplayName"), v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACSportsAttributionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_leagueAppButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  -[ACSportsAttributionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_leagueAppButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("open.league.app.hint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityHint:", v8);

}

@end
