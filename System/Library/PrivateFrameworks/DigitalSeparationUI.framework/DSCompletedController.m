@implementation DSCompletedController

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSCompletedController");
    v3 = (void *)DSLogAdditionalSharing;
    DSLogAdditionalSharing = (uint64_t)v2;

  }
}

- (DSCompletedController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  DSCompletedController *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  DSUILocStringForKey(CFSTR("DEVICE_ACCOUNT_SECURITY_COMPLETE"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("DEVICE_ACCOUNT_SECURITY_COMPLETE_DETAIL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)DSCompletedController;
  v9 = -[DSCompletedController initWithTitle:detailText:icon:](&v11, sel_initWithTitle_detailText_icon_, v6, v7, v8);

  return v9;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  UIActivityIndicatorView *v7;
  UIActivityIndicatorView *spinner;
  id v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DSCompletedController;
  -[DSOBWelcomeController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = +[DSUIUtilities setUpLearnMoreButtonForController:selector:](DSUIUtilities, "setUpLearnMoreButtonForController:selector:", self, sel_learnMorePressed);
  DSUILocStringForKey(CFSTR("DONE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSCompletedController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v4, v5, sel_pushNextPane);

  v7 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v7;

  v9 = objc_alloc(MEMORY[0x24BDBFA60]);
  v10 = (void *)objc_msgSend(v9, "initWithDelegate:delegateQueue:", self, MEMORY[0x24BDAC9B8]);
  -[DSCompletedController setAccessoryManager:](self, "setAccessoryManager:", v10);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __36__DSCompletedController_viewDidLoad__block_invoke;
  v11[3] = &unk_24EFF33A0;
  v11[4] = self;
  -[DSCompletedController fetchAdditionalSharingWithCompletion:](self, "fetchAdditionalSharingWithCompletion:", v11);
}

void __36__DSCompletedController_viewDidLoad__block_invoke(uint64_t a1)
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
  id v29;

  v2 = *(void **)(a1 + 32);
  DSUILocStringForKey(CFSTR("UNINSTALL_APPS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("UNINSTALL_APPS_DETAIL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSUIUtilities valueForUnfinalizedString:](DSUIUtilities, "valueForUnfinalizedString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("network"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addBulletedListItemWithTitle:description:image:", v4, v6, v7);

  v8 = *(void **)(a1 + 32);
  DSUILocStringForKey(CFSTR("UPDATE_PASSWORDS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("UPDATE_PASSWORDS_DETAIL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("key.fill"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addBulletedListItemWithTitle:description:image:", v9, v10, v11);

  v12 = *(void **)(a1 + 32);
  DSUILocStringForKey(CFSTR("SOCIAL_MEDIA"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("SOCIAL_MEDIA_DETAIL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("text.bubble.fill"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addBulletedListItemWithTitle:description:image:", v13, v14, v15);

  v16 = *(void **)(a1 + 32);
  DSUILocStringForKey(CFSTR("CHECK_OTHER_DEVICES"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("CHECK_OTHER_DEVICES_DETAIL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("person.3.fill"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addBulletedListItemWithTitle:description:image:", v17, v18, v19);

  objc_msgSend(*(id *)(a1 + 32), "addUTAlerts");
  objc_msgSend(*(id *)(a1 + 32), "addHomeBullet");
  objc_msgSend(*(id *)(a1 + 32), "addWalletBullet");
  v20 = *(void **)(a1 + 32);
  DSUILocStringForKey(CFSTR("CELLULAR_SERVICE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("CELLULAR_SERVICE_DETAIL"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("antenna.radiowaves.left.and.right"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addBulletedListItemWithTitle:description:image:", v21, v22, v23);

  objc_msgSend(*(id *)(a1 + 32), "addFamilyBullet");
  if (objc_msgSend(MEMORY[0x24BE2CC70], "hasRestriction"))
  {
    v24 = *(void **)(a1 + 32);
    DSUILocStringForKey(CFSTR("RESTRICTIONS_ADDITIONAL_ACTIONS_TITLE"));
    v29 = (id)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("RESTRICTIONS_ADDITIONAL_ACTIONS_DETAIL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "imageNamed:inBundle:", CFSTR("custom.nosign"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addBulletedListItemWithTitle:description:image:", v29, v25, v28);

  }
}

- (void)fetchAdditionalSharingWithCompletion:(id)a3
{
  id v4;
  dispatch_group_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[8];
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  id location;

  v4 = a3;
  v5 = dispatch_group_create();
  -[DSCompletedController setFetchingGroup:](self, "setFetchingGroup:", v5);

  -[DSCompletedController fetchingGroup](self, "fetchingGroup");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v7 = objc_alloc_init(MEMORY[0x24BE30A88]);
  dispatch_group_enter(v6);
  -[DSCompletedController startContentSpinner](self, "startContentSpinner");
  v8 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke;
  v23[3] = &unk_24EFF3FE0;
  objc_copyWeak(&v25, &location);
  v9 = v6;
  v24 = v9;
  objc_msgSend(v7, "startRequestWithCompletionHandler:", v23);
  dispatch_group_enter(v9);
  v10 = (void *)MEMORY[0x24BE6ECE0];
  objc_msgSend(MEMORY[0x24BE6EDB0], "sharedService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_274;
  v20[3] = &unk_24EFF4008;
  objc_copyWeak(&v22, &location);
  v12 = v9;
  v21 = v12;
  objc_msgSend(v10, "shouldShowWalletInDigitalSeparation:withDeviceSpecificCompletion:", v11, v20);

  dispatch_group_enter(v12);
  v13 = DSLogAdditionalSharing;
  if (os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2278DF000, v13, OS_LOG_TYPE_INFO, "Fetching UT Enablement status", buf, 2u);
  }
  -[DSCompletedController accessoryManager](self, "accessoryManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchStatusOfUTEnablementRequirements");

  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_276;
  v16[3] = &unk_24EFF4030;
  objc_copyWeak(&v18, &location);
  v17 = v4;
  v15 = v4;
  dispatch_group_notify(v12, MEMORY[0x24BDAC9B8], v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

void __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id WeakRetained;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_ERROR))
      __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_cold_1();
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v5, "members", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v12, "isMe"))
          {
            WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
            objc_msgSend(WeakRetained, "setFamilyMember:", v12);

            goto LABEL_14;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_14:

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_274(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  id v7;
  uint64_t v8;
  id WeakRetained;

  v7 = a4;
  if (v7 && os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_ERROR))
    __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_274_cold_1();
  v8 = a2 | a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setWalletSharing:", v8);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_276(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "fetchCompleted");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCompleted
{
  -[DSCompletedController setFetchingGroup:](self, "setFetchingGroup:", 0);
  -[DSCompletedController stopContentSpinner](self, "stopContentSpinner");
}

- (void)addFamilyBullet
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Failed to find name for %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)addWalletBullet
{
  void *v3;
  void *v4;
  id v5;

  if (-[DSCompletedController walletSharing](self, "walletSharing"))
  {
    DSUILocStringForKey(CFSTR("ADDITIONAL_WALLET_TITLE"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("ADDITIONAL_WALLET_DETAIL"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("wallet.pass.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSCompletedController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v5, v3, v4);

  }
}

- (void)addHomeBullet
{
  void *v3;
  void *v4;
  id v5;

  DSUILocStringForKey(CFSTR("ADDITIONAL_HOME_TITLE"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKey(CFSTR("ADDITIONAL_HOME_DETAIL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("house.fill"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSCompletedController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v5, v3, v4);

}

- (void)addUTAlerts
{
  void *v3;
  void *v4;
  id v5;

  if (!-[DSCompletedController UTAlertsEnabled](self, "UTAlertsEnabled"))
  {
    DSUILocStringForKey(CFSTR("UNWANTED_TRACKING"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("UNWANTED_TRACKING_DETAIL"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("location.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSCompletedController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v5, v3, v4);

  }
}

- (void)startContentSpinner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *heightConstraint;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[DSCompletedController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSCompletedController spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[DSCompletedController spinner](self, "spinner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSCompletedController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[DSCompletedController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heightAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToConstant:", 100.0);
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v9;

  -[DSCompletedController heightConstraint](self, "heightConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  -[DSCompletedController spinner](self, "spinner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerXAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSCompletedController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[DSCompletedController spinner](self, "spinner");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startAnimating");

}

- (void)stopContentSpinner
{
  void *v3;
  void *v4;
  id v5;

  -[DSCompletedController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

  -[DSCompletedController spinner](self, "spinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[DSCompletedController heightConstraint](self, "heightConstraint");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

}

- (void)learnMorePressed
{
  void *v3;
  void *v4;
  id v5;

  AnalyticsSendEventLazy();
  -[DSCompletedController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  DSUIFeatureTable();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DSUILocStringForKeyInTable(CFSTR("NAVIGATION_LEARN_MORE_URL"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "learnMorePressedForController:withURL:", self, v4);

}

void *__41__DSCompletedController_learnMorePressed__block_invoke()
{
  return &unk_24F00B1E0;
}

- (void)findMyAccessoryManager:(id)a3 didFetchStatusOfUTEnablementRequirementsWithStatus:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10 && os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_ERROR))
    -[DSCompletedController findMyAccessoryManager:didFetchStatusOfUTEnablementRequirementsWithStatus:withError:].cold.1();
  v11 = DSLogAdditionalSharing;
  if (os_log_type_enabled((os_log_t)DSLogAdditionalSharing, OS_LOG_TYPE_INFO))
  {
    v14 = 138543362;
    v15 = v9;
    _os_log_impl(&dword_2278DF000, v11, OS_LOG_TYPE_INFO, "Got UT EnablementStatus %{public}@", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDBFB00]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSCompletedController setUTAlertsEnabled:](self, "setUTAlertsEnabled:", objc_msgSend(v12, "unsignedIntegerValue") == 1);

  -[DSCompletedController fetchingGroup](self, "fetchingGroup");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v13);

}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FAFamilyMember)familyMember
{
  return (FAFamilyMember *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setFamilyMember:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1192);
}

- (BOOL)walletSharing
{
  return self->_walletSharing;
}

- (void)setWalletSharing:(BOOL)a3
{
  self->_walletSharing = a3;
}

- (BOOL)UTAlertsEnabled
{
  return self->_UTAlertsEnabled;
}

- (void)setUTAlertsEnabled:(BOOL)a3
{
  self->_UTAlertsEnabled = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (OS_dispatch_group)fetchingGroup
{
  return self->_fetchingGroup;
}

- (void)setFetchingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_fetchingGroup, a3);
}

- (CLFindMyAccessoryManager)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryManager, 0);
  objc_storeStrong((id *)&self->_fetchingGroup, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Failed to fetch FamilyCircle because %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __62__DSCompletedController_fetchAdditionalSharingWithCompletion___block_invoke_274_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Failed to fetch wallet sharing because %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

- (void)findMyAccessoryManager:didFetchStatusOfUTEnablementRequirementsWithStatus:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Failed to fetch status of UT enablement because %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

@end
