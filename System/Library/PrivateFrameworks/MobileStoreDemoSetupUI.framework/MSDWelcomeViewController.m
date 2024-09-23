@implementation MSDWelcomeViewController

+ (void)needsToRun:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__MSDWelcomeViewController_needsToRun___block_invoke;
  v7[3] = &unk_24F47D290;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__MSDWelcomeViewController_needsToRun___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnrolled:", 0);

  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = (id)objc_opt_class();
    v15 = 1024;
    v16 = v3 ^ 1;
    v5 = v14;
    _os_log_impl(&dword_22A6E6000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ needs to run: %{BOOL}d", (uint8_t *)&v13, 0x12u);

  }
  objc_msgSend(MEMORY[0x24BE676A0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isDeviceEnrolledWithDeKOTA:", 0);

  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v13 = 138543618;
    v14 = v9;
    v15 = 1024;
    v16 = v7;
    v10 = v9;
    _os_log_impl(&dword_22A6E6000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ needs to enable SEP demo mode: %{BOOL}d", (uint8_t *)&v13, 0x12u);

  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSEPDemoMode:", 1);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (MSDWelcomeViewController)init
{
  void *v3;
  MSDWelcomeViewController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("DEMO_SETUP_WAIT_TEXT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)MSDWelcomeViewController;
  v4 = -[OBSetupAssistantSpinnerController initWithSpinnerText:](&v8, sel_initWithSpinnerText_, v3);
  if (v4)
  {
    +[MSDSetupUIController sharedInstance](MSDSetupUIController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDWelcomeViewController setController:](v4, "setController:", v5);

    -[MSDWelcomeViewController setCurrentSSID:](v4, "setCurrentSSID:", 0);
    -[OBBaseWelcomeController navigationItem](v4, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidesBackButton:", 1);

  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  _QWORD v40[3];

  v3 = a3;
  v40[2] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE676E8];
  v6 = *MEMORY[0x24BE676E0];
  v40[0] = *MEMORY[0x24BE676E8];
  v40[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37.receiver = self;
  v37.super_class = (Class)MSDWelcomeViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v37, sel_viewDidAppear_, v3);
  -[MSDWelcomeViewController controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saveLocationServicesState");

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;
  -[MSDWelcomeViewController controller](self, "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAutoEnrollmentTimeStamp:", v11);

  -[MSDWelcomeViewController navigationController](self, "navigationController");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13
    || (v14 = (void *)v13,
        -[MSDWelcomeViewController navigationController](self, "navigationController"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[MSDWelcomeViewController viewDidAppear:].cold.1();
  }

  -[MSDWelcomeViewController controller](self, "controller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDWelcomeViewController completionHandler](self, "completionHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompletionHandler:", v17);

  -[MSDWelcomeViewController controller](self, "controller");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDWelcomeViewController navigationController](self, "navigationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNavigationController:", v19);

  objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "typeOfDemoDevice");

  if (v21 == 3)
  {
    defaultLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A6E6000, v22, OS_LOG_TYPE_DEFAULT, "Device is a FDSKU device only and does not have demo bit; entering offline mode",
        buf,
        2u);
    }

    -[MSDWelcomeViewController controller](self, "controller");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "quitToOfflineMode");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    objc_msgSend(v24, "getCurrentNetworkInfoForKeys:outError:", v7, &v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v36;

    defaultLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (!v25 || v23)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[MSDWelcomeViewController viewDidAppear:].cold.2((uint64_t)v23, v27, v29, v30, v31, v32, v33, v34);
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v25;
        _os_log_impl(&dword_22A6E6000, v27, OS_LOG_TYPE_DEFAULT, "Got current network info: %{public}@", buf, 0xCu);
      }

      objc_msgSend(v25, "objectForKey:", v5);
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKey:", v6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        -[MSDWelcomeViewController setCurrentSSID:](self, "setCurrentSSID:", v27);
      if (v28)
        -[MSDWelcomeViewController setActiveNetworkInterface:](self, "setActiveNetworkInterface:", objc_msgSend(v28, "unsignedIntegerValue"));

    }
    if (-[MSDWelcomeViewController _bothWifiAndCellularActive](self, "_bothWifiAndCellularActive"))
    {
      defaultLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A6E6000, v35, OS_LOG_TYPE_DEFAULT, "Both WiFi and Cellular are active on device, prompting user to choose network configuration...", buf, 2u);
      }

      -[MSDWelcomeViewController _showNetworkInterfaceSelectionAlert](self, "_showNetworkInterfaceSelectionAlert");
    }
    else
    {
      -[MSDWelcomeViewController _checkIn](self, "_checkIn");
    }

  }
}

- (BOOL)_bothWifiAndCellularActive
{
  _BOOL8 v3;

  if ((-[MSDWelcomeViewController activeNetworkInterface](self, "activeNetworkInterface") & 1) != 0)
    return (-[MSDWelcomeViewController activeNetworkInterface](self, "activeNetworkInterface") >> 1) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (void)_checkIn
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[16];

  if (!os_variant_has_internal_content())
  {
LABEL_14:
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A6E6000, v12, OS_LOG_TYPE_DEFAULT, "Checking In with Demo Unit ...", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __36__MSDWelcomeViewController__checkIn__block_invoke;
    v14[3] = &unk_24F47D2B8;
    v14[4] = self;
    objc_msgSend(v13, "checkInWithCompletion:", v14);

    return;
  }
  +[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "storePickerUIMode");

  +[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disassociateWiFiBeforeCheckIn");

  if (v4 != 1)
  {
    if (!v4)
    {
      defaultLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A6E6000, v7, OS_LOG_TYPE_DEFAULT, "Skipping CheckIn and calling demod...", buf, 2u);
      }

      -[MSDWelcomeViewController controller](self, "controller");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setupCompleteWithStoreID:", 0);

      return;
    }
    if (v6)
    {
      defaultLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22A6E6000, v10, OS_LOG_TYPE_DEFAULT, "Disconnecting WiFi...", buf, 2u);
      }

      -[MSDWelcomeViewController controller](self, "controller");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "disconnectWiFi");

    }
    goto LABEL_14;
  }
  defaultLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A6E6000, v9, OS_LOG_TYPE_DEFAULT, "Showing store picker UI...", buf, 2u);
  }

  -[MSDWelcomeViewController _showNextView](self, "_showNextView");
}

void __36__MSDWelcomeViewController__checkIn__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 67109376;
      v25 = a2;
      v26 = 1024;
      v27 = a3;
      _os_log_impl(&dword_22A6E6000, v9, OS_LOG_TYPE_DEFAULT, "Device eligibility for demo: %d; showUI: %d",
        (uint8_t *)&v24,
        0xEu);
    }

    if (a2)
    {
      if (a3)
      {
        defaultLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_22A6E6000, v10, OS_LOG_TYPE_DEFAULT, "Showing store picker UI...", (uint8_t *)&v24, 2u);
        }

        objc_msgSend(*(id *)(a1 + 32), "_showNextView");
        goto LABEL_16;
      }
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setupCompleteWithStoreID:", 0);
    }
    else
    {
      defaultLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "controller");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "hasSecureCookie");
        v24 = 67109120;
        v25 = v13;
        _os_log_impl(&dword_22A6E6000, v11, OS_LOG_TYPE_DEFAULT, "Device is not eligible; hasSecureCookie=%d",
          (uint8_t *)&v24,
          8u);

      }
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasSecureCookie");

      objc_msgSend(*(id *)(a1 + 32), "controller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v15)
        objc_msgSend(v16, "quitToOfflineMode");
      else
        objc_msgSend(v16, "quitToCustomerFlow");
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __36__MSDWelcomeViewController__checkIn__block_invoke_cold_1((uint64_t)v7, v9, v18, v19, v20, v21, v22, v23);

  objc_msgSend(*(id *)(a1 + 32), "_showCheckInErrorAlert");
LABEL_16:

}

- (void)_showCheckInErrorAlert
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke;
  block[3] = &unk_24F47D240;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CHECK_IN_ERROR_TITLE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CHOOSE_NETWORK_OPTION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("COMPLETE_SETUP_OPTION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v2, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke_2;
  v10[3] = &unk_24F47D2E0;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v3, 0, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke_24;
  v9[3] = &unk_24F47D2E0;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v4, 1, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v7);
  objc_msgSend(v5, "addAction:", v8);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

}

void __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Back to wifi pane to choose different network", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popTopmostViewController");

}

void __50__MSDWelcomeViewController__showCheckInErrorAlert__block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Completing setup and quitting store picker UI...", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSecureCookie");

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "quitToOfflineMode");
  else
    objc_msgSend(v5, "quitToHomeScreen");

}

- (void)_showNetworkInterfaceSelectionAlert
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke;
  block[3] = &unk_24F47D240;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[6];

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("NETWORK_CONFIG_TITLE"));
  v2 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "currentSSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:withStringArgument:](MSDSetupUILocalization, "localizedStringForKey:withStringArgument:", CFSTR("NETWORK_CONFIG_DESCRIPTION"), v3);
  v4 = objc_claimAutoreleasedReturnValue();

  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("USE_CELLULAR_OPTION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", CFSTR("CHOOSE_NETWORK_OPTION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (MGGetBoolAnswer())
    v7 = CFSTR("USE_WLAN_AND_CELLUAR_OPTION");
  else
    v7 = CFSTR("USE_WIFI_AND_CELLUAR_OPTION");
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v2, v4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_2;
  v18[3] = &unk_24F47D2E0;
  v18[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v5, 0, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_37;
  v17[3] = &unk_24F47D2E0;
  v17[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v8, 0, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_38;
  v16[3] = &unk_24F47D2E0;
  v16[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v6, 0, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v11);
  objc_msgSend(v9, "addAction:", v12);
  objc_msgSend(v9, "addAction:", v13);
  objc_msgSend(v9, "setPreferredAction:", v13);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);

}

void __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Using Cellular Only", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE676B0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "disconnectAndForgetWiFi:", &v6);
  v4 = v6;

  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_22A6E6000, v5, OS_LOG_TYPE_DEFAULT, "Disconnect and forget wifi completed with error: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_checkIn");
}

uint64_t __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Using WiFi + Cellular", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_checkIn");
}

void __63__MSDWelcomeViewController__showNetworkInterfaceSelectionAlert__block_invoke_38(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22A6E6000, v2, OS_LOG_TYPE_DEFAULT, "Back to wifi pane to choose different network", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popTopmostViewController");

}

- (void)_showNextView
{
  void *v3;
  MSDDemoSetupViewController *v4;

  v4 = objc_alloc_init(MSDDemoSetupViewController);
  -[MSDWelcomeViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushViewController:andRemoveTopmostView:", v4, 0);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (MSDSetupUIController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
  objc_storeStrong((id *)&self->_controller, a3);
}

- (unint64_t)activeNetworkInterface
{
  return self->_activeNetworkInterface;
}

- (void)setActiveNetworkInterface:(unint64_t)a3
{
  self->_activeNetworkInterface = a3;
}

- (NSString)currentSSID
{
  return self->_currentSSID;
}

- (void)setCurrentSSID:(id)a3
{
  objc_storeStrong((id *)&self->_currentSSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSSID, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)viewDidAppear:.cold.1()
{
  __assert_rtn("-[MSDWelcomeViewController viewDidAppear:]", "MSDWelcomeViewController.m", 84, "self.navigationController && [self.navigationController isKindOfClass:[BFFNavigationController class]]");
}

- (void)viewDidAppear:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6E6000, a2, a3, "Failed to get current network info with error: %{public}@", a5, a6, a7, a8, 2u);
}

void __36__MSDWelcomeViewController__checkIn__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22A6E6000, a2, a3, "CheckIn returned error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
