@implementation StocksAssistantChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("StocksAssistantChartView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("StocksAssistantChartView"), CFSTR("_graph"), "StockGraphView");
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("stocks.graph.chart"));
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[StocksAssistantChartViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_graph"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
