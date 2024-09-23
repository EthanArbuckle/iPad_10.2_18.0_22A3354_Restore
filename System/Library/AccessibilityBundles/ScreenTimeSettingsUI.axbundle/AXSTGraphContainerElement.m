@implementation AXSTGraphContainerElement

- (int64_t)accessibilityContainerType
{
  return 13;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (AXChartDescriptor)accessibilityChartDescriptor
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
  -[AXSTGraphContainerElement _accessibilitySeriesTitle](self, "_accessibilitySeriesTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSTGraphContainerElement _accessibilityChartSummary](self, "_accessibilityChartSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSTGraphContainerElement _accessibilityXAxis](self, "_accessibilityXAxis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSTGraphContainerElement _accessibilityYAxis](self, "_accessibilityYAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSTGraphContainerElement _accessibilityDataSeries](self, "_accessibilityDataSeries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithTitle:summary:xAxisDescriptor:yAxisDescriptor:series:", v4, v5, v6, v7, v9);

  return (AXChartDescriptor *)v10;
}

- (BOOL)_accessibilitySupportsChartsV2
{
  return 1;
}

- (id)_axXAxisLabels
{
  void *v2;
  void *v3;

  -[AXSTGraphContainerElement _axBarElements](self, "_axBarElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axMapObjectsUsingBlock:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __43__AXSTGraphContainerElement__axXAxisLabels__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityXAxis
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDB3D58]);
  accessibilityLocalizedString(CFSTR("graph.x.axis.description.time"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSTGraphContainerElement _axXAxisLabels](self, "_axXAxisLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithTitle:categoryOrder:", v4, v5);

  return v6;
}

- (id)_accessibilityYAxis
{
  unint64_t v3;
  int64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = -[AXSTGraphContainerElement itemType](self, "itemType");
  if (v3 - 1 >= 4)
  {
    if (v3 == 5)
    {
      v5 = CFSTR("graph.notifications.unit");
      goto LABEL_11;
    }
    if (v3 == 6)
    {
      v5 = CFSTR("graph.pickups.unit");
      goto LABEL_11;
    }
LABEL_8:
    v6 = 0;
    goto LABEL_12;
  }
  v4 = -[AXSTGraphContainerElement mode](self, "mode");
  if (!v4)
  {
    v5 = CFSTR("graph.hours.unit");
    goto LABEL_11;
  }
  if (v4 != 1)
    goto LABEL_8;
  v5 = CFSTR("graph.minutes.unit");
LABEL_11:
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[AXSTGraphContainerElement _axTimeValues](self, "_axTimeValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v14, "doubleValue");
        if (v12 >= v15)
          v12 = v15;
        objc_msgSend(v14, "doubleValue");
        if (v11 < v16)
          v11 = v16;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
  }

  v17 = objc_alloc(MEMORY[0x24BDB3D88]);
  accessibilityLocalizedString(CFSTR("graph.y.axis.description.usage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __48__AXSTGraphContainerElement__accessibilityYAxis__block_invoke;
  v22[3] = &unk_250336100;
  v23 = v6;
  v19 = v6;
  v20 = (void *)objc_msgSend(v17, "initWithTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v18, 0, v22, v12, v11);

  return v20;
}

id __48__AXSTGraphContainerElement__accessibilityYAxis__block_invoke(uint64_t a1, double a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("chart.value.and.unit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_axTimeValues
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[AXSTGraphContainerElement _axBarElements](self, "_axBarElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__AXSTGraphContainerElement__axTimeValues__block_invoke;
  v6[3] = &unk_250336128;
  v6[4] = self;
  objc_msgSend(v3, "axMapObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __42__AXSTGraphContainerElement__axTimeValues__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = *(void **)(a1 + 32);
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("dataPoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("total"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v5, "_updateYValueForType:");
  objc_msgSend(v4, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  AXSTGraphContainerElement *v22;

  -[AXSTGraphContainerElement _axXAxisLabels](self, "_axXAxisLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  -[AXSTGraphContainerElement _axTimeValues](self, "_axTimeValues");
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
      objc_msgSend(v3, "axSafeObjectAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "axSafeObjectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      v14 = objc_alloc(MEMORY[0x24BDB3D70]);
      objc_msgSend(MEMORY[0x24BDB3D78], "valueWithCategory:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDB3D78], "valueWithNumber:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithX:y:", v15, v16);

      objc_msgSend(v8, "addObject:", v17);
    }
  }
  v18 = objc_alloc(MEMORY[0x24BDB3D80]);
  -[AXSTGraphContainerElement _accessibilitySeriesTitle](v22, "_accessibilitySeriesTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:isContinuous:dataPoints:", v19, 0, v8);

  return v20;
}

- (double)_updateYValueForType:(double)a3
{
  double v5;

  if (-[AXSTGraphContainerElement itemType](self, "itemType") == 1
    || -[AXSTGraphContainerElement itemType](self, "itemType") == 2
    || -[AXSTGraphContainerElement itemType](self, "itemType") == 3
    || -[AXSTGraphContainerElement itemType](self, "itemType") == 4)
  {
    if (!-[AXSTGraphContainerElement mode](self, "mode"))
    {
      v5 = 3600.0;
      return a3 / v5;
    }
    if (-[AXSTGraphContainerElement mode](self, "mode") == 1)
    {
      v5 = 60.0;
      return a3 / v5;
    }
  }
  return a3;
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

  -[AXSTGraphContainerElement _axXAxisLabels](self, "_axXAxisLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSTGraphContainerElement _accessibilitySeriesTitle](self, "_accessibilitySeriesTitle");
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

- (id)_axBarElements
{
  void *v2;
  void *v3;

  -[AXSTGraphContainerElement accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ax_filteredArrayUsingBlock:", &__block_literal_global_211);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __43__AXSTGraphContainerElement__axBarElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23491C610](CFSTR("STBarView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setAccessibilityChartDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->accessibilityChartDescriptor, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->accessibilityChartDescriptor, 0);
}

@end
