@implementation _HKCardioFitnessOverlayContext

- (_HKCardioFitnessOverlayContext)initWithMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v8;
  _HKCardioFitnessOverlayContext *v9;
  _HKCardioFitnessOverlayContext *v10;
  uint64_t v11;
  HKSampleType *monitoringSampleType;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_HKCardioFitnessOverlayContext;
  v9 = -[_HKCardioFitnessOverlayContext init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_mode = a3;
    objc_storeStrong((id *)&v9->_overlayChartController, a5);
    objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", 124);
    v11 = objc_claimAutoreleasedReturnValue();
    monitoringSampleType = v10->_monitoringSampleType;
    v10->_monitoringSampleType = (HKSampleType *)v11;

  }
  return v10;
}

- (id)contextItemForLastUpdate
{
  void *v3;
  void *v4;

  -[_HKCardioFitnessOverlayContext lastUpdatedItem](self, "lastUpdatedItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_HKCardioFitnessOverlayContext _cardioFitnessContextItemWithLevel:sampleCount:](self, "_cardioFitnessContextItemWithLevel:sampleCount:", -1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKCardioFitnessOverlayContext setLastUpdatedItem:](self, "setLastUpdatedItem:", v4);

  }
  return -[_HKCardioFitnessOverlayContext lastUpdatedItem](self, "lastUpdatedItem");
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return 0;
}

- (id)baseDisplayTypeForOverlay:(int64_t)a3
{
  return 0;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomCardioFitnessViewController.m"), 540, CFSTR("subclass must implement this"));

}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 chartPointCount:(id)a4 forTimeScope:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[HKGraphZoomLevelConfiguration seriesPointIntervalUnitForTimeScope:pointCount:](HKGraphZoomLevelConfiguration, "seriesPointIntervalUnitForTimeScope:pointCount:", a5, objc_msgSend(v8, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKCardioFitnessOverlayContext _cardioFitnessContextItemWithLevel:count:unitString:](self, "_cardioFitnessContextItemWithLevel:count:unitString:", a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 sampleCount:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a4;
  objc_msgSend(v7, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ENTRIES_NUMBERLESS_VALUE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v10, objc_msgSend(v8, "integerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKCardioFitnessOverlayContext _cardioFitnessContextItemWithLevel:count:unitString:](self, "_cardioFitnessContextItemWithLevel:count:unitString:", a3, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_cardioFitnessContextItemWithLevel:(int64_t)a3 count:(id)a4 unitString:(id)a5
{
  id v8;
  id v9;
  HKDisplayTypeContextItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(HKDisplayTypeContextItem);
  +[HKCardioFitnessUtilities localizedStringForCardioFitnessTitle:](HKCardioFitnessUtilities, "localizedStringForCardioFitnessTitle:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v10, "setTitle:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB6368], "analyticsStringForLevel:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_chartOverlayCardioFitnessAccessibilityIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v10, "setAccessibilityIdentifier:", v14);

  -[HKDisplayTypeContextItem setInfoHidden:](v10, "setInfoHidden:", 1);
  if (objc_msgSend(v8, "integerValue"))
  {
    -[HKDisplayTypeContextItem setUnit:](v10, "setUnit:", v9);
    objc_msgSend(v8, "stringValue");
  }
  else
  {
    -[HKDisplayTypeContextItem setUnit:](v10, "setUnit:", &stru_1E9C4C428);
    HKLocalizedNoDataString();
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setValue:](v10, "setValue:", v15);

  objc_msgSend(MEMORY[0x1E0CB6368], "analyticsStringForLevel:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAnalyticsIdentifier:](v10, "setAnalyticsIdentifier:", v16);

  +[HKOverlayContextUtilities defaultMetricColorsForOverlayMode:](HKOverlayContextUtilities, "defaultMetricColorsForOverlayMode:", -[_HKCardioFitnessOverlayContext mode](self, "mode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v10, "setMetricColors:", v17);

  +[HKUIMetricColors vitalsColors](HKUIMetricColors, "vitalsColors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v10, "setSelectedMetricColors:", v18);

  return v10;
}

- (int64_t)mode
{
  return self->_mode;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKSampleType)monitoringSampleType
{
  return self->_monitoringSampleType;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_monitoringSampleType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
