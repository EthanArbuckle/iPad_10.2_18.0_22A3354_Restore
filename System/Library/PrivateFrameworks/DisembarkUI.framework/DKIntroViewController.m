@implementation DKIntroViewController

- (DKIntroViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DKIntroViewController *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("INTRO_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INTRO_DETAIL"), &stru_24F20EA28, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)DKIntroViewController;
  v7 = -[DKIntroViewController initWithTitle:detailText:icon:contentLayout:](&v9, sel_initWithTitle_detailText_icon_contentLayout_, v4, v6, 0, 2);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)DKIntroViewController;
  -[OBBaseWelcomeController viewDidLoad](&v19, sel_viewDidLoad);
  -[DKIntroViewController notableUserData](self, "notableUserData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

LABEL_4:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("INTRO_DETAIL_WITH_APPLE_ACCOUNT"), &stru_24F20EA28, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[DKIntroViewController headerView](self, "headerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDetailText:", v8);

    goto LABEL_5;
  }
  -[DKIntroViewController notableUserData](self, "notableUserData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "findMyEnabled");

  if (v6)
    goto LABEL_4;
LABEL_5:
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidesBackButton:", 1);

  -[DKIntroViewController _addNotableUserDataItemsView](self, "_addNotableUserDataItemsView");
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24F20EA28, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitle:forState:", v13, 0);

  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__continueTapped_, 64);
  -[DKIntroViewController buttonTray](self, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addButton:", v11);

  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_24F20EA28, CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:forState:", v17, 0);

  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, sel__notNowTapped_, 64);
  -[DKIntroViewController buttonTray](self, "buttonTray");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addButton:", v15);

}

- (void)_addNotableUserDataItemsView
{
  id v3;
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
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setAxis:", 1);
  objc_msgSend(v4, "setSpacing:", 10.0);
  -[DKIntroViewController notableUserData](self, "notableUserData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKIntroViewController _createNotableUserDataCardForAppsAndData:](self, "_createNotableUserDataCardForAppsAndData:", objc_msgSend(v5, "dataSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v6);

  -[DKIntroViewController notableUserData](self, "notableUserData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKIntroViewController _createNotableUserDataCardForAccounts:](self, "_createNotableUserDataCardForAccounts:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v9);

  -[DKIntroViewController notableUserData](self, "notableUserData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKIntroViewController _createNotableUserDataCardForFindMy:](self, "_createNotableUserDataCardForFindMy:", objc_msgSend(v10, "findMyEnabled"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v11);

  -[DKIntroViewController notableUserData](self, "notableUserData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "walletData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKIntroViewController _createNotableUserDataCardForWallet:](self, "_createNotableUserDataCardForWallet:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v14);

  -[DKIntroViewController notableUserData](self, "notableUserData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cellularPlans");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKIntroViewController _createNotableUserDataCardForCellularPlans:](self, "_createNotableUserDataCardForCellularPlans:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v17);

  -[DKIntroViewController contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v4);

  -[DKIntroViewController contentView](self, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKIntroViewController contentView](self, "contentView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v33;
  -[DKIntroViewController contentView](self, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v29;
  -[DKIntroViewController contentView](self, "contentView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v22;
  -[DKIntroViewController contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraints:", v27);

}

- (id)_createNotableUserDataCardForAccounts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  DKNotableUserDataCardView *v13;
  void *v14;
  void *v15;
  DKNotableUserDataCardView *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  DKNotableUserDataCardCell *v25;
  void *v26;
  void *v27;
  DKNotableUserDataCardCell *v28;
  void *v30;
  id v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "profilePicture");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v10), "username");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x24BDD1640], "localizedStringByJoiningStrings:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [DKNotableUserDataCardView alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("APPLE_ACCOUNT"), &stru_24F20EA28, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DKNotableUserDataCardView initWithTitle:subtitle:icon:](v13, "initWithTitle:subtitle:icon:", v15, v12, v32);

    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      v30 = v12;
      v31 = v3;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = v6;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v35;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v35 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
            v22 = objc_alloc(MEMORY[0x24BDF6AE8]);
            objc_msgSend(v21, "profilePicture");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)objc_msgSend(v22, "initWithImage:", v23);

            v25 = [DKNotableUserDataCardCell alloc];
            objc_msgSend(v21, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "username");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[DKNotableUserDataCardCell initWithTitle:subtitle:accessoryView:](v25, "initWithTitle:subtitle:accessoryView:", v26, v27, v24);

            -[DKNotableUserDataCardView addCardCell:](v16, "addCardCell:", v28);
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v18);
      }

      v12 = v30;
      v3 = v31;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_createNotableUserDataCardForFindMy:(BOOL)a3
{
  DKNotableUserDataCardView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DKNotableUserDataCardView *v9;
  DKNotableUserDataCardCell *v10;
  void *v11;
  void *v12;
  DKNotableUserDataCardCell *v13;

  if (a3)
  {
    v3 = [DKNotableUserDataCardView alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("FIND_MY"), &stru_24F20EA28, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_LOCK"), &stru_24F20EA28, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("findmy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DKNotableUserDataCardView initWithTitle:subtitle:icon:](v3, "initWithTitle:subtitle:icon:", v5, v7, v8);

    v10 = [DKNotableUserDataCardCell alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("FIND_MY_DESCRIPTION"), &stru_24F20EA28, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[DKNotableUserDataCardCell initWithTitle:subtitle:accessoryView:](v10, "initWithTitle:subtitle:accessoryView:", 0, v12, 0);

    -[DKNotableUserDataCardView addCardCell:](v9, "addCardCell:", v13);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_createNotableUserDataCardForWallet:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  DKNotableUserDataWalletCardView *v11;
  void *v12;
  void *v13;
  void *v14;
  DKNotableUserDataWalletCardView *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  DKNotableUserDataWalletCardCell *v25;
  id v26;
  void *v27;
  void *v28;
  DKNotableUserDataWalletCardCell *v29;
  void *v30;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "walletCards");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("WALLET_ITEMS"), &stru_24F20EA28, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "walletCards");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"));
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = [DKNotableUserDataWalletCardView alloc];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("APPLE_WALLET"), &stru_24F20EA28, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("wallet"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)v10;
    v15 = -[DKNotableUserDataWalletCardView initWithTitle:subtitle:icon:](v11, "initWithTitle:subtitle:icon:", v13, v10, v14);

    objc_msgSend(v3, "paymentProvisioningContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v15);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v3, "walletCards");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v20);
          v22 = objc_alloc(MEMORY[0x24BDF6AE8]);
          objc_msgSend(v3, "passSnapshotForCredential:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v22, "initWithImage:", v23);

          objc_msgSend(v24, "setContentMode:", 1);
          objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v25 = [DKNotableUserDataWalletCardCell alloc];
          objc_msgSend(v21, "title");
          v26 = v3;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "subtitle");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = -[DKNotableUserDataWalletCardCell initWithTitle:subtitle:accessoryView:](v25, "initWithTitle:subtitle:accessoryView:", v27, v28, v24);

          v3 = v26;
          objc_msgSend(v21, "uniqueIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[DKNotableUserDataWalletCardCell setUniqueIdentifier:](v29, "setUniqueIdentifier:", v30);

          -[DKNotableUserDataWalletCardView addCardCell:](v15, "addCardCell:", v29);
          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v18);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_createNotableUserDataCardForCellularPlans:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  DKNotableUserDataCardView *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  const __CFString *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  DKNotableUserDataCardView *v41;
  void *v42;
  DKNotableUserDataCardCell *v43;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  id obj;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v50 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v47 = v3;
    obj = v3;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    v48 = v4;
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v52;
      v8 = 1;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v52 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          if (objc_msgSend(v10, "isTransferred")
            || (objc_msgSend(v10, "phoneNumber"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = objc_msgSend(v11, "length"),
                v11,
                !v12))
          {
            objc_msgSend(v10, "carrierName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v14);
          }
          else
          {
            v13 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CARRIER_WITH_PHONE_NUMBER"), &stru_24F20EA28, CFSTR("Localizable"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "carrierName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "phoneNumber");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringWithFormat:", v15, v16, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v18);

            v4 = v48;
          }

          objc_msgSend(v10, "carrierName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v19);

          v8 &= objc_msgSend(v10, "isTransferred");
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 1;
    }

    v21 = (void *)MEMORY[0x24BDD1640];
    objc_msgSend(v4, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");
    objc_msgSend(v21, "localizedStringByJoiningStrings:", v24);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD1640];
    objc_msgSend(v50, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    objc_msgSend(v25, "localizedStringByJoiningStrings:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(obj, "count");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30 == 1)
    {
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN"), &stru_24F20EA28, CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = CFSTR("CELLULAR_PLAN_DESCRIPTION_SINGULAR");
      v35 = CFSTR("CELLULAR_PLAN_TRANSFER_DESCRIPTION_SINGULAR");
    }
    else
    {
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLANS"), &stru_24F20EA28, CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = CFSTR("CELLULAR_PLAN_DESCRIPTION_PLURAL");
      v35 = CFSTR("CELLULAR_PLAN_TRANSFER_DESCRIPTION_PLURAL");
    }
    if (v8)
      v34 = (__CFString *)v35;
    v3 = v47;
    v36 = v34;
    v37 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localizedStringForKey:value:table:", v36, &stru_24F20EA28, CFSTR("Localizable"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) != 0)
      objc_msgSend(v37, "stringWithFormat:", v39, v46, v45);
    else
      objc_msgSend(v37, "stringWithFormat:", v39, v29, v46);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = [DKNotableUserDataCardView alloc];
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("antenna.radiowaves.left.and.right"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[DKNotableUserDataCardView initWithTitle:subtitle:icon:](v41, "initWithTitle:subtitle:icon:", v33, &stru_24F20EA28, v42);

    v43 = -[DKNotableUserDataCardCell initWithTitle:subtitle:accessoryView:]([DKNotableUserDataCardCell alloc], "initWithTitle:subtitle:accessoryView:", 0, v40, 0);
    -[DKNotableUserDataCardView addCardCell:](v20, "addCardCell:", v43);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_createNotableUserDataCardForAppsAndData:(int64_t)a3
{
  void *v3;
  DKNotableUserDataCardView *v4;
  void *v5;
  void *v6;
  void *v7;
  DKNotableUserDataCardView *v8;

  NSLocalizedFileSizeDescription();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [DKNotableUserDataCardView alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("APPS_AND_DATA"), &stru_24F20EA28, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("internaldrive"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DKNotableUserDataCardView initWithTitle:subtitle:icon:](v4, "initWithTitle:subtitle:icon:", v6, v3, v7);

  return v8;
}

- (void)_presentLocalDataWarning:(id)a3
{
  id v4;
  _QWORD *v5;
  void (*v6)(_QWORD *, _QWORD *);
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[DKIntroViewController fetchRestoreState](self, "fetchRestoreState");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__DKIntroViewController__presentLocalDataWarning___block_invoke;
  v8[3] = &unk_24F20E248;
  v8[4] = self;
  v9 = v4;
  v6 = (void (*)(_QWORD *, _QWORD *))v5[2];
  v7 = v4;
  v6(v5, v8);

}

uint64_t __50__DKIntroViewController__presentLocalDataWarning___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_presentRestoreWarning:", *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_presentRestoreWarning:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RESTORE_IN_PROGRESS_ALERT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESTORE_IN_PROGRESS_ALERT_MESSAGE"), &stru_24F20EA28, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v18, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ERASE_ANYWAY"), &stru_24F20EA28, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__DKIntroViewController__presentRestoreWarning___block_invoke;
  v19[3] = &unk_24F20DFE8;
  v20 = v4;
  v12 = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 2, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  -[DKIntroViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __48__DKIntroViewController__presentRestoreWarning___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_presentBasebandDeadWarning:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
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
  _QWORD v29[4];
  void (**v30)(_QWORD);
  _QWORD v31[5];

  v4 = (void (**)(_QWORD))a3;
  if (-[DKIntroViewController isBasebandDead](self, "isBasebandDead"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_BASEBAND_DEAD_ALERT_TITLE"), &stru_24F20EA28, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_BASEBAND_DEAD_ALERT_MESSAGE"), &stru_24F20EA28, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[DKIntroViewController preventOpeningSafari](self, "preventOpeningSafari"))
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_BASEBAND_DEAD_WEB_LINK"), &stru_24F20EA28, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("\n\n%@"), v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[DKIntroViewController preventOpeningSafari](self, "preventOpeningSafari");
    v14 = MEMORY[0x24BDAC760];
    if (!v13)
    {
      v15 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_24F20EA28, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v14;
      v31[1] = 3221225472;
      v31[2] = __53__DKIntroViewController__presentBasebandDeadWarning___block_invoke;
      v31[3] = &unk_24F20DE68;
      v31[4] = self;
      objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, v31);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v18);

    }
    v19 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ERASE_ANYWAY"), &stru_24F20EA28, CFSTR("Localizable"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v14;
    v23 = (void *)v21;
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __53__DKIntroViewController__presentBasebandDeadWarning___block_invoke_2;
    v29[3] = &unk_24F20DFE8;
    v30 = v4;
    objc_msgSend(v19, "actionWithTitle:style:handler:", v23, 2, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v24);

    v25 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v28);

    -[DKIntroViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
  }
  else
  {
    v4[2](v4);
  }

}

void __53__DKIntroViewController__presentBasebandDeadWarning___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("TELEPHONY_BASEBAND_DEAD_HTTPS_WEB_LINK"), &stru_24F20EA28, CFSTR("Localizable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:options:completionHandler:", v3, MEMORY[0x24BDBD1B8], 0);

}

uint64_t __53__DKIntroViewController__presentBasebandDeadWarning___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)localPaymentCards
{
  void *v2;
  void *v3;
  void *v4;

  -[DKIntroViewController notableUserData](self, "notableUserData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "walletData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localPaymentCards");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_presentLocalPaymentCardConfirmation:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t (**v6)(void);
  int v7;
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
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  void (**v33)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[DKIntroViewController localPaymentCards](self, "localPaymentCards");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {

    goto LABEL_7;
  }
  -[DKIntroViewController hasInternetConnectivity](self, "hasInternetConnectivity");
  v6 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v7 = v6[2]();

  if (v7)
  {
LABEL_7:
    v4[2](v4);
    goto LABEL_8;
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ERASE_LOCAL_PAYMENT_CARDS_OFFLINE_TITLE_SINGLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKIntroViewController localPaymentCards](self, "localPaymentCards");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ERASE_LOCAL_PAYMENT_CARDS_OFFLINE_MESSAGE_SINGLE"), &stru_24F20EA28, CFSTR("Localizable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[DKIntroViewController localPaymentCards](self, "localPaymentCards");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ERASE_LOCAL_PAYMENT_CARDS_OFFLINE_TITLE_MULTIPLE"), &stru_24F20EA28, CFSTR("Localizable"));
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("ERASE_LOCAL_PAYMENT_CARDS_OFFLINE_MESSAGE_MULTIPLE"), &stru_24F20EA28, CFSTR("Localizable"));
    v22 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v20;
    v16 = (void *)v22;
  }
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("ERASE_CONFIRMATION_ALERT_BUTTON"), &stru_24F20EA28, CFSTR("Localizable"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24F20EA28, CFSTR("Localizable"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v29);

  v30 = (void *)MEMORY[0x24BDF67E8];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __62__DKIntroViewController__presentLocalPaymentCardConfirmation___block_invoke;
  v32[3] = &unk_24F20DFE8;
  v33 = v4;
  objc_msgSend(v30, "actionWithTitle:style:handler:", v25, 2, v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addAction:", v31);

  -[DKIntroViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, 0);
LABEL_8:

}

uint64_t __62__DKIntroViewController__presentLocalPaymentCardConfirmation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_continueTapped:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  _QWORD v5[5];

  -[DKIntroViewController confirmErase](self, "confirmErase", a3);
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__DKIntroViewController__continueTapped___block_invoke;
  v5[3] = &unk_24F20DE18;
  v5[4] = self;
  ((void (**)(_QWORD, _QWORD *))v4)[2](v4, v5);

}

uint64_t __41__DKIntroViewController__continueTapped___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__DKIntroViewController__continueTapped___block_invoke_2;
  v3[3] = &unk_24F20E298;
  v3[4] = v1;
  return objc_msgSend(v1, "_presentLocalDataWarning:", v3);
}

uint64_t __41__DKIntroViewController__continueTapped___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[5];
  char v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__DKIntroViewController__continueTapped___block_invoke_3;
  v4[3] = &unk_24F20E270;
  v4[4] = v2;
  v5 = a2;
  return objc_msgSend(v2, "_presentLocalPaymentCardConfirmation:", v4);
}

uint64_t __41__DKIntroViewController__continueTapped___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__DKIntroViewController__continueTapped___block_invoke_4;
  v3[3] = &unk_24F20E270;
  v3[4] = v1;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "_presentBasebandDeadWarning:", v3);
}

void __41__DKIntroViewController__continueTapped___block_invoke_4(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "beginEraseBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginEraseBlock");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)_notNowTapped:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[DKIntroViewController eraseLaterBlock](self, "eraseLaterBlock", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DKIntroViewController eraseLaterBlock](self, "eraseLaterBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (id)confirmErase
{
  return self->_confirmErase;
}

- (void)setConfirmErase:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (id)beginEraseBlock
{
  return self->_beginEraseBlock;
}

- (void)setBeginEraseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (id)eraseLaterBlock
{
  return self->_eraseLaterBlock;
}

- (void)setEraseLaterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (id)hasInternetConnectivity
{
  return self->_hasInternetConnectivity;
}

- (void)setHasInternetConnectivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (BOOL)isBasebandDead
{
  return self->_isBasebandDead;
}

- (void)setIsBasebandDead:(BOOL)a3
{
  self->_isBasebandDead = a3;
}

- (DKNotableUserData)notableUserData
{
  return self->_notableUserData;
}

- (void)setNotableUserData:(id)a3
{
  objc_storeStrong((id *)&self->_notableUserData, a3);
}

- (id)fetchRestoreState
{
  return self->_fetchRestoreState;
}

- (void)setFetchRestoreState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (BOOL)preventOpeningSafari
{
  return self->_preventOpeningSafari;
}

- (void)setPreventOpeningSafari:(BOOL)a3
{
  self->_preventOpeningSafari = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchRestoreState, 0);
  objc_storeStrong((id *)&self->_notableUserData, 0);
  objc_storeStrong(&self->_hasInternetConnectivity, 0);
  objc_storeStrong(&self->_eraseLaterBlock, 0);
  objc_storeStrong(&self->_beginEraseBlock, 0);
  objc_storeStrong(&self->_confirmErase, 0);
}

@end
