@implementation STUsageGraphViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUsageGraphViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageGraphViewController"), CFSTR("weeklyAverageLine"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUsageGraphViewController"), CFSTR("_titleView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageGraphViewController"), CFSTR("barViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageGraphViewController"), CFSTR("dataSet"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STBarView"), CFSTR("dataPoint"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageItem"), CFSTR("totalUsage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageItem"), CFSTR("itemType"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReportGraphDataPoint"), CFSTR("total"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReportGraphDataSet"), CFSTR("itemType"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReportGraphDataSet"), CFSTR("total"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUsageReportGraphDataPoint"), CFSTR("date"), "@", 0);

}

- (unint64_t)_axDataSetItemType
{
  void *v2;
  unint64_t v3;

  -[STUsageGraphViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSet"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("itemType"));

  return v3;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  AXSTGraphContainerElement *v5;
  AXSTGraphContainerElement *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id from;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  -[STUsageGraphViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("container"));
  v5 = (AXSTGraphContainerElement *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_initWeak(&location, self);
    v6 = [AXSTGraphContainerElement alloc];
    -[STUsageGraphViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXSTGraphContainerElement initWithAccessibilityContainer:](v6, "initWithAccessibilityContainer:", v7);

    -[AXSTGraphContainerElement setMode:](v5, "setMode:", 0);
    -[STUsageGraphViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v5, CFSTR("container"));
    -[AXSTGraphContainerElement setShouldGroupAccessibilityChildren:](v5, "setShouldGroupAccessibilityChildren:", 1);
    objc_initWeak(&from, v5);
    v8 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke;
    v32[3] = &unk_250336398;
    objc_copyWeak(&v33, &from);
    -[AXSTGraphContainerElement _setAccessibilityFrameBlock:](v5, "_setAccessibilityFrameBlock:", v32);
    -[AXSTGraphContainerElement setIsAccessibilityElement:](v5, "setIsAccessibilityElement:", 0);
    accessibilityLocalizedString(CFSTR("weekly.summary.chart"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSTGraphContainerElement setAccessibilityLabel:](v5, "setAccessibilityLabel:", v9);

    -[AXSTGraphContainerElement setItemType:](v5, "setItemType:", -[STUsageGraphViewControllerAccessibility _axDataSetItemType](self, "_axDataSetItemType"));
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_2;
    v29[3] = &unk_2503363E0;
    objc_copyWeak(&v30, &location);
    objc_copyWeak(&v31, &from);
    -[AXSTGraphContainerElement _setAccessibilityElementsBlock:](v5, "_setAccessibilityElementsBlock:", v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v3, "addObject:", v5);
  -[STUsageGraphViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("weeklyAverageLine"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && (objc_msgSend(v10, "isHidden") & 1) == 0)
  {
    -[STUsageGraphViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSet"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "safeUnsignedIntegerForKey:", CFSTR("itemType"));
    LOBYTE(location) = 0;
    objc_opt_class();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("total"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)location)
      abort();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    v18 = v17 / 7.0;
    if (v13 == 5)
    {
      v19 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("per.day.interpolation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = CFSTR("notifications.count.format");
    }
    else
    {
      if (v13 != 6)
      {
        v26 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("per.day.interpolation"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x23491C5C8](v18 < 60.0, v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", v20, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v19 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("per.day.interpolation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = CFSTR("pickups.count.format");
    }
    accessibilityLocalizedString(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v23, (int)v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    objc_msgSend(v11, "setIsAccessibilityElement:", 1);
    objc_msgSend(v11, "setAccessibilityTraits:", objc_msgSend(v11, "accessibilityTraits") & ~*MEMORY[0x24BDF73C8]);
    accessibilityLocalizedString(CFSTR("weekly.average.line.label"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityLabel:", v27);

    objc_msgSend(v11, "setAccessibilityValue:", v25);
    objc_msgSend(v3, "addObject:", v11);

  }
  return v3;
}

double __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityChildrenUnionContentFrame");
  v3 = v2;

  return v3;
}

id __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeArrayForKey:", CFSTR("barViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  objc_msgSend(v3, "axFilterObjectsUsingBlock:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_4;
  v7[3] = &unk_250336330;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
  objc_destroyWeak(&v8);
  return v5;
}

BOOL __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  v2 = a2;
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("dataPoint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("total"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6 > 0.0;

  return v7;
}

void __64__STUsageGraphViewControllerAccessibility_accessibilityElements__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "setAccessibilityContainer:", WeakRetained);

}

@end
