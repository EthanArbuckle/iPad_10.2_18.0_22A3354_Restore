@implementation ACSportsBaseballScoreboardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsBaseballScoreboardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ACSportsBaseballScoreboardView"), CFSTR("ACSportsPeriodicScoreboardView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsBaseballScoreboardView"), CFSTR("_hitsLineScoreView"), "ACSportsMatchupLineScoreView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsBaseballScoreboardView"), CFSTR("_errorsLineScoreView"), "ACSportsMatchupLineScoreView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsBaseballScoreboardView"), CFSTR("matchup"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)ACSportsBaseballScoreboardViewAccessibility;
  -[ACSportsBaseballScoreboardViewAccessibility accessibilityElements](&v18, sel_accessibilityElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ACSportsBaseballScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_hitsLineScoreView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSportsBaseballScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_errorsLineScoreView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", CFSTR("hits"), CFSTR("AXSportsScorePeriodType"));
  objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", CFSTR("errors"), CFSTR("AXSportsScorePeriodType"));
  objc_msgSend(v4, "axSafelyAddObject:", v5);
  objc_msgSend(v4, "axSafelyAddObject:", v6);
  -[ACSportsBaseballScoreboardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("matchup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "_accessibilitySetRetainedValue:forKey:", v7, CFSTR("AXSportsMatchup"), (_QWORD)v14);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

  return v8;
}

@end
