@implementation STUsageReportAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUsageReport");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("screenTimeDataSet"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("_countedDataSetForItemType:trustIdentifier:includeIndicatorImageName:"), "@", "Q", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("_timedDataSetForItemType:useDarkColors:"), "@", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("_timedDataSetForItemType:trustIdentifier:"), "@", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:"), "@", "Q", "Q", "B", "^@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("type"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReportGraphDataSet"), CFSTR("dataPoints"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReportGraphDataPoint"), CFSTR("date"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReportGraphDataPoint"), CFSTR("segments"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("applicationUsageByStartOfDateIntervalByTrustIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("webUsageByStartOfDateIntervalByTrustIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("categoryUsageByStartOfDateIntervalByTrustIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReport"), CFSTR("screenTimeByStartOfDateInterval"), "@", 0);

}

- (id)_accessibilityStringForDate:(id)a3 timePeriod:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (v5)
  {
    switch(a4)
    {
      case 0uLL:
        AXClockTimeStringForDate();
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      case 2uLL:
        v8 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("week.of"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        AXDateStringForFormat();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringWithFormat:", v9, v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      case 1uLL:
        AXDateStringForFormat();
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v7 = (void *)v6;
        goto LABEL_10;
    }
  }
  v7 = 0;
LABEL_10:

  return v7;
}

- (unint64_t)_axTimePeriodForDescription
{
  return -[STUsageReportAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("type")) == 0;
}

- (id)screenTimeDataSet
{
  STUsageReportAccessibility *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  STUsageReportAccessibility *v17;
  void *v18;
  id v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v2 = self;
  v30 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)STUsageReportAccessibility;
  -[STUsageReportAccessibility screenTimeDataSet](&v28, sel_screenTimeDataSet);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STUsageReportAccessibility _axTimePeriodForDescription](v2, "_axTimePeriodForDescription");
  -[STUsageReportAccessibility safeDictionaryForKey:](v2, "safeDictionaryForKey:", CFSTR("screenTimeByStartOfDateInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = v3;
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("dataPoints"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v23)
  {
    v6 = *(_QWORD *)v25;
    v21 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "safeValueForKey:", CFSTR("date"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUsageReportAccessibility _accessibilityStringForDate:timePeriod:](v2, "_accessibilityStringForDate:timePeriod:", v9, v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "doubleValue");
        if (v13 > 0.0)
        {
          MEMORY[0x23491C5C8](v13 < 60.0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          __AXStringForVariables();
          v15 = v4;
          v16 = v5;
          v17 = v2;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAccessibilityLabel:", v18, v14, CFSTR("__AXStringForVariablesSentinel"));

          v2 = v17;
          v5 = v16;
          v4 = v15;
          v6 = v21;

        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v23);
  }

  return v20;
}

- (id)_timedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  unint64_t v19;
  STUsageReportAccessibility *v20;
  void *v21;
  id v23;
  id v24;
  uint64_t v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v33.receiver = self;
  v33.super_class = (Class)STUsageReportAccessibility;
  -[STUsageReportAccessibility _timedDataSetForItemType:trustIdentifier:](&v33, sel__timedDataSetForItemType_trustIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[STUsageReportAccessibility _axTimePeriodForDescription](self, "_axTimePeriodForDescription");
  if (a3 - 2 > 2)
  {
    v25 = 0;
  }
  else
  {
    -[STUsageReportAccessibility safeValueForKey:](self, "safeValueForKey:", *(&off_250336450 + a3 - 2));
    v25 = objc_claimAutoreleasedReturnValue();
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = v7;
  objc_msgSend(v7, "safeArrayForKey:", CFSTR("dataPoints"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v25;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v30;
    v24 = v6;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "safeValueForKey:", CFSTR("date"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUsageReportAccessibility _accessibilityStringForDate:timePeriod:](self, "_accessibilityStringForDate:timePeriod:", v12, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "safeValueForKey:", CFSTR("totalUsage"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        if (v17 > 0.0)
        {
          MEMORY[0x23491C5C8](v17 < 60.0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          __AXStringForVariables();
          v19 = v8;
          v20 = self;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setAccessibilityLabel:", v21, v18, CFSTR("__AXStringForVariablesSentinel"));

          self = v20;
          v8 = v19;
          v9 = (void *)v25;

          v6 = v24;
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v28);
  }

  return v23;
}

- (id)_timedDataSetForItemType:(unint64_t)a3 useDarkColors:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  unint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  id obj;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  id v40;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t);
  void *v60;
  STUsageReportAccessibility *v61;
  uint64_t *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  objc_super v70;
  _BYTE v71[128];
  void *v72;
  void *v73;
  _QWORD v74[2];
  _QWORD v75[4];

  v75[2] = *MEMORY[0x24BDAC8D0];
  v70.receiver = self;
  v70.super_class = (Class)STUsageReportAccessibility;
  -[STUsageReportAccessibility _timedDataSetForItemType:useDarkColors:](&v70, sel__timedDataSetForItemType_useDarkColors_, a3, a4);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v38 = -[STUsageReportAccessibility _axTimePeriodForDescription](self, "_axTimePeriodForDescription");
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy_;
  v68 = __Block_byref_object_dispose_;
  v69 = 0;
  v57 = MEMORY[0x24BDAC760];
  v58 = 3221225472;
  v59 = __69__STUsageReportAccessibility__timedDataSetForItemType_useDarkColors___block_invoke;
  v60 = &unk_250336408;
  v62 = &v64;
  v63 = a3;
  v61 = self;
  AXPerformSafeBlock();
  v40 = (id)v65[5];
  _Block_object_dispose(&v64, 8);

  switch(a3)
  {
    case 2uLL:
      goto LABEL_4;
    case 3uLL:
      v72 = &unk_25033A910;
      -[STUsageReportAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("categoryUsageByStartOfDateIntervalByTrustIdentifier"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
        v6 = (void *)objc_opt_new();
      v73 = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        goto LABEL_16;
LABEL_15:

LABEL_16:
      goto LABEL_18;
    case 4uLL:
LABEL_4:
      v74[0] = &unk_25033A8E0;
      -[STUsageReportAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("applicationUsageByStartOfDateIntervalByTrustIdentifier"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (!v5)
        v6 = (void *)objc_opt_new();
      v74[1] = &unk_25033A8F8;
      v75[0] = v6;
      -[STUsageReportAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("webUsageByStartOfDateIntervalByTrustIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v7)
        v8 = (void *)objc_opt_new();
      v75[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)

      if (v5)
        goto LABEL_16;
      goto LABEL_15;
  }
  v39 = 0;
LABEL_18:
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v35, "safeArrayForKey:", CFSTR("dataPoints"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
  if (v42)
  {
    v37 = *(_QWORD *)v54;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v54 != v37)
        {
          v10 = v9;
          objc_enumerationMutation(obj);
          v9 = v10;
        }
        v44 = v9;
        v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v9);
        objc_msgSend(v11, "safeArrayForKey:", CFSTR("segments"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safeValueForKey:", CFSTR("date"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUsageReportAccessibility _accessibilityStringForDate:timePeriod:](self, "_accessibilityStringForDate:timePeriod:", v13, v38);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v12, "mutableCopy");
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __69__STUsageReportAccessibility__timedDataSetForItemType_useDarkColors___block_invoke_234;
        v46[3] = &unk_250336430;
        v47 = v39;
        v43 = v13;
        v48 = v43;
        v17 = v14;
        v49 = v17;
        v18 = v16;
        v50 = v18;
        v19 = v12;
        v51 = v19;
        v20 = v15;
        v52 = v20;
        objc_msgSend(v40, "enumerateObjectsUsingBlock:", v46);
        accessibilityLabelForUsageItemsOverridingUsages(v18, v17, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "count") || !objc_msgSend(v20, "count"))
          goto LABEL_30;
        v22 = 0;
        v23 = 0.0;
        do
        {
          LOBYTE(v64) = 0;
          objc_opt_class();
          objc_msgSend(v19, "objectAtIndexedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "safeValueForKey:", CFSTR("amount"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if ((_BYTE)v64)
            abort();
          objc_msgSend(v26, "doubleValue");
          v28 = v27;

          v23 = v23 + v28;
          ++v22;
        }
        while (v22 < objc_msgSend(v20, "count"));
        if (v23 > 0.0)
        {
          MEMORY[0x23491C5C8](v23 < 60.0, v23);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x24BDD17C8];
          accessibilityLocalizedString(CFSTR("other.usage.format"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", v31, v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
LABEL_30:
          v32 = 0;
        }
        __AXStringForVariables();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAccessibilityLabel:", v33, v21, v32, CFSTR("__AXStringForVariablesSentinel"));

        v9 = v44 + 1;
      }
      while (v44 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
    }
    while (v42);
  }

  return v35;
}

void __69__STUsageReportAccessibility__timedDataSetForItemType_useDarkColors___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 3, *(_QWORD *)(a1 + 48), 0, 0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__STUsageReportAccessibility__timedDataSetForItemType_useDarkColors___block_invoke_234(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "safeIntegerForKey:", CFSTR("itemType")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("trustIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("totalUsage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  if (v10 > 0.0)
  {
    v18 = v5;
    v19 = v4;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = *(id *)(a1 + 64);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "safeValueForKey:", CFSTR("amount"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v9);

          if (v17)
          {
            objc_msgSend(*(id *)(a1 + 72), "removeObject:", *(_QWORD *)(a1 + 64));
            goto LABEL_12;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_12:

    v5 = v18;
    v4 = v19;
  }

}

- (id)_countedDataSetForItemType:(unint64_t)a3 trustIdentifier:(id)a4 includeIndicatorImageName:(BOOL)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id v25;
  id obj;
  unint64_t v28;
  STUsageReportAccessibility *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)STUsageReportAccessibility;
  v25 = a4;
  -[STUsageReportAccessibility _countedDataSetForItemType:trustIdentifier:includeIndicatorImageName:](&v34, sel__countedDataSetForItemType_trustIdentifier_includeIndicatorImageName_, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  v28 = -[STUsageReportAccessibility _axTimePeriodForDescription](self, "_axTimePeriodForDescription");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = v6;
  objc_msgSend(v6, "safeArrayForKey:", CFSTR("dataPoints"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "safeValueForKey:", CFSTR("date"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[STUsageReportAccessibility _accessibilityStringForDate:timePeriod:](v29, "_accessibilityStringForDate:timePeriod:", v12, v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safeArrayForKey:", CFSTR("segments"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        objc_msgSend(v15, "safeValueForKey:", CFSTR("amount"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
LABEL_10:
          v20 = 0;
          goto LABEL_13;
        }
        if (a3 == 6)
        {
          v18 = (void *)MEMORY[0x24BDD17C8];
          v19 = CFSTR("pickups.count.format");
        }
        else
        {
          if (a3 != 5)
            goto LABEL_10;
          v18 = (void *)MEMORY[0x24BDD17C8];
          v19 = CFSTR("notifications.count.format");
        }
        accessibilityLocalizedString(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", v21, objc_msgSend(v17, "unsignedIntegerValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
        __AXStringForVariables();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAccessibilityLabel:", v22, v20, CFSTR("__AXStringForVariablesSentinel"));

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  return v24;
}

@end
