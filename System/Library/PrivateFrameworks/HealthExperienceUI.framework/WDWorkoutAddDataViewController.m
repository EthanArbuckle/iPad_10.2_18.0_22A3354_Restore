@implementation WDWorkoutAddDataViewController

- (WDWorkoutAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  WDWorkoutAddDataViewController *v7;
  WDWorkoutAddDataViewController *v8;
  uint64_t v9;
  NSArray *workoutActivityTypePairs;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *sectionsWithDistance;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *sectionsWithoutDistance;
  void *v19;
  objc_super v21;
  WDAddDataManualEntryItem *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  WDAddDataManualEntryItem *dateRangeEntryItem;
  _QWORD v26[3];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)WDWorkoutAddDataViewController;
  v7 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v21, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[WDWorkoutAddDataViewController _generateSortedActivityTypes](v7, "_generateSortedActivityTypes");
    v9 = objc_claimAutoreleasedReturnValue();
    workoutActivityTypePairs = v8->_workoutActivityTypePairs;
    v8->_workoutActivityTypePairs = (NSArray *)v9;

    -[WDWorkoutAddDataViewController _createEntryItems](v8, "_createEntryItems");
    v26[0] = v8->_activityTypeEntryItem;
    v26[1] = v8->_activeEnergyEntryItem;
    v26[2] = v8->_distanceEntryItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    dateRangeEntryItem = v8->_dateRangeEntryItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &dateRangeEntryItem, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v13 = objc_claimAutoreleasedReturnValue();
    sectionsWithDistance = v8->_sectionsWithDistance;
    v8->_sectionsWithDistance = (NSArray *)v13;

    v23[0] = v8->_activityTypeEntryItem;
    v23[1] = v8->_activeEnergyEntryItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    v22 = v8->_dateRangeEntryItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v17 = objc_claimAutoreleasedReturnValue();
    sectionsWithoutDistance = v8->_sectionsWithoutDistance;
    v8->_sectionsWithoutDistance = (NSArray *)v17;

    -[WDWorkoutAddDataViewController _updateCurrentDistanceTypeWithActivityType:](v8, "_updateCurrentDistanceTypeWithActivityType:", 37);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v8, sel_unitPreferencesDidChange_, *MEMORY[0x1E0D2F5B0], 0);

  }
  return v8;
}

- (void)_createEntryItems
{
  void *v3;
  WDAddDataManualEntryItem *v4;
  WDAddDataManualEntryItem *dateRangeEntryItem;
  int64_t v6;
  WDAddDataManualEntrySpinner *v7;
  void *v8;
  void *v9;
  WDAddDataManualEntrySpinner *v10;
  WDAddDataManualEntrySpinner *activityTypeEntryItem;
  WDAddDataManualEntrySpinner *v12;
  void *v13;
  void *v14;
  void *v15;
  WDAddDataManualEntryItem *v16;
  WDAddDataManualEntryItem *activeEnergyEntryItem;
  WDAddDataManualEntryItem *v18;
  void *v19;
  void *v20;
  void *v21;
  WDAddDataManualEntryItem *v22;
  WDAddDataManualEntryItem *distanceEntryItem;
  id v24;

  -[HKDateCache oneMinuteBeforeEndOfDayMidnight](self->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:](WDAddDataManualEntryItem, "twoPartDateRangeItemWithMaximumEndDate:", v3);
  v4 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  dateRangeEntryItem = self->_dateRangeEntryItem;
  self->_dateRangeEntryItem = v4;

  -[WDAddDataManualEntryItem setDelegate:](self->_dateRangeEntryItem, "setDelegate:", self);
  v6 = -[WDWorkoutAddDataViewController _indexOfActivityType:](self, "_indexOfActivityType:", 37);
  v7 = [WDAddDataManualEntrySpinner alloc];
  HABundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("WORKOUT_ACTIVITY_TYPE"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WDAddDataManualEntrySpinner initWithDisplayName:](v7, "initWithDisplayName:", v9);
  activityTypeEntryItem = self->_activityTypeEntryItem;
  self->_activityTypeEntryItem = v10;

  -[WDAddDataManualEntrySpinner setDataSource:](self->_activityTypeEntryItem, "setDataSource:", self);
  v12 = self->_activityTypeEntryItem;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntrySpinner setValue:](v12, "setValue:", v13);

  -[WDAddDataManualEntryItem setDelegate:](self->_activityTypeEntryItem, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0D2F700], "sharedInstanceForHealthStore:", self->super._healthStore);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "displayTypeWithIdentifier:", &unk_1E55CCED8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "roundingMode");
  HKDecimalFormatter();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem numericItemWithManualEntryType:numberFormatter:](WDAddDataManualEntryItem, "numericItemWithManualEntryType:numberFormatter:", 2, v15);
  v16 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  activeEnergyEntryItem = self->_activeEnergyEntryItem;
  self->_activeEnergyEntryItem = v16;

  v18 = self->_activeEnergyEntryItem;
  -[WDWorkoutAddDataViewController _activeEnergyDisplayName](self, "_activeEnergyDisplayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem setTitle:](v18, "setTitle:", v19);

  -[WDAddDataManualEntryItem setDelegate:](self->_activeEnergyEntryItem, "setDelegate:", self);
  objc_msgSend(v24, "displayTypeWithIdentifier:", &unk_1E55CCEF0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "roundingMode");
  HKDecimalFormatter();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[WDAddDataManualEntryItem numericItemWithManualEntryType:numberFormatter:](WDAddDataManualEntryItem, "numericItemWithManualEntryType:numberFormatter:", 2, v21);
  v22 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
  distanceEntryItem = self->_distanceEntryItem;
  self->_distanceEntryItem = v22;

  -[WDAddDataManualEntryItem setTitle:](self->_distanceEntryItem, "setTitle:", &stru_1E55A2388);
  -[WDAddDataManualEntryItem setDelegate:](self->_distanceEntryItem, "setDelegate:", self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WDWorkoutAddDataViewController;
  -[WDWorkoutAddDataViewController dealloc](&v4, sel_dealloc);
}

- (void)unitPreferencesDidChange:(id)a3
{
  WDAddDataManualEntryItem *distanceEntryItem;
  void *v5;
  WDAddDataManualEntryItem *activeEnergyEntryItem;
  id v7;

  distanceEntryItem = self->_distanceEntryItem;
  -[WDWorkoutAddDataViewController _distanceDisplayName](self, "_distanceDisplayName", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem setTitle:](distanceEntryItem, "setTitle:", v5);

  activeEnergyEntryItem = self->_activeEnergyEntryItem;
  -[WDWorkoutAddDataViewController _activeEnergyDisplayName](self, "_activeEnergyDisplayName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem setTitle:](activeEnergyEntryItem, "setTitle:", v7);

}

- (id)_totalDistance
{
  WDAddDataManualEntryItem *distanceEntryItem;
  void *v4;
  void *v5;

  distanceEntryItem = self->_distanceEntryItem;
  -[WDWorkoutAddDataViewController _unitForDistanceType:](self, "_unitForDistanceType:", self->_distanceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDWorkoutAddDataViewController _quantityFromEntryItem:unit:](self, "_quantityFromEntryItem:unit:", distanceEntryItem, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_totalEnergyBurned
{
  void *v3;
  WDAddDataManualEntryItem *activeEnergyEntryItem;
  void *v5;
  void *v6;

  -[WDWorkoutAddDataViewController _displayTypeForIdentifier:](self, "_displayTypeForIdentifier:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  activeEnergyEntryItem = self->_activeEnergyEntryItem;
  -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDWorkoutAddDataViewController _quantityFromEntryItem:unit:](self, "_quantityFromEntryItem:unit:", activeEnergyEntryItem, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_quantityFromEntryItem:(id)a3 unit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  objc_msgSend(a3, "generateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v8, "quantityWithUnit:doubleValue:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_displayTypeForIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D2F700], "sharedInstanceForHealthStore:", self->super._healthStore);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayTypeWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_displayTypeForDistanceType:(id)a3
{
  uint64_t v4;
  uint64_t v6;

  v4 = objc_msgSend(a3, "code");
  if ((unint64_t)(v4 - 83) > 0x37 || ((1 << (v4 - 83)) & 0x80000048000001) == 0)
    v6 = 8;
  else
    v6 = v4;
  -[WDWorkoutAddDataViewController _displayTypeForIdentifier:](self, "_displayTypeForIdentifier:", v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_unitForDistanceType:(id)a3
{
  void *v4;
  void *v5;

  -[WDWorkoutAddDataViewController _displayTypeForDistanceType:](self, "_displayTypeForDistanceType:", self->_distanceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController unitForDisplayType:](self->super._unitController, "unitForDisplayType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_distanceDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WDWorkoutAddDataViewController _displayTypeForDistanceType:](self, "_displayTypeForDistanceType:", self->_distanceType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    HABundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WORKOUT_TOTAL_DISTANCE_WITH_UNIT %@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB3940];
    -[HKUnitPreferenceController localizedDisplayNameForDisplayType:](self->super._unitController, "localizedDisplayNameForDisplayType:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_activeEnergyDisplayName
{
  void *v3;
  void *v4;

  -[WDWorkoutAddDataViewController _displayTypeForIdentifier:](self, "_displayTypeForIdentifier:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKUnitPreferenceController localizedLongDisplayNameForDisplayType:](self->super._unitController, "localizedLongDisplayNameForDisplayType:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)validateDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[WDAddDataManualEntryItem generateValue](self->_dateRangeEntryItem, "generateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__WDWorkoutAddDataViewController_validateDataWithCompletion___block_invoke;
  v9[3] = &unk_1E55753C0;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[WDAddDataViewController validateMaximumAllowedDurationFor:endDate:competion:](self, "validateMaximumAllowedDurationFor:endDate:competion:", v6, v7, v9);

}

void __61__WDWorkoutAddDataViewController_validateDataWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;

  v5 = a3;
  if ((a2 & 1) != 0)
  {

    objc_msgSend(*(id *)(a1 + 32), "_totalDistance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v7 + 1088))
      v8 = v6 == 0;
    else
      v8 = 1;
    if (v8
      || (v9 = objc_msgSend(*(id *)(v7 + 1056), "validateWorkoutDistance:", v6), v7 = *(_QWORD *)(a1 + 32), v9 != 1))
    {
      v16 = 0;
      v15 = 0;
    }
    else
    {
      objc_msgSend((id)v7, "_displayTypeForDistanceType:", *(_QWORD *)(v7 + 1088));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_unitForDistanceType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1088));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "doubleValueForUnit:", v11);
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hk_valueFormatterForUnit:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringFromValue:displayType:unitController:", v13, v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = *(_QWORD *)(a1 + 32);
      v16 = 1;
    }
    objc_msgSend((id)v7, "_totalEnergyBurned");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1056), "validateWorkoutEnergyBurned:", v17) == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "_displayTypeForIdentifier:", 10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "unitForDisplayType:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v17, "doubleValueForUnit:", v19);
        objc_msgSend(v20, "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hk_valueFormatterForUnit:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stringFromValue:displayType:unitController:", v21, v18, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = (void *)MEMORY[0x1E0CB3940];
        HABundle();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v16)
        {
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_TWO_ITEMS_FORMAT_%@_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", v27, v15, v23);
        }
        else
        {
          objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", v27, v23, v30);
        }
        v32 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if ((v16 & 1) == 0)
      {
LABEL_17:
        v23 = 0;
        v29 = 0;
LABEL_21:
        v31 = v29;
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        goto LABEL_22;
      }
    }
    else if (!v16)
    {
      goto LABEL_17;
    }
    v28 = (void *)MEMORY[0x1E0CB3940];
    HABundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OUT_OF_RANGE_ALERT_ONE_ITEM_FORMAT_%@"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", v27, v15);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
LABEL_20:

    v29 = v32;
    goto LABEL_21;
  }
  v31 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_22:

}

- (void)saveHKObjectWithCompletion:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HKHealthStore *healthStore;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  WDWorkoutAddDataViewController *v36;
  id v37;
  id v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v4 = -[WDWorkoutAddDataViewController _selectedActivityType](self, "_selectedActivityType");
  -[WDWorkoutAddDataViewController _totalEnergyBurned](self, "_totalEnergyBurned");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDWorkoutAddDataViewController _totalDistance](self, "_totalDistance");
  v6 = objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_dateRangeEntryItem, "generateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB6DD0];
  objc_msgSend(v7, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataViewController defaultMetadata](self, "defaultMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v13 = (void *)v6;
  objc_msgSend(v12, "_workoutWithActivityType:startDate:endDate:workoutEvents:totalEnergyBurned:totalDistance:device:metadata:", v4, v9, v10, 0, v5, v6, 0, v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    v15 = (void *)MEMORY[0x1E0CB6A40];
    objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5A48]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "quantitySampleWithType:quantity:startDate:endDate:", v16, v5, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "addObject:", v19);
  }
  _HKWorkoutDistanceTypeForActivityType();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v13;
  if (v20 && v13)
  {
    v22 = (void *)MEMORY[0x1E0CB6A40];
    _HKWorkoutDistanceTypeForActivityType();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "quantitySampleWithType:quantity:startDate:endDate:", v23, v13, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v13;
    objc_msgSend(v14, "addObject:", v26);

  }
  healthStore = self->super._healthStore;
  v39[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __61__WDWorkoutAddDataViewController_saveHKObjectWithCompletion___block_invoke;
  v34[3] = &unk_1E5575410;
  v35 = v14;
  v36 = self;
  v37 = v32;
  v38 = v33;
  v29 = v33;
  v30 = v32;
  v31 = v14;
  -[HKHealthStore saveObjects:withCompletion:](healthStore, "saveObjects:withCompletion:", v28, v34);

}

void __61__WDWorkoutAddDataViewController_saveHKObjectWithCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (a2 && objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 1032);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__WDWorkoutAddDataViewController_saveHKObjectWithCompletion___block_invoke_2;
    v9[3] = &unk_1E55753E8;
    v8 = *(_QWORD *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v7, "addSamples:toWorkout:completion:", v6, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __61__WDWorkoutAddDataViewController_saveHKObjectWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[WDWorkoutAddDataViewController _sectionsForDistanceType:](self, "_sectionsForDistanceType:", self->_distanceType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WDWorkoutAddDataViewController _sectionsForDistanceType:](self, "_sectionsForDistanceType:", self->_distanceType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_generateSortedActivityTypes
{
  id v3;
  unint64_t v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = *MEMORY[0x1E0CB7408];
  for (i = *MEMORY[0x1E0CB7410]; v4 <= i; ++v4)
  {
    if (_HKWorkoutActivityTypeIsValid()
      && (_HKWorkoutActivityTypeIsDeprecated() & 1) == 0
      && !-[WDWorkoutAddDataViewController _isExcludedActivityType:](self, "_isExcludedActivityType:", v4))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v6;
      HKUILocalizedWorkoutTypeName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

    }
  }
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_0);
  v12[0] = &unk_1E55CCF08;
  HKUILocalizedWorkoutTypeName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  return v3;
}

uint64_t __62__WDWorkoutAddDataViewController__generateSortedActivityTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (BOOL)_isExcludedActivityType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 82;
}

- (int64_t)_indexOfActivityType:(unint64_t)a3
{
  NSArray *workoutActivityTypePairs;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  workoutActivityTypePairs = self->_workoutActivityTypePairs;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__WDWorkoutAddDataViewController__indexOfActivityType___block_invoke;
  v6[3] = &unk_1E5575478;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSArray enumerateObjectsUsingBlock:](workoutActivityTypePairs, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __55__WDWorkoutAddDataViewController__indexOfActivityType___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  v9 = *(_QWORD *)(a1 + 40);

  if (v8 == v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)_activityTypeDescriptionForIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSArray objectAtIndexedSubscript:](self->_workoutActivityTypePairs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_activityTypeForIndex:(int64_t)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_workoutActivityTypePairs, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return v5;
}

- (unint64_t)_selectedActivityType
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[WDAddDataManualEntrySpinner generateValue](self->_activityTypeEntryItem, "generateValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = -[WDWorkoutAddDataViewController _activityTypeForIndex:](self, "_activityTypeForIndex:", objc_msgSend(v3, "integerValue"));
  else
    v5 = 37;

  return v5;
}

- (id)_sectionsForDistanceType:(id)a3
{
  int *v3;

  v3 = &OBJC_IVAR___WDWorkoutAddDataViewController__sectionsWithDistance;
  if (!a3)
    v3 = &OBJC_IVAR___WDWorkoutAddDataViewController__sectionsWithoutDistance;
  return *(id *)((char *)&self->super.super.super.super.super.super.isa + *v3);
}

- (void)_updateCurrentDistanceTypeWithActivityType:(unint64_t)a3
{
  HKQuantityType *v4;
  HKQuantityType *v5;
  char v6;
  WDAddDataManualEntryItem *distanceEntryItem;
  void *v8;
  HKQuantityType *obj;

  _HKWorkoutDistanceTypeForActivityType();
  v4 = (HKQuantityType *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != self->_distanceType)
  {
    obj = v4;
    v6 = -[HKQuantityType isEqual:](v4, "isEqual:");
    v5 = obj;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_distanceType, obj);
      distanceEntryItem = self->_distanceEntryItem;
      -[WDWorkoutAddDataViewController _distanceDisplayName](self, "_distanceDisplayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WDAddDataManualEntryItem setTitle:](distanceEntryItem, "setTitle:", v8);

      -[WDAddDataViewController reloadManualEntryItemsAndReloadTableView:](self, "reloadManualEntryItemsAndReloadTableView:", -[WDWorkoutAddDataViewController isViewLoaded](self, "isViewLoaded"));
      v5 = obj;
    }
  }

}

- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3
{
  return -[NSArray count](self->_workoutActivityTypePairs, "count", a3);
}

- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4
{
  return -[WDWorkoutAddDataViewController _activityTypeDescriptionForIndex:](self, "_activityTypeDescriptionForIndex:", a4);
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  HKManualEntryValidationController *validationController;
  void *v15;
  uint64_t v16;
  _BOOL8 v17;
  WDAddDataManualEntrySpinner *v18;

  v18 = (WDAddDataManualEntrySpinner *)a3;
  if (self->_activityTypeEntryItem == v18)
    -[WDWorkoutAddDataViewController _updateCurrentDistanceTypeWithActivityType:](self, "_updateCurrentDistanceTypeWithActivityType:", -[WDWorkoutAddDataViewController _selectedActivityType](self, "_selectedActivityType"));
  -[WDWorkoutAddDataViewController _totalEnergyBurned](self, "_totalEnergyBurned");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[HKManualEntryValidationController validateWorkoutEnergyBurned:](self->super._validationController, "validateWorkoutEnergyBurned:", v4) != 2;
  else
    v5 = 1;
  -[WDWorkoutAddDataViewController _totalDistance](self, "_totalDistance");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (self->_distanceType)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8
    && -[HKManualEntryValidationController validateWorkoutDistance:](self->super._validationController, "validateWorkoutDistance:", v6) == 2)
  {
    v5 = 0;
  }
  -[WDAddDataManualEntryItem generateValue](self->_dateRangeEntryItem, "generateValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  validationController = self->super._validationController;
  -[HKDisplayType sampleType](self->super._displayType, "sampleType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKManualEntryValidationController validateMinimumAllowedDuration:ofType:](validationController, "validateMinimumAllowedDuration:ofType:", v15, v13);

  v17 = v16 != 2 && v5;
  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangeEntryItem, 0);
  objc_storeStrong((id *)&self->_activeEnergyEntryItem, 0);
  objc_storeStrong((id *)&self->_distanceEntryItem, 0);
  objc_storeStrong((id *)&self->_activityTypeEntryItem, 0);
  objc_storeStrong((id *)&self->_sectionsWithoutDistance, 0);
  objc_storeStrong((id *)&self->_sectionsWithDistance, 0);
  objc_storeStrong((id *)&self->_distanceType, 0);
  objc_storeStrong((id *)&self->_workoutActivityTypePairs, 0);
}

@end
