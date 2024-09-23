@implementation StockGraphViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StockGraphView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("StockGraphView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("StockGraphView"), CFSTR("_chartData"), "StockChartData");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StockGraphView"), CFSTR("clearData"), "v", 0);

}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)StockGraphViewAccessibility;
  -[StockGraphViewAccessibility accessibilityFrame](&v8, sel_accessibilityFrame);
  v5 = v4 + 20.0;
  v7 = v6 + -40.0;
  result.size.height = v3;
  result.size.width = v7;
  result.origin.y = v2;
  result.origin.x = v5;
  return result;
}

- (void)clearData
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StockGraphViewAccessibility;
  -[StockGraphViewAccessibility clearData](&v3, sel_clearData);
  -[StockGraphViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
}

- (void)dealloc
{
  objc_super v3;

  -[StockGraphViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
  v3.receiver = self;
  v3.super_class = (Class)StockGraphViewAccessibility;
  -[StockGraphViewAccessibility dealloc](&v3, sel_dealloc);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityElementCount
{
  void *v3;
  float v4;
  float v5;
  void *v7;
  int64_t v8;

  -[StockGraphViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("alpha"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  if (v5 == 0.0)
    return 0;
  -[StockGraphViewAccessibility _accessibilityChildren](self, "_accessibilityChildren");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)_accessibilityChildren
{
  -[StockGraphViewAccessibility bounds](self, "bounds");
  return -[StockGraphViewAccessibility _accessibilityChildrenWithmaxChildrenCount:frame:](self, "_accessibilityChildrenWithmaxChildrenCount:frame:", 10);
}

- (id)_accessibilityNanoChildren
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  -[StockGraphViewAccessibility bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[StockGraphViewAccessibility superview](self, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  v11 = v10;

  return -[StockGraphViewAccessibility _accessibilityChildrenWithmaxChildrenCount:frame:](self, "_accessibilityChildrenWithmaxChildrenCount:frame:", 5, v4, v6, v8, v11);
}

- (id)_accessibilityChildrenWithmaxChildrenCount:(int)a3 frame:(CGRect)a4
{
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;

  v6 = (_QWORD *)MEMORY[0x24BEBB308];
  -[StockGraphViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[StockGraphViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_chartData"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v7 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
      -[StockGraphViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v7, *v6);
      v10 = objc_msgSend(v9, "stockValues");
      objc_msgSend(v9, "safeValueForKey:", CFSTR("stockValueCount"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      -[StockGraphViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("StockChartView")));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v13;
      if (v13)
        v31 = objc_msgSend(v13, "safeIntegerForKey:", CFSTR("_selectedInterval"));
      else
        v31 = 0;
      v30 = v9;
      objc_msgSend(v9, "safeValueForKey:", CFSTR("marketTimeZone"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = a3;
      if (v12 < a3)
        v15 = v12;
      v32 = v15;
      v33 = (void *)v14;
      v16 = v15 < 1;
      v17 = v15 - 1;
      if (!v16)
      {
        v18 = 0;
        v19 = (v12 - 1) / v17;
        do
        {
          v20 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
          v21 = (void *)MEMORY[0x24BDBCE60];
          v22 = *(double *)(v10 + 24 * v19 * v18);
          v23 = v33;
          objc_msgSend(v21, "dateWithTimeIntervalSince1970:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), "init");
          objc_msgSend(v25, "setTimeZone:", v23);

          if (v31)
            objc_msgSend(v25, "setDateStyle:", 3);
          else
            objc_msgSend(v25, "setTimeStyle:", 1);
          objc_msgSend(v25, "stringFromDate:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %.02f"), v26, *(_QWORD *)(v10 + 24 * v19 * v18 + 8));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "setAccessibilityLabel:", v27);
          UIAccessibilityFrameForBounds();
          objc_msgSend(v20, "setAccessibilityFrame:");
          if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityApplicationIsRTL"))
            objc_msgSend(v7, "insertObject:atIndex:", v20, 0);
          else
            objc_msgSend(v7, "addObject:", v20);

          ++v18;
        }
        while (v32 != v18);
      }

    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[StockGraphViewAccessibility _accessibilityChildren](self, "_accessibilityChildren");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[StockGraphViewAccessibility _accessibilityChildren](self, "_accessibilityChildren");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") >= (unint64_t)a3)
  {
    objc_msgSend(v4, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
