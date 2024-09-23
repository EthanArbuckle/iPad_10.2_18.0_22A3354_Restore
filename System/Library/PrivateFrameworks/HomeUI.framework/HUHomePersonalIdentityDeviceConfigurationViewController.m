@implementation HUHomePersonalIdentityDeviceConfigurationViewController

- (HUHomePersonalIdentityDeviceConfigurationViewController)initWithMediaProfileAndLanguageInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUHomePersonalIdentityDeviceConfigurationViewController *v9;
  HUHomePersonalIdentityDeviceConfigurationViewController *v10;
  uint64_t v11;
  NSArray *mediaProfilesAndLanguageInfoList;
  objc_super v14;

  v4 = a3;
  HULocalizedModelString(CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_Title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedModelString(CFSTR("HULanguagePersonalIdentityDevice_LanguageMultipleMismatch_Detail"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_Title"), CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_Title"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HUSensitiveLocalizedModelString(CFSTR("HULanguagePersonalIdentityDevice_LanguageMultipleMismatch_Detail"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  v9 = -[OBTableWelcomeController initWithTitle:detailText:icon:](&v14, sel_initWithTitle_detailText_icon_, v7, v8, 0);
  v10 = v9;
  if (v9)
  {
    v9->_selectedLanguageIndex = 0x7FFFFFFFFFFFFFFFLL;
    +[HUHomeFeatureOnboardingUtilities processLanguageAndMediaProfileInfo:](HUHomeFeatureOnboardingUtilities, "processLanguageAndMediaProfileInfo:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    mediaProfilesAndLanguageInfoList = v10->_mediaProfilesAndLanguageInfoList;
    v10->_mediaProfilesAndLanguageInfoList = (NSArray *)v11;

  }
  return v10;
}

- (void)_changeLanguage
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  HUHomePersonalIdentityDeviceConfigurationViewController *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HUHomePersonalIdentityDeviceConfigurationViewController *v15;
  const __CFString *v16;
  void *v17;
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceConfigurationViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = self;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  if (-[HUHomePersonalIdentityDeviceConfigurationViewController selectedLanguageIndex](self, "selectedLanguageIndex") == 0x7FFFFFFFFFFFFFFFLL)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v7 = (HUHomePersonalIdentityDeviceConfigurationViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "%@ Language selection unavailable", buf, 0xCu);

    }
  }
  else
  {
    -[HUHomePersonalIdentityDeviceConfigurationViewController mediaProfilesAndLanguageInfoList](self, "mediaProfilesAndLanguageInfoList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", -[HUHomePersonalIdentityDeviceConfigurationViewController selectedLanguageIndex](self, "selectedLanguageIndex"));
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKey:](v6, "objectForKey:", CFSTR("languageCodeKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v19 = self;
        v20 = 2112;
        v21 = v12;
        v22 = 2112;
        v23 = v9;
        _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: Changing Personal Identity Device Language To %@", buf, 0x20u);

      }
      v11 = objc_alloc_init(MEMORY[0x1E0CFE9B0]);
      -[NSObject setLanguage:](v11, "setLanguage:", v9);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (HUHomePersonalIdentityDeviceConfigurationViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_error_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_ERROR, "%@ Language code unavailable", buf, 0xCu);

    }
  }

  -[HUHomePersonalIdentityDeviceConfigurationViewController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput");
  v17 = &unk_1E7040C48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewController:didFinishWithConfigurationResults:", self, v14);

}

- (void)_cancelLanguageChange
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceConfigurationViewController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);

  }
  -[HUHomePersonalIdentityDeviceConfigurationViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("HULanguageOnboardingKey_SetupLanguage_PersonalDevice_UserInput");
  v9 = &unk_1E7040C60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewController:didFinishWithConfigurationResults:", self, v7);

}

- (id)hu_preloadContent
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  -[OBTableWelcomeController loadView](&v27, sel_loadView);
  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsSelectionDuringEditing:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsMultipleSelection:", 0);

  v10 = *MEMORY[0x1E0CEBC10];
  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRowHeight:", v10);

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlwaysBounceVertical:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "heightAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentSize");
  objc_msgSend(v14, "constraintEqualToConstant:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePersonalIdentityDeviceConfigurationViewController setHeightAnchor:](self, "setHeightAnchor:", v17);

  -[HUHomePersonalIdentityDeviceConfigurationViewController heightAnchor](self, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "separatorInset");
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[OBTableWelcomeController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSeparatorInset:", v21, v23, v25, 28.0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[HUHomePersonalIdentityDeviceConfigurationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[HUHomePersonalIdentityDeviceConfigurationViewController heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10.receiver = self;
  v10.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v10, sel_viewDidLayoutSubviews);
}

- (id)_configureTitleDescriptionContentViewForCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HUTitleDescriptionContentView *v10;
  HUTitleDescriptionContentView *v11;
  HUTitleDescriptionContentView *v12;
  HUTitleDescriptionContentView *v13;
  HUTitleDescriptionContentView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
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

  v4 = a3;
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  objc_opt_class();
  v10 = v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = v10;
  if (!v12)
  {
    v14 = [HUTitleDescriptionContentView alloc];
    v13 = -[HUTitleDescriptionContentView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[HUTitleDescriptionContentView setTranslatesAutoresizingMaskIntoConstraints:](v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v13);

    -[HUTitleDescriptionContentView leadingAnchor](v13, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "separatorInset");
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[HUTitleDescriptionContentView topAnchor](v13, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 5.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[HUTitleDescriptionContentView bottomAnchor](v13, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, -5.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setActive:", 1);

    -[HUTitleDescriptionContentView trailingAnchor](v13, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

  }
  return v13;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HUHomePersonalIdentityDeviceConfigurationViewController mediaProfilesAndLanguageInfoList](self, "mediaProfilesAndLanguageInfoList", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + 1;

  return v5;
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
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t i;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v49;
  void *v50;
  void *v51;
  HUHomePersonalIdentityDeviceConfigurationViewController *v52;
  void *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("language_code_cell_identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("language_code_cell_identifier"));
  objc_msgSend(v14, "setSelectionStyle:", 0);
  v15 = objc_msgSend(v7, "row");
  -[HUHomePersonalIdentityDeviceConfigurationViewController _configureTitleDescriptionContentViewForCell:](self, "_configureTitleDescriptionContentViewForCell:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v54 = v6;
    v52 = self;
    -[HUHomePersonalIdentityDeviceConfigurationViewController mediaProfilesAndLanguageInfoList](self, "mediaProfilesAndLanguageInfoList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v7;
    objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v7, "row") - 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKey:", CFSTR("mediaProfilesKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", CFSTR("localizedLanguageNameKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitleText:", v20);

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    if (v22)
    {
      v23 = v22;
      v49 = v18;
      v50 = v16;
      v51 = v13;
      v24 = 0;
      v25 = *(_QWORD *)v56;
      v26 = &stru_1E6F60E80;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v21);
          v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if (-[__CFString length](v26, "length"))
          {
            -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", CFSTR(", "));
            v29 = objc_claimAutoreleasedReturnValue();

            v26 = (__CFString *)v29;
          }
          v30 = v26;
          objc_msgSend(v28, "hf_displayName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", v31);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if ((v24 & 1) != 0)
          {
            v16 = v50;
            v13 = v51;
            v18 = v49;
            v32 = 2;
            goto LABEL_18;
          }
          v24 = 1;
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
        v24 = 1;
        if (v23)
          continue;
        break;
      }
      v32 = 1;
      v16 = v50;
      v13 = v51;
      v18 = v49;
    }
    else
    {
      v32 = 0;
      v26 = &stru_1E6F60E80;
    }
LABEL_18:

    v7 = v53;
    if (v32 < objc_msgSend(v21, "count"))
    {
      v36 = objc_msgSend(v21, "count");
      HULocalizedStringWithFormat(CFSTR("HULanguageCount_Detail"), CFSTR("%lu"), v37, v38, v39, v40, v41, v42, v36 - v32);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString stringByAppendingString:](v26, "stringByAppendingString:", v43);
      v44 = objc_claimAutoreleasedReturnValue();

      v26 = (__CFString *)v44;
    }
    objc_msgSend(v16, "setDescriptionText:", v26);
    objc_msgSend(MEMORY[0x1E0CEA478], "lightGrayColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDescriptionTextColor:", v45);

    objc_msgSend(v18, "objectForKey:", CFSTR("languageCodeKey"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "isEqualToString:", v13))
    {
      -[HUHomePersonalIdentityDeviceConfigurationViewController setSelectedLanguageIndex:](v52, "setSelectedLanguageIndex:", objc_msgSend(v53, "row") - 1);
      v47 = 3;
    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v14, "setAccessoryType:", v47);

    v6 = v54;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HULanguageSupportedLangugages_TableHeader_Title"), CFSTR("HULanguageSupportedLangugages_TableHeader_Title"), 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitleText:", v33);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB590]);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitleFont:", v34);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitleTextColor:", v35);

  }
  return v14;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "row") >= 1)
  {
    v7 = -[HUHomePersonalIdentityDeviceConfigurationViewController selectedLanguageIndex](self, "selectedLanguageIndex")
       + 1;
    objc_msgSend(v11, "cellForRowAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessoryType:", 3);
    -[HUHomePersonalIdentityDeviceConfigurationViewController setSelectedLanguageIndex:](self, "setSelectedLanguageIndex:", objc_msgSend(v6, "row") - 1);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL && v7 != objc_msgSend(v6, "row"))
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cellForRowAtIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setAccessoryType:", 0);
    }

  }
}

- (void)viewDidLoad
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
  NSObject *v25;
  void *v26;
  objc_super v27;
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceConfigurationViewController *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  -[OBTableWelcomeController viewDidLoad](&v27, sel_viewDidLoad);
  -[HUHomePersonalIdentityDeviceConfigurationViewController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v5, &unk_1E7042FA0);

  -[HUHomePersonalIdentityDeviceConfigurationViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePersonalIdentityDeviceConfigurationViewController setChangeLanguageButton:](self, "setChangeLanguageButton:", v6);

  -[HUHomePersonalIdentityDeviceConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomePersonalIdentityDeviceConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUContinueTitle"), CFSTR("HUContinueTitle"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);

  -[HUHomePersonalIdentityDeviceConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.LanguageSetUp.PersonalIdentity.ContinueButton"));

  -[HUHomePersonalIdentityDeviceConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__changeLanguage, 64);

  -[HUHomePersonalIdentityDeviceConfigurationViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePersonalIdentityDeviceConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", v13);

  objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePersonalIdentityDeviceConfigurationViewController setCancelButton:](self, "setCancelButton:", v14);

  -[HUHomePersonalIdentityDeviceConfigurationViewController cancelButton](self, "cancelButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUHomePersonalIdentityDeviceConfigurationViewController cancelButton](self, "cancelButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguageDontRecognizeVoiceButton_Title"), CFSTR("HULanguageDontRecognizeVoiceButton_Title"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:forState:", v17, 0);

  -[HUHomePersonalIdentityDeviceConfigurationViewController changeLanguageButton](self, "changeLanguageButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.LanguageSetUp.PersonalIdentity.DontRecognizeVoiceButton"));

  -[HUHomePersonalIdentityDeviceConfigurationViewController cancelButton](self, "cancelButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__cancelLanguageChange, 64);

  -[HUHomePersonalIdentityDeviceConfigurationViewController buttonTray](self, "buttonTray");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUHomePersonalIdentityDeviceConfigurationViewController cancelButton](self, "cancelButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addButton:", v21);

  _HULocalizedStringWithDefaultValue(CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_FinePrint"), CFSTR("HULanguagePersonalIdentityDevice_LanguageMismatch_FinePrint"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HULanguagePersonalIdentityDevice_SiriEnabledAccessories_LanguageMismatch_FinePrint"), CFSTR("HULanguagePersonalIdentityDevice_SiriEnabledAccessories_LanguageMismatch_FinePrint"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUHomePersonalIdentityDeviceConfigurationViewController buttonTray](self, "buttonTray");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCaptionText:", v23);

  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = self;
    v30 = 2112;
    v31 = v26;
    _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HPIDCVC", buf, 0x16u);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  HUHomePersonalIdentityDeviceConfigurationViewController *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)HUHomePersonalIdentityDeviceConfigurationViewController;
  -[HUHomePersonalIdentityDeviceConfigurationViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (-[HUHomePersonalIdentityDeviceConfigurationViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped BACK button", buf, 0x16u);

    }
    -[HUHomePersonalIdentityDeviceConfigurationViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerDidGoBack:", self);

  }
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OBTrayButton)changeLanguageButton
{
  return self->_changeLanguageButton;
}

- (void)setChangeLanguageButton:(id)a3
{
  objc_storeStrong((id *)&self->_changeLanguageButton, a3);
}

- (OBLinkTrayButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (NSArray)mediaProfilesAndLanguageInfoList
{
  return self->_mediaProfilesAndLanguageInfoList;
}

- (void)setMediaProfilesAndLanguageInfoList:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProfilesAndLanguageInfoList, a3);
}

- (int64_t)selectedLanguageIndex
{
  return self->_selectedLanguageIndex;
}

- (void)setSelectedLanguageIndex:(int64_t)a3
{
  self->_selectedLanguageIndex = a3;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_mediaProfilesAndLanguageInfoList, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_changeLanguageButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
