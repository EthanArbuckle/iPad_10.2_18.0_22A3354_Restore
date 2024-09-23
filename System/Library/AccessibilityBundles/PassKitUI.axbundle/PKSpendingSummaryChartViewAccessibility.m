@implementation PKSpendingSummaryChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSpendingSummaryChartView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryChartView"), CFSTR("_summary"), "PKSpendingSummary");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSummary"), CFSTR("spendingsPerCalendarUnit"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryChartView"), CFSTR("_bars"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSummaryChartView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSummary"), CFSTR("summaryType"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSummary"), CFSTR("startDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSummary"), CFSTR("endDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSummary"), CFSTR("totalSpending"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCurrencyAmount"), CFSTR("currency"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKCurrencyAmount"), CFSTR("amount"), "@", 0);

}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("spending.summary.label"));
}

- (id)_axStringFromCurrency:(id)a3
{
  return (id)objc_msgSend(a3, "minimalFormattedStringValue");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSummaryChartViewAccessibility;
  -[PKSpendingSummaryChartViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[PKSpendingSummaryChartViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("accessibilityElements"));
}

- (id)accessibilityElements
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  UIAXPKSpendingElement *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v43;
  const __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id obj;
  void *v50;
  void *v51;
  UIAXPKSpendingElement *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  -[PKSpendingSummaryChartViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("accessibilityElements"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v68 = 0;
    -[PKSpendingSummaryChartViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_summary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("summaryType"));
    -[PKSpendingSummaryChartViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_summary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeArrayForKey:", CFSTR("spendingsPerCalendarUnit"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    -[PKSpendingSummaryChartViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_bars"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v56)
    {
      v9 = 0;
      v54 = *(_QWORD *)v65;
      v46 = v6;
      v47 = v8;
      do
      {
        for (i = 0; i != v56; ++i)
        {
          if (*(_QWORD *)v65 != v54)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if (objc_msgSend(v11, "_accessibilityViewIsVisible", v43, v44))
          {
            if (v9 >= objc_msgSend(v8, "count"))
            {
              v14 = 0;
            }
            else
            {
              v68 = 0;
              objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              __UIAccessibilitySafeClass();
              v13 = objc_claimAutoreleasedReturnValue();

              if (v68)
                goto LABEL_38;
              v14 = (void *)v13;
            }
            v15 = -[UIAXPKSpendingElement initWithAccessibilityContainer:]([UIAXPKSpendingElement alloc], "initWithAccessibilityContainer:", self);
            v63[0] = MEMORY[0x24BDAC760];
            v63[1] = 3221225472;
            v63[2] = __64__PKSpendingSummaryChartViewAccessibility_accessibilityElements__block_invoke;
            v63[3] = &unk_2502E3E30;
            v63[4] = v11;
            -[UIAXPKSpendingElement _setAccessibilityFrameBlock:](v15, "_setAccessibilityFrameBlock:", v63);
            v68 = 0;
            objc_msgSend(v14, "safeValueForKey:", CFSTR("startDate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilitySafeClass();
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            if (v68)
              goto LABEL_38;
            v68 = 0;
            objc_msgSend(v14, "safeValueForKey:", CFSTR("endDate"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilitySafeClass();
            v18 = objc_claimAutoreleasedReturnValue();

            if (v68)
              goto LABEL_38;
            -[UIAXPKSpendingElement setStartDate:](v15, "setStartDate:", v58);
            -[UIAXPKSpendingElement setEndDate:](v15, "setEndDate:", v18);
            v57 = v14;
            if (v6 == 1)
            {
              v19 = (void *)MEMORY[0x24BDD17C8];
              accessibilityLocalizedString(CFSTR("date.range"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = i;
              AXDateStringForFormat();
              v21 = v18;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              AXDateStringForFormat();
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "stringWithFormat:", v25, v22, v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIAXPKSpendingElement setAccessibilityLabel:](v15, "setAccessibilityLabel:", v24);

              v14 = v57;
              i = v20;

              v18 = v21;
            }
            else
            {
              AXDateStringForFormat();
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[UIAXPKSpendingElement setAccessibilityLabel:](v15, "setAccessibilityLabel:", v25);
            }

            v68 = 0;
            objc_msgSend(v14, "safeValueForKey:", CFSTR("totalSpending"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilitySafeClass();
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v68)
LABEL_38:
              abort();
            objc_msgSend(v27, "amount");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "doubleValue");
            -[UIAXPKSpendingElement setChartValue:](v15, "setChartValue:");

            v50 = v27;
            objc_msgSend(v27, "currency");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v15;
            -[UIAXPKSpendingElement setCurrency:](v15, "setCurrency:", v29);

            objc_msgSend(v14, "safeArrayForKey:", CFSTR("orderedSpendingCategories"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = 0u;
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
            v53 = i;
            v51 = (void *)v18;
            if (v31)
            {
              v32 = v31;
              v33 = 0;
              v34 = *(_QWORD *)v60;
              do
              {
                for (j = 0; j != v32; ++j)
                {
                  if (*(_QWORD *)v60 != v34)
                    objc_enumerationMutation(v30);
                  v36 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    if ((unint64_t)objc_msgSend(v30, "count") < 2)
                    {
                      v38 = 0;
                    }
                    else
                    {
                      objc_msgSend(v36, "totalAmount");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PKSpendingSummaryChartViewAccessibility _axStringFromCurrency:](self, "_axStringFromCurrency:", v37);
                      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    }
                    objc_msgSend(v36, "merchantCategory", v43, v44, v45);
                    PKLocalizedStringFromMerchantCategory();
                    v44 = v38;
                    v45 = CFSTR("__AXStringForVariablesSentinel");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    __UIAXStringForVariables();
                    v39 = objc_claimAutoreleasedReturnValue();

                    v33 = (void *)v39;
                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
              }
              while (v32);
            }
            else
            {
              v33 = 0;
            }
            -[PKSpendingSummaryChartViewAccessibility _axStringFromCurrency:](self, "_axStringFromCurrency:", v50, v43, v44, v45);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v33;
            v44 = CFSTR("__AXStringForVariablesSentinel");
            __UIAXStringForVariables();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIAXPKSpendingElement setAccessibilityValue:](v52, "setAccessibilityValue:", v41);

            objc_msgSend(v48, "addObject:", v52);
            ++v9;

            v6 = v46;
            v8 = v47;
            i = v53;
          }
        }
        v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v56);
    }

    -[PKSpendingSummaryChartViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v48, CFSTR("accessibilityElements"));
    v3 = v48;

  }
  return v3;
}

uint64_t __64__PKSpendingSummaryChartViewAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityFrame");
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (BOOL)_accessibilitySupportsChartsV2
{
  return 1;
}

- (id)_axStartDates
{
  void *v2;
  void *v3;

  -[PKSpendingSummaryChartViewAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axMapObjectsUsingBlock:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __56__PKSpendingSummaryChartViewAccessibility__axStartDates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityLabel");
}

- (id)_axSpendingValues
{
  void *v2;
  void *v3;

  -[PKSpendingSummaryChartViewAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axMapObjectsUsingBlock:", &__block_literal_global_273);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __60__PKSpendingSummaryChartViewAccessibility__axSpendingValues__block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "chartValue");
  return objc_msgSend(v2, "numberWithDouble:");
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
  -[PKSpendingSummaryChartViewAccessibility _accessibilitySeriesTitle](self, "_accessibilitySeriesTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryChartViewAccessibility _accessibilityChartSummary](self, "_accessibilityChartSummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryChartViewAccessibility _accessibilityXAxis](self, "_accessibilityXAxis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryChartViewAccessibility _accessibilityYAxis](self, "_accessibilityYAxis");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryChartViewAccessibility _accessibilityDataSeries](self, "_accessibilityDataSeries");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithTitle:summary:xAxisDescriptor:yAxisDescriptor:series:", v4, v5, v6, v7, v9);

  return v10;
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
  PKSpendingSummaryChartViewAccessibility *v22;

  -[PKSpendingSummaryChartViewAccessibility _axStartDates](self, "_axStartDates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self;
  -[PKSpendingSummaryChartViewAccessibility _axSpendingValues](self, "_axSpendingValues");
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
  -[PKSpendingSummaryChartViewAccessibility _accessibilitySeriesTitle](v22, "_accessibilitySeriesTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithName:isContinuous:dataPoints:", v19, -[PKSpendingSummaryChartViewAccessibility _accessibilityIsContinuous](v22, "_accessibilityIsContinuous"), v8);

  return v20;
}

- (id)_accessibilitySeriesTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;

  -[PKSpendingSummaryChartViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_summary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("summaryType"));
  if (v5 == 2)
  {
    v6 = CFSTR("yearly.spending.summary");
  }
  else if (v5 == 1)
  {
    v6 = CFSTR("monthly.spending.summary");
  }
  else
  {
    if (v5)
    {
      -[PKSpendingSummaryChartViewAccessibility accessibilityLabel](self, "accessibilityLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    v6 = CFSTR("weekly.spending.summary");
  }
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  return v7;
}

- (id)_accessibilityXAxis
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  -[PKSpendingSummaryChartViewAccessibility _axStartDates](self, "_axStartDates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDB3D58]);
  accessibilityLocalizedString(CFSTR("graph.x.axis.description.time"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:categoryOrder:", v4, v2);

  return v5;
}

- (id)_accessibilityYAxis
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[PKSpendingSummaryChartViewAccessibility accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[PKSpendingSummaryChartViewAccessibility accessibilityElements](self, "accessibilityElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    v10 = 0.0;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "chartValue");
        if (v11 >= v14)
          v11 = v14;
        objc_msgSend(v13, "chartValue");
        if (v10 < v15)
          v10 = v15;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
    v11 = 0.0;
  }

  v16 = objc_alloc(MEMORY[0x24BDB3D88]);
  -[PKSpendingSummaryChartViewAccessibility _accessibilitySeriesTitle](self, "_accessibilitySeriesTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __62__PKSpendingSummaryChartViewAccessibility__accessibilityYAxis__block_invoke;
  v21[3] = &unk_2502E3EB8;
  v22 = v5;
  v18 = v5;
  v19 = (void *)objc_msgSend(v16, "initWithTitle:lowerBound:upperBound:gridlinePositions:valueDescriptionProvider:", v17, 0, v21, v11, v10);

  return v19;
}

id __62__PKSpendingSummaryChartViewAccessibility__accessibilityYAxis__block_invoke(uint64_t a1, double a2)
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

- (BOOL)_accessibilityIsContinuous
{
  return 0;
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

  -[PKSpendingSummaryChartViewAccessibility _axStartDates](self, "_axStartDates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSpendingSummaryChartViewAccessibility _accessibilitySeriesTitle](self, "_accessibilitySeriesTitle");
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
