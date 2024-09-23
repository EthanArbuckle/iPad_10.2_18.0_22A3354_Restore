@implementation _CNAutocompleteAggdProbeProvider

- (id)usageMonitorProbe
{
  return objc_alloc_init(CNAutocompleteCoreAnalyticsUsageMonitorProbe);
}

- (id)performanceProbe
{
  return objc_alloc_init(CNAutocompleteAggdPerformanceProbe);
}

- (id)suggestionsProbe
{
  return objc_alloc_init(CNAutocompleteSuggestionsProbe);
}

@end
