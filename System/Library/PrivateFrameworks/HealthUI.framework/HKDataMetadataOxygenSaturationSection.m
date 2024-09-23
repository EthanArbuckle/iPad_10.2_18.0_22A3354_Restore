@implementation HKDataMetadataOxygenSaturationSection

- (HKDataMetadataOxygenSaturationSection)initWithSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 subsampleDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKDataMetadataOxygenSaturationSection *v17;
  HKDataMetadataOxygenSaturationSection *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKDataMetadataOxygenSaturationSection;
  v17 = -[HKDataMetadataOxygenSaturationSection init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sample, a3);
    objc_storeStrong((id *)&v18->_healthStore, a4);
    objc_storeStrong((id *)&v18->_displayTypeController, a5);
    objc_storeStrong((id *)&v18->_unitController, a6);
    objc_storeWeak((id *)&v18->_subsampleDelegate, v16);
  }

  return v18;
}

- (id)sectionTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("RELATED_SAMPLES"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  return 1;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  HKDataMetadataSimpleTableViewCell *v5;
  HKDataMetadataSimpleTableViewCell *cell;
  HKDataMetadataSimpleTableViewCell *v7;
  HKDataMetadataSimpleTableViewCell *v8;
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
  HKDataMetadataSimpleTableViewCell *v21;

  objc_msgSend(a4, "dequeueReusableCellWithIdentifier:", CFSTR("heartRateCell"));
  v5 = (HKDataMetadataSimpleTableViewCell *)objc_claimAutoreleasedReturnValue();
  cell = self->_cell;
  self->_cell = v5;

  if (!self->_cell)
  {
    v7 = -[HKDataMetadataSimpleTableViewCell initWithReuseIdentifier:]([HKDataMetadataSimpleTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("heartRateCell"));
    v8 = self->_cell;
    self->_cell = v7;

  }
  objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataOxygenSaturationSection displayNameForSampleType:displayTypeController:](self, "displayNameForSampleType:displayTypeController:", v9, self->_displayTypeController);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SUBSAMPLE_TYPE_AVERAGE %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](self->_cell, "subtitleTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  if (self->_heartRateSample)
  {
    -[HKDataMetadataOxygenSaturationSection formattedHeartRateFromSample:](self, "formattedHeartRateFromSample:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleTableViewCell titleTextLabel](self->_cell, "titleTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    -[HKDataMetadataSimpleTableViewCell setAccessoryType:](self->_cell, "setAccessoryType:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("NO_AVERAGE_BEATS_PER_MINUTE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSimpleTableViewCell titleTextLabel](self->_cell, "titleTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

    -[HKDataMetadataSimpleTableViewCell setAccessoryType:](self->_cell, "setAccessoryType:", 0);
    -[HKDataMetadataOxygenSaturationSection queryForData](self, "queryForData");
  }
  v21 = self->_cell;

  return v21;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id v14;

  v5 = a5;
  v8 = a4;
  if (!a3 && self->_heartRateSample)
  {
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesAssociatedWithSample:", self->_sample);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataOxygenSaturationSection displayNameForSampleType:displayTypeController:](self, "displayNameForSampleType:displayTypeController:", v9, self->_displayTypeController);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_subsampleDelegate);
    objc_msgSend(WeakRetained, "viewControllerForSampleType:subSamplePredicate:title:", v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "pushViewController:animated:", v13, v5);
    v8 = v14;
  }

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (id)displayTypeController
{
  return self->_displayTypeController;
}

- (id)unitController
{
  return self->_unitController;
}

- (id)formattedHeartRateFromSample:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataOxygenSaturationSection heartRateFromSample:](self, "heartRateFromSample:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDisplayTypeController displayTypeForObjectType:](self->_displayTypeController, "displayTypeForObjectType:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormattedStringFromValue(v6, v7, self->_unitController, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKUnitPreferenceController localizedDisplayNameForDisplayType:value:](self->_unitController, "localizedDisplayNameForDisplayType:value:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKFormatValueAndUnit(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NO_AVERAGE_BEATS_PER_MINUTE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Scandium"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)queryForData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  objc_msgSend(MEMORY[0x1E0CB6B00], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesAssociatedWithSample:", self->_sample);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke;
  v7[3] = &unk_1E9C41318;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  v6 = (void *)objc_msgSend(v5, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v3, v4, 1, 0, v7);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (objc_msgSend(v8, "count"))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_204;
      v14[3] = &unk_1E9C412F0;
      objc_copyWeak(&v16, (id *)(a1 + 40));
      v15 = v8;
      dispatch_async(MEMORY[0x1E0C80D38], v14);

      objc_destroyWeak(&v16);
    }
  }
  else
  {
    v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB52E8];
    v13 = *MEMORY[0x1E0CB52E8];
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_cold_1(a1, v12);
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_cold_2(a1, v12);
    }
  }

}

void __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_204(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*((_QWORD *)WeakRetained + 7);
  *((_QWORD *)WeakRetained + 7) = v2;
  v4 = v2;

  objc_msgSend(WeakRetained, "formattedHeartRateFromSample:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)WeakRetained + 6), "titleTextLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(*((id *)WeakRetained + 6), "titleTextLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  objc_msgSend(*((id *)WeakRetained + 6), "setAccessoryType:", 1);
}

- (id)displayNameForSampleType:(id)a3 displayTypeController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "displayTypeForObjectType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "localization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)heartRateFromSample:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "quantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValueForUnit:", v5);
  objc_msgSend(v3, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartRateSample, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_destroyWeak((id *)&self->_subsampleDelegate);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

void __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_2_2(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_3();
  v4 = OUTLINED_FUNCTION_0_6(v3);
  _os_log_debug_impl(&dword_1D7813000, v2, OS_LOG_TYPE_DEBUG, "%@ associated sample query returned error: %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

void __53__HKDataMetadataOxygenSaturationSection_queryForData__block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_2_2(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_3();
  v4 = OUTLINED_FUNCTION_0_6(v3);
  _os_log_error_impl(&dword_1D7813000, v2, OS_LOG_TYPE_ERROR, "%@ associated sample query returned error: %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

@end
