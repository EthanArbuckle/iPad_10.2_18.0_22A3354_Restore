@implementation WDInsulinDeliveryAddDataViewController

- (WDAddDataManualEntryItem)dateTimeEntryItem
{
  WDAddDataManualEntryItem *dateTimeEntryItem;
  void *v4;
  WDAddDataManualEntryItem *v5;
  WDAddDataManualEntryItem *v6;

  dateTimeEntryItem = self->_dateTimeEntryItem;
  if (!dateTimeEntryItem)
  {
    -[HKDateCache endOfDayMidnight](self->super.super._dateCache, "endOfDayMidnight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem twoPartDateRangeItemWithMaximumEndDate:](WDAddDataManualEntryItem, "twoPartDateRangeItemWithMaximumEndDate:", v4);
    v5 = (WDAddDataManualEntryItem *)objc_claimAutoreleasedReturnValue();
    v6 = self->_dateTimeEntryItem;
    self->_dateTimeEntryItem = v5;

    -[WDAddDataManualEntryItem setDelegate:](self->_dateTimeEntryItem, "setDelegate:", self);
    dateTimeEntryItem = self->_dateTimeEntryItem;
  }
  return dateTimeEntryItem;
}

- (WDAddDataManualEntrySpinner)deliveryReasonEntryItem
{
  WDAddDataManualEntrySpinner *deliveryReasonEntryItem;
  WDAddDataManualEntrySpinner *v4;
  void *v5;
  void *v6;
  WDAddDataManualEntrySpinner *v7;
  WDAddDataManualEntrySpinner *v8;

  deliveryReasonEntryItem = self->_deliveryReasonEntryItem;
  if (!deliveryReasonEntryItem)
  {
    v4 = [WDAddDataManualEntrySpinner alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", *MEMORY[0x1E0CB5560], &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WDAddDataManualEntrySpinner initWithDisplayName:](v4, "initWithDisplayName:", v6);
    v8 = self->_deliveryReasonEntryItem;
    self->_deliveryReasonEntryItem = v7;

    -[WDAddDataManualEntrySpinner setDataSource:](self->_deliveryReasonEntryItem, "setDataSource:", self);
    -[WDAddDataManualEntrySpinner set_wd_deliveryReason:](self->_deliveryReasonEntryItem, "set_wd_deliveryReason:", 2);
    deliveryReasonEntryItem = self->_deliveryReasonEntryItem;
  }
  return deliveryReasonEntryItem;
}

- (id)defaultMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WDInsulinDeliveryAddDataViewController;
  -[WDAddDataViewController defaultMetadata](&v10, sel_defaultMetadata);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA70];
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[WDInsulinDeliveryAddDataViewController deliveryReasonEntryItem](self, "deliveryReasonEntryItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "_wd_deliveryReason"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CB5560]);

  return v5;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  if (a3)
    return MEMORY[0x1E0C9AA60];
  -[WDInsulinDeliveryAddDataViewController dateTimeEntryItem](self, "dateTimeEntryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDisplayTypeAddDataViewController valueFieldManualEntryItem](self, "valueFieldManualEntryItem", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  -[WDInsulinDeliveryAddDataViewController deliveryReasonEntryItem](self, "deliveryReasonEntryItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)generateHKObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[WDInsulinDeliveryAddDataViewController dateTimeEntryItem](self, "dateTimeEntryItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WDInsulinDeliveryAddDataViewController defaultMetadata](self, "defaultMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDDisplayTypeAddDataViewController valueFieldManualEntryItem](self, "valueFieldManualEntryItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "generateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKDisplayType presentation](self->super.super._displayType, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjustedValueForClientValue:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKUnitPreferenceController unitForDisplayType:](self->super.super._unitController, "unitForDisplayType:", self->super.super._displayType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v11, "quantityWithUnit:doubleValue:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB6A40];
  -[HKDisplayType sampleType](self->super.super._displayType, "sampleType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v14, v12, v15, v16, v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    HABundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INSULIN_DELIVERY_REASON_HELP_TEXT"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (int64_t)numberOfRowsInManualEntrySpinner:(id)a3
{
  return 2;
}

- (id)manualEntrySpinner:(id)a3 titleForRow:(int64_t)a4
{
  return (id)HKUIStringForInsulinDeliveryReason();
}

- (void)manualEntryItemDidUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  HKManualEntryValidationController *validationController;
  void *v11;
  _BOOL8 v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WDInsulinDeliveryAddDataViewController;
  -[WDDisplayTypeAddDataViewController manualEntryItemDidUpdate:](&v13, sel_manualEntryItemDidUpdate_, a3);
  -[WDInsulinDeliveryAddDataViewController dateTimeEntryItem](self, "dateTimeEntryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  validationController = self->super.super._validationController;
  -[HKDisplayType sampleType](self->super.super._displayType, "sampleType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKManualEntryValidationController validateMinimumAllowedDuration:ofType:](validationController, "validateMinimumAllowedDuration:ofType:", v11, v9) != 2;

  -[WDAddDataViewController setSavingEnabled:](self, "setSavingEnabled:", v12);
}

- (void)validateDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[WDInsulinDeliveryAddDataViewController dateTimeEntryItem](self, "dateTimeEntryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generateValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__WDInsulinDeliveryAddDataViewController_validateDataWithCompletion___block_invoke;
  v10[3] = &unk_1E55757B0;
  objc_copyWeak(&v12, &location);
  v9 = v4;
  v10[4] = self;
  v11 = v9;
  -[WDAddDataViewController validateMaximumAllowedDurationFor:endDate:competion:](self, "validateMaximumAllowedDurationFor:endDate:competion:", v7, v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __69__WDInsulinDeliveryAddDataViewController_validateDataWithCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  objc_super v8;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((a2 & 1) != 0)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8.receiver = *(id *)(a1 + 32);
      v8.super_class = (Class)WDInsulinDeliveryAddDataViewController;
      objc_msgSendSuper2(&v8, sel_validateDataWithCompletion_, v7);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

}

- (void)setDateTimeEntryItem:(id)a3
{
  objc_storeStrong((id *)&self->_dateTimeEntryItem, a3);
}

- (void)setDeliveryReasonEntryItem:(id)a3
{
  objc_storeStrong((id *)&self->_deliveryReasonEntryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryReasonEntryItem, 0);
  objc_storeStrong((id *)&self->_dateTimeEntryItem, 0);
}

@end
