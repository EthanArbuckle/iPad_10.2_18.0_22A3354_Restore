@implementation ACSportsMatchupLineScoreViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsMatchupLineScoreView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsMatchupLineScoreView"), CFSTR("periodNameLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsMatchupLineScoreView"), CFSTR("firstScoreLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsMatchupLineScoreView"), CFSTR("secondScoreLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("homeEntity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsMatchup"), CFSTR("awayEntity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsEntity"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsEntity"), CFSTR("league"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsLeague"), CFSTR("sport"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;

  -[ACSportsMatchupLineScoreViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("periodNameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACSportsMatchupLineScoreViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXSportsScorePeriodType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSportsMatchupLineScoreViewAccessibility _axPeriodNameForPeriod:withValue:](self, "_axPeriodNameForPeriod:withValue:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACSportsMatchupLineScoreViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("firstScoreLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACSportsMatchupLineScoreViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondScoreLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSportsMatchupLineScoreViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXSportsMatchup"), v8, v10, CFSTR("__AXStringForVariablesSentinel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "safeValueForKey:", CFSTR("homeEntity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeValueForKey:", CFSTR("name"));
    v22 = v4;
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "safeValueForKey:", CFSTR("awayEntity"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeValueForKey:", CFSTR("name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "safeBoolForKey:", CFSTR("ACSportsHomeIsFirst"));
    __UIAXStringForVariables();
    v18 = objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v19 = objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v20 = objc_claimAutoreleasedReturnValue();

    v4 = v22;
    v11 = (void *)v20;
    v10 = (void *)v19;
    v8 = (void *)v18;
  }

  return v11;
}

- (id)_axPeriodNameForPeriod:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  int v19;
  BOOL v20;
  int v21;

  v6 = a3;
  v7 = a4;
  if (_axPeriodNameForPeriod_withValue__onceToken != -1)
    dispatch_once(&_axPeriodNameForPeriod_withValue__onceToken, &__block_literal_global);
  v8 = objc_msgSend(v7, "integerValue");
  v9 = (void *)_axPeriodNameForPeriod_withValue__OrdinalNumberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "integerValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACSportsMatchupLineScoreViewAccessibility _axSportType](self, "_axSportType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Baseball")) & 1) == 0
    && objc_msgSend(v6, "isEqualToString:", CFSTR("total")))
  {
    v13 = CFSTR("sport.score.total");
LABEL_27:
    accessibilityLocalizedString(v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("Baseball")))
  {
    if (v6 && !v8)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("total")))
      {
        v13 = CFSTR("sport.baseball.runs");
        goto LABEL_27;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("hits")))
      {
        v13 = CFSTR("sport.baseball.hits");
        goto LABEL_27;
      }
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("errors")))
      {
        v13 = CFSTR("sport.baseball.errors");
        goto LABEL_27;
      }
      goto LABEL_18;
    }
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = CFSTR("sport.baseball.inning");
    goto LABEL_16;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("Football")))
  {
    if (!v6 || v8)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = CFSTR("sport.football.half");
LABEL_16:
      accessibilityLocalizedString(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v16, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
    goto LABEL_18;
  }
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Soccer")) & 1) != 0)
    goto LABEL_18;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("Hockey")))
  {
    if (!v6 || v8)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = CFSTR("sport.hockey.period");
      goto LABEL_16;
    }
LABEL_18:
    v17 = 0;
    goto LABEL_28;
  }
  v19 = objc_msgSend(v12, "isEqualToString:", CFSTR("Basketball"));
  v17 = 0;
  if (v6)
    v20 = v8 == 0;
  else
    v20 = 0;
  v21 = !v20;
  if (v19 && v21)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = CFSTR("sport.basketball.quarter");
    goto LABEL_16;
  }
LABEL_28:

  return v17;
}

uint64_t __78__ACSportsMatchupLineScoreViewAccessibility__axPeriodNameForPeriod_withValue___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)_axPeriodNameForPeriod_withValue__OrdinalNumberFormatter;
  _axPeriodNameForPeriod_withValue__OrdinalNumberFormatter = (uint64_t)v0;

  return objc_msgSend((id)_axPeriodNameForPeriod_withValue__OrdinalNumberFormatter, "setNumberStyle:", 6);
}

- (id)_axSportType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACSportsMatchupLineScoreViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXSportsMatchup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("awayEntity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("league"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("sport"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
