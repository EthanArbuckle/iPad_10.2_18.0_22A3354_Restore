@implementation HKInteractiveChartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKInteractiveChartViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("HKGraphZoomLevelConfiguration"));
  objc_msgSend(v3, "validateClass:", CFSTR("HKAccessibilityData"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("HKGraphZoomLevelConfiguration"), CFSTR("timeScopeForDateRange:"), "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("_setDateSelectorToVisibleRange"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("_replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:"), "v", "q", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_accessibilityClearChildren"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKTimeScopeControl"), CFSTR("selectedTimeScope"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("primaryGraphViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKGraphViewController"), CFSTR("graphView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKInteractiveChartViewController"), CFSTR("_currentTimeView"), "HKCurrentTimeView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKInteractiveChartViewController"), CFSTR("_currentValueView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("accessibilityDataForChart"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityData"), CFSTR("accessibilitySpans"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilitySpan"), CFSTR("dataComprehensionMinYValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilitySpan"), CFSTR("dataComprehensionMaxYValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilitySpan"), CFSTR("dataComprehensionUnitForChart"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilitySpan"), CFSTR("dataSeriesType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityData"), CFSTR("accessibilityPointData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityPointData"), CFSTR("horizontalTimeCoordinate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityPointData"), CFSTR("values"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityPointData"), CFSTR("horizontalScreenCoordinate"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityValue"), CFSTR("valueTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityValue"), CFSTR("valueType"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityValue"), CFSTR("valueDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKAccessibilityValue"), CFSTR("valueAsNumber"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("_displayNameForDisplayType:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("_currentValueEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("lollipopController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("graphView:didUpdateSelectedPoint:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKInteractiveChartViewController"), CFSTR("graphViewDidEndSelection:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKDisplayType"), CFSTR("localization"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKDisplayTypeLocalization"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKLollipopController"), CFSTR("isVisible"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  -[HKInteractiveChartViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[HKInteractiveChartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDataForChart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryGraphViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("graphView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_axConfigureGraphViewInfoFromData:forGraphView:", v3, v5);
  objc_msgSend((id)objc_opt_class(), "_axConfigureGraphAccessibilityFromData:forGraphView:", v3, v5);

}

+ (void)_axConfigureGraphViewInfoFromData:(id)a3 forGraphView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  MEMORY[0x234910EA0](CFSTR("HKAccessibilityData"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "safeDictionaryForKey:", CFSTR("accessibilitySpans"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13), (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeValueForKey:", CFSTR("dataComprehensionMinYValue"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
        v17 = (void *)v16;
      else
        v17 = &unk_25022F810;
      objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v17, CFSTR("kAXGraphViewYAxisMin"), (_QWORD)v20);
      objc_msgSend(v15, "safeValueForKey:", CFSTR("dataComprehensionMaxYValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v18, CFSTR("kAXGraphViewYAxisMax"));

      objc_msgSend(v15, "safeStringForKey:", CFSTR("dataComprehensionUnitForChart"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_accessibilitySetRetainedValue:forKey:", v19, CFSTR("kAXGraphViewUnit"));

      objc_msgSend(v6, "_accessibilitySetIntegerValue:forKey:", objc_msgSend(v15, "safeIntegerForKey:", CFSTR("dataSeriesType")), CFSTR("kAXGraphViewDataSeriesType"));
    }

  }
}

+ (void)_axConfigureGraphAccessibilityFromData:(id)a3 forGraphView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id obj;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  MEMORY[0x234910EA0](CFSTR("HKAccessibilityData"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = a1;
    v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v40 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v36 = v6;
    objc_msgSend(v6, "safeArrayForKey:", CFSTR("accessibilityPointData"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (!v8)
      goto LABEL_26;
    v9 = v8;
    v10 = *(_QWORD *)v56;
    v37 = *(_QWORD *)v56;
    v38 = v7;
    while (1)
    {
      v11 = 0;
      v39 = v9;
      do
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v11);
        MEMORY[0x234910EA0](CFSTR("HKAccessibilityPointData"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", v7);
          objc_msgSend(v12, "safeStringForKey:", CFSTR("horizontalTimeCoordinate"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setAccessibilityLabel:");
          v46 = v12;
          objc_msgSend(v12, "safeArrayForKey:", CFSTR("values"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_opt_new();
          v48 = v13;
          v45 = v14;
          if (objc_msgSend(v14, "count"))
          {
            v44 = v11;
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v16 = v14;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v52;
              do
              {
                for (i = 0; i != v18; ++i)
                {
                  if (*(_QWORD *)v52 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                  objc_msgSend(v21, "safeStringForKey:", CFSTR("valueTitle"), v34);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v15, "containsObject:", v22) & 1) == 0)
                    objc_msgSend(v15, "addObject:", v22);
                  objc_msgSend(v21, "safeStringForKey:", CFSTR("valueType"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "axSafelyAddObject:", v23);

                  objc_msgSend(v21, "safeStringForKey:", CFSTR("valueDescription"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "axSafelyAddObject:", v24);

                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
              }
              while (v18);
            }

            MEMORY[0x234910EAC](v15);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lastObject");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "safeValueForKey:", CFSTR("valueAsNumber"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              objc_msgSend(v40, "addObject:", v27);
              v10 = v37;
              v7 = v38;
              v9 = v39;
              v11 = v44;
LABEL_23:

              objc_msgSend(v41, "addObject:", v47);
              objc_msgSend(v48, "setAccessibilityValue:", v25);
              objc_msgSend(v46, "safeCGFloatForKey:", CFSTR("horizontalScreenCoordinate"));
              v29 = v28 + -5.0;
              objc_msgSend(v7, "frame");
              v31 = v30;
              objc_msgSend(v7, "frame");
              objc_msgSend(v48, "setAccessibilityFrameInContainerSpace:", v29, v31, 10.0);
              objc_msgSend(v42, "addObject:", v48);

              goto LABEL_24;
            }
            v10 = v37;
            v7 = v38;
            v9 = v39;
            v11 = v44;
          }
          else
          {
            v25 = 0;
          }
          objc_msgSend(MEMORY[0x24BDBCEF8], "null", v34);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v27);
          goto LABEL_23;
        }
LABEL_24:
        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (!v9)
      {
LABEL_26:
        objc_msgSend(v7, "setAccessibilityElements:", v42, v34);
        v49 = v41;
        v50 = v40;
        objc_msgSend(v35, "_axTrimAndInterpolateValues:withXvalues:", &v50, &v49);
        v32 = v50;

        v33 = v49;
        objc_msgSend(v7, "_accessibilitySetRetainedValue:forKey:", v32, CFSTR("kAXGraphViewGraphElementsYValues"));
        objc_msgSend(v7, "_accessibilitySetRetainedValue:forKey:", v33, CFSTR("kAXGraphViewGraphElementsXValues"));

        v6 = v36;
        break;
      }
    }
  }

}

+ (void)_axTrimAndInterpolateValues:(id *)a3 withXvalues:(id *)a4
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  int v28;
  void *v29;
  unint64_t v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  uint64_t v45;
  int v46;

  if (a3)
  {
    if (a4)
    {
      if (objc_msgSend(*a3, "count"))
      {
        if (objc_msgSend(*a4, "count"))
        {
          v6 = objc_msgSend(*a3, "count");
          if (v6 == objc_msgSend(*a4, "count"))
          {
            v7 = 0x24BDBC000uLL;
            if (objc_msgSend(*a3, "count"))
            {
              v8 = 0;
              while (1)
              {
                objc_msgSend(*a3, "objectAtIndexedSubscript:", v8);
                v9 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v9, "isEqual:", v10);

                if (!v11)
                  break;
                if (objc_msgSend(*a3, "count") <= (unint64_t)++v8)
                  goto LABEL_12;
              }
              if (!(_DWORD)v8)
                goto LABEL_13;
LABEL_12:
              objc_msgSend(*a3, "removeObjectsInRange:", 0, v8);
              objc_msgSend(*a4, "removeObjectsInRange:", 0, v8);
            }
LABEL_13:
            if (objc_msgSend(*a3, "count"))
            {
              v12 = objc_msgSend(*a3, "count");
              v13 = v12 - 1;
              if (v12 >= 1)
              {
                v14 = (v12 - 1);
                while (1)
                {
                  objc_msgSend(*a3, "objectAtIndexedSubscript:", v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = objc_msgSend(v15, "isEqual:", v16);

                  if (!v17)
                    break;
                  if (v14-- <= 0)
                  {
                    LODWORD(v14) = -1;
                    break;
                  }
                }
                v19 = v13 - v14;
                if (v13 > (int)v14)
                {
                  v20 = v19;
                  objc_msgSend(*a3, "removeObjectsInRange:", (int)v14 + 1, v19);
                  objc_msgSend(*a4, "removeObjectsInRange:", (int)v14 + 1, v20);
                }
              }
              if ((unint64_t)objc_msgSend(*a3, "count") >= 3)
              {
                v46 = objc_msgSend(*a3, "count");
                if (v46 >= 1)
                {
                  v21 = 0;
                  do
                  {
                    v22 = v21 << 32;
                    v23 = (int)v21;
                    while (1)
                    {
                      objc_msgSend(*a3, "objectAtIndexedSubscript:", v23);
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(v7 + 3832), "null");
                      v25 = (void *)objc_claimAutoreleasedReturnValue();
                      v26 = objc_msgSend(v24, "isEqual:", v25);

                      if ((v26 & 1) != 0)
                        break;
                      ++v23;
                      v22 += 0x100000000;
                      if (v23 >= v46)
                        return;
                    }
                    if ((int)v23 >= v46)
                      break;
                    v27 = 0;
                    v21 = v22 >> 32;
                    v28 = 1;
                    v45 = v22 >> 32;
                    while (1)
                    {
                      objc_msgSend(*a3, "objectAtIndexedSubscript:", v21);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = v7;
                      objc_msgSend(*(id *)(v7 + 3832), "null");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      v32 = objc_msgSend(v29, "isEqual:", v31);

                      if (!v32)
                        break;
                      ++v21;
                      ++v28;
                      ++v27;
                      v7 = v30;
                      if (v46 == v21)
                        return;
                    }
                    objc_msgSend(*a3, "objectAtIndexedSubscript:", (int)v23 - 1);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "doubleValue");
                    v35 = v34;

                    objc_msgSend(*a3, "objectAtIndexedSubscript:", v21);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "doubleValue");
                    v38 = v37;

                    v39 = v45;
                    if ((int)v23 < (int)v21)
                    {
                      v40 = (v38 - v35) / (double)v28;
                      do
                      {
                        v41 = (void *)MEMORY[0x24BDD16E0];
                        objc_msgSend(*a3, "objectAtIndexedSubscript:", v39 - 1);
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v42, "doubleValue");
                        objc_msgSend(v41, "numberWithDouble:", v40 + v43);
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*a3, "setObject:atIndexedSubscript:", v44, v39);

                        ++v39;
                        --v27;
                      }
                      while (v27);
                    }
                    v7 = v30;
                  }
                  while ((int)v21 < v46);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)_setDateSelectorToVisibleRange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  -[HKInteractiveChartViewControllerAccessibility _setDateSelectorToVisibleRange](&v3, sel__setDateSelectorToVisibleRange);
  -[HKInteractiveChartViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_replacePrimaryGraphViewControllerWithTimeScope:(int64_t)a3 anchorDate:(id)a4 animated:(BOOL)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  -[HKInteractiveChartViewControllerAccessibility _replacePrimaryGraphViewControllerWithTimeScope:anchorDate:animated:](&v5, sel__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated_, a3, a4);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __117__HKInteractiveChartViewControllerAccessibility__replacePrimaryGraphViewControllerWithTimeScope_anchorDate_animated___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "_accessibilityClearChildren");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

- (id)_displayNameForDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  v4 = a3;
  -[HKInteractiveChartViewControllerAccessibility _displayNameForDisplayType:](&v10, sel__displayNameForDisplayType_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("localization.displayName"), v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryGraphViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeUIViewForKey:", CFSTR("graphView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("kAXGraphViewDisplayName"));
  return v5;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  int v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  -[HKInteractiveChartViewControllerAccessibility graphView:didUpdateSelectedPoint:](&v10, sel_graphView_didUpdateSelectedPoint_, a3, a4);
  v5 = -[HKInteractiveChartViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_currentValueEnabled"));
  -[HKInteractiveChartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("lollipopController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("isVisible"));

  if (v5)
    v8 = CFSTR("_currentValueView");
  else
    v8 = CFSTR("_currentTimeView");
  -[HKInteractiveChartViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityElementsHidden:", v7);

}

- (void)graphViewDidEndSelection:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartViewControllerAccessibility;
  -[HKInteractiveChartViewControllerAccessibility graphViewDidEndSelection:](&v5, sel_graphViewDidEndSelection_, a3);
  -[HKInteractiveChartViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_currentValueView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElementsHidden:", 0);

}

@end
