@implementation ACSportsSoccerScoreboardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsSoccerScoreboardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ACSportsSoccerScoreboardView"), CFSTR("ACSportsScoreboardView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsSoccerScoreboardView"), CFSTR("setMatchup:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsScoreboardView"), CFSTR("_headerLabel"), "SiriUIContentLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsScoreboardView"), CFSTR("_subtitleLabel"), "SiriUIContentLabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("homeEntity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("homeScore"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("awayEntity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("awayScore"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsEntity"), CFSTR("name"), "@", 0);

}

- (void)setMatchup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ACSportsSoccerScoreboardViewAccessibility;
  v4 = a3;
  -[ACSportsSoccerScoreboardViewAccessibility setMatchup:](&v15, sel_setMatchup_, v4);
  -[ACSportsSoccerScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSportsSoccerScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 0);
  objc_msgSend(v4, "safeValueForKey:", CFSTR("homeEntity"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("homeScore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("awayEntity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("awayScore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityLabel:", v13, v9, v11, v12, v14, CFSTR("__AXStringForVariablesSentinel"));
}

@end
