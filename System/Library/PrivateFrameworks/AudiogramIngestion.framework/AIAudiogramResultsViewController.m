@implementation AIAudiogramResultsViewController

- (AIAudiogramResultsViewController)initWithDelegate:(id)a3 audiogram:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  AIAudiogramResultsViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[6];
  id location;
  id *p_location;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  BOOL v38;
  objc_super v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  aiLocString(CFSTR("AudiogramIngestionResultsTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  aiLocString(CFSTR("AudiogramIngestionResultsDetailText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v39.receiver = self;
  v39.super_class = (Class)AIAudiogramResultsViewController;
  v10 = -[AIAudiogramResultsViewController initWithTitle:detailText:symbolName:contentLayout:](&v39, sel_initWithTitle_detailText_symbolName_contentLayout_, v8, v9, 0, 3);

  if (v10)
  {
    -[AIAudiogramResultsViewController setAudiogram:](v10, "setAudiogram:", v7);
    -[AIAudiogramResultsViewController setAudiogramConfirmationDelegate:](v10, "setAudiogramConfirmationDelegate:", v6);
    v11 = (void *)objc_msgSend((id)AIAudiogramValidFrequencies, "copy");
    -[AIAudiogramResultsViewController setFrequencies:](v10, "setFrequencies:", v11);

    v12 = (void *)objc_opt_new();
    -[AIAudiogramResultsViewController setTableViewCells:](v10, "setTableViewCells:", v12);

    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    -[AIAudiogramResultsViewController audiogram](v10, "audiogram");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    v38 = v14;
    v15 = MEMORY[0x24BDAC760];
    if (*((_BYTE *)v36 + 24))
      goto LABEL_6;
    location = 0;
    p_location = &location;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    -[AIAudiogramResultsViewController frequencies](v10, "frequencies");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (id)objc_msgSend(v16, "mutableCopy");

    objc_msgSend(p_location[5], "removeObject:", &unk_24FD774E8);
    objc_msgSend(p_location[5], "removeObject:", &unk_24FD77500);
    objc_msgSend(p_location[5], "removeObject:", &unk_24FD77518);
    objc_msgSend(p_location[5], "removeObject:", &unk_24FD77530);
    objc_msgSend(p_location[5], "removeObject:", &unk_24FD77548);
    -[AIAudiogramResultsViewController audiogram](v10, "audiogram");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sensitivityPoints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __63__AIAudiogramResultsViewController_initWithDelegate_audiogram___block_invoke;
    v28[3] = &unk_24FD6D680;
    v28[4] = &v35;
    v28[5] = &location;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v28);

    if (objc_msgSend(p_location[5], "count"))
      *((_BYTE *)v36 + 24) = 1;
    _Block_object_dispose(&location, 8);

    if (*((_BYTE *)v36 + 24))
    {
LABEL_6:
      -[AIAudiogramResultsViewController headerView](v10, "headerView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      aiLocString(CFSTR("AudiogramIngestionResultsMissingTitle"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTitle:", v20);

      -[AIAudiogramResultsViewController headerView](v10, "headerView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      aiLocString(CFSTR("AudiogramIngestionResultsMissingDetailText"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDetailText:", v22);

    }
    objc_initWeak(&location, v10);
    v40[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __63__AIAudiogramResultsViewController_initWithDelegate_audiogram___block_invoke_2;
    v26[3] = &unk_24FD6D6A8;
    objc_copyWeak(&v27, &location);
    v24 = (id)-[AIAudiogramResultsViewController registerForTraitChanges:withHandler:](v10, "registerForTraitChanges:withHandler:", v23, v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v35, 8);
  }

  return v10;
}

void __63__AIAudiogramResultsViewController_initWithDelegate_audiogram___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "leftEarSensitivity");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v14, "rightEarSensitivity"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v14, "frequency");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass_2(), "hertzUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValueForUnit:", v12);
  objc_msgSend(v10, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v13);

}

void __63__AIAudiogramResultsViewController_initWithDelegate_audiogram___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    v11 = objc_loadWeakRetained(v5);
    objc_msgSend(v11, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  AIAudiogramKeyboardToolbar *v6;
  void *v7;
  AIAudiogramKeyboardToolbar *v8;
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
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
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
  _QWORD v58[5];
  objc_super v59;
  _QWORD v60[6];

  v60[4] = *MEMORY[0x24BDAC8D0];
  v59.receiver = self;
  v59.super_class = (Class)AIAudiogramResultsViewController;
  -[OBBaseWelcomeController viewDidLoad](&v59, sel_viewDidLoad);
  -[AIAudiogramResultsViewController setShouldAdjustScrollViewInsetForKeyboard:](self, "setShouldAdjustScrollViewInsetForKeyboard:", 1);
  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  aiLocString(CFSTR("AudiogramIngestionResultsNextButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel__confirmTapped_);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v57);

  v6 = [AIAudiogramKeyboardToolbar alloc];
  -[AIAudiogramResultsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v8 = -[AIAudiogramKeyboardToolbar initWithFrame:target:](v6, "initWithFrame:target:", self, 0.0, 0.0);
  -[AIAudiogramResultsViewController setKeyboardToolbar:](self, "setKeyboardToolbar:", v8);

  v9 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v10 = (void *)objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AIAudiogramResultsViewController setTableView:](self, "setTableView:", v10);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDataSource:", self);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setScrollEnabled:", 0);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v15);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AIAudiogramResultsViewController contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  v47 = (void *)MEMORY[0x24BDD1628];
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController contentView](self, "contentView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v53);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v52;
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v46;
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v60[2] = v21;
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v60[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "activateConstraints:", v27);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_opt_class();
  +[AIAudiogramResultGraphCell reuseIdentifier](AIAudiogramResultGraphCell, "reuseIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "registerClass:forCellReuseIdentifier:", v29, v30);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_class();
  +[AIAudiogramResultDateCell reuseIdentifier](AIAudiogramResultDateCell, "reuseIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "registerClass:forCellReuseIdentifier:", v32, v33);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_opt_class();
  +[AIAudiogramResultTimeCell reuseIdentifier](AIAudiogramResultTimeCell, "reuseIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "registerClass:forCellReuseIdentifier:", v35, v36);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_opt_class();
  +[AIAudiogramResultEarCell reuseIdentifier](AIAudiogramResultEarCell, "reuseIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "registerClass:forCellReuseIdentifier:", v38, v39);

  -[AIAudiogramResultsViewController scrollView](self, "scrollView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_addScrollViewScrollObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = *MEMORY[0x24BEBE448];
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __47__AIAudiogramResultsViewController_viewDidLoad__block_invoke;
  v58[3] = &unk_24FD6CD50;
  v58[4] = self;
  v43 = (id)objc_msgSend(v41, "addObserverForName:object:queue:usingBlock:", v42, 0, 0, v58);

}

void __47__AIAudiogramResultsViewController_viewDidLoad__block_invoke(uint64_t a1)
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

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AIAudiogramResultsViewController;
  -[AIAudiogramResultsViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  -[AIAudiogramResultsViewController _updateTableViewHeight](self, "_updateTableViewHeight");
  v3.receiver = self;
  v3.super_class = (Class)AIAudiogramResultsViewController;
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
  -[AIAudiogramResultsViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[AIAudiogramResultsViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[AIAudiogramResultsViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "heightAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToConstant:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramResultsViewController setTableViewHeightConstraint:](self, "setTableViewHeightConstraint:", v12);

      -[AIAudiogramResultsViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActive:", 1);
      goto LABEL_7;
    }
  }
  -[AIAudiogramResultsViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constant");
  v8 = v7;

  if (v4 == v8)
    return;
  -[AIAudiogramResultsViewController tableViewHeightConstraint](self, "tableViewHeightConstraint");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", v4);
LABEL_7:

}

- (void)_confirmTapped:(id)a3
{
  AIAudiogramConfirmResultsViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AIAudiogramConfirmResultsViewController *v10;

  v4 = [AIAudiogramConfirmResultsViewController alloc];
  -[AIAudiogramResultsViewController audiogramConfirmationDelegate](self, "audiogramConfirmationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController audiogram](self, "audiogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[AIAudiogramConfirmResultsViewController initWithDelegate:audiogram:](v4, "initWithDelegate:audiogram:", v5, v6);

  -[AIAudiogramResultsViewController healthStore](self, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramConfirmResultsViewController setHealthStore:](v10, "setHealthStore:", v7);

  -[AIAudiogramResultsViewController unitPreferenceController](self, "unitPreferenceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramConfirmResultsViewController setUnitPreferenceController:](v10, "setUnitPreferenceController:", v8);

  -[AIAudiogramConfirmResultsViewController setAnalyticsDidCompleteIngestion:](v10, "setAnalyticsDidCompleteIngestion:", -[AIAudiogramResultsViewController analyticsDidCompleteIngestion](self, "analyticsDidCompleteIngestion"));
  -[AIAudiogramConfirmResultsViewController setAnalyticsDidMakeAdjustments:](v10, "setAnalyticsDidMakeAdjustments:", -[AIAudiogramResultsViewController analyticsDidMakeAdjustments](self, "analyticsDidMakeAdjustments"));
  -[AIAudiogramConfirmResultsViewController setAnalyticsImportSource:](v10, "setAnalyticsImportSource:", -[AIAudiogramResultsViewController analyticsImportSource](self, "analyticsImportSource"));
  -[AIAudiogramConfirmResultsViewController setAnalyticsClient:](v10, "setAnalyticsClient:", -[AIAudiogramResultsViewController analyticsClient](self, "analyticsClient"));
  -[AIAudiogramResultsViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pushViewController:animated:", v10, 1);

}

- (void)_reloadAudiogramWithSensitivityPoints:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  -[AIAudiogramResultsViewController audiogram](self, "audiogram");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v9 = (void *)getHKAudiogramSampleClass_softClass_1;
    v18 = getHKAudiogramSampleClass_softClass_1;
    if (!getHKAudiogramSampleClass_softClass_1)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __getHKAudiogramSampleClass_block_invoke_1;
      v14[3] = &unk_24FD6CE58;
      v14[4] = &v15;
      __getHKAudiogramSampleClass_block_invoke_1((uint64_t)v14);
      v9 = (void *)v16[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v15, 8);
    metadataForHKAudiogramSample();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "audiogramSampleWithSensitivityPoints:startDate:endDate:metadata:", v6, v7, v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultsViewController setAudiogram:](self, "setAudiogram:", v12);

  }
  else
  {
    -[AIAudiogramResultsViewController setAudiogram:](self, "setAudiogram:", 0);
  }
  v13 = v8;
  AXPerformBlockOnMainThread();

}

void __79__AIAudiogramResultsViewController__reloadAudiogramWithSensitivityPoints_date___block_invoke(uint64_t a1)
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
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(a1 + 32))
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "audiogram");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v2;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertRowsAtIndexPaths:withRowAnimation:", v9, 100);
      goto LABEL_10;
    }
    if (!*(_QWORD *)(a1 + 32))
      goto LABEL_11;
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "audiogram");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_11;
    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v9, 100);
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 40), "audiogram");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (*(_QWORD *)(a1 + 32))
      goto LABEL_8;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 40), "tableViewCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "audiogram");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAudiogram:", v6);

LABEL_11:
}

- (void)_setCellActive:(BOOL)a3 indexPath:(id)a4 scroll:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  NSObject *v17;
  void *v18;
  id v19;

  v5 = a5;
  v6 = a3;
  v8 = a4;
  if (!v5
    || !-[AIAudiogramResultsViewController _scrollToIndexPathIfNecessary:animated:](self, "_scrollToIndexPathIfNecessary:animated:", v8, 1))
  {
    -[AIAudiogramResultsViewController tableViewCells](self, "tableViewCells");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "section") == 1)
    {
      if (!objc_msgSend(v8, "row"))
      {
        v19 = v8;
        AXPerformBlockOnMainThread();

      }
    }
    else
    {
      if (objc_msgSend(v8, "section") == 2 || objc_msgSend(v8, "section") == 3)
      {
        objc_msgSend(v10, "showActive:", v6);
        v11 = objc_msgSend(v8, "section");
        if (v11 == 3)
        {
          v12 = objc_msgSend(v8, "row");
          -[AIAudiogramResultsViewController frequencies](self, "frequencies");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12 != objc_msgSend(v9, "count") - 1;
        }
        else
        {
          v13 = 1;
        }
        -[AIAudiogramResultsViewController keyboardToolbar](self, "keyboardToolbar");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "nextItemButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEnabled:", v13);

        if (v11 == 3)
        v16 = objc_msgSend(v8, "section") != 2 || objc_msgSend(v8, "row") != 0;
        -[AIAudiogramResultsViewController keyboardToolbar](self, "keyboardToolbar");
        v17 = objc_claimAutoreleasedReturnValue();
        -[NSObject previousItemButton](v17, "previousItemButton");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setEnabled:", v16);

      }
      else
      {
        AXLogAudiogram();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[AIAudiogramResultsViewController _setCellActive:indexPath:scroll:].cold.1();
      }

    }
  }

}

void __68__AIAudiogramResultsViewController__setCellActive_indexPath_scroll___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", v3, 100);

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
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rectForRowAtIndexPath:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[AIAudiogramResultsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v10;
  v43 = v8;
  objc_msgSend(v15, "convertRect:fromView:", v16, v8, v10, v12, v14);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  -[AIAudiogramResultsViewController scrollView](self, "scrollView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v20 - v26;

  -[AIAudiogramResultsViewController scrollView](self, "scrollView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v30 = v29;
  -[AIAudiogramResultsViewController scrollView](self, "scrollView");
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
      -[AIAudiogramResultsViewController scrollView](self, "scrollView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[AIAudiogramResultsViewController tableView](self, "tableView");
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

void __75__AIAudiogramResultsViewController__scrollToIndexPathIfNecessary_animated___block_invoke(uint64_t a1)
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

- (void)setActiveIndexPath:(id)a3
{
  id v5;
  NSObject *v6;
  NSIndexPath *activeIndexPath;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSIndexPath *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  AXLogAudiogram();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    activeIndexPath = self->_activeIndexPath;
    v13 = 138412546;
    v14 = activeIndexPath;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_22FB4F000, v6, OS_LOG_TYPE_INFO, "Updating active index path %@ -> %@", (uint8_t *)&v13, 0x16u);
  }

  -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v5)
  {
    -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_activeIndexPath, a3);
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
      -[AIAudiogramResultsViewController _setCellActive:indexPath:scroll:](self, "_setCellActive:indexPath:scroll:", 0, v9, 0);
    -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != v10)
    {

LABEL_12:
      goto LABEL_13;
    }
    if (objc_msgSend(v9, "section") == 2)
    {

    }
    else
    {
      v12 = objc_msgSend(v9, "section");

      if (v12 != 3)
        goto LABEL_12;
    }
    -[AIAudiogramResultsViewController _setCellActive:indexPath:scroll:](self, "_setCellActive:indexPath:scroll:", 0, v9, 0);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)keyboardDoneTapped
{
  id v3;

  -[AIAudiogramResultsViewController setActiveIndexPath:](self, "setActiveIndexPath:", 0);
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (void)keyboardNegationTapped
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "activeIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22FB4F000, a2, v4, "Attempted to negate value on a cell that was not active or in the wrong section %@", v5);

}

void __58__AIAudiogramResultsViewController_keyboardNegationTapped__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *MEMORY[0x24BEBDDB0];
  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "hearingLevel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v3);

}

- (void)keyboardPreviousTapped
{
  OUTLINED_FUNCTION_0(&dword_22FB4F000, a1, a3, "Attempted to negate value on a cell that was not active", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)keyboardNextTapped
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  AIAudiogramResultsViewController *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  int v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "section");

    if (v5 == 2)
    {
      -[AIAudiogramResultsViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[AIAudiogramResultsViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, 2);

      -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "row") < 0)
      {

        v11 = v7 - 1;
      }
      else
      {
        -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "row");
        v11 = v7 - 1;

        if (v10 < v7 - 1)
        {
          v12 = (void *)MEMORY[0x24BDD15D8];
          -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "row") + 1;
          v15 = v12;
          v16 = 2;
LABEL_13:
          objc_msgSend(v15, "indexPathForRow:inSection:", v14, v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
          AXLogAudiogram();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v42 = 138412290;
            v43 = v25;
            _os_log_impl(&dword_22FB4F000, v36, OS_LOG_TYPE_INFO, "Moving focus forwards to %@", (uint8_t *)&v42, 0xCu);
          }

          if (v25)
          {
            -[AIAudiogramResultsViewController setActiveIndexPath:](self, "setActiveIndexPath:", v25);
            -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = self;
            v39 = 1;
            v40 = v37;
            v41 = 1;
          }
          else
          {
            -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = self;
            v39 = 0;
            v40 = v37;
            v41 = 0;
          }
          -[AIAudiogramResultsViewController _setCellActive:indexPath:scroll:](v38, "_setCellActive:indexPath:scroll:", v39, v40, v41);

          goto LABEL_25;
        }
      }
      -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "row");

      if (v35 == v11)
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
    }
    else
    {
      -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "section");

      if (v27 == 3)
      {
        -[AIAudiogramResultsViewController tableView](self, "tableView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[AIAudiogramResultsViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v28, 3);

        -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "row") < 0)
        {

        }
        else
        {
          -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "row");

          if (v32 < v29 - 1)
          {
            v33 = (void *)MEMORY[0x24BDD15D8];
            -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "row") + 1;
            v15 = v33;
            v16 = 3;
            goto LABEL_13;
          }
        }
      }
    }
    v25 = 0;
    goto LABEL_19;
  }
  AXLogAudiogram();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[AIAudiogramResultsViewController keyboardPreviousTapped].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "endEditing:", 1);
LABEL_25:

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
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
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, void *);
  void *v46;
  id v47;
  uint64_t *v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD15D8];
  v8 = a4;
  v9 = objc_msgSend(v8, "row");
  v10 = objc_msgSend(v8, "section");

  objc_msgSend(v7, "indexPathForRow:inSection:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v11, "section"))
  {
    case 0:
      +[AIAudiogramResultGraphCell reuseIdentifier](AIAudiogramResultGraphCell, "reuseIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[AIAudiogramResultsViewController audiogram](self, "audiogram");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAudiogram:", v16);

      goto LABEL_26;
    case 1:
      v18 = objc_msgSend(v11, "row");
      if (v18 == 1)
      {
        +[AIAudiogramResultTimeCell reuseIdentifier](AIAudiogramResultTimeCell, "reuseIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v37);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[AIAudiogramResultsViewController audiogram](self, "audiogram");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
        {
          -[AIAudiogramResultsViewController audiogram](self, "audiogram");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "startDate");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDate:", v40);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setDate:", v39);
        }

        objc_msgSend(v15, "setDelegate:", self);
        objc_msgSend(v15, "configureLayout");
LABEL_26:
        -[AIAudiogramResultsViewController tableViewCells](self, "tableViewCells");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKey:", v15, v11);

      }
      else if (v18)
      {
        AXLogAudiogram();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[AIAudiogramResultsViewController tableView:cellForRowAtIndexPath:].cold.2();
LABEL_23:

        v15 = v12;
      }
      else
      {
        -[AIAudiogramResultsViewController audiogram](self, "audiogram");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          -[AIAudiogramResultsViewController initialDate](self, "initialDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v21 = v13 == v11;
        +[AIAudiogramResultDateCell reuseIdentifier](AIAudiogramResultDateCell, "reuseIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "showActive:", v21);
        objc_msgSend(v15, "setDate:", v20);
        objc_msgSend(v15, "setDelegate:", self);
        objc_msgSend(v15, "configureLayout");
        -[AIAudiogramResultsViewController tableViewCells](self, "tableViewCells");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKey:", v15, v11);

LABEL_18:
      }

      return v15;
    case 2:
      -[AIAudiogramResultsViewController frequencies](self, "frequencies");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndex:", objc_msgSend(v11, "row"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__3;
      v56 = __Block_byref_object_dispose__3;
      v57 = 0;
      -[AIAudiogramResultsViewController audiogram](self, "audiogram");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        -[AIAudiogramResultsViewController audiogram](self, "audiogram");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "sensitivityPoints");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x24BDAC760];
        v49[1] = 3221225472;
        v49[2] = __68__AIAudiogramResultsViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v49[3] = &unk_24FD6D6F8;
        v50 = v20;
        v51 = &v52;
        objc_msgSend(v27, "enumerateObjectsUsingBlock:", v49);

      }
      +[AIAudiogramResultEarCell reuseIdentifier](AIAudiogramResultEarCell, "reuseIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setFrequency:", v20);
      objc_msgSend(v15, "setHearingLevel:", v53[5]);
      objc_msgSend(v15, "setEar:", 1);
      objc_msgSend(v15, "setDelegate:", self);
      -[AIAudiogramResultsViewController keyboardToolbar](self, "keyboardToolbar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setKeyboardToolbar:", v29);

      objc_msgSend(v15, "configureLayout");
      -[AIAudiogramResultsViewController tableViewCells](self, "tableViewCells");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v15, v11);
      goto LABEL_17;
    case 3:
      -[AIAudiogramResultsViewController frequencies](self, "frequencies");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndex:", objc_msgSend(v11, "row"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = 0;
      v53 = &v52;
      v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__3;
      v56 = __Block_byref_object_dispose__3;
      v57 = 0;
      -[AIAudiogramResultsViewController audiogram](self, "audiogram");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[AIAudiogramResultsViewController audiogram](self, "audiogram");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sensitivityPoints");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = MEMORY[0x24BDAC760];
        v44 = 3221225472;
        v45 = __68__AIAudiogramResultsViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
        v46 = &unk_24FD6D6F8;
        v47 = v20;
        v48 = &v52;
        objc_msgSend(v34, "enumerateObjectsUsingBlock:", &v43);

      }
      +[AIAudiogramResultEarCell reuseIdentifier](AIAudiogramResultEarCell, "reuseIdentifier", v43, v44, v45, v46);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v35);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setFrequency:", v20);
      objc_msgSend(v15, "setHearingLevel:", v53[5]);
      objc_msgSend(v15, "setEar:", 2);
      objc_msgSend(v15, "setDelegate:", self);
      -[AIAudiogramResultsViewController keyboardToolbar](self, "keyboardToolbar");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setKeyboardToolbar:", v36);

      objc_msgSend(v15, "configureLayout");
      -[AIAudiogramResultsViewController tableViewCells](self, "tableViewCells");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v15, v11);
LABEL_17:

      _Block_object_dispose(&v52, 8);
      goto LABEL_18;
    default:
      AXLogAudiogram();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[AIAudiogramResultsViewController tableView:cellForRowAtIndexPath:].cold.1(v11, v17);
      goto LABEL_23;
  }
}

void __68__AIAudiogramResultsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "frequency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass_2(), "hertzUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "doubleValue");
  if (v6 != v7)
    goto LABEL_4;
  objc_msgSend(v13, "leftEarSensitivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "leftEarSensitivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getHKUnitClass_2(), "decibelHearingLevelUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", v4);
    objc_msgSend(v9, "numberWithDouble:");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_4:
  }

}

void __68__AIAudiogramResultsViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "frequency");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getHKUnitClass_2(), "hertzUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "doubleValue");
  if (v6 != v7)
    goto LABEL_4;
  objc_msgSend(v13, "rightEarSensitivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v13, "rightEarSensitivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getHKUnitClass_2(), "decibelHearingLevelUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValueForUnit:", v4);
    objc_msgSend(v9, "numberWithDouble:");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

LABEL_4:
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;

  v6 = a3;
  if ((unint64_t)(a4 - 2) < 2)
  {
    -[AIAudiogramResultsViewController frequencies](self, "frequencies");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v12, "count");

  }
  else if (a4 == 1)
  {
    v11 = 2;
  }
  else if (a4)
  {
    AXLogAudiogram();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AIAudiogramResultsViewController tableView:numberOfRowsInSection:].cold.1(a4, v13, v14);

    v11 = 0;
  }
  else
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightBarButtonItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultsViewController audiogram](self, "audiogram");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v9 != 0);

    -[AIAudiogramResultsViewController audiogram](self, "audiogram");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = 0;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      aiLocString(CFSTR("AudiogramIngestionResultsDate"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      v10 = 1;
      goto LABEL_8;
    case 3:
      v10 = 2;
LABEL_8:
      Soft_HKAudiogramEarLocalizedDisplayNameForEar(v10);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v6 = (void *)v7;
      break;
    default:
      AXLogAudiogram();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[AIAudiogramResultsViewController tableView:titleForHeaderInSection:].cold.1(a4, v8, v9);

      v6 = 0;
      break;
  }

  return v6;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  if (objc_msgSend(a4, "section", a3))
    return *MEMORY[0x24BEBE770];
  +[AIAudiogramResultGraphCell cellHeight](AIAudiogramResultGraphCell, "cellHeight");
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v10, 1);
  -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v10, "section");
  if ((unint64_t)(v7 - 2) < 2 || v7 == 1 && !objc_msgSend(v10, "row"))
  {
    if (v6 == v10)
      v8 = 0;
    else
      v8 = v10;
    -[AIAudiogramResultsViewController setActiveIndexPath:](self, "setActiveIndexPath:", v8);
    -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultsViewController _setCellActive:indexPath:scroll:](self, "_setCellActive:indexPath:scroll:", v9 != 0, v10, 1);

  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    AXLogAudiogram();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_22FB4F000, v5, OS_LOG_TYPE_INFO, "Finished scrolling to index path %@", (uint8_t *)&v8, 0xCu);

    }
    -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultsViewController _setCellActive:indexPath:scroll:](self, "_setCellActive:indexPath:scroll:", 1, v7, 0);

  }
}

- (void)dateCellDidPickDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AIAudiogramResultsViewController audiogram](self, "audiogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensitivityPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController _reloadAudiogramWithSensitivityPoints:date:](self, "_reloadAudiogramWithSensitivityPoints:date:", v6, v4);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v9, 5);

}

- (void)timeCellDidPickDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[AIAudiogramResultsViewController audiogram](self, "audiogram");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sensitivityPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController _reloadAudiogramWithSensitivityPoints:date:](self, "_reloadAudiogramWithSensitivityPoints:date:", v6, v4);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v9, 5);

}

- (void)earCellDidUpdateHearingLevel:(id)a3 forFrequency:(id)a4 forEar:(int64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  id HKQuantityClass_1;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[4];
  id v47;
  uint8_t *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[8];
  __int128 v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint8_t v63[8];
  uint64_t v64;
  void (*v65)(uint64_t);
  void *v66;
  uint64_t *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v8 = a4;
  -[AIAudiogramResultsViewController setAnalyticsDidMakeAdjustments:](self, "setAnalyticsDidMakeAdjustments:", 1);
  AXLogAudiogram();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    Soft_HKAudiogramEarLocalizedDisplayNameForEar(a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a5;
    LOWORD(v59) = 2112;
    *(_QWORD *)((char *)&v59 + 2) = v10;
    _os_log_impl(&dword_22FB4F000, v9, OS_LOG_TYPE_INFO, "Updating %i (%@) ear of audiogram", buf, 0x12u);

  }
  -[AIAudiogramResultsViewController audiogram](self, "audiogram");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[AIAudiogramResultsViewController audiogram](self, "audiogram");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sensitivityPoints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

  }
  else
  {
    v14 = (void *)objc_opt_new();
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&v59 = buf;
  *((_QWORD *)&v59 + 1) = 0x3032000000;
  v60 = __Block_byref_object_copy__3;
  v61 = __Block_byref_object_dispose__3;
  objc_msgSend(getHKUnitClass_2(), "hertzUnit");
  v62 = (id)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = -1;
  v15 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __85__AIAudiogramResultsViewController_earCellDidUpdateHearingLevel_forFrequency_forEar___block_invoke;
  v46[3] = &unk_24FD6D720;
  v48 = buf;
  v42 = v8;
  v47 = v42;
  v49 = &v50;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v46);
  AXLogAudiogram();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v51[3];
    v18 = objc_msgSend(v14, "count");
    *(_DWORD *)v63 = 67109376;
    *(_DWORD *)&v63[4] = v17;
    LOWORD(v64) = 1024;
    *(_DWORD *)((char *)&v64 + 2) = v18;
    _os_log_impl(&dword_22FB4F000, v16, OS_LOG_TYPE_INFO, "Updating audiogram point %i of %i points", v63, 0xEu);
  }

  objc_msgSend(getHKUnitClass_2(), "decibelHearingLevelUnit");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    HKQuantityClass_1 = getHKQuantityClass_1();
    objc_msgSend(v43, "doubleValue");
    objc_msgSend(HKQuantityClass_1, "quantityWithUnit:doubleValue:", v41);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;
  if (a5 != 1)
  {
    if (v51[3] != -1)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leftEarSensitivity");
      v23 = objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    v21 = 0;
  }
  v23 = v21;
LABEL_16:
  v24 = v20;
  if (a5 == 2)
  {
LABEL_20:
    v26 = v24;
    goto LABEL_21;
  }
  if (v51[3] == -1)
  {
    v24 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v14, "objectAtIndexedSubscript:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rightEarSensitivity");
  v26 = objc_claimAutoreleasedReturnValue();

LABEL_21:
  v27 = getHKQuantityClass_1();
  v28 = *(_QWORD *)(v59 + 40);
  objc_msgSend(v42, "doubleValue");
  objc_msgSend(v27, "quantityWithUnit:doubleValue:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(v23 | v26))
    goto LABEL_32;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2050000000;
  v30 = (void *)getHKAudiogramSensitivityPointClass_softClass_1;
  v57 = getHKAudiogramSensitivityPointClass_softClass_1;
  if (!getHKAudiogramSensitivityPointClass_softClass_1)
  {
    *(_QWORD *)v63 = v15;
    v64 = 3221225472;
    v65 = __getHKAudiogramSensitivityPointClass_block_invoke_1;
    v66 = &unk_24FD6CE58;
    v67 = &v54;
    __getHKAudiogramSensitivityPointClass_block_invoke_1((uint64_t)v63);
    v30 = (void *)v55[3];
  }
  v31 = objc_retainAutorelease(v30);
  _Block_object_dispose(&v54, 8);
  v45 = 0;
  objc_msgSend(v31, "sensitivityPointWithFrequency:leftEarSensitivity:rightEarSensitivity:error:", v29, v23, v26, &v45);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v45;
  if (v33)
  {
    v34 = v33;
    AXLogAudiogram();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[AIAudiogramResultsViewController earCellDidUpdateHearingLevel:forFrequency:forEar:].cold.1();
    goto LABEL_45;
  }
  if (v32)
  {
    if (v51[3] == -1)
    {
      AXLogAudiogram();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v63 = 0;
        _os_log_impl(&dword_22FB4F000, v40, OS_LOG_TYPE_INFO, "Adding audiogram point", v63, 2u);
      }

      objc_msgSend(v14, "addObject:", v32);
      v44[0] = v15;
      v44[1] = 3221225472;
      v44[2] = __85__AIAudiogramResultsViewController_earCellDidUpdateHearingLevel_forFrequency_forEar___block_invoke_85;
      v44[3] = &unk_24FD6D748;
      v44[4] = buf;
      objc_msgSend(v14, "sortUsingComparator:", v44);
    }
    else
    {
      AXLogAudiogram();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v63 = 0;
        _os_log_impl(&dword_22FB4F000, v36, OS_LOG_TYPE_INFO, "Updating audiogram point", v63, 2u);
      }

      objc_msgSend(v14, "replaceObjectAtIndex:withObject:", v51[3], v32);
    }
  }
  else
  {
LABEL_32:
    if (v51[3] == -1)
    {
      AXLogAudiogram();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v63 = 0;
        _os_log_impl(&dword_22FB4F000, v38, OS_LOG_TYPE_INFO, "No update needed for blank audiogram point", v63, 2u);
      }

    }
    else
    {
      AXLogAudiogram();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v63 = 0;
        _os_log_impl(&dword_22FB4F000, v37, OS_LOG_TYPE_INFO, "Removing audiogram point", v63, 2u);
      }

      objc_msgSend(v14, "removeObjectAtIndex:", v51[3]);
    }
    v32 = 0;
  }
  -[AIAudiogramResultsViewController audiogram](self, "audiogram", v41);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    -[AIAudiogramResultsViewController audiogram](self, "audiogram");
    v35 = objc_claimAutoreleasedReturnValue();
    -[NSObject startDate](v35, "startDate");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v39 = objc_claimAutoreleasedReturnValue();
    v35 = v39;
  }
  -[AIAudiogramResultsViewController _reloadAudiogramWithSensitivityPoints:date:](self, "_reloadAudiogramWithSensitivityPoints:date:", v14, v39);
  if (v34)

LABEL_45:
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(buf, 8);

}

void __85__AIAudiogramResultsViewController_earCellDidUpdateHearingLevel_forFrequency_forEar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_msgSend(a2, "frequency");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "doubleValue");
  v11 = v10;

  if (v9 == v11)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

BOOL __85__AIAudiogramResultsViewController_earCellDidUpdateHearingLevel_forFrequency_forEar___block_invoke_85(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  _BOOL8 v11;

  v5 = a3;
  objc_msgSend(a2, "frequency");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v8 = v7;
  objc_msgSend(v5, "frequency");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValueForUnit:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v11 = v8 > v10;

  return v11;
}

- (void)earCellDidBeginEditingForFrequency:(id)a3 forEar:(int64_t)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (a4 == 1)
    v5 = 2;
  else
    v5 = 3;
  v6 = a3;
  -[AIAudiogramResultsViewController frequencies](self, "frequencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v12 != v9)
  {
    -[AIAudiogramResultsViewController setActiveIndexPath:](self, "setActiveIndexPath:", v12);
    -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AIAudiogramResultsViewController _scrollToIndexPathIfNecessary:animated:](self, "_scrollToIndexPathIfNecessary:animated:", v11, 1);

    v10 = v12;
  }

}

- (void)earCellDidEndEditingForFrequency:(id)a3 forEar:(int64_t)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  if (a4 == 1)
    v5 = 2;
  else
    v5 = 3;
  v6 = a3;
  -[AIAudiogramResultsViewController frequencies](self, "frequencies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[AIAudiogramResultsViewController activeIndexPath](self, "activeIndexPath");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  if (v11 == v9)
  {
    -[AIAudiogramResultsViewController setActiveIndexPath:](self, "setActiveIndexPath:", 0);
    v10 = v11;
  }

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

- (NSDate)initialDate
{
  return self->_initialDate;
}

- (void)setInitialDate:(id)a3
{
  objc_storeStrong((id *)&self->_initialDate, a3);
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

- (AIAudiogramConfirmResultsViewControllerDelegate)audiogramConfirmationDelegate
{
  return (AIAudiogramConfirmResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_audiogramConfirmationDelegate);
}

- (void)setAudiogramConfirmationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audiogramConfirmationDelegate, a3);
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

- (NSMutableDictionary)tableViewCells
{
  return self->_tableViewCells;
}

- (void)setTableViewCells:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewCells, a3);
}

- (AIAudiogramKeyboardToolbar)keyboardToolbar
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardToolbar, 0);
  objc_storeStrong((id *)&self->_tableViewCells, 0);
  objc_storeStrong((id *)&self->_frequencies, 0);
  objc_storeStrong((id *)&self->_audiogram, 0);
  objc_storeStrong((id *)&self->_activeIndexPath, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_audiogramConfirmationDelegate);
  objc_storeStrong((id *)&self->_initialDate, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_setCellActive:indexPath:scroll:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22FB4F000, v0, v1, "Attempted to set non-activating section to active: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)tableView:(void *)a1 cellForRowAtIndexPath:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v4[0] = 67109120;
  v4[1] = objc_msgSend(a1, "section");
  OUTLINED_FUNCTION_1_1(&dword_22FB4F000, a2, v3, "Unexpected section (%i) creating row for audiogram table view", (uint8_t *)v4);
  OUTLINED_FUNCTION_2();
}

- (void)tableView:cellForRowAtIndexPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22FB4F000, v0, v1, "Unexpected row (%@) for audiogram table view", v2);
  OUTLINED_FUNCTION_2();
}

- (void)tableView:(uint64_t)a3 numberOfRowsInSection:.cold.1(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_1_1(&dword_22FB4F000, a2, a3, "Unknown section (%i) picking number of rows in audiogram table view", (uint8_t *)v3);
  OUTLINED_FUNCTION_1();
}

- (void)tableView:(uint64_t)a3 titleForHeaderInSection:.cold.1(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_1_1(&dword_22FB4F000, a2, a3, "Unknown section (%i) creating title for audiogram table view", (uint8_t *)v3);
  OUTLINED_FUNCTION_1();
}

- (void)earCellDidUpdateHearingLevel:forFrequency:forEar:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22FB4F000, v0, v1, "Error updating audiogram point: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
