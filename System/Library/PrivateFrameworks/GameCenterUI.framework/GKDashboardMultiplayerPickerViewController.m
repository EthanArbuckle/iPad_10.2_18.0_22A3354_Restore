@implementation GKDashboardMultiplayerPickerViewController

- (GKDashboardMultiplayerPickerViewController)initWithMaxSelectable:(int64_t)a3 hiddenPlayers:(id)a4 nearbyOnly:(BOOL)a5 pickerOrigin:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  GKDashboardMultiplayerPickerViewController *v13;
  GKDashboardMultiplayerPickerDataSource *v14;
  void *v15;
  objc_super v17;

  v7 = a5;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "_gkPlatformNibName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  v13 = -[GKDashboardCollectionViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, v11, v12);

  if (v13)
  {
    v14 = -[GKDashboardMultiplayerPickerDataSource initWithMaxSelectable:previouslyInvitedPlayers:nearbyOnly:pickerOrigin:]([GKDashboardMultiplayerPickerDataSource alloc], "initWithMaxSelectable:previouslyInvitedPlayers:nearbyOnly:pickerOrigin:", a3, v10, v7, a6);
    -[GKDashboardMultiplayerPickerDataSource setDelegate:](v14, "setDelegate:", v13);
    -[GKCollectionDataSource setBreakSearchInputTextIntoMultipleTerms:](v14, "setBreakSearchInputTextIntoMultipleTerms:", 0);
    -[GKCollectionDataSource setPresentationViewController:](v14, "setPresentationViewController:", v13);
    -[GKDashboardCollectionViewController setDataSource:](v13, "setDataSource:", v14);
    -[GKLoadingViewController setLoadingIndicatorDelay:](v13, "setLoadingIndicatorDelay:", 0.0);
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24DA8]);

    }
    -[GKDashboardMultiplayerPickerViewController setPickerOrigin:](v13, "setPickerOrigin:", a6);

  }
  return v13;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  id completionHandler;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardMultiplayerPickerViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    (*((void (**)(id, _QWORD, _QWORD))completionHandler + 2))(completionHandler, 0, 0);
    -[GKDashboardMultiplayerPickerViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4FE0], 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardMultiplayerPickerViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNearbyPlayersChangedHandler:", 0);

  -[GKDashboardCollectionViewController setDataSource:](self, "setDataSource:", 0);
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardMultiplayerPickerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[GKDashboardMultiplayerPickerViewController updateCollectionViewContentInsets](self, "updateCollectionViewContentInsets");
}

- (void)viewDidLoad
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  double v76;
  void *v77;
  uint64_t v78;
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
  void *v114;
  uint64_t v115;
  void *v116;
  id val;
  _QWORD v118[4];
  id v119;
  id v120;
  id v121;
  id from;
  id location;
  objc_super v124;

  v124.receiver = self;
  v124.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardCollectionViewController viewDidLoad](&v124, sel_viewDidLoad);
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v3 = 1;
  val = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "setOnDarkBackground:", 1);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isMultiplayerGamingRestricted") & 1) == 0)
    v3 = -[GKDashboardMultiplayerPickerViewController pickerOrigin](self, "pickerOrigin") != 1;
  -[GKDashboardMultiplayerPickerViewController setExcludesContacts:](self, "setExcludesContacts:", v3);

  objc_initWeak(&location, self);
  -[GKDashboardMultiplayerPickerViewController searchFieldPlaceHolderText](self, "searchFieldPlaceHolderText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholder:", v5);

  -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[GKDashboardMultiplayerPickerViewController configureComposeTextView](self, "configureComposeTextView");
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardCollectionViewController setAutoWidthUsesTwoColumnsWhenSpace:](self, "setAutoWidthUsesTwoColumnsWhenSpace:", 0);
  objc_msgSend(v8, "setPrefetchingEnabled:", 0);
  -[GKDashboardMultiplayerPickerViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPrefersLargeTitles:", 0);

  v11 = objc_alloc(MEMORY[0x1E0DC3A30]);
  -[GKDashboardMultiplayerPickerViewController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "standardAppearance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithBarAppearance:", v14);

  objc_msgSend(v15, "configureWithTransparentBackground");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setShadowColor:", v16);

  v17 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  objc_msgSend(v15, "setShadowImage:", v17);

  -[GKDashboardMultiplayerPickerViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setStandardAppearance:", v15);

  -[GKDashboardMultiplayerPickerViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScrollEdgeAppearance:", v15);

  v20 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v20, "setSpacing:", 28.0);
  objc_msgSend(v20, "setAxis:", 0);
  objc_msgSend(v20, "setDistribution:", 3);
  objc_msgSend(v20, "setAlignment:", 3);
  v112 = v15;
  v113 = v8;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v21, "statusBarOrientation");

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B08]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus.bubble"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageWithRenderingMode:", 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKFocusableButton buttonWithType:](GKFocusableButton, "buttonWithType:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setImage:forState:", v24, 0);
  objc_msgSend(v25, "addTarget:action:forEvents:", self, sel_addMessage_, 0x2000);
  objc_msgSend(v20, "addArrangedSubview:", v25);
  objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v25, "widthAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "heightAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "size");
  v29 = v28;
  objc_msgSend(v24, "size");
  objc_msgSend(v26, "constraintEqualToAnchor:multiplier:", v27, v29 / v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTintColor:", v32);

  GKGameCenterUIFrameworkBundle();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityLabel:", v34);

  -[GKDashboardMultiplayerPickerViewController setNavBarMessageButton:](self, "setNavBarMessageButton:", v25);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:", *MEMORY[0x1E0DC4B58]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "configurationByApplyingConfiguration:", v36);
  v37 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.up.circle.fill"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "imageWithRenderingMode:", 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = (void *)v37;

  +[GKFocusableButton buttonWithType:](GKFocusableButton, "buttonWithType:", 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setImage:forState:", v39, 0);
  objc_msgSend(v40, "addTarget:action:forEvents:", self, sel_send_, 0x2000);
  objc_msgSend(v20, "addArrangedSubview:", v40);
  objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v40, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "heightAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "size");
  v44 = v43;
  objc_msgSend(v39, "size");
  objc_msgSend(v41, "constraintEqualToAnchor:multiplier:", v42, v44 / v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTintColor:", v47);

  GKGameCenterUIFrameworkBundle();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setAccessibilityLabel:", v49);

  -[GKDashboardMultiplayerPickerViewController setNavBarSendButton:](self, "setNavBarSendButton:", v40);
  v110 = v39;
  v50 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v50, "addSubview:", v20);
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v20, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "leadingAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setActive:", 1);

  objc_msgSend(v20, "trailingAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "trailingAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintEqualToAnchor:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setActive:", 1);

  objc_msgSend(v20, "bottomAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "bottomAnchor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "constraintEqualToAnchor:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setActive:", 1);

  objc_msgSend(v20, "topAnchor");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(v115 - 1) < 2
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v62 = (void *)objc_claimAutoreleasedReturnValue(),
        v63 = objc_msgSend(v62, "userInterfaceIdiom"),
        v62,
        v64 = 3.0,
        v63 == 1))
  {
    v64 = 0.0;
  }
  objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController setRightBarButtonTopConstraint:](self, "setRightBarButtonTopConstraint:", v65);

  -[GKDashboardMultiplayerPickerViewController rightBarButtonTopConstraint](self, "rightBarButtonTopConstraint");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setActive:", 1);

  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v50);
  -[GKDashboardMultiplayerPickerViewController navigationItem](self, "navigationItem");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setRightBarButtonItem:", v67);

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController navigationController](self, "navigationController");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "navigationBar");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setTintColor:", v69);

  -[GKDashboardMultiplayerPickerViewController headerTitle](self, "headerTitle");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = *MEMORY[0x1E0DC48D8];
  objc_msgSend(v72, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC48D8]);

  -[GKDashboardMultiplayerPickerViewController headerSubtitle](self, "headerSubtitle");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setMaximumContentSizeCategory:", v73);

  objc_initWeak(&from, val);
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke;
  v118[3] = &unk_1E59C5848;
  objc_copyWeak(&v120, &location);
  objc_copyWeak(&v121, &from);
  v75 = v113;
  v119 = v75;
  objc_msgSend(val, "setNearbyPlayersChangedHandler:", v118);
  -[GKDashboardMultiplayerPickerViewController _updateCollectionView](self, "_updateCollectionView");
  -[NSLayoutConstraint constant](self->_customizeMessageBottomConstraint, "constant");
  self->_initialCustomizeMessageBottomConstraintConstant = v76;
  -[GKDashboardMultiplayerPickerViewController adjustCustomizeMessageConstraint](self, "adjustCustomizeMessageConstraint");
  v114 = v75;
  -[GKDashboardCollectionViewController dataSource](self, "dataSource");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "maxSelectable");

  v79 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "selectedPlayers");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "localizedStringWithFormat:", v81, objc_msgSend(v82, "count"), v78);
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardMultiplayerPickerViewController pickerOrigin](self, "pickerOrigin");
  GKGameCenterUIFrameworkBundle();
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardMultiplayerPickerViewController navigationVisualEffectBackground](self, "navigationVisualEffectBackground");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "layer");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setAllowsGroupBlending:", 0);

  -[GKDashboardMultiplayerPickerViewController headerTitle](self, "headerTitle");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setText:", v84);

  -[GKDashboardMultiplayerPickerViewController headerTitle](self, "headerTitle");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.HeaderTitle"));

  -[GKDashboardMultiplayerPickerViewController headerTitle](self, "headerTitle");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setNumberOfLines:", 1);

  -[GKDashboardMultiplayerPickerViewController headerTitle](self, "headerTitle");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "setAdjustsFontSizeToFitWidth:", 1);

  -[GKDashboardMultiplayerPickerViewController headerSubtitle](self, "headerSubtitle");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setText:", v116);

  -[GKDashboardMultiplayerPickerViewController headerSubtitle](self, "headerSubtitle");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.HeaderSubtitle"));

  -[GKDashboardMultiplayerPickerViewController headerSubtitle](self, "headerSubtitle");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "text");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController collapsedSubtitle](self, "collapsedSubtitle");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setText:", v94);

  -[GKDashboardMultiplayerPickerViewController collapsedSubtitle](self, "collapsedSubtitle");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.CollapsedSubtitle"));

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B50]);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "fontDescriptorWithSymbolicTraits:", 2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v98, 0.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController headerTitle](self, "headerTitle");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "setFont:", v99);

  -[GKDashboardMultiplayerPickerViewController headerSubtitle](self, "headerSubtitle");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "layer");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);

  -[GKDashboardMultiplayerPickerViewController setTitle:](self, "setTitle:", 0);
  -[GKDashboardMultiplayerPickerViewController showContactPickerButton](self, "showContactPickerButton");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "setHidden:", 1);

  -[GKDashboardMultiplayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
  GKGameCenterUIFrameworkBundle();
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController customizeMessageButton](self, "customizeMessageButton");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "setAccessibilityLabel:", v105);

  GKGameCenterUIFrameworkBundle();
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController sendButton](self, "sendButton");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "setAccessibilityLabel:", v108);

  -[GKDashboardMultiplayerPickerViewController setUsePreferredFocusCell:](self, "setUsePreferredFocusCell:", 1);
  objc_destroyWeak(&v121);
  objc_destroyWeak(&v120);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

void __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL8 v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v8 = objc_loadWeakRetained(a1 + 6);
  v9 = v8;
  if (WeakRetained && v8)
  {
    objc_msgSend(a1[4], "cellForItemAtIndexPath:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSelected");

    v12 = objc_msgSend(v9, "itemCount") == 0;
    objc_msgSend(WeakRetained, "noContentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLoading:", v12);

    v14 = a1[4];
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke_2;
    v20[3] = &unk_1E59C54B8;
    v21 = v5;
    v22 = a1[4];
    v23 = v6;
    v16[0] = v15;
    v16[1] = 3221225472;
    v16[2] = __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke_3;
    v16[3] = &unk_1E59C5820;
    v17 = WeakRetained;
    v19 = v11;
    v18 = v23;
    objc_msgSend(v14, "performBatchUpdates:completion:", v20, v16);

  }
}

void __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = (void *)a1[5];
    v8[0] = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deleteItemsAtIndexPaths:", v3);

  }
  v4 = a1[6];
  if (v4)
  {
    v5 = (void *)a1[5];
    v7 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertItemsAtIndexPaths:", v6);

  }
}

void __57__GKDashboardMultiplayerPickerViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateButtonEnableState");
  if (*(_BYTE *)(a1 + 48))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "pickerDataSource");
      v2 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(a1 + 40), 0, 0);

    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
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
  double v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardCollectionViewController viewWillAppear:](&v47, sel_viewWillAppear_, a3);
  -[GKDashboardMultiplayerPickerViewController backgroundEffectView](self, "backgroundEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_4;
  if (-[GKDashboardMultiplayerPickerViewController pickerOrigin](self, "pickerOrigin") == 1)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F58]);
    -[GKDashboardMultiplayerPickerViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerViewController blurEffectForTraitCollection:](self, "blurEffectForTraitCollection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithEffect:", v7);

    objc_msgSend(MEMORY[0x1E0DC3F50], "_gkGameLayerBackgroundVisualEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundEffects:", v8);

    objc_msgSend(v4, "_setGroupName:", CFSTR("gameLayerGroup"));
    -[GKDashboardMultiplayerPickerViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    objc_msgSend(v4, "setFrame:");

    objc_msgSend(v4, "setAutoresizingMask:", 18);
    -[GKDashboardMultiplayerPickerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:atIndex:", v4, 0);

    -[GKDashboardMultiplayerPickerViewController setBackgroundEffectView:](self, "setBackgroundEffectView:", v4);
LABEL_4:

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_willShowKeyboard_, *MEMORY[0x1E0DC4FE8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_willHideKeyboard_, *MEMORY[0x1E0DC4FE0], 0);

  -[GKDashboardMultiplayerPickerViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewControllers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 == 1)
  {
    -[GKDashboardMultiplayerPickerViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leftBarButtonItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "statusBarOrientation") - 1;

      v20 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      +[GKFocusableButton buttonWithType:](GKFocusableButton, "buttonWithType:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setFont:", v22);

      GKGameCenterUIFrameworkBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitle:forState:", v24, 0);

      objc_msgSend(v21, "addTarget:action:forEvents:", self, sel_cancel_, 0x2000);
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTintColor:", v25);

      v26 = *MEMORY[0x1E0CD2EA0];
      objc_msgSend(v21, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setCompositingFilter:", v26);

      objc_msgSend(v21, "titleLabel");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setAdjustsFontForContentSizeCategory:", 1);

      objc_msgSend(v21, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4900]);
      objc_msgSend(v20, "addSubview:", v21);
      objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v21, "leadingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "leadingAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setActive:", 1);

      objc_msgSend(v21, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "trailingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "constraintEqualToAnchor:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setActive:", 1);

      objc_msgSend(v21, "bottomAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setActive:", 1);

      objc_msgSend(v21, "topAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "topAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0.0;
      if (v19 >= 2)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 0.0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "userInterfaceIdiom");

        v40 = 3.0;
        if (v42 == 1)
          v40 = 0.0;
      }
      objc_msgSend(v38, "constraintEqualToAnchor:constant:", v39, v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardMultiplayerPickerViewController setLeftBarButtonTopConstraint:](self, "setLeftBarButtonTopConstraint:", v43);

      -[GKDashboardMultiplayerPickerViewController leftBarButtonTopConstraint](self, "leftBarButtonTopConstraint");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setActive:", 1);

      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v20);
      -[GKDashboardMultiplayerPickerViewController navigationItem](self, "navigationItem");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setLeftBarButtonItem:", v45);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v3 = a3;
  v15[2] = *MEMORY[0x1E0C80C00];
  -[GKDashboardMultiplayerPickerViewController setShouldIgnoreClearSelection:](self, "setShouldIgnoreClearSelection:", 1);
  v13.receiver = self;
  v13.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardCollectionViewController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
  -[GKDashboardMultiplayerPickerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController _gkConfigureFocusGuidesForNavigationBar:](self, "_gkConfigureFocusGuidesForNavigationBar:", v6);

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D25090];
  v9 = *MEMORY[0x1E0D24E00];
  v10 = *MEMORY[0x1E0D24E10];
  v14[0] = *MEMORY[0x1E0D24E18];
  v14[1] = v10;
  v11 = *MEMORY[0x1E0D24E40];
  v15[0] = *MEMORY[0x1E0D24E48];
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportEvent:type:payload:", v8, v9, v12);

}

- (void)updateCollectionViewContentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[GKDashboardMultiplayerPickerViewController headerContentView](self, "headerContentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v4 = v3 + 16.0;
  -[GKDashboardMultiplayerPickerViewController keyboardHeight](self, "keyboardHeight");
  v6 = v5 + 16.0;
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentInset:", v4, 0.0, v6, 0.0);

}

- (void)adjustCustomizeMessageConstraint
{
  BOOL v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  if (self->_customizeMessageBottomConstraint)
    v2 = *MEMORY[0x1E0D253F8] == 0;
  else
    v2 = 0;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
    {
      -[GKDashboardMultiplayerPickerViewController presentingViewController](self, "presentingViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[NSLayoutConstraint setConstant:](self->_customizeMessageBottomConstraint, "setConstant:", self->_initialCustomizeMessageBottomConstraintConstant);
      }
      else
      {
        -[GKDashboardMultiplayerPickerViewController tabBarController](self, "tabBarController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "tabBar");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bounds");
        -[NSLayoutConstraint setConstant:](self->_customizeMessageBottomConstraint, "setConstant:", v8 + self->_initialCustomizeMessageBottomConstraintConstant);

      }
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[7];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  v7 = a4;
  -[GKDashboardMultiplayerPickerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__GKDashboardMultiplayerPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E59C5870;
  v8[4] = self;
  *(double *)&v8[5] = width;
  *(double *)&v8[6] = height;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &__block_literal_global_14);

}

void __97__GKDashboardMultiplayerPickerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "adjustCustomizeMessageConstraint");
  if (*(double *)(a1 + 40) >= *(double *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 == 1)
      v6 = 0.0;
    else
      v6 = 3.0;
    objc_msgSend(*(id *)(a1 + 32), "rightBarButtonTopConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setConstant:", v6);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
      v3 = 0.0;
    else
      v3 = 3.0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "rightBarButtonTopConstraint");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0.0;
    objc_msgSend(v2, "setConstant:", 0.0);

  }
  objc_msgSend(*(id *)(a1 + 32), "leftBarButtonTopConstraint");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConstant:", v3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardCollectionViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  if (!-[GKDashboardCollectionViewController isLoading](self, "isLoading"))
  {
    -[GKDashboardMultiplayerPickerViewController _updateCollectionView](self, "_updateCollectionView");
    -[GKDashboardMultiplayerPickerViewController updateNavHeaderHeightAndOpacity](self, "updateNavHeaderHeightAndOpacity");
    -[GKDashboardMultiplayerPickerViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v6)
    {
      v8 = (void *)MEMORY[0x1E0CB36B8];
      -[GKDashboardCollectionViewController collectionView](self, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexSetWithIndexesInRange:", 0, objc_msgSend(v9, "numberOfSections"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKDashboardCollectionViewController collectionView](self, "collectionView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "reloadSections:", v10);

    }
  }

}

- (id)blurEffectForTraitCollection:(id)a3
{
  _BOOL4 v3;

  v3 = objc_msgSend(a3, "userInterfaceStyle") == 2;
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 2 * v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)configureComposeTextView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController setRecipientMap:](self, "setRecipientMap:", v3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController setRecipientPlayerMap:](self, "setRecipientPlayerMap:", v4);

  objc_msgSend(MEMORY[0x1E0D136B0], "preferredHeight");
  v6 = v5;
  -[GKDashboardMultiplayerPickerViewController composeTextViewHeightConstraint](self, "composeTextViewHeightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  v28 = objc_alloc_init(MEMORY[0x1E0D136B0]);
  objc_msgSend(v28, "setDelegate:", self);
  v8 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, &stru_1E59EB978);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLabel:", v11);

  objc_msgSend(v28, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextAlignment:", 4);

  objc_msgSend(v28, "setSeparatorHidden:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBackgroundColor:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTintColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  -[GKDashboardMultiplayerPickerViewController searchFieldPlaceHolderText](self, "searchFieldPlaceHolderText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "textView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v17);

  -[GKDashboardMultiplayerPickerViewController setComposeTextViewShowingPlaceholderText:](self, "setComposeTextViewShowingPlaceholderText:", 1);
  objc_msgSend(v28, "setShowsAddButtonWhenExpanded:", 0);
  -[GKDashboardMultiplayerPickerViewController composeTextViewContainer](self, "composeTextViewContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v28);

  objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[GKDashboardMultiplayerPickerViewController composeTextViewContainerBackground](self, "composeTextViewContainerBackground");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeFromSuperview");

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[GKDashboardMultiplayerPickerViewController composeTextViewContainer](self, "composeTextViewContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_gkInstallEdgeConstraintsForView:containedWithinParentView:edgeInsets:", v28, v22, 5.0, -6.0, 0.0, 6.0);

  -[GKDashboardMultiplayerPickerViewController setComposeTextView:](self, "setComposeTextView:", v28);
  -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "label");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.composeSection.label"));

  -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.composeSection"));

  -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "textView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.composeSection.placeHolderText"));

}

- (void)addRecipientForPlayers:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v18;
  void *v19;
  GKComposeRecipient *v20;

  v6 = a4;
  v7 = a3;
  v20 = -[GKComposeRecipient initWithContact:address:kind:]([GKComposeRecipient alloc], "initWithContact:address:kind:", 0, v6, 5);
  -[GKDashboardMultiplayerPickerViewController recipientMap](self, "recipientMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v6);

  -[GKDashboardMultiplayerPickerViewController recipientPlayerMap](self, "recipientPlayerMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v20);

  -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addRecipient:", v20);

  -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "atomViewForRecipient:", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "colorWithAlphaComponent:", 0.1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTintColor:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTextColor:", v16);

  v18 = *MEMORY[0x1E0CD2EA0];
  objc_msgSend(v12, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCompositingFilter:", v18);

}

- (void)removeRecipientWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[GKDashboardMultiplayerPickerViewController recipientMap](self, "recipientMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKDashboardMultiplayerPickerViewController setRecipientRemovedImplicitly:](self, "setRecipientRemovedImplicitly:", 1);
    -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeRecipient:", v6);

    -[GKDashboardMultiplayerPickerViewController setRecipientRemovedImplicitly:](self, "setRecipientRemovedImplicitly:", 0);
    if (v6)
    {
      -[GKDashboardMultiplayerPickerViewController recipientPlayerMap](self, "recipientPlayerMap");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObjectForKey:", v6);

    }
    -[GKDashboardMultiplayerPickerViewController recipientMap](self, "recipientMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

    v4 = v10;
  }

}

- (void)highlightRecipients:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id obj;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "atomViewForRecipient:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = (void *)MEMORY[0x1E0DC3F10];
        v17[0] = v7;
        v17[1] = 3221225472;
        v17[2] = __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke;
        v17[3] = &unk_1E59C4148;
        v18 = v11;
        v15[0] = v7;
        v15[1] = 3221225472;
        v15[2] = __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke_2;
        v15[3] = &unk_1E59C4430;
        v16 = v18;
        v13 = v18;
        objc_msgSend(v12, "animateWithDuration:animations:completion:", v17, v15, 0.25);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

void __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

void __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x1E0DC3F10];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke_3;
  v2[3] = &unk_1E59C4148;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:", v2, 0.25);

}

void __66__GKDashboardMultiplayerPickerViewController_highlightRecipients___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

- (void)setMessage:(id)a3
{
  NSString *v4;
  NSString *message;
  id WeakRetained;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    message = self->_message;
    self->_message = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->_messageField);
    objc_msgSend(WeakRetained, "setText:", v7);

  }
}

- (BOOL)supportsNearby
{
  void *v2;
  char v3;

  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsNearby");

  return v3;
}

- (void)setSupportsNearby:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSupportsNearby:", v3);

  -[GKDashboardMultiplayerPickerViewController searchFieldPlaceHolderText](self, "searchFieldPlaceHolderText");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceholder:", v7);

}

- (BOOL)nearbyOnly
{
  void *v2;
  char v3;

  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nearbyOnly");

  return v3;
}

- (void)setNearbyDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNearbyDelegate:", v4);

}

- (BOOL)hasData
{
  return 1;
}

- (id)searchFieldPlaceHolderText
{
  void *v2;
  void *v3;

  -[GKDashboardMultiplayerPickerViewController excludesContacts](self, "excludesContacts");
  GKGameCenterUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFirstResponder");

  if (v6)
  {
    -[GKDashboardMultiplayerPickerViewController setSkipAddressTokenization:](self, "setSkipAddressTokenization:", 1);
    -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resignFirstResponder");

    -[GKDashboardMultiplayerPickerViewController setSkipAddressTokenization:](self, "setSkipAddressTokenization:", 0);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v6 = a3;
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v6)
  {
    v5 = -[GKDashboardMultiplayerPickerViewController isAnimatingComposeTextViewSizeChange](self, "isAnimatingComposeTextViewSizeChange");

    if (!v5)
      -[GKDashboardMultiplayerPickerViewController updateNavHeaderHeightAndOpacity](self, "updateNavHeaderHeightAndOpacity");
  }
  else
  {

  }
}

- (void)updateNavHeaderHeightAndOpacity
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  float v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  double v31;
  double v32;
  id v33;

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "horizontalSizeClass") == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "verticalSizeClass") != 2;

  }
  else
  {
    v8 = 1;
  }

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == 1 || v8)
  {
    -[GKDashboardMultiplayerPickerViewController composeTextViewHeightConstraint](self, "composeTextViewHeightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constant");
    v13 = v14;
  }
  else
  {
    -[GKDashboardMultiplayerPickerViewController headerContentView](self, "headerContentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
  }

  -[GKDashboardMultiplayerPickerViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "safeAreaInsets");
  v17 = v13 + v16 + 16.0;

  -[GKDashboardMultiplayerPickerViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaInsets");
  v20 = -v5 - v19 + -16.0;

  if (v13 >= v20)
    v20 = v13;
  -[GKDashboardMultiplayerPickerViewController navigationHeaderHeightConstraint](self, "navigationHeaderHeightConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setConstant:", v20);

  v22 = (v5 + v17) / 24.0;
  if (v22 > 1.0)
    v22 = 1.0;
  v23 = fmax(v22, 0.0);
  -[GKDashboardMultiplayerPickerViewController navigationVisualEffectBackground](self, "navigationVisualEffectBackground");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v26 = v23;
  objc_msgSend(v25, "setOpacity:", v26);

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "userInterfaceIdiom");

  v29 = v28 == 1 || v8;
  if (v29 == 1
    && (-[GKDashboardMultiplayerPickerViewController navigationHeaderHeightConstraint](self, "navigationHeaderHeightConstraint"), v30 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v30, "constant"), v32 = v31, v30, v32 <= v13))
  {
    -[GKDashboardMultiplayerPickerViewController showCollapsedTitleAndSubtitleInNavBar](self, "showCollapsedTitleAndSubtitleInNavBar");
  }
  else
  {
    -[GKDashboardMultiplayerPickerViewController navigationItem](self, "navigationItem");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTitleView:", 0);

  }
}

- (void)showCollapsedTitleAndSubtitleInNavBar
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
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

  v33 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v3, "setAxis:", 1);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[GKDashboardMultiplayerPickerViewController headerTitle](self, "headerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  objc_msgSend(v4, "sizeToFit");
  objc_msgSend(MEMORY[0x1E0DC1350], "_gkPreferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4AD0], 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v7);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v8);

  objc_msgSend(v4, "setAdjustsFontForContentSizeCategory:", 1);
  v9 = *MEMORY[0x1E0DC4900];
  objc_msgSend(v4, "setMaximumContentSizeCategory:", *MEMORY[0x1E0DC4900]);
  objc_msgSend(v3, "addArrangedSubview:", v4);
  v10 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[GKDashboardMultiplayerPickerViewController headerSubtitle](self, "headerSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v12);

  objc_msgSend(v10, "sizeToFit");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v14);

  v15 = *MEMORY[0x1E0CD2EA0];
  objc_msgSend(v10, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompositingFilter:", v15);

  objc_msgSend(v10, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v10, "setMaximumContentSizeCategory:", v9);
  -[GKDashboardMultiplayerPickerViewController setCollapsedSubtitle:](self, "setCollapsedSubtitle:", v10);
  objc_msgSend(v3, "addArrangedSubview:", v10);
  objc_msgSend(v3, "setAlignment:", 3);
  objc_msgSend(v3, "setDistribution:", 0);
  objc_msgSend(v33, "addSubview:", v3);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "heightAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintGreaterThanOrEqualToConstant:", 44.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  objc_msgSend(v3, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v22) = 1144750080;
  objc_msgSend(v21, "setPriority:", v22);
  objc_msgSend(v21, "setActive:", 1);
  objc_msgSend(v3, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  objc_msgSend(v3, "leadingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  objc_msgSend(v3, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[GKDashboardMultiplayerPickerViewController navigationItem](self, "navigationItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTitleView:", v33);

}

- (void)dockHeaderViewIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  id v33;

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  -[GKDashboardMultiplayerPickerViewController navigationHeaderHeightConstraint](self, "navigationHeaderHeightConstraint");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constant");
  v9 = v8;
  -[GKDashboardMultiplayerPickerViewController composeTextViewHeightConstraint](self, "composeTextViewHeightConstraint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constant");
  if (v9 <= v11)
  {

  }
  else
  {
    -[GKDashboardMultiplayerPickerViewController navigationHeaderHeightConstraint](self, "navigationHeaderHeightConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constant");
    v14 = v13;
    -[GKDashboardMultiplayerPickerViewController headerContentView](self, "headerContentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;

    if (v14 >= v17)
      return;
    -[GKDashboardMultiplayerPickerViewController navigationHeaderHeightConstraint](self, "navigationHeaderHeightConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constant");
    v20 = v19;
    -[GKDashboardMultiplayerPickerViewController composeTextViewHeightConstraint](self, "composeTextViewHeightConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constant");
    v23 = v20 - v22;

    -[GKDashboardMultiplayerPickerViewController headerContentView](self, "headerContentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    v26 = v25;
    -[GKDashboardMultiplayerPickerViewController composeTextViewHeightConstraint](self, "composeTextViewHeightConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constant");
    v29 = v26 - v28;

    if (v23 >= v29 * 0.5)
      v30 = -(v29 - v23);
    else
      v30 = v23;
    v31 = v7 + v30;
    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setScrollEnabled:", 0);

    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setContentOffset:animated:", 1, v5, v31);
  }

}

- (void)collapseHeaderView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  v5 = v4;
  v7 = v6;

  -[GKDashboardMultiplayerPickerViewController navigationHeaderHeightConstraint](self, "navigationHeaderHeightConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constant");
  v10 = v9;
  -[GKDashboardMultiplayerPickerViewController composeTextViewHeightConstraint](self, "composeTextViewHeightConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constant");
  v13 = v12;

  if (v10 > v13)
  {
    -[GKDashboardMultiplayerPickerViewController navigationHeaderHeightConstraint](self, "navigationHeaderHeightConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constant");
    v16 = v15;
    -[GKDashboardMultiplayerPickerViewController composeTextViewHeightConstraint](self, "composeTextViewHeightConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constant");
    v19 = v16 - v18;

    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setScrollEnabled:", 0);

    -[GKDashboardCollectionViewController collectionView](self, "collectionView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setContentOffset:animated:", 1, v5, v7 + v19);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[GKDashboardMultiplayerPickerViewController dockHeaderViewIfNeeded](self, "dockHeaderViewIfNeeded");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[GKDashboardMultiplayerPickerViewController dockHeaderViewIfNeeded](self, "dockHeaderViewIfNeeded");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v3;

  -[GKDashboardCollectionViewController collectionView](self, "collectionView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEnabled:", 1);

}

- (void)setupNoContentView:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    GKGameCenterUIFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v12);

    objc_msgSend(v6, "setMessage:", 0);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)GKDashboardMultiplayerPickerViewController;
    -[GKDashboardCollectionViewController setupNoContentView:withError:](&v13, sel_setupNoContentView_withError_, v6, v7);
  }

}

- (void)dataUpdated:(BOOL)a3 withError:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardCollectionViewController dataUpdated:withError:](&v5, sel_dataUpdated_withError_, a3, a4);
  -[GKDashboardMultiplayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
}

- (id)preferredFocusEnvironments
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  objc_super v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsAllFriends");

  if (!v4)
  {
LABEL_5:
    WeakRetained = objc_loadWeakRetained((id *)&self->_sendButton);
    if ((objc_msgSend(WeakRetained, "isEnabled") & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_sendButton);

      if (v7)
      {
        v14 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {

    }
    v13.receiver = self;
    v13.super_class = (Class)GKDashboardMultiplayerPickerViewController;
    -[GKDashboardCollectionViewController preferredFocusEnvironments](&v13, sel_preferredFocusEnvironments);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  v5 = (void *)MEMORY[0x1E0CB36B0];
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:inSection:", (int)objc_msgSend(v6, "numberOfFriendsToShowInitially"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForItemAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_5;
  }
  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v10;
}

- (id)createSortPickerMenu
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
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
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id location;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "friendSortFilterScope");

  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC3428];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __66__GKDashboardMultiplayerPickerViewController_createSortPickerMenu__block_invoke;
  v26[3] = &unk_1E59C58B8;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.Sort.Recents"));
  objc_msgSend(v10, "setState:", v5 == 0);
  v11 = (void *)MEMORY[0x1E0DC3428];
  GKGameCenterUIFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  v22 = 3221225472;
  v23 = __66__GKDashboardMultiplayerPickerViewController_createSortPickerMenu__block_invoke_2;
  v24 = &unk_1E59C58B8;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", v13, 0, 0, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("GKDashBoardMultiplayerPickerView.Sort.ABC"), v21, v22, v23, v24);
  objc_msgSend(v14, "setState:", v5 == 1);
  v15 = (void *)MEMORY[0x1E0DC39D0];
  GKGameCenterUIFrameworkBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v10;
  v29[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "menuWithTitle:children:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v19;
}

void __66__GKDashboardMultiplayerPickerViewController_createSortPickerMenu__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "pickerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "friendSortFilterScope");

  v7 = objc_loadWeakRetained(&to);
  objc_msgSend(v7, "pickerDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFriendSortFilterScope:", 0);

  if (v6)
  {
    v9 = objc_loadWeakRetained(&to);
    objc_msgSend(v9, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadSections:", v11);

  }
  objc_destroyWeak(&to);

}

void __66__GKDashboardMultiplayerPickerViewController_createSortPickerMenu__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "pickerDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "friendSortFilterScope");

  v7 = objc_loadWeakRetained(&to);
  objc_msgSend(v7, "pickerDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFriendSortFilterScope:", 1);

  if (v6 != 1)
  {
    v9 = objc_loadWeakRetained(&to);
    objc_msgSend(v9, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadSections:", v11);

  }
  objc_destroyWeak(&to);

}

- (void)pickerDatasource:(id)a3 didPickPlayers:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[GKDashboardMultiplayerPickerViewController multiplayerPickerDelegate](self, "multiplayerPickerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[GKDashboardMultiplayerPickerViewController multiplayerPickerDelegate](self, "multiplayerPickerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectedMessageGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerViewController message](self, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiplayerPicker:didPickPlayers:messageGroups:customMessage:", self, v11, v9, v10);

  }
}

- (void)pickerDatasourceDidSelectAddFriend:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D25238], "reporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("invite"), CFSTR("button"), CFSTR("friendSelect"), CFSTR("multiplayer"));

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__GKDashboardMultiplayerPickerViewController_pickerDatasourceDidSelectAddFriend___block_invoke;
  v5[3] = &unk_1E59C58E0;
  v5[4] = self;
  +[FriendRequestFacilitator makeViewControllerWithRecipients:chatGUID:completionHandler:](_TtC12GameCenterUI24FriendRequestFacilitator, "makeViewControllerWithRecipients:chatGUID:completionHandler:", MEMORY[0x1E0C9AA60], 0, v5);
}

uint64_t __81__GKDashboardMultiplayerPickerViewController_pickerDatasourceDidSelectAddFriend___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", a2, 1, 0);
}

- (void)pickerDatasource:(id)a3 didSelectPlayers:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && objc_msgSend(v10, "fromPeopleSuggester"))
  {
    -[GKDashboardMultiplayerPickerViewController composedNameForSuggestedMessageGroup:](self, "composedNameForSuggestedMessageGroup:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerViewController addRecipientForPlayers:withName:](self, "addRecipientForPlayers:withName:", v9, v12);

  }
  else
  {
    v26 = v9;
    v27 = v8;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v18, "displayName", v26, v27, (_QWORD)v28);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v21 = v19;
          }
          else
          {
            objc_msgSend(v18, "displayNameWithOptions:", 0);
            v21 = (id)objc_claimAutoreleasedReturnValue();
          }
          v22 = v21;

          v32 = v18;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKDashboardMultiplayerPickerViewController addRecipientForPlayers:withName:](self, "addRecipientForPlayers:withName:", v23, v22);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v15);
    }

    v9 = v26;
    v8 = v27;
  }
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource", v26, v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isSearching");

  if (v25)
    -[GKDashboardMultiplayerPickerViewController didEndSearchTextEditing](self, "didEndSearchTextEditing");
  -[GKDashboardMultiplayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");

}

- (void)highlightAlreadySelectedPlayers:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "fromPeopleSuggester"))
  {
    -[GKDashboardMultiplayerPickerViewController composedNameForSuggestedMessageGroup:](self, "composedNameForSuggestedMessageGroup:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerViewController recipientMap](self, "recipientMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v31[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardMultiplayerPickerViewController highlightRecipients:](self, "highlightRecipients:", v12);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v25 = v6;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v18, "displayName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v19)
          {
            v21 = v19;
          }
          else
          {
            objc_msgSend(v18, "displayNameWithOptions:", 0);
            v21 = (id)objc_claimAutoreleasedReturnValue();
          }
          v22 = v21;

          -[GKDashboardMultiplayerPickerViewController recipientMap](self, "recipientMap");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
            objc_msgSend(v9, "addObject:", v24);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v15);
    }

    -[GKDashboardMultiplayerPickerViewController highlightRecipients:](self, "highlightRecipients:", v9);
    v6 = v25;
  }

}

- (void)pickerDatasource:(id)a3 didDeselectPlayers:(id)a4 inGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10 && objc_msgSend(v10, "fromPeopleSuggester"))
  {
    -[GKDashboardMultiplayerPickerViewController composedNameForSuggestedMessageGroup:](self, "composedNameForSuggestedMessageGroup:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerViewController recipientMap](self, "recipientMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[GKDashboardMultiplayerPickerViewController removeRecipientWithName:](self, "removeRecipientWithName:", v12);
      goto LABEL_16;
    }

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = v9;
  v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v19, "displayName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          v22 = v20;
        }
        else
        {
          objc_msgSend(v19, "displayNameWithOptions:", 0);
          v22 = (id)objc_claimAutoreleasedReturnValue();
        }
        v23 = v22;

        -[GKDashboardMultiplayerPickerViewController removeRecipientWithName:](self, "removeRecipientWithName:", v23);
      }
      v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v16);
  }
LABEL_16:

  -[GKDashboardMultiplayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
  -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "isFirstResponder") & 1) == 0)
  {
    -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "recipients");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "count"))
    {

    }
    else
    {
      -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
      v36 = v8;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textView");
      v29 = v9;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "text");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v31, "length");

      v9 = v29;
      v8 = v36;

      if (v35)
        goto LABEL_21;
      -[GKDashboardMultiplayerPickerViewController searchFieldPlaceHolderText](self, "searchFieldPlaceHolderText");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "textView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setText:", v32);

      -[GKDashboardMultiplayerPickerViewController setComposeTextViewShowingPlaceholderText:](self, "setComposeTextViewShowingPlaceholderText:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "textView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTextColor:", v24);
    }

  }
LABEL_21:

}

- (void)playerGroupDidExpandInPlace
{
  -[GKDashboardMultiplayerPickerViewController setUsePreferredFocusCell:](self, "setUsePreferredFocusCell:", 0);
}

- (void)clearSelection
{
  void *v3;
  objc_super v4;

  if (!self->_shouldIgnoreClearSelection)
  {
    v4.receiver = self;
    v4.super_class = (Class)GKDashboardMultiplayerPickerViewController;
    -[GKDashboardCollectionViewController clearSelection](&v4, sel_clearSelection);
    -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearSelection");

    -[GKDashboardMultiplayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
  }
}

- (id)composedNameForSuggestedMessageGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
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
  uint64_t v40;
  void *v41;
  void *v42;

  v3 = a3;
  objc_msgSend(v3, "players");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(v3, "players");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 == 1)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayNameWithOptions:", 0);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "players");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 == 2)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "displayNameWithOptions:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "displayNameWithOptions:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", v14, v16, v18);
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v14;
        goto LABEL_11;
      }
      objc_msgSend(v3, "players");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      if (v20 == 3)
      {
        v41 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v40 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "displayNameWithOptions:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "displayNameWithOptions:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "displayNameWithOptions:", 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "stringWithFormat:", v40, v21, v23, v25);
        v10 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v40;
        goto LABEL_11;
      }
      objc_msgSend(v3, "players");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27 >= 4)
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        GKGameCenterUIFrameworkBundle();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "displayNameWithOptions:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "displayNameWithOptions:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", v30, v32, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        GKGameCenterUIFrameworkBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        GKGetLocalizedStringFromTableInBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "players");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v37, "count") - 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringByAppendingFormat:", v5, v38);
        v10 = objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      GKGameCenterUIFrameworkBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      GKGetLocalizedStringFromTableInBundle();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
LABEL_11:

    v5 = (void *)v10;
  }

  return v5;
}

- (void)send:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**completionHandler)(id, void *, NSString *);
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0D25238], "reporter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("navigate"), CFSTR("inviteFriends"), CFSTR("button"), CFSTR("lobby"), CFSTR("multiplayer"));

  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedPlayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[GKDashboardMultiplayerPickerViewController message](self, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24E68]);

    }
    objc_msgSend(v15, "pickerWillSendInvites");
    objc_msgSend(v15, "selectedMessageGroups");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    completionHandler = (void (**)(id, void *, NSString *))self->_completionHandler;
    if (completionHandler)
    {
      completionHandler[2](completionHandler, v5, self->_message);
      -[GKDashboardMultiplayerPickerViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
    }
    else
    {
      -[GKDashboardMultiplayerPickerViewController multiplayerPickerDelegate](self, "multiplayerPickerDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        -[GKDashboardMultiplayerPickerViewController multiplayerPickerDelegate](self, "multiplayerPickerDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKDashboardMultiplayerPickerViewController message](self, "message");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "multiplayerPicker:didPickPlayers:messageGroups:customMessage:", self, v5, v9, v14);

      }
    }
    -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);

  }
}

- (void)addMessage:(id)a3
{
  void *v4;
  GKMultiplayerCustomInviteMessageViewController *v5;
  void *v6;
  id v7;

  +[NSObject _gkPlatformNibName](GKMultiplayerCustomInviteMessageViewController, "_gkPlatformNibName", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GKMultiplayerCustomInviteMessageViewController initWithNibName:bundle:]([GKMultiplayerCustomInviteMessageViewController alloc], "initWithNibName:bundle:", v7, v4);
  -[GKMultiplayerCustomInviteMessageViewController setDelegate:](v5, "setDelegate:", self);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v5);
  objc_msgSend(v6, "setOverrideUserInterfaceStyle:", 2);
  -[GKDashboardMultiplayerPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

}

- (void)cancel:(id)a3
{
  id completionHandler;
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  completionHandler = self->_completionHandler;
  if (completionHandler)
  {
    (*((void (**)(id, _QWORD, _QWORD))completionHandler + 2))(completionHandler, 0, 0);
    -[GKDashboardMultiplayerPickerViewController setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  -[UIViewController _gkRemoveViewController:animated:](self, "_gkRemoveViewController:animated:", self, 1);
  -[GKDashboardMultiplayerPickerViewController multiplayerPickerDelegate](self, "multiplayerPickerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[GKDashboardMultiplayerPickerViewController multiplayerPickerDelegate](self, "multiplayerPickerDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiplayerPickerDidCancel:", self);

  }
}

- (void)updateAddMessageButtonVisibility
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "shouldAllowCustomCommunication"))
  {

    goto LABEL_6;
  }
  v4 = -[GKDashboardMultiplayerPickerViewController pickerOrigin](self, "pickerOrigin");

  if (v4 != 1)
  {
LABEL_6:
    -[GKDashboardMultiplayerPickerViewController navBarMessageButton](self, "navBarMessageButton");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);
    goto LABEL_9;
  }
  -[GKDashboardMultiplayerPickerViewController navBarMessageButton](self, "navBarMessageButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[GKDashboardMultiplayerPickerViewController navBarMessageButton](self, "navBarMessageButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  v7 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithFont:", v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[GKDashboardMultiplayerPickerViewController message](self, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.bubble"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithConfiguration:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithRenderingMode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("plus.bubble"), v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithRenderingMode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[GKDashboardMultiplayerPickerViewController navBarMessageButton](self, "navBarMessageButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImage:forState:", v13, 0);

LABEL_9:
}

- (void)customInviteViewController:(id)a3 didFinishWithMessage:(id)a4
{
  id v5;

  v5 = a4;
  -[GKDashboardMultiplayerPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[GKDashboardMultiplayerPickerViewController setMessage:](self, "setMessage:", v5);

  -[GKDashboardMultiplayerPickerViewController updateAddMessageButtonVisibility](self, "updateAddMessageButtonVisibility");
}

- (void)handleSearchTextFieldReturn:(id)a3
{
  id v4;

  -[GKDashboardMultiplayerPickerViewController didEndSearchTextEditing](self, "didEndSearchTextEditing", a3);
  -[GKDashboardMultiplayerPickerViewController showContactPickerButton](self, "showContactPickerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  _QWORD block[5];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageField);

  if (WeakRetained == v4)
  {
    v7 = objc_loadWeakRetained((id *)&self->_messageField);
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKDashboardMultiplayerPickerViewController setMessage:](self, "setMessage:", v8);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__GKDashboardMultiplayerPickerViewController_textFieldShouldReturn___block_invoke;
    block[3] = &unk_1E59C4148;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[GKDashboardMultiplayerPickerViewController handleSearchTextFieldReturn:](self, "handleSearchTextFieldReturn:", v4);
      objc_msgSend(v4, "resignFirstResponder");
    }
  }

  return WeakRetained != v4;
}

uint64_t __68__GKDashboardMultiplayerPickerViewController_textFieldShouldReturn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "send:", *(_QWORD *)(a1 + 32));
}

- (void)_updateButtonEnableState
{
  void *v3;
  _BOOL8 v4;
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
  id v15;

  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedPlayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  -[GKDashboardMultiplayerPickerViewController navBarSendButton](self, "navBarSendButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v4);

  -[GKDashboardMultiplayerPickerViewController updateAddMessageButtonVisibility](self, "updateAddMessageButtonVisibility");
  v6 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selectedPlayers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"), objc_msgSend(v15, "maxSelectable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController headerSubtitle](self, "headerSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[GKDashboardMultiplayerPickerViewController headerSubtitle](self, "headerSubtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController collapsedSubtitle](self, "collapsedSubtitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;

  v32 = a4;
  v7 = a5;
  if (objc_msgSend(v7, "section"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v32;
      -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "playerForIndexPath:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "internal");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contact");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_gkCompositeName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "friendSortFilterScope") == 1;

      -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "configureWithPlayer:isCoreRecent:matchedContactName:onlyShowContactName:", v10, objc_msgSend(v16, "isPlayerAtIndexPathCoreRecent:", v7), v13, v15);

      objc_msgSend(v8, "setAccessibilityPrefix:", CFSTR("picker.friends"));
      -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "playerStates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "referenceKey");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "integerValue");

      if (v21 != 2)
      {
        objc_msgSend(v8, "setSelected:", v21 == 1);
        v22 = objc_msgSend(v8, "isSelected");
        -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v22)
          objc_msgSend(v23, "selectItemAtIndexPath:animated:scrollPosition:", v7, 0, 0);
        else
          objc_msgSend(v23, "deselectItemAtIndexPath:animated:", v7, 0);

      }
    }
  }
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "cornerMaskForItemAtIndexPath:", v7);

  objc_msgSend(v32, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v26)
  {
    objc_msgSend(v27, "setMasksToBounds:", 1);

    objc_msgSend(v32, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setMaskedCorners:", v26);

    objc_msgSend(v32, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", 14.0);

    v31 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v32, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setCornerCurve:", v31);
  }
  else
  {
    objc_msgSend(v27, "setCornerRadius:", 0.0);
  }

}

- (void)didPressShowContactPickerButton:(id)a3
{
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0C974B0]);
  objc_msgSend(v4, "setDelegate:", self);
  -[GKDashboardMultiplayerPickerViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)contactPickerDidCancel:(id)a3
{
  -[UIViewController _gkDismissViewController:animated:](self, "_gkDismissViewController:animated:", a3, 1);
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didPickContact:", v5);

}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;

  -[GKDashboardMultiplayerPickerViewController didBeginSearchTextEditing](self, "didBeginSearchTextEditing", a3);
  -[GKDashboardMultiplayerPickerViewController showContactPickerButton](self, "showContactPickerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKDashboardMultiplayerPickerViewController setSearchText:](self, "setSearchText:", v12);

  v13 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(v10, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "replaceCharactersInRange:withString:", location, length, v9);
  -[GKDashboardMultiplayerPickerViewController setSearchText:](self, "setSearchText:", v15);

  return 1;
}

- (void)willShowKeyboard:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = -[GKDashboardMultiplayerPickerViewController excludesContacts](self, "excludesContacts") ^ 1;
  -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsAddButtonWhenExpanded:", v4);

  -[GKDashboardMultiplayerPickerViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "verticalSizeClass");

  if (v7 == 1)
    -[GKDashboardMultiplayerPickerViewController collapseHeaderView](self, "collapseHeaderView");
  objc_msgSend(v17, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC4E90]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CGRectValue");
  v11 = v10;

  -[GKDashboardMultiplayerPickerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  -[GKDashboardMultiplayerPickerViewController setKeyboardHeight:](self, "setKeyboardHeight:", v11 - v13);

  -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isFirstResponder");

  if (v15)
  {
    -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", self);

  }
}

- (void)willHideKeyboard:(id)a3
{
  -[GKDashboardMultiplayerPickerViewController setKeyboardHeight:](self, "setKeyboardHeight:", a3, 0.0);
}

- (void)didBeginSearchTextEditing
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24E90]);

}

- (void)setSearchText:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSearching") & 1) == 0 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24E98]);

  }
  objc_msgSend(v4, "setSearchText:", v6);
  -[GKDashboardMultiplayerPickerViewController dataUpdated:withError:](self, "dataUpdated:withError:", 1, 0);

}

- (void)didEndSearchTextEditing
{
  void *v3;
  id v4;

  -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  -[GKDashboardMultiplayerPickerViewController setSearchText:](self, "setSearchText:", 0);
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  unint64_t v11;
  _QWORD *v12;
  void *v13;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstResponder");

  if (v9)
  {
    -[GKDashboardMultiplayerPickerViewController searchTextField](self, "searchTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resignFirstResponder");

  }
  v14.receiver = self;
  v14.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardCollectionViewController collectionView:didSelectItemAtIndexPath:](&v14, sel_collectionView_didSelectItemAtIndexPath_, v6, v7);
  -[GKDashboardMultiplayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
  v11 = objc_msgSend(v7, "section");

  if (v11 <= 2)
  {
    v12 = (_QWORD *)qword_1E59C5978[v11];
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportEvent:type:", *MEMORY[0x1E0D25068], *v12);

  }
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardCollectionViewController collectionView:didDeselectItemAtIndexPath:](&v5, sel_collectionView_didDeselectItemAtIndexPath_, a3, a4);
  -[GKDashboardMultiplayerPickerViewController _updateButtonEnableState](self, "_updateButtonEnableState");
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKDashboardMultiplayerPickerViewController;
  -[GKDashboardMultiplayerPickerViewController viewSafeAreaInsetsDidChange](&v8, sel_viewSafeAreaInsetsDidChange);
  -[GKDashboardMultiplayerPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[GKDashboardMultiplayerPickerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[GKDashboardMultiplayerPickerViewController collectionSectionInset](self, "collectionSectionInset");
    objc_msgSend(v7, "setSectionInset:");

  }
}

- (UIEdgeInsets)collectionSectionInset
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  -[GKDashboardMultiplayerPickerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4 + 20.0;
  -[GKDashboardMultiplayerPickerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7 + 20.0;

  v9 = 10.0;
  v10 = 0.0;
  v11 = v5;
  v12 = v8;
  result.right = v12;
  result.bottom = v10;
  result.left = v11;
  result.top = v9;
  return result;
}

- (void)_updateCollectionView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  -[GKDashboardCollectionViewController setToHorizontalLayout:](self, "setToHorizontalLayout:", 0);
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setClipsToBounds:", 1);
  objc_msgSend(v8, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayout");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0CB3788];
    v5 = v3;
    objc_msgSend(v4, "indexSetWithIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSectionsThatShowHeaderWhenEmpty:", v6);

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSectionsThatShowFootersWhenEmpty:", v7);

    objc_msgSend(v5, "setMinimumLineSpacing:", 0.0);
    -[GKDashboardMultiplayerPickerViewController collectionSectionInset](self, "collectionSectionInset");
    objc_msgSend(v5, "setSectionInset:");
    objc_msgSend(v5, "setCentersItemsInExcessSpace:", 1);

  }
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(v5, "clearText");
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTextColor:", v6);
  -[GKDashboardMultiplayerPickerViewController setComposeTextViewShowingPlaceholderText:](self, "setComposeTextViewShowingPlaceholderText:", 0);
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!-[GKDashboardMultiplayerPickerViewController skipAddressTokenization](self, "skipAddressTokenization"))
  {
    -[GKDashboardMultiplayerPickerViewController searchFieldPlaceHolderText](self, "searchFieldPlaceHolderText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      if (-[GKDashboardMultiplayerPickerViewController excludesContacts](self, "excludesContacts"))
      {
        -[GKDashboardMultiplayerPickerViewController composeTextView](self, "composeTextView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKDashboardMultiplayerPickerViewController composeRecipientView:didAddRecipient:](self, "composeRecipientView:didAddRecipient:", v8, 0);

        if (!*MEMORY[0x1E0D25460])
          v9 = (id)GKOSLoggers();
        v10 = (void *)*MEMORY[0x1E0D25470];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
        {
          v11 = (void *)MEMORY[0x1E0CB37E8];
          v12 = (void *)MEMORY[0x1E0D253B0];
          v13 = v10;
          objc_msgSend(v12, "shared");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v14, "multiplayerAllowedPlayerType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_1AB361000, v13, OS_LOG_TYPE_INFO, "Not forming contact from address that players input, since GKPreferences.shared.multiplayerAllowedPlayerType is set to: %@", buf, 0xCu);

        }
      }
      else
      {
        -[GKDashboardMultiplayerPickerViewController recipientMap](self, "recipientMap");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v22 = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKDashboardMultiplayerPickerViewController highlightRecipients:](self, "highlightRecipients:", v18);
        }
        else
        {
          +[GKMessageUtilities playerWithPhoneNumberOrEmail:givenName:](GKMessageUtilities, "playerWithPhoneNumberOrEmail:givenName:", v5, v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24DE0]);

            -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "contact");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "didPickContact:", v21);

          }
        }

      }
    }
  }

}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  if (!-[GKDashboardMultiplayerPickerViewController recipientRemovedImplicitly](self, "recipientRemovedImplicitly"))
  {
    v5 = v12;
    -[GKDashboardMultiplayerPickerViewController recipientPlayerMap](self, "recipientPlayerMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKDashboardMultiplayerPickerViewController recipientPlayerMap](self, "recipientPlayerMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v5);

    -[GKDashboardMultiplayerPickerViewController recipientMap](self, "recipientMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "removeObjectForKey:", v10);
    -[GKDashboardMultiplayerPickerViewController pickerDataSource](self, "pickerDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "didRemoveRecipientPlayers:", v7);

  }
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5;

  v5 = a4;
  if (!-[GKDashboardMultiplayerPickerViewController composeTextViewShowingPlaceholderText](self, "composeTextViewShowingPlaceholderText"))-[GKDashboardMultiplayerPickerViewController setSearchText:](self, "setSearchText:", v5);

}

- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id obj;
  _QWORD v30[5];
  id v31;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "recipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E20];
  -[GKDashboardMultiplayerPickerViewController recipientPlayerMap](self, "recipientPlayerMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke;
  v38[3] = &unk_1E59C5908;
  v12 = v11;
  v39 = v12;
  v27 = v7;
  v28 = v6;
  v40 = v27;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v38);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
        -[GKDashboardMultiplayerPickerViewController removedRecipientPlayerMap](self, "removedRecipientPlayerMap");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v19 = (void *)objc_opt_new();
          -[GKDashboardMultiplayerPickerViewController setRemovedRecipientPlayerMap:](self, "setRemovedRecipientPlayerMap:", v19);

        }
        -[GKDashboardMultiplayerPickerViewController recipientPlayerMap](self, "recipientPlayerMap");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKDashboardMultiplayerPickerViewController removedRecipientPlayerMap](self, "removedRecipientPlayerMap");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "address");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

        -[GKDashboardMultiplayerPickerViewController composeRecipientView:didRemoveRecipient:](self, "composeRecipientView:didRemoveRecipient:", v5, v17);
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v14);
  }

  v24 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke_2;
  v32[3] = &unk_1E59C5930;
  v25 = v5;
  v33 = v25;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v32);
  v30[0] = v24;
  v30[1] = 3221225472;
  v30[2] = __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke_3;
  v30[3] = &unk_1E59C5908;
  v30[4] = self;
  v31 = v25;
  v26 = v25;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v30);

}

void __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v4;
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);
    else
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

uint64_t __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRecipient:", a2);
}

void __87__GKDashboardMultiplayerPickerViewController_composeRecipientView_didSelectRecipients___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v14;
    objc_msgSend(*(id *)(a1 + 32), "removedRecipientPlayerMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "pickerDataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didAddRecipientPlayers:", v6);
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "address");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "composeRecipientView:didFinishEnteringAddress:", v13, v8);
    }

    goto LABEL_8;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    v12 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v14, "address");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "composeRecipientView:didFinishEnteringAddress:", v11, v3);
LABEL_8:

    v10 = v14;
  }

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[8];
  _QWORD v16[4];
  uint64_t v17;
  uint64_t v18;

  height = a4.height;
  v6 = a3;
  -[GKDashboardMultiplayerPickerViewController setIsAnimatingComposeTextViewSizeChange:](self, "setIsAnimatingComposeTextViewSizeChange:", 1);
  -[GKDashboardMultiplayerPickerViewController composeTextViewHeightConstraint](self, "composeTextViewHeightConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constant");
  v9 = v8;

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3010000000;
  v17 = 0;
  v18 = 0;
  v16[3] = &unk_1AB8BD257;
  -[GKDashboardCollectionViewController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentOffset");
  v17 = v11;
  v18 = v12;

  -[GKDashboardMultiplayerPickerViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__GKDashboardMultiplayerPickerViewController_composeHeaderView_didChangeSize___block_invoke;
  v15[3] = &unk_1E59C5958;
  v15[6] = fmax(height, 54.0);
  v15[7] = v9;
  v15[4] = self;
  v15[5] = v16;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __78__GKDashboardMultiplayerPickerViewController_composeHeaderView_didChangeSize___block_invoke_2;
  v14[3] = &unk_1E59C4430;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v15, v14, 0.3);
  _Block_object_dispose(v16, 8);

}

void __78__GKDashboardMultiplayerPickerViewController_composeHeaderView_didChangeSize___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "composeTextViewHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  objc_msgSend(*(id *)(a1 + 32), "navigationHeaderHeightConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(double *)(a1 + 48) - *(double *)(a1 + 56);
  objc_msgSend(v4, "constant");
  objc_msgSend(v4, "setConstant:", v6 + v5);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 40)
                                                              - (*(double *)(a1 + 48)
                                                               - *(double *)(a1 + 56));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(double *)(v7 + 32);
  v9 = *(double *)(v7 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentOffset:", v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

}

uint64_t __78__GKDashboardMultiplayerPickerViewController_composeHeaderView_didChangeSize___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingComposeTextViewSizeChange:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateNavHeaderHeightAndOpacity");
  return objc_msgSend(*(id *)(a1 + 32), "updateCollectionViewContentInsets");
}

- (void)composeRecipientViewReturnPressed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    objc_msgSend(v12, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      goto LABEL_4;
    -[GKDashboardMultiplayerPickerViewController searchFieldPlaceHolderText](self, "searchFieldPlaceHolderText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);

    -[GKDashboardMultiplayerPickerViewController setComposeTextViewShowingPlaceholderText:](self, "setComposeTextViewShowingPlaceholderText:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v4);

  }
LABEL_4:
  -[GKDashboardMultiplayerPickerViewController didEndSearchTextEditing](self, "didEndSearchTextEditing");
  objc_msgSend(v12, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resignFirstResponder");

}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[GKDashboardMultiplayerPickerViewController composeTextViewShowingPlaceholderText](self, "composeTextViewShowingPlaceholderText"))
  {
    objc_msgSend(v6, "clearText");
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTextColor:", v4);

    -[GKDashboardMultiplayerPickerViewController setComposeTextViewShowingPlaceholderText:](self, "setComposeTextViewShowingPlaceholderText:", 0);
  }
  -[GKDashboardMultiplayerPickerViewController didBeginSearchTextEditing](self, "didBeginSearchTextEditing");

}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  -[GKDashboardMultiplayerPickerViewController didPressShowContactPickerButton:](self, "didPressShowContactPickerButton:", 0);
}

- (NSString)message
{
  return self->_message;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (GKDashboardNearbyBrowserDelegate)nearbyDelegate
{
  return self->_nearbyDelegate;
}

- (GKDashboardMultiplayerPickerDelegate)multiplayerPickerDelegate
{
  return (GKDashboardMultiplayerPickerDelegate *)objc_loadWeakRetained((id *)&self->_multiplayerPickerDelegate);
}

- (void)setMultiplayerPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_multiplayerPickerDelegate, a3);
}

- (BOOL)shouldIgnoreClearSelection
{
  return self->_shouldIgnoreClearSelection;
}

- (void)setShouldIgnoreClearSelection:(BOOL)a3
{
  self->_shouldIgnoreClearSelection = a3;
}

- (int64_t)pickerOrigin
{
  return self->_pickerOrigin;
}

- (void)setPickerOrigin:(int64_t)a3
{
  self->_pickerOrigin = a3;
}

- (BOOL)usePreferredFocusCell
{
  return self->_usePreferredFocusCell;
}

- (void)setUsePreferredFocusCell:(BOOL)a3
{
  self->_usePreferredFocusCell = a3;
}

- (UILabel)descriptionLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_descriptionLabel);
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeWeak((id *)&self->_descriptionLabel, a3);
}

- (UIButton)sendButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_sendButton);
}

- (void)setSendButton:(id)a3
{
  objc_storeWeak((id *)&self->_sendButton, a3);
}

- (UIButton)customizeMessageButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_customizeMessageButton);
}

- (void)setCustomizeMessageButton:(id)a3
{
  objc_storeWeak((id *)&self->_customizeMessageButton, a3);
}

- (UITextField)messageField
{
  return (UITextField *)objc_loadWeakRetained((id *)&self->_messageField);
}

- (void)setMessageField:(id)a3
{
  objc_storeWeak((id *)&self->_messageField, a3);
}

- (UIVisualEffectView)backgroundEffectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_backgroundEffectView);
}

- (void)setBackgroundEffectView:(id)a3
{
  objc_storeWeak((id *)&self->_backgroundEffectView, a3);
}

- (UIVisualEffectView)navigationVisualEffectBackground
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_navigationVisualEffectBackground);
}

- (void)setNavigationVisualEffectBackground:(id)a3
{
  objc_storeWeak((id *)&self->_navigationVisualEffectBackground, a3);
}

- (NSLayoutConstraint)navigationHeaderHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_navigationHeaderHeightConstraint);
}

- (void)setNavigationHeaderHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_navigationHeaderHeightConstraint, a3);
}

- (UILabel)headerTitle
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_headerTitle);
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeWeak((id *)&self->_headerTitle, a3);
}

- (UILabel)headerSubtitle
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_headerSubtitle);
}

- (void)setHeaderSubtitle:(id)a3
{
  objc_storeWeak((id *)&self->_headerSubtitle, a3);
}

- (UIStackView)headerContentView
{
  return (UIStackView *)objc_loadWeakRetained((id *)&self->_headerContentView);
}

- (void)setHeaderContentView:(id)a3
{
  objc_storeWeak((id *)&self->_headerContentView, a3);
}

- (UIView)collapsedTitleContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_collapsedTitleContainer);
}

- (void)setCollapsedTitleContainer:(id)a3
{
  objc_storeWeak((id *)&self->_collapsedTitleContainer, a3);
}

- (UILabel)collapsedTitle
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_collapsedTitle);
}

- (void)setCollapsedTitle:(id)a3
{
  objc_storeWeak((id *)&self->_collapsedTitle, a3);
}

- (UILabel)collapsedSubtitle
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_collapsedSubtitle);
}

- (void)setCollapsedSubtitle:(id)a3
{
  objc_storeWeak((id *)&self->_collapsedSubtitle, a3);
}

- (NSMutableDictionary)recipientPlayerMap
{
  return self->_recipientPlayerMap;
}

- (void)setRecipientPlayerMap:(id)a3
{
  objc_storeStrong((id *)&self->_recipientPlayerMap, a3);
}

- (NSMutableDictionary)removedRecipientPlayerMap
{
  return self->_removedRecipientPlayerMap;
}

- (void)setRemovedRecipientPlayerMap:(id)a3
{
  objc_storeStrong((id *)&self->_removedRecipientPlayerMap, a3);
}

- (NSMutableDictionary)recipientMap
{
  return self->_recipientMap;
}

- (void)setRecipientMap:(id)a3
{
  objc_storeStrong((id *)&self->_recipientMap, a3);
}

- (BOOL)recipientRemovedImplicitly
{
  return self->_recipientRemovedImplicitly;
}

- (void)setRecipientRemovedImplicitly:(BOOL)a3
{
  self->_recipientRemovedImplicitly = a3;
}

- (BOOL)skipAddressTokenization
{
  return self->_skipAddressTokenization;
}

- (void)setSkipAddressTokenization:(BOOL)a3
{
  self->_skipAddressTokenization = a3;
}

- (BOOL)isAnimatingComposeTextViewSizeChange
{
  return self->_isAnimatingComposeTextViewSizeChange;
}

- (void)setIsAnimatingComposeTextViewSizeChange:(BOOL)a3
{
  self->_isAnimatingComposeTextViewSizeChange = a3;
}

- (NSLayoutConstraint)customizeMessageBottomConstraint
{
  return self->_customizeMessageBottomConstraint;
}

- (void)setCustomizeMessageBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_customizeMessageBottomConstraint, a3);
}

- (double)initialCustomizeMessageBottomConstraintConstant
{
  return self->_initialCustomizeMessageBottomConstraintConstant;
}

- (void)setInitialCustomizeMessageBottomConstraintConstant:(double)a3
{
  self->_initialCustomizeMessageBottomConstraintConstant = a3;
}

- (CNContactPickerViewController)contactPicker
{
  return self->_contactPicker;
}

- (void)setContactPicker:(id)a3
{
  objc_storeStrong((id *)&self->_contactPicker, a3);
}

- (BOOL)excludesContacts
{
  return self->_excludesContacts;
}

- (void)setExcludesContacts:(BOOL)a3
{
  self->_excludesContacts = a3;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (UIView)composeTextViewContainer
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_composeTextViewContainer);
}

- (void)setComposeTextViewContainer:(id)a3
{
  objc_storeWeak((id *)&self->_composeTextViewContainer, a3);
}

- (UIView)composeTextViewContainerBackground
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_composeTextViewContainerBackground);
}

- (void)setComposeTextViewContainerBackground:(id)a3
{
  objc_storeWeak((id *)&self->_composeTextViewContainerBackground, a3);
}

- (NSLayoutConstraint)composeTextViewContainerBackgroundHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_composeTextViewContainerBackgroundHeightConstraint);
}

- (void)setComposeTextViewContainerBackgroundHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_composeTextViewContainerBackgroundHeightConstraint, a3);
}

- (CNComposeRecipientTextView)composeTextView
{
  return self->_composeTextView;
}

- (void)setComposeTextView:(id)a3
{
  objc_storeStrong((id *)&self->_composeTextView, a3);
}

- (NSLayoutConstraint)composeTextViewHeightConstraint
{
  return self->_composeTextViewHeightConstraint;
}

- (void)setComposeTextViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_composeTextViewHeightConstraint, a3);
}

- (BOOL)composeTextViewShowingPlaceholderText
{
  return self->_composeTextViewShowingPlaceholderText;
}

- (void)setComposeTextViewShowingPlaceholderText:(BOOL)a3
{
  self->_composeTextViewShowingPlaceholderText = a3;
}

- (UIButton)navBarMessageButton
{
  return self->_navBarMessageButton;
}

- (void)setNavBarMessageButton:(id)a3
{
  objc_storeStrong((id *)&self->_navBarMessageButton, a3);
}

- (UIButton)navBarSendButton
{
  return self->_navBarSendButton;
}

- (void)setNavBarSendButton:(id)a3
{
  objc_storeStrong((id *)&self->_navBarSendButton, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIView)dividerLine
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_dividerLine);
}

- (void)setDividerLine:(id)a3
{
  objc_storeWeak((id *)&self->_dividerLine, a3);
}

- (NSLayoutConstraint)rightBarButtonTopConstraint
{
  return self->_rightBarButtonTopConstraint;
}

- (void)setRightBarButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_rightBarButtonTopConstraint, a3);
}

- (NSLayoutConstraint)leftBarButtonTopConstraint
{
  return self->_leftBarButtonTopConstraint;
}

- (void)setLeftBarButtonTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftBarButtonTopConstraint, a3);
}

- (GKPickerSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (void)setSearchTextField:(id)a3
{
  objc_storeStrong((id *)&self->_searchTextField, a3);
}

- (UIButton)showContactPickerButton
{
  return self->_showContactPickerButton;
}

- (void)setShowContactPickerButton:(id)a3
{
  objc_storeStrong((id *)&self->_showContactPickerButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showContactPickerButton, 0);
  objc_storeStrong((id *)&self->_searchTextField, 0);
  objc_storeStrong((id *)&self->_leftBarButtonTopConstraint, 0);
  objc_storeStrong((id *)&self->_rightBarButtonTopConstraint, 0);
  objc_destroyWeak((id *)&self->_dividerLine);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_navBarSendButton, 0);
  objc_storeStrong((id *)&self->_navBarMessageButton, 0);
  objc_storeStrong((id *)&self->_composeTextViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_composeTextView, 0);
  objc_destroyWeak((id *)&self->_composeTextViewContainerBackgroundHeightConstraint);
  objc_destroyWeak((id *)&self->_composeTextViewContainerBackground);
  objc_destroyWeak((id *)&self->_composeTextViewContainer);
  objc_storeStrong((id *)&self->_contactPicker, 0);
  objc_storeStrong((id *)&self->_customizeMessageBottomConstraint, 0);
  objc_storeStrong((id *)&self->_recipientMap, 0);
  objc_storeStrong((id *)&self->_removedRecipientPlayerMap, 0);
  objc_storeStrong((id *)&self->_recipientPlayerMap, 0);
  objc_destroyWeak((id *)&self->_collapsedSubtitle);
  objc_destroyWeak((id *)&self->_collapsedTitle);
  objc_destroyWeak((id *)&self->_collapsedTitleContainer);
  objc_destroyWeak((id *)&self->_headerContentView);
  objc_destroyWeak((id *)&self->_headerSubtitle);
  objc_destroyWeak((id *)&self->_headerTitle);
  objc_destroyWeak((id *)&self->_navigationHeaderHeightConstraint);
  objc_destroyWeak((id *)&self->_navigationVisualEffectBackground);
  objc_destroyWeak((id *)&self->_backgroundEffectView);
  objc_destroyWeak((id *)&self->_messageField);
  objc_destroyWeak((id *)&self->_customizeMessageButton);
  objc_destroyWeak((id *)&self->_sendButton);
  objc_destroyWeak((id *)&self->_descriptionLabel);
  objc_destroyWeak((id *)&self->_multiplayerPickerDelegate);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
