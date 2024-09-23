@implementation APNetworksController

- (void)loadView
{
  WFAirportViewController *v3;
  WFAirportViewController *settingsViewController;
  WFAirportViewController *v5;
  void *v6;
  WFNetworkListController *v7;
  WFNetworkListController *airportController;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)APNetworksController;
  -[APNetworksController loadView](&v28, sel_loadView);
  self->_viewLoaded = 1;
  v3 = (WFAirportViewController *)objc_alloc_init(MEMORY[0x24BEC2910]);
  settingsViewController = self->_settingsViewController;
  self->_settingsViewController = v3;
  v5 = v3;

  WFWiFiTitleString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[APNetworksController setTitle:](self, "setTitle:", v6);

  v7 = (WFNetworkListController *)objc_msgSend(objc_alloc(MEMORY[0x24BEC28E8]), "initWithViewController:", v5);
  airportController = self->_airportController;
  self->_airportController = v7;

  -[APNetworksController addChildViewController:](self, "addChildViewController:", v5);
  -[APNetworksController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirportViewController view](v5, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v10);

  -[APNetworksController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[WFAirportViewController view](v5, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
  -[APNetworksController _loadHealthOverrides](self, "_loadHealthOverrides");
  -[APNetworksController healthOverrides](self, "healthOverrides");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[APNetworksController healthOverrides](self, "healthOverrides");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[APNetworksController airportController](self, "airportController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setHealthRecommendationOverrides:", v22);

  }
  else
  {
    -[APNetworksController airportController](self, "airportController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHealthRecommendationOverrides:", 0);
  }

  if (self->_pushDataUsage)
  {
    -[APNetworksController airportController](self, "airportController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pushDataUsageViewController");

    self->_pushDataUsage = 0;
  }
  -[APNetworksController deferredURL](self, "deferredURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[APNetworksController airportController](self, "airportController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[APNetworksController deferredURL](self, "deferredURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleURL:", v27);

    -[APNetworksController setDeferredURL:](self, "setDeferredURL:", 0);
  }
}

- (WFNetworkListController)airportController
{
  return self->_airportController;
}

- (WFHealthIssueOverrides)healthOverrides
{
  return self->_healthOverrides;
}

- (NSURL)deferredURL
{
  return self->_deferredURL;
}

- (void)_loadHealthOverrides
{
  id v3;
  int AppBooleanValue;
  BOOL v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  Boolean v18;
  Boolean v19;
  Boolean v20;
  Boolean v21;
  Boolean v22;
  Boolean keyExistsAndHasValidFormat;

  v3 = objc_alloc_init(MEMORY[0x24BEC28E0]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("kWiFiHealthOverrideNoInternet"), CFSTR("com.apple.settings.airport"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v5 = AppBooleanValue == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
    objc_msgSend(v3, "setNoInternetConnection:", 1);
  v22 = 0;
  v7 = CFPreferencesGetAppBooleanValue(CFSTR("kWiFiHealthOverrideHiddenNetwork"), CFSTR("com.apple.settings.airport"), &v22);
  if (v22 && v7)
    objc_msgSend(v3, "setHiddenNetwork:", 1);
  v21 = 0;
  v8 = CFPreferencesGetAppBooleanValue(CFSTR("kWiFiHealthOverrideLegacyPHY"), CFSTR("com.apple.settings.airport"), &v21);
  if (v21 && v8)
  {
    v6 = 1;
    objc_msgSend(v3, "setLegacyPHY:", 1);
  }
  v20 = 0;
  v9 = CFPreferencesGetAppBooleanValue(CFSTR("kWiFiHealthOverrideCommonSSID"), CFSTR("com.apple.settings.airport"), &v20);
  if (v20 && v9)
  {
    v6 = 1;
    objc_msgSend(v3, "setCommonSSID:", 1);
  }
  v19 = 0;
  v10 = CFPreferencesGetAppBooleanValue(CFSTR("kWiFiHealthOverrideDNSFiltered"), CFSTR("com.apple.settings.airport"), &v19);
  if (v19 && v10)
  {
    v6 = 1;
    objc_msgSend(v3, "setDnsFiltered:", 1);
  }
  v18 = 0;
  v11 = CFPreferencesGetAppBooleanValue(CFSTR("kWiFiHealthOverrideCarrierNetwork"), CFSTR("com.apple.settings.airport"), &v18);
  if (v18 && v11)
  {
    v6 = 1;
    objc_msgSend(v3, "setCarrierNetwork:", 1);
  }
  v12 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("kWiFiHealthOverrideSecurityType"), CFSTR("com.apple.settings.airport"));
  if (v12)
  {
    v13 = v12;
    v14 = 1;
    if (CFStringCompare(v12, CFSTR("kWiFiHealthOverrideOpenSecurity"), 1uLL))
    {
      if (CFStringCompare(v13, CFSTR("kWiFiHealthOverrideWEPSecurity"), 1uLL))
      {
        if (CFStringCompare(v13, CFSTR("kWiFiHealthOverrideWPASecurity"), 1uLL))
        {
LABEL_31:
          CFRelease(v13);
          goto LABEL_32;
        }
        v14 = 3;
      }
      else
      {
        v14 = 2;
      }
    }
    objc_msgSend(v3, "setSecurityOverride:", v14);
    v6 = 1;
    goto LABEL_31;
  }
LABEL_32:
  v15 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("kWiFiHealthOverridePrivateMACDisabled"), CFSTR("com.apple.settings.airport"));
  if (v15)
  {
    v16 = v15;
    v17 = 1;
    if (CFStringCompare(v15, CFSTR("kWiFiHealthOverridePrivateMACDisabledBySystem"), 1uLL))
    {
      if (CFStringCompare(v16, CFSTR("kWiFiHealthOverridePrivateMACDisabledByCarrier"), 1uLL))
      {
        if (CFStringCompare(v16, CFSTR("kWiFiHealthOverridePrivateMACDisabledByProfile"), 1uLL))
        {
          CFRelease(v16);
          if ((v6 & 1) == 0)
            goto LABEL_44;
          goto LABEL_43;
        }
        v17 = 3;
      }
      else
      {
        v17 = 2;
      }
    }
    objc_msgSend(v3, "setPrivateAddressOverride:", v17);
    CFRelease(v16);
  }
  else if (!v6)
  {
    goto LABEL_44;
  }
LABEL_43:
  objc_storeStrong((id *)&self->_healthOverrides, v3);
LABEL_44:

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APNetworksController;
  -[APNetworksController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[APNetworksController airportController](self, "airportController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopScanning");

  -[APNetworksController _notifyAirPortSettingsVisible:](self, "_notifyAirPortSettingsVisible:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)APNetworksController;
  -[APNetworksController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  -[APNetworksController airportController](self, "airportController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewDidDisappear:", v3);

}

- (APNetworksController)initWithNibName:(id)a3 bundle:(id)a4
{
  APNetworksController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APNetworksController;
  v4 = -[APNetworksController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
  {
    WFWiFiTitleString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[APNetworksController setTitle:](v4, "setTitle:", v5);

    -[APNetworksController navigationItem](v4, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLargeTitleDisplayMode:", 2);

  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)APNetworksController;
  -[APNetworksController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[APNetworksController airportController](self, "airportController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startScanning");

  -[APNetworksController _notifyAirPortSettingsVisible:](self, "_notifyAirPortSettingsVisible:", 1);
}

- (void)willResignActive
{
  objc_super v3;

  -[APNetworksController _notifyAirPortSettingsVisible:](self, "_notifyAirPortSettingsVisible:", 0);
  v3.receiver = self;
  v3.super_class = (Class)APNetworksController;
  -[APNetworksController willResignActive](&v3, sel_willResignActive);
}

- (void)willBecomeActive
{
  objc_super v3;

  -[APNetworksController _notifyAirPortSettingsVisible:](self, "_notifyAirPortSettingsVisible:", 1);
  v3.receiver = self;
  v3.super_class = (Class)APNetworksController;
  -[APNetworksController willBecomeActive](&v3, sel_willBecomeActive);
}

- (void)handleURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *deferredURL;
  void *v13;
  NSURL *v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("path"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("root"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
  {
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("WIRELESS_APP_DATA_USAGE_ID")))
    {
      self->_pushDataUsage = 1;
      if (self->_viewLoaded)
      {
        -[APNetworksController airportController](self, "airportController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "pushDataUsageViewController");

        self->_pushDataUsage = 0;
      }
    }
    else if (v5)
    {
      objc_msgSend(v5, "lowercaseString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("wifi"));

      if (v8)
      {
        objc_msgSend(CFSTR("prefs:root=WIFI&path="), "stringByAppendingString:", v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (self->_viewLoaded)
        {
          -[APNetworksController airportController](self, "airportController");
          deferredURL = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(deferredURL, "handleURL:", v13);

        }
        else
        {
          v14 = v10;
          deferredURL = self->_deferredURL;
          self->_deferredURL = v14;
        }

      }
    }
  }

}

- (void)didWake
{
  -[APNetworksController _notifyAirPortSettingsVisible:](self, "_notifyAirPortSettingsVisible:", 1);
}

- (void)_notifyAirPortSettingsVisible:(BOOL)a3
{
  _BOOL4 v3;
  int v4;

  v3 = a3;
  v4 = _notifyAirPortSettingsVisible__token;
  if (_notifyAirPortSettingsVisible__token != -1
    || (notify_register_check("com.apple.airportsettingsvisible", &_notifyAirPortSettingsVisible__token),
        v4 = _notifyAirPortSettingsVisible__token,
        _notifyAirPortSettingsVisible__token != -1))
  {
    notify_set_state(v4, v3);
    notify_post("com.apple.airportsettingsvisible");
  }
}

- (void)setHealthOverrides:(id)a3
{
  objc_storeStrong((id *)&self->_healthOverrides, a3);
}

- (void)setAirportController:(id)a3
{
  objc_storeStrong((id *)&self->_airportController, a3);
}

- (WFAirportViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (void)setSettingsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsViewController, a3);
}

- (void)setDeferredURL:(id)a3
{
  objc_storeStrong((id *)&self->_deferredURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredURL, 0);
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_airportController, 0);
  objc_storeStrong((id *)&self->_healthOverrides, 0);
}

@end
