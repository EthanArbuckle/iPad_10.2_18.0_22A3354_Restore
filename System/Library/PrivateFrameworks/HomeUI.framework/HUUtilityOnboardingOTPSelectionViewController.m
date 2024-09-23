@implementation HUUtilityOnboardingOTPSelectionViewController

- (HUUtilityOnboardingOTPSelectionViewController)initWithContext:(id)a3
{
  id v4;
  void *v5;
  HUUtilityOnboardingOTPSelectionItemManager *v6;
  HUUtilityOnboardingOTPSelectionTableViewController *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HUUtilityOnboardingOTPSelectionViewController *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  objc_msgSend(v4, "otpFactors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUUtilityOnboardingOTPSelectionItemManager initWithDelegate:context:]([HUUtilityOnboardingOTPSelectionItemManager alloc], "initWithDelegate:context:", self, v4);
  v7 = -[HUUtilityOnboardingOTPSelectionTableViewController initWithItemManager:]([HUUtilityOnboardingOTPSelectionTableViewController alloc], "initWithItemManager:", v6);
  -[HUUtilityOnboardingOTPSelectionViewController setTableView:](self, "setTableView:", v7);

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v8 = CFSTR("HUUtilityOnboardingOTPSelectionDetail");
LABEL_7:
    _HULocalizedStringWithDefaultValue(v8, v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_42);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_57);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v8 = CFSTR("HUUtilityOnboardingOTPSelectionDetailSMS");
    goto LABEL_7;
  }
  if (v10)
  {
    v8 = CFSTR("HUUtilityOnboardingOTPSelectionDetailEmail");
    goto LABEL_7;
  }
LABEL_8:
  _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityOnboardingOTPSelectionTitle"), CFSTR("HUUtilityOnboardingOTPSelectionTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingOTPSelectionViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)HUUtilityOnboardingOTPSelectionViewController;
  v13 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:itemTableViewController:](&v16, sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_, v11, v10, 0, 2, v12);

  -[HUUtilityOnboardingOTPSelectionViewController setContext:](v13, "setContext:", v4);
  -[HUUtilityOnboardingOTPSelectionViewController tableView](v13, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", v13);

  return v13;
}

uint64_t __65__HUUtilityOnboardingOTPSelectionViewController_initWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("factorType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SMS"));

  return v3;
}

uint64_t __65__HUUtilityOnboardingOTPSelectionViewController_initWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("factorType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("EMAIL"));

  return v3;
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
  v19.super_class = (Class)HUUtilityOnboardingOTPSelectionViewController;
  -[HUItemTableOBWelcomeController viewDidLoad](&v19, sel_viewDidLoad);
  -[HUUtilityOnboardingOTPSelectionViewController headerView](self, "headerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:withIDDictionary:](HUAccessibilityIdentifierUtilities, "setAccessibilityIDForViews:withIDDictionary:", v4, &unk_1E7042E88);

  -[HUUtilityOnboardingOTPSelectionViewController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingOTPSelectionViewController headerView](self, "headerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateIconWithHeaderView:axID:", v6, CFSTR("Home.OnboardingView.Utility.OTPSelection.Icon"));

  objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingOTPSelectionViewController setContinueButton:](self, "setContinueButton:", v7);

  -[HUUtilityOnboardingOTPSelectionViewController continueButton](self, "continueButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[HUUtilityOnboardingOTPSelectionViewController continueButton](self, "continueButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUUtilityOnboardingOTPSelectionTitle"), CFSTR("HUUtilityOnboardingOTPSelectionTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:forState:", v10, 0);

  -[HUUtilityOnboardingOTPSelectionViewController continueButton](self, "continueButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("Home.OnboardingView.Utility.OTPSelection.SendCodeButton"));

  -[HUUtilityOnboardingOTPSelectionViewController continueButton](self, "continueButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__sendCode_, 64);

  -[HUUtilityOnboardingOTPSelectionViewController buttonTray](self, "buttonTray");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingOTPSelectionViewController continueButton](self, "continueButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addButton:", v14);

  -[HUUtilityOnboardingOTPSelectionViewController context](self, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "utilityID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingOTPSelectionViewController context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "otpFactors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeEnergyAnalyticsHelper sendUtilityOTPMethodSelectionSheetViewEventWithUtilityID:numOfMethods:](HUHomeEnergyAnalyticsHelper, "sendUtilityOTPMethodSelectionSheetViewEventWithUtilityID:numOfMethods:", v16, objc_msgSend(v18, "count"));

}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  HUUtilityOnboardingOTPSelectionViewController *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HUUtilityOnboardingOTPSelectionViewController;
  -[HUUtilityOnboardingOTPSelectionViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  if (-[HUUtilityOnboardingOTPSelectionViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = self;
      v9 = 2080;
      v10 = "-[HUUtilityOnboardingOTPSelectionViewController viewWillDisappear:]";
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped BACK button", buf, 0x16u);
    }

    -[HUUtilityOnboardingOTPSelectionViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerDidGoBack:", self);

  }
}

- (id)_requestOTP
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HUUtilityOnboardingOTPSelectionViewController__requestOTP__block_invoke;
  v6[3] = &unk_1E6F4C660;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reschedule:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __60__HUUtilityOnboardingOTPSelectionViewController__requestOTP__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HUUtilityOnboardingOTPSelectionViewController__requestOTP__block_invoke_2;
  v6[3] = &unk_1E6F4F8A8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "requestOTPWithCompletionHandler:", v6);

}

void __60__HUUtilityOnboardingOTPSelectionViewController__requestOTP__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = *(const char **)(a1 + 32);
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "%@: Error requesting OTP %@", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v12 = 136315650;
      v13 = "-[HUUtilityOnboardingOTPSelectionViewController _requestOTP]_block_invoke";
      v14 = 2112;
      v15 = v8;
      v16 = 1024;
      v17 = a2;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%s(%@) ---: Requested OTP %{BOOL}d ", (uint8_t *)&v12, 0x1Cu);
    }

    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishWithResult:", v10);

  }
}

- (void)_sendCode:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  const __CFString *v7;
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
  id v18;
  _QWORD v19[6];
  _BYTE buf[24];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HUUtilityOnboardingOTPSelectionViewController continueButton](self, "continueButton");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("Cancel");
    if (v6 == v4)
      v7 = CFSTR("Send");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "-[HUUtilityOnboardingOTPSelectionViewController _sendCode:]";
    *(_WORD *)&buf[22] = 2112;
    v21 = (uint64_t)v7;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "%@:%s User tapped %@ button", buf, 0x20u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v21 = 7;
  -[HUUtilityOnboardingOTPSelectionViewController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingOTPSelectionViewController selectedOTPMethod](self, "selectedOTPMethod");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSelectedOTPMethodWithFactor:", v9);

  -[HUUtilityOnboardingOTPSelectionViewController context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "utilityID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUtilityOnboardingOTPSelectionViewController selectedOTPMethod](self, "selectedOTPMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("factor-type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHomeEnergyAnalyticsHelper sendUtilityOTPMethodSelectedByUserEventWithUtilityID:selectedOTPMethod:](HUHomeEnergyAnalyticsHelper, "sendUtilityOTPMethodSelectedByUserEventWithUtilityID:selectedOTPMethod:", v11, v14);

  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHidesBackButton:", 1);

  -[HUUtilityOnboardingOTPSelectionViewController continueButton](self, "continueButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "showsBusyIndicator");

  -[HUUtilityOnboardingOTPSelectionViewController _requestOTP](self, "_requestOTP");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __59__HUUtilityOnboardingOTPSelectionViewController__sendCode___block_invoke;
  v19[3] = &unk_1E6F4F8D0;
  v19[4] = self;
  v19[5] = buf;
  v18 = (id)objc_msgSend(v17, "addCompletionBlock:", v19);

  _Block_object_dispose(buf, 8);
}

void __59__HUUtilityOnboardingOTPSelectionViewController__sendCode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidesBackButton:", 0);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 138412546;
      v18 = v16;
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_ERROR, "%@: Future failed (%@)", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("HUUtilityDiscoveryOnboardingKey_Error"));
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v17 = 138412802;
      v18 = v11;
      v19 = 2080;
      v20 = "-[HUUtilityOnboardingOTPSelectionViewController _sendCode:]_block_invoke";
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%s OTP REQUEST %@", (uint8_t *)&v17, 0x20u);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("HUUtilityDiscoveryOnboardingKey_UserInput"));

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v17 = 138412802;
    v18 = v14;
    v19 = 2080;
    v20 = "-[HUUtilityOnboardingOTPSelectionViewController _sendCode:]_block_invoke";
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@ Finished %s with results  %@", (uint8_t *)&v17, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewController:didFinishWithConfigurationResults:", *(_QWORD *)(a1 + 32), v8);

}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (void)tableView:(id)a3 didSelectOTPMethod:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  HUUtilityOnboardingOTPSelectionViewController *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412802;
    v8 = self;
    v9 = 2080;
    v10 = "-[HUUtilityOnboardingOTPSelectionViewController tableView:didSelectOTPMethod:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@:%s SELECTED METHOD: %@", (uint8_t *)&v7, 0x20u);
  }

  -[HUUtilityOnboardingOTPSelectionViewController setSelectedOTPMethod:](self, "setSelectedOTPMethod:", v5);
}

- (HUConfigurationViewControllerDelegate)delegate
{
  return (HUConfigurationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (HUUtilityOnboardingOTPSelectionTableViewController)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
  objc_storeStrong((id *)&self->_continueButton, a3);
}

- (HFItem)selectedOTPMethod
{
  return self->_selectedOTPMethod;
}

- (void)setSelectedOTPMethod:(id)a3
{
  objc_storeStrong((id *)&self->_selectedOTPMethod, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedOTPMethod, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
