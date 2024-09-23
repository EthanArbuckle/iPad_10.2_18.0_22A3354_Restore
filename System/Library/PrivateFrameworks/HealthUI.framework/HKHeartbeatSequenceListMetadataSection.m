@implementation HKHeartbeatSequenceListMetadataSection

- (HKHeartbeatSequenceListMetadataSection)initWithEvent:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKHeartbeatSequenceListMetadataSection *v17;
  HKHeartbeatSequenceListMetadataSection *v18;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HKHeartbeatSequenceListMetadataSection;
  v17 = -[HKHeartbeatSequenceListMetadataSection init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_delegate, v16);
    objc_storeStrong((id *)&v18->_displayTypeController, a5);
    objc_storeStrong((id *)&v18->_unitController, a6);
    objc_storeStrong((id *)&v18->_healthStore, a4);
    -[HKHeartbeatSequenceListMetadataSection _startAssociatedSequenceQueryForEvent:](v18, "_startAssociatedSequenceQueryForEvent:", v12);
  }

  return v18;
}

- (void)_startAssociatedSequenceQueryForEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id location;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesAssociatedWithSample:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3928]);
  v7 = (void *)objc_msgSend(v6, "initWithKey:ascending:", *MEMORY[0x1E0CB5E48], 1);
  objc_initWeak(&location, self);
  v8 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__HKHeartbeatSequenceListMetadataSection__startAssociatedSequenceQueryForEvent___block_invoke;
  v13[3] = &unk_1E9C41318;
  v13[4] = self;
  objc_copyWeak(&v14, &location);
  v11 = (void *)objc_msgSend(v8, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v9, v5, 0, v10, v13);

  -[HKHeartbeatSequenceListMetadataSection healthStore](self, "healthStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeQuery:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __80__HKHeartbeatSequenceListMetadataSection__startAssociatedSequenceQueryForEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "setSequencesSamples:", v6);
    objc_msgSend(WeakRetained, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heartbeatSequecesListQueryComplete:", WeakRetained);

  }
  else
  {
    v11 = objc_msgSend(v7, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB52F0];
    v13 = *MEMORY[0x1E0CB52F0];
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

- (id)sectionTitle
{
  void *v2;
  void *v3;

  if (-[HKHeartbeatSequenceListMetadataSection numberOfRowsInSection](self, "numberOfRowsInSection"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ATRIAL_FIBRILLATION_ASSOCIATED_SEQUENCE_SECTION_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Antimony"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)numberOfRowsInSection
{
  void *v2;
  unint64_t v3;

  -[HKHeartbeatSequenceListMetadataSection sequencesSamples](self, "sequencesSamples");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HKHeartbeatSequenceListMetadataSection sequencesSamples](self, "sequencesSamples", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HKLocalizedStringForDateAndTemplate(v7, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v7, 27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("_CellReuseIdentifier"));
  objc_msgSend(v10, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v8);

  objc_msgSend(v10, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v9);

  objc_msgSend(v10, "setAccessoryType:", 1);
  return v10;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  HKBeatToBeatViewController *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  -[HKHeartbeatSequenceListMetadataSection sequencesSamples](self, "sequencesSamples");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = -[HKBeatToBeatViewController initWithHeartbeatSeriesSample:healthStore:displayTypeController:unitController:]([HKBeatToBeatViewController alloc], "initWithHeartbeatSeriesSample:healthStore:displayTypeController:unitController:", v11, self->_healthStore, self->_displayTypeController, self->_unitController);
  objc_msgSend(v8, "pushViewController:animated:", v10, v5);

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeController, a3);
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (HKHeartbeatSequenceListMetadataSectionDelegate)delegate
{
  return (HKHeartbeatSequenceListMetadataSectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)sequencesSamples
{
  return self->_sequencesSamples;
}

- (void)setSequencesSamples:(id)a3
{
  objc_storeStrong((id *)&self->_sequencesSamples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequencesSamples, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
