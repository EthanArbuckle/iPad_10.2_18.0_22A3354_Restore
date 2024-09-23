@implementation LabeledSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Setup.LabeledSlider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("Setup.LabeledSlider"), CFSTR("labels"), "Array<UILabel>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Setup.BuddyAppearanceController"), CFSTR("modeChanged"), "v", 0);

}

- (float)_accessibilityLabeledSliderValue
{
  void *v2;
  float v3;
  float v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (double)_accessibilityIncreaseAmount:(BOOL)a3
{
  _BOOL4 v3;
  float v4;
  float v5;

  v3 = a3;
  -[LabeledSliderAccessibility _accessibilityLabeledSliderValue](self, "_accessibilityLabeledSliderValue");
  v5 = -1.01;
  if (v3)
    v5 = 1.01;
  return (float)(v5 + v4);
}

- (void)_accessibilityReportModeChanged
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allTargets");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "modeChanged", (_QWORD)v10);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], self);
}

- (void)accessibilityIncrement
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LabeledSliderAccessibility;
  -[LabeledSliderAccessibility accessibilityIncrement](&v3, sel_accessibilityIncrement);
  -[LabeledSliderAccessibility _accessibilityReportModeChanged](self, "_accessibilityReportModeChanged");
}

- (void)accessibilityDecrement
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LabeledSliderAccessibility;
  -[LabeledSliderAccessibility accessibilityDecrement](&v3, sel_accessibilityDecrement);
  -[LabeledSliderAccessibility _accessibilityReportModeChanged](self, "_accessibilityReportModeChanged");
}

- (id)accessibilityValue
{
  void *v3;
  float v4;
  int v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[LabeledSliderAccessibility safeSwiftArrayForKey:](self, "safeSwiftArrayForKey:", CFSTR("labels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LabeledSliderAccessibility _accessibilityLabeledSliderValue](self, "_accessibilityLabeledSliderValue");
  v5 = llroundf(v4);
  v6 = v5 & ~(v5 >> 31);
  if (objc_msgSend(v3, "count") <= v6)
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

@end
