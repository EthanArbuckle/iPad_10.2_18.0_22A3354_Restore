@implementation WDElectrocardiogramAddDataViewController

- (WDElectrocardiogramAddDataViewController)initWithDisplayType:(id)a3 healthStore:(id)a4 unitController:(id)a5 initialStartDate:(id)a6 dateCache:(id)a7
{
  WDElectrocardiogramAddDataViewController *v7;
  WDElectrocardiogramAddDataViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  WDAddDataManualEntryItem *dateEntryItem;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  WDAddDataManualEntryItem *electrocardiogramClassificationEntryItem;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[8];

  v35[7] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)WDElectrocardiogramAddDataViewController;
  v7 = -[WDAddDataViewController initWithDisplayType:healthStore:unitController:initialStartDate:dateCache:](&v34, sel_initWithDisplayType_healthStore_unitController_initialStartDate_dateCache_, a3, a4, a5, a6, a7);
  v8 = v7;
  if (v7)
  {
    -[HKDateCache oneMinuteBeforeEndOfDayMidnight](v7->super._dateCache, "oneMinuteBeforeEndOfDayMidnight");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HABundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DATE"), &stru_1E55A2388, CFSTR("AddDataLocalization"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WDAddDataManualEntryItem dateTimeItemWithMaximumDate:displayName:](WDAddDataManualEntryItem, "dateTimeItemWithMaximumDate:displayName:", v9, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    dateEntryItem = v8->_dateEntryItem;
    v8->_dateEntryItem = (WDAddDataManualEntryItem *)v12;

    -[WDAddDataManualEntryItem setDelegate:](v8->_dateEntryItem, "setDelegate:", v8);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("SINUS_RHYTHM"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v32;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("HIGH_HEART_RATE"), &stru_1E55A2388, CFSTR("HealthUI-Localizable-Cinnamon"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v29;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v27;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("INCONCLUSIVE_LOW_HEART_RATE"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v14;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("INCONCLUSIVE_HIGH_HEART_RATE"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v16;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("INCONCLUSIVE_POOR_RECORDING"), &stru_1E55A2388, CFSTR("HealthUI-Localizable-Cinnamon"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKConditionallyRedactedHeartRhythmString();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[5] = v19;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("INCONCLUSIVE"), &stru_1E55A2388, CFSTR("HealthUI-Localizable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v35[6] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[WDAddDataManualEntryItem multiSelectItemWithEntries:selectedIndex:](WDAddDataManualEntryItem, "multiSelectItemWithEntries:selectedIndex:", v22, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    electrocardiogramClassificationEntryItem = v8->_electrocardiogramClassificationEntryItem;
    v8->_electrocardiogramClassificationEntryItem = (WDAddDataManualEntryItem *)v23;

  }
  return v8;
}

- (int64_t)numberOfSections
{
  return 2;
}

- (id)manualEntryItemsForSection:(int64_t)a3
{
  WDAddDataManualEntryItem **p_electrocardiogramClassificationEntryItem;
  void *v4;
  WDAddDataManualEntryItem *electrocardiogramClassificationEntryItem;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 != 1)
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
      return v4;
    }
    v7[0] = self->_dateEntryItem;
    p_electrocardiogramClassificationEntryItem = (WDAddDataManualEntryItem **)v7;
  }
  else
  {
    electrocardiogramClassificationEntryItem = self->_electrocardiogramClassificationEntryItem;
    p_electrocardiogramClassificationEntryItem = &electrocardiogramClassificationEntryItem;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", p_electrocardiogramClassificationEntryItem, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (void)saveHKObjectWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  unint64_t v6;
  double v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HKHealthStore *healthStore;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  -[WDAddDataManualEntryItem generateValue](self->_dateEntryItem, "generateValue");
  v4 = objc_claimAutoreleasedReturnValue();
  -[WDAddDataManualEntryItem generateValue](self->_electrocardiogramClassificationEntryItem, "generateValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 > 6)
  {
    v8 = 0;
    v9 = 0;
    v7 = 65.0;
  }
  else
  {
    v7 = dbl_1A9A9EE78[v6];
    v8 = off_1E5575550[v6];
    v9 = qword_1A9A9EEB0[v6];
  }
  -[WDElectrocardiogramAddDataViewController builderFromDataFile:startDate:](self, "builderFromDataFile:startDate:", v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0CB7288];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 136);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A28], "_quantityWithBeatsPerMinute:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAverageHeartRate:", v12);
  objc_msgSend(v10, "addClassification:", v9);
  objc_msgSend(v10, "finishWithDevice:metadata:", 0, v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "hk_heartRhythmDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", &unk_1E55CCF20, *MEMORY[0x1E0CB4D30]);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v13, 0);
  -[WDElectrocardiogramAddDataViewController symptomSamplesForElectrocardiogram:](self, "symptomSamplesForElectrocardiogram:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_map:", &__block_literal_global_1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUID");
  v18 = (void *)v4;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v19;
  v28 = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addObjectsFromArray:", v16);
  healthStore = self->super._healthStore;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__WDElectrocardiogramAddDataViewController_saveHKObjectWithCompletion___block_invoke_2;
  v25[3] = &unk_1E55753E8;
  v26 = v24;
  v22 = v24;
  -[HKHealthStore saveObjects:deleteObjects:associations:completion:](healthStore, "saveObjects:deleteObjects:associations:completion:", v15, 0, v20, v25);
  objc_msgSend(v13, "_setSymptomsStatus:", 2);

}

uint64_t __71__WDElectrocardiogramAddDataViewController_saveHKObjectWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

uint64_t __71__WDElectrocardiogramAddDataViewController_saveHKObjectWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)builderFromDataFile:(id)a3 startDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  HABundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLForResource:withExtension:", v6, CFSTR("eadf"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6648]), "initWithData:", v9);
  v11 = (void *)objc_msgSend(v10, "newBuilderWithStartDate:", v5);

  return v11;
}

- (id)symptomSamplesForElectrocardiogram:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
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
  void *v19;
  void *v20;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB6378];
  v4 = (void *)MEMORY[0x1E0CB6380];
  v5 = *MEMORY[0x1E0CB4960];
  v6 = a3;
  objc_msgSend(v4, "categoryTypeForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "categorySampleWithType:value:startDate:endDate:device:metadata:", v7, 0, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB6378];
  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48C0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "categorySampleWithType:value:startDate:endDate:device:metadata:", v14, 0, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v12;
  v22[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_electrocardiogramClassificationEntryItem, 0);
  objc_storeStrong((id *)&self->_dateEntryItem, 0);
}

@end
