@implementation HKOverlayRoomViewControllerQuantityContext

- (HKOverlayRoomViewControllerQuantityContext)initWithQuantityIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8 optionalBaseDisplayType:(id)a9
{
  id v16;
  id v17;
  id v18;
  HKOverlayRoomViewControllerQuantityContext *v19;
  HKOverlayRoomViewControllerQuantityContext *v20;
  objc_super v22;

  v16 = a3;
  v17 = a6;
  v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)HKOverlayRoomViewControllerQuantityContext;
  v19 = -[HKOverlayRoomViewControllerIntegratedContext initWithOverlayChartController:applicationItems:mode:](&v22, sel_initWithOverlayChartController_applicationItems_mode_, a4, a5, a8);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_quantityTypeIdentifier, a3);
    objc_storeWeak((id *)&v20->_optionalDelegate, v17);
    v20->_options = a7;
    objc_storeStrong((id *)&v20->_optionalBaseDisplayType, a9);
  }

  return v20;
}

- (id)representativeDisplayType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB6A70];
  -[HKOverlayRoomViewControllerQuantityContext quantityTypeIdentifier](self, "quantityTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quantityTypeForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayTypeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayTypeForObjectType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HKDisplayTypeContextItem *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v34;

  v34 = a7;
  v11 = a4;
  v12 = a5;
  v13 = a3;
  -[HKOverlayRoomViewControllerQuantityContext representativeDisplayType](self, "representativeDisplayType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(HKDisplayTypeContextItem);
  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_4;
  v17 = (void *)v16;
  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cacheDataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cacheDataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contextTitleForTimeScope");
    v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v22[2](v22, a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", v24);
  }
  else
  {
LABEL_4:
    objc_msgSend(v14, "localization");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "shortenedDisplayName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "displayTypeIdentifierString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "hk_chartOverlayAccessibilityIdentifier:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", v27);

  }
  -[HKDisplayTypeContextItem setTitle:](v15, "setTitle:", v23);
  -[HKDisplayTypeContextItem setInfoHidden:](v15, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setValue:](v15, "setValue:", v13);

  -[HKDisplayTypeContextItem setValueContext:](v15, "setValueContext:", v12);
  if (v11)
  {
    -[HKDisplayTypeContextItem setUnit:](v15, "setUnit:", v11);
  }
  else
  {
    -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "unitController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedDisplayNameForDisplayType:", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeContextItem setUnit:](v15, "setUnit:", v30);

  }
  -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v15, "setUseTightSpacingBetweenValueAndUnit:", objc_msgSend(v14, "contextItemShouldUseTightSpacingBetweenValueAndUnit"));
  -[HKDisplayTypeContextItem setIsUnitIncludedInValue:](v15, "setIsUnitIncludedInValue:", v34);
  +[HKOverlayContextUtilities defaultMetricColorsForOverlayMode:](HKOverlayContextUtilities, "defaultMetricColorsForOverlayMode:", -[HKOverlayRoomViewControllerIntegratedContext overlayMode](self, "overlayMode"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v15, "setMetricColors:", v31);

  +[HKOverlayContextUtilities selectedMetricColorsForCategory:](HKOverlayContextUtilities, "selectedMetricColorsForCategory:", objc_msgSend(v14, "categoryIdentifier"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v15, "setSelectedMetricColors:", v32);

  return v15;
}

- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  -[HKOverlayRoomViewControllerQuantityContext representativeDisplayType](self, "representativeDisplayType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "color");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v17 = (id)a3;
  if ((v6 & 1) != 0)
  {
    -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formatterForTimescope:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }
  -[HKOverlayRoomViewControllerIntegratedContext overlayChartController](self, "overlayChartController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerQuantityContext quantityTypeIdentifier](self, "quantityTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayTypeController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cacheDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alternateLineSeries");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTypeForQuantityIdentifier:timeScope:displayTypeController:overlayColor:cacheDataSource:alternateLineSeries:alternateFormatter:seriesOptions:", v9, v17, v11, v20, v13, v15, v19, self->_options);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v9 = a6;
  v10 = a5;
  -[HKOverlayRoomViewControllerIntegratedContext overlayChartController](self, "overlayChartController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerQuantityContext quantityTypeIdentifier](self, "quantityTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cacheDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __109__HKOverlayRoomViewControllerQuantityContext_fetchCachedDataForTimeScope_resolution_dateInterval_completion___block_invoke;
  v18[3] = &unk_1E9C40198;
  v19 = v9;
  v17 = v9;
  objc_msgSend(v11, "cachedDataForQuantityIdentifier:timeScope:resolution:startDate:endDate:cacheDataSource:completion:", v12, a3, 0, v13, v14, v16, v18);

}

uint64_t __109__HKOverlayRoomViewControllerQuantityContext_fetchCachedDataForTimeScope_resolution_dateInterval_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueString:applicationItems:representativeDisplayType:", v10, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HKOverlayRoomViewControllerQuantityContext;
    -[HKOverlayRoomViewControllerIntegratedContext valueString:applicationItems:representativeDisplayType:isUnitIncludedInValue:](&v18, sel_valueString_applicationItems_representativeDisplayType_isUnitIncludedInValue_, v10, v11, v12, a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unitString:applicationItems:representativeDisplayType:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HKOverlayRoomViewControllerQuantityContext;
    -[HKOverlayRoomViewControllerIntegratedContext unitString:applicationItems:representativeDisplayType:](&v16, sel_unitString_applicationItems_representativeDisplayType_, v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueContextString:applicationItems:representativeDisplayType:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HKOverlayRoomViewControllerQuantityContext;
    -[HKOverlayRoomViewControllerIntegratedContext valueContextString:applicationItems:representativeDisplayType:](&v16, sel_valueContextString_applicationItems_representativeDisplayType_, v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)prepareContextForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[HKOverlayRoomViewControllerQuantityContext optionalBaseDisplayType](self, "optionalBaseDisplayType");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[HKOverlayRoomViewControllerQuantityContext optionalBaseDisplayType](self, "optionalBaseDisplayType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[HKOverlayRoomViewControllerQuantityContext optionalBaseDisplayType](self, "optionalBaseDisplayType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "graphSeriesForTimeScope:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "hasAnyDataLoadedInXAxisRange:dateZoom:resolution:", v17, a5, a6);
    }
  }

}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  HKOverlayRoomViewControllerQuantityContext *v4;
  HKOverlayRoomViewControllerQuantityContext *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = (HKOverlayRoomViewControllerQuantityContext *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKOverlayRoomViewControllerQuantityContext quantityTypeIdentifier](self, "quantityTypeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomViewControllerQuantityContext quantityTypeIdentifier](v5, "quantityTypeIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v7
        && (v8 = -[HKOverlayRoomViewControllerQuantityContext options](self, "options"),
            v8 == -[HKOverlayRoomViewControllerQuantityContext options](v5, "options")))
      {
        -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](self, "optionalDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cacheDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKOverlayRoomViewControllerQuantityContext optionalDelegate](v5, "optionalDelegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cacheDataSource");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v11 == v14;

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (NSString)quantityTypeIdentifier
{
  return self->_quantityTypeIdentifier;
}

- (void)setQuantityTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_quantityTypeIdentifier, a3);
}

- (HKOverlayRoomViewControllerIntegratedContextDelegate)optionalDelegate
{
  return (HKOverlayRoomViewControllerIntegratedContextDelegate *)objc_loadWeakRetained((id *)&self->_optionalDelegate);
}

- (void)setOptionalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_optionalDelegate, a3);
}

- (int64_t)options
{
  return self->_options;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (HKDisplayType)optionalBaseDisplayType
{
  return self->_optionalBaseDisplayType;
}

- (void)setOptionalBaseDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_optionalBaseDisplayType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalBaseDisplayType, 0);
  objc_destroyWeak((id *)&self->_optionalDelegate);
  objc_storeStrong((id *)&self->_quantityTypeIdentifier, 0);
}

@end
