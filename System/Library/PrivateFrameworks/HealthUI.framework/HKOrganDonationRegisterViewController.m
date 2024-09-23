@implementation HKOrganDonationRegisterViewController

- (HKOrganDonationRegisterViewController)init
{
  HKOrganDonationRegisterViewController *v2;
  HKHealthStore *v3;
  HKHealthStore *healthStore;
  HKOrganDonationConnectionManager *v5;
  HKOrganDonationConnectionManager *connectionManager;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKOrganDonationRegisterViewController;
  v2 = -[HKOrganDonationRegisterViewController initWithStyle:](&v8, sel_initWithStyle_, 1);
  if (v2)
  {
    v3 = (HKHealthStore *)objc_alloc_init(MEMORY[0x1E0CB6780]);
    healthStore = v2->_healthStore;
    v2->_healthStore = v3;

    v5 = -[HKOrganDonationConnectionManager initWithHealthStore:]([HKOrganDonationConnectionManager alloc], "initWithHealthStore:", v2->_healthStore);
    connectionManager = v2->_connectionManager;
    v2->_connectionManager = v5;

    -[HKOrganDonationConnectionManager setDelegate:](v2->_connectionManager, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HKOrganDonationConnectionManager cleanUp](self->_connectionManager, "cleanUp");
  v4.receiver = self;
  v4.super_class = (Class)HKOrganDonationRegisterViewController;
  -[HKOrganDonationRegisterViewController dealloc](&v4, sel_dealloc);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  UIFont *v3;
  UIFont *bodyFont;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *loadingIndicator;
  UIBarButtonItem *v7;
  UIBarButtonItem *loadingIndicatorBarButtonItem;
  id v9;
  void *v10;
  void *v11;
  UIBarButtonItem *v12;
  UIBarButtonItem *updateBarButtonItem;
  void *v14;
  void *v15;
  HKOrganDonationRegisterViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)HKOrganDonationRegisterViewController;
  -[HKOrganDonationRegisterViewController viewDidLoad](&v24, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  bodyFont = self->_bodyFont;
  self->_bodyFont = v3;

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  loadingIndicator = self->_loadingIndicator;
  self->_loadingIndicator = v5;

  -[UIActivityIndicatorView setHidesWhenStopped:](self->_loadingIndicator, "setHidesWhenStopped:", 1);
  v7 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_loadingIndicator);
  loadingIndicatorBarButtonItem = self->_loadingIndicatorBarButtonItem;
  self->_loadingIndicatorBarButtonItem = v7;

  v9 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OD_UPDATE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (UIBarButtonItem *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 0, self, sel_updateButtonTapped_);
  updateBarButtonItem = self->_updateBarButtonItem;
  self->_updateBarButtonItem = v12;

  -[UIBarButtonItem setEnabled:](self->_updateBarButtonItem, "setEnabled:", 0);
  -[HKOrganDonationRegisterViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewControllers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (HKOrganDonationRegisterViewController *)objc_claimAutoreleasedReturnValue();

  if (v16 == self)
  {
    -[HKOrganDonationRegisterViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped_);
    objc_msgSend(v17, "setLeftBarButtonItem:", v18);

  }
  -[HKOrganDonationRegisterViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setKeyboardDismissMode:", 2);

  -[HKOrganDonationRegisterViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));

  -[HKOrganDonationRegisterViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v22);

  -[HKOrganDonationRegisterViewController setModalInPresentation:](self, "setModalInPresentation:", 1);
  -[HKOrganDonationRegisterViewController _loadRegistrantInformationIfAvailableAndSetupRegisterView](self, "_loadRegistrantInformationIfAvailableAndSetupRegisterView");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObserver:selector:name:object:", self, sel__handleAppWillEnterForegroundNotification_, *MEMORY[0x1E0DC4860], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKOrganDonationRegisterViewController;
  -[HKOrganDonationRegisterViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[HKOrganDonationRegisterViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setHidesShadow:", 1);

  -[HKOrganDonationRegisterViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBarTintColor:", v8);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKOrganDonationRegisterViewController;
  -[HKOrganDonationRegisterViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[HKOrganDonationRegisterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 0);

}

- (id)_createTableHeaderView
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double Width;
  HKTitledLogoBuddyHeaderView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGRect v22;

  -[HKOrganDonationRegisterViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIRoundToViewScale();
  v5 = v4;

  -[HKOrganDonationRegisterViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  Width = CGRectGetWidth(v22);

  v8 = -[HKTitledLogoBuddyHeaderView initWithTopInset:linkButtonTitle:]([HKTitledLogoBuddyHeaderView alloc], "initWithTopInset:linkButtonTitle:", 0, v5);
  -[HKTitledLogoBuddyHeaderView widthAnchor](v8, "widthAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", Width);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)MEMORY[0x1E0DC3870];
  HKHealthUIFrameworkBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageNamed:inBundle:", CFSTR("donate_life_logo"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledLogoBuddyHeaderView setLogoImage:](v8, "setLogoImage:", v13);

  LODWORD(v13) = +[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((_DWORD)v13)
    v16 = CFSTR("OD_CHANGE_DELETE");
  else
    v16 = CFSTR("OD_REGISTER_MY_INFO");
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledBuddyHeaderView setTitleText:](v8, "setTitleText:", v17);

  if (!self->_isUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OD_PERSONAL_INFO_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKTitledBuddyHeaderView setBodyText:](v8, "setBodyText:", v19);

  }
  -[HKTitledLogoBuddyHeaderView layoutIfNeeded](v8, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTitledLogoBuddyHeaderView setBackgroundColor:](v8, "setBackgroundColor:", v20);

  return v8;
}

- (id)_createTableFooterView
{
  id v3;
  void *v4;
  double Width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIButton *v10;
  UIButton *continueButton;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  void *v17;
  CGRect v19;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[HKOrganDonationRegisterViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  Width = CGRectGetWidth(v19);

  v6 = (void *)MEMORY[0x1E0DC3518];
  HKHealthKeyColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OD_REGISTER_CONTINUE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_multiLineRoundRectButtonTintedWithColor:title:target:action:", v7, v9, self, sel_nextButtonTapped_);
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v10;

  objc_msgSend(v3, "addSubview:", self->_continueButton);
  v12 = (id)objc_msgSend(v3, "hk_addEqualsConstraintWithItem:attribute:relatedTo:constant:", self->_continueButton, 9, v3, 0.0);
  v13 = (id)objc_msgSend(v3, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_continueButton, 3, v3, 3, 32.0);
  v14 = (id)objc_msgSend(v3, "hk_addEqualsConstraintWithItem:attribute:relatedTo:attribute:constant:", self->_continueButton, 4, v3, 4, -24.0);
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", Width, 1.79769313e308);
  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v15, v16);
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v17);

  return v3;
}

- (void)_setupRegisterViewWithRegistrant:(id)a3
{
  -[HKOrganDonationRegisterViewController _setupRegisterViewWithRegistrant:demographicsInformation:](self, "_setupRegisterViewWithRegistrant:demographicsInformation:", a3, 0);
}

- (void)_setupRegisterViewWithRegistrant:(id)a3 demographicsInformation:(id)a4
{
  HKOrganDonationRegistrant *v6;
  HKOrganDonationRegistrant *v7;
  void *v8;
  void *v9;
  NSArray *dataEntryItems;
  HKOrganDonationRegistrant *registrant;
  HKOrganDonationRegistrant *v12;
  UIView *v13;
  UIView *headerView;
  UIView *v15;
  UIView *footerView;
  id v17;

  v6 = (HKOrganDonationRegistrant *)a3;
  self->_isUpdate = 1;
  if (v6)
  {
    v7 = v6;
    -[HKOrganDonationRegisterViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  }
  else
  {
    self->_isUpdate = 0;
    +[HKOrganDonationRegistrant organDonationRegistrantWithDemographicsInformation:](HKOrganDonationRegistrant, "organDonationRegistrantWithDemographicsInformation:", a4);
    v7 = (HKOrganDonationRegistrant *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationRegisterViewController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  dataEntryItems = self->_dataEntryItems;
  self->_dataEntryItems = 0;

  registrant = self->_registrant;
  self->_registrant = v7;
  v12 = v7;

  -[HKOrganDonationRegistrant setDelegate:](self->_registrant, "setDelegate:", self);
  -[HKOrganDonationRegisterViewController _toggleLoadingStatusIsLoading:](self, "_toggleLoadingStatusIsLoading:", 0);
  -[HKOrganDonationRegisterViewController _createTableHeaderView](self, "_createTableHeaderView");
  v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  headerView = self->_headerView;
  self->_headerView = v13;

  -[HKOrganDonationRegisterViewController _createTableFooterView](self, "_createTableFooterView");
  v15 = (UIView *)objc_claimAutoreleasedReturnValue();
  footerView = self->_footerView;
  self->_footerView = v15;

  -[HKOrganDonationRegisterViewController _toggleNextButtonEnabledState](self, "_toggleNextButtonEnabledState");
  -[HKOrganDonationRegisterViewController tableView](self, "tableView");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reloadData");

}

- (void)_toggleLoadingStatusIsLoading:(BOOL)a3
{
  void *v4;
  void *v5;

  self->_isLoading = a3;
  if (a3)
  {
    -[HKOrganDonationRegisterViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", self->_loadingIndicatorBarButtonItem);

    -[UIActivityIndicatorView startAnimating](self->_loadingIndicator, "startAnimating");
  }
  else
  {
    if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))
    {
      -[HKOrganDonationRegisterViewController navigationItem](self, "navigationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRightBarButtonItem:", self->_updateBarButtonItem);

    }
    -[UIActivityIndicatorView stopAnimating](self->_loadingIndicator, "stopAnimating");
  }
  -[HKOrganDonationRegisterViewController _toggleNextButtonEnabledState](self, "_toggleNextButtonEnabledState");
}

- (void)_loadRegistrantInformationIfAvailableAndSetupRegisterView
{
  -[HKOrganDonationRegisterViewController _toggleLoadingStatusIsLoading:](self, "_toggleLoadingStatusIsLoading:", 1);
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant"))
  {
    -[HKOrganDonationRegisterViewController _reloadRegistrantInformationFromServer](self, "_reloadRegistrantInformationFromServer");
  }
  else
  {
    -[HKOrganDonationRegisterViewController _setupRegisterViewWithDefaultDemographicsInformation](self, "_setupRegisterViewWithDefaultDemographicsInformation");
  }
}

- (void)_handleResponse:(id)a3 status:(int64_t)a4
{
  id v6;
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
  id *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;

  v6 = a3;
  -[HKOrganDonationRegisterViewController _toggleLoadingStatusIsLoading:](self, "_toggleLoadingStatusIsLoading:", 0);
  switch(a4)
  {
    case 0:
      +[HKOrganDonationRegistrant organDonationRegistrantWithJSONDictionary:](HKOrganDonationRegistrant, "organDonationRegistrantWithJSONDictionary:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationRegisterViewController _setupRegisterViewWithRegistrant:](self, "_setupRegisterViewWithRegistrant:", v12);
      goto LABEL_9;
    case 1:
    case 2:
      v7 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OD_INVALID_TOKEN_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OD_INVALID_TOKEN_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OD_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v16);

      -[HKOrganDonationRegisterViewController _setupRegisterViewWithDefaultDemographicsInformation](self, "_setupRegisterViewWithDefaultDemographicsInformation");
      if (!v12)
        break;
      goto LABEL_8;
    case 3:
      v17 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OD_NO_NETWORK_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OD_NO_NETWORK_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v19, v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v22 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OD_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __64__HKOrganDonationRegisterViewController__handleResponse_status___block_invoke;
      v35[3] = &unk_1E9C43CA8;
      v25 = &v36;
      objc_copyWeak(&v36, &location);
      objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, v35);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v26);
      goto LABEL_7;
    case 4:
      v27 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("OD_GENERIC_FAILURE_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("OD_GENERIC_FAILURE_BODY"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v29, v31, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(&location, self);
      v32 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OD_ALERT_OK"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __64__HKOrganDonationRegisterViewController__handleResponse_status___block_invoke_2;
      v33[3] = &unk_1E9C43CA8;
      v25 = &v34;
      objc_copyWeak(&v34, &location);
      objc_msgSend(v32, "actionWithTitle:style:handler:", v24, 0, v33);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v26);
LABEL_7:

      objc_destroyWeak(v25);
      objc_destroyWeak(&location);
      if (v12)
      {
LABEL_8:
        -[HKOrganDonationRegisterViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
LABEL_9:

      }
      break;
    default:
      break;
  }

}

void __64__HKOrganDonationRegisterViewController__handleResponse_status___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    WeakRetained = v2;
  }

}

void __64__HKOrganDonationRegisterViewController__handleResponse_status___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);
    WeakRetained = v2;
  }

}

- (void)_setupRegisterViewWithDefaultDemographicsInformation
{
  HKHealthStore *healthStore;
  _QWORD v3[5];

  healthStore = self->_healthStore;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __93__HKOrganDonationRegisterViewController__setupRegisterViewWithDefaultDemographicsInformation__block_invoke;
  v3[3] = &unk_1E9C43CD0;
  v3[4] = self;
  -[HKHealthStore hk_fetchExistingDemographicInformationWithCompletion:](healthStore, "hk_fetchExistingDemographicInformationWithCompletion:", v3);
}

uint64_t __93__HKOrganDonationRegisterViewController__setupRegisterViewWithDefaultDemographicsInformation__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupRegisterViewWithRegistrant:demographicsInformation:", 0, a2);
}

- (NSArray)dataEntryItems
{
  void *dataEntryItems;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dataEntryItems = self->_dataEntryItems;
  if (!dataEntryItems)
  {
    dataEntryItems = self->_registrant;
    if (dataEntryItems)
    {
      objc_msgSend(dataEntryItems, "dataEntryItemsValidOnly:", 0);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v5 = self->_dataEntryItems;
      self->_dataEntryItems = v4;

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v6 = self->_dataEntryItems;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setToolbarDelegate:", self, (_QWORD)v12);
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

      dataEntryItems = self->_dataEntryItems;
    }
  }
  return (NSArray *)dataEntryItems;
}

- (void)_toggleNextButtonEnabledState
{
  UIBarButtonItem *updateBarButtonItem;
  _BOOL8 v4;
  _BOOL8 v5;
  UIButton *continueButton;
  id v7;

  if (self->_isUpdate)
  {
    updateBarButtonItem = self->_updateBarButtonItem;
    v4 = -[HKOrganDonationRegistrant hasEdits](self->_registrant, "hasEdits")
      && -[HKOrganDonationRegistrant isRegistrantValid](self->_registrant, "isRegistrantValid")
      && !self->_isLoading;
    -[UIBarButtonItem setEnabled:](updateBarButtonItem, "setEnabled:", v4);
  }
  else
  {
    v5 = (-[HKOrganDonationRegisterViewController _registrantIsUnderAge](self, "_registrantIsUnderAge")
       || -[HKOrganDonationRegistrant isRegistrantValid](self->_registrant, "isRegistrantValid"))
      && !self->_isLoading;
    -[UIButton setEnabled:](self->_continueButton, "setEnabled:", v5);
    continueButton = self->_continueButton;
    if (v5)
      HKHealthKeyColor();
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_appInteractionDisabledColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton setBackgroundColor:](continueButton, "setBackgroundColor:", v7);

  }
}

- (BOOL)_registrantIsUnderAge
{
  void *v2;
  BOOL v3;

  -[HKOrganDonationRegistrant age](self->_registrant, "age");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "compare:", &unk_1E9CECA88) == -1;

  return v3;
}

- (void)_headerTapped:(id)a3
{
  -[HKOrganDonationConnectionManager openRegisterMeSiteInSafariIfAuthenticated](self->_connectionManager, "openRegisterMeSiteInSafariIfAuthenticated", a3);
}

- (void)_reloadRegistrantInformationFromServer
{
  HKOrganDonationConnectionManager *connectionManager;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  connectionManager = self->_connectionManager;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__HKOrganDonationRegisterViewController__reloadRegistrantInformationFromServer__block_invoke;
  v4[3] = &unk_1E9C43CF8;
  objc_copyWeak(&v5, &location);
  -[HKOrganDonationConnectionManager reloadRegistrantWithCompletion:](connectionManager, "reloadRegistrantWithCompletion:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __79__HKOrganDonationRegisterViewController__reloadRegistrantInformationFromServer__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_handleResponse:status:", v7, a3);

}

- (void)_handleAppWillEnterForegroundNotification:(id)a3
{
  if (+[HKOrganDonationConnectionManager hasStoredRegistrant](HKOrganDonationConnectionManager, "hasStoredRegistrant", a3))
  {
    -[HKOrganDonationRegisterViewController _toggleLoadingStatusIsLoading:](self, "_toggleLoadingStatusIsLoading:", 1);
    -[HKOrganDonationRegisterViewController _reloadRegistrantInformationFromServer](self, "_reloadRegistrantInformationFromServer");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  UIFont *v9;
  UIFont *bodyFont;
  _QWORD block[5];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKOrganDonationRegisterViewController;
  -[HKOrganDonationRegisterViewController traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[HKOrganDonationRegisterViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
      v9 = (UIFont *)objc_claimAutoreleasedReturnValue();
      bodyFont = self->_bodyFont;
      self->_bodyFont = v9;

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__HKOrganDonationRegisterViewController_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E9C3F0D0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }

}

void __66__HKOrganDonationRegisterViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v3;

  v3 = 3;
  if (self->_isLoading)
    v3 = 0;
  if (self->_isUpdate)
    return v3;
  else
    return !self->_isLoading;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (a4)
    return 1;
  -[HKOrganDonationRegisterViewController dataEntryItems](self, "dataEntryItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  objc_class *v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == 2)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessoryType:", 1);
    objc_msgSend(v11, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("OD_REMOVE_FROM_REGISTRY");
LABEL_7:
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v15);

    goto LABEL_10;
  }
  if (v8 == 1)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("Cell"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessoryType:", 0);
    objc_msgSend(v11, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("OD_EDIT_PREFERENCE");
    goto LABEL_7;
  }
  if (v8)
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HKErrorTableViewCell(v10);
  }
  else
  {
    -[HKOrganDonationRegisterViewController dataEntryItems](self, "dataEntryItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "cell");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  _BOOL4 isUpdate;
  UIFont *bodyFont;
  double v6;
  double result;

  isUpdate = self->_isUpdate;
  bodyFont = self->_bodyFont;
  v6 = 44.0;
  if (!isUpdate)
    v6 = 60.0;
  -[UIFont _scaledValueForValue:](bodyFont, "_scaledValueForValue:", a3, a4, v6);
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  HKOrganDonationConfirmDeleteViewController *v9;
  HKOrganDonationConfirmDeleteViewController *v10;
  HKOrganDonationConnectionManager *connectionManager;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "section");
  switch(v7)
  {
    case 2:
      v10 = [HKOrganDonationConfirmDeleteViewController alloc];
      connectionManager = self->_connectionManager;
      -[HKOrganDonationRegisterViewController medicalIDData](self, "medicalIDData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HKOrganDonationConfirmDeleteViewController initWithConnectionManager:medicalIDData:](v10, "initWithConnectionManager:medicalIDData:", connectionManager, v12);

      -[HKOrganDonationRegisterViewController registrationCompletionHandler](self, "registrationCompletionHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationBaseViewController setRegistrationCompletionHandler:](v9, "setRegistrationCompletionHandler:", v13);

      -[HKOrganDonationRegisterViewController completionButtonTitle](self, "completionButtonTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOrganDonationBaseViewController setCompletionButtonTitle:](v9, "setCompletionButtonTitle:", v14);

      -[HKOrganDonationRegisterViewController navigationController](self, "navigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pushViewController:animated:", v9, 1);

      goto LABEL_6;
    case 1:
      -[HKOrganDonationConnectionManager openRegisterMeSiteInSafariIfAuthenticated](self->_connectionManager, "openRegisterMeSiteInSafariIfAuthenticated");
      break;
    case 0:
      objc_msgSend(v16, "deselectRowAtIndexPath:animated:", v6, 1);
      -[HKOrganDonationRegisterViewController dataEntryItems](self, "dataEntryItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
      v9 = (HKOrganDonationConfirmDeleteViewController *)objc_claimAutoreleasedReturnValue();

      -[HKOrganDonationConfirmDeleteViewController beginEditing](v9, "beginEditing");
LABEL_6:

      break;
  }

}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  CGRect v7;

  if (a4)
    return 0.0;
  -[UIView frame](self->_headerView, "frame", a3, v4, v5);
  return CGRectGetHeight(v7);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  UIView *v4;

  if (a4)
    v4 = 0;
  else
    v4 = self->_headerView;
  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  CGRect v5;

  if (self->_isUpdate)
    return 0.0;
  -[UIView frame](self->_footerView, "frame", a3, a4);
  return CGRectGetHeight(v5);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  if (self->_isUpdate)
    return 0;
  else
    return self->_footerView;
}

- (void)dataEntryItemDonePressed:(id)a3
{
  id v3;

  -[HKOrganDonationRegisterViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 0);

}

- (void)dataEntryItemPrevPressed:(id)a3
{
  uint64_t v4;

  v4 = -[NSArray indexOfObject:](self->_dataEntryItems, "indexOfObject:", a3);
  if (v4 <= 0)
    v4 = -[NSArray count](self->_dataEntryItems, "count");
  -[HKOrganDonationRegisterViewController focusItemAtIndex:](self, "focusItemAtIndex:", v4 - 1);
}

- (void)dataEntryItemNextPressed:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;

  v4 = -[NSArray indexOfObject:](self->_dataEntryItems, "indexOfObject:", a3);
  if (v4 + 1 < -[NSArray count](self->_dataEntryItems, "count"))
    v5 = v4 + 1;
  else
    v5 = 0;
  -[HKOrganDonationRegisterViewController focusItemAtIndex:](self, "focusItemAtIndex:", v5);
}

- (void)focusItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[NSArray objectAtIndexedSubscript:](self->_dataEntryItems, "objectAtIndexedSubscript:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "beginEditing");
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationRegisterViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scrollToRowAtIndexPath:atScrollPosition:animated:", v5, 3, 1);

}

- (void)nextButtonTapped:(id)a3
{
  void *v4;
  HKOrganDonationUnderageViewController *v5;
  void *v6;
  HKOrganDonationConfirmationViewController *v7;
  HKOrganDonationRegistrant *registrant;
  void *v9;
  void *v10;
  void *v11;
  HKOrganDonationUnderageViewController *v12;

  -[HKOrganDonationRegisterViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 0);

  if (-[HKOrganDonationRegisterViewController _registrantIsUnderAge](self, "_registrantIsUnderAge"))
  {
    v5 = [HKOrganDonationUnderageViewController alloc];
    -[HKOrganDonationRegisterViewController medicalIDData](self, "medicalIDData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HKOrganDonationBaseViewController initWithMedicalIDData:](v5, "initWithMedicalIDData:", v6);

  }
  else
  {
    v7 = [HKOrganDonationConfirmationViewController alloc];
    registrant = self->_registrant;
    -[HKOrganDonationRegisterViewController medicalIDData](self, "medicalIDData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HKOrganDonationConfirmationViewController initWithRegistrant:medicalIDData:connectionManager:](v7, "initWithRegistrant:medicalIDData:connectionManager:", registrant, v9, self->_connectionManager);

  }
  -[HKOrganDonationRegisterViewController completionButtonTitle](self, "completionButtonTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOrganDonationBaseViewController setCompletionButtonTitle:](v12, "setCompletionButtonTitle:", v10);

  -[HKOrganDonationBaseViewController setRegistrationCompletionHandler:](v12, "setRegistrationCompletionHandler:", self->_registrationCompletionHandler);
  -[HKOrganDonationRegisterViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pushViewController:animated:", v12, 1);

}

- (void)cancelButtonTapped:(id)a3
{
  void (**registrationCompletionHandler)(id, _QWORD, id);

  registrationCompletionHandler = (void (**)(id, _QWORD, id))self->_registrationCompletionHandler;
  if (registrationCompletionHandler)
    registrationCompletionHandler[2](registrationCompletionHandler, 0, a3);
  -[HKOrganDonationRegisterViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)updateButtonTapped:(id)a3
{
  HKOrganDonationConfirmUpdateViewController *v4;
  HKOrganDonationRegistrant *registrant;
  void *v6;
  void *v7;
  HKOrganDonationConfirmUpdateViewController *v8;

  v4 = [HKOrganDonationConfirmUpdateViewController alloc];
  registrant = self->_registrant;
  -[HKOrganDonationRegisterViewController medicalIDData](self, "medicalIDData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKOrganDonationConfirmUpdateViewController initWithRegistrant:medicalIDData:connectionManager:](v4, "initWithRegistrant:medicalIDData:connectionManager:", registrant, v6, self->_connectionManager);

  -[HKOrganDonationRegisterViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)organDonationConnectionManagerDidStoreCredential:(id)a3
{
  -[_HKMedicalIDData setIsOrganDonor:](self->_medicalIDData, "setIsOrganDonor:", &unk_1E9CECAA0);
  -[HKHealthStore updateMedicalIDData:](self->_healthStore, "updateMedicalIDData:", self->_medicalIDData);
}

- (void)organDonationConnectionManagerDidRemoveCredential:(id)a3
{
  -[_HKMedicalIDData setIsOrganDonor:](self->_medicalIDData, "setIsOrganDonor:", 0);
  -[HKHealthStore updateMedicalIDData:](self->_healthStore, "updateMedicalIDData:", self->_medicalIDData);
}

- (void)submitOrganDonationFlowImpressionEvent:(int)a3
{
  HKOrganDonationFlowImpressionAnalyticEvent *v4;
  void *v5;
  uint64_t v6;

  v4 = -[HKOrganDonationFlowImpressionAnalyticEvent initWithImpressionEvent:]([HKOrganDonationFlowImpressionAnalyticEvent alloc], "initWithImpressionEvent:", *(_QWORD *)&a3);
  -[HKOrganDonationConnectionManager analyticsEventSubmissionManager](self->_connectionManager, "analyticsEventSubmissionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v5, "submitEvent:error:", v4, &v6);

}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDData, a3);
}

- (HKOrganDonationRegistrant)registrant
{
  return self->_registrant;
}

- (void)setRegistrant:(id)a3
{
  objc_storeStrong((id *)&self->_registrant, a3);
}

- (NSString)completionButtonTitle
{
  return self->_completionButtonTitle;
}

- (void)setCompletionButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_completionButtonTitle, a3);
}

- (id)registrationCompletionHandler
{
  return self->_registrationCompletionHandler;
}

- (void)setRegistrationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1120);
}

- (void)setDataEntryItems:(id)a3
{
  objc_storeStrong((id *)&self->_dataEntryItems, a3);
}

- (UIBarButtonItem)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
  objc_storeStrong((id *)&self->_nextButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
  objc_storeStrong(&self->_registrationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_completionButtonTitle, 0);
  objc_storeStrong((id *)&self->_registrant, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_bodyFont, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_updateBarButtonItem, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorBarButtonItem, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_connectionManager, 0);
}

@end
