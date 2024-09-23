@implementation HKGraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKGraphView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKGraphView"), CFSTR("_updateGraphViewConfigurationIfNecessary"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_accessibilityClearChildren"), "v", 0);

}

- (id)_accessibilityChartElements
{
  JUMPOUT(0x234910F30);
}

- (void)_accessibilitySetChartElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_updateGraphViewConfigurationIfNecessary
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKGraphViewAccessibility;
  -[HKGraphViewAccessibility _updateGraphViewConfigurationIfNecessary](&v3, sel__updateGraphViewConfigurationIfNecessary);
  -[HKGraphViewAccessibility _accessibilityClearElements](self, "_accessibilityClearElements");
}

- (void)_accessibilityClearElements
{
  id v3;
  void *v4;

  -[HKGraphViewAccessibility _accessibilitySetChartElements:](self, "_accessibilitySetChartElements:", 0);
  -[HKGraphViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

uint64_t __55__HKGraphViewAccessibility__accessibilityClearElements__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityClearChildren");
}

- (BOOL)_accessibilitySupportsChartsV2
{
  return 1;
}

- (id)accessibilityChartDescriptor
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDB3D60]);
  -[HKGraphViewAccessibility _accessibilitySeriesTitle](self, "_accessibilitySeriesTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewAccessibility _accessibilityChartSummary](self, "_accessibilityChartSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewAccessibility _accessibilityXAxis](self, "_accessibilityXAxis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewAccessibility _accessibilityYAxis](self, "_accessibilityYAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewAccessibility _accessibilityDataSeries](self, "_accessibilityDataSeries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithTitle:summary:xAxisDescriptor:yAxisDescriptor:series:", v4, v5, v6, v7, v9);

  return v10;
}

- (id)_accessibilityDataSeries
{
  HKGraphViewAccessibility *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  void *v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  id v13;
  HKGraphViewAccessibility *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;

  v2 = self;
  -[HKGraphViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXGraphViewGraphElementsYValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewAccessibility _accessibilityValueForKey:](v2, "_accessibilityValueForKey:", CFSTR("kAXGraphViewGraphElementsXValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "count");
  v6 = objc_msgSend(v4, "count");
  if (v5 >= v6)
    v7 = v6;
  else
    v7 = v5;
  v8 = (void *)objc_opt_new();
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      -[HKGraphViewAccessibility _accessibilityScaledYValue:](v2, "_accessibilityScaledYValue:");
      v12 = v11;

      v13 = objc_alloc(MEMORY[0x24BDB3D70]);
      v14 = v2;
      v15 = v3;
      v16 = (void *)MEMORY[0x24BDB3D78];
      objc_msgSend(v4, "objectAtIndexedSubscript:", i);
      v17 = v4;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueWithCategory:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDB3D78], "valueWithNumber:", v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v13, "initWithX:y:", v19, v20);

      v3 = v15;
      v2 = v14;

      v4 = v17;
      objc_msgSend(v8, "addObject:", v21);

    }
  }
  v22 = objc_alloc(MEMORY[0x24BDB3D80]);
  -[HKGraphViewAccessibility _accessibilitySeriesTitle](v2, "_accessibilitySeriesTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v22, "initWithName:isContinuous:dataPoints:", v23, -[HKGraphViewAccessibility _accessibilityIsContinuous](v2, "_accessibilityIsContinuous"), v8);

  return v24;
}

- (double)_accessibilityScaledYValue:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[HKGraphViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXGraphViewYAxisMin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  for (; a3 < v6; a3 = a3 * 10.0)
    ;
  return a3;
}

- (id)_accessibilitySeriesTitle
{
  __CFString *v2;

  -[HKGraphViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXGraphViewDisplayName"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = &stru_25022AE30;
  return v2;
}

- (id)_accessibilityXAxis
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[HKGraphViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXGraphViewGraphElementsXValues"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDB3D58]);
  accessibilityLocalizedString(CFSTR("time.axis.title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:categoryOrder:", v4, v2);

  return v5;
}

- (id)_accessibilityYAxis
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  -[HKGraphViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXGraphViewYAxisMin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  -[HKGraphViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXGraphViewYAxisMax"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = objc_alloc(MEMORY[0x24BDB3D88]);
  -[HKGraphViewAccessibility _accessibilitySeriesTitle](self, "_accessibilitySeriesTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__HKGraphViewAccessibility__accessibilityYAxis__block_invoke;
  v13[3] = &unk_25022AE10;
  v13[4] = self;
  v11 = (void *)objc_msgSend(v9, "initWithTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v10, 0, v13, v5, v8);

  return v11;
}

id __47__HKGraphViewAccessibility__accessibilityYAxis__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityScaledYValue:");
  v3 = v2;
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("chart.value.and.unit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityValueForKey:", CFSTR("kAXGraphViewUnit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilityIsContinuous
{
  return -[HKGraphViewAccessibility _accessibilityIntegerValueForKey:](self, "_accessibilityIntegerValueForKey:", CFSTR("kAXGraphViewDataSeriesType")) == 1;
}

- (id)_accessibilityChartSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HKGraphViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("kAXGraphViewGraphElementsXValues"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewAccessibility _accessibilitySeriesTitle](self, "_accessibilitySeriesTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") && objc_msgSend(v3, "count"))
  {
    accessibilityLocalizedString(CFSTR("chart.summary.format"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v5, v4, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
