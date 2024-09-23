@implementation FAChecklistViewController

- (FAChecklistViewController)initWithAccountManager:(id)a3 familyCircle:(id)a4 profilePictureStore:(id)a5 checklistStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  FAChecklistViewController *v14;
  uint64_t v15;
  FMFSession *session;
  void *v17;
  void *v18;
  objc_class *v19;
  HKHealthStore *v20;
  HKHealthStore *healthStore;
  void *v22;
  objc_class *v23;
  uint64_t v24;
  HKMedicalIDStore *medicalIDStore;
  void *v26;
  objc_class *v27;
  _HKMedicalIDData *v28;
  _HKMedicalIDData *medicalIDData;
  NSArray *v30;
  NSArray *currEmergencyContacts;
  NSMutableDictionary *v32;
  NSMutableDictionary *childPresetRecord;
  NSMutableDictionary *v34;
  NSMutableDictionary *existingChildPresetRecord;
  NSOperationQueue *v36;
  NSOperationQueue *networkActivityQueue;
  RemoteUIController *v38;
  RemoteUIController *remoteUIViewController;
  void *v40;
  uint64_t v41;
  ACAccount *appleAccount;
  AACustodianController *v43;
  AACustodianController *custodianController;
  void *v45;
  id v46;
  uint64_t v47;
  STSetupClient *setupClient;
  NSArray *v49;
  NSArray *custodians;
  NSSet *v51;
  NSSet *membersWithLocation;
  NSDate *v53;
  NSDate *screenTimeModifiedDate;
  NSMutableDictionary *v55;
  NSMutableDictionary *screenTimeModifiedRecord;
  NSMutableDictionary *v57;
  NSMutableDictionary *commLimitsModifiedRecord;
  uint64_t v59;
  _TtC14FamilyCircleUI17LocationViewModel *locationViewModel;
  void *v61;
  NSMutableDictionary *v62;
  NSMutableDictionary *parentalControlsForChildren;
  NSMutableDictionary *v64;
  NSMutableDictionary *commLimitsForChildren;
  void *v66;
  uint64_t v67;
  _TtC14FamilyCircleUI17LocationViewModel *v68;
  id v70;
  id v71;
  objc_super v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v71 = a6;
  v72.receiver = self;
  v72.super_class = (Class)FAChecklistViewController;
  v14 = -[FAChecklistViewController init](&v72, sel_init);
  if (v14)
  {
    v70 = v13;
    objc_msgSend(MEMORY[0x24BE2FED0], "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    session = v14->_session;
    v14->_session = (FMFSession *)v15;

    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMFSession setDelegateQueue:](v14->_session, "setDelegateQueue:", v17);

    v78 = 0;
    v79 = &v78;
    v80 = 0x2050000000;
    v18 = (void *)getHKHealthStoreClass_softClass_2;
    v81 = getHKHealthStoreClass_softClass_2;
    if (!getHKHealthStoreClass_softClass_2)
    {
      v73 = MEMORY[0x24BDAC760];
      v74 = 3221225472;
      v75 = __getHKHealthStoreClass_block_invoke_2;
      v76 = &unk_24C88B7B0;
      v77 = &v78;
      __getHKHealthStoreClass_block_invoke_2((uint64_t)&v73);
      v18 = (void *)v79[3];
    }
    v19 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v78, 8);
    v20 = (HKHealthStore *)objc_alloc_init(v19);
    healthStore = v14->_healthStore;
    v14->_healthStore = v20;

    v78 = 0;
    v79 = &v78;
    v80 = 0x2050000000;
    v22 = (void *)getHKMedicalIDStoreClass_softClass_2;
    v81 = getHKMedicalIDStoreClass_softClass_2;
    if (!getHKMedicalIDStoreClass_softClass_2)
    {
      v73 = MEMORY[0x24BDAC760];
      v74 = 3221225472;
      v75 = __getHKMedicalIDStoreClass_block_invoke_2;
      v76 = &unk_24C88B7B0;
      v77 = &v78;
      __getHKMedicalIDStoreClass_block_invoke_2((uint64_t)&v73);
      v22 = (void *)v79[3];
    }
    v23 = objc_retainAutorelease(v22);
    _Block_object_dispose(&v78, 8);
    v24 = objc_msgSend([v23 alloc], "initWithHealthStore:", v14->_healthStore);
    medicalIDStore = v14->_medicalIDStore;
    v14->_medicalIDStore = (HKMedicalIDStore *)v24;

    v78 = 0;
    v79 = &v78;
    v80 = 0x2050000000;
    v26 = (void *)get_HKMedicalIDDataClass_softClass_1;
    v81 = get_HKMedicalIDDataClass_softClass_1;
    if (!get_HKMedicalIDDataClass_softClass_1)
    {
      v73 = MEMORY[0x24BDAC760];
      v74 = 3221225472;
      v75 = __get_HKMedicalIDDataClass_block_invoke_1;
      v76 = &unk_24C88B7B0;
      v77 = &v78;
      __get_HKMedicalIDDataClass_block_invoke_1((uint64_t)&v73);
      v26 = (void *)v79[3];
    }
    v27 = objc_retainAutorelease(v26);
    _Block_object_dispose(&v78, 8);
    v28 = (_HKMedicalIDData *)objc_alloc_init(v27);
    medicalIDData = v14->_medicalIDData;
    v14->_medicalIDData = v28;

    v30 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    currEmergencyContacts = v14->_currEmergencyContacts;
    v14->_currEmergencyContacts = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    childPresetRecord = v14->_childPresetRecord;
    v14->_childPresetRecord = v32;

    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    existingChildPresetRecord = v14->_existingChildPresetRecord;
    v14->_existingChildPresetRecord = v34;

    objc_storeStrong((id *)&v14->_accountManager, a3);
    v36 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    networkActivityQueue = v14->_networkActivityQueue;
    v14->_networkActivityQueue = v36;

    -[NSOperationQueue setQualityOfService:](v14->_networkActivityQueue, "setQualityOfService:", 33);
    v38 = (RemoteUIController *)objc_alloc_init(MEMORY[0x24BE7EE20]);
    remoteUIViewController = v14->_remoteUIViewController;
    v14->_remoteUIViewController = v38;

    -[AIDAAccountManager accounts](v14->_accountManager, "accounts");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v41 = objc_claimAutoreleasedReturnValue();
    appleAccount = v14->_appleAccount;
    v14->_appleAccount = (ACAccount *)v41;

    v43 = (AACustodianController *)objc_alloc_init(MEMORY[0x24BE04930]);
    custodianController = v14->_custodianController;
    v14->_custodianController = v43;

    v78 = 0;
    v79 = &v78;
    v80 = 0x2050000000;
    v45 = (void *)getSTSetupClientClass_softClass_0;
    v81 = getSTSetupClientClass_softClass_0;
    v13 = v70;
    if (!getSTSetupClientClass_softClass_0)
    {
      v73 = MEMORY[0x24BDAC760];
      v74 = 3221225472;
      v75 = __getSTSetupClientClass_block_invoke_0;
      v76 = &unk_24C88B7B0;
      v77 = &v78;
      __getSTSetupClientClass_block_invoke_0((uint64_t)&v73);
      v45 = (void *)v79[3];
    }
    v46 = objc_retainAutorelease(v45);
    _Block_object_dispose(&v78, 8);
    v47 = objc_opt_new();
    setupClient = v14->_setupClient;
    v14->_setupClient = (STSetupClient *)v47;

    v49 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    custodians = v14->_custodians;
    v14->_custodians = v49;

    objc_storeStrong((id *)&v14->_familyCircle, a4);
    objc_storeStrong((id *)&v14->_profilePictureStore, a5);
    objc_storeStrong((id *)&v14->_checklistStore, a6);
    v14->_isMissingParentContact = 0;
    v51 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    membersWithLocation = v14->_membersWithLocation;
    v14->_membersWithLocation = v51;

    v53 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
    screenTimeModifiedDate = v14->_screenTimeModifiedDate;
    v14->_screenTimeModifiedDate = v53;

    v55 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    screenTimeModifiedRecord = v14->_screenTimeModifiedRecord;
    v14->_screenTimeModifiedRecord = v55;

    v57 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    commLimitsModifiedRecord = v14->_commLimitsModifiedRecord;
    v14->_commLimitsModifiedRecord = v57;

    +[LocationViewModel shared](_TtC14FamilyCircleUI17LocationViewModel, "shared");
    v59 = objc_claimAutoreleasedReturnValue();
    locationViewModel = v14->_locationViewModel;
    v14->_locationViewModel = (_TtC14FamilyCircleUI17LocationViewModel *)v59;

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_deviceType = objc_msgSend(v61, "userInterfaceIdiom");

    v62 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    parentalControlsForChildren = v14->_parentalControlsForChildren;
    v14->_parentalControlsForChildren = v62;

    v64 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    commLimitsForChildren = v14->_commLimitsForChildren;
    v14->_commLimitsForChildren = v64;

    -[FAChecklistViewController familyCircle](v14, "familyCircle");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_storeStrong((id *)&v14->_familyCircle, a4);
      +[LocationViewModel createModel](_TtC14FamilyCircleUI17LocationViewModel, "createModel");
      v67 = objc_claimAutoreleasedReturnValue();
      v68 = v14->_locationViewModel;
      v14->_locationViewModel = (_TtC14FamilyCircleUI17LocationViewModel *)v67;

    }
  }

  return v14;
}

- (void)loadView
{
  NSArray *v3;
  NSArray *listOfChildren;
  NSString *v5;
  NSString *organizerName;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FAChecklistViewController;
  -[FAChecklistViewController loadView](&v7, sel_loadView);
  -[FAChecklistViewController _childrenRecord](self, "_childrenRecord");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  listOfChildren = self->_listOfChildren;
  self->_listOfChildren = v3;

  -[FAChecklistViewController _getOrganizer](self, "_getOrganizer");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  organizerName = self->_organizerName;
  self->_organizerName = v5;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UINavigationItem *v6;
  UINavigationItem *navItem;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _TtP14FamilyCircleUI33FACheckListHostControllerProtocol_ *v12;
  _TtP14FamilyCircleUI33FACheckListHostControllerProtocol_ *checklistHostController;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)FAChecklistViewController;
  -[FAChecklistViewController viewDidLoad](&v37, sel_viewDidLoad);
  +[FamilyChecklistAnalytics shared](_TtC14FamilyCircleUI24FamilyChecklistAnalytics, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendTotalChecklistViewsAnalyticsEvent");

  self->_isFirstSpecifierLoad = 1;
  +[FATipKitSignaler sendSignalForFamilyChecklistTapped](FATipKitSignaler, "sendSignalForFamilyChecklistTapped");
  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__gotLocationChangedNotification, *MEMORY[0x24BE30958], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("FAChecklistTipUpdateNotification"), 0);

  -[FAChecklistViewController navigationItem](self, "navigationItem");
  v6 = (UINavigationItem *)objc_claimAutoreleasedReturnValue();
  navItem = self->_navItem;
  self->_navItem = v6;

  v8 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_24C8A3000, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 2, self, sel_doneButtonTapped_);

  -[UINavigationItem setRightBarButtonItem:](self->_navItem, "setRightBarButtonItem:", v11);
  -[UINavigationItem setLeftBarButtonItem:](self->_navItem, "setLeftBarButtonItem:", 0);
  -[UINavigationItem setLargeTitleDisplayMode:](self->_navItem, "setLargeTitleDisplayMode:", 2);
  self->_isNavigationTitleViewDisplayed = 0;
  -[FAChecklistViewController _setupNavigationBarTitleView](self, "_setupNavigationBarTitleView");
  +[FASwiftUIHostingControllerProvider getCheckListControllerWithSpecifiers:](_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider, "getCheckListControllerWithSpecifiers:", self->_specifiers);
  v12 = (_TtP14FamilyCircleUI33FACheckListHostControllerProtocol_ *)objc_claimAutoreleasedReturnValue();
  checklistHostController = self->_checklistHostController;
  self->_checklistHostController = v12;

  -[FAChecklistViewController addChildViewController:](self, "addChildViewController:", self->_checklistHostController);
  -[FAChecklistViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FACheckListHostControllerProtocol view](self->_checklistHostController, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v15);

  -[FACheckListHostControllerProtocol view](self->_checklistHostController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[FACheckListHostControllerProtocol view](self->_checklistHostController, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[FACheckListHostControllerProtocol view](self->_checklistHostController, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setActive:", 1);

  -[FACheckListHostControllerProtocol view](self->_checklistHostController, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setActive:", 1);

  -[FACheckListHostControllerProtocol view](self->_checklistHostController, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[FACheckListHostControllerProtocol didMoveToParentViewController:](self->_checklistHostController, "didMoveToParentViewController:", self);
}

- (void)_setupNavigationBarTitleView
{
  UILabel *v3;
  UILabel *navigationBarTitleLabel;
  void *v5;
  UILabel *v6;
  void *v7;
  void *v8;

  v3 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 0.0, 0.0, 100.0, 20.0);
  navigationBarTitleLabel = self->_navigationBarTitleLabel;
  self->_navigationBarTitleLabel = v3;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BEBB610]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_navigationBarTitleLabel, "setFont:", v5);

  -[UILabel setTextAlignment:](self->_navigationBarTitleLabel, "setTextAlignment:", 1);
  v6 = self->_navigationBarTitleLabel;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST"), &stru_24C8A3000, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v6, "setText:", v8);

  -[UILabel setAlpha:](self->_navigationBarTitleLabel, "setAlpha:", 0.0);
}

- (void)doneButtonTapped:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__FAChecklistViewController_doneButtonTapped___block_invoke;
  block[3] = &unk_24C88B7F0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __46__FAChecklistViewController_doneButtonTapped___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "delegate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_respondsToSelector(),
        v4,
        v3,
        (v5 & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "checklistViewControllerDone:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_19);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FAChecklistViewController;
  -[FAChecklistViewController viewWillAppear:](&v4, sel_viewWillAppear_, 1);
  -[FAChecklistViewController _checkAndReloadAllSpecifiers](self, "_checkAndReloadAllSpecifiers");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FAChecklistViewController;
  -[FAChecklistViewController viewDidAppear:](&v3, sel_viewDidAppear_, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FAChecklistViewController;
  -[FAChecklistViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, 1);
}

- (void)_checkAndReloadAllSpecifiers
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  NSObject *v11;
  _QWORD v12[4];
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[5];
  NSObject *v17;

  if (!self->_isFirstSpecifierLoad)
  {
    -[FAChecklistViewController checklistStore](self, "checklistStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clearChecklistCounts");

  }
  self->_isFirstSpecifierLoad = 0;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v5 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke;
  v16[3] = &unk_24C88B958;
  v16[4] = self;
  v6 = v4;
  v17 = v6;
  -[FAChecklistViewController _updateLocationSpecifierThen:](self, "_updateLocationSpecifierThen:", v16);
  if (!self->_deviceType)
  {
    dispatch_group_enter(v6);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_3;
    v14[3] = &unk_24C88B7F0;
    v15 = v6;
    -[FAChecklistViewController _updateMedicalSpecifierThen:](self, "_updateMedicalSpecifierThen:", v14);

  }
  dispatch_group_enter(v6);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_4;
  v12[3] = &unk_24C88B7F0;
  v7 = v6;
  v13 = v7;
  -[FAChecklistViewController _updateCustodianSpecifierThen:](self, "_updateCustodianSpecifierThen:", v12);
  dispatch_group_enter(v7);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_5;
  v10[3] = &unk_24C88B7F0;
  v11 = v7;
  v8 = v7;
  -[FAChecklistViewController _updateCommunicationLimitsSpecifierThen:](self, "_updateCommunicationLimitsSpecifierThen:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_6;
  v9[3] = &unk_24C88B7F0;
  v9[4] = self;
  dispatch_group_notify(v8, MEMORY[0x24BDAC9B8], v9);

}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_2;
  v2[3] = &unk_24C88B7F0;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_updateScreenTimeSpecifierThen:", v2);

}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__FAChecklistViewController__checkAndReloadAllSpecifiers__block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyObservable");

  _FALogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "checklistStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incompleteItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_20DE41000, v3, OS_LOG_TYPE_DEFAULT, "FAChecklistViewController _checkAndReloadAllSpecifiers end count %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)_updateLocationSpecifierThen:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__FAChecklistViewController__updateLocationSpecifierThen___block_invoke;
  v7[3] = &unk_24C88D4A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "familyLocationSharingStatus:", v7);

}

void __58__FAChecklistViewController__updateLocationSpecifierThen___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__FAChecklistViewController__updateLocationSpecifierThen___block_invoke_2;
  v8[3] = &unk_24C88D478;
  v11 = a2;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __58__FAChecklistViewController__updateLocationSpecifierThen___block_invoke_2(uint64_t a1)
{
  void *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 992) = *(_QWORD *)(a1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1144), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIncompleteCountFor:count:", 2, *(_QWORD *)(a1 + 56) == 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_updateMedicalSpecifierThen:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__FAChecklistViewController__updateMedicalSpecifierThen___block_invoke;
  v7[3] = &unk_24C88D4C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchMedicalIDData:", v7);

}

void __57__FAChecklistViewController__updateMedicalSpecifierThen___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1008), a2);
  v10 = a2;
  objc_msgSend(v10, "emergencyContacts");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1016);
  *(_QWORD *)(v7 + 1016) = v6;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000) = a3;
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIncompleteCountFor:count:", 1, a3 == 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateCustodianSpecifierThen:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__FAChecklistViewController__updateCustodianSpecifierThen___block_invoke;
  v7[3] = &unk_24C88D4F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchMyCustodians:", v7);

}

void __59__FAChecklistViewController__updateCustodianSpecifierThen___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1128), a2);
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncompleteCountFor:count:", 3, objc_msgSend(v5, "count") == 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateICloudPlusSpecifierThen:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__FAChecklistViewController__updateICloudPlusSpecifierThen___block_invoke;
  v7[3] = &unk_24C88CE18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchIcloudPlusMembership:", v7);

}

void __60__FAChecklistViewController__updateICloudPlusSpecifierThen___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  uint64_t v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FAChecklistViewController__updateICloudPlusSpecifierThen___block_invoke_2;
  block[3] = &unk_24C88D518;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __60__FAChecklistViewController__updateICloudPlusSpecifierThen___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCountMembersIcloudPlus:", v2);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "aa_isCloudSubscriber"))
    v4 = *(_QWORD *)(a1 + 48) == 0;
  else
    v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncompleteCountFor:count:", 6, v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateScreenTimeSpecifierThen:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *parentalControlsForChildren;
  void *v13;
  void *v14;
  NSSet *membersWithLocation;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  NSArray *obj;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  _QWORD v25[6];
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_listOfChildren;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    LODWORD(v7) = 0;
    v22 = *(_QWORD *)v28;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        -[FAChecklistViewController checklistStore](self, "checklistStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "screenTimeEnabledForChild:", v9) & 1) != 0
          || (objc_msgSend(v9, "hasAskToBuyEnabled") & 1) != 0)
        {
          v11 = 1;
        }
        else if (-[NSSet count](self->_membersWithLocation, "count"))
        {
          membersWithLocation = self->_membersWithLocation;
          objc_msgSend(v9, "appleID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[NSSet containsObject:](membersWithLocation, "containsObject:", v16);

        }
        else
        {
          v11 = 0;
        }

        parentalControlsForChildren = self->_parentalControlsForChildren;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appleID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](parentalControlsForChildren, "setObject:forKey:", v13, v14);

        v25[0] = MEMORY[0x24BDAC760];
        v7 = v7 + (v11 ^ 1);
        v25[1] = 3221225472;
        v25[2] = __60__FAChecklistViewController__updateScreenTimeSpecifierThen___block_invoke;
        v25[3] = &unk_24C88D540;
        v25[4] = self;
        v25[5] = v9;
        v26 = v4;
        -[FAChecklistViewController _fetchScreenTimeModifiedDate:completionHandler:](self, "_fetchScreenTimeModifiedDate:completionHandler:", v9, v25);

        ++v8;
      }
      while (v6 != v8);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v6 = v17;
    }
    while (v17);
  }
  else
  {
    v7 = 0;
  }

  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIncompleteCountFor:count:", 4, v7);

  dispatch_group_leave(v4);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__FAChecklistViewController__updateScreenTimeSpecifierThen___block_invoke_2;
  block[3] = &unk_24C88C008;
  block[4] = self;
  v24 = v20;
  v19 = v20;
  dispatch_group_notify(v4, MEMORY[0x24BDAC9B8], block);

}

void __60__FAChecklistViewController__updateScreenTimeSpecifierThen___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a2 && !a3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1192);
    v6 = a2;
    objc_msgSend(v4, "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __60__FAChecklistViewController__updateScreenTimeSpecifierThen___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1192);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          if (v7 && (objc_msgSend(v7, "isEqualToDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1176)) & 1) == 0)
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1176), v8);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_updateCommunicationLimitsSpecifierThen:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  FAChecklistViewController *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  id v25;
  NSArray *obj;
  NSMutableDictionary *commLimitsForChildren;
  uint64_t v28;
  uint64_t v29;
  _QWORD block[5];
  id v31;
  _QWORD v32[6];
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = self->_listOfChildren;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  v6 = MEMORY[0x24BDAC760];
  v29 = v5;
  v7 = 0;
  if (v5)
  {
    v28 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        dispatch_group_enter(v4);
        -[FAChecklistViewController checklistStore](self, "checklistStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "contactManagementEnabledForChild:", v9);

        -[FAChecklistViewController checklistStore](self, "checklistStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "screenTimeEnabledForChild:", v9);

        -[FAChecklistViewController checklistStore](self, "checklistStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "screenTimeEnabledForChild:", v9);

        if (v15)
        {
          commLimitsForChildren = self->_commLimitsForChildren;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11 == 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appleID");
          v17 = v13;
          v18 = self;
          v19 = v4;
          v20 = v6;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](commLimitsForChildren, "setObject:forKey:", v16, v21);

          v6 = v20;
          v4 = v19;
          self = v18;
          v13 = v17;

        }
        v32[0] = v6;
        if (v11)
          v22 = 0;
        else
          v22 = v13;
        v7 = (v7 + v22);
        v32[1] = 3221225472;
        v32[2] = __69__FAChecklistViewController__updateCommunicationLimitsSpecifierThen___block_invoke;
        v32[3] = &unk_24C88D540;
        v32[4] = self;
        v32[5] = v9;
        v33 = v4;
        -[FAChecklistViewController _fetchCommunicationLimitsModifiedDate:completionHandler:](self, "_fetchCommunicationLimitsModifiedDate:completionHandler:", v9, v32);

        ++v8;
      }
      while (v29 != v8);
      v29 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v29);
  }

  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIncompleteCountFor:count:", 5, v7);

  dispatch_group_leave(v4);
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __69__FAChecklistViewController__updateCommunicationLimitsSpecifierThen___block_invoke_2;
  block[3] = &unk_24C88C008;
  block[4] = self;
  v31 = v25;
  v24 = v25;
  dispatch_group_notify(v4, MEMORY[0x24BDAC9B8], block);

}

void __69__FAChecklistViewController__updateCommunicationLimitsSpecifierThen___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a2 && !a3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1200);
    v6 = a2;
    objc_msgSend(v4, "dsid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __69__FAChecklistViewController__updateCommunicationLimitsSpecifierThen___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1200);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = v7;
          if (v7 && (objc_msgSend(v7, "isEqualToDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1184)) & 1) == 0)
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1184), v8);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_childrenRecord
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[FAChecklistViewController familyCircle](self, "familyCircle", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "members");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "memberType") == 1 || objc_msgSend(v10, "memberType") == 2)
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_getOrganizer
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[FAChecklistViewController familyCircle](self, "familyCircle", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "members");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "isOrganizer"))
        {
          objc_msgSend(v10, "firstName");
          v11 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "contact");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "givenName");
          v13 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v11;
          v7 = (void *)v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  if (objc_msgSend(v6, "length"))
    v14 = v6;
  else
    v14 = v7;
  v15 = v14;

  return v15;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 2.0;
}

- (void)_checklistHeaderView
{
  void *v2;
  void *v3;
  id v4;

  +[FASwiftUIHostingControllerProvider getFamilyChecklistHeaderView](_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider, "getFamilyChecklistHeaderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FAChecklistViewController;
  -[FAChecklistViewController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (id)_childCommunicationLimitsForContactManagement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSMutableDictionary *commLimitsModifiedRecord;
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
  const __CFString *v41;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  _QWORD v79[2];
  _QWORD v80[5];

  v80[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_COMMUNICATION_LIMITS_CARD"), &stru_24C8A3000, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);
  v78 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_COMMUNICATION_LIMITS_CARD_SET"), &stru_24C8A3000, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageNamed:inBundle:", CFSTR("communicationLimitsIcon"), v15);
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1500], "fa_checklistDateFormatter");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = -[FAChecklistViewController _contactsStatusForChild:](self, "_contactsStatusForChild:", v4);
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v17, "contactManagementEnabledForChild:", v4);

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("commLimits"));
  v71 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v78, self, 0, 0, 0, 4, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v13;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BEBE770];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BE75D10];
  objc_msgSend(v18, "setProperty:forKey:", v21, *MEMORY[0x24BE75D10]);

  v23 = *MEMORY[0x24BE75D50];
  objc_msgSend(v18, "setProperty:forKey:", v78, *MEMORY[0x24BE75D50]);
  v24 = *MEMORY[0x24BE75D28];
  objc_msgSend(v18, "setProperty:forKey:", 0, *MEMORY[0x24BE75D28]);
  v25 = *MEMORY[0x24BE75AC8];
  v70 = v18;
  objc_msgSend(v18, "setProperty:forKey:", v16, *MEMORY[0x24BE75AC8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setProperty:forKey:", v26, v22);

  v68 = v23;
  v27 = v23;
  v28 = v19;
  objc_msgSend(v19, "setProperty:forKey:", v78, v27);
  objc_msgSend(v19, "setProperty:forKey:", 0, v24);
  v72 = (void *)v16;
  objc_msgSend(v19, "setProperty:forKey:", v16, v25);
  commLimitsModifiedRecord = self->_commLimitsModifiedRecord;
  objc_msgSend(v4, "dsid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](commLimitsModifiedRecord, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v31;
  if (v73 == 2)
  {
    if (!v31)
    {
      v77 = 0;
      goto LABEL_12;
    }
    v42 = v31;
    v43 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_SECTION_UPDATED_DATE"), &stru_24C8A3000, CFSTR("Localizable"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "stringFromDate:", v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringWithFormat:", v45, v46);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
    goto LABEL_11;
  }
  if (v73 == 1)
  {
    v47 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_COMMUNICATION_SUBTITLE_PENDING"), &stru_24C8A3000, CFSTR("Localizable"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedStringWithFormat:", v49, v50);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_COMMUNICATION_LIMITS_SETUP_APPROVAL"), &stru_24C8A3000, CFSTR("Localizable"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringWithFormat:", v45, v46);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  v31 = 0;
  v77 = 0;
  if (!v73)
  {
    v74 = v24;
    v32 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_COMMUNICATION_LIMIT_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringWithFormat:", v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v69;
    v38 = (void *)v71;
    if (v67 != 2)
    {
      if (v67 == 5)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        v41 = CFSTR("FAMILY_CHECKLIST_COMMUNICATION_LIMITS_SETUP_APPROVAL");
        goto LABEL_17;
      }
      if (v67 != 4)
      {
        v77 = 0;
        goto LABEL_19;
      }
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    v41 = CFSTR("FAMILY_CHECKLIST_COMMUNICATION_LIMITS_SETUP");
LABEL_17:
    objc_msgSend(v39, "localizedStringForKey:value:table:", v41, &stru_24C8A3000, CFSTR("Localizable"));
    v77 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v77, self, 0, 0, 0, 13, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_opt_class();
    v64 = *MEMORY[0x24BE75948];
    v61 = v70;
    objc_msgSend(v70, "setProperty:forKey:", v63, *MEMORY[0x24BE75948]);
    objc_msgSend(v70, "setProperty:forKey:", v36, v74);
    objc_msgSend(v62, "setProperty:forKey:", &unk_24C8CD728, *MEMORY[0x24BE75860]);
    objc_msgSend(v4, "dsid");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setProperty:forKey:", v65, CFSTR("childDsidKey"));

    objc_msgSend(v62, "setProperty:forKey:", v77, v68);
    objc_msgSend(v62, "setProperty:forKey:", objc_opt_class(), v64);
    objc_msgSend(v62, "setButtonAction:", sel__manageChildContactsWasTapped_);
    v80[0] = v71;
    v80[1] = v70;
    v80[2] = v62;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 3);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v59 = v4;
    v60 = (void *)v78;
    goto LABEL_20;
  }
LABEL_12:
  v52 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_COMMUNICATION_LIMIT_DESCRIPTION_SETUP"), &stru_24C8A3000, CFSTR("Localizable"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "localizedStringWithFormat:", v54, v55);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setCellType:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v20);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProperty:forKey:", v56, v22);

  objc_msgSend(v28, "setProperty:forKey:", v36, v24);
  if (v31)
    objc_msgSend(v28, "setProperty:forKey:", v31, *MEMORY[0x24BE75AA8]);
  objc_msgSend(v28, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v4, "dsid");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProperty:forKey:", v57, CFSTR("childDsidKey"));

  objc_msgSend(v28, "setButtonAction:", sel__manageChildContactsWasTapped_);
  v38 = (void *)v71;
  v79[0] = v71;
  v79[1] = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v4;
  v60 = (void *)v78;
  v37 = v69;
  v61 = v70;
LABEL_20:

  return v58;
}

- (id)_locationSpecifiersWithSharedCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t countMembersWithLocation;
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
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[3];
  _QWORD v45[3];

  v45[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_LOCATION_CARD"), &stru_24C8A3000, CFSTR("Localizable"));
  v43 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_LOCATION_SET"), &stru_24C8A3000, CFSTR("Localizable"));
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_LOCATION_SETUP"), &stru_24C8A3000, CFSTR("Localizable"));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_LOCATION_SHARING_INFO"), &stru_24C8A3000, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistViewController familyCircle](self, "familyCircle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "members");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v12, a3, objc_msgSend(v14, "count") - 1);
  v40 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageNamed:inBundle:", CFSTR("fmfNewIcon"), v16);
  v17 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("location"));
  v39 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v9;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 13, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v43, self, 0, 0, 0, 4, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v7;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x24BE75D50];
  objc_msgSend(v18, "setProperty:forKey:", v43, *MEMORY[0x24BE75D50]);
  v21 = *MEMORY[0x24BE75AC8];
  v38 = (void *)v17;
  objc_msgSend(v18, "setProperty:forKey:", v17, *MEMORY[0x24BE75AC8]);
  v22 = objc_opt_class();
  v23 = *MEMORY[0x24BE75948];
  objc_msgSend(v18, "setProperty:forKey:", v22, *MEMORY[0x24BE75948]);
  countMembersWithLocation = self->_countMembersWithLocation;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (countMembersWithLocation)
  {
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_LOCATION_CARD_DESCRIPTION_SET"), &stru_24C8A3000, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)v43;
    objc_msgSend(v19, "setProperty:forKey:", v43, v20);
    v29 = v38;
    objc_msgSend(v19, "setProperty:forKey:", v38, v21);
    objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), v23);
    objc_msgSend(v19, "setCellType:", 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProperty:forKey:", v30, *MEMORY[0x24BE75D10]);

    objc_msgSend(v19, "setButtonAction:", sel__shareMyLocationButtonWasTapped_);
    v31 = (void *)v40;
    objc_msgSend(v19, "setProperty:forKey:", v40, *MEMORY[0x24BE75AA8]);
    objc_msgSend(v19, "setProperty:forKey:", v27, *MEMORY[0x24BE75D28]);
    v32 = (void *)v39;
    v45[0] = v39;
    v45[1] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v41;
    v35 = v37;
  }
  else
  {
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_LOCATION_CARD_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setProperty:forKey:", v27, *MEMORY[0x24BE75D28]);
    v34 = v41;
    objc_msgSend(v18, "setProperty:forKey:", v41, *MEMORY[0x24BE75900]);
    v35 = v37;
    objc_msgSend(v37, "setProperty:forKey:", &unk_24C8CD728, *MEMORY[0x24BE75860]);
    objc_msgSend(v37, "setProperty:forKey:", v41, v20);
    objc_msgSend(v37, "setProperty:forKey:", objc_opt_class(), v23);
    objc_msgSend(v37, "setButtonAction:", sel__shareMyLocationButtonWasTapped_);
    v32 = (void *)v39;
    v44[0] = v39;
    v44[1] = v18;
    v44[2] = v37;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)v43;
    v31 = (void *)v40;
    v29 = v38;
  }

  return v33;
}

- (id)_medicalSpecifiersWithMedicalIDData
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _HKMedicalIDData *medicalIDData;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t countEmergencyContacts;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[3];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_MEDICAL_CARD"), &stru_24C8A3000, CFSTR("Localizable"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_MEDICAL_SET"), &stru_24C8A3000, CFSTR("Localizable"));
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1500], "fa_checklistDateFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDData emergencyContactsModifiedDate](self->_medicalIDData, "emergencyContactsModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  medicalIDData = self->_medicalIDData;
  if (v7)
    -[_HKMedicalIDData emergencyContactsModifiedDate](medicalIDData, "emergencyContactsModifiedDate");
  else
    -[_HKMedicalIDData dateSaved](medicalIDData, "dateSaved");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_SECTION_UPDATED_DATE"), &stru_24C8A3000, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v9;
  v43 = v6;
  objc_msgSend(v6, "stringFromDate:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v12, v13);
  v41 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_MEDICAL_SETUP"), &stru_24C8A3000, CFSTR("Localizable"));
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 7, 35.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("staroflife.fill"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageWithTintColor:renderingMode:", v17, 1);
  v18 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("medical"));
  v37 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v36, self, 0, 0, 0, 4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)v5;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 4, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v15;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, self, 0, 0, 0, 13, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BE75D50];
  objc_msgSend(v19, "setProperty:forKey:", v36, *MEMORY[0x24BE75D50]);
  v22 = *MEMORY[0x24BE75AC8];
  v38 = (void *)v18;
  objc_msgSend(v19, "setProperty:forKey:", v18, *MEMORY[0x24BE75AC8]);
  v23 = objc_opt_class();
  v24 = *MEMORY[0x24BE75948];
  objc_msgSend(v19, "setProperty:forKey:", v23, *MEMORY[0x24BE75948]);
  countEmergencyContacts = self->_countEmergencyContacts;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (countEmergencyContacts)
  {
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_MEDICAL_CARD_DESCRIPTION_SET"), &stru_24C8A3000, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "setProperty:forKey:", v36, v21);
    v29 = v38;
    objc_msgSend(v20, "setProperty:forKey:", v38, v22);
    objc_msgSend(v20, "setProperty:forKey:", objc_opt_class(), v24);
    objc_msgSend(v20, "setCellType:", 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setProperty:forKey:", v30, *MEMORY[0x24BE75D10]);

    objc_msgSend(v20, "setButtonAction:", sel__updateMedicalIDButtonWasTapped_);
    v31 = (void *)v41;
    objc_msgSend(v20, "setProperty:forKey:", v41, *MEMORY[0x24BE75AA8]);
    objc_msgSend(v20, "setProperty:forKey:", v28, *MEMORY[0x24BE75D28]);
    v32 = (void *)v37;
    v47[0] = v37;
    v47[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v39;
  }
  else
  {
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_MEDICAL_CARD_DESCRIPTION_NOT_SET"), &stru_24C8A3000, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setProperty:forKey:", v28, *MEMORY[0x24BE75D28]);
    objc_msgSend(v45, "setProperty:forKey:", &unk_24C8CD728, *MEMORY[0x24BE75860]);
    objc_msgSend(v45, "setProperty:forKey:", v39, v21);
    objc_msgSend(v45, "setProperty:forKey:", objc_opt_class(), v24);
    objc_msgSend(v45, "setButtonAction:", sel__updateMedicalIDButtonWasTapped_);
    v32 = (void *)v37;
    v46[0] = v37;
    v46[1] = v19;
    v46[2] = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v41;
    v34 = v39;
    v29 = v38;
  }

  return v33;
}

- (id)_childPresetSpecifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  NSMutableDictionary *screenTimeModifiedRecord;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
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
  int v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSSet *membersWithLocation;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[4];

  v93[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CHILD_CARD"), &stru_24C8A3000, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CHILD_CARD_REVIEW"), &stru_24C8A3000, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("children"));
  v85 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dsid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v84 = objc_claimAutoreleasedReturnValue();

  -[FAChecklistViewController profilePictureStore](self, "profilePictureStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profilePictureForFamilyMember:pictureDiameter:", v4, 40.0);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scale");
  v83 = (void *)v16;
  objc_msgSend(v17, "imageWithData:scale:", v16);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = (void *)v9;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, 0, 4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)v13;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 4, 0);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1500], "fa_checklistDateFormatter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v21, "setMonth:", -6);
  v22 = objc_alloc(MEMORY[0x24BDBCE48]);
  v23 = (void *)objc_msgSend(v22, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = v23;
  v80 = v21;
  objc_msgSend(v23, "dateByAddingComponents:toDate:options:", v21, v24, 0);
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  screenTimeModifiedRecord = self->_screenTimeModifiedRecord;
  objc_msgSend(v4, "dsid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](screenTimeModifiedRecord, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = v20;
  if (v27)
  {
    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_SECTION_UPDATED_DATE"), &stru_24C8A3000, CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringFromDate:", v27);
    v31 = v27;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v30, v32);
    v87 = objc_claimAutoreleasedReturnValue();

    v27 = v31;
  }
  else
  {
    v87 = 0;
  }
  v33 = *MEMORY[0x24BE75D50];
  objc_msgSend(v19, "setProperty:forKey:", v89, *MEMORY[0x24BE75D50]);
  v34 = *MEMORY[0x24BE75AC8];
  objc_msgSend(v19, "setProperty:forKey:", v90, *MEMORY[0x24BE75AC8]);
  v35 = objc_opt_class();
  v36 = *MEMORY[0x24BE75948];
  objc_msgSend(v19, "setProperty:forKey:", v35, *MEMORY[0x24BE75948]);
  if (!v27 || objc_msgSend(v27, "compare:", v88) != -1)
  {
    -[FAChecklistViewController checklistStore](self, "checklistStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v37, "screenTimeEnabledForChild:", v4) & 1) != 0
      || (objc_msgSend(v4, "hasAskToBuyEnabled") & 1) != 0)
    {

LABEL_9:
      v38 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CHILD_SETUP_DONE"), &stru_24C8A3000, CFSTR("Localizable"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstName");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "setCellType:", 1);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setProperty:forKey:", v43, *MEMORY[0x24BE75D10]);

      v44 = (void *)v84;
      objc_msgSend(v19, "setProperty:forKey:", v84, CFSTR("childDsidKey"));
      objc_msgSend(v4, "altDSID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setProperty:forKey:", v45, CFSTR("childAltDsidKey"));

      v46 = (void *)v87;
      if (v87)
        objc_msgSend(v19, "setProperty:forKey:", v87, *MEMORY[0x24BE75AA8]);
      objc_msgSend(v19, "setProperty:forKey:", v42, *MEMORY[0x24BE75D28]);
      objc_msgSend(v19, "setButtonAction:", sel__reviewPresetsWasTapped_);
      v47 = (void *)v85;
      v93[0] = v85;
      v93[1] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v82;
      goto LABEL_22;
    }
    v77 = v36;
    v78 = v33;
    if (-[NSSet count](self->_membersWithLocation, "count"))
    {
      membersWithLocation = self->_membersWithLocation;
      objc_msgSend(v4, "appleID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(membersWithLocation) = -[NSSet containsObject:](membersWithLocation, "containsObject:", v62);

      if ((_DWORD)membersWithLocation)
        goto LABEL_9;
    }
    else
    {

    }
LABEL_21:
    v63 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CHILD_CARD_DESCRIPTION_UNSET"), &stru_24C8A3000, CFSTR("Localizable"));
    v65 = v27;
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "localizedStringWithFormat:", v66, v67);
    v68 = objc_claimAutoreleasedReturnValue();

    v27 = v65;
    v42 = (void *)v68;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CHILD_SETUP"), &stru_24C8A3000, CFSTR("Localizable"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v70, self, 0, 0, 0, 13, 0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setProperty:forKey:", v42, *MEMORY[0x24BE75D28]);
    objc_msgSend(v71, "setProperty:forKey:", &unk_24C8CD728, *MEMORY[0x24BE75860]);
    v44 = (void *)v84;
    objc_msgSend(v71, "setProperty:forKey:", v84, CFSTR("childDsidKey"));
    objc_msgSend(v4, "altDSID");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setProperty:forKey:", v72, CFSTR("childAltDsidKey"));

    objc_msgSend(v71, "setProperty:forKey:", v70, v78);
    objc_msgSend(v71, "setProperty:forKey:", objc_opt_class(), v77);
    objc_msgSend(v71, "setButtonAction:", sel__reviewPresetsWasTapped_);
    v47 = (void *)v85;
    v91[0] = v85;
    v91[1] = v19;
    v91[2] = v71;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 3);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v82;
    v46 = (void *)v87;
    goto LABEL_22;
  }
  v77 = v36;
  v78 = v33;
  if (objc_msgSend(v27, "compare:", v88) != -1)
    goto LABEL_21;
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "screenTimeEnabledForChild:", v4);

  if (!v51)
    goto LABEL_21;
  v52 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CHILD_CARD_DESCRIPTION_OLD"), &stru_24C8A3000, CFSTR("Localizable"));
  v53 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v4, "age");
  v55 = v52;
  v56 = (void *)v53;
  objc_msgSend(v55, "stringWithFormat:", v53, v54, v74);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CHILD_SETUP_UPDATE"), &stru_24C8A3000, CFSTR("Localizable"));
  v58 = objc_claimAutoreleasedReturnValue();

  v76 = (void *)v58;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v58, self, 0, 0, 0, 13, 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v82;
  objc_msgSend(v82, "setProperty:forKey:", v89, v78);
  objc_msgSend(v82, "setProperty:forKey:", v90, v34);
  objc_msgSend(v82, "setProperty:forKey:", objc_opt_class(), v77);
  objc_msgSend(v82, "setProperty:forKey:", v42, *MEMORY[0x24BE75D28]);
  objc_msgSend(v82, "setIdentifier:", CFSTR("checkScreenTimeSettings"));
  if (v87)
    objc_msgSend(v82, "setProperty:forKey:", v87, *MEMORY[0x24BE75AA8]);
  objc_msgSend(v59, "setProperty:forKey:", &unk_24C8CD728, *MEMORY[0x24BE75860]);
  v44 = (void *)v84;
  objc_msgSend(v59, "setProperty:forKey:", v84, CFSTR("childDsidKey"));
  objc_msgSend(v4, "altDSID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setProperty:forKey:", v60, CFSTR("childAltDsidKey"));

  v46 = (void *)v87;
  objc_msgSend(v59, "setProperty:forKey:", v58, v78);
  objc_msgSend(v59, "setProperty:forKey:", objc_opt_class(), v77);
  objc_msgSend(v59, "setButtonAction:", sel__reviewPresetsWasTapped_);
  v47 = (void *)v85;
  v92[0] = v85;
  v92[1] = v82;
  v92[2] = v59;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
  return v48;
}

- (id)_custodianContactSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *custodians;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSUInteger v28;
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
  __CFString *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  __CFString *v50;
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
  id v61;
  uint64_t v62;
  void *v63;
  _QWORD v64[3];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CUSTODIAN_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CUSTODIAN_CONTACT_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CUSTODIAN_CONTACTS_SETUP"), &stru_24C8A3000, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("RecoveryContactsIcon"), v10);
  v62 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1500], "fa_checklistDateFormatter");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("custodian"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, 0, 0, 0, 4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, 0, 13, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NSArray count](self->_custodians, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  custodians = self->_custodians;
  if (custodians && -[NSArray count](custodians, "count"))
  {
    objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "primaryAuthKitAccount");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v16;
    objc_msgSend(v16, "custodianLastModifiedForAccount:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)v11;
    v52 = v17;
    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v18, "dateWithTimeIntervalSince1970:", v19 / 1000.0);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v59 = 0;
    }
    v56 = v8;
    v58 = v4;
    v28 = -[NSArray count](self->_custodians, "count");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    v57 = v6;
    if (v28 == 1)
    {
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CUSTODIAN_SINGLE_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSArray lastObject](self->_custodians, "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "firstName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (v32)
      {
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CUSTODIAN_UPDATED"), &stru_24C8A3000, CFSTR("Localizable"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "stringFromDate:", v59);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringWithFormat:", v36, v32, v37);
      }
      else
      {
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_SECTION_UPDATED_DATE"), &stru_24C8A3000, CFSTR("Localizable"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "stringFromDate:", v59);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringWithFormat:", v36, v37, v49);
      }
      v41 = objc_claimAutoreleasedReturnValue();

      v39 = v59;
      v40 = (__CFString *)v41;
    }
    else
    {
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CUSTODIAN_ALTERNATE_TITLE"), &stru_24C8A3000, CFSTR("Localizable"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_SECTION_UPDATED_DATE"), &stru_24C8A3000, CFSTR("Localizable"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v59;
      objc_msgSend(v63, "stringFromDate:", v59);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringWithFormat:", v35, v36);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    if (v39)
    {
      v50 = v40;
    }
    else
    {

      v50 = &stru_24C8A3000;
    }
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v51, self, 0, 0, 0, 4, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_CUSTODIAN_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringWithFormat:", v45, -[NSArray count](self->_custodians, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)v62;
    objc_msgSend(v42, "setProperty:forKey:", v62, *MEMORY[0x24BE75AC8]);
    objc_msgSend(v42, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v42, "setProperty:forKey:", v51, *MEMORY[0x24BE75D50]);
    objc_msgSend(v42, "setCellType:", 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setProperty:forKey:", v47, *MEMORY[0x24BE75D10]);

    objc_msgSend(v42, "setProperty:forKey:", v50, *MEMORY[0x24BE75AA8]);
    objc_msgSend(v42, "setProperty:forKey:", v46, *MEMORY[0x24BE75D28]);
    objc_msgSend(v42, "setButtonAction:", sel__setupCustodianTapped_);
    v26 = v55;
    v65[0] = v55;
    v65[1] = v42;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v57;
    v4 = v58;
    v8 = v56;
  }
  else
  {
    v20 = (void *)v62;
    objc_msgSend(v12, "setProperty:forKey:", v62, *MEMORY[0x24BE75AC8]);
    v21 = objc_opt_class();
    v22 = *MEMORY[0x24BE75948];
    objc_msgSend(v12, "setProperty:forKey:", v21, *MEMORY[0x24BE75948]);
    v23 = (void *)v11;
    v24 = *MEMORY[0x24BE75D50];
    objc_msgSend(v12, "setProperty:forKey:", v4, *MEMORY[0x24BE75D50]);
    objc_msgSend(v12, "setProperty:forKey:", v6, *MEMORY[0x24BE75D28]);
    objc_msgSend(v13, "setProperty:forKey:", &unk_24C8CD728, *MEMORY[0x24BE75860]);
    v25 = v24;
    v26 = v23;
    objc_msgSend(v13, "setProperty:forKey:", v8, v25);
    objc_msgSend(v13, "setProperty:forKey:", objc_opt_class(), v22);
    objc_msgSend(v13, "setButtonAction:", sel__setupCustodianTapped_);
    v64[0] = v23;
    v64[1] = v12;
    v64[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v27;
}

- (id)_icloudPlusSpecifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
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
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  _QWORD v60[3];
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x24BDAC8D0];
  v58 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_ICLOUD_PLUS_CARD"), &stru_24C8A3000, CFSTR("Localizable"));
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_ICLOUD_PLUS_SHARED"), &stru_24C8A3000, CFSTR("Localizable"));
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_ICLOUD_PLUS_NON_SUBSCRIBER"), &stru_24C8A3000, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, self->_organizerName);
  v11 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_ICLOUD_PLUS_SETUP"), &stru_24C8A3000, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageNamed:inBundle:", CFSTR("iCloudStorageIcon"), v15);
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("icloudPlus"));
  v55 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v5;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 4, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v7;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 4, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)v11;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, 0, 4, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 13, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countMembersIcloudPlus");

  if (!v22)
  {
    v42 = v19;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_ICLOUD_PLUS_DESCRIPTION"), &stru_24C8A3000, CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)v16;
    objc_msgSend(v17, "setProperty:forKey:", v16, *MEMORY[0x24BE75AC8]);
    v44 = *MEMORY[0x24BE75D50];
    objc_msgSend(v17, "setProperty:forKey:", v59, *MEMORY[0x24BE75D50]);
    v45 = objc_opt_class();
    v46 = *MEMORY[0x24BE75948];
    objc_msgSend(v17, "setProperty:forKey:", v45, *MEMORY[0x24BE75948]);
    objc_msgSend(v17, "setProperty:forKey:", v35, *MEMORY[0x24BE75D28]);
    objc_msgSend(v20, "setProperty:forKey:", &unk_24C8CD728, *MEMORY[0x24BE75860]);
    v47 = v44;
    v41 = v42;
    objc_msgSend(v20, "setProperty:forKey:", v13, v47);
    objc_msgSend(v20, "setProperty:forKey:", objc_opt_class(), v46);
    objc_msgSend(v20, "setButtonAction:", sel__setupIcloudPlusWasTapped_);
    v39 = (void *)v55;
    v60[0] = v55;
    v60[1] = v17;
    v60[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v60, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v38 = v58;
    goto LABEL_7;
  }
  v52 = v20;
  v53 = (void *)v16;
  v54 = v13;
  v23 = objc_msgSend(v58, "isOrganizer");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v23)
  {
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_ICLOUD_PLUS_DESCRIPTION_NON_SUBSCRIBER"), &stru_24C8A3000, CFSTR("Localizable"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)v16;
    objc_msgSend(v19, "setProperty:forKey:", v16, *MEMORY[0x24BE75AC8]);
    objc_msgSend(v19, "setProperty:forKey:", v59, *MEMORY[0x24BE75D50]);
    objc_msgSend(v19, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v19, "setCellType:", 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
    v48 = v19;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setProperty:forKey:", v49, *MEMORY[0x24BE75D10]);

    v41 = v48;
    objc_msgSend(v48, "setProperty:forKey:", v35, *MEMORY[0x24BE75D28]);
    objc_msgSend(v48, "setButtonAction:", sel__setupIcloudPlusWasTapped_);
    v39 = (void *)v55;
    v61[0] = v55;
    v61[1] = v48;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v61, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_ICLOUD_PLUS_DESCRIPTION_SHARED"), &stru_24C8A3000, CFSTR("Localizable"));
  v26 = objc_claimAutoreleasedReturnValue();

  v51 = v19;
  v27 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("FAMILY_CHECKLIST_ICLOUD_PLUS_SHARING_INFO"), &stru_24C8A3000, CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countMembersIcloudPlus") - 1;
  -[FAChecklistViewController familyCircle](self, "familyCircle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "members");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringWithFormat:", v29, v31, objc_msgSend(v33, "count") - 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)v26;
  v36 = v53;
  objc_msgSend(v18, "setProperty:forKey:", v53, *MEMORY[0x24BE75AC8]);
  objc_msgSend(v18, "setProperty:forKey:", v59, *MEMORY[0x24BE75D50]);
  objc_msgSend(v18, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v18, "setCellType:", 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BEBE770]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProperty:forKey:", v37, *MEMORY[0x24BE75D10]);

  v38 = v58;
  objc_msgSend(v18, "setProperty:forKey:", v34, *MEMORY[0x24BE75AA8]);
  objc_msgSend(v18, "setProperty:forKey:", v26, *MEMORY[0x24BE75D28]);
  objc_msgSend(v18, "setButtonAction:", sel__setupIcloudPlusWasTapped_);
  v39 = (void *)v55;
  v62[0] = v55;
  v62[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v51;
  v20 = v52;
  v13 = v54;
LABEL_7:

  return v40;
}

- (id)specifiers
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[FAChecklistViewController familyCircle](self, "familyCircle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "members");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    v40 = *(_QWORD *)v56;
    v41 = v5;
    do
    {
      v9 = 0;
      v42 = v7;
      do
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v9);
        if (objc_msgSend(v10, "isMe") && objc_msgSend(v10, "isParent"))
        {
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v11 = self->_listOfChildren;
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v52;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v52 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
                -[FAChecklistViewController checklistStore](self, "checklistStore");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "screenTimeEnabledForChild:", v16);

                if (v18)
                {
                  -[FAChecklistViewController _childCommunicationLimitsForContactManagement:](self, "_childCommunicationLimitsForContactManagement:", v16);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "addObjectsFromArray:", v19);

                }
                -[FAChecklistViewController _childPresetSpecifiers:](self, "_childPresetSpecifiers:", v16);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObjectsFromArray:", v20);

              }
              v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
            }
            while (v13);
          }

          v8 = v40;
          v5 = v41;
          v7 = v42;
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v7);
  }

  if (!self->_deviceType)
  {
    -[FAChecklistViewController _medicalSpecifiersWithMedicalIDData](self, "_medicalSpecifiersWithMedicalIDData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v21);

  }
  -[FAChecklistViewController _locationSpecifiersWithSharedCount:](self, "_locationSpecifiersWithSharedCount:", self->_countMembersWithLocation);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v22);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  -[FAChecklistViewController familyCircle](self, "familyCircle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "members");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v48;
    while (2)
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v48 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        if (-[ACAccount aa_isCloudSubscriber](self->_appleAccount, "aa_isCloudSubscriber")
          && objc_msgSend(v29, "isMe"))
        {
          -[FAChecklistViewController _icloudPlusSpecifiers:](self, "_icloudPlusSpecifiers:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v30);

          goto LABEL_33;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
      if (v26)
        continue;
      break;
    }
  }
LABEL_33:

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[FAChecklistViewController familyCircle](self, "familyCircle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "members");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v44;
    while (2)
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * k);
        if (objc_msgSend(v37, "isMe")
          && (!objc_msgSend(v37, "memberType") || objc_msgSend(v37, "memberType") == 1))
        {
          -[FAChecklistViewController _custodianContactSpecifiers](self, "_custodianContactSpecifiers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v38);

          goto LABEL_45;
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
      if (v34)
        continue;
      break;
    }
  }
LABEL_45:

  objc_storeStrong((id *)&self->_specifiers, v3);
  return v3;
}

- (void)_fetchScreenTimeModifiedDate:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)getSTManagementStateClass());
  objc_msgSend(v6, "dsid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke;
  v10[3] = &unk_24C88D590;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "lastModifcationDateForDSID:completionHandler:", v8, v10);

}

void __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke_2;
  block[3] = &unk_24C88D568;
  v11 = v6;
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke_2_cold_1(v2, v3, v4);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_fetchCommunicationLimitsModifiedDate:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)getSTManagementStateClass());
  objc_msgSend(v6, "dsid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke;
  v10[3] = &unk_24C88D590;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v7, "lastCommunicationLimitsModifcationDateForDSID:completionHandler:", v8, v10);

}

void __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke_2;
  block[3] = &unk_24C88D568;
  v11 = v6;
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke_2_cold_1(v2, v3, v4);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)_childContactsRecord:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBACF8], "storeForFamilyMember:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDBA2C0];
  v14[0] = *MEMORY[0x24BDBA2C8];
  v14[1] = v4;
  v5 = *MEMORY[0x24BDBA288];
  v14[2] = *MEMORY[0x24BDBA348];
  v14[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBACB8]), "initWithKeysToFetch:", v8);
  v13 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v9, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int)_contactsStatusForChild:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  _BOOL4 v9;
  BOOL v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v20;
  id v21;

  objc_msgSend(MEMORY[0x24BDBACF8], "storeForFamilyMember:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDBACB8]);
  v5 = (void *)objc_msgSend(v4, "initWithKeysToFetch:", MEMORY[0x24BDBD1A8]);
  v21 = 0;
  objc_msgSend(v3, "contactCountForFetchRequest:error:", v5, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  v8 = objc_msgSend(v6, "unsignedIntValue");
  v9 = v8 != 0;
  if (v7)
    v10 = 0;
  else
    v10 = v8 == 0;
  if (v10)
  {
    objc_msgSend(v5, "setShouldFailIfAccountNotYetSynced:", 1);
    v20 = 0;
    objc_msgSend(v3, "contactCountForFetchRequest:error:", v5, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;

    v12 = objc_msgSend(v11, "unsignedIntValue");
    v9 = v12 != 0;
    _FALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[FAChecklistViewController _contactsStatusForChild:].cold.3(v12 != 0, (uint64_t)v7, v13);

    v6 = v11;
  }
  if (v7 || !v9)
  {
    if (v7)
      v15 = 1;
    else
      v15 = v9;
    if (v15 != 1)
    {
      v14 = 4;
      goto LABEL_26;
    }
    objc_msgSend(v7, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqual:", *MEMORY[0x24BDBA420]))
    {
      v17 = objc_msgSend(v7, "code");

      if (v17 == 1007)
      {
        _FALogSystem();
        v18 = objc_claimAutoreleasedReturnValue();
        v14 = 2;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[FAChecklistViewController _contactsStatusForChild:].cold.1(v18);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {

    }
    _FALogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FAChecklistViewController _contactsStatusForChild:].cold.2();
    v14 = 3;
    goto LABEL_25;
  }
  v14 = 5;
LABEL_26:

  return v14;
}

- (void)_fetchPresetsForChild:(id)a3 andCompletionHandler:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BE30B18];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFamilyMemberAltDSID:", v7);

  objc_msgSend(v8, "fetchPresets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke;
  v11[3] = &unk_24C88D5B8;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "onComplete:", v11);

}

void __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke_2;
  block[3] = &unk_24C88D568;
  v11 = v6;
  v7 = *(id *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    _FALogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke_2_cold_1(v2, v3, v4);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_manageChildContactsWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  +[FamilyChecklistAnalytics shared](_TtC14FamilyCircleUI24FamilyChecklistAnalytics, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendCommLimitsAnalyticsEvent");

  objc_msgSend(v4, "propertyForKey:", CFSTR("childDsidKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[FAScreenTimeCommunicationLimitsViewControllerProvider communicationLimitsViewControllerForDSID:](FAScreenTimeCommunicationLimitsViewControllerProvider, "communicationLimitsViewControllerForDSID:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[FAChecklistViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)_shareMyLocationButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  _TtC14FamilyCircleUI17LocationViewModel *locationViewModel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  FACircleContext *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  FACircleStateController *v28;

  v4 = a3;
  +[FamilyChecklistAnalytics shared](_TtC14FamilyCircleUI24FamilyChecklistAnalytics, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendLocationSharingAnalyticsEvent");

  locationViewModel = self->_locationViewModel;
  -[FAChecklistViewController profilePictureStore](self, "profilePictureStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[FASwiftUIHostingControllerProvider getLocationViewControllerWithViewModel:pictureStore:hackfromObjC:](_TtC14FamilyCircleUI34FASwiftUIHostingControllerProvider, "getLocationViewControllerWithViewModel:pictureStore:hackfromObjC:", locationViewModel, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LOCATION"), &stru_24C8A3000, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:", v10);

  objc_msgSend(v8, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStyle:", 0);

  v13 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeSharedService"));
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6;
  v27 = __Block_byref_object_dispose__6;
  v28 = objc_alloc_init(FACircleStateController);
  v14 = (void *)MEMORY[0x24BDBCF48];
  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationSharedService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "actionURLString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v24[5], "setPresenter:", self);
  objc_msgSend((id)v24[5], "setModalPresentationStyle:", -2);
  -[FAChecklistStore familyCircle](self->_checklistStore, "familyCircle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v19, "showLocationSplashScreen");

  if ((_DWORD)v16)
  {
    -[FACircleContext setUrlForContext:](v13, "setUrlForContext:", v18);
    v20 = (void *)v24[5];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __61__FAChecklistViewController__shareMyLocationButtonWasTapped___block_invoke;
    v22[3] = &unk_24C88D5E0;
    v22[4] = &v23;
    objc_msgSend(v20, "performWithContext:completion:", v13, v22);
  }
  else
  {
    -[FAChecklistViewController navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pushViewController:animated:", v8, 1);

  }
  _Block_object_dispose(&v23, 8);

}

void __61__FAChecklistViewController__shareMyLocationButtonWasTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  if ((objc_msgSend(v3, "loadSuccess") & 1) == 0)
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__FAChecklistViewController__shareMyLocationButtonWasTapped___block_invoke_cold_1(v3, v6);

  }
}

- (void)_updateMedicalIDButtonWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  +[FamilyChecklistAnalytics shared](_TtC14FamilyCircleUI24FamilyChecklistAnalytics, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendEmergencyContactsAnalyticsEvent");

  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v6 = (void *)getHKMedicalIDViewControllerClass_softClass_0;
  v14 = getHKMedicalIDViewControllerClass_softClass_0;
  if (!getHKMedicalIDViewControllerClass_softClass_0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getHKMedicalIDViewControllerClass_block_invoke_0;
    v10[3] = &unk_24C88B7B0;
    v10[4] = &v11;
    __getHKMedicalIDViewControllerClass_block_invoke_0((uint64_t)v10);
    v6 = (void *)v12[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v11, 8);
  v8 = (void *)objc_msgSend([v7 alloc], "initInEditMode:", 1);
  objc_msgSend(v8, "setHealthStore:", self->_healthStore);
  objc_msgSend(v8, "setMedicalIDStore:", self->_medicalIDStore);
  objc_msgSend(v8, "setMedicalID:", self->_medicalIDData);
  objc_msgSend(v8, "setAllowsEditing:", 1);
  objc_msgSend(v8, "setShouldShowHints:", 1);
  objc_msgSend(v8, "setShowsDeleteButton:", 0);
  objc_msgSend(v8, "setShowsEditMedicalIDRowInViewMode:", 1);
  objc_msgSend(v8, "setDelegate:", self);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
  objc_msgSend(v9, "setModalInPresentation:", 1);
  -[FAChecklistViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_reviewPresetsWasTapped:(id)a3
{
  id v4;
  void *v5;
  FACircleContext *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  FACircleStateController *v17;

  v4 = a3;
  +[FamilyChecklistAnalytics shared](_TtC14FamilyCircleUI24FamilyChecklistAnalytics, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendChildSettingsAnalyticsEvent");

  v6 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeFamilyRepair"));
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = objc_alloc_init(FACircleStateController);
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend((id)v13[5], "setPresenter:", self);
  objc_msgSend((id)v13[5], "setModalPresentationStyle:", -2);
  objc_msgSend(v4, "propertyForKey:", CFSTR("childDsidKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("memberId"));

  objc_msgSend(v4, "propertyForKey:", CFSTR("childAltDsidKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("altDSID"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("FamilyChecklist"), CFSTR("requester"));
  if (objc_msgSend(v7, "count"))
    -[FACircleContext setAdditionalParameters:](v6, "setAdditionalParameters:", v7);
  v10 = (void *)v13[5];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke;
  v11[3] = &unk_24C88D430;
  v11[4] = self;
  v11[5] = &v12;
  objc_msgSend(v10, "performWithContext:completion:", v6, v11);

  _Block_object_dispose(&v12, 8);
}

void __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  if ((objc_msgSend(v3, "loadSuccess") & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke_494;
    v9[3] = &unk_24C88B7F0;
    v9[4] = v6;
    objc_msgSend(v6, "_updateScreenTimeSpecifierThen:", v9);
  }
  else
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v11 = v8;
      _os_log_impl(&dword_20DE41000, v7, OS_LOG_TYPE_DEFAULT, "Failed to fetch family repair flow %@", buf, 0xCu);

    }
  }

}

uint64_t __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke_494(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke_2;
  v4[3] = &unk_24C88B7F0;
  v4[4] = v2;
  return objc_msgSend(v2, "_updateCommunicationLimitsSpecifierThen:", v4);
}

void __53__FAChecklistViewController__reviewPresetsWasTapped___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "notifyObservable");

}

- (void)_setupCustodianTapped:(id)a3
{
  void *v4;
  AAUICustodianSetupFlowController *v5;
  AAUICustodianSetupFlowController *custodianSetupFlowController;
  id v7;

  +[FamilyChecklistAnalytics shared](_TtC14FamilyCircleUI24FamilyChecklistAnalytics, "shared", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendRecoveryContactsAnalyticsEvent");

  v5 = (AAUICustodianSetupFlowController *)objc_msgSend(objc_alloc(MEMORY[0x24BE04CD0]), "initWithAccountManager:", self->_accountManager);
  custodianSetupFlowController = self->_custodianSetupFlowController;
  self->_custodianSetupFlowController = v5;

  -[AAUICustodianSetupFlowController setDelegate:](self->_custodianSetupFlowController, "setDelegate:", self);
  -[AAUICustodianSetupFlowController start](self->_custodianSetupFlowController, "start");
  -[AAUICustodianSetupFlowController navigationController](self->_custodianSetupFlowController, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[FAChecklistViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_setupIcloudPlusWasTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FACircleContext *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  FACircleStateController *v21;

  v4 = a3;
  +[FamilyChecklistAnalytics shared](_TtC14FamilyCircleUI24FamilyChecklistAnalytics, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendIcloudPlusSharingAnalyticsEvent");

  -[FAChecklistViewController checklistStore](self, "checklistStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icloudPlusUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FACheckListHostControllerProtocol setActiveSpecifierID:](self->_checklistHostController, "setActiveSpecifierID:", v8);

    v9 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeSharedService"));
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__6;
    v20 = __Block_byref_object_dispose__6;
    v21 = objc_alloc_init(FACircleStateController);
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("FamilyChecklist"), CFSTR("requester"));
    if (objc_msgSend(v10, "count"))
      -[FACircleContext setAdditionalParameters:](v9, "setAdditionalParameters:", v10);
    -[FAChecklistViewController checklistStore](self, "checklistStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "icloudPlusUrl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FACircleContext setUrlForContext:](v9, "setUrlForContext:", v12);

    -[FAChecklistViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17[5], "setPresenter:", v13);

    objc_msgSend((id)v17[5], "setModalPresentationStyle:", -2);
    v14 = (void *)v17[5];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke;
    v15[3] = &unk_24C88D430;
    v15[4] = self;
    v15[5] = &v16;
    objc_msgSend(v14, "performWithContext:completion:", v9, v15);

    _Block_object_dispose(&v16, 8);
  }

}

void __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1216), "setActiveSpecifierID:", 0);
  if ((objc_msgSend(v3, "loadSuccess") & 1) != 0)
  {
    v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke_496;
    v8[3] = &unk_24C88B7F0;
    v8[4] = v6;
    objc_msgSend(v6, "_updateICloudPlusSpecifierThen:", v8);
  }
  else
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke_cold_1(v3, v7);

  }
}

void __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke_496(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyObservable");

}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__FAChecklistViewController_medicalIDViewControllerDidCancel___block_invoke;
  v3[3] = &unk_24C88B7F0;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __62__FAChecklistViewController_medicalIDViewControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__FAChecklistViewController_medicalIDViewControllerDidCancel___block_invoke_2;
  v3[3] = &unk_24C88B7F0;
  v3[4] = v1;
  return objc_msgSend(v1, "_updateMedicalSpecifierThen:", v3);
}

void __62__FAChecklistViewController_medicalIDViewControllerDidCancel___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyObservable");

}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__FAChecklistViewController_medicalIDViewControllerDidSave___block_invoke;
  v6[3] = &unk_24C88B958;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

uint64_t __60__FAChecklistViewController_medicalIDViewControllerDidSave___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 40), "medicalID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1008);
  *(_QWORD *)(v3 + 1008) = v2;

  v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__FAChecklistViewController_medicalIDViewControllerDidSave___block_invoke_2;
  v7[3] = &unk_24C88B7F0;
  v7[4] = v5;
  return objc_msgSend(v5, "_updateMedicalSpecifierThen:", v7);
}

void __60__FAChecklistViewController_medicalIDViewControllerDidSave___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyObservable");

}

- (void)medicalIDViewControllerDidFinish:(id)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__FAChecklistViewController_medicalIDViewControllerDidFinish___block_invoke;
  v5[3] = &unk_24C88B7F0;
  v5[4] = self;
  v4 = a3;
  -[FAChecklistViewController _updateMedicalSpecifierThen:](self, "_updateMedicalSpecifierThen:", v5);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_497);

}

void __62__FAChecklistViewController_medicalIDViewControllerDidFinish___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyObservable");

}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HKMedicalIDStore *medicalIDStore;
  _HKMedicalIDData *medicalIDData;
  _QWORD v11[5];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(getSOSUtilitiesClass_0(), "isAllowedToMessageSOSContacts") & 1) == 0)
    objc_msgSend(getSOSUtilitiesClass_0(), "setAllowedToMessageSOSContacts:", 1);
  -[_HKMedicalIDData emergencyContacts](self->_medicalIDData, "emergencyContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_HKMedicalIDData emergencyContacts](self->_medicalIDData, "emergencyContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[_HKMedicalIDData setEmergencyContacts:](self->_medicalIDData, "setEmergencyContacts:", v8);
  medicalIDStore = self->_medicalIDStore;
  medicalIDData = self->_medicalIDData;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke;
  v11[3] = &unk_24C88C530;
  v11[4] = self;
  -[HKMedicalIDStore updateMedicalIDData:completion:](medicalIDStore, "updateMedicalIDData:completion:", medicalIDData, v11);

}

void __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  if (v5)
  {
    _FALogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke_cold_1();

  }
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke_498;
    v8[3] = &unk_24C88B7F0;
    v8[4] = v7;
    objc_msgSend(v7, "_updateMedicalSpecifierThen:", v8);
  }

}

void __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke_498(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyObservable");

}

- (void)custodianSetupFlowControllerDidFinish:(id)a3
{
  id v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __67__FAChecklistViewController_custodianSetupFlowControllerDidFinish___block_invoke;
  v5[3] = &unk_24C88B7F0;
  v5[4] = self;
  v4 = a3;
  -[FAChecklistViewController _updateCustodianSpecifierThen:](self, "_updateCustodianSpecifierThen:", v5);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_500);

}

void __67__FAChecklistViewController_custodianSetupFlowControllerDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__FAChecklistViewController_custodianSetupFlowControllerDidFinish___block_invoke_2;
  block[3] = &unk_24C88B7F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __67__FAChecklistViewController_custodianSetupFlowControllerDidFinish___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  objc_msgSend(*(id *)(a1 + 32), "checklistStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyObservable");

}

- (void)reloadSpecifiers
{
  id v3;

  -[FAChecklistViewController specifiers](self, "specifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[FACheckListHostControllerProtocol setSpecifiers:](self->_checklistHostController, "setSpecifiers:", v3);

}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (FAChecklistViewControllerDelegate)delegate
{
  return (FAChecklistViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FAFamilyCircle)familyCircle
{
  return self->_familyCircle;
}

- (void)setFamilyCircle:(id)a3
{
  objc_storeStrong((id *)&self->_familyCircle, a3);
}

- (FAProfilePictureStore)profilePictureStore
{
  return self->_profilePictureStore;
}

- (void)setProfilePictureStore:(id)a3
{
  objc_storeStrong((id *)&self->_profilePictureStore, a3);
}

- (FAChecklistStore)checklistStore
{
  return self->_checklistStore;
}

- (void)setChecklistStore:(id)a3
{
  objc_storeStrong((id *)&self->_checklistStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checklistStore, 0);
  objc_storeStrong((id *)&self->_profilePictureStore, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_commLimitsForChildren, 0);
  objc_storeStrong((id *)&self->_parentalControlsForChildren, 0);
  objc_storeStrong((id *)&self->_organizerName, 0);
  objc_storeStrong((id *)&self->_navigationBarTitleLabel, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_checklistHostController, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_commLimitsModifiedRecord, 0);
  objc_storeStrong((id *)&self->_screenTimeModifiedRecord, 0);
  objc_storeStrong((id *)&self->_commLimitsModifiedDate, 0);
  objc_storeStrong((id *)&self->_screenTimeModifiedDate, 0);
  objc_storeStrong((id *)&self->_locationViewModel, 0);
  objc_storeStrong((id *)&self->_icloudPlusUrl, 0);
  objc_storeStrong((id *)&self->_membersWithLocation, 0);
  objc_storeStrong((id *)&self->_custodians, 0);
  objc_storeStrong((id *)&self->_setupClient, 0);
  objc_storeStrong((id *)&self->_custodianController, 0);
  objc_storeStrong((id *)&self->_remoteUIViewController, 0);
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_custodianSetupFlowController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_listOfChildren, 0);
  objc_storeStrong((id *)&self->_existingChildPresetResponse, 0);
  objc_storeStrong((id *)&self->_existingChildPresetRecord, 0);
  objc_storeStrong((id *)&self->_childPresetRecord, 0);
  objc_storeStrong((id *)&self->_childrenInFamily, 0);
  objc_storeStrong((id *)&self->_currEmergencyContacts, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __76__FAChecklistViewController__fetchScreenTimeModifiedDate_completionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, a3, "Failed to retrieve Screen Time state for last modified date: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __85__FAChecklistViewController__fetchCommunicationLimitsModifiedDate_completionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, a3, "Failed to retrieve Screen Time state for communication limits: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)_contactsStatusForChild:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DE41000, log, OS_LOG_TYPE_DEBUG, "Checklist: Child Contacts not Synced", v1, 2u);
}

- (void)_contactsStatusForChild:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_20DE41000, v1, OS_LOG_TYPE_ERROR, "contactCountForFetchRequest: %@ Error: %@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_contactsStatusForChild:(os_log_t)log .cold.3(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl(&dword_20DE41000, log, OS_LOG_TYPE_DEBUG, "RETRIED with shouldFailIfAccountNotYetSynced childHasContacts %i,error %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __72__FAChecklistViewController__fetchPresetsForChild_andCompletionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, a3, "Failed to fetch age appropriate preset for the child with error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __61__FAChecklistViewController__shareMyLocationButtonWasTapped___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, v4, "Failed to fetch location flow %@", v5);

}

void __55__FAChecklistViewController__setupIcloudPlusWasTapped___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, v5, "Failed to fetch iCloud+ view %@", v6);

}

void __67__FAChecklistViewController_emergencyContactFlow_didSelectContact___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, v0, v1, "Error updating medicalIDData error: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
