@implementation CNStarkContactsListViewController

- (CNStarkContactsListViewController)init
{
  void *v3;
  CNStarkContactsListViewController *v4;

  +[CNContactListViewController collectionViewLayout](CNContactListViewController, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNStarkContactsListViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v3);

  return v4;
}

- (CNStarkContactsListViewController)initWithCollectionViewLayout:(id)a3
{
  CNStarkContactsListViewController *v3;
  CNStarkContactsListViewController *v4;
  CNStarkContactsListViewController *v5;
  CNStarkContactsListViewController *v6;
  CNStarkContactsListViewController *v7;
  id v8;
  id v9;
  uint64_t v10;
  AVExternalDevice *externalDevice;
  void *v12;
  AIMLExperimentationAnalyticsManager *v13;
  AIMLExperimentationAnalyticsManager *analyticsManager;
  uint64_t v15;
  TRIClient *trialClient;
  _QWORD block[4];
  CNStarkContactsListViewController *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CNStarkContactsListViewController;
  v3 = -[CNContactListViewController initWithCollectionViewLayout:](&v20, sel_initWithCollectionViewLayout_, a3);
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__CNStarkContactsListViewController_initWithCollectionViewLayout___block_invoke;
    block[3] = &unk_1E204F648;
    v5 = v3;
    v6 = v5;
    v19 = v5;
    if (initWithCollectionViewLayout__cn_once_token_8 == -1)
    {
      v7 = v5;
    }
    else
    {
      dispatch_once(&initWithCollectionViewLayout__cn_once_token_8, block);
      v7 = v19;
    }
    v8 = (id)initWithCollectionViewLayout__cn_once_object_8;

    -[CNStarkContactsListViewController setDisplayedContactProperties:](v6, "setDisplayedContactProperties:", v8);
    v9 = objc_alloc_init(MEMORY[0x1E0C97218]);
    objc_msgSend(v9, "setStyle:", 0);
    objc_msgSend(v9, "setEmphasizesPrimaryNameComponent:", 1);
    objc_msgSend(v9, "setFallbackStyle:", -1);
    -[CNContactListViewController setContactFormatter:](v6, "setContactFormatter:", v9);
    -[CNContactListViewController setShouldDisplayCount:](v6, "setShouldDisplayCount:", 0);
    -[CNContactListViewController setDelegate:](v6, "setDelegate:", v6);
    -[CNContactListViewController setShouldDisplayEmergencyContacts:](v6, "setShouldDisplayEmergencyContacts:", 0);
    -[CNStarkContactsListViewController setupDataSource](v6, "setupDataSource");
    objc_msgSend(MEMORY[0x1E0C8B1B8], "currentCarPlayExternalDevice");
    v10 = objc_claimAutoreleasedReturnValue();
    externalDevice = v6->_externalDevice;
    v6->_externalDevice = (AVExternalDevice *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel_limitedUINotification_, *MEMORY[0x1E0C8A258], v6->_externalDevice);

    v13 = (AIMLExperimentationAnalyticsManager *)objc_alloc_init(MEMORY[0x1E0CF1388]);
    analyticsManager = v6->_analyticsManager;
    v6->_analyticsManager = v13;

    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 331);
    v15 = objc_claimAutoreleasedReturnValue();
    trialClient = v6->_trialClient;
    v6->_trialClient = (TRIClient *)v15;

  }
  return v4;
}

- (void)setupDataSource
{
  CNContactStoreDataSource *v3;
  id v4;
  void *v5;
  CNContactStoreDataSource *v6;

  v3 = [CNContactStoreDataSource alloc];
  v4 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v6 = -[CNContactStoreDataSource initWithStore:](v3, "initWithStore:", v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactListViewController contactFormatter](self, "contactFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStoreDataSource setContactFormatter:](v6, "setContactFormatter:", v5);

  }
  -[CNContactListViewController setDataSource:](self, "setDataSource:", v6);

}

- (CNStarkContactsListViewController)initWithDataSource:(id)a3 searchable:(BOOL)a4 environment:(id)a5 shouldUseLargeTitle:(BOOL)a6
{
  CNStarkContactsListViewController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNStarkContactsListViewController;
  v6 = -[CNContactListViewController initWithDataSource:searchable:environment:shouldUseLargeTitle:](&v8, sel_initWithDataSource_searchable_environment_shouldUseLargeTitle_, a3, 0, a5, a6);
  -[CNContactListViewController setIsHandlingSearch:](v6, "setIsHandlingSearch:", 0);

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C8A258], self->_externalDevice);

  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactsListViewController;
  -[CNContactListViewController dealloc](&v4, sel_dealloc);
}

- (id)createCollectionView
{
  CNContactListCollectionView *v3;
  void *v4;
  void *v5;
  void *v6;
  CNContactListCollectionView *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = [CNContactListCollectionView alloc];
  v4 = (void *)objc_opt_class();
  -[CNStarkContactsListViewController contactListStyleApplier](self, "contactListStyleApplier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CNStarkContactsListViewController_createCollectionView__block_invoke;
  v10[3] = &unk_1E204A068;
  v10[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__CNStarkContactsListViewController_createCollectionView__block_invoke_2;
  v9[3] = &unk_1E204A090;
  objc_msgSend(v4, "collectionViewLayoutWithFloatingHeaderViews:contactListStyleApplier:directionalLayoutMargins:hasNoContacts:", 1, v5, v10, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNContactListCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CNStarkContactsListViewController setContactListTableView:](self, "setContactListTableView:", v7);

  -[CNStarkContactsListViewController contactListTableView](self, "contactListTableView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDirectionalEdgeInsets)viewDirectionalLayoutMargins
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  int v12;
  double *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSDirectionalEdgeInsets result;

  if (-[CNStarkContactsListViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[CNStarkContactsListViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "directionalLayoutMargins");
    v5 = v4;
    v7 = v6;
    v32 = v9;
    v33 = v8;

    v10 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
    objc_msgSend(MEMORY[0x1E0C8B1B8], "currentCarPlayExternalDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "rightHandDrive");

    if (v12)
    {
      if (v10 == 1)
        v13 = &v32;
      else
        v13 = &v33;
    }
    else if (v10 == 1)
    {
      -[CNStarkContactsListViewController contactListTableView](self, "contactListTableView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessoryViewAtEdge:", 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v13 = &v33;
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v17, "desiredAccessoryEdge") == 1)
        v13 = &v32;

    }
    else
    {
      v13 = &v32;
    }
    *v13 = *v13 + 44.0;
    -[CNStarkContactsListViewController view](self, "view", *(_QWORD *)&v32, *(_QWORD *)&v33);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "safeAreaInsets");
    v20 = v19;
    v22 = v21;

    -[CNStarkContactsListViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bounds");
    v15 = v32;
    v14 = v33;
    v25 = v24 - v33 - v32 - v20 - v22;

    v26 = round((v25 + -480.0) * 0.25);
    if (v25 > 480.0 && v26 > 12.0)
    {
      v14 = v14 + v26;
      v15 = v15 + v26;
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0DC3298];
    v14 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v7 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v15 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  }
  v28 = v5;
  v29 = v14;
  v30 = v7;
  v31 = v15;
  result.trailing = v31;
  result.bottom = v30;
  result.leading = v29;
  result.top = v28;
  return result;
}

- (void)updateLimitedUI
{
  void *v3;
  void *v4;
  id v5;

  -[CNStarkContactsListViewController externalDevice](self, "externalDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "limitedUI") & 1) != 0)
  {
    -[CNStarkContactsListViewController externalDevice](self, "externalDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "limitedUIElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactsListViewController setLimitedUI:](self, "setLimitedUI:", objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0C8A260]));

  }
  else
  {
    -[CNStarkContactsListViewController setLimitedUI:](self, "setLimitedUI:", 0);
  }

}

- (void)setLimitedUI:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__CNStarkContactsListViewController_setLimitedUI___block_invoke;
  v3[3] = &unk_1E204C4D0;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactsListViewController;
  -[CNContactListViewController viewDidLoad](&v5, sel_viewDidLoad);
  +[CNUIColorRepository carPlayTableViewBackgroundColor](CNUIColorRepository, "carPlayTableViewBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactsListViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactsListViewController;
  -[CNContactListViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CNStarkContactsListViewController updateLimitedUI](self, "updateLimitedUI");
  -[CNStarkContactsListViewController sendSiriExperimentTriggerLoggingIfEligible](self, "sendSiriExperimentTriggerLoggingIfEligible");
  -[CNStarkContactsListViewController postMessageOverlayIfNecessary](self, "postMessageOverlayIfNecessary");
}

- (void)sendSiriExperimentTriggerLoggingIfEligible
{
  NSObject *v3;
  AIMLExperimentationAnalyticsManager *analyticsManager;
  void *v5;
  id v6;
  uint8_t v7[16];

  if (+[CNStarkUtilities vehicleHasBuiltInMic](CNStarkUtilities, "vehicleHasBuiltInMic")
    && +[CNStarkUtilities siriLanguageMatchesSystemLanguage](CNStarkUtilities, "siriLanguageMatchesSystemLanguage")&& -[CNStarkContactsListViewController deviceIsEnrolledInDirectActionExperiment](self, "deviceIsEnrolledInDirectActionExperiment"))
  {
    CNUILogStarkSiriExperiment();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "#ABStarkExperiment User is in Jarvis Car. Emitting Trigger Logging...", v7, 2u);
    }

    analyticsManager = self->_analyticsManager;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("acf17e91-9c40-4d2b-825f-d74e75f3707c"));
    v6 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    -[AIMLExperimentationAnalyticsManager emitTriggerForCodePathID:withNamespace:requestID:completionHandler:](analyticsManager, "emitTriggerForCodePathID:withNamespace:requestID:completionHandler:", v5, CFSTR("SIRI_CARPLAY_JARVIS"), v6, &__block_literal_global_20240);

  }
}

- (BOOL)deviceIsEnrolledInDirectActionExperiment
{
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  char v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[TRIClient refresh](self->_trialClient, "refresh");
  -[TRIClient experimentIdentifiersWithNamespaceName:](self->_trialClient, "experimentIdentifiersWithNamespaceName:", CFSTR("SIRI_CARPLAY_JARVIS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNUILogStarkSiriExperiment();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("TRUE");
    if (!v3)
      v5 = CFSTR("FALSE");
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "#ABStarkExperiment The device is enrolled in an experiment with namespace SIRI_CARPLAY_JARVIS: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v3)
  {
    objc_msgSend(v3, "experimentId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("65dfd24b12edf62098adc714"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _QWORD v4[5];
  CGSize v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __88__CNStarkContactsListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E204A0D8;
  v4[4] = self;
  v5 = a3;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v4, 0);
}

- (void)contactDataSourceDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactsListViewController;
  -[CNContactListViewController contactDataSourceDidChange:](&v4, sel_contactDataSourceDidChange_, a3);
  -[CNStarkContactsListViewController postMessageOverlayIfNecessary](self, "postMessageOverlayIfNecessary");
}

- (void)refreshTableViewHeaderWithSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  CNStarkHeaderPlatterView *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
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
  _QWORD v81[6];

  height = a3.height;
  width = a3.width;
  v81[4] = *MEMORY[0x1E0C80C00];
  -[CNStarkContactsListViewController siriHeaderView](self, "siriHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNStarkContactsListViewController siriHeaderView](self, "siriHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;
    v13 = v12;

    -[CNStarkContactsListViewController headerViewWidthForSize:](self, "headerViewWidthForSize:", width, height);
    v15 = v14;
    -[CNStarkContactsListViewController siriHeaderView](self, "siriHeaderView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", v9, v11, v15, v13);
  }
  else
  {
    v17 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v16 = (void *)objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(v16, "frame");
    v19 = v18;
    v21 = v20;
    v22 = *MEMORY[0x1E0DC53D0];
    -[CNStarkContactsListViewController headerViewWidthForSize:](self, "headerViewWidthForSize:", width, height);
    objc_msgSend(v16, "setFrame:", v19, v21, v23, v22);
    v24 = -[CNStarkContactsListViewController isSiriDirectActionTextExperimentGroup](self, "isSiriDirectActionTextExperimentGroup");
    CNContactsUIBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
      v27 = CFSTR("HEY_SIRI_MAKE_A_CALL");
    else
      v27 = CFSTR("ASK_SIRI_TO_MAKE_CALL");
    objc_msgSend(v25, "localizedStringForKey:value:table:", v27, &stru_1E20507A8, CFSTR("Localized"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0DC3888];
    +[CNUIFontRepository carPlaySymbolImageFont](CNUIFontRepository, "carPlaySymbolImageFont");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "configurationWithFont:scale:", v29, 3);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("siri"), v80);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CNStarkHeaderPlatterView initWithLabelText:accessoryImage:]([CNStarkHeaderPlatterView alloc], "initWithLabelText:accessoryImage:", v79, v78);
    -[CNStarkHeaderPlatterView setTranslatesAutoresizingMaskIntoConstraints:](v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v16, "addSubview:", v30);
    objc_msgSend(v16, "setUserInteractionEnabled:", 1);
    v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleSiriHeaderViewTap_);
    objc_msgSend(v16, "addGestureRecognizer:", v77);
    v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleSiriHeaderViewTap_);
    objc_msgSend(v76, "setAllowedPressTypes:", &unk_1E20D37C0);
    objc_msgSend(v16, "addGestureRecognizer:", v76);
    v70 = (void *)MEMORY[0x1E0CB3718];
    -[CNStarkHeaderPlatterView leftAnchor](v30, "leftAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leftAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = v73;
    -[CNStarkHeaderPlatterView rightAnchor](v30, "rightAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "rightAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v71);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v81[1] = v69;
    -[CNStarkHeaderPlatterView topAnchor](v30, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v81[2] = v33;
    -[CNStarkHeaderPlatterView bottomAnchor](v30, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v81[3] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "activateConstraints:", v37);

    -[CNStarkContactsListViewController setSiriHeaderView:](self, "setSiriHeaderView:", v16);
  }

  -[CNStarkContactsListViewController siriHeaderView](self, "siriHeaderView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v40 = v39;
  v42 = v41;
  v44 = v43;

  -[CNStarkContactsListViewController viewDirectionalLayoutMargins](self, "viewDirectionalLayoutMargins");
  v46 = v45;
  v48 = v47;
  -[CNStarkContactsListViewController traitCollection](self, "traitCollection");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "layoutDirection");

  -[CNStarkContactsListViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "safeAreaInsets");
  v53 = v52;

  if (v50 == 1)
    v54 = v48;
  else
    v54 = v46;
  v55 = v54 - v53;
  -[CNStarkContactsListViewController siriHeaderView](self, "siriHeaderView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFrame:", v55, v40, v42, v44);

  -[CNStarkContactsListViewController contactListTableView](self, "contactListTableView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "accessoryViewAtEdge:", 1);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNStarkContactsListViewController setHadScrollAccessoryAtLastHeaderViewUpdate:](self, "setHadScrollAccessoryAtLastHeaderViewUpdate:", v58 != 0);
  -[CNContactListViewController listHeaderView](self, "listHeaderView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "superview");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    objc_opt_class();
    -[CNContactListViewController listHeaderView](self, "listHeaderView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "superview");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "superview");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v64 = v63;
    else
      v64 = 0;
    v65 = v64;

    if (v65)
    {
      -[CNStarkContactsListViewController siriHeaderView](self, "siriHeaderView");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setHeaderView:", v66);

    }
    -[CNStarkContactsListViewController collectionView](self, "collectionView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "collectionViewLayout");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "invalidateLayout");

  }
  else
  {
    -[CNStarkContactsListViewController siriHeaderView](self, "siriHeaderView");
    v65 = (id)objc_claimAutoreleasedReturnValue();
    -[CNContactListViewController setListHeaderView:](self, "setListHeaderView:", v65);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactsListViewController;
  -[CNContactListViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  if (!-[CNStarkContactsListViewController hadScrollAccessoryAtLastHeaderViewUpdate](self, "hadScrollAccessoryAtLastHeaderViewUpdate"))
  {
    -[CNStarkContactsListViewController contactListTableView](self, "contactListTableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessoryViewAtEdge:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[CNContactListViewController refreshTableViewHeaderIfVisible](self, "refreshTableViewHeaderIfVisible");
  }
}

- (BOOL)isSiriDirectActionTextExperimentGroup
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  char v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (+[CNStarkUtilities vehicleHasBuiltInMic](CNStarkUtilities, "vehicleHasBuiltInMic")
    && +[CNStarkUtilities siriLanguageMatchesSystemLanguage](CNStarkUtilities, "siriLanguageMatchesSystemLanguage"))
  {
    -[TRIClient refresh](self->_trialClient, "refresh");
    -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", CFSTR("isHSSiriActionButtonPhone"), CFSTR("SIRI_CARPLAY_JARVIS"));
    v3 = objc_claimAutoreleasedReturnValue();
    CNUILogStarkSiriExperiment();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = -[NSObject BOOLeanValue](v3, "BOOLeanValue");
      v6 = CFSTR("FALSE");
      if (v5)
        v6 = CFSTR("TRUE");
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_18AC56000, v4, OS_LOG_TYPE_INFO, "#ABStarkExperiment The user is in the experimental group: %@", (uint8_t *)&v9, 0xCu);
    }

    v7 = -[NSObject BOOLeanValue](v3, "BOOLeanValue");
  }
  else
  {
    CNUILogStarkSiriExperiment();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18AC56000, v3, OS_LOG_TYPE_INFO, "#ABStarkExperiment This vehicle or device isn't eligible for the experiment", (uint8_t *)&v9, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (double)headerViewWidthForSize:(CGSize)a3
{
  double width;
  double v4;
  double v5;

  width = a3.width;
  -[CNStarkContactsListViewController viewDirectionalLayoutMargins](self, "viewDirectionalLayoutMargins", a3.width, a3.height);
  return width - v4 - v5;
}

- (void)handleSiriHeaderViewTap:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  getkAssistantDirectActionEventKey[0]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  v8[0] = &unk_1E20D2EB0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc((Class)getSiriDirectActionContextClass[0]()), "initWithPayload:", v4);
  v6 = objc_alloc_init((Class)getSiriDirectActionSourceClass[0]());
  objc_msgSend(v6, "activateWithContext:", v5);

}

- (void)postMessageOverlayIfNecessary
{
  void *v3;
  void *v4;
  CNStarkNoContentBannerView *v5;
  CNStarkNoContentBannerView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  id v13;

  if (-[CNStarkContactsListViewController limitedUI](self, "limitedUI")
    && (CNContactsUIBundle(),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONTACTS_ACCESS_LIMITED"), &stru_1E20507A8, CFSTR("Localized")), v13 = (id)objc_claimAutoreleasedReturnValue(), v3, v13))
  {
    -[CNStarkContactsListViewController overlayView](self, "overlayView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = [CNStarkNoContentBannerView alloc];
      v6 = -[CNStarkNoContentBannerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CNStarkContactsListViewController setOverlayView:](self, "setOverlayView:", v6);

    }
    -[CNStarkContactsListViewController overlayView](self, "overlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitleString:", v13);

    -[CNStarkContactsListViewController overlayView](self, "overlayView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSiriButtonEnabled:", 1);

    -[CNStarkContactsListViewController showOverlayView](self, "showOverlayView");
  }
  else
  {
    -[CNContactListViewController dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") == 0;
    -[CNContactListViewController listHeaderView](self, "listHeaderView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", v11);

    -[CNStarkContactsListViewController showContactListTableView](self, "showContactListTableView");
  }
}

- (void)showOverlayView
{
  void *v3;
  void *v4;
  id v5;

  -[CNStarkContactsListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactsListViewController overlayView](self, "overlayView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    -[CNStarkContactsListViewController overlayView](self, "overlayView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactsListViewController setView:](self, "setView:", v5);

  }
}

- (void)showContactListTableView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[CNStarkContactsListViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNStarkContactsListViewController contactListTableView](self, "contactListTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    -[CNStarkContactsListViewController contactListTableView](self, "contactListTableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactsListViewController setCollectionView:](self, "setCollectionView:", v5);

    -[CNStarkContactsListViewController contactListTableView](self, "contactListTableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNStarkContactsListViewController setView:](self, "setView:", v6);

    -[CNContactListViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[CNStarkContactsListViewController collectionView](self, "collectionView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 2, 0);

    }
  }
}

- (id)contactListStyleApplier
{
  return 0;
}

- (BOOL)shouldShowDuplicateBannerView
{
  return 0;
}

- (BOOL)canManageDuplicateContacts
{
  return 0;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("CNContactListLayoutHeaderIdentifier")))
  {
    v19.receiver = self;
    v19.super_class = (Class)CNStarkContactsListViewController;
    -[CNContactListViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v19, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, v8, v9, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v18.receiver = self;
    v18.super_class = (Class)CNStarkContactsListViewController;
    -[CNContactListViewController collectionView:viewForSupplementaryElementOfKind:atIndexPath:](&v18, sel_collectionView_viewForSupplementaryElementOfKind_atIndexPath_, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v11 = v13;

    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
    {
      objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNStarkContactsListViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "backgroundColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBackgroundColor:", v16);

      objc_msgSend(v11, "setBackgroundConfiguration:", v14);
    }
  }

  return v11;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNStarkContactsListViewController;
  -[CNContactListViewController collectionView:cellForItemAtIndexPath:](&v7, sel_collectionView_cellForItemAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC34D8], "listPlainCellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundConfiguration:", v5);

  return v4;
}

- (void)contactListViewController:(id)a3 didSelectContact:(id)a4
{
  -[CNStarkContactsListViewController contactListViewController:didSelectContact:shouldScrollToContact:](self, "contactListViewController:didSelectContact:shouldScrollToContact:", a3, a4, 1);
}

- (void)contactListViewController:(id)a3 didSelectContact:(id)a4 shouldScrollToContact:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  CNStarkCardViewController *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[CNContactListViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "store");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNStarkCardViewController descriptorForRequiredKeys](CNStarkCardViewController, "descriptorForRequiredKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v8, "unifiedContactWithIdentifier:keysToFetch:error:", v9, v11, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;

  if (v13)
  {
    CNUILogContactCard();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v13;
      _os_log_fault_impl(&dword_18AC56000, v14, OS_LOG_TYPE_FAULT, "Failed to refetch contact for CNStarkCardViewController, %@", buf, 0xCu);
    }
  }
  else
  {
    v15 = [CNStarkCardViewController alloc];
    -[CNStarkContactsListViewController displayedContactProperties](self, "displayedContactProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CNStarkCardViewController initWithContact:displayedContactProperties:](v15, "initWithContact:displayedContactProperties:", v12, v16);

    -[CNStarkContactsListViewController navigationController](self, "navigationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pushViewController:animated:", v14, 1);

  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (NSArray)displayedContactProperties
{
  return self->_displayedContactProperties;
}

- (void)setDisplayedContactProperties:(id)a3
{
  objc_storeStrong((id *)&self->_displayedContactProperties, a3);
}

- (CNContactListCollectionView)contactListTableView
{
  return self->_contactListTableView;
}

- (void)setContactListTableView:(id)a3
{
  objc_storeStrong((id *)&self->_contactListTableView, a3);
}

- (CNStarkNoContentBannerView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (UIView)siriHeaderView
{
  return self->_siriHeaderView;
}

- (void)setSiriHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_siriHeaderView, a3);
}

- (BOOL)limitedUI
{
  return self->_limitedUI;
}

- (AVExternalDevice)externalDevice
{
  return self->_externalDevice;
}

- (void)setExternalDevice:(id)a3
{
  objc_storeStrong((id *)&self->_externalDevice, a3);
}

- (AIMLExperimentationAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (CNStarkUtilities)utilities
{
  return self->_utilities;
}

- (void)setUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_utilities, a3);
}

- (BOOL)hadScrollAccessoryAtLastHeaderViewUpdate
{
  return self->_hadScrollAccessoryAtLastHeaderViewUpdate;
}

- (void)setHadScrollAccessoryAtLastHeaderViewUpdate:(BOOL)a3
{
  self->_hadScrollAccessoryAtLastHeaderViewUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utilities, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_externalDevice, 0);
  objc_storeStrong((id *)&self->_siriHeaderView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_contactListTableView, 0);
  objc_storeStrong((id *)&self->_displayedContactProperties, 0);
}

uint64_t __88__CNStarkContactsListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshTableViewHeaderWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __79__CNStarkContactsListViewController_sendSiriExperimentTriggerLoggingIfEligible__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2)
  {
    CNUILogStarkSiriExperiment();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_18AC56000, v2, OS_LOG_TYPE_ERROR, "#ABStarkExperiment trigger logging failed", v3, 2u);
    }

  }
}

uint64_t __50__CNStarkContactsListViewController_setLimitedUI___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1368) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "postMessageOverlayIfNecessary");
}

uint64_t __57__CNStarkContactsListViewController_createCollectionView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "viewDirectionalLayoutMargins");
}

uint64_t __57__CNStarkContactsListViewController_createCollectionView__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasNoContacts");
}

void __66__CNStarkContactsListViewController_initWithCollectionViewLayout___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "makeContactsDisplayedProperties");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initWithCollectionViewLayout__cn_once_object_8;
  initWithCollectionViewLayout__cn_once_object_8 = v0;

}

+ (id)makeContactsDisplayedProperties
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((Class)getGEOCountryConfigurationClass[0](), "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCountrySupportsCarIntegration");

  if (v3)
  {
    v4 = *MEMORY[0x1E0C967F0];
    v10 = *MEMORY[0x1E0C967C0];
    v11 = v4;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v10;
    v7 = 2;
  }
  else
  {
    v9 = *MEMORY[0x1E0C967C0];
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v9;
    v7 = 1;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, v7, v9, v10, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)collectionViewLayoutWithFloatingHeaderViews:(BOOL)a3 contactListStyleApplier:(id)a4 directionalLayoutMargins:(id)a5 hasNoContacts:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  BOOL v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(v8, "setHeaderMode:", 1);
  objc_msgSend(v8, "setHeaderTopPadding:", 8.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  v10 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __144__CNStarkContactsListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_directionalLayoutMargins_hasNoContacts___block_invoke;
  v22[3] = &unk_1E204A040;
  v25 = a3;
  v23 = v8;
  v24 = v7;
  v11 = v7;
  v12 = v8;
  v13 = (void *)objc_msgSend(v10, "initWithSectionProvider:", v22);
  v14 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeWithWidthDimension:heightDimension:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3330], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:", v17, CFSTR("CNContactListLayoutHeaderIdentifier"), 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setBoundarySupplementaryItems:", v20);

  objc_msgSend(v13, "setConfiguration:", v19);
  return v13;
}

id __144__CNStarkContactsListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_directionalLayoutMargins_hasNoContacts___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _QWORD v10[4];
  char v11;

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", *(_QWORD *)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundarySupplementaryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __144__CNStarkContactsListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_directionalLayoutMargins_hasNoContacts___block_invoke_2;
  v10[3] = &__block_descriptor_33_e53__16__0__NSCollectionLayoutBoundarySupplementaryItem_8l;
  v11 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v5, "_cn_map:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoundarySupplementaryItems:", v6);

  objc_msgSend(v4, "contentInsets");
  v8 = v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v4, "setContentInsets:", v8);
  return v4;
}

id __144__CNStarkContactsListViewController_collectionViewLayoutWithFloatingHeaderViews_contactListStyleApplier_directionalLayoutMargins_hasNoContacts___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPinToVisibleBounds:", *(unsigned __int8 *)(a1 + 32));
  return v3;
}

@end
