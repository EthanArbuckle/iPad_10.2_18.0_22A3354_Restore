@implementation _HKBloodGlucosePercentInRangeContext

- (_HKBloodGlucosePercentInRangeContext)initWithBaseDisplayType:(id)a3 classification:(int64_t)a4 overlayChartController:(id)a5 unitController:(id)a6 displayTypeController:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _HKBloodGlucosePercentInRangeContext *v17;
  _HKBloodGlucosePercentInRangeContext *v18;
  HKDisplayTypeContextItem *lastUpdatedItem;
  void *v20;
  uint64_t v21;
  NSNumberFormatter *percentageFormatter;
  objc_super v24;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)_HKBloodGlucosePercentInRangeContext;
  v17 = -[_HKBloodGlucosePercentInRangeContext init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_baseDisplayType, a3);
    v18->_classification = a4;
    objc_storeStrong((id *)&v18->_overlayChartController, a5);
    objc_storeStrong((id *)&v18->_unitController, a6);
    objc_storeStrong((id *)&v18->_displayTypeController, a7);
    lastUpdatedItem = v18->_lastUpdatedItem;
    v18->_lastUpdatedItem = 0;

    objc_msgSend(MEMORY[0x1E0CB37F0], "hk_percentDecimalNumberFormatter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    percentageFormatter = v18->_percentageFormatter;
    v18->_percentageFormatter = (NSNumberFormatter *)v21;

    -[_HKBloodGlucosePercentInRangeContext _updateContextItemFromChartPoints:](v18, "_updateContextItemFromChartPoints:", MEMORY[0x1E0C9AA60]);
  }

  return v18;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  return self->_baseDisplayType;
}

- (id)contextItemForLastUpdate
{
  return self->_lastUpdatedItem;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (id)sampleTypeForDateRangeUpdates
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A98]);
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v11;
  HKInteractiveChartOverlayViewController *overlayChartController;
  HKInteractiveChartDisplayType *baseDisplayType;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v11 = a7;
  overlayChartController = self->_overlayChartController;
  baseDisplayType = self->_baseDisplayType;
  v14 = a3;
  -[HKInteractiveChartDisplayType graphSeriesForTimeScope:](baseDisplayType, "graphSeriesForTimeScope:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __123___HKBloodGlucosePercentInRangeContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v19[3] = &unk_1E9C40570;
  v19[4] = self;
  v20 = v11;
  v18 = v11;
  -[HKInteractiveChartOverlayViewController cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:](overlayChartController, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v15, a5, a6, v16, v17, v19);

}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (void)_updateContextItemFromChartPoints:(id)a3
{
  id v4;
  HKDisplayTypeContextItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HKUnitPreferenceController *unitController;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HKDisplayTypeContextItem *lastUpdatedItem;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init(HKDisplayTypeContextItem);
  -[_HKBloodGlucosePercentInRangeContext _buildTitleString](self, "_buildTitleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v5, "setTitle:", v6);

  -[_HKBloodGlucosePercentInRangeContext _buildAccessibilityIdentifier](self, "_buildAccessibilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v7);

  -[_HKBloodGlucosePercentInRangeContext _fractionRangeFromChartPoints:](self, "_fractionRangeFromChartPoints:", v4);
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[_HKBloodGlucosePercentInRangeContext _stringFromFractionRange:](self, "_stringFromFractionRange:", v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  unitController = self->_unitController;
  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController localizedDisplayNameForUnit:value:](unitController, "localizedDisplayNameForUnit:value:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PERCENTAGE_QUANTITY_TYPE_DISPLAY_FORMAT %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", v15, v8, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setValue:](v5, "setValue:", v16);

  -[HKDisplayTypeContextItem setUnit:](v5, "setUnit:", v12);
  -[HKDisplayTypeContextItem setIsUnitIncludedInValue:](v5, "setIsUnitIncludedInValue:", 1);
  -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v5, "setUseTightSpacingBetweenValueAndUnit:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v5, "setMetricColors:", v18);

  +[HKUIMetricColors vitalsColors](HKUIMetricColors, "vitalsColors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v5, "setSelectedMetricColors:", v19);

  lastUpdatedItem = self->_lastUpdatedItem;
  self->_lastUpdatedItem = v5;

}

- (id)_buildTitleString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  -[HKDisplayTypeController displayTypeWithIdentifier:](self->_displayTypeController, "displayTypeWithIdentifier:", &unk_1E9CEAFA0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController unitForDisplayType:](self->_unitController, "unitForDisplayType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController localizedDisplayNameForDisplayType:](self->_unitController, "localizedDisplayNameForDisplayType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(self->_classification)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB6A38], "ATTDLevel2HypoglycemicRangeWithUnit:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "maximum");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB6A38], "ATTDEuglycemicRangeWithUnit:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minimum");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v9 = v7;
      objc_msgSend(v7, "doubleValueForUnit:", v4);
      v11 = v10;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HKFormattedStringFromValue(v12, v3, self->_unitController, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("GLUCOSE_OVERLAY_PERCENT_BELOW_RANGE");
      goto LABEL_8;
    case 2:
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("GLUCOSE_OVERLAY_PERCENT_IN_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB6A38], "ATTDEuglycemicRangeWithUnit:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "maximum");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValueForUnit:", v4);
      v21 = v20;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HKFormattedStringFromValue(v22, v3, self->_unitController, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("GLUCOSE_OVERLAY_PERCENT_ABOVE_RANGE");
LABEL_8:
      objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      HKFormatValueAndUnit(v13, v5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v23, v24);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)_buildAccessibilityIdentifier
{
  unint64_t classification;
  const __CFString *v3;

  classification = self->_classification;
  if (classification > 3)
    v3 = CFSTR("UnknownBloodGlucoseLevel");
  else
    v3 = off_1E9C405D8[classification];
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", v3);
}

- (id)_stringFromFractionRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "minValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKBloodGlucosePercentInRangeContext _stringFromFractionRangeBound:](self, "_stringFromFractionRangeBound:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "maxValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HKBloodGlucosePercentInRangeContext _stringFromFractionRangeBound:](self, "_stringFromFractionRangeBound:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", v8))
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OVERLAY_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v11, v6, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_stringFromFractionRangeBound:(id)a3
{
  id v4;
  double v5;
  double v6;
  _BOOL8 v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "doubleValue");
  v7 = 0;
  if (v5 > 0.0)
  {
    objc_msgSend(v4, "doubleValue");
    if (v6 < 0.01)
      v7 = 1;
  }
  -[NSNumberFormatter setMaximumFractionDigits:](self->_percentageFormatter, "setMaximumFractionDigits:", v7);
  -[NSNumberFormatter stringFromNumber:](self->_percentageFormatter, "stringFromNumber:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_fractionRangeFromChartPoints:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v6)
    {
      v17 = 0;
      goto LABEL_20;
    }
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = 2.22507386e-308;
    v10 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v12, "userInfo", (_QWORD)v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v12, "userInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HKBloodGlucosePercentInRangeContext _fractionForClassificationFromUserInfo:](self, "_fractionForClassificationFromUserInfo:", v15);
          if (v16 < v10)
            v10 = v16;
          if (v16 > v9)
            v9 = v16;

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);

    v17 = 0;
    if (v10 != 1.79769313e308 && v9 != 2.22507386e-308)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v5, v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (double)_fractionForClassificationFromUserInfo:(id)a3
{
  double v3;
  id v5;
  void *v6;
  int64_t classification;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = a3;
  v6 = v5;
  classification = self->_classification;
  if ((unint64_t)(classification - 2) < 2 || classification == 0)
  {
    objc_msgSend(v5, "fractionForClassification:");
    v3 = v9;
  }
  else if (classification == 1)
  {
    objc_msgSend(v5, "fractionForClassification:");
    v11 = v10;
    objc_msgSend(v6, "fractionForClassification:", 0);
    v3 = v11 + v12;
  }

  return v3;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, a3);
}

- (HKInteractiveChartDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (int64_t)classification
{
  return self->_classification;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
}

@end
