@implementation HKBeatToBeatViewController

- (id)_initWithHealthStore:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKBeatToBeatViewController *v12;
  id *p_isa;
  void *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKBeatToBeatViewController;
  v12 = -[HKTableViewController initWithUsingInsetStyling:](&v17, sel_initWithUsingInsetStyling_, 1);
  p_isa = (id *)&v12->super.super.super.super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong(p_isa + 129, a4);
    objc_storeStrong(p_isa + 130, a5);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("BEAT_TO_BEAT_MEASUREMENTS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa, "setTitle:", v15);

  }
  return p_isa;
}

- (HKBeatToBeatViewController)initWithHeartbeatSeriesSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v10;
  HKBeatToBeatViewController *v11;
  uint64_t v12;
  NSArray *bpmPoints;

  v10 = a3;
  v11 = -[HKBeatToBeatViewController _initWithHealthStore:displayTypeController:unitController:](self, "_initWithHealthStore:displayTypeController:unitController:", a4, a5, a6);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB67A8], "instantaneousBPMsForHeartbeatSeriesSample:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    bpmPoints = v11->_bpmPoints;
    v11->_bpmPoints = (NSArray *)v12;

  }
  return v11;
}

- (HKBeatToBeatViewController)initWithHRVSample:(id)a3 healthStore:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v10;
  id v11;
  HKBeatToBeatViewController *v12;
  HKBeatToBeatViewController *v13;
  void *v14;
  _QWORD v16[4];
  HKBeatToBeatViewController *v17;

  v10 = a3;
  v11 = a4;
  v12 = -[HKBeatToBeatViewController _initWithHealthStore:displayTypeController:unitController:](self, "_initWithHealthStore:displayTypeController:unitController:", v11, a5, a6);
  v13 = v12;
  if (v12)
  {
    v14 = (void *)MEMORY[0x1E0CB67A8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke;
    v16[3] = &unk_1E9C426A0;
    v17 = v12;
    objc_msgSend(v14, "queryForParentSequenceOfHRV:healthStore:completion:", v10, v11, v16);

  }
  return v13;
}

void __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_192;
    v11[3] = &unk_1E9C3FC50;
    v12 = *(id *)(a1 + 32);
    v13 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  else
  {
    v8 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB52E8];
    v10 = *MEMORY[0x1E0CB52E8];
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_cold_1(a1, v9);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_cold_2(a1, v9);
    }
  }

}

uint64_t __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_192(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addHeartbeatSeriesSample:", *(_QWORD *)(a1 + 40));
}

- (void)_addHeartbeatSeriesSample:(id)a3
{
  NSArray *v4;
  NSArray *bpmPoints;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB67A8], "instantaneousBPMsForHeartbeatSeriesSample:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  bpmPoints = self->_bpmPoints;
  self->_bpmPoints = v4;

  -[HKBeatToBeatViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKBeatToBeatViewController;
  -[HKTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HKBeatToBeatViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAllowsSelection:", 0);

}

- (id)_displayStringForInstantaneousBPM:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HKDisplayTypeController displayTypeWithIdentifier:](self->_displayTypeController, "displayTypeWithIdentifier:", &unk_1E9CEB4C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValueForContext(v6, v5, self->_unitController, 0, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_displayStringForTime:(double)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplate(v3, 29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("CellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("CellIdentifier"));
  -[NSArray objectAtIndexedSubscript:](self->_bpmPoints, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bpm");
  -[HKBeatToBeatViewController _displayStringForInstantaneousBPM:](self, "_displayStringForInstantaneousBPM:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v8, "time");
  -[HKBeatToBeatViewController _displayStringForTime:](self, "_displayStringForTime:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_bpmPoints, "count", a3, a4);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BEATS_PER_MINUTE_NUMBERLESS_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

- (NSArray)bpmPoints
{
  return self->_bpmPoints;
}

- (void)setBpmPoints:(id)a3
{
  objc_storeStrong((id *)&self->_bpmPoints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bpmPoints, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_2_2(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_3();
  v4 = OUTLINED_FUNCTION_0_6(v3);
  _os_log_debug_impl(&dword_1D7813000, v2, OS_LOG_TYPE_DEBUG, "%@ HRV parent sample query returned error: %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

void __97__HKBeatToBeatViewController_initWithHRVSample_healthStore_displayTypeController_unitController___block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_2_2(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_3_3();
  v4 = OUTLINED_FUNCTION_0_6(v3);
  _os_log_error_impl(&dword_1D7813000, v2, OS_LOG_TYPE_ERROR, "%@ HRV parent sample query returned error: %@", v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

@end
