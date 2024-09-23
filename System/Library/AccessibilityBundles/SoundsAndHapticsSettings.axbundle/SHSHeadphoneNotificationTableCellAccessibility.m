@implementation SHSHeadphoneNotificationTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SHSHeadphoneNotificationTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SHSHeadphoneNotificationTableCell"), CFSTR("PSTableCell"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SHSHeadphoneNotificationTableCell"), CFSTR("_notificationData"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SHSHeadphoneNotificationTableCell"), CFSTR("layoutSubviews"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SHSHeadphoneNotificationTableCellAccessibility;
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityLoadChartInformation](self, "_accessibilityLoadChartInformation");
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("headphone.notifications.title"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SHSHeadphoneNotificationTableCellAccessibility;
  return -[SHSHeadphoneNotificationTableCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) & ~*MEMORY[0x24BDF73E8];
}

- (BOOL)_accessibilitySupportsChartsV2
{
  return 1;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SHSHeadphoneNotificationTableCellAccessibility;
  -[SHSHeadphoneNotificationTableCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadChartInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  SHSHeadphoneNotificationTableCellAccessibility *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v26 = (void *)objc_opt_new();
  v25 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDateFormat:", CFSTR("MMM"));
  v24 = v4;
  objc_msgSend(v4, "setDateFormat:", CFSTR("MMMM"));
  v23 = self;
  -[SHSHeadphoneNotificationTableCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_notificationData"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v29;
    v9 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_opt_class();
        objc_msgSend(v11, "objectForKey:", CFSTR("count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v11, "objectForKey:", CFSTR("month"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (!v16)
        {
          objc_msgSend(v3, "dateFromString:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringFromDate:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "addObject:", v18);
          objc_msgSend(v25, "addObject:", v13);
          v19 = objc_msgSend(v13, "intValue");
          if ((int)v9 >= v19)
            v9 = v19;
          else
            v9 = v9;
          v20 = objc_msgSend(v13, "intValue");
          if ((int)v7 <= v20)
            v7 = v20;
          else
            v7 = v7;

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v9 = 0x7FFFFFFFLL;
  }

  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilitySetRetainedValue:forKey:](v23, "_accessibilitySetRetainedValue:forKey:", v26, CFSTR("kAXHeadphoneNotificationGraphXLabels"));
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilitySetRetainedValue:forKey:](v23, "_accessibilitySetRetainedValue:forKey:", v25, CFSTR("kAXHeadphoneNotificationGraphYValues"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilitySetRetainedValue:forKey:](v23, "_accessibilitySetRetainedValue:forKey:", v21, CFSTR("kAXHeadphoneNotificationGraphYAxisMin"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilitySetRetainedValue:forKey:](v23, "_accessibilitySetRetainedValue:forKey:", v22, CFSTR("kAXHeadphoneNotificationGraphYAxisMax"));

}

- (id)accessibilityChartDescriptor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXHeadphoneNotificationGraphXLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDB3D58]);
  accessibilityLocalizedString(CFSTR("headphone.notifications.xaxis"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithTitle:categoryOrder:", v5, v3);

  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXHeadphoneNotificationGraphYAxisMin"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXHeadphoneNotificationGraphYAxisMax"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = objc_alloc(MEMORY[0x24BDB3D88]);
  accessibilityLocalizedString(CFSTR("headphone.notifications.yaxis"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v14, 0, &__block_literal_global_0, v9, v12);

  v16 = objc_alloc(MEMORY[0x24BDB3D60]);
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityDataSeriesName](self, "_accessibilityDataSeriesName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityChartSummary](self, "_accessibilityChartSummary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityDataSeries](self, "_accessibilityDataSeries");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v16, "initWithTitle:summary:xAxisDescriptor:yAxisDescriptor:series:", v17, v18, v6, v15, v20);

  return v21;
}

id __78__SHSHeadphoneNotificationTableCellAccessibility_accessibilityChartDescriptor__block_invoke(double a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("notification.value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, (int)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityChartSummary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXHeadphoneNotificationGraphXLabels"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("headphone.notifications.chart.summary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityDataSeries
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  SHSHeadphoneNotificationTableCellAccessibility *v21;

  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXHeadphoneNotificationGraphYValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = self;
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXHeadphoneNotificationGraphXLabels"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v3, "count");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  v8 = (void *)objc_opt_new();
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      v10 = (void *)MEMORY[0x24BDB3D78];
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "valueWithCategory:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x24BDB3D78];
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v13, "valueWithNumber:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB3D70]), "initWithX:y:", v12, v15);
      objc_msgSend(v8, "addObject:", v16);

    }
  }
  v17 = objc_alloc(MEMORY[0x24BDB3D80]);
  -[SHSHeadphoneNotificationTableCellAccessibility _accessibilityDataSeriesName](v21, "_accessibilityDataSeriesName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithName:isContinuous:dataPoints:", v18, 0, v8);

  return v19;
}

@end
