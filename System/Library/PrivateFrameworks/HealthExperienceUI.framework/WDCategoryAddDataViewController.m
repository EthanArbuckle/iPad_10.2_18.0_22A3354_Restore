@implementation WDCategoryAddDataViewController

- (WDCategoryAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  WDCategoryAddDataViewController *v7;
  WDCategoryAddDataViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WDAddDataManualEntryItem *dateEntryItem;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  WDAddDataManualEntryItem *v17;
  void *v18;
  uint64_t v19;
  WDAddDataManualEntryItem *categoryValueEntryItem;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WDCategoryAddDataViewController;
  v7 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v22, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    if (-[WDCategoryAddDataViewController useSingleStartAndEndDate](v7, "useSingleStartAndEndDate"))
    {
      -[HKDateCache oneMinuteBeforeEndOfDayMidnight](v8->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      HABundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DATE"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:displayName:](WDAddDataManualEntryItem, "dateTimeItemWithMaximumDate:displayName:", v9, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      dateEntryItem = v8->_dateEntryItem;
      v8->_dateEntryItem = (WDAddDataManualEntryItem *)v12;

    }
    else
    {
      v14 = -[WDCategoryAddDataViewController useDuration](v8, "useDuration");
      -[HKDateCache oneMinuteBeforeEndOfDayMidnight](v8->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        +[WDAddDataManualEntryItem durationItemWithMaximumDate:](WDAddDataManualEntryItem, "durationItemWithMaximumDate:", v15);
      else
        +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:](WDAddDataManualEntryItem, "twoPartDateRangeItemWithMaximumEndDate:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v8->_dateEntryItem;
      v8->_dateEntryItem = (WDAddDataManualEntryItem *)v16;

      -[WDAddDataManualEntryItem setDelegate:](v8->_dateEntryItem, "setDelegate:", v8);
    }
    -[WDCategoryAddDataViewController _orderedTitlesForCategoryValuePicker](v8, "_orderedTitlesForCategoryValuePicker");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      +[WDAddDataManualEntryItem multiSelectItemWithEntries:selectedIndex:](WDAddDataManualEntryItem, "multiSelectItemWithEntries:selectedIndex:", v18, -[WDCategoryAddDataViewController _defaultSelectedIndex](v8, "_defaultSelectedIndex"));
      v19 = objc_claimAutoreleasedReturnValue();
      categoryValueEntryItem = v8->_categoryValueEntryItem;
      v8->_categoryValueEntryItem = (WDAddDataManualEntryItem *)v19;

    }
  }
  return v8;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDCategoryAddDataViewController;
  -[WDAddDataViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[WDCategoryAddDataViewController updateSavingEnabled](self, "updateSavingEnabled");
}

- (id)_orderedTitlesForCategoryValuePicker
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HKDisplayType hk_enumeratedValueLabels](self->super._displayType, "hk_enumeratedValueLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HKDisplayType wd_valueOrderForAddDataViewController](self->super._displayType, "wd_valueOrderForAddDataViewController", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (int64_t)_defaultSelectedIndex
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[HKDisplayType wd_defaultValueForAddDataViewController](self->super._displayType, "wd_defaultValueForAddDataViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKDisplayType wd_valueOrderForAddDataViewController](self->super._displayType, "wd_valueOrderForAddDataViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", v3);

    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 0;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)useSingleStartAndEndDate
{
  uint64_t v2;
  BOOL result;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = -[HKDisplayType displayTypeIdentifier](self->super._displayType, "displayTypeIdentifier");
  result = 1;
  if ((unint64_t)(v2 - 91) > 6 || ((1 << (v2 - 91)) & 0x63) == 0)
  {
    v5 = v2 - 236;
    v6 = v5 > 8;
    v7 = (1 << v5) & 0x181;
    if (v6 || v7 == 0)
      return 0;
  }
  return result;
}

- (BOOL)useDuration
{
  uint64_t v2;

  v2 = -[HKDisplayType displayTypeIdentifier](self->super._displayType, "displayTypeIdentifier");
  return v2 == 189 || v2 == 237;
}

- (BOOL)_hasCategoryValueEntryItem
{
  return self->_categoryValueEntryItem != 0;
}

- (int64_t)numberOfSections
{
  if (-[WDCategoryAddDataViewController _hasCategoryValueEntryItem](self, "_hasCategoryValueEntryItem"))
    return 2;
  else
    return 1;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  WDAddDataManualEntryItem **p_categoryValueEntryItem;
  WDAddDataManualEntryItem *dateEntryItem;
  WDAddDataManualEntryItem *categoryValueEntryItem;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (-[WDCategoryAddDataViewController _hasCategoryValueEntryItem](self, "_hasCategoryValueEntryItem"))
  {
    if (a3)
    {
      if (a3 != 1)
        return MEMORY[0x1E0C9AA60];
      v9[0] = self->_dateEntryItem;
      p_categoryValueEntryItem = (WDAddDataManualEntryItem **)v9;
    }
    else
    {
      categoryValueEntryItem = self->_categoryValueEntryItem;
      p_categoryValueEntryItem = &categoryValueEntryItem;
    }
  }
  else
  {
    dateEntryItem = self->_dateEntryItem;
    p_categoryValueEntryItem = &dateEntryItem;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_categoryValueEntryItem, 1, dateEntryItem, categoryValueEntryItem, v9[0]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateHKObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[WDCategoryAddDataViewController selectedDateRange](self, "selectedDateRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_categoryValueEntryItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (-[WDCategoryAddDataViewController _hasCategoryValueEntryItem](self, "_hasCategoryValueEntryItem"))
  {
    -[HKDisplayType wd_valueOrderForAddDataViewController](self->super._displayType, "wd_valueOrderForAddDataViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

  }
  else
  {
    v8 = 0;
  }
  -[WDAddDataViewController defaultMetadata](self, "defaultMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB6378];
  -[HKDisplayType sampleType](self->super._displayType, "sampleType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "categorySampleWithType:value:startDate:endDate:metadata:", v11, v8, v12, v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (HKValueRange)selectedDateRange
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;

  v3 = -[WDCategoryAddDataViewController useSingleStartAndEndDate](self, "useSingleStartAndEndDate");
  -[WDAddDataManualEntryItem generateValue](self->_dateEntryItem, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D2F8E0], "valueRangeWithMinValue:maxValue:", v4, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return (HKValueRange *)v4;
}

- (void)validateDataWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HKDisplayType sampleType](self->super._displayType, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WDCategoryAddDataViewController useSingleStartAndEndDate](self, "useSingleStartAndEndDate")
    || !objc_msgSend(v4, "isMaximumDurationRestricted"))
  {
    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, 1, 0, 0);
  }
  else
  {
    -[WDCategoryAddDataViewController selectedDateRange](self, "selectedDateRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDAddDataViewController validateMaximumAllowedDurationFor:endDate:competion:](self, "validateMaximumAllowedDurationFor:endDate:competion:", v6, v7, v8);

  }
}

- (void)updateSavingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  HKManualEntryValidationController *validationController;
  void *v9;
  uint64_t v10;
  HKManualEntryValidationController *v11;
  void *v12;
  uint64_t v13;
  WDCategoryAddDataViewController *v15;
  uint64_t v16;
  id v17;

  if (!-[WDCategoryAddDataViewController useSingleStartAndEndDate](self, "useSingleStartAndEndDate"))
  {
    -[WDCategoryAddDataViewController selectedDateRange](self, "selectedDateRange");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v3;
    if (!v3)
      goto LABEL_8;
    objc_msgSend(v3, "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    validationController = self->super._validationController;
    -[HKDisplayType sampleType](self->super._displayType, "sampleType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKManualEntryValidationController validateMinimumAllowedDuration:ofType:](validationController, "validateMinimumAllowedDuration:ofType:", v9, v7);

    v11 = self->super._validationController;
    -[HKDisplayType sampleType](self->super._displayType, "sampleType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKManualEntryValidationController validateMaximumAllowedDuration:ofType:](v11, "validateMaximumAllowedDuration:ofType:", v12, v7);

    if (v10 == 2 || v13 == 2)
    {
LABEL_8:
      v15 = self;
      v16 = 0;
    }
    else
    {
      v15 = self;
      v16 = 1;
    }
    -[WDAddDataViewController setSavingEnabled:](v15, "setSavingEnabled:", v16);

  }
}

- (WDAddDataManualEntryItem)categoryValueEntryItem
{
  return self->_categoryValueEntryItem;
}

- (WDAddDataManualEntryItem)dateEntryItem
{
  return self->_dateEntryItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateEntryItem, 0);
  objc_storeStrong((id *)&self->_categoryValueEntryItem, 0);
}

- (id)_categoryCells
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
