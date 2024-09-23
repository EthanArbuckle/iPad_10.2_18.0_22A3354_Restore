@implementation ACSportsPeriodicScoreboardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsPeriodicScoreboardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ACSportsPeriodicScoreboardView"), CFSTR("ACSportsScoreboardView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsScoreboardView"), CFSTR("_headerLabel"), "SiriUIContentLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsScoreboardView"), CFSTR("_subtitleLabel"), "SiriUIContentLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsScoreboardView"), CFSTR("_venueNameLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsPeriodicScoreboardView"), CFSTR("_lineScoreViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsPeriodicScoreboardView"), CFSTR("_totalLineScoreView"), "ACSportsMatchupLineScoreView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsScoreboardView"), CFSTR("matchup"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("homeEntity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("homeScore"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("awayEntity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("awayScore"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsEntity"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsPeriodicScoreboardView"), CFSTR("didChangeMatchupFromMatchup:"), "v", "@", 0);

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
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[ACSportsPeriodicScoreboardViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXScoreboardElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSportsPeriodicScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_headerLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSportsPeriodicScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSportsPeriodicScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("matchup"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "safeValueForKey:", CFSTR("homeEntity"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeValueForKey:", CFSTR("name"));
      v9 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "safeValueForKey:", CFSTR("homeScore"));
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safeValueForKey:", CFSTR("awayEntity"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeValueForKey:", CFSTR("name"));
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "safeValueForKey:", CFSTR("awayScore"));
      v13 = objc_claimAutoreleasedReturnValue();
      v32 = v5;
      objc_msgSend(v5, "accessibilityLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)v13;
      v29 = (void *)v12;
      v30 = (void *)v10;
      v31 = (void *)v9;
      __UIAXStringForVariables();
      v14 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v14;
      objc_msgSend(v4, "setAccessibilityLabel:", v14, v10, v12, v13, v26, CFSTR("__AXStringForVariablesSentinel"));
      objc_msgSend(v3, "axSafelyAddObject:", v4);
      v37 = 0;
      objc_opt_class();
      -[ACSportsPeriodicScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lineScoreViews"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v34 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v22, "_accessibilitySetRetainedValue:forKey:", v7, CFSTR("AXSportsMatchup"));
            objc_msgSend(v3, "addObject:", v22);
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v19);
      }

      -[ACSportsPeriodicScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_totalLineScoreView"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_accessibilitySetRetainedValue:forKey:", CFSTR("total"), CFSTR("AXSportsScorePeriodType"));
      objc_msgSend(v23, "_accessibilitySetRetainedValue:forKey:", v7, CFSTR("AXSportsMatchup"));
      objc_msgSend(v3, "axSafelyAddObject:", v23);
      -[ACSportsPeriodicScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_venueNameLabel"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXIsSportsPeriodVenueLabel"));
      objc_msgSend(v3, "axSafelyAddObject:", v24);

      v5 = v32;
    }
    -[ACSportsPeriodicScoreboardViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXScoreboardElements"));

  }
  return v3;
}

- (void)didChangeMatchupFromMatchup:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACSportsPeriodicScoreboardViewAccessibility;
  -[ACSportsPeriodicScoreboardViewAccessibility didChangeMatchupFromMatchup:](&v4, sel_didChangeMatchupFromMatchup_, a3);
  -[ACSportsPeriodicScoreboardViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXScoreboardElements"));
}

@end
