@implementation AIAudiogramIndividualFrequencyInputViewController

- (AIAudiogramIndividualFrequencyInputViewController)initWithDelegate:(id)a3 audiogramConfirmationDelegate:(id)a4 audiogram:(id)a5 currentFrequency:(id)a6 isModalViewController:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  AIAudiogramIndividualFrequencyInputViewController *v15;
  AIAudiogramIndividualFrequencyInputViewController *v16;
  void *v17;
  objc_class *v18;
  id v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
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
  __CFString *v50;
  void *v51;
  void *v52;
  char *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v66;
  objc_super v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[2];

  v7 = a7;
  v77[1] = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v67.receiver = self;
  v67.super_class = (Class)AIAudiogramIndividualFrequencyInputViewController;
  v15 = -[AIAudiogramIndividualFrequencyInputViewController initWithTitle:detailText:symbolName:contentLayout:](&v67, sel_initWithTitle_detailText_symbolName_contentLayout_, &stru_24FD6E4F8, &stru_24FD6E4F8, 0, 3);
  v16 = v15;
  if (v15)
  {
    -[AIAudiogramIndividualFrequencyInputViewController setDelegate:](v15, "setDelegate:", v66);
    -[AIAudiogramIndividualFrequencyInputViewController setAudiogramConfirmationDelegate:](v16, "setAudiogramConfirmationDelegate:", v12);
    -[AIAudiogramIndividualFrequencyInputViewController setAudiogram:](v16, "setAudiogram:", v13);
    -[AIAudiogramIndividualFrequencyInputViewController setUserAddedFrequencyAfterOptical:](v16, "setUserAddedFrequencyAfterOptical:", 0);
    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v17 = (void *)getHKHealthStoreClass_softClass;
    v76 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      v68 = MEMORY[0x24BDAC760];
      v69 = 3221225472;
      v70 = __getHKHealthStoreClass_block_invoke;
      v71 = &unk_24FD6CE58;
      v72 = &v73;
      __getHKHealthStoreClass_block_invoke((uint64_t)&v68);
      v17 = (void *)v74[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v73, 8);
    v19 = objc_alloc_init(v18);
    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v20 = (void *)getHKAudiogramChartViewControllerClass_softClass;
    v76 = getHKAudiogramChartViewControllerClass_softClass;
    if (!getHKAudiogramChartViewControllerClass_softClass)
    {
      v68 = MEMORY[0x24BDAC760];
      v69 = 3221225472;
      v70 = __getHKAudiogramChartViewControllerClass_block_invoke;
      v71 = &unk_24FD6CE58;
      v72 = &v73;
      __getHKAudiogramChartViewControllerClass_block_invoke((uint64_t)&v68);
      v20 = (void *)v74[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v73, 8);
    v22 = [v21 alloc];
    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v23 = (void *)getHKUnitPreferenceControllerClass_softClass;
    v76 = getHKUnitPreferenceControllerClass_softClass;
    if (!getHKUnitPreferenceControllerClass_softClass)
    {
      v68 = MEMORY[0x24BDAC760];
      v69 = 3221225472;
      v70 = __getHKUnitPreferenceControllerClass_block_invoke;
      v71 = &unk_24FD6CE58;
      v72 = &v73;
      __getHKUnitPreferenceControllerClass_block_invoke((uint64_t)&v68);
      v23 = (void *)v74[3];
    }
    v24 = objc_retainAutorelease(v23);
    _Block_object_dispose(&v73, 8);
    v25 = (void *)objc_msgSend([v24 alloc], "initWithHealthStore:", v19);
    v73 = 0;
    v74 = &v73;
    v75 = 0x2050000000;
    v26 = (void *)getHKSampleTypeUpdateControllerClass_softClass;
    v76 = getHKSampleTypeUpdateControllerClass_softClass;
    if (!getHKSampleTypeUpdateControllerClass_softClass)
    {
      v68 = MEMORY[0x24BDAC760];
      v69 = 3221225472;
      v70 = __getHKSampleTypeUpdateControllerClass_block_invoke;
      v71 = &unk_24FD6CE58;
      v72 = &v73;
      __getHKSampleTypeUpdateControllerClass_block_invoke((uint64_t)&v68);
      v26 = (void *)v74[3];
    }
    v27 = objc_retainAutorelease(v26);
    _Block_object_dispose(&v73, 8);
    v28 = (void *)objc_msgSend([v27 alloc], "initWithHealthStore:", v19);
    v29 = (void *)objc_msgSend(v22, "initWithUnitController:sampleTypeUpdateController:minimumAudiogramHeight:", v25, v28, 400.0);
    -[AIAudiogramIndividualFrequencyInputViewController setChartViewController:](v16, "setChartViewController:", v29);

    -[AIAudiogramIndividualFrequencyInputViewController chartViewController](v16, "chartViewController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController audiogram](v16, "audiogram");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v77, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setAudiograms:", v32);

    -[AIAudiogramIndividualFrequencyInputViewController chartViewController](v16, "chartViewController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBackgroundColor:", v35);

    v36 = objc_alloc(MEMORY[0x24BEBD708]);
    v37 = (void *)objc_msgSend(v36, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AIAudiogramIndividualFrequencyInputViewController setFrequencyTitleLabel:](v16, "setFrequencyTitleLabel:", v37);

    -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v16, "frequencyTitleLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v16, "frequencyTitleLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x24BEBD5E0], "_preferredFontForTextStyle:weight:", *MEMORY[0x24BEBE240], *MEMORY[0x24BEBE258]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v16, "frequencyTitleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFont:", v40);

    -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v16, "frequencyTitleLabel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAdjustsFontForContentSizeCategory:", 1);

    -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](v16, "frequencyTitleLabel");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setNumberOfLines:", 0);

    -[AIAudiogramIndividualFrequencyInputViewController setCurrentFrequency:](v16, "setCurrentFrequency:", v14);
    v44 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v13, "sensitivityPoints");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "arrayWithArray:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController setSensitivityPoints:](v16, "setSensitivityPoints:", v46);

    -[AIAudiogramIndividualFrequencyInputViewController setSymbols:](v16, "setSymbols:", &unk_24FD77888);
    -[AIAudiogramIndividualFrequencyInputViewController symbols](v16, "symbols");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController setHasLeftSymbols:](v16, "setHasLeftSymbols:", objc_msgSend(v47, "containsObject:", &unk_24FD77440));

    -[AIAudiogramIndividualFrequencyInputViewController symbols](v16, "symbols");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController setHasRightSymbols:](v16, "setHasRightSymbols:", objc_msgSend(v48, "containsObject:", &unk_24FD77458));

    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController setFooterButton:](v16, "setFooterButton:", v49);

    if (v7)
      v50 = CFSTR("AudiogramIngestionButtonDone");
    else
      v50 = CFSTR("AudiogramIngestionButtonContinue");
    aiLocString(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController footerButton](v16, "footerButton");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setTitle:forState:", v51, 0);

    if (v7)
      v53 = sel__doneButtonTapped_;
    else
      v53 = sel__continueToNextFrequencyInput_;
    -[AIAudiogramIndividualFrequencyInputViewController footerButton](v16, "footerButton", v66);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addTarget:action:forControlEvents:", v16, v53, 64);

    v55 = objc_alloc(MEMORY[0x24BEBD410]);
    aiLocString(CFSTR("AudiogramIngestionImportOptionCancel"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v55, "initWithTitle:style:target:action:", v56, 0, v16, sel__cancelTapped_);

    v58 = objc_alloc(MEMORY[0x24BEBD410]);
    aiLocString(CFSTR("AudiogramIngestionButtonDone"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(v58, "initWithTitle:style:target:action:", v59, 0, v16, sel__doneButtonTapped_);

    if (-[AIAudiogramIndividualFrequencyInputViewController userAddedFrequencyAfterOptical](v16, "userAddedFrequencyAfterOptical"))
    {
      -[OBBaseWelcomeController navigationItem](v16, "navigationItem");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setLeftBarButtonItem:", v57);

      -[OBBaseWelcomeController navigationItem](v16, "navigationItem");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setRightBarButtonItem:", v60);
    }
    else
    {
      -[AIAudiogramIndividualFrequencyInputViewController buttonTray](v16, "buttonTray");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramIndividualFrequencyInputViewController footerButton](v16, "footerButton");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "addButton:", v64);

      -[OBBaseWelcomeController navigationItem](v16, "navigationItem");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "setRightBarButtonItem:", v57);
    }

  }
  return v16;
}

- (void)viewDidLoad
{
  AIAudiogramKeyboardToolbarForSensitivityPoint *v3;
  void *v4;
  AIAudiogramKeyboardToolbarForSensitivityPoint *v5;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  id v37;
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
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
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
  _QWORD v110[5];
  char v111;
  objc_super v112;
  _QWORD v113[11];
  _QWORD v114[3];

  v114[1] = *MEMORY[0x24BDAC8D0];
  v112.receiver = self;
  v112.super_class = (Class)AIAudiogramIndividualFrequencyInputViewController;
  -[OBBaseWelcomeController viewDidLoad](&v112, sel_viewDidLoad);
  v3 = [AIAudiogramKeyboardToolbarForSensitivityPoint alloc];
  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v5 = -[AIAudiogramKeyboardToolbarForSensitivityPoint initWithFrame:target:](v3, "initWithFrame:target:", self, 0.0, 0.0);
  -[AIAudiogramIndividualFrequencyInputViewController setKeyboardToolbar:](self, "setKeyboardToolbar:", v5);

  -[AIAudiogramIndividualFrequencyInputViewController setShouldAdjustScrollViewInsetForKeyboard:](self, "setShouldAdjustScrollViewInsetForKeyboard:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_contentCategoryDidChange_, *MEMORY[0x24BEBE088], 0);

  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", 0);

  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AIAudiogramIndividualFrequencyInputViewController contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v13);

  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController addChildViewController:](self, "addChildViewController:", v14);

  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didMoveToParentViewController:", self);

  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeUIViewForKey:", CFSTR("_contextStackView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setHidden:", 1);

  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeUIViewForKey:", CFSTR("_currentValueView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHidden:", 1);

  v111 = 0;
  objc_opt_class();
  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeUIViewForKey:", CFSTR("_stackView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v22, "setLayoutMargins:", 12.0, 0.0, 12.0, 0.0);
  v23 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v109 = v22;
  v24 = (void *)objc_msgSend(v23, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AIAudiogramIndividualFrequencyInputViewController setTableView:](self, "setTableView:", v24);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDataSource:", self);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setDelegate:", self);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setScrollEnabled:", 0);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSectionHeaderTopPadding:", 8.0);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAllowsSelection:", 0);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v32);

  -[AIAudiogramIndividualFrequencyInputViewController contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addSubview:", v34);

  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBackgroundColor:", v36);

  v37 = objc_alloc(MEMORY[0x24BEBD978]);
  -[AIAudiogramIndividualFrequencyInputViewController frequencyTitleLabel](self, "frequencyTitleLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v38;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v114, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v37, "initWithArrangedSubviews:", v39);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setBackgroundColor:", v41);

  objc_msgSend(v40, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v40, "setLayoutMargins:", 20.0, 16.0, 4.0, 16.0);
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[AIAudiogramIndividualFrequencyInputViewController contentView](self, "contentView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", v40);

  v83 = (void *)MEMORY[0x24BDD1628];
  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "view");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "topAnchor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController contentView](self, "contentView");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "topAnchor");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "constraintEqualToAnchor:constant:", v104, -50.0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v113[0] = v103;
  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "view");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "leadingAnchor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "leadingAnchor");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "constraintEqualToAnchor:", v98);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = v97;
  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "view");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "trailingAnchor");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "trailingAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "constraintEqualToAnchor:", v91);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v113[2] = v90;
  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "view");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "heightAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "heightAnchor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "constraintEqualToAnchor:multiplier:", v85, 0.4);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v113[3] = v84;
  objc_msgSend(v40, "topAnchor");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController chartViewController](self, "chartViewController");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "view");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "bottomAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "constraintEqualToAnchor:", v79);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v113[4] = v78;
  objc_msgSend(v40, "leadingAnchor");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "leadingAnchor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "constraintEqualToAnchor:", v75);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v113[5] = v74;
  v94 = v40;
  objc_msgSend(v40, "trailingAnchor");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "trailingAnchor");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "constraintEqualToAnchor:", v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v113[6] = v70;
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "topAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "constraintEqualToAnchor:", v67);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v113[7] = v66;
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "leadingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "leadingAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v113[8] = v61;
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "trailingAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v113[9] = v45;
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bottomAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v113[10] = v50;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 11);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "activateConstraints:", v51);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_opt_class();
  +[AIAudiogramIndividualFrequencyEarCell reuseIdentifier](AIAudiogramIndividualFrequencyEarCell, "reuseIdentifier");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "registerClass:forCellReuseIdentifier:", v53, v54);

  -[AIAudiogramIndividualFrequencyInputViewController scrollView](self, "scrollView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "_addScrollViewScrollObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = *MEMORY[0x24BEBE448];
  v110[0] = MEMORY[0x24BDAC760];
  v110[1] = 3221225472;
  v110[2] = __64__AIAudiogramIndividualFrequencyInputViewController_viewDidLoad__block_invoke;
  v110[3] = &unk_24FD6CD50;
  v110[4] = self;
  v58 = (id)objc_msgSend(v56, "addObserverForName:object:queue:usingBlock:", v57, 0, 0, v110);

}

void __64__AIAudiogramIndividualFrequencyInputViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "activeIndexPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "activeIndexPath");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_scrollToIndexPathIfNecessary:animated:", v4, 1);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AIAudiogramIndividualFrequencyInputViewController;
  -[AIAudiogramIndividualFrequencyInputViewController viewWillAppear:](&v21, sel_viewWillAppear_, a3);
  -[AIAudiogramIndividualFrequencyInputViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getCurrentAudiogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController setAudiogram:](self, "setAudiogram:", v5);

  v6 = (void *)MEMORY[0x24BDBCEB8];
  -[AIAudiogramIndividualFrequencyInputViewController audiogram](self, "audiogram");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sensitivityPoints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController setSensitivityPoints:](self, "setSensitivityPoints:", v9);

  -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController _reloadAudiogramWithSensitivityPoints:](self, "_reloadAudiogramWithSensitivityPoints:", v10);

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  if (!-[AIAudiogramIndividualFrequencyInputViewController didAddBackgroundLayer](self, "didAddBackgroundLayer"))
  {
    objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setBackgroundColor:", objc_msgSend(v13, "CGColor"));

    -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    objc_msgSend(v12, "setFrame:", 0.0, 0.0, v16, v18 * 0.4);

    -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "insertSublayer:atIndex:", v12, 0);

    -[AIAudiogramIndividualFrequencyInputViewController setDidAddBackgroundLayer:](self, "setDidAddBackgroundLayer:", 1);
  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[AIAudiogramIndividualFrequencyInputViewController _updateTableViewHeight](self, "_updateTableViewHeight");
  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramIndividualFrequencyInputViewController;
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

  -[UITableView contentSize](self->_tableView, "contentSize");
  v4 = v3;
  -[AIAudiogramIndividualFrequencyInputViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "heightAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToConstant:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramIndividualFrequencyInputViewController setTableViewHeightConstraint:](self, "setTableViewHeightConstraint:", v12);

      -[AIAudiogramIndividualFrequencyInputViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActive:", 1);
      goto LABEL_7;
    }
  }
  -[AIAudiogramIndividualFrequencyInputViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constant");
  v8 = v7;

  if (v4 == v8)
    return;
  -[AIAudiogramIndividualFrequencyInputViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", v4);
LABEL_7:

}

- (void)_cancelTapped:(id)a3
{
  id v3;

  -[AIAudiogramIndividualFrequencyInputViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelButtonTapped");

}

- (void)_doneButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[AIAudiogramIndividualFrequencyInputViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController audiogram](self, "audiogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissCurrentFrequencyInputViewControllerWithAudiogram:", v4);

}

- (void)_continueToNextFrequencyInput:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AIAudiogramIndividualFrequencyInputViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController audiogram](self, "audiogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController currentFrequency](self, "currentFrequency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showNextFrequencyInputViewControllerWithAudiogram:previousFrequency:", v4, v5);

}

- (BOOL)_scrollToIndexPathIfNecessary:(id)a3 animated:(BOOL)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  double v42;
  double v43;
  id v44;
  uint8_t buf[4];
  _BOOL4 v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  CGRect v50;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rectForRowAtIndexPath:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[AIAudiogramIndividualFrequencyInputViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v10;
  v43 = v8;
  objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[AIAudiogramIndividualFrequencyInputViewController scrollView](self, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v20 - v26;

  -[AIAudiogramIndividualFrequencyInputViewController scrollView](self, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v30 = v29;
  -[AIAudiogramIndividualFrequencyInputViewController scrollView](self, "scrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "contentInset");
  v33 = v30 - v32;

  v34 = v24 + v27;
  AXLogAudiogram();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = v34 > v33 || v27 < 0.0;
    v50.origin.x = v18;
    v50.origin.y = v27;
    v50.size.width = v22;
    v50.size.height = v24;
    NSStringFromCGRect(v50);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v46 = v36;
    v47 = 2112;
    v48 = v37;
    _os_log_impl(&dword_22FB4F000, v35, OS_LOG_TYPE_INFO, "Should scroll to row rect in view? %d %@", buf, 0x12u);

    if (v36)
      goto LABEL_10;
  }
  else
  {

    if (v27 < 0.0 || v34 > v33)
    {
LABEL_10:
      -[AIAudiogramIndividualFrequencyInputViewController scrollView](self, "scrollView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "convertRect:fromView:", v40, v43, v42, v12, v14);

      v44 = v5;
      AXPerformBlockOnMainThread();

      v38 = 1;
      goto LABEL_11;
    }
  }
  v38 = 0;
LABEL_11:

  return v38;
}

void __92__AIAudiogramIndividualFrequencyInputViewController__scrollToIndexPathIfNecessary_animated___block_invoke(uint64_t a1)
{
  double v2;
  double MinY;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  _BYTE v10[24];
  uint64_t v11;
  CGPoint v12;
  CGPoint v13;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDBEFB0];
  if (*(_BYTE *)(a1 + 88))
  {
    MinY = CGRectGetMinY(*(CGRect *)(a1 + 48));
    AXLogAudiogram();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v12.x = v2;
      v12.y = MinY;
      NSStringFromCGPoint(v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v10 = 138412546;
      *(_QWORD *)&v10[4] = v5;
      *(_WORD *)&v10[12] = 2112;
      *(_QWORD *)&v10[14] = v6;
      v7 = "Scrolling up to row: %@ - %@";
LABEL_7:
      _os_log_impl(&dword_22FB4F000, v4, OS_LOG_TYPE_INFO, v7, v10, 0x16u);

    }
  }
  else
  {
    if (!*(_BYTE *)(a1 + 89))
    {
      MinY = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      goto LABEL_9;
    }
    MinY = CGRectGetMaxY(*(CGRect *)(a1 + 48)) - *(double *)(a1 + 80);
    AXLogAudiogram();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v13.x = v2;
      v13.y = MinY;
      NSStringFromCGPoint(v13);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v10 = 138412546;
      *(_QWORD *)&v10[4] = v8;
      *(_WORD *)&v10[12] = 2112;
      *(_QWORD *)&v10[14] = v6;
      v7 = "Scrolling down to row: %@ - %@";
      goto LABEL_7;
    }
  }

LABEL_9:
  objc_msgSend(*(id *)(a1 + 40), "scrollView", *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentOffset:animated:", *(unsigned __int8 *)(a1 + 90), v2, MinY);

}

- (void)contentCategoryDidChange:(id)a3
{
  id v3;

  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v8, 1);
  -[AIAudiogramIndividualFrequencyInputViewController activeIndexPath](self, "activeIndexPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v8, "section") <= 1)
  {
    if (v6 == v8)
      v7 = 0;
    else
      v7 = v8;
    -[AIAudiogramIndividualFrequencyInputViewController setActiveIndexPath:](self, "setActiveIndexPath:", v7);
    -[AIAudiogramIndividualFrequencyInputViewController _scrollToIndexPathIfNecessary:animated:](self, "_scrollToIndexPathIfNecessary:animated:", v8, 1);
  }

}

- (void)symbolSelectionForFrequencyHasChanged:(int64_t)a3 noneSelected:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  -[AIAudiogramIndividualFrequencyInputViewController _earCellForEar:](self, "_earCellForEar:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  if (v4)
  {
    -[AIAudiogramIndividualFrequencyInputViewController currentFrequency](self, "currentFrequency");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[AIAudiogramIndividualFrequencyInputViewController indexOfFrequencyInSensitivityPoints:](self, "indexOfFrequencyInSensitivityPoints:", v8);

    v10 = -[AIAudiogramIndividualFrequencyInputViewController newSensitivityPointForHearingLevel:ear:updateIndex:](self, "newSensitivityPointForHearingLevel:ear:updateIndex:", 0, a3, v9);
    if (v10)
    {
      if (v9 == -1)
        -[AIAudiogramIndividualFrequencyInputViewController addSensitivityPoint:](self, "addSensitivityPoint:", v10);
      else
        -[AIAudiogramIndividualFrequencyInputViewController updateSensitivityPoint:atIndex:](self, "updateSensitivityPoint:atIndex:", v10, v9);
    }
    else if (v9 != -1)
    {
      -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectAtIndex:", v9);

    }
    -[AIAudiogramIndividualFrequencyInputViewController reloadAudiogram](self, "reloadAudiogram");
  }
  else
  {
    objc_msgSend(v7, "hearingLevel");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController earCellDidUpdateHearingLevel:forEar:](self, "earCellDidUpdateHearingLevel:forEar:", v10, objc_msgSend(v13, "ear"));
  }

  -[AIAudiogramIndividualFrequencyInputViewController symbols](self, "symbols");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateSymbols:ear:", v12, a3);

}

- (void)plusButtonTapped:(int64_t)a3
{
  -[AIAudiogramIndividualFrequencyInputViewController adjustHearingLevel:forEar:](self, "adjustHearingLevel:forEar:", 5, a3);
}

- (void)minusButtonTapped:(int64_t)a3
{
  -[AIAudiogramIndividualFrequencyInputViewController adjustHearingLevel:forEar:](self, "adjustHearingLevel:forEar:", -5, a3);
}

- (void)adjustHearingLevel:(int64_t)a3 forEar:(int64_t)a4
{
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[AIAudiogramIndividualFrequencyInputViewController _earCellForEar:](self, "_earCellForEar:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v12, "hearingLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "numberWithDouble:", v8 + (double)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  validateHearingLevel(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHearingLevel:", v10);

  objc_msgSend(v12, "hearingLevel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController earCellDidUpdateHearingLevel:forEar:](self, "earCellDidUpdateHearingLevel:forEar:", v11, objc_msgSend(v12, "ear"));

}

- (void)_reloadAudiogramWithSensitivityPoints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[AIAudiogramIndividualFrequencyInputViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPickedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v7 = (void *)getHKAudiogramSampleClass_softClass;
    v15 = getHKAudiogramSampleClass_softClass;
    if (!getHKAudiogramSampleClass_softClass)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getHKAudiogramSampleClass_block_invoke;
      v11[3] = &unk_24FD6CE58;
      v11[4] = &v12;
      __getHKAudiogramSampleClass_block_invoke((uint64_t)v11);
      v7 = (void *)v13[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v12, 8);
    metadataForHKAudiogramSample();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "audiogramSampleWithSensitivityPoints:startDate:endDate:metadata:", v4, v6, v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramIndividualFrequencyInputViewController setAudiogram:](self, "setAudiogram:", v10);

  }
  else
  {
    -[AIAudiogramIndividualFrequencyInputViewController setAudiogram:](self, "setAudiogram:", 0);
  }
  AXPerformBlockOnMainThread();

}

void __91__AIAudiogramIndividualFrequencyInputViewController__reloadAudiogramWithSensitivityPoints___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "audiogram");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "chartViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "audiogram");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAudiograms:", v6);

  }
  else
  {
    objc_msgSend(v3, "setAudiograms:", MEMORY[0x24BDBD1A8]);
  }

  objc_msgSend(*(id *)(a1 + 32), "chartViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_resetCurrentGraph");

  objc_msgSend(*(id *)(a1 + 32), "chartViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_updateHeaderState");

  objc_msgSend(*(id *)(a1 + 32), "audiogram");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "footerButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v9 != 0);

}

- (void)keyboardDoneTapped
{
  id v3;

  -[AIAudiogramIndividualFrequencyInputViewController setActiveIndexPath:](self, "setActiveIndexPath:", 0);
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (void)keyboardNegationTapped
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;

  -[AIAudiogramIndividualFrequencyInputViewController activeIndexPath](self, "activeIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AIAudiogramIndividualFrequencyInputViewController activeIndexPath](self, "activeIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "section"))
      v5 = 2;
    else
      v5 = 1;
    -[AIAudiogramIndividualFrequencyInputViewController _earCellForEar:](self, "_earCellForEar:", v5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "hearingLevel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v12, "hearingLevel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      objc_msgSend(v7, "numberWithDouble:", -v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHearingLevel:", v10);

      objc_msgSend(v12, "hearingLevel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramIndividualFrequencyInputViewController earCellDidUpdateHearingLevel:forEar:](self, "earCellDidUpdateHearingLevel:forEar:", v11, objc_msgSend(v12, "ear"));

    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  AIAudiogramIndividualFrequencyInputViewController *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD15D8];
  v8 = a4;
  v9 = objc_msgSend(v8, "row");
  v10 = objc_msgSend(v8, "section");

  objc_msgSend(v7, "indexPathForRow:inSection:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v13 = -[AIAudiogramIndividualFrequencyInputViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v6);
  if (-[AIAudiogramIndividualFrequencyInputViewController hasRightSymbols](self, "hasRightSymbols"))
    v14 = -[AIAudiogramIndividualFrequencyInputViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v6) == 1;
  else
    v14 = 0;
  v15 = objc_msgSend(v11, "section");
  if (v15 == 1)
  {
    if (-[AIAudiogramIndividualFrequencyInputViewController hasRightSymbols](self, "hasRightSymbols") && v13 >= 1)
      goto LABEL_16;
  }
  else if (v15)
  {
    AXLogAudiogram();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AIAudiogramIndividualFrequencyInputViewController tableView:cellForRowAtIndexPath:].cold.1(v11, v20);

  }
  else
  {
    if (-[AIAudiogramIndividualFrequencyInputViewController hasLeftSymbols](self, "hasLeftSymbols") && v13 >= 1)
    {
      v16 = self;
      v17 = v6;
      v18 = v11;
      v19 = 1;
LABEL_17:
      -[AIAudiogramIndividualFrequencyInputViewController earCellForTableView:atIndexPath:withEar:](v16, "earCellForTableView:atIndexPath:withEar:", v17, v18, v19);
      v21 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v21;
      goto LABEL_18;
    }
    if (v14)
    {
LABEL_16:
      v16 = self;
      v17 = v6;
      v18 = v11;
      v19 = 2;
      goto LABEL_17;
    }
  }
LABEL_18:

  return v12;
}

- (id)earCellForTableView:(id)a3 atIndexPath:(id)a4 withEar:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  -[AIAudiogramIndividualFrequencyInputViewController audiogram](self, "audiogram");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[AIAudiogramIndividualFrequencyInputViewController currentFrequency](self, "currentFrequency");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = v12;

    -[AIAudiogramIndividualFrequencyInputViewController audiogram](self, "audiogram");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sensitivityPoints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __93__AIAudiogramIndividualFrequencyInputViewController_earCellForTableView_atIndexPath_withEar___block_invoke;
    v21[3] = &unk_24FD6CDC8;
    v21[5] = v13;
    v21[4] = &v22;
    v21[6] = a5;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v21);

  }
  +[AIAudiogramIndividualFrequencyEarCell reuseIdentifier](AIAudiogramIndividualFrequencyEarCell, "reuseIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setHearingLevel:", v23[5]);
  objc_msgSend(v17, "setEar:", a5);
  -[AIAudiogramIndividualFrequencyInputViewController symbols](self, "symbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateSymbols:ear:", v18, a5);

  objc_msgSend(v17, "setDelegate:", self);
  -[AIAudiogramIndividualFrequencyInputViewController keyboardToolbar](self, "keyboardToolbar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setKeyboardToolbar:", v19);

  objc_msgSend(v17, "configureLayout");
  _Block_object_dispose(&v22, 8);

  return v17;
}

void __93__AIAudiogramIndividualFrequencyInputViewController_earCellForTableView_atIndexPath_withEar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "hertzUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v7);
  v9 = v8;
  v10 = *(double *)(a1 + 40);

  if (v9 == v10)
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    if (*(_QWORD *)(a1 + 48) == 1)
      objc_msgSend(v15, "leftEarSensitivity");
    else
      objc_msgSend(v15, "rightEarSensitivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getHKUnitClass(), "decibelHearingLevelUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValueForUnit:", v13);
    objc_msgSend(v11, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v14);

    *a4 = 1;
  }

}

- (id)_earCellForEar:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, a3 != 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2 && !-[AIAudiogramIndividualFrequencyInputViewController hasLeftSymbols](self, "hasLeftSymbols"))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  -[AIAudiogramIndividualFrequencyInputViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!-[AIAudiogramIndividualFrequencyInputViewController hasLeftSymbols](self, "hasLeftSymbols", a3))
    return 1;
  if (-[AIAudiogramIndividualFrequencyInputViewController hasRightSymbols](self, "hasRightSymbols"))
    return 2;
  return 1;
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
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.01;
}

- (void)earCellDidUpdateHearingLevel:(id)a3 forEar:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BYTE buf[24];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[AIAudiogramIndividualFrequencyInputViewController setAnalyticsDidMakeAdjustments:](self, "setAnalyticsDidMakeAdjustments:", 1);
  AXLogAudiogram();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v8 = getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr;
    v28 = getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr;
    if (!getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr)
    {
      v9 = (void *)HealthUILibrary();
      v8 = dlsym(v9, "HKAudiogramEarLocalizedDisplayNameForEar");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
      getHKAudiogramEarLocalizedDisplayNameForEarSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(buf, 8);
    if (!v8)
    {
      metadataForHKAudiogramSample_cold_1();
      __break(1u);
    }
    ((void (*)(int64_t, _QWORD))v8)(a4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a4;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v10;
    _os_log_impl(&dword_22FB4F000, v7, OS_LOG_TYPE_INFO, "Updating %i (%@) ear of audiogram", buf, 0x12u);

  }
  -[AIAudiogramIndividualFrequencyInputViewController currentFrequency](self, "currentFrequency");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AIAudiogramIndividualFrequencyInputViewController indexOfFrequencyInSensitivityPoints:](self, "indexOfFrequencyInSensitivityPoints:", v11);

  AXLogAudiogram();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_22FB4F000, v13, OS_LOG_TYPE_INFO, "Updating audiogram point %li of %li points", buf, 0x16u);

  }
  if (!v6)
  {
    -[AIAudiogramIndividualFrequencyInputViewController _earCellForEar:](self, "_earCellForEar:", a4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v26;
    AXPerformBlockOnMainThreadAfterDelay();

    v6 = &unk_24FD77470;
  }
  v17 = -[AIAudiogramIndividualFrequencyInputViewController newSensitivityPointForHearingLevel:ear:updateIndex:](self, "newSensitivityPointForHearingLevel:ear:updateIndex:", v6, a4, v12);
  if (v17)
  {
    if (v12 == -1)
      -[AIAudiogramIndividualFrequencyInputViewController addSensitivityPoint:](self, "addSensitivityPoint:", v17);
    else
      -[AIAudiogramIndividualFrequencyInputViewController updateSensitivityPoint:atIndex:](self, "updateSensitivityPoint:atIndex:", v17, v12);
    -[AIAudiogramIndividualFrequencyInputViewController reloadAudiogram](self, "reloadAudiogram");
  }
  else
  {
    AXLogAudiogram();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AIAudiogramIndividualFrequencyInputViewController earCellDidUpdateHearingLevel:forEar:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

  }
}

uint64_t __89__AIAudiogramIndividualFrequencyInputViewController_earCellDidUpdateHearingLevel_forEar___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHearingLevel:", &unk_24FD77470);
}

- (int64_t)indexOfFrequencyInSensitivityPoints:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = -1;
  objc_msgSend(getHKUnitClass(), "hertzUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__AIAudiogramIndividualFrequencyInputViewController_indexOfFrequencyInSensitivityPoints___block_invoke;
  v11[3] = &unk_24FD6CDF0;
  v7 = v5;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v9 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __89__AIAudiogramIndividualFrequencyInputViewController_indexOfFrequencyInSensitivityPoints___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a2, "frequency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  v11 = v10;

  if (v9 == v11)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (id)newSensitivityPointForHearingLevel:(id)a3 ear:(int64_t)a4 updateIndex:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  id HKQuantityClass;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint8_t v45;
  void *v46;
  id v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;

  v8 = a3;
  objc_msgSend(getHKUnitClass(), "hertzUnit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass(), "decibelHearingLevelUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKQuantityClass = getHKQuantityClass();
  -[AIAudiogramIndividualFrequencyInputViewController currentFrequency](self, "currentFrequency");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  objc_msgSend(HKQuantityClass, "quantityWithUnit:doubleValue:", v9);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13 = getHKQuantityClass();
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v13, "quantityWithUnit:doubleValue:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[AIAudiogramIndividualFrequencyInputViewController audiogram](self, "audiogram");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

  }
  else
  {
    v17 = (void *)objc_opt_new();
  }

  v18 = v14;
  if (a4 != 1)
  {
    if (a5 != -1)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", a5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "leftEarSensitivity");
      v20 = objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    v18 = 0;
  }
  v20 = v18;
LABEL_12:
  v21 = v14;
  if (a4 != 2)
  {
    if (a5 != -1)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "rightEarSensitivity");
      v23 = objc_claimAutoreleasedReturnValue();

      goto LABEL_17;
    }
    v21 = 0;
  }
  v23 = v21;
LABEL_17:
  if (v20 | v23)
  {
    v49 = 0;
    v50 = &v49;
    v51 = 0x2050000000;
    v31 = (void *)getHKAudiogramSensitivityPointClass_softClass;
    v52 = getHKAudiogramSensitivityPointClass_softClass;
    if (!getHKAudiogramSensitivityPointClass_softClass)
    {
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __getHKAudiogramSensitivityPointClass_block_invoke;
      v48[3] = &unk_24FD6CE58;
      v48[4] = &v49;
      __getHKAudiogramSensitivityPointClass_block_invoke((uint64_t)v48, v24, v25, v26, v27, v28, v29, v30, v45);
      v31 = (void *)v50[3];
    }
    v32 = objc_retainAutorelease(v31);
    _Block_object_dispose(&v49, 8);
    v47 = 0;
    objc_msgSend(v32, "sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", v46, v20, v23, &v47);
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v34 = v47;
    if (!v34 && v33)
    {
      v33 = v33;
      v35 = v33;
      goto LABEL_27;
    }
  }
  else
  {
    v34 = 0;
    v33 = 0;
  }
  AXLogAudiogram();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    -[AIAudiogramIndividualFrequencyInputViewController newSensitivityPointForHearingLevel:ear:updateIndex:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);

  v35 = 0;
LABEL_27:

  return v35;
}

- (void)addSensitivityPoint:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global);

}

uint64_t __73__AIAudiogramIndividualFrequencyInputViewController_addSensitivityPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "frequency");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)updateSensitivityPoint:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  if (a4 < 0
    || (-[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 <= a4))
  {
    AXLogAudiogram();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[AIAudiogramIndividualFrequencyInputViewController updateSensitivityPoint:atIndex:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  else
  {
    -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:atIndexedSubscript:", v6, a4);

  }
}

- (void)reloadAudiogram
{
  id v3;

  -[AIAudiogramIndividualFrequencyInputViewController sensitivityPoints](self, "sensitivityPoints");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController _reloadAudiogramWithSensitivityPoints:](self, "_reloadAudiogramWithSensitivityPoints:", v3);

}

- (void)updateActiveIndexPathForEar:(int64_t)a3 beginEditing:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, a3 != 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController activeIndexPath](self, "activeIndexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v11, "isEqual:", v6);

  if (v4)
  {
    v8 = v11;
    v9 = v11;
    if ((v7 & 1) != 0)
      goto LABEL_8;
    goto LABEL_6;
  }
  if (v7)
  {
    v9 = 0;
LABEL_6:
    -[AIAudiogramIndividualFrequencyInputViewController setActiveIndexPath:](self, "setActiveIndexPath:", v9);
  }
  -[AIAudiogramIndividualFrequencyInputViewController setActiveIndexPath:](self, "setActiveIndexPath:", v11);
  -[AIAudiogramIndividualFrequencyInputViewController activeIndexPath](self, "activeIndexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramIndividualFrequencyInputViewController _scrollToIndexPathIfNecessary:animated:](self, "_scrollToIndexPathIfNecessary:animated:", v10, 1);

  v8 = v11;
LABEL_8:

}

- (void)earCellDidBeginEditingForEar:(int64_t)a3
{
  -[AIAudiogramIndividualFrequencyInputViewController updateActiveIndexPathForEar:beginEditing:](self, "updateActiveIndexPathForEar:beginEditing:", a3, 1);
}

- (void)earCellDidEndEditingForEar:(int64_t)a3
{
  -[AIAudiogramIndividualFrequencyInputViewController updateActiveIndexPathForEar:beginEditing:](self, "updateActiveIndexPathForEar:beginEditing:", a3, 0);
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
  objc_storeStrong((id *)&self->_unitPreferenceController, a3);
}

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
{
  objc_storeStrong((id *)&self->_initialDate, a3);
}

- (UILabel)frequencyTitleLabel
{
  return self->_frequencyTitleLabel;
}

- (void)setFrequencyTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_frequencyTitleLabel, a3);
}

- (BOOL)userAddedFrequencyAfterOptical
{
  return self->_userAddedFrequencyAfterOptical;
}

- (void)setUserAddedFrequencyAfterOptical:(BOOL)a3
{
  self->_userAddedFrequencyAfterOptical = a3;
}

- (NSNumber)currentFrequency
{
  return self->_currentFrequency;
}

- (void)setCurrentFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_currentFrequency, a3);
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

- (AIAudiogramKeyboardToolbarForSensitivityPoint)keyboardToolbar
{
  return self->_keyboardToolbar;
}

- (void)setKeyboardToolbar:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardToolbar, a3);
}

- (BOOL)analyticsDidMakeAdjustments
{
  return self->_analyticsDidMakeAdjustments;
}

- (void)setAnalyticsDidMakeAdjustments:(BOOL)a3
{
  self->_analyticsDidMakeAdjustments = a3;
}

- (UIViewController)chartViewController
{
  return self->_chartViewController;
}

- (void)setChartViewController:(id)a3
{
  objc_storeStrong((id *)&self->_chartViewController, a3);
}

- (HKAudiogramSample)audiogram
{
  return self->_audiogram;
}

- (void)setAudiogram:(id)a3
{
  objc_storeStrong((id *)&self->_audiogram, a3);
}

- (NSMutableArray)sensitivityPoints
{
  return self->_sensitivityPoints;
}

- (void)setSensitivityPoints:(id)a3
{
  objc_storeStrong((id *)&self->_sensitivityPoints, a3);
}

- (NSArray)symbols
{
  return self->_symbols;
}

- (void)setSymbols:(id)a3
{
  objc_storeStrong((id *)&self->_symbols, a3);
}

- (BOOL)hasLeftSymbols
{
  return self->_hasLeftSymbols;
}

- (void)setHasLeftSymbols:(BOOL)a3
{
  self->_hasLeftSymbols = a3;
}

- (BOOL)hasRightSymbols
{
  return self->_hasRightSymbols;
}

- (void)setHasRightSymbols:(BOOL)a3
{
  self->_hasRightSymbols = a3;
}

- (BOOL)isModal
{
  return self->_isModal;
}

- (void)setIsModal:(BOOL)a3
{
  self->_isModal = a3;
}

- (BOOL)didAddBackgroundLayer
{
  return self->_didAddBackgroundLayer;
}

- (void)setDidAddBackgroundLayer:(BOOL)a3
{
  self->_didAddBackgroundLayer = a3;
}

- (OBTrayButton)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
  objc_storeStrong((id *)&self->_footerButton, a3);
}

- (AIAudiogramManualIngestionDelegate)delegate
{
  return (AIAudiogramManualIngestionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate
{
  return (AIAudiogramConfirmResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_audiogramConfirmationDelegate);
}

- (void)setAudiogramConfirmationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audiogramConfirmationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audiogramConfirmationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerButton, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
  objc_storeStrong((id *)&self->_sensitivityPoints, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_chartViewController, 0);
  objc_storeStrong((id *)&self->_keyboardToolbar, 0);
  objc_storeStrong((id *)&self->_activeIndexPath, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentFrequency, 0);
  objc_storeStrong((id *)&self->_frequencyTitleLabel, 0);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "section");
  _os_log_error_impl(&dword_22FB4F000, a2, OS_LOG_TYPE_ERROR, "Unexpected section (%i) creating row for audiogram table view", (uint8_t *)v3, 8u);
}

- (void)earCellDidUpdateHearingLevel:(uint64_t)a3 forEar:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FB4F000, a1, a3, "Error creating audiogram point", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)newSensitivityPointForHearingLevel:(uint64_t)a3 ear:(uint64_t)a4 updateIndex:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FB4F000, a1, a3, "Error creating new sensitivity point", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateSensitivityPoint:(uint64_t)a3 atIndex:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FB4F000, a1, a3, "Invalid index for updating sensitivity point", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
