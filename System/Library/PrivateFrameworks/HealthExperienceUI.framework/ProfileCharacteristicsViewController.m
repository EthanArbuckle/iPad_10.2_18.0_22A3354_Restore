@implementation ProfileCharacteristicsViewController

+ (double)avatarImageSize
{
  double result;

  objc_msgSend(MEMORY[0x1E0D2F2D8], "avatarViewSize");
  return result;
}

- (ProfileCharacteristicsViewController)initWithHealthStore:(id)a3
{
  id v5;
  ProfileCharacteristicsViewController *v6;
  ProfileCharacteristicsViewController *v7;
  uint64_t v8;
  HKDisplayTypeController *displayTypeController;
  uint64_t v10;
  WDUserDefaults *userDefaults;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 *p_pregnancySectionHidden;
  uint64_t v18;
  NSArray *orderedSectionIdentifiers;
  uint64_t v20;
  NSDictionary *orderedRowIdentifiersBySectionIdentifier;
  uint64_t v22;
  HKBirthdateChangeManager *birthdateChangeManager;
  void *v24;
  NSObject *v25;
  uint8_t v27[16];
  objc_super v28;

  v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ProfileCharacteristicsViewController;
  v6 = -[ProfileCharacteristicsViewController initWithStyle:](&v28, sel_initWithStyle_, 2);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v7->_beginInEditMode = 0;
    v7->_accessType = 0;
    objc_msgSend(MEMORY[0x1E0D2F700], "sharedInstanceForHealthStore:", v7->_healthStore);
    v8 = objc_claimAutoreleasedReturnValue();
    displayTypeController = v7->_displayTypeController;
    v7->_displayTypeController = (HKDisplayTypeController *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2F0]), "initWithHealthStore:", v5);
    userDefaults = v7->_userDefaults;
    v7->_userDefaults = (WDUserDefaults *)v10;

    objc_msgSend(v5, "profileIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_nameRowsHidden = +[ProfileCharacteristicsViewController nameRowsHiddenForProfileIdentifier:](ProfileCharacteristicsViewController, "nameRowsHiddenForProfileIdentifier:", v12);

    objc_msgSend(v5, "profileIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_cardioFitnessMedicationsSectionHidden = +[ProfileCharacteristicsViewController cardioFitnessMedicationsSectionHiddenForProfileIdentifier:](ProfileCharacteristicsViewController, "cardioFitnessMedicationsSectionHiddenForProfileIdentifier:", v13);

    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "features");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "seahorse") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      p_pregnancySectionHidden = (unsigned __int8 *)&v7->_pregnancySectionHidden;
      v7->_pregnancySectionHidden = objc_msgSend(v16, "healthAppSupportedOnDevice") ^ 1;

    }
    else
    {
      p_pregnancySectionHidden = (unsigned __int8 *)&v7->_pregnancySectionHidden;
      v7->_pregnancySectionHidden = 1;
    }

    +[ProfileCharacteristicsViewController orderedSectionIdentifiersWithPregnancySectionHidden:cardioFitnessMedicationsSectionHidden:](ProfileCharacteristicsViewController, "orderedSectionIdentifiersWithPregnancySectionHidden:cardioFitnessMedicationsSectionHidden:", *p_pregnancySectionHidden, v7->_cardioFitnessMedicationsSectionHidden);
    v18 = objc_claimAutoreleasedReturnValue();
    orderedSectionIdentifiers = v7->_orderedSectionIdentifiers;
    v7->_orderedSectionIdentifiers = (NSArray *)v18;

    +[ProfileCharacteristicsViewController orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:pregnancySectionHidden:cardioFitnessMedicationsSectionHidden:](ProfileCharacteristicsViewController, "orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:pregnancySectionHidden:cardioFitnessMedicationsSectionHidden:", v7->_nameRowsHidden, *p_pregnancySectionHidden, v7->_cardioFitnessMedicationsSectionHidden);
    v20 = objc_claimAutoreleasedReturnValue();
    orderedRowIdentifiersBySectionIdentifier = v7->_orderedRowIdentifiersBySectionIdentifier;
    v7->_orderedRowIdentifiersBySectionIdentifier = (NSDictionary *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D2F5D8]), "initWithHealthStore:", v5);
    birthdateChangeManager = v7->_birthdateChangeManager;
    v7->_birthdateChangeManager = (HKBirthdateChangeManager *)v22;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v7, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

    v7->_isPregnant = 0;
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5310];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5310], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1A95F5000, v25, OS_LOG_TYPE_DEFAULT, "Starting pregnancy model query", v27, 2u);
    }
    -[ProfileCharacteristicsViewController _startPregnancyModelQuery](v7, "_startPregnancyModelQuery");
  }

  return v7;
}

- (ProfileCharacteristicsViewController)initWithHealthStore:(id)a3 inEditMode:(BOOL)a4
{
  ProfileCharacteristicsViewController *result;

  result = -[ProfileCharacteristicsViewController initWithHealthStore:](self, "initWithHealthStore:", a3);
  result->_beginInEditMode = a4;
  return result;
}

+ (BOOL)nameRowsHiddenForProfileIdentifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("TinkerProfileCharacteristicsHideNameRows"));

  if (v5)
    v6 = objc_msgSend(v3, "type") == 3;
  else
    v6 = 0;

  return v6;
}

+ (BOOL)cardioFitnessMedicationsSectionHiddenForProfileIdentifier:(id)a3
{
  return objc_msgSend(a3, "type") != 1;
}

+ (id)orderedSectionIdentifiersWithPregnancySectionHidden:(BOOL)a3 cardioFitnessMedicationsSectionHidden:(BOOL)a4
{
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "addObjectsFromArray:", &unk_1E55CD508);
  if (!a3)
    objc_msgSend(v6, "addObject:", &unk_1E55CCFF8);
  if (!a4)
    objc_msgSend(v6, "addObject:", &unk_1E55CD010);
  return v6;
}

+ (id)orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:(BOOL)a3 pregnancySectionHidden:(BOOL)a4 cardioFitnessMedicationsSectionHidden:(BOOL)a5
{
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v8 = (void *)objc_opt_new();
  if (a3)
  {
    v9 = &unk_1E55CD520;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    if (objc_msgSend(v10, "isGivenNameFirst"))
      v11 = &unk_1E55CD538;
    else
      v11 = &unk_1E55CD550;
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", &unk_1E55CD520);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setObject:forKey:", v9, &unk_1E55CCFC8);
  objc_msgSend(v8, "setObject:forKey:", &unk_1E55CD568, &unk_1E55CCFE0);
  if (!a4)
    objc_msgSend(v8, "setObject:forKey:", &unk_1E55CD580, &unk_1E55CCFF8);
  if (!a5)
    objc_msgSend(v8, "setObject:forKey:", &unk_1E55CD598, &unk_1E55CD010);

  return v8;
}

- (ProfileCharacteristicsViewController)initWithStyle:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The -%@ method is not available on %@"), v6, objc_opt_class());

  return 0;
}

- (ProfileCharacteristicsViewController)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ProfileCharacteristicsViewController;
  return -[ProfileCharacteristicsViewController initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (ProfileCharacteristicsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (void)setAvatarImage:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_avatarImage, a3);
  if (-[ProfileCharacteristicsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[ProfileCharacteristicsViewController avatarImageView](self, "avatarImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

    -[ProfileCharacteristicsViewController _adjustHeaderFrame](self, "_adjustHeaderFrame");
  }

}

- (UIImageView)avatarImageView
{
  UIImageView *avatarImageView;
  UIImageView *v4;
  UIImageView *v5;

  avatarImageView = self->_avatarImageView;
  if (!avatarImageView)
  {
    v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    v5 = self->_avatarImageView;
    self->_avatarImageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_avatarImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WDProfileHeaderView setAvatarView:](self->_headerView, "setAvatarView:", self->_avatarImageView);
    avatarImageView = self->_avatarImageView;
  }
  return avatarImageView;
}

- (void)setUpNavigationBar
{
  void *v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *customLeftBarButtonItem;
  id v7;

  WDBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HEALTH_PROFILE_TITLE"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProfileCharacteristicsViewController setTitle:](self, "setTitle:", v4);

  -[ProfileCharacteristicsViewController navigationItem](self, "navigationItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  customLeftBarButtonItem = self->_customLeftBarButtonItem;
  self->_customLeftBarButtonItem = v5;

}

- (void)viewDidLoad
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  ProfileCharacteristicDiffableDataSource *v18;
  void *v19;
  uint64_t v20;
  ProfileCharacteristicDiffableDataSource *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)ProfileCharacteristicsViewController;
  -[ProfileCharacteristicsViewController viewDidLoad](&v32, sel_viewDidLoad);
  -[ProfileCharacteristicsViewController setUpNavigationBar](self, "setUpNavigationBar");
  v3 = *MEMORY[0x1E0DC53D8];
  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRowHeight:", v3);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");
  v7 = v6 * 3.0;
  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEstimatedRowHeight:", v7);

  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsSelectionDuringEditing:", 1);

  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundView:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D2F710], "defaultReuseIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerClass:forHeaderFooterViewReuseIdentifier:", v14, v15);

  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", v17);

  if (self->_beginInEditMode)
    -[ProfileCharacteristicsViewController setEditing:](self, "setEditing:", 1);
  -[ProfileCharacteristicsViewController _createHeader](self, "_createHeader");
  -[ProfileCharacteristicsViewController _createBarButtonItems](self, "_createBarButtonItems");
  -[ProfileCharacteristicsViewController _createPickers](self, "_createPickers");
  -[ProfileCharacteristicsViewController _updatePickersWithDisplayValues](self, "_updatePickersWithDisplayValues");
  -[ProfileCharacteristicsViewController _createCells](self, "_createCells");
  -[ProfileCharacteristicsViewController setCardioFitnessMedicationCheckmarks](self, "setCardioFitnessMedicationCheckmarks");
  objc_initWeak(&location, self);
  v18 = [ProfileCharacteristicDiffableDataSource alloc];
  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __51__ProfileCharacteristicsViewController_viewDidLoad__block_invoke;
  v29[3] = &unk_1E5575828;
  objc_copyWeak(&v30, &location);
  v21 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v18, "initWithTableView:cellProvider:", v19, v29);
  -[ProfileCharacteristicsViewController setDataSource:](self, "setDataSource:", v21);

  v27[0] = v20;
  v27[1] = 3221225472;
  v27[2] = __51__ProfileCharacteristicsViewController_viewDidLoad__block_invoke_2;
  v27[3] = &unk_1E5575850;
  objc_copyWeak(&v28, &location);
  -[ProfileCharacteristicsViewController dataSource](self, "dataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFooterTitleProvider:", v27);

  -[ProfileCharacteristicsViewController updateTableViewIfNeeded](self, "updateTableViewIfNeeded");
  -[ProfileCharacteristicsViewController dataSource](self, "dataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDefaultRowAnimation:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProfileCharacteristicsViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setBackgroundColor:", v24);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addObserver:selector:name:object:", self, sel__timeZoneDidChange_, *MEMORY[0x1E0C998A0], 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

id __51__ProfileCharacteristicsViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = objc_msgSend(v4, "item");
  v8 = objc_msgSend(v4, "section");

  objc_msgSend(v6, "indexPathForItem:inSection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "getCellForIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __51__ProfileCharacteristicsViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_titleForFooterInTableViewSection:sectionIdentifier:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ProfileCharacteristicsViewController;
  -[ProfileCharacteristicsViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[ProfileCharacteristicsViewController settingsNavigationDonatingDelegate](self, "settingsNavigationDonatingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs://root=HEALTH&path=HEALTH_DETAILS_ITEM"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "donateWithDeepLink:andTitle:", v5, CFSTR("Health Details"));

}

- (void)updateTableViewIfNeeded
{
  id v3;
  NSArray *v4;
  NSArray *orderedSectionIdentifiers;
  NSDictionary *v6;
  NSDictionary *orderedRowIdentifiersBySectionIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[ProfileCharacteristicsViewController setCurrentSnapshot:](self, "setCurrentSnapshot:", v3);

  +[ProfileCharacteristicsViewController orderedSectionIdentifiersWithPregnancySectionHidden:cardioFitnessMedicationsSectionHidden:](ProfileCharacteristicsViewController, "orderedSectionIdentifiersWithPregnancySectionHidden:cardioFitnessMedicationsSectionHidden:", self->_pregnancySectionHidden, self->_cardioFitnessMedicationsSectionHidden);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orderedSectionIdentifiers = self->_orderedSectionIdentifiers;
  self->_orderedSectionIdentifiers = v4;

  +[ProfileCharacteristicsViewController orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:pregnancySectionHidden:cardioFitnessMedicationsSectionHidden:](ProfileCharacteristicsViewController, "orderedRowIdentifiersBySectionIdentifierWithNameRowsHidden:pregnancySectionHidden:cardioFitnessMedicationsSectionHidden:", self->_nameRowsHidden, self->_pregnancySectionHidden, self->_cardioFitnessMedicationsSectionHidden);
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  orderedRowIdentifiersBySectionIdentifier = self->_orderedRowIdentifiersBySectionIdentifier;
  self->_orderedRowIdentifiersBySectionIdentifier = v6;

  -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendSectionsWithIdentifiers:", self->_orderedSectionIdentifiers);

  -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_orderedRowIdentifiersBySectionIdentifier, "objectForKey:", &unk_1E55CCFC8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, &unk_1E55CCFC8);

  -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_orderedRowIdentifiersBySectionIdentifier, "objectForKey:", &unk_1E55CCFE0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, &unk_1E55CCFE0);

  if (!self->_pregnancySectionHidden)
  {
    -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E55CD5C8, &unk_1E55CCFF8);

  }
  if (!self->_cardioFitnessMedicationsSectionHidden)
  {
    -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E55CD5E0, &unk_1E55CD010);

  }
}

- (id)_titleForFooterInTableViewSection:(int64_t)a3 sectionIdentifier:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;

  v5 = a4;
  if ((objc_msgSend(v5, "isEqual:", &unk_1E55CCFC8) & 1) != 0)
  {
    v6 = &stru_1E55A2388;
  }
  else if (objc_msgSend(v5, "isEqual:", &unk_1E55CCFE0))
  {
    -[ProfileCharacteristicsViewController _wheelchairFooterTitle](self, "_wheelchairFooterTitle");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "isEqual:", &unk_1E55CD010))
  {
    WDBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_RELATED_MEDICATIONS_FOOTER_TEXT"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a4)
  {
    v6 = 0;
  }
  else
  {
    -[ProfileCharacteristicsViewController _generalInfoFooterView](self, "_generalInfoFooterView", a3, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_wheelchairFooterTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 3)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("WHEELCHAIR_USE_COREMOTION_TEXT_TINKER_%@"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable-Tinker"));
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, self->_firstName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "modelSpecificLocalizedStringKeyForKey:", CFSTR("WHEELCHAIR_USE_COREMOTION_TEXT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v9, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_generalInfoFooterView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 3)
  {
    WDBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("EDIT_HEALTH_DETAILS_FOOTER_TEXT_%@"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable-Tinker"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, self->_firstName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D2F710]);
    objc_msgSend(MEMORY[0x1E0D2F710], "defaultReuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithReuseIdentifier:markdown:", v9, v7);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ProfileCharacteristicsViewController;
  -[ProfileCharacteristicsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[ProfileCharacteristicsViewController _fetchDataFromHealthStore](self, "_fetchDataFromHealthStore");
  -[ProfileCharacteristicsViewController _updatePickersWithDisplayValues](self, "_updatePickersWithDisplayValues");
}

- (void)_localeDidChange:(id)a3
{
  void *v4;
  id v5;

  -[ProfileCharacteristicsViewController _updatePickersWithDisplayValues](self, "_updatePickersWithDisplayValues", a3);
  -[ProfileCharacteristicsViewController dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applySnapshot:animatingDifferences:", v4, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[WDProfileTableViewCell removeClearButtonTarget:action:](self->_birthdateCell, "removeClearButtonTarget:action:", self, sel_didClearBirthdate);
  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_pregnancyModelQuery);
  v4.receiver = self;
  v4.super_class = (Class)ProfileCharacteristicsViewController;
  -[ProfileCharacteristicsViewController dealloc](&v4, sel_dealloc);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD block[5];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ProfileCharacteristicsViewController;
  -[ProfileCharacteristicsViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[ProfileCharacteristicsViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__ProfileCharacteristicsViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E5575398;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

uint64_t __65__ProfileCharacteristicsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__ProfileCharacteristicsViewController_traitCollectionDidChange___block_invoke_2;
  v2[3] = &unk_1E5575398;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

void __65__ProfileCharacteristicsViewController_traitCollectionDidChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1304), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "_adjustHeaderFrame");
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applySnapshot:animatingDifferences:", v2, 0);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  uint64_t v29;
  __CFString *v30;
  HKHealthStore *healthStore;
  int64_t biologicalSexDisplayValue;
  int v33;
  id v34;
  os_log_t *v35;
  HKHealthStore *v36;
  HKBiologicalSexObject *v37;
  id v38;
  HKBiologicalSexObject *biologicalSexObject;
  HKHealthStore *v40;
  int64_t bloodTypeDisplayValue;
  int v42;
  id v43;
  HKHealthStore *v44;
  HKBloodTypeObject *v45;
  id v46;
  HKBloodTypeObject *bloodTypeObject;
  HKBirthdateChangeManager *birthdateChangeManager;
  NSDateComponents *birthdateDisplayValue;
  void *v50;
  id v51;
  int64_t v52;
  HKHealthStore *v53;
  char v54;
  id v55;
  int64_t v56;
  HKHealthStore *v57;
  char v58;
  id v59;
  HKHealthStore *v60;
  unint64_t currentCardioFitnessMedicationsUse;
  char v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int v66;
  _BOOL8 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[5];
  __CFString *v82;
  __CFString *v83;
  objc_super v84;

  v4 = a4;
  v5 = a3;
  v84.receiver = self;
  v84.super_class = (Class)ProfileCharacteristicsViewController;
  -[ProfileCharacteristicsViewController setEditing:animated:](&v84, sel_setEditing_animated_);
  if (v5)
  {
    self->_isCancelling = 0;
    -[ProfileCharacteristicsViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
    -[ProfileCharacteristicsViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:animated:", self->_cancelButtonItem, v4);

    if (!self->_cardioFitnessMedicationsSectionHidden)
    {
      -[ProfileCharacteristicsViewController dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "applySnapshot:animatingDifferences:", v9, 0);

      -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", &unk_1E55CD5F8, &unk_1E55CD010);

      -[ProfileCharacteristicsViewController dataSource](self, "dataSource");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "applySnapshot:animatingDifferences:", v12, 1);
LABEL_43:

    }
  }
  else
  {
    if (!self->_cardioFitnessMedicationsSectionHidden)
    {
      -[ProfileCharacteristicsViewController dataSource](self, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applySnapshot:animatingDifferences:", v14, 0);

      -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "deleteItemsWithIdentifiers:", &unk_1E55CD610);

      -[ProfileCharacteristicsViewController dataSource](self, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applySnapshot:animatingDifferences:", v17, 1);

    }
    -[ProfileCharacteristicsViewController setModalInPresentation:](self, "setModalInPresentation:", 0);
    objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removeAutocorrection");

    -[ProfileCharacteristicsViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "endEditing:", 1);

    -[ProfileCharacteristicsViewController _resetSelectedCell](self, "_resetSelectedCell");
    -[ProfileCharacteristicsViewController navigationItem](self, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLeftBarButtonItem:animated:", self->_customLeftBarButtonItem, v4);

    if (!self->_isCancelling)
    {
      -[WDProfileEditableTableViewCell displayValue](self->_firstNameCell, "displayValue");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v21)
        v23 = (__CFString *)v21;
      else
        v23 = &stru_1E55A2388;
      v24 = v23;

      -[WDProfileEditableTableViewCell displayValue](self->_lastNameCell, "displayValue");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v25)
        v27 = (__CFString *)v25;
      else
        v27 = &stru_1E55A2388;
      v28 = v27;

      v29 = MEMORY[0x1E0C809B0];
      v81[0] = MEMORY[0x1E0C809B0];
      v81[1] = 3221225472;
      v81[2] = __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke;
      v81[3] = &unk_1E55755B8;
      v81[4] = self;
      v12 = v24;
      v82 = v12;
      v30 = v28;
      v83 = v30;
      -[ProfileCharacteristicsViewController _updateFirstName:lastName:completion:](self, "_updateFirstName:lastName:completion:", v12, v30, v81);
      healthStore = self->_healthStore;
      biologicalSexDisplayValue = self->_biologicalSexDisplayValue;
      v80 = 0;
      v33 = -[HKHealthStore _setBiologicalSex:error:](healthStore, "_setBiologicalSex:error:", biologicalSexDisplayValue, &v80);
      v34 = v80;
      v35 = (os_log_t *)MEMORY[0x1E0CB5378];
      if (v33)
      {
        v36 = self->_healthStore;
        v79 = v34;
        -[HKHealthStore biologicalSexWithError:](v36, "biologicalSexWithError:", &v79);
        v37 = (HKBiologicalSexObject *)objc_claimAutoreleasedReturnValue();
        v38 = v79;

        biologicalSexObject = self->_biologicalSexObject;
        self->_biologicalSexObject = v37;

        v34 = v38;
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_ERROR))
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.6();
        self->_biologicalSexDisplayValue = -[HKBiologicalSexObject biologicalSex](self->_biologicalSexObject, "biologicalSex");
      }
      v40 = self->_healthStore;
      bloodTypeDisplayValue = self->_bloodTypeDisplayValue;
      v78 = v34;
      v42 = -[HKHealthStore _setBloodType:error:](v40, "_setBloodType:error:", bloodTypeDisplayValue, &v78);
      v43 = v78;

      if (v42)
      {
        v44 = self->_healthStore;
        v77 = v43;
        -[HKHealthStore bloodTypeWithError:](v44, "bloodTypeWithError:", &v77);
        v45 = (HKBloodTypeObject *)objc_claimAutoreleasedReturnValue();
        v46 = v77;

        bloodTypeObject = self->_bloodTypeObject;
        self->_bloodTypeObject = v45;

        v43 = v46;
      }
      else
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_ERROR))
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.5();
        self->_bloodTypeDisplayValue = -[HKBloodTypeObject bloodType](self->_bloodTypeObject, "bloodType");
      }
      birthdateChangeManager = self->_birthdateChangeManager;
      birthdateDisplayValue = self->_birthdateDisplayValue;
      v76 = v43;
      -[HKBirthdateChangeManager setBirthdate:withError:](birthdateChangeManager, "setBirthdate:withError:", birthdateDisplayValue, &v76);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v76;

      if ((objc_msgSend(v50, "success") & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_ERROR))
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.4();
        objc_storeStrong((id *)&self->_birthdateDisplayValue, self->_birthdate);
      }
      v52 = -[UIPickerView selectedRowInComponent:](self->_fitzpatrickSkinTypePicker, "selectedRowInComponent:", 0);
      self->_fitzpatrickSkinTypeDisplayValue = v52;
      v53 = self->_healthStore;
      v75 = v51;
      v54 = -[HKHealthStore _setFitzpatrickSkinType:error:](v53, "_setFitzpatrickSkinType:error:", v52, &v75);
      v55 = v75;

      if ((v54 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_ERROR))
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.3();
      }
      v56 = -[UIPickerView selectedRowInComponent:](self->_wheelchairUsePicker, "selectedRowInComponent:", 0);
      self->_wheelchairUseDisplayValue = v56;
      v57 = self->_healthStore;
      v74 = v55;
      v58 = -[HKHealthStore _setWheelchairUse:error:](v57, "_setWheelchairUse:error:", v56, &v74);
      v59 = v74;

      if ((v58 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_ERROR))
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.2();
      }
      v60 = self->_healthStore;
      currentCardioFitnessMedicationsUse = self->_currentCardioFitnessMedicationsUse;
      v73 = v59;
      v62 = -[HKHealthStore _setCardioFitnessMedicationsUse:error:](v60, "_setCardioFitnessMedicationsUse:error:", currentCardioFitnessMedicationsUse, &v73);
      v11 = v73;

      if ((v62 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(*v35, OS_LOG_TYPE_ERROR))
          -[ProfileCharacteristicsViewController setEditing:animated:].cold.1();
      }
      if (objc_msgSend(v50, "shouldShowWarning"))
      {
        -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "type");

        if (v64 != 3)
        {
          objc_msgSend(MEMORY[0x1E0CB6760], "shared");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "isHealthChecklistAvailable");

          if (v66 && -[ProfileCharacteristicsViewController accessType](self, "accessType") != 3)
          {
            v67 = -[ProfileCharacteristicsViewController accessType](self, "accessType") != 5;
            objc_msgSend(MEMORY[0x1E0D2F5D8], "showDisabledWarningWithHealthChecklistWithAge:presentingViewController:openHealthChecklistInContext:", objc_msgSend(v50, "newAge"), self, v67);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D2F5D8], "showDisabledWarningWithAge:presentingViewController:", objc_msgSend(v50, "newAge"), self);
          }
        }
      }
      v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
      v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6430]), "initWithChangesSyncRequest:", v68);
      v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB63F0]), "initWithHealthStore:", self->_healthStore);
      v72[0] = v29;
      v72[1] = 3221225472;
      v72[2] = __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_312;
      v72[3] = &unk_1E5575760;
      v72[4] = self;
      objc_msgSend(v70, "syncWithRequest:reason:completion:", v69, CFSTR("Health Details Updated"), v72);

      goto LABEL_43;
    }
  }
  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "reloadData");

}

void __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_2;
  block[3] = &unk_1E5575590;
  v12 = a2;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  v7 = v5;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "didUpdateName");

}

void __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  if (*(_BYTE *)(a1 + 64))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1096), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1104), *(id *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetFirstAndLastNameValues");
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_2_cold_1((_QWORD *)a1, v2);
  }
}

void __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_312(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("Did not");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("Did");
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1A95F5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ request fast push sync successfully. Error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

}

- (void)_updateFirstName:(id)a3 lastName:(id)a4 completion:(id)a5
{
  HKHealthStore *healthStore;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  healthStore = self->_healthStore;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[HKHealthStore profileIdentifier](healthStore, "profileIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 == 1)
  {
    v14 = *MEMORY[0x1E0CB7810];
    v17[0] = *MEMORY[0x1E0CB7808];
    v17[1] = v14;
    v18[0] = v11;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDUserDefaults setValue:forKey:completion:](self->_userDefaults, "setValue:forKey:completion:", v15, *MEMORY[0x1E0CB7820], v9);

  }
  else
  {
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6A18]), "initWithHealthStore:", self->_healthStore);
    objc_msgSend(v16, "setDisplayFirstName:lastName:completion:", v11, v10, v9);

  }
}

- (void)_resetFirstAndLastNameValues
{
  -[WDProfileEditableTableViewCell setDisplayValue:](self->_firstNameCell, "setDisplayValue:", self->_firstName);
  -[WDProfileEditableTableViewCell setDisplayValue:](self->_lastNameCell, "setDisplayValue:", self->_lastName);
  -[WDProfileHeaderView setFirstName:lastName:](self->_headerView, "setFirstName:lastName:", self->_firstName, self->_lastName);
}

- (id)getCellForIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  WDProfileTableViewCell *birthdateCell;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  UITableViewCell *v11;
  void *v12;
  void *v13;

  switch(-[ProfileCharacteristicsViewController _profileRowIdentifierForSection:](self, "_profileRowIdentifierForSection:", a3))
  {
    case 0:
      v4 = 1200;
      goto LABEL_15;
    case 1:
      v4 = 1208;
      goto LABEL_15;
    case 2:
      v5 = 1216;
      birthdateCell = self->_birthdateCell;
      -[ProfileCharacteristicsViewController _displayStringForBirthDate:](self, "_displayStringForBirthDate:", self->_birthdateDisplayValue);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      v5 = 1224;
      birthdateCell = self->_biologicalSexCell;
      -[ProfileCharacteristicsViewController _displayStringForBiologicalSex:](self, "_displayStringForBiologicalSex:", self->_biologicalSexDisplayValue);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      v5 = 1232;
      birthdateCell = self->_bloodTypeCell;
      -[ProfileCharacteristicsViewController _displayStringForBloodType:](self, "_displayStringForBloodType:", self->_bloodTypeDisplayValue);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      v5 = 1240;
      birthdateCell = self->_fitzpatrickSkinTypeCell;
      -[ProfileCharacteristicsViewController _displayStringForFitzpatrickSkinType:](self, "_displayStringForFitzpatrickSkinType:", self->_fitzpatrickSkinTypeDisplayValue);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      v5 = 1256;
      birthdateCell = self->_wheelchairUseCell;
      -[ProfileCharacteristicsViewController _displayStringForWheelchairUse:](self, "_displayStringForWheelchairUse:", self->_wheelchairUseDisplayValue);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v8 = (void *)v7;
      -[WDProfileTableViewCell setDisplayValue:](birthdateCell, "setDisplayValue:", v7);

      v9 = *(Class *)((char *)&self->super.super.super.super.isa + v5);
      goto LABEL_16;
    case 7:
      -[ProfileCharacteristicsViewController _setPregnancyCellDisplayValueForState:](self, "_setPregnancyCellDisplayValueForState:", self->_isPregnant);
      v4 = 1288;
      goto LABEL_15;
    case 8:
      -[ProfileCharacteristicsViewController displayNumberOfActiveCardioFitnessMedications:](self, "displayNumberOfActiveCardioFitnessMedications:", self->_activeCardioFitnessMedications);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell _setBadgeText:](self->_cardioFitnessMedicationsCell, "_setBadgeText:", v10);

      v11 = self->_cardioFitnessMedicationsCell;
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell _setBadgeFont:](v11, "_setBadgeFont:", v12);

      if ((-[ProfileCharacteristicsViewController isEditing](self, "isEditing") & 1) != 0)
        HKHealthKeyColor();
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITableViewCell _setBadgeColor:](v11, "_setBadgeColor:", v13);

      if (!v11)
        goto LABEL_21;
      goto LABEL_17;
    case 9:
      v4 = 1280;
      goto LABEL_15;
    case 10:
      v4 = 1272;
LABEL_15:
      v9 = *(Class *)((char *)&self->super.super.super.super.isa + v4);
LABEL_16:
      v11 = v9;
      if (!v11)
        goto LABEL_21;
LABEL_17:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v11;
        -[UITableViewCell setShouldUseSelectedColorForDisplayValue:](v11, "setShouldUseSelectedColorForDisplayValue:", -[ProfileCharacteristicsViewController isEditing](self, "isEditing"));

      }
      break;
    default:
LABEL_21:
      HKErrorTableViewCell();
      v11 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v11;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  char v7;
  int64_t v8;
  WDProfileTableViewCell *v9;
  _QWORD *v10;
  UITableViewCell *v11;
  WDProfileTableViewCell *selectedCell;
  NSDateComponents *v13;
  NSDateComponents *birthdateDisplayValue;
  ProfileCharacteristicsViewController *v15;
  WDProfileTableViewCell *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  ProfileCharacteristicTypePermissionsViewController *v21;
  void *v22;
  uint64_t v23;
  id v24;

  v24 = a3;
  v6 = a4;
  objc_msgSend(v24, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = -[ProfileCharacteristicsViewController isEditing](self, "isEditing");
  v8 = -[ProfileCharacteristicsViewController _profileRowIdentifierForSection:](self, "_profileRowIdentifierForSection:", v6);
  if ((v7 & 1) == 0)
  {
    switch(v8)
    {
      case 2:
        -[WDProfileTableViewCell displayName](self->_birthdateCell, "displayName");
        v9 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
        v10 = (_QWORD *)MEMORY[0x1E0CB49D0];
        goto LABEL_23;
      case 3:
        -[WDProfileTableViewCell displayName](self->_biologicalSexCell, "displayName");
        v9 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
        v10 = (_QWORD *)MEMORY[0x1E0CB49C0];
        goto LABEL_23;
      case 4:
        -[WDProfileTableViewCell displayName](self->_bloodTypeCell, "displayName");
        v9 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
        v10 = (_QWORD *)MEMORY[0x1E0CB49C8];
        goto LABEL_23;
      case 5:
        -[WDProfileTableViewCell displayName](self->_fitzpatrickSkinTypeCell, "displayName");
        v9 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
        v10 = (_QWORD *)MEMORY[0x1E0CB49D8];
        goto LABEL_23;
      case 6:
        -[WDProfileTableViewCell displayName](self->_wheelchairUseCell, "displayName");
        v9 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
        v10 = (_QWORD *)MEMORY[0x1E0CB49E0];
        goto LABEL_23;
      case 7:
        goto LABEL_3;
      case 8:
        -[UITableViewCell textLabel](self->_cardioFitnessMedicationsCell, "textLabel");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "text");
        v9 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();

        v10 = (_QWORD *)MEMORY[0x1E0CB7120];
LABEL_23:
        objc_msgSend(MEMORY[0x1E0CB6978], "characteristicTypeForIdentifier:", *v10);
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
          goto LABEL_29;
        v20 = (void *)v19;
        v21 = -[ProfileCharacteristicTypePermissionsViewController initWithHealthStore:characteristicType:firstName:]([ProfileCharacteristicTypePermissionsViewController alloc], "initWithHealthStore:characteristicType:firstName:", self->_healthStore, v19, self->_firstName);
        -[ProfileCharacteristicTypePermissionsViewController setTitle:](v21, "setTitle:", v9);
        -[ProfileCharacteristicsViewController navigationController](self, "navigationController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "pushViewController:animated:", v21, 1);

        break;
      case 9:
        v23 = 1280;
        goto LABEL_27;
      case 10:
        v23 = 1272;
LABEL_27:
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v23), "textLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "text");
        v9 = (WDProfileTableViewCell *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v9 = 0;
        goto LABEL_29;
    }

    goto LABEL_29;
  }
  if (v8 != 7)
  {
    objc_msgSend(v24, "cellForRowAtIndexPath:", v6);
    v11 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
    v9 = (WDProfileTableViewCell *)v11;
    if (v11 == self->_betaBlockerUseCell)
    {
      v15 = self;
      v16 = v9;
      v17 = 2;
    }
    else
    {
      if (v11 != self->_calciumChannelBlockerUseCell)
      {
        selectedCell = self->_selectedCell;
        -[ProfileCharacteristicsViewController _resetSelectedCell](self, "_resetSelectedCell");
        if (v9 != selectedCell)
        {
          objc_storeStrong((id *)&self->_selectedCell, v9);
          if (v9 == self->_birthdateCell)
          {
            if (!self->_birthdateDisplayValue)
            {
              -[ProfileCharacteristicsViewController _initialBirthdayValue](self, "_initialBirthdayValue");
              v13 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
              birthdateDisplayValue = self->_birthdateDisplayValue;
              self->_birthdateDisplayValue = v13;

              -[ProfileCharacteristicsViewController _updatePickersWithDisplayValues](self, "_updatePickersWithDisplayValues");
              -[ProfileCharacteristicsViewController _updateCellsWithDisplayValues](self, "_updateCellsWithDisplayValues");
            }
            -[WDProfileTableViewCell setShouldDisplayClearButtonDuringEditing:](v9, "setShouldDisplayClearButtonDuringEditing:", 1);
          }
          -[WDProfileTableViewCell becomeFirstResponder](v9, "becomeFirstResponder");
        }
        goto LABEL_29;
      }
      v15 = self;
      v16 = v9;
      v17 = 1;
    }
    -[ProfileCharacteristicsViewController updateCheckMarksForCell:option:](v15, "updateCheckMarksForCell:option:", v16, v17);
LABEL_29:

    goto LABEL_30;
  }
LABEL_3:
  -[ProfileCharacteristicsViewController didTapPregnancy](self, "didTapPregnancy");
LABEL_30:

}

- (void)updateCheckMarksForCell:(id)a3 option:(unint64_t)a4
{
  unint64_t v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v6 = self->_currentCardioFitnessMedicationsUse & a4;
  v7 = a3;
  if (v6)
  {
    -[ProfileCharacteristicsViewController _circleImageView](self, "_circleImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditingAccessoryView:", v8);

    self->_currentCardioFitnessMedicationsUse &= ~a4;
    v9 = self->_activeCardioFitnessMedications - 1;
  }
  else
  {
    -[ProfileCharacteristicsViewController _checkmarkedCircleImageView](self, "_checkmarkedCircleImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditingAccessoryView:", v10);

    self->_currentCardioFitnessMedicationsUse |= a4;
    v9 = self->_activeCardioFitnessMedications + 1;
  }
  self->_activeCardioFitnessMedications = v9;
  -[ProfileCharacteristicsViewController displayNumberOfActiveCardioFitnessMedications:](self, "displayNumberOfActiveCardioFitnessMedications:");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _setBadgeText:](self->_cardioFitnessMedicationsCell, "_setBadgeText:", v11);

}

- (id)displayNumberOfActiveCardioFitnessMedications:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  if (displayNumberOfActiveCardioFitnessMedications__onceToken != -1)
    dispatch_once(&displayNumberOfActiveCardioFitnessMedications__onceToken, &__block_literal_global_3);
  v4 = (void *)displayNumberOfActiveCardioFitnessMedications__numberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __86__ProfileCharacteristicsViewController_displayNumberOfActiveCardioFitnessMedications___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)displayNumberOfActiveCardioFitnessMedications__numberFormatter;
  displayNumberOfActiveCardioFitnessMedications__numberFormatter = (uint64_t)v0;

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[ProfileCharacteristicsViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "navigationControllerSupportedInterfaceOrientations:", v4);

  return v6;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v5;
  id v6;

  if (a4 == self)
  {
    objc_msgSend(a4, "navigationController", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHidesShadow:", 1);

  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v5;
  id v6;

  if (a4 != self)
  {
    -[ProfileCharacteristicsViewController navigationController](self, "navigationController", a3, a4, a5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setHidesShadow:", 0);

  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  UIPickerView *v5;
  int64_t v6;

  v5 = (UIPickerView *)a3;
  if (self->_biologicalSexPicker == v5)
  {
    v6 = 4;
  }
  else if (self->_bloodTypePicker == v5)
  {
    v6 = 9;
  }
  else if (self->_fitzpatrickSkinTypePicker == v5)
  {
    v6 = 7;
  }
  else if (self->_wheelchairUsePicker == v5)
  {
    v6 = 3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  UIPickerView *v7;
  UIPickerView *v8;
  __CFString *v9;
  uint64_t v10;

  v7 = (UIPickerView *)a3;
  v8 = v7;
  if (self->_biologicalSexPicker == v7)
  {
    -[ProfileCharacteristicsViewController _displayStringForBiologicalSex:](self, "_displayStringForBiologicalSex:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v9 = (__CFString *)v10;
    goto LABEL_11;
  }
  if (self->_bloodTypePicker == v7)
  {
    -[ProfileCharacteristicsViewController _displayStringForBloodType:](self, "_displayStringForBloodType:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (self->_fitzpatrickSkinTypePicker == v7)
  {
    -[ProfileCharacteristicsViewController _displayStringForFitzpatrickSkinType:](self, "_displayStringForFitzpatrickSkinType:", a4);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (self->_wheelchairUsePicker == v7)
  {
    HKWheelchairUseDisplayName();
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v9 = &stru_1E55A2388;
LABEL_11:

  return v9;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  UIPickerView *v7;
  int *v8;
  UIPickerView *v9;

  v7 = (UIPickerView *)a3;
  if (!self->_isCancelling)
  {
    if (self->_biologicalSexPicker == v7)
    {
      v8 = &OBJC_IVAR___ProfileCharacteristicsViewController__biologicalSexDisplayValue;
    }
    else if (self->_bloodTypePicker == v7)
    {
      v8 = &OBJC_IVAR___ProfileCharacteristicsViewController__bloodTypeDisplayValue;
    }
    else if (self->_fitzpatrickSkinTypePicker == v7)
    {
      v8 = &OBJC_IVAR___ProfileCharacteristicsViewController__fitzpatrickSkinTypeDisplayValue;
    }
    else
    {
      if (self->_wheelchairUsePicker != v7)
      {
LABEL_11:
        v9 = v7;
        -[ProfileCharacteristicsViewController _updateCellsWithDisplayValues](self, "_updateCellsWithDisplayValues");
        v7 = v9;
        goto LABEL_12;
      }
      v8 = &OBJC_IVAR___ProfileCharacteristicsViewController__wheelchairUseDisplayValue;
    }
    *(Class *)((char *)&self->super.super.super.super.isa + *v8) = (Class)a4;
    goto LABEL_11;
  }
LABEL_12:

}

- (void)birthdateChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSDateComponents *v7;
  NSDateComponents *birthdateDisplayValue;

  if (!self->_isCancelling)
  {
    v4 = a3;
    -[ProfileCharacteristicsViewController _birthdayCalendar](self, "_birthdayCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v6);
    v7 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
    birthdateDisplayValue = self->_birthdateDisplayValue;
    self->_birthdateDisplayValue = v7;

    -[ProfileCharacteristicsViewController _updateCellsWithDisplayValues](self, "_updateCellsWithDisplayValues");
  }
}

- (void)didClearBirthdate
{
  NSDateComponents *birthdateDisplayValue;

  birthdateDisplayValue = self->_birthdateDisplayValue;
  self->_birthdateDisplayValue = 0;

  -[ProfileCharacteristicsViewController _updateCellsWithDisplayValues](self, "_updateCellsWithDisplayValues");
  -[ProfileCharacteristicsViewController _resetSelectedCell](self, "_resetSelectedCell");
}

- (void)cancelButtonTapped:(id)a3
{
  self->_isCancelling = 1;
  objc_storeStrong((id *)&self->_birthdateDisplayValue, self->_birthdate);
  self->_biologicalSexDisplayValue = -[HKBiologicalSexObject biologicalSex](self->_biologicalSexObject, "biologicalSex");
  self->_bloodTypeDisplayValue = -[HKBloodTypeObject bloodType](self->_bloodTypeObject, "bloodType");
  -[WDProfileEditableTableViewCell setDisplayValue:](self->_firstNameCell, "setDisplayValue:", self->_firstName);
  -[WDProfileEditableTableViewCell setDisplayValue:](self->_lastNameCell, "setDisplayValue:", self->_lastName);
  -[ProfileCharacteristicsViewController setCardioFitnessMedicationCheckmarks](self, "setCardioFitnessMedicationCheckmarks");
  -[ProfileCharacteristicsViewController _updatePickersWithDisplayValues](self, "_updatePickersWithDisplayValues");
  -[ProfileCharacteristicsViewController _updateCellsWithDisplayValues](self, "_updateCellsWithDisplayValues");
  -[ProfileCharacteristicsViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
}

- (void)dismissButtonTapped:(id)a3
{
  -[ProfileCharacteristicsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)didUpdateName
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0CB7818], 0);

}

- (void)didTapPregnancy
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("x-apple-health://MenstrualCyclesAppPlugin.healthplugin/openPregnancyOnboarding"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, MEMORY[0x1E0C9AA70]);

}

- (void)_fetchDataFromHealthStore
{
  HKHealthStore *healthStore;
  _QWORD v3[5];

  healthStore = self->_healthStore;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__ProfileCharacteristicsViewController__fetchDataFromHealthStore__block_invoke;
  v3[3] = &unk_1E55758B8;
  v3[4] = self;
  -[HKHealthStore hk_fetchExistingDemographicInformationWithOptions:completion:](healthStore, "hk_fetchExistingDemographicInformationWithOptions:completion:", 1, v3);
}

void __65__ProfileCharacteristicsViewController__fetchDataFromHealthStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = a2;
  if (v3)
  {
    v30 = v3;
    objc_msgSend(v3, "firstName");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1096);
    *(_QWORD *)(v5 + 1096) = v4;

    objc_msgSend(v30, "lastName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1104);
    *(_QWORD *)(v8 + 1104) = v7;

    objc_msgSend(v30, "dateOfBirthComponents");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 1112);
    *(_QWORD *)(v11 + 1112) = v10;

    objc_msgSend(v30, "dateOfBirthComponents");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 1120);
    *(_QWORD *)(v14 + 1120) = v13;

    objc_msgSend(v30, "biologicalSexObject");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 1056);
    *(_QWORD *)(v17 + 1056) = v16;

    objc_msgSend(v30, "biologicalSexObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v30, "biologicalSexObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064) = objc_msgSend(v20, "biologicalSex");

    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064) = 0;
    }

    objc_msgSend(v30, "bloodTypeObject");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 1040);
    *(_QWORD *)(v22 + 1040) = v21;

    objc_msgSend(v30, "bloodTypeObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v30, "bloodTypeObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) = objc_msgSend(v25, "bloodType");

    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048) = 0;
    }

    objc_msgSend(v30, "fitzpatrickSkinTypeObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v30, "fitzpatrickSkinTypeObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072) = objc_msgSend(v27, "skinType");

    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072) = 0;
    }

    objc_msgSend(v30, "wheelchairUseObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v30, "wheelchairUseObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080) = objc_msgSend(v29, "wheelchairUse");

    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080) = 0;
    }

    objc_msgSend(*(id *)(a1 + 32), "setCardioFitnessMedicationCheckmarks");
    objc_msgSend(*(id *)(a1 + 32), "_updateFirstAndLastNameCellsWithDisplayValues");
    objc_msgSend(*(id *)(a1 + 32), "_updatePickersWithDisplayValues");
    objc_msgSend(*(id *)(a1 + 32), "_updateCellsWithDisplayValues");
    objc_msgSend(*(id *)(a1 + 32), "_enableEditing");
    objc_msgSend(*(id *)(a1 + 32), "_updateFooters");
    v3 = v30;
  }

}

- (void)_startPregnancyModelQuery
{
  id v3;
  HKMCPregnancyStateQuery *v4;
  HKMCPregnancyStateQuery *pregnancyModelQuery;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, void *, void *);
  void *v13;
  id v14;
  id location;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0CB6820]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __65__ProfileCharacteristicsViewController__startPregnancyModelQuery__block_invoke;
  v13 = &unk_1E55758E0;
  objc_copyWeak(&v14, &location);
  v4 = (HKMCPregnancyStateQuery *)objc_msgSend(v3, "initWithUpdateHandler:", &v10);
  pregnancyModelQuery = self->_pregnancyModelQuery;
  self->_pregnancyModelQuery = v4;

  -[ProfileCharacteristicsViewController description](self, "description", v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMCPregnancyStateQuery setDebugIdentifier:](self->_pregnancyModelQuery, "setDebugIdentifier:", v6);

  _HKInitializeLogging();
  v7 = (id)*MEMORY[0x1E0CB5310];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (id)objc_opt_class();
    -[HKMCPregnancyStateQuery debugDescription](self->_pregnancyModelQuery, "debugDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    _os_log_impl(&dword_1A95F5000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting pregnancy model query %{public}@", buf, 0x16u);

  }
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_pregnancyModelQuery);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __65__ProfileCharacteristicsViewController__startPregnancyModelQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handlePregnancyModelQueryResult:error:", v7, v6);

}

- (void)_handlePregnancyModelQueryResult:(id)a3 error:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  _QWORD block[5];

  v6 = a4;
  if (a3)
  {
    v7 = objc_msgSend(a3, "state");
    if (v7 <= 2)
      self->_isPregnant = 0x100u >> (8 * v7);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__ProfileCharacteristicsViewController__handlePregnancyModelQueryResult_error___block_invoke;
    block[3] = &unk_1E5575398;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5310];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5310], OS_LOG_TYPE_ERROR))
      -[ProfileCharacteristicsViewController _handlePregnancyModelQueryResult:error:].cold.1(v8, self, (uint64_t)v6);
  }

}

uint64_t __79__ProfileCharacteristicsViewController__handlePregnancyModelQueryResult_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCellsWithDisplayValues");
}

- (void)_updateFooters
{
  void *v3;
  uint64_t v4;
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

  -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  if (v4 == 3)
  {
    -[ProfileCharacteristicsViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "footerViewForSection:", 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    WDBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EDIT_HEALTH_DETAILS_FOOTER_TEXT_%@"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable-Tinker"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v7, self->_firstName);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateWithMarkdown:", v8);
    -[ProfileCharacteristicsViewController _wheelchairFooterTitle](self, "_wheelchairFooterTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProfileCharacteristicsViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "footerViewForSection:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v9);

    -[ProfileCharacteristicsViewController dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProfileCharacteristicsViewController currentSnapshot](self, "currentSnapshot");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applySnapshot:animatingDifferences:", v14, 0);

  }
}

- (void)_updateFirstAndLastNameCellsWithDisplayValues
{
  _QWORD v3[5];

  -[WDProfileEditableTableViewCell setDisplayValue:](self->_firstNameCell, "setDisplayValue:", self->_firstName);
  -[WDProfileEditableTableViewCell setDisplayValue:](self->_lastNameCell, "setDisplayValue:", self->_lastName);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__ProfileCharacteristicsViewController__updateFirstAndLastNameCellsWithDisplayValues__block_invoke;
  v3[3] = &unk_1E5575398;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
}

void __85__ProfileCharacteristicsViewController__updateFirstAndLastNameCellsWithDisplayValues__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setFirstName:lastName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1104));
  objc_msgSend(*(id *)(a1 + 32), "_adjustHeaderFrame");
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applySnapshot:animatingDifferences:", v2, 0);

}

- (void)_enableEditing
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[HKHealthStore profileIdentifier](self->_healthStore, "profileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 3)
  {
    v4 = -[ProfileCharacteristicsViewController isEditing](self, "isEditing");

    if ((v4 & 1) == 0)
      goto LABEL_6;
  }
  else
  {

  }
  -[ProfileCharacteristicsViewController editButtonItem](self, "editButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProfileCharacteristicsViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

LABEL_6:
  v7 = objc_msgSend(MEMORY[0x1E0CB6F18], "isRunningStoreDemoMode") ^ 1;
  -[ProfileCharacteristicsViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

}

- (void)_createHeader
{
  id v3;
  WDProfileHeaderView *v4;
  WDProfileHeaderView *headerView;
  WDProfileHeaderView *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0D2F2D8]);
  v4 = (WDProfileHeaderView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  headerView = self->_headerView;
  self->_headerView = v4;

  -[WDProfileHeaderView setNameHidden:](self->_headerView, "setNameHidden:", 1);
  -[ProfileCharacteristicsViewController setAvatarImage:](self, "setAvatarImage:", self->_avatarImage);
  -[ProfileCharacteristicsViewController _adjustHeaderFrame](self, "_adjustHeaderFrame");
  v6 = self->_headerView;
  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTableHeaderView:", v6);

}

- (BOOL)shouldShowNameInHeaderView
{
  return !self->_nameRowsHidden;
}

- (void)_adjustHeaderFrame
{
  WDProfileHeaderView *headerView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;

  headerView = self->_headerView;
  -[ProfileCharacteristicsViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  -[WDProfileHeaderView sizeThatFits:](headerView, "sizeThatFits:", CGRectGetWidth(v9), 1.79769313e308);
  v6 = v5;
  v8 = v7;

  -[WDProfileHeaderView setFrame:](self->_headerView, "setFrame:", 0.0, 0.0, v6, v8);
}

- (void)_createBarButtonItems
{
  id v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *cancelButtonItem;
  id v7;

  v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
  WDBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (UIBarButtonItem *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel_cancelButtonTapped_);
  cancelButtonItem = self->_cancelButtonItem;
  self->_cancelButtonItem = v5;

}

- (void)_createPickers
{
  UIPickerView *v3;
  UIPickerView *bloodTypePicker;
  UIPickerView *v5;
  UIPickerView *biologicalSexPicker;
  UIDatePicker *v7;
  UIDatePicker *birthdatePicker;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIPickerView *v13;
  UIPickerView *fitzpatrickSkinTypePicker;
  UIPickerView *v15;
  UIPickerView *wheelchairUsePicker;

  v3 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
  bloodTypePicker = self->_bloodTypePicker;
  self->_bloodTypePicker = v3;

  -[UIPickerView setDataSource:](self->_bloodTypePicker, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_bloodTypePicker, "setDelegate:", self);
  v5 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
  biologicalSexPicker = self->_biologicalSexPicker;
  self->_biologicalSexPicker = v5;

  -[UIPickerView setDataSource:](self->_biologicalSexPicker, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_biologicalSexPicker, "setDelegate:", self);
  v7 = (UIDatePicker *)objc_alloc_init(MEMORY[0x1E0DC36F0]);
  birthdatePicker = self->_birthdatePicker;
  self->_birthdatePicker = v7;

  -[UIDatePicker setPreferredDatePickerStyle:](self->_birthdatePicker, "setPreferredDatePickerStyle:", 1);
  -[UIDatePicker setDatePickerMode:](self->_birthdatePicker, "setDatePickerMode:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setMaximumDate:](self->_birthdatePicker, "setMaximumDate:", v9);

  v10 = (void *)MEMORY[0x1E0C99D68];
  -[ProfileCharacteristicsViewController _birthdayCalendar](self, "_birthdayCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_minimumDateForBirthDateWithCalendar:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setMinimumDate:](self->_birthdatePicker, "setMinimumDate:", v12);

  -[UIDatePicker addTarget:action:forControlEvents:](self->_birthdatePicker, "addTarget:action:forControlEvents:", self, sel_birthdateChanged_, 4096);
  v13 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
  fitzpatrickSkinTypePicker = self->_fitzpatrickSkinTypePicker;
  self->_fitzpatrickSkinTypePicker = v13;

  -[UIPickerView setDataSource:](self->_fitzpatrickSkinTypePicker, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_fitzpatrickSkinTypePicker, "setDelegate:", self);
  v15 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
  wheelchairUsePicker = self->_wheelchairUsePicker;
  self->_wheelchairUsePicker = v15;

  -[UIPickerView setDataSource:](self->_wheelchairUsePicker, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_wheelchairUsePicker, "setDelegate:", self);
}

- (void)_createCells
{
  WDProfileEditableTableViewCell *v3;
  WDProfileEditableTableViewCell *firstNameCell;
  void *v5;
  void *v6;
  WDProfileEditableTableViewCell *v7;
  void *v8;
  void *v9;
  WDProfileEditableTableViewCell *v10;
  WDProfileEditableTableViewCell *lastNameCell;
  void *v12;
  void *v13;
  WDProfileEditableTableViewCell *v14;
  void *v15;
  void *v16;
  WDProfileTableViewCell *v17;
  WDProfileTableViewCell *birthdateCell;
  void *v19;
  void *v20;
  void *v21;
  WDProfileTableViewCell *v22;
  void *v23;
  void *v24;
  WDProfileTableViewCell *v25;
  WDProfileTableViewCell *biologicalSexCell;
  void *v27;
  void *v28;
  void *v29;
  WDProfileTableViewCell *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  WDProfileTableViewCell *v34;
  WDProfileTableViewCell *bloodTypeCell;
  void *v36;
  void *v37;
  void *v38;
  WDProfileTableViewCell *v39;
  void *v40;
  void *v41;
  WDProfileTableViewCell *v42;
  WDProfileTableViewCell *fitzpatrickSkinTypeCell;
  void *v44;
  void *v45;
  void *v46;
  WDProfileTableViewCell *v47;
  void *v48;
  void *v49;
  WDProfileTableViewCell *v50;
  WDProfileTableViewCell *wheelchairUseCell;
  void *v52;
  void *v53;
  WDProfileTableViewCell *v54;
  void *v55;
  void *v56;
  UITableViewCell *v57;
  UITableViewCell *pregnancyCell;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  UITableViewCell *v71;
  UITableViewCell *cardioFitnessMedicationsCell;
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
  UITableViewCell *v86;
  UITableViewCell *calciumChannelBlockerUseCell;
  UITableViewCell *v88;
  UITableViewCell *betaBlockerUseCell;
  void *v90;
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[3];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[4];

  v96[3] = *MEMORY[0x1E0C80C00];
  v3 = (WDProfileEditableTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2D0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDProfileEditableTableViewCell"));
  firstNameCell = self->_firstNameCell;
  self->_firstNameCell = v3;

  -[WDProfileEditableTableViewCell setAccessoryType:](self->_firstNameCell, "setAccessoryType:", 0);
  -[WDProfileEditableTableViewCell setEditingAccessoryType:](self->_firstNameCell, "setEditingAccessoryType:", 0);
  -[WDProfileEditableTableViewCell setSelectionStyle:](self->_firstNameCell, "setSelectionStyle:", 0);
  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FIRST_NAME_NOT_SET"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileEditableTableViewCell setPlaceholderValue:](self->_firstNameCell, "setPlaceholderValue:", v6);

  v7 = self->_firstNameCell;
  WDBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FIRST_NAME"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileEditableTableViewCell setDisplayName:](v7, "setDisplayName:", v9);

  -[WDProfileEditableTableViewCell updateAutomationIdentifiersForProfileDetail:](self->_firstNameCell, "updateAutomationIdentifiersForProfileDetail:", CFSTR("FirstName"));
  v10 = (WDProfileEditableTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2D0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDProfileEditableTableViewCell"));
  lastNameCell = self->_lastNameCell;
  self->_lastNameCell = v10;

  -[WDProfileEditableTableViewCell setAccessoryType:](self->_lastNameCell, "setAccessoryType:", 0);
  -[WDProfileEditableTableViewCell setEditingAccessoryType:](self->_lastNameCell, "setEditingAccessoryType:", 0);
  -[WDProfileEditableTableViewCell setSelectionStyle:](self->_lastNameCell, "setSelectionStyle:", 0);
  WDBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LAST_NAME_NOT_SET"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileEditableTableViewCell setPlaceholderValue:](self->_lastNameCell, "setPlaceholderValue:", v13);

  v14 = self->_lastNameCell;
  WDBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LAST_NAME"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileEditableTableViewCell setDisplayName:](v14, "setDisplayName:", v16);

  -[WDProfileEditableTableViewCell updateAutomationIdentifiersForProfileDetail:](self->_lastNameCell, "updateAutomationIdentifiersForProfileDetail:", CFSTR("LastName"));
  v17 = (WDProfileTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2E0]), "initWithStyle:reuseIdentifier:", 0);
  birthdateCell = self->_birthdateCell;
  self->_birthdateCell = v17;

  -[WDProfileTableViewCell setEditingAccessoryType:](self->_birthdateCell, "setEditingAccessoryType:", 0);
  -[WDProfileTableViewCell setSelectionStyle:](self->_birthdateCell, "setSelectionStyle:", 0);
  -[WDProfileTableViewCell setAccessoryType:](self->_birthdateCell, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x1E0D2F760], "viewHostingView:", self->_birthdatePicker);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setInputView:](self->_birthdateCell, "setInputView:", v19);

  WDBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("BIRTHDATE_NOT_SET"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setPlaceholderValue:](self->_birthdateCell, "setPlaceholderValue:", v21);

  -[WDProfileTableViewCell addClearButtonTarget:action:](self->_birthdateCell, "addClearButtonTarget:action:", self, sel_didClearBirthdate);
  v22 = self->_birthdateCell;
  WDBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("BIRTHDATE"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayName:](v22, "setDisplayName:", v24);

  -[WDProfileTableViewCell updateAutomationIdentifiersForProfileDetail:](self->_birthdateCell, "updateAutomationIdentifiersForProfileDetail:", CFSTR("Birthdate"));
  v25 = (WDProfileTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2E0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDProfileTableViewCell"));
  biologicalSexCell = self->_biologicalSexCell;
  self->_biologicalSexCell = v25;

  -[WDProfileTableViewCell setAccessoryType:](self->_biologicalSexCell, "setAccessoryType:", 1);
  -[WDProfileTableViewCell setEditingAccessoryType:](self->_biologicalSexCell, "setEditingAccessoryType:", 0);
  -[WDProfileTableViewCell setSelectionStyle:](self->_biologicalSexCell, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0D2F760], "viewHostingView:", self->_biologicalSexPicker);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setInputView:](self->_biologicalSexCell, "setInputView:", v27);

  WDBundle();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX_NOT_SET"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setPlaceholderValue:](self->_biologicalSexCell, "setPlaceholderValue:", v29);

  v30 = self->_biologicalSexCell;
  HKHealthKitFrameworkBundle();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x1E0CB5138];
  objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("BIOLOGICAL_SEX"), &stru_1E55A2388, *MEMORY[0x1E0CB5138]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayName:](v30, "setDisplayName:", v33);

  -[WDProfileTableViewCell updateAutomationIdentifiersForProfileDetail:](self->_biologicalSexCell, "updateAutomationIdentifiersForProfileDetail:", CFSTR("BiologicalSex"));
  v34 = (WDProfileTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2E0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDProfileTableViewCell"));
  bloodTypeCell = self->_bloodTypeCell;
  self->_bloodTypeCell = v34;

  -[WDProfileTableViewCell setAccessoryType:](self->_bloodTypeCell, "setAccessoryType:", 1);
  -[WDProfileTableViewCell setEditingAccessoryType:](self->_bloodTypeCell, "setEditingAccessoryType:", 0);
  -[WDProfileTableViewCell setSelectionStyle:](self->_bloodTypeCell, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0D2F760], "viewHostingView:", self->_bloodTypePicker);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setInputView:](self->_bloodTypeCell, "setInputView:", v36);

  WDBundle();
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("BLOOD_TYPE_NOT_SET"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setPlaceholderValue:](self->_bloodTypeCell, "setPlaceholderValue:", v38);

  v39 = self->_bloodTypeCell;
  HKHealthKitFrameworkBundle();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("BLOOD_TYPE"), &stru_1E55A2388, v32);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayName:](v39, "setDisplayName:", v41);

  -[WDProfileTableViewCell updateAutomationIdentifiersForProfileDetail:](self->_bloodTypeCell, "updateAutomationIdentifiersForProfileDetail:", CFSTR("BloodType"));
  v42 = (WDProfileTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2E0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDProfileTableViewCell"));
  fitzpatrickSkinTypeCell = self->_fitzpatrickSkinTypeCell;
  self->_fitzpatrickSkinTypeCell = v42;

  -[WDProfileTableViewCell setAccessoryType:](self->_fitzpatrickSkinTypeCell, "setAccessoryType:", 1);
  -[WDProfileTableViewCell setEditingAccessoryType:](self->_fitzpatrickSkinTypeCell, "setEditingAccessoryType:", 0);
  -[WDProfileTableViewCell setSelectionStyle:](self->_fitzpatrickSkinTypeCell, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0D2F760], "viewHostingView:", self->_fitzpatrickSkinTypePicker);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setInputView:](self->_fitzpatrickSkinTypeCell, "setInputView:", v44);

  WDBundle();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("FITZPATRICK_SKIN_TYPE_NOT_SET"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setPlaceholderValue:](self->_fitzpatrickSkinTypeCell, "setPlaceholderValue:", v46);

  v47 = self->_fitzpatrickSkinTypeCell;
  HKHealthKitFrameworkBundle();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("FITZPATRICK_SKIN_TYPE"), &stru_1E55A2388, v32);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayName:](v47, "setDisplayName:", v49);

  -[WDProfileTableViewCell updateAutomationIdentifiersForProfileDetail:](self->_fitzpatrickSkinTypeCell, "updateAutomationIdentifiersForProfileDetail:", CFSTR("FitzpatrickSkinType"));
  -[HKDisplayTypeController displayTypeWithIdentifier:](self->_displayTypeController, "displayTypeWithIdentifier:", &unk_1E55CD0D0);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (WDProfileTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2F2E0]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WDProfileTableViewCell"));
  wheelchairUseCell = self->_wheelchairUseCell;
  self->_wheelchairUseCell = v50;

  -[WDProfileTableViewCell setAccessoryType:](self->_wheelchairUseCell, "setAccessoryType:", 1);
  -[WDProfileTableViewCell setEditingAccessoryType:](self->_wheelchairUseCell, "setEditingAccessoryType:", 0);
  -[WDProfileTableViewCell setSelectionStyle:](self->_wheelchairUseCell, "setSelectionStyle:", 0);
  objc_msgSend(MEMORY[0x1E0D2F760], "viewHostingView:", self->_wheelchairUsePicker);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setInputView:](self->_wheelchairUseCell, "setInputView:", v52);

  HKWheelchairUseDisplayName();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setPlaceholderValue:](self->_wheelchairUseCell, "setPlaceholderValue:", v53);

  v54 = self->_wheelchairUseCell;
  objc_msgSend(v90, "localization");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "displayName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayName:](v54, "setDisplayName:", v56);

  -[WDProfileTableViewCell updateAutomationIdentifiersForProfileDetail:](self->_wheelchairUseCell, "updateAutomationIdentifiersForProfileDetail:", CFSTR("WheelchairUse"));
  v57 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WDProfileTableViewCell"));
  pregnancyCell = self->_pregnancyCell;
  self->_pregnancyCell = v57;

  -[UITableViewCell setAccessoryType:](self->_pregnancyCell, "setAccessoryType:", 0);
  -[UITableViewCell setEditingAccessoryType:](self->_pregnancyCell, "setEditingAccessoryType:", 0);
  HKHealthKeyColor();
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_pregnancyCell, "textLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setTextColor:", v59);

  -[UITableViewCell textLabel](self->_pregnancyCell, "textLabel");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setNumberOfLines:", 0);

  v96[0] = *MEMORY[0x1E0D2F528];
  v62 = v96[0];
  v96[1] = CFSTR("HealthDetail");
  v96[2] = CFSTR("Pregnancy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 3);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewCell setAccessibilityIdentifier:](self->_pregnancyCell, "setAccessibilityIdentifier:", v64);
  v95[0] = v64;
  v95[1] = CFSTR("Title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v95, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_pregnancyCell, "textLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setAccessibilityIdentifier:", v66);

  v94[0] = v64;
  v94[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v94, 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell detailTextLabel](self->_pregnancyCell, "detailTextLabel");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setAccessibilityIdentifier:", v69);

  -[ProfileCharacteristicsViewController _setPregnancyCellDisplayValueForState:](self, "_setPregnancyCellDisplayValueForState:", self->_isPregnant);
  v71 = (UITableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("WDProfileTableViewCell"));
  cardioFitnessMedicationsCell = self->_cardioFitnessMedicationsCell;
  self->_cardioFitnessMedicationsCell = v71;

  -[UITableViewCell setAccessoryType:](self->_cardioFitnessMedicationsCell, "setAccessoryType:", 1);
  -[UITableViewCell setEditingAccessoryType:](self->_cardioFitnessMedicationsCell, "setEditingAccessoryType:", 0);
  -[UITableViewCell setSelectionStyle:](self->_cardioFitnessMedicationsCell, "setSelectionStyle:", 0);
  WDBundle();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("CARDIO_FITNESS_RELATED_MEDICATIONS"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_cardioFitnessMedicationsCell, "textLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setText:", v74);

  -[UITableViewCell textLabel](self->_cardioFitnessMedicationsCell, "textLabel");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setNumberOfLines:", 0);

  -[ProfileCharacteristicsViewController displayNumberOfActiveCardioFitnessMedications:](self, "displayNumberOfActiveCardioFitnessMedications:", self->_activeCardioFitnessMedications);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell _setBadgeText:](self->_cardioFitnessMedicationsCell, "_setBadgeText:", v77);

  v93[0] = v62;
  v93[1] = CFSTR("HealthDetail");
  v93[2] = CFSTR("CardioFitnessMedications");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 3);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITableViewCell setAccessibilityIdentifier:](self->_cardioFitnessMedicationsCell, "setAccessibilityIdentifier:", v79);
  v92[0] = v79;
  v92[1] = CFSTR("Title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 2);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell textLabel](self->_cardioFitnessMedicationsCell, "textLabel");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setAccessibilityIdentifier:", v81);

  v91[0] = v79;
  v91[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 2);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell detailTextLabel](self->_cardioFitnessMedicationsCell, "detailTextLabel");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "setAccessibilityIdentifier:", v84);

  -[ProfileCharacteristicsViewController _createCalciumChannelBlockerCheckMarkCell](self, "_createCalciumChannelBlockerCheckMarkCell");
  v86 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  calciumChannelBlockerUseCell = self->_calciumChannelBlockerUseCell;
  self->_calciumChannelBlockerUseCell = v86;

  -[ProfileCharacteristicsViewController _createBetaBlockerCheckMarkCell](self, "_createBetaBlockerCheckMarkCell");
  v88 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  betaBlockerUseCell = self->_betaBlockerUseCell;
  self->_betaBlockerUseCell = v88;

}

- (id)_createCalciumChannelBlockerCheckMarkCell
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, 0);
  objc_msgSend(v3, "setSelectionStyle:", 0);
  -[ProfileCharacteristicsViewController _circleImageView](self, "_circleImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell setEditingAccessoryView:](self->_calciumChannelBlockerUseCell, "setEditingAccessoryView:", v4);

  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CALCIUM_CHANNEL_BLOCKER_USE"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v3, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 0);

  WDBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CALCIUM_CHANNEL_BLOCKER_EXAMPLES"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v3, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v13);

  v26[0] = *MEMORY[0x1E0D2F528];
  v26[1] = CFSTR("HealthDetail");
  v26[2] = CFSTR("CalciumChannelBlocker");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityIdentifier:", v16);
  v25[0] = v16;
  v25[1] = CFSTR("Title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", v18);

  v24[0] = v16;
  v24[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityIdentifier:", v21);

  return v3;
}

- (id)_createBetaBlockerCheckMarkCell
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, 0);
  objc_msgSend(v3, "setSelectionStyle:", 0);
  -[ProfileCharacteristicsViewController _circleImageView](self, "_circleImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditingAccessoryView:", v4);

  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BETA_BLOCKER_USE"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

  objc_msgSend(v3, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNumberOfLines:", 0);

  WDBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BETA_BLOCKER_EXAMPLES"), &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v3, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfLines:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v13);

  v26[0] = *MEMORY[0x1E0D2F528];
  v26[1] = CFSTR("HealthDetail");
  v26[2] = CFSTR("BetaBlocker");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityIdentifier:", v16);
  v25[0] = v16;
  v25[1] = CFSTR("Title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityIdentifier:", v18);

  v24[0] = v16;
  v24[1] = CFSTR("Value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinStringsForAutomationIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailTextLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityIdentifier:", v21);

  return v3;
}

- (void)setCardioFitnessMedicationCheckmarks
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, v0, v1, "Failed to get Cardio Fitness Medications Use status: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)_circleImageView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("circle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredSymbolConfiguration:", v6);

  objc_msgSend(v2, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  return v2;
}

- (id)_checkmarkedCircleImageView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  v4 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configurationWithFont:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPreferredSymbolConfiguration:", v6);

  objc_msgSend(v2, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", 1);
  return v2;
}

- (int64_t)_profileRowIdentifierForSection:(id)a3
{
  NSArray *orderedSectionIdentifiers;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;

  orderedSectionIdentifiers = self->_orderedSectionIdentifiers;
  v5 = a3;
  -[NSArray objectAtIndex:](orderedSectionIdentifiers, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_orderedRowIdentifiersBySectionIdentifier, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  return v10;
}

- (void)_updatePickersWithDisplayValues
{
  NSDateComponents *birthdateDisplayValue;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  birthdateDisplayValue = self->_birthdateDisplayValue;
  -[ProfileCharacteristicsViewController _birthdayCalendar](self, "_birthdayCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (birthdateDisplayValue)
  {
    objc_msgSend(v4, "dateFromComponents:", self->_birthdateDisplayValue);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ProfileCharacteristicsViewController _initialBirthdayValue](self, "_initialBirthdayValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromComponents:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIDatePicker setDate:](self->_birthdatePicker, "setDate:", v6);

  -[UIPickerView selectRow:inComponent:animated:](self->_biologicalSexPicker, "selectRow:inComponent:animated:", self->_biologicalSexDisplayValue, 0, 0);
  -[UIPickerView selectRow:inComponent:animated:](self->_bloodTypePicker, "selectRow:inComponent:animated:", self->_bloodTypeDisplayValue, 0, 0);
  -[UIPickerView selectRow:inComponent:animated:](self->_fitzpatrickSkinTypePicker, "selectRow:inComponent:animated:", self->_fitzpatrickSkinTypeDisplayValue, 0, 0);
  -[UIPickerView selectRow:inComponent:animated:](self->_wheelchairUsePicker, "selectRow:inComponent:animated:", self->_wheelchairUseDisplayValue, 0, 0);
}

- (void)_updateCellsWithDisplayValues
{
  WDProfileTableViewCell *birthdateCell;
  void *v4;
  WDProfileTableViewCell *biologicalSexCell;
  void *v6;
  WDProfileTableViewCell *bloodTypeCell;
  void *v8;
  WDProfileTableViewCell *fitzpatrickSkinTypeCell;
  void *v10;
  WDProfileTableViewCell *wheelchairUseCell;
  void *v12;

  birthdateCell = self->_birthdateCell;
  -[ProfileCharacteristicsViewController _displayStringForBirthDate:](self, "_displayStringForBirthDate:", self->_birthdateDisplayValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayValue:](birthdateCell, "setDisplayValue:", v4);

  biologicalSexCell = self->_biologicalSexCell;
  -[ProfileCharacteristicsViewController _displayStringForBiologicalSex:](self, "_displayStringForBiologicalSex:", self->_biologicalSexDisplayValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayValue:](biologicalSexCell, "setDisplayValue:", v6);

  bloodTypeCell = self->_bloodTypeCell;
  -[ProfileCharacteristicsViewController _displayStringForBloodType:](self, "_displayStringForBloodType:", self->_bloodTypeDisplayValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayValue:](bloodTypeCell, "setDisplayValue:", v8);

  fitzpatrickSkinTypeCell = self->_fitzpatrickSkinTypeCell;
  -[ProfileCharacteristicsViewController _displayStringForFitzpatrickSkinType:](self, "_displayStringForFitzpatrickSkinType:", self->_fitzpatrickSkinTypeDisplayValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayValue:](fitzpatrickSkinTypeCell, "setDisplayValue:", v10);

  wheelchairUseCell = self->_wheelchairUseCell;
  -[ProfileCharacteristicsViewController _displayStringForWheelchairUse:](self, "_displayStringForWheelchairUse:", self->_wheelchairUseDisplayValue);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDProfileTableViewCell setDisplayValue:](wheelchairUseCell, "setDisplayValue:", v12);

  -[ProfileCharacteristicsViewController _setPregnancyCellDisplayValueForState:](self, "_setPregnancyCellDisplayValueForState:", self->_isPregnant);
}

- (void)_resetSelectedCell
{
  WDProfileTableViewCell *selectedCell;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[WDProfileTableViewCell setShouldDisplayClearButtonDuringEditing:](self->_selectedCell, "setShouldDisplayClearButtonDuringEditing:", 0);
  -[WDProfileTableViewCell resignFirstResponder](self->_selectedCell, "resignFirstResponder");
  selectedCell = self->_selectedCell;
  self->_selectedCell = 0;

}

- (id)_displayStringForBirthDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (v4)
  {
    if (_displayStringForBirthDate__onceToken != -1)
      dispatch_once(&_displayStringForBirthDate__onceToken, &__block_literal_global_413);
    -[ProfileCharacteristicsViewController _birthdayCalendar](self, "_birthdayCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromComponents:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)_displayStringForBirthDate__birthdateFormatter, "stringFromDate:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ProfileCharacteristicsViewController _dateAsAge:](self, "_dateAsAge:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (%@)"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __67__ProfileCharacteristicsViewController__displayStringForBirthDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_displayStringForBirthDate__birthdateFormatter;
  _displayStringForBirthDate__birthdateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_displayStringForBirthDate__birthdateFormatter, "setDateStyle:", 2);
}

- (id)_dateAsAge:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = _dateAsAge__onceToken[0];
  v4 = a3;
  if (v3 != -1)
    dispatch_once(_dateAsAge__onceToken, &__block_literal_global_417);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:toDate:options:", 4, v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)_dateAsAge__ageFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "year"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __51__ProfileCharacteristicsViewController__dateAsAge___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)_dateAsAge__ageFormatter;
  _dateAsAge__ageFormatter = (uint64_t)v0;

}

- (id)_initialBirthdayValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;
  id v12;
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
  id v24;

  -[ProfileCharacteristicsViewController _meContact](self, "_meContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "birthday");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  objc_msgSend(v3, "birthday");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "year") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_5;
  objc_msgSend(v3, "birthday");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "month") == 0x7FFFFFFFFFFFFFFFLL)
  {

LABEL_5:
LABEL_6:
    HKUIDefaultGregorianBirthday();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v3, "birthday");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "day");

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_6;
  v12 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "birthday");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setYear:", objc_msgSend(v13, "year"));

  objc_msgSend(v3, "birthday");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMonth:", objc_msgSend(v14, "month"));

  objc_msgSend(v3, "birthday");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDay:", objc_msgSend(v15, "day"));

  objc_msgSend(v3, "birthday");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "calendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCalendar:", v17);

  v18 = (void *)MEMORY[0x1E0C99D68];
  -[ProfileCharacteristicsViewController _birthdayCalendar](self, "_birthdayCalendar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_minimumDateForBirthDateWithCalendar:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ProfileCharacteristicsViewController _birthdayCalendar](self, "_birthdayCalendar");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dateFromComponents:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "compare:", v21) == 1 || objc_msgSend(v23, "compare:", v20) == -1)
  {
    HKUIDefaultGregorianBirthday();
    v24 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = v12;
  }
  v8 = v24;

LABEL_7:
  return v8;
}

- (id)_meContact
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  id v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = 0;
  if (objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0) == 3)
  {
    v9[0] = *MEMORY[0x1E0C96670];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_opt_new();
    v8 = 0;
    objc_msgSend(v4, "_ios_meContactWithKeysToFetch:error:", v3, &v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;

    if (v2)
      v6 = v5 == 0;
    else
      v6 = 0;
    if (!v6)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        -[ProfileCharacteristicsViewController _meContact].cold.1();
    }

  }
  return v2;
}

- (id)_displayStringForBiologicalSex:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 3:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("OTHER");
      break;
    case 2:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("MALE");
      break;
    case 1:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("FEMALE");
      break;
    default:
      v6 = 0;
      return v6;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_displayStringForBloodType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_a+");
      goto LABEL_11;
    case 2:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_a-");
      goto LABEL_11;
    case 3:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_b+");
      goto LABEL_11;
    case 4:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_b-");
      goto LABEL_11;
    case 5:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_ab+");
      goto LABEL_11;
    case 6:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_ab-");
      goto LABEL_11;
    case 7:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_o+");
      goto LABEL_11;
    case 8:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("blood_type_o-");
LABEL_11:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)_displayStringForFitzpatrickSkinType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 1:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_I");
      goto LABEL_9;
    case 2:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_II");
      goto LABEL_9;
    case 3:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_III");
      goto LABEL_9;
    case 4:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_IV");
      goto LABEL_9;
    case 5:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_V");
      goto LABEL_9;
    case 6:
      WDBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("fitzpatrick_skin_type_VI");
LABEL_9:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E55A2388, CFSTR("WellnessDashboard-Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (id)_displayStringForWheelchairUse:(int64_t)a3
{
  if (!a3)
    return 0;
  HKWheelchairUseDisplayName();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setPregnancyCellDisplayValueForState:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = CFSTR("HEALTH_DETAILS_EDIT_PREGNANCY");
  else
    v7 = CFSTR("HEALTH_DETAILS_ADD_PREGNANCY");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E55A2388, CFSTR("HealthUI-Localizable-Seahorse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell setText:](self->_pregnancyCell, "setText:", v8);

  -[UITableViewCell setNeedsUpdateConstraints](self->_pregnancyCell, "setNeedsUpdateConstraints");
}

- (void)_timeZoneDidChange:(id)a3
{
  NSCalendar *gregorianCalendar;
  void *v5;
  UIDatePicker *birthdatePicker;
  void *v7;

  gregorianCalendar = self->_gregorianCalendar;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar setTimeZone:](gregorianCalendar, "setTimeZone:", v5);

  birthdatePicker = self->_birthdatePicker;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDatePicker setTimeZone:](birthdatePicker, "setTimeZone:", v7);

  -[ProfileCharacteristicsViewController _updatePickersWithDisplayValues](self, "_updatePickersWithDisplayValues");
}

- (id)_birthdayCalendar
{
  NSCalendar *gregorianCalendar;
  NSCalendar *v4;
  NSCalendar *v5;

  gregorianCalendar = self->_gregorianCalendar;
  if (!gregorianCalendar)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v4 = (NSCalendar *)objc_claimAutoreleasedReturnValue();
    v5 = self->_gregorianCalendar;
    self->_gregorianCalendar = v4;

    gregorianCalendar = self->_gregorianCalendar;
  }
  return gregorianCalendar;
}

- (UIImage)avatarImage
{
  return self->_avatarImage;
}

- (HKHealthSettingsNavigationDonating)settingsNavigationDonatingDelegate
{
  return (HKHealthSettingsNavigationDonating *)objc_loadWeakRetained((id *)&self->_settingsNavigationDonatingDelegate);
}

- (void)setSettingsNavigationDonatingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_settingsNavigationDonatingDelegate, a3);
}

- (int64_t)accessType
{
  return self->_accessType;
}

- (void)setAccessType:(int64_t)a3
{
  self->_accessType = a3;
}

- (void)setAvatarImageView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarImageView, a3);
}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  return self->_currentSnapshot;
}

- (void)setCurrentSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_currentSnapshot, a3);
}

- (ProfileCharacteristicDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (HKBirthdateChangeManager)birthdateChangeManager
{
  return self->_birthdateChangeManager;
}

- (void)setBirthdateChangeManager:(id)a3
{
  objc_storeStrong((id *)&self->_birthdateChangeManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_birthdateChangeManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_avatarImageView, 0);
  objc_destroyWeak((id *)&self->_settingsNavigationDonatingDelegate);
  objc_storeStrong((id *)&self->_avatarImage, 0);
  objc_storeStrong((id *)&self->_orderedRowIdentifiersBySectionIdentifier, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_pregnancyModelQuery, 0);
  objc_storeStrong((id *)&self->_pregnancyCell, 0);
  objc_storeStrong((id *)&self->_calciumChannelBlockerUseCell, 0);
  objc_storeStrong((id *)&self->_betaBlockerUseCell, 0);
  objc_storeStrong((id *)&self->_cardioFitnessMedicationsCell, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCell, 0);
  objc_storeStrong((id *)&self->_selectedCell, 0);
  objc_storeStrong((id *)&self->_fitzpatrickSkinTypeCell, 0);
  objc_storeStrong((id *)&self->_bloodTypeCell, 0);
  objc_storeStrong((id *)&self->_biologicalSexCell, 0);
  objc_storeStrong((id *)&self->_birthdateCell, 0);
  objc_storeStrong((id *)&self->_lastNameCell, 0);
  objc_storeStrong((id *)&self->_firstNameCell, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_customLeftBarButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_wheelchairUsePicker, 0);
  objc_storeStrong((id *)&self->_fitzpatrickSkinTypePicker, 0);
  objc_storeStrong((id *)&self->_biologicalSexPicker, 0);
  objc_storeStrong((id *)&self->_bloodTypePicker, 0);
  objc_storeStrong((id *)&self->_birthdatePicker, 0);
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_storeStrong((id *)&self->_birthdateDisplayValue, 0);
  objc_storeStrong((id *)&self->_birthdate, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_biologicalSexObject, 0);
  objc_storeStrong((id *)&self->_bloodTypeObject, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)setEditing:animated:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, v0, v1, "Error setting cardio fitness medications use: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setEditing:animated:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, v0, v1, "Error setting wheelchair use: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setEditing:animated:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, v0, v1, "Error setting Fitzpatrick skin type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setEditing:animated:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, v0, v1, "Error setting birthdate: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setEditing:animated:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, v0, v1, "Error setting blood type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setEditing:animated:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, v0, v1, "Error setting biological sex: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__ProfileCharacteristicsViewController_setEditing_animated___block_invoke_2_cold_1(_QWORD *a1, NSObject *a2)
{
  uint64_t v2;
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
  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v5 = 138412802;
  v6 = v2;
  v7 = 2112;
  v8 = v3;
  v9 = 2114;
  v10 = v4;
  _os_log_error_impl(&dword_1A95F5000, a2, OS_LOG_TYPE_ERROR, "Error setting name to %@ %@: %{public}@", (uint8_t *)&v5, 0x20u);
}

- (void)_handlePregnancyModelQueryResult:(uint64_t)a3 error:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  v8 = 2114;
  v9 = a3;
  _os_log_error_impl(&dword_1A95F5000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Error in pregnancy state query: %{public}@", v7, 0x16u);

}

- (void)_meContact
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1A95F5000, v0, v1, "Error getting Me card: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
