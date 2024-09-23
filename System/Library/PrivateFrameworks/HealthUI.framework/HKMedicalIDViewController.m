@implementation HKMedicalIDViewController

+ (BOOL)isSupportedOnThisDevice
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB6760], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMedicalIDAvailable");

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)initInEditMode:(BOOL)a3 inBuddy:(BOOL)a4 organDonationSignupAvailable:(BOOL)a5
{
  HKMedicalIDViewController *v8;
  HKMedicalIDViewController *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKMedicalIDViewController;
  v8 = -[HKMedicalIDViewController initWithStyle:](&v11, sel_initWithStyle_, 1);
  v9 = v8;
  if (v8)
  {
    v8->_inEditMode = a3;
    v8->_inBuddy = a4;
    v8->_organDonationSignupAvailable = a5;
    v8->_showsShowWhenLockedState = 1;
    v8->_showsEmergencyAccessState = 1;
    v8->_showsEditMedicalIDRowInViewMode = 0;
    v8->_inBridge = 0;
    -[HKMedicalIDViewController setModernAppearance:](v8, "setModernAppearance:", -[HKMedicalIDViewController inEditMode](v8, "inEditMode") ^ 1);
    -[HKMedicalIDViewController setModalInPresentation:](v9, "setModalInPresentation:", -[HKMedicalIDViewController inEditMode](v9, "inEditMode"));
  }
  return v9;
}

- (id)initInEditMode:(BOOL)a3
{
  return -[HKMedicalIDViewController initInEditMode:inBuddy:organDonationSignupAvailable:](self, "initInEditMode:inBuddy:organDonationSignupAvailable:", a3, 0, 0);
}

- (HKMedicalIDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (HKMedicalIDViewController *)-[HKMedicalIDViewController initInEditMode:inBuddy:organDonationSignupAvailable:](self, "initInEditMode:inBuddy:organDonationSignupAvailable:", 0, 0, 0);
}

- (HKMedicalIDViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDViewController;
  return -[HKMedicalIDViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (HKMedicalIDViewController)initWithStyle:(int64_t)a3
{
  return (HKMedicalIDViewController *)-[HKMedicalIDViewController initInEditMode:](self, "initInEditMode:", 0);
}

- (void)setHealthStore:(id)a3
{
  HKProfileStore *v5;
  HKProfileStore *profileStore;
  id v7;

  objc_storeStrong((id *)&self->_healthStore, a3);
  v7 = a3;
  v5 = (HKProfileStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A18]), "initWithHealthStore:", v7);
  profileStore = self->_profileStore;
  self->_profileStore = v5;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
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
  id v44;
  char *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  const char *v55;
  NSObject *v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id location;
  objc_super v61;

  v61.receiver = self;
  v61.super_class = (Class)HKMedicalIDViewController;
  -[HKMedicalIDViewController viewDidLoad](&v61, sel_viewDidLoad);
  -[HKMedicalIDViewController _submitAccessAnalytic](self, "_submitAccessAnalytic");
  self->_tableViewStyle = 1;
  -[HKMedicalIDViewController updateNavigationBar](self, "updateNavigationBar");
  -[HKMedicalIDViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), 0x1E9C5C0E8);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), 0x1E9C5D948);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), 0x1E9C65F68);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), 0x1E9C5BA48);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerClass:forCellReuseIdentifier:", objc_opt_class(), 0x1E9C5D208);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), 0x1E9C5DD88);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  +[HKOrganDonationCallToActionTableViewCell defaultReuseIdentifier](HKOrganDonationCallToActionTableViewCell, "defaultReuseIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", v10, v11);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_class();
  +[HKIDRegisteredReviewCell defaultReuseIdentifier](HKIDRegisteredReviewCell, "defaultReuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:forCellReuseIdentifier:", v13, v14);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  +[HKOrganDonationRegisteredTableViewCell defaultReuseIdentifier](HKOrganDonationRegisteredTableViewCell, "defaultReuseIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerClass:forCellReuseIdentifier:", v16, v17);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  +[_HKMedicalIDMultilineStringCell defaultReuseIdentifier](_HKMedicalIDMultilineStringCell, "defaultReuseIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerClass:forCellReuseIdentifier:", v19, v20);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", objc_opt_class(), 0x1E9C54428);

  v22 = *MEMORY[0x1E0DC53D8];
  -[HKMedicalIDViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setRowHeight:", v22);

  -[HKMedicalIDViewController _buildTableItems](self, "_buildTableItems");
  v24 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[HKMedicalIDViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTableFooterView:", v24);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSeparatorInset:", 0.0, 16.0, 0.0, 0.0);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CE9F08);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAccessibilityIdentifier:", v28);

  if (-[HKMedicalIDViewController inEditMode](self, "inEditMode"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelEditingTapped_);
    -[HKMedicalIDViewController navigationItem](self, "navigationItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setLeftBarButtonItem:", v29);

    LODWORD(v29) = self->_inBuddy;
    v31 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v32 = v31;
    if ((_DWORD)v29)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("OD_NEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v32, "initWithTitle:style:target:action:", v34, 2, self, sel__nextButtonTapped_);
      -[HKMedicalIDViewController navigationItem](self, "navigationItem");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setRightBarButtonItem:", v35);

    }
    else
    {
      v33 = (void *)objc_msgSend(v31, "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneEditingTapped_);
      -[HKMedicalIDViewController navigationItem](self, "navigationItem");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setRightBarButtonItem:", v33);
    }

    -[HKMedicalIDViewController tableView](self, "tableView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setEstimatedRowHeight:", 44.0 + 24.0);

    -[HKMedicalIDViewController tableView](self, "tableView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setKeyboardDismissMode:", 1);

    -[HKMedicalIDViewController tableView](self, "tableView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setEditing:", 1);

    -[HKMedicalIDViewController tableView](self, "tableView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setAllowsSelectionDuringEditing:", 1);
    goto LABEL_11;
  }
  -[HKMedicalIDViewController tableView](self, "tableView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setEstimatedRowHeight:", 44.0);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "_setDrawsSeparatorAtTopOfSections:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDViewController tableView](self, "tableView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setBackgroundColor:", v39);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDViewController tableView](self, "tableView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTableHeaderBackgroundColor:", v41);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "_setTopPadding:", 0.0);

  if (self->_inBuddy)
  {
    v44 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v45 = sel__doneEditingTapped_;
LABEL_10:
    v49 = (void *)objc_msgSend(v44, "initWithBarButtonSystemItem:target:action:", 0, self, v45);
    -[HKMedicalIDViewController navigationItem](self, "navigationItem");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setRightBarButtonItem:", v49);

LABEL_11:
    goto LABEL_12;
  }
  if (self->_showsDismissButton)
  {
    v44 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v45 = sel__doneTapped_;
    goto LABEL_10;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObserver:selector:name:object:", self, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObserver:selector:name:object:", self, sel_localeDidChange_, *MEMORY[0x1E0C99720], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObserver:selector:name:object:", self, sel_timeZoneDidChange_, *MEMORY[0x1E0C998A0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "addObserver:selector:name:object:", self, sel__contactStoreDidChange_, *MEMORY[0x1E0C96870], 0);

  objc_initWeak(&location, self);
  v55 = (const char *)*MEMORY[0x1E0CB7740];
  v56 = MEMORY[0x1E0C80D38];
  v57 = MEMORY[0x1E0C80D38];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __40__HKMedicalIDViewController_viewDidLoad__block_invoke;
  v58[3] = &unk_1E9C43270;
  objc_copyWeak(&v59, &location);
  notify_register_dispatch(v55, &self->_medicalIDChangedToken, v56, v58);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&location);
}

void __40__HKMedicalIDViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_refreshMedicalIDInViewMode");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(self->_medicalIDChangedToken);
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDViewController;
  -[HKMedicalIDViewController dealloc](&v4, sel_dealloc);
}

- (void)updateNavigationBar
{
  void *v3;
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
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  if (-[HKMedicalIDViewController allowsEditing](self, "allowsEditing"))
  {
    if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant")|| (-[HKMedicalIDViewController medicalID](self, "medicalID"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_editButtonTapped_);
      -[HKMedicalIDViewController navigationItem](self, "navigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRightBarButtonItem:", v4);

      if (objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode"))
      {
        -[HKMedicalIDViewController navigationItem](self, "navigationItem");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "rightBarButtonItem");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setEnabled:", 0);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("medical_id_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKMedicalIDViewController isSecondaryProfileMedicalID](self, "isSecondaryProfileMedicalID"))
  {
    -[_HKMedicalIDData name](self->_medicalID, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%@_medical_id_title"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKMedicalIDData name](self->_medicalID, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v15;
    }
  }
  -[HKMedicalIDViewController title](self, "title");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (void *)v16;
  else
    v18 = v9;
  objc_msgSend(CFSTR(" "), "stringByAppendingString:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageNamed:inBundle:", CFSTR("medicalid_header_glyph"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_flatImageWithColor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMedicalIDViewController navigationController](self, "navigationController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationBar");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_defaultTitleFont");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v28 = *MEMORY[0x1E0DC1138];
  v37[0] = v27;
  v29 = *MEMORY[0x1E0DC1140];
  v36[0] = v28;
  v36[1] = v29;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMedicalIDViewController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  objc_msgSend(v19, "hk_attributedStringPrefixedWithImage:baselineAdjusted:withAttributes:", v24, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v34, "setAttributedText:", v33);
  objc_msgSend(v34, "sizeToFit");
  -[HKMedicalIDViewController navigationItem](self, "navigationItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTitleView:", v34);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_footers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "updateFont", (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[HKMedicalIDViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)localeDidChange:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_localeItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "localeDidChange:", v4, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[HKMedicalIDViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (void)timeZoneDidChange:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_localeItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "timeZoneDidChange:", v4, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[HKMedicalIDViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDViewController;
  -[HKMedicalIDViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HKMedicalIDViewController _reloadTableWithMedicalIDData:](self, "_reloadTableWithMedicalIDData:", self->_medicalID);
  -[HKMedicalIDViewController _forceDisableBiometricIfDeviceLocked](self, "_forceDisableBiometricIfDeviceLocked");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  HKMedicalIDViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  objc_super v9;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "medicalIDViewControllerDidAppear:", self);

  }
  v9.receiver = self;
  v9.super_class = (Class)HKMedicalIDViewController;
  -[HKMedicalIDViewController viewDidAppear:](&v9, sel_viewDidAppear_, v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 6;
}

- (void)_fetchDemographicInformation
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 isSecondaryProfileMedicalID;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[_HKMedicalIDData name](self->_medicalID, "name");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[_HKMedicalIDData name](self->_medicalID, "name"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        !v6))
  {
    objc_initWeak(&location, self);
    isSecondaryProfileMedicalID = self->_isSecondaryProfileMedicalID;
    -[HKMedicalIDViewController healthStore](self, "healthStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__HKMedicalIDViewController__fetchDemographicInformation__block_invoke;
    v9[3] = &unk_1E9C43298;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "hk_fetchExistingDemographicInformationWithOptions:completion:", isSecondaryProfileMedicalID, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__HKMedicalIDViewController__fetchDemographicInformation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 144))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__HKMedicalIDViewController__fetchDemographicInformation__block_invoke_2;
    v6[3] = &unk_1E9C3FC50;
    v6[4] = WeakRetained;
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __57__HKMedicalIDViewController__fetchDemographicInformation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMedicalIDNameWithDemographicsInformation:", *(_QWORD *)(a1 + 40));
}

- (void)_updateMedicalIDNameWithDemographicsInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  objc_msgSend(v16, "firstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGivenName:", v5);

  objc_msgSend(v16, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFamilyName:", v6);

  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v4, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = v8 != 0;
  if (v8)
  {
    -[_HKMedicalIDData setName:](self->_medicalID, "setName:", v7);
    -[HKEmergencyCardNameAndPictureTableItem setData:](self->_nameAndPictureItem, "setData:", self->_medicalID);
  }
  objc_msgSend(v16, "dateOfBirthComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[_HKMedicalIDData setGregorianBirthday:](self->_medicalID, "setGregorianBirthday:", v10);
    v9 = 1;
  }
  objc_msgSend(v16, "bloodTypeObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "bloodType");

  if (v12)
  {
    -[_HKMedicalIDData setBloodType:](self->_medicalID, "setBloodType:", v12);
    v9 = 1;
  }
  objc_msgSend(v16, "heightQuantity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[_HKMedicalIDData setHeight:](self->_medicalID, "setHeight:", v13);
    v9 = 1;
  }
  objc_msgSend(v16, "weightQuantity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[_HKMedicalIDData setWeight:](self->_medicalID, "setWeight:", v14);
LABEL_12:
    -[HKMedicalIDViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reloadData");

    goto LABEL_13;
  }
  if (v9)
    goto LABEL_12;
LABEL_13:

}

- (void)_reloadTableWithMedicalIDData:(id)a3
{
  _HKMedicalIDData *v4;
  _HKMedicalIDData *medicalID;
  _HKMedicalIDData *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  char v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (_HKMedicalIDData *)a3;
  medicalID = self->_medicalID;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = (_HKMedicalIDData *)objc_alloc_init(MEMORY[0x1E0CB6FD8]);
    -[HKMedicalIDViewController _fetchDemographicInformation](self, "_fetchDemographicInformation");
    if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))
    {
      -[_HKMedicalIDData isOrganDonor](v6, "isOrganDonor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        -[_HKMedicalIDData setIsOrganDonor:](v6, "setIsOrganDonor:", &unk_1E9CEC800);
    }
  }
  if (self->_medicalID != v6)
    objc_storeStrong((id *)&self->_medicalID, v6);
  -[HKMedicalIDViewController _fetchProfileFirstName](self, "_fetchProfileFirstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HKMedicalIDViewController tableItems](self, "tableItems", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[HKMedicalIDViewController medicalID](self, "medicalID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setData:", v15);

        objc_msgSend(v14, "setProfileFirstName:", v8);
        objc_msgSend(v14, "setOwningViewController:", self);
        objc_msgSend(v14, "setShouldShowHints:", -[HKMedicalIDViewController shouldShowHints](self, "shouldShowHints"));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  -[HKMedicalIDViewController _refreshEmergencyContacts:](self, "_refreshEmergencyContacts:", medicalID == 0);
  -[HKMedicalIDViewController _buildPresentableTableItems](self, "_buildPresentableTableItems");
  -[HKMedicalIDViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reloadData");

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v19, "medicalIDViewControllerDidUpdate:", self);

  }
}

- (void)_contactStoreDidChange:(id)a3
{
  id v4;

  if (-[HKMedicalIDViewController _refreshEmergencyContacts:](self, "_refreshEmergencyContacts:", self->_medicalID == 0)&& !-[HKMedicalIDViewController shouldShowHints](self, "shouldShowHints"))
  {
    -[HKMedicalIDViewController _buildPresentableTableItems](self, "_buildPresentableTableItems");
  }
  -[HKMedicalIDViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (BOOL)_refreshEmergencyContacts:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  int v8;

  v3 = a3;
  -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  v7 = v6 == 1
    && -[_HKMedicalIDData consolidateSOSAndEmergencyContacts](self->_medicalID, "consolidateSOSAndEmergencyContacts");
  v8 = -[HKEmergencyCardContactsTableItem refreshFromData:](self->_contactsItem, "refreshFromData:", v3) || v7;
  if (v8 == 1 && !self->_inEditMode)
    -[HKMedicalIDViewController _updateMedicalID](self, "_updateMedicalID");
  return v8;
}

- (void)editButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  HKMedicalIDViewController *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  if (-[HKMedicalIDViewController _shouldShowOrganDonation](self, "_shouldShowOrganDonation")
    && (+[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable](HKOrganDonationConnectionManager, "isOrganDonationRegistrationAvailable")|| +[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))&& +[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))
  {
    -[HKMedicalIDViewController medicalID](self, "medicalID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("EDIT_MEDICAL_ID"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __46__HKMedicalIDViewController_editButtonTapped___block_invoke;
      v26[3] = &unk_1E9C412C8;
      v26[4] = self;
      v10 = v4;
      v27 = v10;
      objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, v26);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAction:", v11);

      v12 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EDIT_OD"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __46__HKMedicalIDViewController_editButtonTapped___block_invoke_2;
      v23 = &unk_1E9C412C8;
      v24 = self;
      v25 = v10;
      objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, &v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAction:", v15, v20, v21, v22, v23, v24);

      v16 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("EDIT_MEDICAL_ID_OD_CANCEL"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAction:", v19);

      -[HKMedicalIDViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
    }
    else
    {
      -[HKMedicalIDViewController editOrganDonation:](self, "editOrganDonation:", v4);
    }
  }
  else
  {
    -[HKMedicalIDViewController editMedicalID:](self, "editMedicalID:", v4);
  }

}

uint64_t __46__HKMedicalIDViewController_editButtonTapped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "editMedicalID:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__HKMedicalIDViewController_editButtonTapped___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "editOrganDonation:", *(_QWORD *)(a1 + 40));
}

- (void)_cancelEditingTapped:(id)a3
{
  HKMedicalIDViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "medicalIDViewControllerDidCancel:", self);

  }
}

- (void)_doneEditingTapped:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[NSArray makeObjectsPerformSelector:](self->_presentableTableItems, "makeObjectsPerformSelector:", sel_commitEditing);
  -[HKMedicalIDViewController _updateMedicalID](self, "_updateMedicalID");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "medicalIDViewControllerDidSave:", self);

  }
}

- (void)_nextButtonTapped:(id)a3
{
  if (self->_inEditMode)
  {
    -[NSArray makeObjectsPerformSelector:](self->_presentableTableItems, "makeObjectsPerformSelector:", sel_commitEditing);
    -[HKMedicalIDViewController _showMedicalIDPreviewAsNext](self, "_showMedicalIDPreviewAsNext");
  }
}

- (void)editMedicalID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKMedicalIDNavigationController *v8;
  HKMedicalIDNavigationController *medicalIDEditor;
  id v10;

  v10 = -[HKMedicalIDViewController initInEditMode:inBuddy:organDonationSignupAvailable:]([HKMedicalIDViewController alloc], "initInEditMode:inBuddy:organDonationSignupAvailable:", 1, self->_inBuddy, self->_organDonationSignupAvailable);
  -[HKMedicalIDViewController healthStore](self, "healthStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHealthStore:", v4);

  -[HKMedicalIDViewController medicalIDStore](self, "medicalIDStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMedicalIDStore:", v5);

  -[HKMedicalIDViewController medicalID](self, "medicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v10, "setMedicalID:", v7);

  objc_msgSend(v10, "setShowsDeleteButton:", -[HKMedicalIDViewController showsDeleteButton](self, "showsDeleteButton"));
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setInternalAccessType:", 6);
  objc_msgSend(v10, "setIsSecondaryProfileMedicalID:", -[HKMedicalIDViewController isSecondaryProfileMedicalID](self, "isSecondaryProfileMedicalID"));
  v8 = -[HKMedicalIDNavigationController initWithRootViewController:]([HKMedicalIDNavigationController alloc], "initWithRootViewController:", v10);
  -[HKMedicalIDViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  medicalIDEditor = self->_medicalIDEditor;
  self->_medicalIDEditor = v8;

}

- (void)editOrganDonation:(id)a3
{
  void *v4;
  HKMedicalIDNavigationController *v5;
  HKOrganDonationRegisterViewController *v6;

  v6 = objc_alloc_init(HKOrganDonationRegisterViewController);
  -[HKMedicalIDViewController medicalID](self, "medicalID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisterViewController setMedicalIDData:](v6, "setMedicalIDData:", v4);

  v5 = -[HKMedicalIDNavigationController initWithRootViewController:]([HKMedicalIDNavigationController alloc], "initWithRootViewController:", v6);
  -[HKMedicalIDViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
  -[HKOrganDonationRegisterViewController submitOrganDonationFlowImpressionEvent:](v6, "submitOrganDonationFlowImpressionEvent:", 1);

}

- (void)_doneTapped:(id)a3
{
  HKMedicalIDViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "medicalIDViewControllerDidFinish:", self);

  }
}

- (void)_buildTableItems
{
  if (-[HKMedicalIDViewController inEditMode](self, "inEditMode"))
    -[HKMedicalIDViewController _buildEditModeTableItems](self, "_buildEditModeTableItems");
  else
    -[HKMedicalIDViewController _buildViewModeTableItems](self, "_buildViewModeTableItems");
}

- (void)_buildEditModeTableItems
{
  HKEmergencyCardGroupTableItem *v3;
  HKEmergencyCardGroupTableItem *informationDataGroupItem;
  void *v5;
  void *v6;
  HKEmergencyCardNameAndPictureTableItem *v7;
  HKEmergencyCardNameAndPictureTableItem *nameAndPictureItem;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  HKEmergencyCardPrimaryLanguageTableItem *v19;
  HKEmergencyCardPrimaryLanguageTableItem *primaryLanguageItem;
  HKEmergencyCardContactsTableItem *v21;
  HKEmergencyCardContactsTableItem *contactsItem;
  NSArray *v23;
  HKEmergencyCardContactsTableItem *v24;
  void *v25;
  id v26;
  id v27;
  NSArray *tableItems;
  NSArray *v29;
  NSArray *v30;
  NSArray *localeItems;
  void *v32;
  id v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[9];

  v38[7] = *MEMORY[0x1E0C80C00];
  v3 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardGroupTableItem alloc], "initInEditMode:", 1);
  informationDataGroupItem = self->_informationDataGroupItem;
  self->_informationDataGroupItem = v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("information_header"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardGroupTableItem setTitleForHeader:](self->_informationDataGroupItem, "setTitleForHeader:", v6);

  v7 = -[HKEmergencyCardNameAndPictureTableItem initInEditMode:]([HKEmergencyCardNameAndPictureTableItem alloc], "initInEditMode:", 1);
  nameAndPictureItem = self->_nameAndPictureItem;
  self->_nameAndPictureItem = v7;

  v9 = -[HKEmergencyCardBirthdateTableItem initInEditMode:]([HKEmergencyCardBirthdateTableItem alloc], "initInEditMode:", 1);
  v34 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardWeightTableItem alloc], "initInEditMode:", 1);
  v33 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardHeightTableItem alloc], "initInEditMode:", 1);
  v10 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardBloodTypeTableItem alloc], "initInEditMode:", 1);
  v11 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardMedicalConditionsTableItem alloc], "initInEditMode:", 1);
  v12 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardMedicalNotesTableItem alloc], "initInEditMode:", 1);
  v13 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardAllergyInfoTableItem alloc], "initInEditMode:", 1);
  v14 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardMedicationInfoTableItem alloc], "initInEditMode:", 1);
  -[HKEmergencyCardNameAndPictureTableItem setRowHeightChangeDelegate:](self->_nameAndPictureItem, "setRowHeightChangeDelegate:", self);
  objc_msgSend(v11, "setRowHeightChangeDelegate:", self);
  objc_msgSend(v12, "setRowHeightChangeDelegate:", self);
  objc_msgSend(v13, "setRowHeightChangeDelegate:", self);
  objc_msgSend(v14, "setRowHeightChangeDelegate:", self);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38[0] = self->_nameAndPictureItem;
  v38[1] = v9;
  v32 = v9;
  v38[2] = v11;
  v38[3] = v12;
  v38[4] = v13;
  v38[5] = v14;
  v38[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

  if ((!self->_inBuddy
     || !+[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable](HKOrganDonationConnectionManager, "isOrganDonationRegistrationAvailable"))&& !self->_isSecondaryProfileMedicalID)
  {
    v17 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardOrganDonorTableItem alloc], "initInEditMode:", 1);
    objc_msgSend(v15, "addObject:", v17);

  }
  v37[0] = v34;
  v37[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v18);

  v19 = -[HKEmergencyCardPrimaryLanguageTableItem initInEditMode:]([HKEmergencyCardPrimaryLanguageTableItem alloc], "initInEditMode:", 1);
  primaryLanguageItem = self->_primaryLanguageItem;
  self->_primaryLanguageItem = v19;

  -[HKEmergencyCardPrimaryLanguageTableItem setDelegate:](self->_primaryLanguageItem, "setDelegate:", self);
  objc_msgSend(v15, "addObject:", self->_primaryLanguageItem);
  -[HKEmergencyCardGroupTableItem setSubitems:](self->_informationDataGroupItem, "setSubitems:", v15);
  v21 = -[HKEmergencyCardContactsTableItem initInEditMode:]([HKEmergencyCardContactsTableItem alloc], "initInEditMode:", 1);
  contactsItem = self->_contactsItem;
  self->_contactsItem = v21;

  -[HKEmergencyCardTableItem setIsSecondaryProfile:](self->_contactsItem, "setIsSecondaryProfile:", self->_isSecondaryProfileMedicalID);
  -[HKEmergencyCardContactsTableItem setDelegate:](self->_contactsItem, "setDelegate:", self);
  v23 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = self->_contactsItem;
  v36[0] = self->_informationDataGroupItem;
  v36[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v23, "addObjectsFromArray:", v25);

  if (self->_showsEmergencyAccessState || self->_showsShowWhenLockedState)
  {
    v26 = -[HKEmergencyCardEmergencyAccessTableItem initInEditMode:shouldShowLocked:shouldShareInfo:]([HKEmergencyCardEmergencyAccessTableItem alloc], "initInEditMode:shouldShowLocked:shouldShareInfo:", 1, self->_showsShowWhenLockedState, self->_showsEmergencyAccessState);
    objc_msgSend(v26, "setIsSecondaryProfile:", self->_isSecondaryProfileMedicalID);
    -[NSArray addObject:](v23, "addObject:", v26);

  }
  v27 = -[HKEmergencyCardDeletionTableItem initInEditMode:]([HKEmergencyCardDeletionTableItem alloc], "initInEditMode:", 1);
  objc_msgSend(v27, "setDeletionDelegate:", self);
  if (self->_showsDeleteButton)
    -[NSArray addObject:](v23, "addObject:", v27);
  tableItems = self->_tableItems;
  self->_tableItems = v23;
  v29 = v23;

  v35[0] = v34;
  v35[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  localeItems = self->_localeItems;
  self->_localeItems = v30;

}

- (void)_buildViewModeTableItems
{
  HKEmergencyCardGroupTableItem *v3;
  HKEmergencyCardGroupTableItem *informationDataGroupItem;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  HKEmergencyCardPrimaryLanguageTableItem *v19;
  HKEmergencyCardPrimaryLanguageTableItem *primaryLanguageItem;
  id v21;
  HKEmergencyCardContactsTableItem *v22;
  HKEmergencyCardContactsTableItem *contactsItem;
  NSArray *v24;
  HKEmergencyCardContactsTableItem *v25;
  void *v26;
  id v27;
  id v28;
  NSArray *tableItems;
  NSArray *v30;
  NSArray *v31;
  NSArray *localeItems;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[8];

  v38[6] = *MEMORY[0x1E0C80C00];
  v3 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardGroupTableItem alloc], "initInEditMode:", 0);
  informationDataGroupItem = self->_informationDataGroupItem;
  self->_informationDataGroupItem = v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("information_header"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEmergencyCardGroupTableItem setTitleForHeader:](self->_informationDataGroupItem, "setTitleForHeader:", v6);

  v7 = -[HKEmergencyCardSummaryTableItem initInEditMode:]([HKEmergencyCardSummaryTableItem alloc], "initInEditMode:", 0);
  v8 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardMedicalConditionsTableItem alloc], "initInEditMode:", 0);
  v9 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardMedicalNotesTableItem alloc], "initInEditMode:", 0);
  v10 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardAllergyInfoTableItem alloc], "initInEditMode:", 0);
  v11 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardMedicationInfoTableItem alloc], "initInEditMode:", 0);
  v12 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardBloodTypeTableItem alloc], "initInEditMode:", 0);
  v13 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardWeightTableItem alloc], "initInEditMode:", 0);
  v14 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardHeightTableItem alloc], "initInEditMode:", 0);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = v7;
  v38[0] = v7;
  v38[1] = v8;
  v34 = v8;
  v38[2] = v9;
  v38[3] = v10;
  v38[4] = v11;
  v38[5] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

  if (!self->_isSecondaryProfileMedicalID)
  {
    v17 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardOrganDonorTableItem alloc], "initInEditMode:", 0);
    objc_msgSend(v15, "addObject:", v17);

  }
  v37[0] = v13;
  v37[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v18);

  v19 = -[HKEmergencyCardPrimaryLanguageTableItem initInEditMode:]([HKEmergencyCardPrimaryLanguageTableItem alloc], "initInEditMode:", 0);
  primaryLanguageItem = self->_primaryLanguageItem;
  self->_primaryLanguageItem = v19;

  -[HKEmergencyCardPrimaryLanguageTableItem setDelegate:](self->_primaryLanguageItem, "setDelegate:", self);
  objc_msgSend(v15, "addObject:", self->_primaryLanguageItem);
  if (self->_isSecondaryProfileMedicalID && !self->_inBridge)
  {
    v21 = -[HKEmergencyCardFooterTableItem initInEditMode:]([HKEmergencyCardEditMedicalIDFooterTableItem alloc], "initInEditMode:", 0);
    objc_msgSend(v15, "addObject:", v21);

  }
  -[HKEmergencyCardGroupTableItem setSubitems:](self->_informationDataGroupItem, "setSubitems:", v15);
  v22 = -[HKEmergencyCardContactsTableItem initInEditMode:]([HKEmergencyCardContactsTableItem alloc], "initInEditMode:", 0);
  contactsItem = self->_contactsItem;
  self->_contactsItem = v22;

  -[HKEmergencyCardTableItem setIsSecondaryProfile:](self->_contactsItem, "setIsSecondaryProfile:", -[HKMedicalIDViewController isSecondaryProfileMedicalID](self, "isSecondaryProfileMedicalID"));
  v24 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = self->_contactsItem;
  v36[0] = self->_informationDataGroupItem;
  v36[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray addObjectsFromArray:](v24, "addObjectsFromArray:", v26);

  if (self->_showsEmergencyAccessState || self->_showsShowWhenLockedState)
  {
    v27 = -[HKEmergencyCardEmergencyAccessTableItem initInEditMode:shouldShowLocked:shouldShareInfo:]([HKEmergencyCardEmergencyAccessTableItem alloc], "initInEditMode:shouldShowLocked:shouldShareInfo:", 0, self->_showsShowWhenLockedState, self->_showsEmergencyAccessState);
    objc_msgSend(v27, "setIsSecondaryProfile:", self->_isSecondaryProfileMedicalID);
    -[NSArray addObject:](v24, "addObject:", v27);

  }
  if (self->_showsEditMedicalIDRowInViewMode)
  {
    v28 = -[HKEmergencyCardTableItem initInEditMode:]([HKEmergencyCardSelectionTableItem alloc], "initInEditMode:", 0);
    objc_msgSend(v28, "setSelectionDelegate:", self);
    -[NSArray addObject:](v24, "addObject:", v28);

  }
  tableItems = self->_tableItems;
  self->_tableItems = v24;
  v30 = v24;

  v35 = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
  localeItems = self->_localeItems;
  self->_localeItems = v31;

}

- (id)_fetchProfileFirstName
{
  return (id)-[HKProfileStore synchronouslyFetchFirstName](self->_profileStore, "synchronouslyFetchFirstName");
}

- (int64_t)_preferredOrganDonationOrganization
{
  return +[HKOrganDonationConnectionManager isOrganDonationRegistrationAvailable](HKOrganDonationConnectionManager, "isOrganDonationRegistrationAvailable");
}

- (void)_buildPresentableTableItems
{
  NSArray *v3;
  NSArray *presentableTableItems;
  NSArray *v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSArray *v15;
  id v16;
  unint64_t v17;
  id v18;
  NSArray *v19;
  unint64_t v20;
  id v21;
  NSArray *headers;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_inEditMode)
  {
    v3 = (NSArray *)-[NSArray mutableCopy](self->_tableItems, "mutableCopy");
    presentableTableItems = self->_presentableTableItems;
    self->_presentableTableItems = v3;

  }
  else
  {
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = self->_tableItems;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPresentableData", (_QWORD)v23))
          {
            -[NSArray addObject:](v5, "addObject:", v13);
            v10 += objc_msgSend(v13, "numberOfRows");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v14);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v15 = self->_presentableTableItems;
    self->_presentableTableItems = v5;

  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_presentableTableItems, "count"))
  {
    v17 = 0;
    do
    {
      v18 = -[HKMedicalIDViewController _newViewForFooterInSection:](self, "_newViewForFooterInSection:", v17, (_QWORD)v23);
      objc_msgSend(v16, "addObject:", v18);

      ++v17;
    }
    while (v17 < -[NSArray count](self->_presentableTableItems, "count"));
  }
  objc_storeStrong((id *)&self->_footers, v16);
  v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_presentableTableItems, "count"))
  {
    v20 = 0;
    do
    {
      v21 = -[HKMedicalIDViewController _newViewForHeaderInSection:](self, "_newViewForHeaderInSection:", v20, (_QWORD)v23);
      -[NSArray addObject:](v19, "addObject:", v21);

      ++v20;
    }
    while (v20 < -[NSArray count](self->_presentableTableItems, "count"));
  }
  headers = self->_headers;
  self->_headers = v19;

}

- (id)_newViewForFooterInSection:(int64_t)a3
{
  HKTableViewFooterView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v5 = objc_alloc_init(HKTableViewFooterView);
  -[NSArray objectAtIndexedSubscript:](self->_presentableTableItems, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForFooter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTableViewFooterView label](v5, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_contentMargin");
  v11 = v10;
  -[HKMedicalIDViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_contentMargin");
  -[HKTableViewFooterView setContentInsets:](v5, "setContentInsets:", 10.0, v11, 5.0, v13);

  return v5;
}

- (id)_newViewForHeaderInSection:(int64_t)a3
{
  HKTableViewHeaderView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v5 = objc_alloc_init(HKTableViewHeaderView);
  -[NSArray objectAtIndexedSubscript:](self->_presentableTableItems, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForHeader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTableViewHeaderView label](v5, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  if (self->_inEditMode)
  {
    -[HKMedicalIDViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_contentMargin");
    v11 = v10;
    -[HKMedicalIDViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_contentMargin");
    -[HKTableViewHeaderView setContentInsets:](v5, "setContentInsets:", 20.0, v11, 10.0, v13);

  }
  else
  {
    -[HKTableViewHeaderView setContentInsets:](v5, "setContentInsets:", 20.0, 16.0, 10.0, 16.0);
  }
  return v5;
}

- (void)_dismissMedicalIDEditor
{
  uint64_t v3;
  void *v4;
  HKMedicalIDNavigationController *v5;
  HKMedicalIDNavigationController *medicalIDEditor;
  HKMedicalIDNavigationController *v7;

  -[HKMedicalIDViewController presentedViewController](self, "presentedViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HKMedicalIDViewController presentedViewController](self, "presentedViewController");
    v5 = (HKMedicalIDNavigationController *)objc_claimAutoreleasedReturnValue();
    medicalIDEditor = self->_medicalIDEditor;

    if (v5 == medicalIDEditor)
    {
      -[HKMedicalIDViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      v7 = self->_medicalIDEditor;
      self->_medicalIDEditor = 0;

    }
  }
}

- (BOOL)_shouldShowOrganDonation
{
  int64_t v2;

  if (self->_inBuddy || !self->_organDonationSignupAvailable)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    v2 = -[HKMedicalIDViewController _preferredOrganDonationOrganization](self, "_preferredOrganDonationOrganization");
    if (v2)
      LOBYTE(v2) = !self->_showsDismissButton;
  }
  return v2;
}

- (BOOL)_editable
{
  return !self->_inBuddy && !self->_showsDismissButton;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_presentableTableItems, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_presentableTableItems, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRows");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[HKMedicalIDViewController _tableItemForIndexPath:](self, "_tableItemForIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "tableView:cellForRowAtIndex:", v6, -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v8, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v9, "bounds");
      objc_msgSend(v9, "setSeparatorInset:", 0.0, v10 + v10, 0.0, 0.0);
    }
    else
    {
      objc_msgSend(v8, "separatorInset");
      objc_msgSend(v9, "setSeparatorInset:");
      objc_msgSend(v9, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "backgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v9, "contentView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "backgroundColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBackgroundColor:", v14);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setBackgroundColor:", v13);
      }

    }
  }
  else
  {
    HKErrorTableViewCell(CFSTR("HKMedicalIDViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "estimatedRowHeight");
  v9 = v8;
  -[HKMedicalIDViewController _tableItemForIndexPath:](self, "_tableItemForIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "tableView:estimatedHeightForRowAtIndex:", v6, -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v10, v7));
    v9 = v11;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rowHeight");
  v9 = v8;
  -[HKMedicalIDViewController _tableItemForIndexPath:](self, "_tableItemForIndexPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "tableView:heightForRowAtIndex:", v6, -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v10, v7));
    v9 = v11;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;
  double v9;
  CGRect v11;

  v6 = a3;
  v7 = 0.0;
  if (-[NSArray count](self->_headers, "count") > a4)
  {
    -[NSArray objectAtIndexedSubscript:](self->_headers, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v8, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v11));
    objc_msgSend(v8, "intrinsicContentSize");
    v7 = v9;

  }
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v6;

  if (-[NSArray count](self->_headers, "count", a3) <= a4)
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_headers, "objectAtIndexedSubscript:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v6;

  if (-[NSArray count](self->_footers, "count", a3) <= a4)
  {
    v6 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_footers, "objectAtIndexedSubscript:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  double v7;
  void *v8;
  double v9;
  CGRect v11;

  v6 = a3;
  v7 = 0.0;
  if (-[NSArray count](self->_footers, "count") > a4)
  {
    -[NSArray objectAtIndexedSubscript:](self->_footers, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v8, "setPreferredMaxLayoutWidth:", CGRectGetWidth(v11));
    objc_msgSend(v8, "intrinsicContentSize");
    v7 = v9;

  }
  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isDecelerating") & 1) != 0 || (objc_msgSend(v6, "isDragging") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[HKMedicalIDViewController _tableItemForIndexPath:](self, "_tableItemForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "shouldHighlightRowAtIndex:", -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v9, v7));
    if ((v8 & 1) == 0
      && -[HKMedicalIDViewController tableView:editingStyleForRowAtIndexPath:](self, "tableView:editingStyleForRowAtIndexPath:", v6, v7) == 2)
    {
      -[HKMedicalIDViewController tableView:commitEditingStyle:forRowAtIndexPath:](self, "tableView:commitEditingStyle:forRowAtIndexPath:", v6, 2, v7);
    }

  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[HKMedicalIDViewController _tableItemForIndexPath:](self, "_tableItemForIndexPath:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v9, v6);

  objc_msgSend(v9, "tableView:didSelectRowAtIndex:", v7, v8);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  if (!self->_inEditMode)
    return 0;
  v5 = a4;
  -[HKMedicalIDViewController _tableItemForIndexPath:](self, "_tableItemForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v6, v5);

  LOBYTE(v7) = objc_msgSend(v6, "canEditRowAtIndex:", v7);
  return v7;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;
  int64_t v8;

  if (!self->_inEditMode)
    return 0;
  v5 = a4;
  -[HKMedicalIDViewController _tableItemForIndexPath:](self, "_tableItemForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v6, v5);

  v8 = objc_msgSend(v6, "editingStyleForRowAtIndex:", v7);
  return v8;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (self->_inEditMode)
  {
    -[HKMedicalIDViewController _tableItemForIndexPath:](self, "_tableItemForIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "commitEditingStyle:forRowAtIndex:", a4, -[HKMedicalIDViewController _rowIndexForTableItem:atIndexPath:](self, "_rowIndexForTableItem:atIndexPath:", v10, v9));
    if (v11 == 2)
    {
      objc_msgSend(v8, "beginUpdates");
      v13 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reloadRowsAtIndexPaths:withRowAnimation:", v12, 0);
    }
    else
    {
      if (v11 != 1)
      {
LABEL_7:
        objc_msgSend(v10, "didCommitEditingStyle:forRowAtIndex:", a4, objc_msgSend(v9, "row"));

        goto LABEL_8;
      }
      objc_msgSend(v8, "beginUpdates");
      v14[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 100);
    }

    objc_msgSend(v8, "endUpdates");
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateEmergencyContactTableItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[HKMedicalIDViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginUpdates");

  -[HKMedicalIDViewController tableItems](self, "tableItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", self->_contactsItem);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadSections:withRowAnimation:", v7, 0);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endUpdates");

}

- (void)updatePrimaryLanguageTableItem
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[HKMedicalIDViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginUpdates");

  -[HKMedicalIDViewController tableItems](self, "tableItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", self->_informationDataGroupItem);

  -[HKEmergencyCardGroupTableItem subitems](self->_informationDataGroupItem, "subitems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", self->_primaryLanguageItem);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadRowsAtIndexPaths:withRowAnimation:", v10, 0);

  -[HKMedicalIDViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endUpdates");

}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)_tableItemForIndexPath:(id)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_presentableTableItems, "objectAtIndexedSubscript:", objc_msgSend(a3, "section"));
}

- (int64_t)_rowIndexForTableItem:(id)a3 atIndexPath:(id)a4
{
  return objc_msgSend(a4, "row", a3);
}

- (void)deletionTableItemDidTapDelete:(id)a3
{
  HKMedicalIDViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "medicalIDViewControllerDidDelete:", self);

  }
}

- (void)medicalIDViewControllerDidDelete:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;

  -[HKMedicalIDViewController _dismissMedicalIDEditor](self, "_dismissMedicalIDEditor", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "medicalIDViewControllerDidDelete:", self);

  }
}

- (void)selectionTableItemDidTap:(id)a3
{
  -[HKMedicalIDViewController editMedicalID:](self, "editMedicalID:", self);
}

- (void)tableItem:(id)a3 heightDidChangeForRowIndex:(int64_t)a4 keepRectVisible:(CGRect)a5 inView:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  id v12;
  _QWORD v13[5];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = (void *)MEMORY[0x1E0DC3F10];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__HKMedicalIDViewController_tableItem_heightDidChangeForRowIndex_keepRectVisible_inView___block_invoke;
  v13[3] = &unk_1E9C3F0D0;
  v13[4] = self;
  v12 = a6;
  objc_msgSend(v11, "performWithoutAnimation:", v13);
  -[HKMedicalIDViewController _adjustTableViewContentOffsetForVisibleView:visibleRect:animated:](self, "_adjustTableViewContentOffsetForVisibleView:visibleRect:animated:", v12, 1, x, y, width, height);

}

void __89__HKMedicalIDViewController_tableItem_heightDidChangeForRowIndex_keepRectVisible_inView___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUpdates");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endUpdates");

}

- (void)tableItemDidBeginEditing:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
  -[HKMedicalIDViewController _adjustTableViewContentOffsetForVisibleView:visibleRect:animated:](self, "_adjustTableViewContentOffsetForVisibleView:visibleRect:animated:", a5, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)tableItemDidChangeSelection:(id)a3 keepRectVisible:(CGRect)a4 inView:(id)a5
{
  -[HKMedicalIDViewController _adjustTableViewContentOffsetForVisibleView:visibleRect:animated:](self, "_adjustTableViewContentOffsetForVisibleView:visibleRect:animated:", a5, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)_adjustTableViewContentOffsetForVisibleView:(id)a3 visibleRect:(CGRect)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  if (a3)
  {
    v5 = a5;
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v11 = a3;
    -[HKMedicalIDViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:fromView:", v11, x, y, width, height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[HKMedicalIDViewController tableView](self, "tableView");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scrollRectToVisible:animated:", v5, v14, v16, v18, v20);

  }
}

- (void)_showMedicalIDPreviewAsNext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = -[HKMedicalIDViewController initInEditMode:inBuddy:organDonationSignupAvailable:]([HKMedicalIDViewController alloc], "initInEditMode:inBuddy:organDonationSignupAvailable:", 0, self->_inBuddy, self->_organDonationSignupAvailable);
  -[HKMedicalIDViewController healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHealthStore:", v3);

  -[HKMedicalIDViewController medicalIDStore](self, "medicalIDStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMedicalIDStore:", v4);

  -[HKMedicalIDViewController medicalID](self, "medicalID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v9, "setMedicalID:", v6);

  objc_msgSend(v9, "setShowsDeleteButton:", -[HKMedicalIDViewController showsDeleteButton](self, "showsDeleteButton"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v9, "setDelegate:", WeakRetained);

  -[HKMedicalIDViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pushViewController:animated:", v9, 1);

}

- (void)_forceDisableBiometricIfDeviceLocked
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Failed to force passcode lock with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_refreshMedicalIDInViewMode
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  if (!-[HKMedicalIDViewController inEditMode](self, "inEditMode"))
  {
    -[HKMedicalIDViewController medicalIDStore](self, "medicalIDStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = objc_alloc(MEMORY[0x1E0CB6848]);
      -[HKMedicalIDViewController healthStore](self, "healthStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v4, "initWithHealthStore:", v5);
      -[HKMedicalIDViewController setMedicalIDStore:](self, "setMedicalIDStore:", v6);

    }
    -[HKMedicalIDViewController medicalIDStore](self, "medicalIDStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke;
    v8[3] = &unk_1E9C432C0;
    v8[4] = self;
    objc_msgSend(v7, "fetchMedicalIDDataWithCompletion:", v8);

  }
}

void __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke_318;
    v9[3] = &unk_1E9C3FC50;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
      __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke_cold_1(a1, (uint64_t)v7, v8);
  }

}

uint64_t __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke_318(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTableWithMedicalIDData:", *(_QWORD *)(a1 + 40));
}

- (void)_updateMedicalID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[HKMedicalIDViewController medicalIDStore](self, "medicalIDStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6848]), "initWithHealthStore:", self->_healthStore);
    -[HKMedicalIDViewController setMedicalIDStore:](self, "setMedicalIDStore:", v4);

  }
  -[HKMedicalIDViewController medicalIDStore](self, "medicalIDStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicalIDViewController medicalID](self, "medicalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HKMedicalIDViewController__updateMedicalID__block_invoke;
  v7[3] = &unk_1E9C3FB40;
  v7[4] = self;
  objc_msgSend(v5, "updateMedicalIDData:completion:", v6, v7);

}

void __45__HKMedicalIDViewController__updateMedicalID__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_ERROR))
      __45__HKMedicalIDViewController__updateMedicalID__block_invoke_cold_1(a1, (uint64_t)v5, v6);
  }

}

- (id)_formatMedicalIDAccessPoint:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return &stru_1E9C4C428;
  else
    return off_1E9C43310[a3 - 1];
}

- (void)_submitAccessAnalytic
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[8];
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  if (HKImproveHealthAndActivityAnalyticsAllowed())
  {
    -[HKMedicalIDViewController _formatMedicalIDAccessPoint:](self, "_formatMedicalIDAccessPoint:", -[HKMedicalIDViewController internalAccessType](self, "internalAccessType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("applicationIdentifier");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    v15[1] = v3;
    v14[1] = CFSTR("healthAccessType");
    v14[2] = CFSTR("profileType");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2] = v8;
    v14[3] = CFSTR("typeOfAccess");
    v9 = -[HKMedicalIDViewController internalAccessType](self, "internalAccessType");
    v10 = CFSTR("Health");
    if (!v9)
      v10 = CFSTR("Other");
    v15[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    AnalyticsSendEvent();
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5300];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5300], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D7813000, v12, OS_LOG_TYPE_INFO, "Submitted Medical ID Access Event", v13, 2u);
    }

  }
}

- (_HKMedicalIDData)medicalID
{
  return self->_medicalID;
}

- (void)setMedicalID:(id)a3
{
  objc_storeStrong((id *)&self->_medicalID, a3);
}

- (BOOL)allowsEditing
{
  return self->_allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->_allowsEditing = a3;
}

- (BOOL)showsDismissButton
{
  return self->_showsDismissButton;
}

- (void)setShowsDismissButton:(BOOL)a3
{
  self->_showsDismissButton = a3;
}

- (BOOL)showsDeleteButton
{
  return self->_showsDeleteButton;
}

- (void)setShowsDeleteButton:(BOOL)a3
{
  self->_showsDeleteButton = a3;
}

- (BOOL)modernAppearance
{
  return self->_modernAppearance;
}

- (void)setModernAppearance:(BOOL)a3
{
  self->_modernAppearance = a3;
}

- (BOOL)shouldShowHints
{
  return self->_shouldShowHints;
}

- (void)setShouldShowHints:(BOOL)a3
{
  self->_shouldShowHints = a3;
}

- (BOOL)showsShowWhenLockedState
{
  return self->_showsShowWhenLockedState;
}

- (void)setShowsShowWhenLockedState:(BOOL)a3
{
  self->_showsShowWhenLockedState = a3;
}

- (BOOL)showsEmergencyAccessState
{
  return self->_showsEmergencyAccessState;
}

- (void)setShowsEmergencyAccessState:(BOOL)a3
{
  self->_showsEmergencyAccessState = a3;
}

- (BOOL)showsEditMedicalIDRowInViewMode
{
  return self->_showsEditMedicalIDRowInViewMode;
}

- (void)setShowsEditMedicalIDRowInViewMode:(BOOL)a3
{
  self->_showsEditMedicalIDRowInViewMode = a3;
}

- (BOOL)inBridge
{
  return self->_inBridge;
}

- (void)setInBridge:(BOOL)a3
{
  self->_inBridge = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKMedicalIDStore)medicalIDStore
{
  return self->_medicalIDStore;
}

- (void)setMedicalIDStore:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDStore, a3);
}

- (HKMedicalIDViewControllerDelegate)delegate
{
  return (HKMedicalIDViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)internalAccessType
{
  return self->_internalAccessType;
}

- (void)setInternalAccessType:(int64_t)a3
{
  self->_internalAccessType = a3;
}

- (BOOL)isSecondaryProfileMedicalID
{
  return self->_isSecondaryProfileMedicalID;
}

- (void)setIsSecondaryProfileMedicalID:(BOOL)a3
{
  self->_isSecondaryProfileMedicalID = a3;
}

- (NSArray)tableItems
{
  return self->_tableItems;
}

- (void)setTableItems:(id)a3
{
  objc_storeStrong((id *)&self->_tableItems, a3);
}

- (BOOL)inEditMode
{
  return self->_inEditMode;
}

- (void)setInEditMode:(BOOL)a3
{
  self->_inEditMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_medicalID, 0);
  objc_storeStrong((id *)&self->_organDonationItems, 0);
  objc_storeStrong((id *)&self->_medicalIDEditor, 0);
  objc_storeStrong((id *)&self->_accumulatedNumberOfRowsForItems, 0);
  objc_storeStrong((id *)&self->_localeItems, 0);
  objc_storeStrong((id *)&self->_primaryLanguageItem, 0);
  objc_storeStrong((id *)&self->_contactsItem, 0);
  objc_storeStrong((id *)&self->_nameAndPictureItem, 0);
  objc_storeStrong((id *)&self->_informationDataGroupItem, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_footers, 0);
  objc_storeStrong((id *)&self->_presentableTableItems, 0);
  objc_storeStrong((id *)&self->_profileStore, 0);
}

void __56__HKMedicalIDViewController__refreshMedicalIDInViewMode__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0CB7740];
  v5 = 138543874;
  v6 = v3;
  v7 = 2080;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch MedicalID on notification %s, error: %{public}@", (uint8_t *)&v5, 0x20u);
}

void __45__HKMedicalIDViewController__updateMedicalID__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update MedicalID, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
