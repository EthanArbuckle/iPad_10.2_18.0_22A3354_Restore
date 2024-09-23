@implementation VUIScorecardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIScorecardView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUIScorecardView"), CFSTR("delegate"), "@");
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("VUIScorecardViewDelegate"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.UnifiedOverlayView"), CFSTR("scoreboardViewModel"), "Optional<VUISportsScoreboardViewModel>");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VUISportsScoreboardViewModel"), CFSTR("scores"), "@");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[VUIScorecardViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349244C8](CFSTR("VUIScorecardViewDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "conformsToProtocol:", v4);

  if ((v5 & 1) != 0)
  {
    v22 = v3;
    objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("scoreboardViewModel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeDictionaryForKey:", CFSTR("leagueContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeStringForKey:", CFSTR("leagueType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v6;
    objc_msgSend(v6, "safeArrayForKey:", CFSTR("scores"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("baseball"), v19, v20) & 1) != 0)
          {
            objc_msgSend(v15, "axMapObjectsUsingBlock:", &__block_literal_global_3);
            v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v16 = v15;
          }
          v17 = v16;
          AXLabelForElements();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16, v19, CFSTR("__AXStringForVariablesSentinel"));
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    v3 = v22;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)VUIScorecardViewAccessibility;
    -[VUIScorecardViewAccessibility accessibilityLabel](&v28, sel_accessibilityLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __51__VUIScorecardViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return accessibilityMLBScores(a2);
}

@end
