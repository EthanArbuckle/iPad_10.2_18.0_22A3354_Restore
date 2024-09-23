@implementation AIAudiogramFinalResultViewController

- (AIAudiogramFinalResultViewController)initWithAudiogram:(id)a3 selectedFrequencies:(id)a4 audiogramConfirmationDelegate:(id)a5 audiogramManualIngestionDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AIAudiogramFinalResultViewController *v14;
  AIAudiogramFinalResultViewController *v15;
  void *v16;
  objc_class *v17;
  id v18;
  void *v19;
  objc_class *v20;
  id v21;
  void *v22;
  objc_class *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
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
  id v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v50.receiver = self;
  v50.super_class = (Class)AIAudiogramFinalResultViewController;
  v14 = -[AIAudiogramFinalResultViewController initWithTitle:detailText:symbolName:contentLayout:](&v50, sel_initWithTitle_detailText_symbolName_contentLayout_, &stru_24FD6E4F8, 0, 0, 3);
  v15 = v14;
  if (v14)
  {
    -[AIAudiogramFinalResultViewController setAudiogramConfirmationDelegate:](v14, "setAudiogramConfirmationDelegate:", v12);
    -[AIAudiogramFinalResultViewController setAudiogramManualIngestionDelegate:](v15, "setAudiogramManualIngestionDelegate:", v13);
    -[AIAudiogramFinalResultViewController setFrequencies:](v15, "setFrequencies:", v11);
    -[AIAudiogramFinalResultViewController setAudiogram:](v15, "setAudiogram:", v10);
    v56 = 0;
    v57 = &v56;
    v58 = 0x2050000000;
    v16 = (void *)getHKHealthStoreClass_softClass_0;
    v59 = getHKHealthStoreClass_softClass_0;
    if (!getHKHealthStoreClass_softClass_0)
    {
      v51 = MEMORY[0x24BDAC760];
      v52 = 3221225472;
      v53 = __getHKHealthStoreClass_block_invoke_0;
      v54 = &unk_24FD6CE58;
      v55 = &v56;
      __getHKHealthStoreClass_block_invoke_0((uint64_t)&v51);
      v16 = (void *)v57[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v56, 8);
    v18 = objc_alloc_init(v17);
    -[AIAudiogramFinalResultViewController setHealthStore:](v15, "setHealthStore:", v18);

    v56 = 0;
    v57 = &v56;
    v58 = 0x2050000000;
    v19 = (void *)getHKAudiogramChartViewControllerClass_softClass_0;
    v59 = getHKAudiogramChartViewControllerClass_softClass_0;
    if (!getHKAudiogramChartViewControllerClass_softClass_0)
    {
      v51 = MEMORY[0x24BDAC760];
      v52 = 3221225472;
      v53 = __getHKAudiogramChartViewControllerClass_block_invoke_0;
      v54 = &unk_24FD6CE58;
      v55 = &v56;
      __getHKAudiogramChartViewControllerClass_block_invoke_0((uint64_t)&v51);
      v19 = (void *)v57[3];
    }
    v20 = objc_retainAutorelease(v19);
    _Block_object_dispose(&v56, 8);
    v21 = [v20 alloc];
    v56 = 0;
    v57 = &v56;
    v58 = 0x2050000000;
    v22 = (void *)getHKUnitPreferenceControllerClass_softClass_0;
    v59 = getHKUnitPreferenceControllerClass_softClass_0;
    if (!getHKUnitPreferenceControllerClass_softClass_0)
    {
      v51 = MEMORY[0x24BDAC760];
      v52 = 3221225472;
      v53 = __getHKUnitPreferenceControllerClass_block_invoke_0;
      v54 = &unk_24FD6CE58;
      v55 = &v56;
      __getHKUnitPreferenceControllerClass_block_invoke_0((uint64_t)&v51);
      v22 = (void *)v57[3];
    }
    v23 = objc_retainAutorelease(v22);
    _Block_object_dispose(&v56, 8);
    v24 = [v23 alloc];
    -[AIAudiogramFinalResultViewController healthStore](v15, "healthStore");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithHealthStore:", v25);
    v56 = 0;
    v57 = &v56;
    v58 = 0x2050000000;
    v27 = (void *)getHKSampleTypeUpdateControllerClass_softClass_0;
    v59 = getHKSampleTypeUpdateControllerClass_softClass_0;
    if (!getHKSampleTypeUpdateControllerClass_softClass_0)
    {
      v51 = MEMORY[0x24BDAC760];
      v52 = 3221225472;
      v53 = __getHKSampleTypeUpdateControllerClass_block_invoke_0;
      v54 = &unk_24FD6CE58;
      v55 = &v56;
      __getHKSampleTypeUpdateControllerClass_block_invoke_0((uint64_t)&v51);
      v27 = (void *)v57[3];
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v56, 8);
    v29 = [v28 alloc];
    -[AIAudiogramFinalResultViewController healthStore](v15, "healthStore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v29, "initWithHealthStore:", v30);
    v32 = (void *)objc_msgSend(v21, "initWithUnitController:sampleTypeUpdateController:minimumAudiogramHeight:", v26, v31, 400.0);
    -[AIAudiogramFinalResultViewController setChartViewController:](v15, "setChartViewController:", v32);

    -[AIAudiogramFinalResultViewController chartViewController](v15, "chartViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFinalResultViewController audiogram](v15, "audiogram");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAudiograms:", v35);

    -[AIAudiogramFinalResultViewController chartViewController](v15, "chartViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setBackgroundColor:", v38);

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFinalResultViewController setDoneButton:](v15, "setDoneButton:", v39);

    -[AIAudiogramFinalResultViewController doneButton](v15, "doneButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(CFSTR("AudiogramIngestionButtonDone"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTitle:forState:", v41, 0);

    -[AIAudiogramFinalResultViewController doneButton](v15, "doneButton");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addTarget:action:forControlEvents:", v15, sel__saveToHealth_, 64);

    -[AIAudiogramFinalResultViewController buttonTray](v15, "buttonTray");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFinalResultViewController doneButton](v15, "doneButton");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addButton:", v44);

    -[AIAudiogramFinalResultViewController enableDoneButton](v15, "enableDoneButton");
    v45 = objc_alloc(MEMORY[0x24BEBD410]);
    aiLocString(CFSTR("AudiogramIngestionImportOptionCancel"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v45, "initWithTitle:style:target:action:", v46, 0, v15, sel__cancelTapped_);

    -[OBBaseWelcomeController navigationItem](v15, "navigationItem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setRightBarButtonItem:", v47);

  }
  return v15;
}

- (void)_cancelTapped:(id)a3
{
  id v3;

  -[AIAudiogramFinalResultViewController audiogramManualIngestionDelegate](self, "audiogramManualIngestionDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelButtonTapped");

}

- (void)_editFrequencyTapped:(id)a3
{
  AIAudiogramFrequencySelectionViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AIAudiogramFrequencySelectionViewController *v10;

  v4 = [AIAudiogramFrequencySelectionViewController alloc];
  aiLocString(CFSTR("AudiogramFrequencyAddRemoveFrequenciesTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramFrequencyAddRemoveFrequenciesSubtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController frequencies](self, "frequencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController audiogramManualIngestionDelegate](self, "audiogramManualIngestionDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AIAudiogramFrequencySelectionViewController initWithTitle:detailText:selectedFrequencies:delegate:isModal:](v4, "initWithTitle:detailText:selectedFrequencies:delegate:isModal:", v5, v6, v7, v8, 1);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v10);
  -[AIAudiogramFinalResultViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_saveToHealth:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (-[AIAudiogramFinalResultViewController _isAudiogramValid](self, "_isAudiogramValid", a3))
  {
    -[AIAudiogramFinalResultViewController healthStore](self, "healthStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFinalResultViewController audiogram](self, "audiogram");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke;
    v6[3] = &unk_24FD6CEB0;
    v6[4] = self;
    objc_msgSend(v4, "saveObject:withCompletion:", v5, v6);

  }
}

void __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_18;
    block[3] = &unk_24FD6CDA0;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v6, block);

    AXPerformBlockOnMainThread();
  }
  else
  {
    AXLogAudiogram();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_cold_1((uint64_t)v5, v7);

  }
}

void __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_18(uint64_t a1)
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

void __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "audiogramConfirmationDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "audiogramConfirmationDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "audiogram");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "audiogramIngestionDidSaveAudiogram:", v4);

    objc_msgSend(*(id *)(a1 + 32), "audiogramManualIngestionDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completedAudiogramManualIngestion");

  }
}

- (void)enableDoneButton
{
  id v3;

  -[AIAudiogramFinalResultViewController doneButton](self, "doneButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", -[AIAudiogramFinalResultViewController _isAudiogramValid](self, "_isAudiogramValid"));

}

- (BOOL)_isAudiogramValid
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[AIAudiogramFinalResultViewController audiogram](self, "audiogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AIAudiogramFinalResultViewController audiogram](self, "audiogram");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sensitivityPoints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  id v33;
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
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  objc_super v114;
  _QWORD v115[11];
  _QWORD v116[4];

  v116[2] = *MEMORY[0x24BDAC8D0];
  v114.receiver = self;
  v114.super_class = (Class)AIAudiogramFinalResultViewController;
  -[OBBaseWelcomeController viewDidLoad](&v114, sel_viewDidLoad);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE240], *MEMORY[0x24BEBE258]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 0);
  aiLocString(CFSTR("AudiogramIngestionFinalResultsTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(v6, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v6, "setNumberOfLines:", 0);
  aiLocString(CFSTR("AudiogramIngestionFinalResultsSubtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  v9 = objc_alloc(MEMORY[0x24BEBD978]);
  v112 = v6;
  v113 = v3;
  v116[0] = v3;
  v116[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArrangedSubviews:", v10);

  objc_msgSend(v11, "setAxis:", 1);
  objc_msgSend(v11, "setSpacing:", 4.0);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);

  objc_msgSend(v11, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v11, "setLayoutMargins:", 4.0, 16.0, 4.0, 16.0);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AIAudiogramFinalResultViewController contentView](self, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v11);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_contentCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUserInteractionEnabled:", 0);

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AIAudiogramFinalResultViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v21);

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController addChildViewController:](self, "addChildViewController:", v22);

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "didMoveToParentViewController:", self);

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_setSafeAreaInsetsFrozen:", 1);

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safeUIViewForKey:", CFSTR("_contextStackView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setHidden:", 1);

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeUIViewForKey:", CFSTR("_currentValueView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setHidden:", 1);

  objc_opt_class();
  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "safeUIViewForKey:", CFSTR("_stackView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v32, "setLayoutMargins:", 12.0, 0.0, 12.0, 0.0);
  v33 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v111 = v32;
  v34 = (void *)objc_msgSend(v33, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AIAudiogramFinalResultViewController setTableView:](self, "setTableView:", v34);

  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setDataSource:", self);

  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDelegate:", self);

  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setScrollEnabled:", 0);

  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setBackgroundColor:", v40);

  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setSectionHeaderTopPadding:", 8.0);

  -[AIAudiogramFinalResultViewController contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", v43);

  -[AIAudiogramFinalResultViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setBackgroundColor:", v45);

  v86 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v11, "topAnchor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController contentView](self, "contentView");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "topAnchor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "constraintEqualToAnchor:constant:", v108, -50.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = v107;
  objc_msgSend(v11, "leadingAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController view](self, "view");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "leadingAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:", v104);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = v103;
  objc_msgSend(v11, "trailingAnchor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController view](self, "view");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "trailingAnchor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "constraintEqualToAnchor:", v100);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v115[2] = v99;
  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "view");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "topAnchor");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "constraintEqualToAnchor:", v95);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v115[3] = v94;
  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "view");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "leadingAnchor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController view](self, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "leadingAnchor");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "constraintEqualToAnchor:", v89);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v115[4] = v88;
  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "trailingAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController view](self, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "trailingAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v81);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v115[5] = v80;
  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "view");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "heightAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController view](self, "view");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "heightAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:multiplier:", v75, 0.4);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v115[6] = v74;
  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "topAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "bottomAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "constraintEqualToAnchor:", v69);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v115[7] = v68;
  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "leadingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController view](self, "view");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "leadingAnchor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "constraintEqualToAnchor:", v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v115[8] = v63;
  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "trailingAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v115[9] = v48;
  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController contentView](self, "contentView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "bottomAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:", v52);
  v85 = v11;
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v115[10] = v53;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v115, 11);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "activateConstraints:", v54);

  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_opt_class();
  +[AIAudiogramFrequencyInputCell reuseIdentifier](AIAudiogramFrequencyInputCell, "reuseIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "registerClass:forCellReuseIdentifier:", v56, v57);

  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_opt_class();
  +[AIAudiogramV2ResultDateCell reuseIdentifier](AIAudiogramV2ResultDateCell, "reuseIdentifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "registerClass:forCellReuseIdentifier:", v59, v60);

  -[AIAudiogramFinalResultViewController _updateMaxHearingLevelWidth](self, "_updateMaxHearingLevelWidth");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AIAudiogramFinalResultViewController;
  -[AIAudiogramFinalResultViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  if (!-[AIAudiogramFinalResultViewController didAddBackgroundLayer](self, "didAddBackgroundLayer"))
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

    -[AIAudiogramFinalResultViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    -[AIAudiogramFinalResultViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    objc_msgSend(v4, "setFrame:", 0.0, 0.0, v8, v10 * 0.4);

    -[AIAudiogramFinalResultViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertSublayer:atIndex:", v4, 0);

    -[AIAudiogramFinalResultViewController setDidAddBackgroundLayer:](self, "setDidAddBackgroundLayer:", 1);
  }
}

- (void)contentCategoryDidChange:(id)a3
{
  void *v4;

  -[AIAudiogramFinalResultViewController _updateMaxHearingLevelWidth](self, "_updateMaxHearingLevelWidth", a3);
  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[AIAudiogramFinalResultViewController _updateTableViewHeight](self, "_updateTableViewHeight");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[AIAudiogramFinalResultViewController _updateTableViewHeight](self, "_updateTableViewHeight");
  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramFinalResultViewController;
  -[OBBaseWelcomeController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
}

- (void)_updateTableViewHeight
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[UITableView layoutIfNeeded](self->_tableView, "layoutIfNeeded");
  -[UITableView contentSize](self->_tableView, "contentSize");
  v4 = v3 + 100.0;
  -[AIAudiogramFinalResultViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[AIAudiogramFinalResultViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AIAudiogramFinalResultViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "heightAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToConstant:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramFinalResultViewController setTableViewHeightConstraint:](self, "setTableViewHeightConstraint:", v12);

      -[AIAudiogramFinalResultViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActive:", 1);
      goto LABEL_7;
    }
  }
  -[AIAudiogramFinalResultViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constant");
  v8 = v7;

  if (v4 == v8)
    return;
  -[AIAudiogramFinalResultViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", v4);
LABEL_7:

}

- (void)reloadAudiogram:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramFinalResultViewController setAudiogram:](self, "setAudiogram:", a3);
  -[AIAudiogramFinalResultViewController audiogram](self, "audiogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    -[AIAudiogramFinalResultViewController audiogram](self, "audiogram");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAudiograms:", v8);

  }
  else
  {
    objc_msgSend(v5, "setAudiograms:", MEMORY[0x24BDBD1A8]);
  }

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_resetCurrentGraph");

  -[AIAudiogramFinalResultViewController chartViewController](self, "chartViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_updateHeaderState");

  -[AIAudiogramFinalResultViewController _updateMaxHearingLevelWidth](self, "_updateMaxHearingLevelWidth");
  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  -[AIAudiogramFinalResultViewController enableDoneButton](self, "enableDoneButton");
}

- (void)updateFrequencies:(id)a3
{
  id v4;

  -[AIAudiogramFinalResultViewController setFrequencies:](self, "setFrequencies:", a3);
  -[AIAudiogramFinalResultViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)_updateMaxHearingLevelWidth
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  AIAudiogramFinalResultViewController *v52;
  id obj;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  _QWORD v61[3];

  v61[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(getHKUnitClass_0(), "decibelHearingLevelUnit");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionDecibelAbbreviation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = *MEMORY[0x24BEBD270];
  objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD17C8];
  aiLocString(CFSTR("AudiogramIngestionResultsFrequency"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionResultsNoData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v9;
  objc_msgSend(v9, "sizeWithAttributes:", v5);
  v11 = v10;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v52 = self;
  -[AIAudiogramFinalResultViewController audiogram](self, "audiogram");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sensitivityPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v13;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v56;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v56 != v16)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v20, "leftEarSensitivity");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v20, "leftEarSensitivity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValueForUnit:", v54);
          v24 = v23;

          v25 = (void *)MEMORY[0x24BDD17C8];
          aiLocString(CFSTR("AudiogramIngestionResultsFrequency"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", v26, v27, v3);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "sizeWithAttributes:", v5);
          v18 = fmax(v18, v29);

        }
        objc_msgSend(v20, "rightEarSensitivity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v20, "rightEarSensitivity");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValueForUnit:", v54);
          v33 = v32;

          v34 = (void *)MEMORY[0x24BDD17C8];
          aiLocString(CFSTR("AudiogramIngestionResultsFrequency"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", v35, v36, v3);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v37, "sizeWithAttributes:", v5);
          v17 = fmax(v17, v38);

        }
        v39 = fmax(v18, v11);
        v40 = fmax(v17, v11);
        if (v30)
          v40 = v17;
        if (v21)
          v17 = v40;
        else
          v18 = v39;
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v15);
  }
  else
  {
    v17 = 0.0;
    v18 = 0.0;
  }

  -[AIAudiogramFinalResultViewController audiogram](v52, "audiogram");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sensitivityPoints");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "count");
  -[AIAudiogramFinalResultViewController frequencies](v52, "frequencies");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "count");

  v46 = fmax(v18, v11);
  v47 = fmax(v17, v11);
  if (v43 == v45)
    v48 = v17;
  else
    v48 = v47;
  if (v43 == v45)
    v46 = v18;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController setMaxLeftHearingLevelWidth:](v52, "setMaxLeftHearingLevelWidth:", v49);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramFinalResultViewController setMaxRightHearingLevelWidth:](v52, "setMaxRightHearingLevelWidth:", v50);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__1;
    v41 = __Block_byref_object_dispose__1;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__1;
    v35 = __Block_byref_object_dispose__1;
    v36 = 0;
    -[AIAudiogramFinalResultViewController frequencies](self, "frequencies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(getHKUnitClass_0(), "decibelHearingLevelUnit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFinalResultViewController audiogram](self, "audiogram");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sensitivityPoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __72__AIAudiogramFinalResultViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v26 = &unk_24FD6CED8;
    v13 = v9;
    v27 = v13;
    v29 = &v37;
    v14 = v10;
    v28 = v14;
    v30 = &v31;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v23);

    +[AIAudiogramFrequencyInputCell reuseIdentifier](AIAudiogramFrequencyInputCell, "reuseIdentifier", v23, v24, v25, v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[AIAudiogramFinalResultViewController maxLeftHearingLevelWidth](self, "maxLeftHearingLevelWidth");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLeftEarLabelWidth:", v17);

    -[AIAudiogramFinalResultViewController maxRightHearingLevelWidth](self, "maxRightHearingLevelWidth");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightEarLabelWidth:", v18);

    objc_msgSend(v16, "setFrequency:", v13);
    objc_msgSend(v16, "setLeftHearingLevel:", v38[5]);
    objc_msgSend(v16, "setRightHearingLevel:", v32[5]);
    objc_msgSend(v16, "configureLayout");
    objc_msgSend(v16, "setAccessoryType:", 1);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

  }
  else
  {
    +[AIAudiogramV2ResultDateCell reuseIdentifier](AIAudiogramV2ResultDateCell, "reuseIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[AIAudiogramFinalResultViewController audiogramManualIngestionDelegate](self, "audiogramManualIngestionDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "getPickedDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDate:", v21);

    objc_msgSend(v16, "setDelegate:", self);
    objc_msgSend(v16, "setSelectionStyle:", 0);
    objc_msgSend(v16, "configureLayout");
  }

  return v16;
}

void __72__AIAudiogramFinalResultViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "frequency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass_0(), "hertzUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "doubleValue");
  v8 = v7;

  if (v6 == v8)
  {
    objc_msgSend(v21, "leftEarSensitivity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v21, "leftEarSensitivity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValueForUnit:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v10, "numberWithDouble:");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    objc_msgSend(v21, "rightEarSensitivity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v21, "rightEarSensitivity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValueForUnit:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v16, "numberWithDouble:");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  if (!a4)
    return 1;
  -[AIAudiogramFinalResultViewController frequencies](self, "frequencies", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(v10, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frequency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramFinalResultViewController audiogramManualIngestionDelegate](self, "audiogramManualIngestionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didSelectNodeToEditWithSelectedFrequency:", v8);

  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.01;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  AIAudiogramFinalResultViewController *v31;
  void *v32;
  void *v33;
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
  id v46;
  _QWORD v47[6];

  v47[4] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v5 = (objc_class *)MEMORY[0x24BEBDB00];
    v46 = a3;
    v6 = [v5 alloc];
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v8 = objc_alloc_init(MEMORY[0x24BEBD978]);
    -[AIAudiogramFinalResultViewController setStackView:](self, "setStackView:", v8);

    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAxis:", 1);

    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v11);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    aiLocString(CFSTR("AudiogramFrequencyAddRemoveFrequenciesTitle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTitle:forState:", v13, 0);

    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v14);

    objc_msgSend(v12, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNumberOfLines:", 0);

    objc_msgSend(v12, "setContentHorizontalAlignment:", 4);
    v45 = v12;
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__editFrequencyTapped_, 64);
    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addArrangedSubview:", v12);

    v36 = (void *)MEMORY[0x24BDD1628];
    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 16.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v41;
    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, -16.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v35;
    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    v39 = v7;
    objc_msgSend(v7, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 14.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v22;
    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[3] = v26;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v27);

    -[AIAudiogramFinalResultViewController stackView](self, "stackView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutIfNeeded");

    objc_msgSend(v46, "frame");
    v30 = v29;

    v31 = self;
    v32 = v39;
    -[AIAudiogramFinalResultViewController stackView](v31, "stackView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    objc_msgSend(v39, "setFrame:", 0.0, 0.0, v30);

  }
  else
  {
    v32 = 0;
  }
  return v32;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  result = *MEMORY[0x24BEBE770];
  if (!a4)
    return 0.01;
  return result;
}

- (void)dateCellDidPickDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AIAudiogramFinalResultViewController audiogramManualIngestionDelegate](self, "audiogramManualIngestionDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAudiogramDate:", v4);

}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
{
  objc_storeStrong((id *)&self->_initialDate, a3);
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

- (UIViewController)chartViewController
{
  return self->_chartViewController;
}

- (void)setChartViewController:(id)a3
{
  objc_storeStrong((id *)&self->_chartViewController, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, a3);
}

- (NSIndexPath)activeIndexPath
{
  return self->_activeIndexPath;
}

- (void)setActiveIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_activeIndexPath, a3);
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
  objc_storeStrong((id *)&self->_audiogram, a3);
}

- (NSArray)frequencies
{
  return self->_frequencies;
}

- (void)setFrequencies:(id)a3
{
  objc_storeStrong((id *)&self->_frequencies, a3);
}

- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate
{
  return (AIAudiogramConfirmResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_audiogramConfirmationDelegate);
}

- (void)setAudiogramConfirmationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audiogramConfirmationDelegate, a3);
}

- (AIAudiogramManualIngestionDelegate)audiogramManualIngestionDelegate
{
  return (AIAudiogramManualIngestionDelegate *)objc_loadWeakRetained((id *)&self->_audiogramManualIngestionDelegate);
}

- (void)setAudiogramManualIngestionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audiogramManualIngestionDelegate, a3);
}

- (OBBoldTrayButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_doneButton, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (NSNumber)maxLeftHearingLevelWidth
{
  return self->_maxLeftHearingLevelWidth;
}

- (void)setMaxLeftHearingLevelWidth:(id)a3
{
  objc_storeStrong((id *)&self->_maxLeftHearingLevelWidth, a3);
}

- (NSNumber)maxRightHearingLevelWidth
{
  return self->_maxRightHearingLevelWidth;
}

- (void)setMaxRightHearingLevelWidth:(id)a3
{
  objc_storeStrong((id *)&self->_maxRightHearingLevelWidth, a3);
}

- (BOOL)didAddBackgroundLayer
{
  return self->_didAddBackgroundLayer;
}

- (void)setDidAddBackgroundLayer:(BOOL)a3
{
  self->_didAddBackgroundLayer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxRightHearingLevelWidth, 0);
  objc_storeStrong((id *)&self->_maxLeftHearingLevelWidth, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_destroyWeak((id *)&self->_audiogramManualIngestionDelegate);
  objc_destroyWeak((id *)&self->_audiogramConfirmationDelegate);
  objc_storeStrong((id *)&self->_frequencies, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_activeIndexPath, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_chartViewController, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
}

void __54__AIAudiogramFinalResultViewController__saveToHealth___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22FB4F000, a2, OS_LOG_TYPE_ERROR, "Failed to write audiogram sample to HK with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
