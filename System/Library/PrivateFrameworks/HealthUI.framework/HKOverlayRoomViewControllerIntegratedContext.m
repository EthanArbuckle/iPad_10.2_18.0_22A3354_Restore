@implementation HKOverlayRoomViewControllerIntegratedContext

+ (id)distributionContextWithStyle:(int64_t)a3 namedPredicate:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 optionalDelegate:(id)a7 options:(int64_t)a8 mode:(int64_t)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKOverlayRoomViewControllerDistributionContext *v18;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = -[HKOverlayRoomViewControllerDistributionContext initWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:]([HKOverlayRoomViewControllerDistributionContext alloc], "initWithStyle:namedPredicate:overlayChartController:applicationItems:optionalDelegate:options:mode:", a3, v17, v16, v15, v14, a8, a9);

  return v18;
}

+ (id)quantityContextWithIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKOverlayRoomViewControllerQuantityContext *v17;

  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[HKOverlayRoomViewControllerQuantityContext initWithQuantityIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:optionalBaseDisplayType:]([HKOverlayRoomViewControllerQuantityContext alloc], "initWithQuantityIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:optionalBaseDisplayType:", v16, v15, v14, v13, a7, a8, 0);

  return v17;
}

+ (id)quantityContextWithIdentifier:(id)a3 overlayChartController:(id)a4 applicationItems:(id)a5 optionalDelegate:(id)a6 seriesOptions:(int64_t)a7 mode:(int64_t)a8 optionalBaseDisplayType:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKOverlayRoomViewControllerQuantityContext *v20;

  v15 = a9;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[HKOverlayRoomViewControllerQuantityContext initWithQuantityIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:optionalBaseDisplayType:]([HKOverlayRoomViewControllerQuantityContext alloc], "initWithQuantityIdentifier:overlayChartController:applicationItems:optionalDelegate:seriesOptions:mode:optionalBaseDisplayType:", v19, v18, v17, v16, a7, a8, v15);

  return v20;
}

- (HKOverlayRoomViewControllerIntegratedContext)initWithOverlayChartController:(id)a3 applicationItems:(id)a4 mode:(int64_t)a5
{
  id v9;
  id v10;
  HKOverlayRoomViewControllerIntegratedContext *v11;
  HKOverlayRoomViewControllerIntegratedContext *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *displayTypesForTimeScopes;
  HKSampleType *monitoringSampleType;
  HKDisplayTypeContextItem *lastUpdatedContextItem;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HKOverlayRoomViewControllerIntegratedContext;
  v11 = -[HKOverlayRoomViewControllerIntegratedContext init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_overlayChartController, a3);
    objc_storeStrong((id *)&v12->_applicationItems, a4);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    displayTypesForTimeScopes = v12->_displayTypesForTimeScopes;
    v12->_displayTypesForTimeScopes = v13;

    monitoringSampleType = v12->_monitoringSampleType;
    v12->_monitoringSampleType = 0;

    lastUpdatedContextItem = v12->_lastUpdatedContextItem;
    v12->_lastUpdatedContextItem = 0;

    v12->_overlayMode = a5;
  }

  return v12;
}

- (id)representativeDisplayType
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 2967, CFSTR("Subclasses must provide an implementation of representativeDisplayType:"));

  return 0;
}

- (id)buildContextItemWithValue:(id)a3 unit:(id)a4 valueContext:(id)a5 forTimeScope:(int64_t)a6 isUnitIncludedInValue:(BOOL)a7
{
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 2972, CFSTR("Subclasses must provide an implementation of buildContextItemWithValue:unit:valueContext:forTimeScope:isUnitIncludedInValue:"));

  return 0;
}

- (id)buildOverlayDisplayTypeForTimeScope:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 2978, CFSTR("Subclasses must provide an implementation of buildOverlayDisplayTypeForTimeScope:"));

  return 0;
}

- (void)fetchCachedDataForTimeScope:(int64_t)a3 resolution:(int64_t)a4 dateInterval:(id)a5 completion:(id)a6
{
  void *v8;
  void *v9;
  id v10;

  v8 = (void *)MEMORY[0x1E0CB3488];
  v10 = a6;
  objc_msgSend(v8, "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomViewController.m"), 2986, CFSTR("Subclasses must provide an implementation of fetchCachedDataForTimeScope:resolution:dateInterval:completion:"));

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, MEMORY[0x1E0C9AA60], 0, 0);
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)valueString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5 isUnitIncludedInValue:(BOOL *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a3;
  objc_msgSend(a4, "unitController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomViewControllerIntegratedContext _minMaxValueFromChartPoints:displayType:unitPreferenceController:isUnitIncludedInValue:](self, "_minMaxValueFromChartPoints:displayType:unitPreferenceController:isUnitIncludedInValue:", v11, v10, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)unitString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  return 0;
}

- (id)valueContextString:(id)a3 applicationItems:(id)a4 representativeDisplayType:(id)a5
{
  return 0;
}

- (id)sampleTypeForDateRangeUpdates
{
  void *v3;
  void *v4;

  -[HKOverlayRoomViewControllerIntegratedContext monitoringSampleType](self, "monitoringSampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HKOverlayRoomViewControllerIntegratedContext _buildMonitoringSampleType](self, "_buildMonitoringSampleType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewControllerIntegratedContext setMonitoringSampleType:](self, "setMonitoringSampleType:", v4);

  }
  return -[HKOverlayRoomViewControllerIntegratedContext monitoringSampleType](self, "monitoringSampleType");
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HKOverlayRoomViewControllerIntegratedContext displayTypesForTimeScopes](self, "displayTypesForTimeScopes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[HKOverlayRoomViewControllerIntegratedContext buildOverlayDisplayTypeForTimeScope:](self, "buildOverlayDisplayTypeForTimeScope:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewControllerIntegratedContext displayTypesForTimeScopes](self, "displayTypesForTimeScopes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int64_t v18;

  v11 = a3;
  v12 = a7;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __131__HKOverlayRoomViewControllerIntegratedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v15[3] = &unk_1E9C401E8;
  v15[4] = self;
  v16 = v11;
  v17 = v12;
  v18 = a5;
  v13 = v12;
  v14 = v11;
  -[HKOverlayRoomViewControllerIntegratedContext fetchCachedDataForTimeScope:resolution:dateInterval:completion:](self, "fetchCachedDataForTimeScope:resolution:dateInterval:completion:", a5, a6, v14, v15);

}

void __131__HKOverlayRoomViewControllerIntegratedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  char v27;
  char v28;

  v5 = a2;
  if (a3)
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_obsoleteDateRange:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "representativeDisplayType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v8, "applicationItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueString:applicationItems:representativeDisplayType:isUnitIncludedInValue:", v5, v9, v7, &v28);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = *(void **)(a1 + 32);
      objc_msgSend(v11, "applicationItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "unitString:applicationItems:representativeDisplayType:", v5, v12, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "applicationItems");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "valueContextString:applicationItems:representativeDisplayType:", v5, v15, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __131__HKOverlayRoomViewControllerIntegratedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
      block[3] = &unk_1E9C401C0;
      block[4] = *(_QWORD *)(a1 + 32);
      v22 = v10;
      v23 = v13;
      v24 = v16;
      v17 = *(void **)(a1 + 48);
      v26 = *(_QWORD *)(a1 + 56);
      v27 = v28;
      v25 = v17;
      v18 = v16;
      v19 = v13;
      v20 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      goto LABEL_7;
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();
LABEL_7:

}

uint64_t __131__HKOverlayRoomViewControllerIntegratedContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "buildContextItemWithValue:unit:valueContext:forTimeScope:isUnitIncludedInValue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedContextItem:", v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (BOOL)_obsoleteDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  -[HKOverlayRoomViewControllerIntegratedContext overlayChartController](self, "overlayChartController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryGraphViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "graphView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "effectiveVisibleRangeActive");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v9, "compare:", v11) || objc_msgSend(v10, "compare:", v12);
  return v13;
}

- (id)contextItemForLastUpdate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[HKOverlayRoomViewControllerIntegratedContext lastUpdatedContextItem](self, "lastUpdatedContextItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HKOverlayRoomViewControllerIntegratedContext applicationItems](self, "applicationItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeScopeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "selectedTimeScope");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewControllerIntegratedContext buildContextItemWithValue:unit:valueContext:forTimeScope:isUnitIncludedInValue:](self, "buildContextItemWithValue:unit:valueContext:forTimeScope:isUnitIncludedInValue:", v8, 0, 0, v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomViewControllerIntegratedContext setLastUpdatedContextItem:](self, "setLastUpdatedContextItem:", v9);

  }
  return -[HKOverlayRoomViewControllerIntegratedContext lastUpdatedContextItem](self, "lastUpdatedContextItem");
}

- (id)_buildMonitoringSampleType
{
  void *v2;
  void *v3;
  id v4;

  -[HKOverlayRoomViewControllerIntegratedContext representativeDisplayType](self, "representativeDisplayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_minMaxValueFromChartPoints:(id)a3 displayType:(id)a4 unitPreferenceController:(id)a5 isUnitIncludedInValue:(BOOL *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  HKInteractiveChartNumberRangeFormatter *v28;
  HKInteractiveChartNumberRangeFormatter *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  id v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || !objc_msgSend(v8, "count"))
  {
    v27 = v12;
    goto LABEL_26;
  }
  v34 = v12;
  v36 = v10;
  v37 = v9;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v14)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_20;
  }
  v15 = v14;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v40 != v18)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      if (!v16
        || (objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "minYValue"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "compare:", v16),
            v21,
            v22 == -1))
      {
        objc_msgSend(v20, "minYValue", v34);
        v23 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v23;
        if (v17)
        {
LABEL_13:
          objc_msgSend(v20, "maxYValue", v34);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "compare:", v17);

          if (v25 != 1)
            continue;
        }
      }
      else if (v17)
      {
        goto LABEL_13;
      }
      objc_msgSend(v20, "maxYValue", v34);
      v26 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v26;
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v15);
LABEL_20:

  v28 = objc_alloc_init(HKInteractiveChartNumberRangeFormatter);
  v29 = v28;
  if (a6)
    *a6 = 1;
  v10 = v36;
  v9 = v37;
  -[HKInteractiveChartNumberRangeFormatter stringForMinimumValue:maximumValue:displayType:unitPreferenceController:](v28, "stringForMinimumValue:maximumValue:displayType:unitPreferenceController:", v16, v17, v37, v36, v34);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  v12 = v35;
  if (v30)
    v32 = (void *)v30;
  else
    v32 = v35;
  v27 = v32;

LABEL_26:
  return v27;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (void)setOverlayMode:(int64_t)a3
{
  self->_overlayMode = a3;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (void)setOverlayChartController:(id)a3
{
  objc_storeStrong((id *)&self->_overlayChartController, a3);
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
  objc_storeStrong((id *)&self->_applicationItems, a3);
}

- (HKSampleType)monitoringSampleType
{
  return self->_monitoringSampleType;
}

- (void)setMonitoringSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_monitoringSampleType, a3);
}

- (NSMutableDictionary)displayTypesForTimeScopes
{
  return self->_displayTypesForTimeScopes;
}

- (void)setDisplayTypesForTimeScopes:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypesForTimeScopes, a3);
}

- (HKDisplayTypeContextItem)lastUpdatedContextItem
{
  return self->_lastUpdatedContextItem;
}

- (void)setLastUpdatedContextItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedContextItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedContextItem, 0);
  objc_storeStrong((id *)&self->_displayTypesForTimeScopes, 0);
  objc_storeStrong((id *)&self->_monitoringSampleType, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
