@implementation HKSleepComparisonContext

HKInteractiveChartSinglePointEventIdentifierData *__151___HKSleepComparisonContext__generateSleepDistributionDisplayTypeForStackedSampleType_currentCalendarOverride_overlayChartController_applicationItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKInteractiveChartSinglePointEventIdentifierData *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  if ((*(_BYTE *)(a1 + 32) & 2) != 0)
  {
    v9 = a3;
    v10 = a2;
    v6 = objc_alloc_init(HKInteractiveChartSinglePointEventIdentifierData);
    objc_msgSend(v10, "minimumValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValueForUnit:", v9);
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    objc_msgSend(v10, "maximumValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v9);
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

    -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v9);
    -[HKInteractiveChartSinglePointData setRepresentsRange:](v6, "setRepresentsRange:", 1);
    objc_msgSend(v10, "contextIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKInteractiveChartSinglePointEventIdentifierData setIdentifiers:](v6, "setIdentifiers:", v13);
  }
  else
  {
    v4 = a3;
    v5 = a2;
    v6 = objc_alloc_init(HKInteractiveChartSinglePointData);
    objc_msgSend(v5, "minimumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValueForUnit:", v4);
    -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

    objc_msgSend(v5, "maximumValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "doubleValueForUnit:", v4);
    -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

    -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v4);
    -[HKInteractiveChartSinglePointData setRepresentsRange:](v6, "setRepresentsRange:", 1);
  }
  return v6;
}

id __144___HKSleepComparisonContext__defaultStackedInteractiveChartDisplayTypeForSampleType_overlayChartController_applicationItems_formatterTimeScope___block_invoke(_QWORD *a1, uint64_t a2)
{
  return +[HKOverlayRoomStackedContext generateCustomSeriesWithTemplateDisplayType:sampleType:applicationItems:currentTimeScope:](HKOverlayRoomStackedContext, "generateCustomSeriesWithTemplateDisplayType:sampleType:applicationItems:currentTimeScope:", a1[4], a1[5], a1[6], a2);
}

@end
