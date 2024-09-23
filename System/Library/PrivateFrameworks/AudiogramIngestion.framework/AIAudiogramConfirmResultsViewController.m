@implementation AIAudiogramConfirmResultsViewController

- (AIAudiogramConfirmResultsViewController)initWithDelegate:(id)a3 audiogram:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AIAudiogramConfirmResultsViewController *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  aiLocString(CFSTR("AudiogramIngestionResultsTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionConfirmResultsDetailTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)AIAudiogramConfirmResultsViewController;
  v10 = -[AIAudiogramConfirmResultsViewController initWithTitle:detailText:symbolName:contentLayout:](&v12, sel_initWithTitle_detailText_symbolName_contentLayout_, v8, v9, 0, 3);

  if (v10)
  {
    -[AIAudiogramConfirmResultsViewController setAudiogram:](v10, "setAudiogram:", v7);
    -[AIAudiogramConfirmResultsViewController setDelegate:](v10, "setDelegate:", v6);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  void *v18;
  objc_class *v19;
  id v20;
  void *v21;
  void *v22;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_super v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[5];
  _QWORD v71[3];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v60.receiver = self;
  v60.super_class = (Class)AIAudiogramConfirmResultsViewController;
  -[OBBaseWelcomeController viewDidLoad](&v60, sel_viewDidLoad);
  -[AIAudiogramConfirmResultsViewController healthStore](self, "healthStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  if (v3)
  {
    v66 = 0;
    v67 = &v66;
    v68 = 0x2050000000;
    v4 = (void *)getHKHealthStoreClass_softClass_1;
    v69 = getHKHealthStoreClass_softClass_1;
    if (!getHKHealthStoreClass_softClass_1)
    {
      v61 = MEMORY[0x24BDAC760];
      v62 = 3221225472;
      v63 = __getHKHealthStoreClass_block_invoke_1;
      v64 = &unk_24FD6CE58;
      v65 = &v66;
      __getHKHealthStoreClass_block_invoke_1((uint64_t)&v61);
      v4 = (void *)v67[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v66, 8);
    v6 = objc_alloc_init(v5);
    -[AIAudiogramConfirmResultsViewController setHealthStore:](self, "setHealthStore:", v6);

  }
  -[AIAudiogramConfirmResultsViewController unitPreferenceController](self, "unitPreferenceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    v66 = 0;
    v67 = &v66;
    v68 = 0x2050000000;
    v9 = (void *)getHKUnitPreferenceControllerClass_softClass_1;
    v69 = getHKUnitPreferenceControllerClass_softClass_1;
    if (!getHKUnitPreferenceControllerClass_softClass_1)
    {
      v61 = MEMORY[0x24BDAC760];
      v62 = 3221225472;
      v63 = __getHKUnitPreferenceControllerClass_block_invoke_1;
      v64 = &unk_24FD6CE58;
      v65 = &v66;
      __getHKUnitPreferenceControllerClass_block_invoke_1((uint64_t)&v61);
      v9 = (void *)v67[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v66, 8);
    v11 = [v10 alloc];
    -[AIAudiogramConfirmResultsViewController healthStore](self, "healthStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithHealthStore:", v12);
    -[AIAudiogramConfirmResultsViewController setUnitPreferenceController:](self, "setUnitPreferenceController:", v13);

  }
  v66 = 0;
  v67 = &v66;
  v68 = 0x2050000000;
  v14 = (void *)getHKSampleTypeUpdateControllerClass_softClass_1;
  v69 = getHKSampleTypeUpdateControllerClass_softClass_1;
  if (!getHKSampleTypeUpdateControllerClass_softClass_1)
  {
    v61 = MEMORY[0x24BDAC760];
    v62 = 3221225472;
    v63 = __getHKSampleTypeUpdateControllerClass_block_invoke_1;
    v64 = &unk_24FD6CE58;
    v65 = &v66;
    __getHKSampleTypeUpdateControllerClass_block_invoke_1((uint64_t)&v61);
    v14 = (void *)v67[3];
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v66, 8);
  v16 = [v15 alloc];
  -[AIAudiogramConfirmResultsViewController healthStore](self, "healthStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v16, "initWithHealthStore:", v17);

  v66 = 0;
  v67 = &v66;
  v68 = 0x2050000000;
  v18 = (void *)getHKAudiogramChartViewControllerClass_softClass_1;
  v69 = getHKAudiogramChartViewControllerClass_softClass_1;
  if (!getHKAudiogramChartViewControllerClass_softClass_1)
  {
    v61 = MEMORY[0x24BDAC760];
    v62 = 3221225472;
    v63 = __getHKAudiogramChartViewControllerClass_block_invoke_1;
    v64 = &unk_24FD6CE58;
    v65 = &v66;
    __getHKAudiogramChartViewControllerClass_block_invoke_1((uint64_t)&v61);
    v18 = (void *)v67[3];
  }
  v19 = objc_retainAutorelease(v18);
  _Block_object_dispose(&v66, 8);
  v20 = [v19 alloc];
  -[AIAudiogramConfirmResultsViewController unitPreferenceController](self, "unitPreferenceController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithUnitController:sampleTypeUpdateController:minimumAudiogramHeight:", v21, v58, 400.0);

  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AIAudiogramConfirmResultsViewController audiogram](self, "audiogram");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAudiograms:", v25);

  objc_msgSend(v22, "setIsAccessibilityElement:", 1);
  -[AIAudiogramConfirmResultsViewController contentView](self, "contentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  -[AIAudiogramConfirmResultsViewController addChildViewController:](self, "addChildViewController:", v22);
  v42 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v22, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramConfirmResultsViewController contentView](self, "contentView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v53;
  objc_msgSend(v22, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramConfirmResultsViewController contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, 16.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v48;
  objc_msgSend(v22, "view");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramConfirmResultsViewController contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -16.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v43;
  objc_msgSend(v22, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramConfirmResultsViewController contentView](self, "contentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, -16.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v32;
  objc_msgSend(v22, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", 400.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v36);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionConfirmResultsSaveButton"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setTitle:forState:", v38, 0);

  objc_msgSend(v37, "addTarget:action:forControlEvents:", self, sel__saveToHealth_, 64);
  -[AIAudiogramConfirmResultsViewController buttonTray](self, "buttonTray");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addButton:", v37);

  -[AIAudiogramConfirmResultsViewController buttonTray](self, "buttonTray");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setBackgroundColor:", v41);

}

- (void)_saveToHealth:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[AIAudiogramConfirmResultsViewController healthStore](self, "healthStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramConfirmResultsViewController audiogram](self, "audiogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke;
  v7[3] = &unk_24FD6D628;
  v7[4] = self;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v5, "saveObject:withCompletion:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke_196;
    block[3] = &unk_24FD6CDA0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v6, block);

    objc_copyWeak(&v8, (id *)(a1 + 40));
    AXPerformBlockOnMainThread();
    objc_destroyWeak(&v8);
  }
  else
  {
    AXLogAudiogram();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_cold_1((uint64_t)v5, v7);

  }
}

void __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke_196(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("adjusted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "analyticsDidMakeAdjustments"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v10[1] = CFSTR("completed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "analyticsDidCompleteIngestion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v3;
  v10[2] = CFSTR("import_source");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsImportSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v4;
  v10[3] = CFSTR("client");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "analyticsClient"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogAggregate();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_22FB4F000, v7, OS_LOG_TYPE_INFO, "Audiogram Ingestion completed: %@", (uint8_t *)&v8, 0xCu);
  }

  AnalyticsSendEvent();
}

void __57__AIAudiogramConfirmResultsViewController__saveToHealth___block_invoke_210(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "audiogram");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "audiogramIngestionDidSaveAudiogram:", v5);

  }
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
  objc_storeStrong((id *)&self->_unitPreferenceController, a3);
}

- (BOOL)analyticsDidMakeAdjustments
{
  return self->_analyticsDidMakeAdjustments;
}

- (void)setAnalyticsDidMakeAdjustments:(BOOL)a3
{
  self->_analyticsDidMakeAdjustments = a3;
}

- (BOOL)analyticsDidCompleteIngestion
{
  return self->_analyticsDidCompleteIngestion;
}

- (void)setAnalyticsDidCompleteIngestion:(BOOL)a3
{
  self->_analyticsDidCompleteIngestion = a3;
}

- (unint64_t)analyticsImportSource
{
  return self->_analyticsImportSource;
}

- (void)setAnalyticsImportSource:(unint64_t)a3
{
  self->_analyticsImportSource = a3;
}

- (unint64_t)analyticsClient
{
  return self->_analyticsClient;
}

- (void)setAnalyticsClient:(unint64_t)a3
{
  self->_analyticsClient = a3;
}

- (AIAudiogramConfirmResultsViewControllerDelegate)delegate
{
  return (AIAudiogramConfirmResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
  objc_storeStrong((id *)&self->_audiogram, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
