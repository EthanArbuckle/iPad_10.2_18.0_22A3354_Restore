@implementation PKSegmentedBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSegmentedBarView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PKRewardsSummaryChartBarConfiguration"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSegmentedBarView"), CFSTR("_configuration"), "<PKSegmentedBarConfiguration>");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setAccessibilityValueLabels:(id)a3
{
  -[PKSegmentedBarViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("accessibilityValueLabels"));
}

- (id)accessibilityValueLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  -[PKSegmentedBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsProtocol();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("PKRewardsSummaryChartBarConfiguration"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    AXFormatFloatWithPercentage();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    AXFormatFloatWithPercentage();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v6;
    AXFormatFloatWithPercentage();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v7;
    accessibilityLocalizedString(CFSTR("bonus.category"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PKSegmentedBarViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilityValueLabels"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  -[PKSegmentedBarViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configuration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsProtocol();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[PKSegmentedBarViewAccessibility accessibilityValueLabels](self, "accessibilityValueLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v32;
    v11 = CFSTR("PKRewardsSummaryChartBarConfiguration");
    do
    {
      v12 = 0;
      v13 = v8;
      v30 = v8;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v5);
        v14 = v13 + v12;
        v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
        if (objc_msgSend(v4, "numberOfSegments", v26, v27, v28) > v13 + v12)
        {
          NSClassFromString(&v11->isa);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = (void *)MEMORY[0x24BDD16F0];
            v29 = v9;
            v17 = v7;
            v18 = v11;
            v19 = v10;
            v20 = v5;
            v21 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v4, "valueForSegmentAtIndex:", v14);
            objc_msgSend(v21, "numberWithDouble:");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "localizedStringFromNumber:numberStyle:", v22, 2);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = v20;
            v10 = v19;
            v11 = v18;
            v7 = v17;
            v9 = v29;
          }
          else
          {
            objc_msgSend(v4, "valueForSegmentAtIndex:", v13 + v12);
            AXFormatFloat();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v27 = v23;
          v28 = CFSTR("__AXStringForVariablesSentinel");
          v26 = v15;
          __UIAXStringForVariables();
          v24 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v24;
          v13 = v30;
        }
        ++v12;
      }
      while (v7 != v12);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v8 = v13 + v12;
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
