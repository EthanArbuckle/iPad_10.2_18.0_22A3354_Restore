@implementation VUISportsScoreboardViewModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUISportsScoreboardViewModel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUISportsScoreboardViewModel"), CFSTR("leagueContext"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUISportsScoreboardViewModel"), CFSTR("scores"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUISportsScoreboardViewModel"), CFSTR("showScoreboard"), "B");

}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  if (-[VUISportsScoreboardViewModelAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showScoreboard")))
  {
    -[VUISportsScoreboardViewModelAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("leagueContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeArrayForKey:", CFSTR("competitors"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUISportsScoreboardViewModelAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("scores"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafeObjectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axSafeObjectAtIndex:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      v7 = 0;
      v8 = 0;
      do
      {
        objc_msgSend(v6, "axSafeObjectAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "axSafeObjectAtIndex:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", CFSTR("nickname"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        __UIAXStringForVariables();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v12;
      }
      while (objc_msgSend(v6, "count", v11, v9, CFSTR("__AXStringForVariablesSentinel")) > v7);
    }
    else
    {
      v12 = 0;
    }
    AXLabelForElements();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("sports.scoreboard"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v14, CFSTR("__AXStringForVariablesSentinel"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

@end
