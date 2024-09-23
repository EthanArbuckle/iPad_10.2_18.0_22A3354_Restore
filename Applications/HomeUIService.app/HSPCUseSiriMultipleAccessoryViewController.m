@implementation HSPCUseSiriMultipleAccessoryViewController

- (HSPCUseSiriMultipleAccessoryViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  HSPCUseSiriMultipleAccessoryViewController *v11;
  HSPCUseSiriMultipleAccessoryViewController *v12;
  id v13;
  id WeakRetained;
  id v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  PRXAction *useSiriAction;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSArray *v40;
  NSArray *siriEndpointAccessories;
  uint64_t v42;
  NSMutableSet *selectedAccessories;
  void *v44;
  void *v45;
  id v46;
  _BOOL8 v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  unsigned int v60;
  void *v61;
  unsigned int v62;
  void *v64;
  id v65;
  objc_super v66;
  uint8_t buf[4];
  unsigned int v68;
  __int16 v69;
  unsigned int v70;
  __int16 v71;
  unsigned int v72;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10 = objc_msgSend(objc_alloc((Class)PRXScrollableContentView), "initWithCardStyle:scrollView:", 0, v9);
  v66.receiver = self;
  v66.super_class = (Class)HSPCUseSiriMultipleAccessoryViewController;
  v11 = -[HSPCUseSiriMultipleAccessoryViewController initWithContentView:](&v66, "initWithContentView:", v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v13 = objc_storeWeak((id *)&v12->_tableView, v9);
    objc_msgSend(v9, "setDelegate:", v12);

    WeakRetained = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(WeakRetained, "setDataSource:", v12);

    v15 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v15, "setAllowsMultipleSelection:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v17 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v17, "setBackgroundColor:", v16);

    v18 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v18, "setRowHeight:", 44.0);

    +[HSPCRow leadingSeparatorMargin](HSPCRow, "leadingSeparatorMargin");
    v20 = v19;
    v21 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v21, "setSeparatorInset:", 0.0, v20, 0.0, 0.0);

    v22 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v22, "_setTopPadding:", 0.0);

    v23 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v23, "_setBottomPadding:", 0.0);

    v24 = objc_loadWeakRetained((id *)&v12->_tableView);
    objc_msgSend(v24, "registerClass:forCellReuseIdentifier:", objc_opt_class(HSPCAssociatedServiceRow, v25), CFSTR("Cell"));

    v26 = HULocalizedString(CFSTR("HUSiriEndpointSetup_UseSiri_Upgrade_MultipleAccessory_Title"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[HSPCUseSiriMultipleAccessoryViewController setTitle:](v12, "setTitle:", v27);

    v28 = HULocalizedString(CFSTR("HUSiriEndpointSetup_UseSiri_Upgrade_MultipleAccessory_Subtitle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[HSPCUseSiriMultipleAccessoryViewController setSubtitle:](v12, "setSubtitle:", v29);

    v30 = HULocalizedString(CFSTR("HUSiriEndpointSetup_UseSiri_Upgrade_MultipleAccessory_ButtonTitle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v32 = objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController addProminentButtonWithLocalizedTitle:target:futureSelector:](v12, "addProminentButtonWithLocalizedTitle:target:futureSelector:", v31, v12, "commitConfiguration"));
    useSiriAction = v12->_useSiriAction;
    v12->_useSiriAction = (PRXAction *)v32;

    v34 = HULocalizedString(CFSTR("HUSiriEndpointSetup_UseSiri_NotNowButtonTitle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = -[HSPCUseSiriMultipleAccessoryViewController addOptionalButtonWithLocalizedTitle:target:futureSelector:](v12, "addOptionalButtonWithLocalizedTitle:target:futureSelector:", v35, v12, "_disableSiri");

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAccessoryTuple"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v37));

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bridgedAccessories"));
    objc_msgSend(v38, "addObjectsFromArray:", v39);

    v40 = (NSArray *)objc_msgSend(v38, "copy");
    siriEndpointAccessories = v12->_siriEndpointAccessories;
    v12->_siriEndpointAccessories = v40;

    v42 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v12->_siriEndpointAccessories));
    selectedAccessories = v12->_selectedAccessories;
    v12->_selectedAccessories = (NSMutableSet *)v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](v12, "config"));
    objc_msgSend(v44, "setIsPlaybackInfluencesForYouEnabled:", 1);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
    v46 = objc_msgSend(v45, "siriDataSharingOptInStatus");

    v47 = v46 == (id)1;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](v12, "config"));
    objc_msgSend(v48, "setIsShareSiriAnalyticsEnabled:", v47);

    v49 = +[HFManagedConfigurationUtilities isExplicitContentAllowed](HFManagedConfigurationUtilities, "isExplicitContentAllowed");
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](v12, "config"));
    objc_msgSend(v50, "setIsExplicitContentAllowed:", v49);

    v52 = HFLogForCategory(60, v51);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](v12, "config"));
      v65 = v10;
      v54 = objc_msgSend(v64, "isPlaybackInfluencesForYouEnabled");
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](v12, "config"));
      v56 = v38;
      v57 = v9;
      v58 = v8;
      v59 = v7;
      v60 = objc_msgSend(v55, "isShareSiriAnalyticsEnabled");
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](v12, "config"));
      v62 = objc_msgSend(v61, "isExplicitContentAllowed");
      *(_DWORD *)buf = 67109632;
      v68 = v54;
      v10 = v65;
      v69 = 1024;
      v70 = v60;
      v7 = v59;
      v8 = v58;
      v9 = v57;
      v38 = v56;
      v71 = 1024;
      v72 = v62;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "isPlaybackInfluencesForYouEnabled = %{BOOL}d | isShareSiriAnalyticsEnabled = %{BOOL}d | isExplicitContentAllowed = %{BOOL}d", buf, 0x14u);

    }
  }

  return v12;
}

- (id)commitConfiguration
{
  return -[HSPCUseSiriMultipleAccessoryViewController _applyOnboardingSelections:](self, "_applyOnboardingSelections:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  id v32;
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
  HSPCUseSiriMultipleAccessoryViewController *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _QWORD v58[3];
  _BYTE v59[128];
  const __CFString *v60;
  void *v61;
  NSAttributedStringKey v62;
  void *v63;

  v57.receiver = self;
  v57.super_class = (Class)HSPCUseSiriMultipleAccessoryViewController;
  -[HSPCUseSiriMultipleAccessoryViewController viewDidLoad](&v57, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PRXLabel labelWithStyle:](PRXLabel, "labelWithStyle:", 3));
  v4 = HULocalizedString(CFSTR("HUSiriEndpointSetup_FinePrint_Link_Only"));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_alloc((Class)NSAttributedString);
  v62 = NSForegroundColorAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor hf_keyColor](UIColor, "hf_keyColor"));
  v63 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
  v9 = objc_msgSend(v6, "initWithString:attributes:", v5, v8);

  v10 = objc_alloc((Class)NSMutableAttributedString);
  v11 = HULocalizedString(CFSTR("HUSiriEndpointSetup_FinePrint"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v10, "initWithString:", v12);

  v50 = v9;
  objc_msgSend(v13, "appendAttributedString:", v9);
  v49 = v13;
  v14 = objc_msgSend(v13, "copy");
  objc_msgSend(v3, "setAttributedText:", v14);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);
  v15 = objc_alloc((Class)HUStringInLabelTapGestureRecognizer);
  v60 = CFSTR("URL_KEY");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents siriPrivacyURL](HFURLComponents, "siriPrivacyURL"));
  v61 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
  v51 = (void *)v5;
  v18 = objc_msgSend(v15, "initWithTarget:action:hitBoxString:userInfo:", self, "_handleFooterLabelTouchForOpenURL:", v5, v17);

  v47 = v18;
  objc_msgSend(v3, "addGestureRecognizer:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController view](self, "view"));
  v52 = v3;
  objc_msgSend(v19, "addSubview:", v3);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v48 = self;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "actionButtons"));

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentTitle"));
        v29 = HULocalizedString(CFSTR("HUSiriEndpointSetup_UseSiri_Upgrade_MultipleAccessory_ButtonTitle"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = objc_msgSend(v28, "isEqualToString:", v30);

        if (v31)
        {
          v32 = v27;

          v24 = v32;
        }
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "centerXAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController contentView](v48, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mainContentGuide"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "centerXAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v43));
  v58[0] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v33, -10.0));
  v58[1] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "widthAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController contentView](v48, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mainContentGuide"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "widthAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v38));
  v58[2] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HSPCUseSiriMultipleAccessoryViewController;
  -[HSPCUseSiriMultipleAccessoryViewController viewWillAppear:](&v16, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadData");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController siriEndpointAccessories](self, "siriEndpointAccessories"));
  v6 = (uint64_t)objc_msgSend(v5, "count");

  if (v6 >= 1)
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController tableView](self, "tableView"));
      objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", v8, 1, 0);

      ++v7;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController siriEndpointAccessories](self, "siriEndpointAccessories"));
      v11 = objc_msgSend(v10, "count");

    }
    while (v7 < (uint64_t)v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController tableView](self, "tableView"));
  objc_msgSend(v12, "layoutIfNeeded");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController contentView](self, "contentView"));
  objc_msgSend(v13, "setNeedsUpdateConstraints");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController view](self, "view"));
  objc_msgSend(v14, "bounds");
  -[HSPCUseSiriMultipleAccessoryViewController updatePreferredContentSizeForCardWidth:](self, "updatePreferredContentSizeForCardWidth:", v15);

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", v6));
  objc_msgSend(v7, "setAccessoryType:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController selectedAccessories](self, "selectedAccessories"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController siriEndpointAccessories](self, "siriEndpointAccessories"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  objc_msgSend(v8, "addObject:", v10);

  -[HSPCUseSiriMultipleAccessoryViewController _updateUseSiriButtonEnabledState](self, "_updateUseSiriButtonEnabledState");
  return v6;
}

- (id)tableView:(id)a3 willDeselectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForRowAtIndexPath:", v6));
  objc_msgSend(v7, "setAccessoryType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController selectedAccessories](self, "selectedAccessories"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController siriEndpointAccessories](self, "siriEndpointAccessories"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  objc_msgSend(v8, "removeObject:", v10);

  -[HSPCUseSiriMultipleAccessoryViewController _updateUseSiriButtonEnabledState](self, "_updateUseSiriButtonEnabledState");
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController siriEndpointAccessories](self, "siriEndpointAccessories", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("Cell"), v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController siriEndpointAccessories](self, "siriEndpointAccessories"));
  v9 = objc_msgSend(v6, "row");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
  objc_msgSend(v7, "updateUIWithTuple:", v10);

  objc_msgSend(v7, "setAccessoryType:", 3);
  return v7;
}

- (id)dismissButtonBlock
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100015AB0;
  v3[3] = &unk_1000A10A8;
  v3[4] = self;
  return objc_retainBlock(v3);
}

- (id)_disableSiri
{
  return -[HSPCUseSiriMultipleAccessoryViewController _applyOnboardingSelections:](self, "_applyOnboardingSelections:", 1);
}

- (id)_applyOnboardingSelections:(BOOL)a3
{
  __int128 v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _UNKNOWN **v32;
  void *v33;
  void *v34;
  __int128 v36;
  id obj;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];

  v38 = a3;
  v40 = (void *)objc_opt_new(NSMutableArray, a2);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController siriEndpointAccessories](self, "siriEndpointAccessories"));
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v41)
  {
    v39 = *(_QWORD *)v48;
    *(_QWORD *)&v4 = 138412546;
    v36 = v4;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(_QWORD *)v48 != v39)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessory", v36));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hf_siriEndpointProfile"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController selectedAccessories](self, "selectedAccessories"));
        v9 = objc_msgSend(v8, "containsObject:", v6);

        v10 = objc_alloc((Class)HMSiriEndpointOnboardingSelections);
        v43 = v7;
        v11 = objc_msgSend(v7, "hf_isDumbSpeaker");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](self, "config"));
        v13 = objc_msgSend(v12, "isPlaybackInfluencesForYouEnabled");
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](self, "config"));
        v15 = v14;
        if (!v9 || v38)
        {
          v18 = objc_msgSend(v10, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:", 1, 0, v11, v13, 0, objc_msgSend(v14, "isExplicitContentAllowed"));
        }
        else
        {
          v16 = objc_msgSend(v14, "isShareSiriAnalyticsEnabled");
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](self, "config"));
          v18 = objc_msgSend(v10, "initWithSiriEnabled:allowHeySiri:airPlayEnabled:playbackInfluencesForYouEnabled:shareSiriAnalyticsEnabled:explicitContentAllowed:", 1, 1, v11, v13, v16, objc_msgSend(v17, "isExplicitContentAllowed"));

        }
        v20 = HFLogForCategory(60, v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessory"));
          *(_DWORD *)buf = v36;
          v52 = v18;
          v53 = 2112;
          v54 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Applying onboarding selections %@ for accessory %@", buf, 0x16u);

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](self, "config"));
        objc_msgSend(v23, "setOnboardingSelections:", v18);

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_100015F50;
        v44[3] = &unk_1000A15F8;
        v45 = v42;
        v46 = v18;
        v24 = v18;
        v25 = v42;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler globalAsyncScheduler](NAScheduler, "globalAsyncScheduler"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithBlock:scheduler:](NAFuture, "futureWithBlock:scheduler:", v44, v26));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mainThreadScheduler](NAScheduler, "mainThreadScheduler"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "reschedule:", v28));

        objc_msgSend(v40, "addObject:", v29);
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v41);
  }

  if (-[HSPCUseSiriMultipleAccessoryViewController _shouldEnableShareSiriAnalytics](self, "_shouldEnableShareSiriAnalytics"))
  {
    v30 = objc_claimAutoreleasedReturnValue(+[HUSiriEndpointUtilities presentShareSiriAndDictationAlertForMultipleAccessories:](HUSiriEndpointUtilities, "presentShareSiriAndDictationAlertForMultipleAccessories:", self));
  }
  else
  {
    v30 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  v31 = (void *)v30;
  objc_msgSend(v40, "addObject:", v30);
  v32 = &off_1000A8038;
  if (!-[HSPCUseSiriMultipleAccessoryViewController _isVoiceRecognitionEnabled](self, "_isVoiceRecognitionEnabled")
    && -[HSPCUseSiriMultipleAccessoryViewController _deviceIsOnAMultiUserLanguage](self, "_deviceIsOnAMultiUserLanguage")&& !v38)
  {
    v32 = &off_1000A8050;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v32));
  objc_msgSend(v40, "addObject:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture chainFutures:](NAFuture, "chainFutures:", v40));
  return v34;
}

- (void)_handleFooterLabelTouchForOpenURL:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t v14[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("URL_KEY")));

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFURLComponents siriPrivacyURL](HFURLComponents, "siriPrivacyURL"));
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (v8)
    {
      v10 = HFLogForCategory(58, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Launching Siri privacy sheet", v14, 2u);
      }

      -[HSPCUseSiriMultipleAccessoryViewController _launchSiriPrivacySheet](self, "_launchSiriPrivacySheet");
    }
  }
  else
  {
    v12 = HFLogForCategory(58, v6);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10005E36C(v13);

    NSLog(CFSTR("Footer link pressed w/ url intention but no url found"));
  }

}

- (void)_launchSiriPrivacySheet
{
  uint64_t v3;
  void *v4;
  HSPCUseSiriMultipleAccessoryViewController *v5;
  HSPCUseSiriMultipleAccessoryViewController *v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController navigationController](self, "navigationController"));
  v4 = (void *)v3;
  if (v3)
    v5 = (HSPCUseSiriMultipleAccessoryViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[OBPrivacyPresenter presenterForPrivacySplashWithIdentifer:](OBPrivacyPresenter, "presenterForPrivacySplashWithIdentifer:", OBPrivacySiriIdentifier));
  objc_msgSend(v7, "setPresentingViewController:", v6);

  objc_msgSend(v7, "present");
}

- (BOOL)_isVoiceRecognitionEnabled
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  int v18;
  HSPCUseSiriMultipleAccessoryViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unsigned int v23;

  v4 = objc_alloc((Class)HFUserItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](self, "config"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "home"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](self, "config"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "home"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentUser"));
  v10 = objc_msgSend(v4, "initWithHome:user:nameStyle:", v6, v9, 0);

  v11 = objc_msgSend(v10, "isIdentifyVoiceEnabled");
  v13 = HFLogForCategory(60, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v18 = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v16;
    v22 = 1024;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Is voice recognition enabled? %{BOOL}d", (uint8_t *)&v18, 0x1Cu);

  }
  return v11;
}

- (BOOL)_deviceIsOnAMultiUserLanguage
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HUHomeFeatureOnboardingUtilities fetchSupportedVoiceRecognitionLanguages](HUHomeFeatureOnboardingUtilities, "fetchSupportedVoiceRecognitionLanguages"));
  if (v4)
  {
    v5 = +[HUHomeFeatureOnboardingUtilities isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:](HUHomeFeatureOnboardingUtilities, "isDeviceUsingASupportedVoiceRecognitionSiriLanguage:shouldFallbackToBestSupportedLanguage:", v4, 1);
  }
  else
  {
    v6 = HFLogForCategory(60, v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005E71C(a2, v7);

    v5 = 0;
  }

  return v5;
}

- (void)_updateUseSiriButtonEnabledState
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController selectedAccessories](self, "selectedAccessories"));
  v3 = objc_msgSend(v5, "count") != 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController useSiriAction](self, "useSiriAction"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)_shouldEnableShareSiriAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](self, "config"));
  if (objc_msgSend(v3, "isShareSiriAnalyticsEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCUseSiriMultipleAccessoryViewController config](self, "config"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "onboardingSelections"));
    v6 = objc_msgSend(v5, "allowHeySiri");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (void)setTableView:(id)a3
{
  objc_storeWeak((id *)&self->_tableView, a3);
}

- (PRXAction)useSiriAction
{
  return self->_useSiriAction;
}

- (void)setUseSiriAction:(id)a3
{
  objc_storeStrong((id *)&self->_useSiriAction, a3);
}

- (NSArray)siriEndpointAccessories
{
  return self->_siriEndpointAccessories;
}

- (void)setSiriEndpointAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_siriEndpointAccessories, a3);
}

- (NSMutableSet)selectedAccessories
{
  return self->_selectedAccessories;
}

- (void)setSelectedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAccessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAccessories, 0);
  objc_storeStrong((id *)&self->_siriEndpointAccessories, 0);
  objc_storeStrong((id *)&self->_useSiriAction, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
