@implementation CNFRegListController

- (CNFRegListController)initWithRegController:(id)a3
{
  id v4;
  CNFRegListController *v5;
  CNFRegListController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegListController;
  v5 = -[CNFRegListController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CNFRegListController setRegController:](v5, "setRegController:", v4);
    if ((unint64_t)(CNFRegGlobalAppearanceStyle() - 5) <= 1)
      -[CNFRegListController setEdgeToEdgeCells:](v6, "setEdgeToEdgeCells:", 1);
  }

  return v6;
}

- (CNFRegListController)initWithParentController:(id)a3
{
  id v4;
  void *v5;
  CNFRegListController *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNFRegListController initWithRegController:](self, "initWithRegController:", v5);

  if (v6)
  {
    objc_msgSend(v4, "rootController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController setRootController:](v6, "setRootController:", v7);

    -[CNFRegListController setParentController:](v6, "setParentController:", v4);
    objc_msgSend(v4, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController setSpecifier:](v6, "setSpecifier:", v8);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[CNFRegListController _existingLabelForSpecifier:header:](self, "_existingLabelForSpecifier:header:", v9, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "clearSpecifier");
        -[CNFRegListController _existingLabelForSpecifier:header:](self, "_existingLabelForSpecifier:header:", v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "clearSpecifier");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v12.receiver = self;
  v12.super_class = (Class)CNFRegListController;
  -[CNFRegListController dealloc](&v12, sel_dealloc);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return CNFRegShouldRotateToOrientation(a3);
}

- (void)setSpecifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNFRegListController;
  -[CNFRegListController setSpecifier:](&v11, sel_setSpecifier_, v5);
  -[CNFRegListController regController](self, "regController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v5, "propertyForKey:", CFSTR("ft-serviceType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNFRegController controllerForServiceType:](CNFRegController, "controllerForServiceType:", objc_msgSend(v7, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController setRegController:](self, "setRegController:", v8);

  }
  -[CNFRegListController regController](self, "regController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFRegListController.m"), 100, CFSTR("Did not have a registration controller after setting specifier"));

  }
}

- (id)specifiers
{
  void *v3;

  -[CNFRegListController specifierList](self, "specifierList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController _updateTitle](self, "_updateTitle");
  return v3;
}

- (id)specifierList
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegListController;
  -[CNFRegListController specifiers](&v3, sel_specifiers);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)customTitle
{
  return 0;
}

- (void)_updateTitle
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[CNFRegListController customTitle](self, "customTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    OSLogHandleForIDSCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl(&dword_2138BA000, v4, OS_LOG_TYPE_DEFAULT, "Setting custom title: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      v5 = v3;
      IMLogString();
    }
    -[CNFRegListController setTitle:](self, "setTitle:", v3, v5);
  }

}

- (void)setAppearBlock:(id)a3
{
  id v4;
  void *v5;
  id appearBlock;
  id v7;

  v4 = a3;
  if (self->_appearBlock != v4)
  {
    v7 = v4;
    v5 = (void *)objc_msgSend(v4, "copy");
    appearBlock = self->_appearBlock;
    self->_appearBlock = v5;

    v4 = v7;
    if (v7)
    {
      if (self->_appeared)
      {
        -[CNFRegListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__performAppearBlock, 0, 0.0);
        v4 = v7;
      }
    }
  }

}

- (void)_performAppearBlock
{
  void *v3;
  id v4;

  -[CNFRegListController appearBlock](self, "appearBlock");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController setAppearBlock:](self, "setAppearBlock:", 0);
  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  objc_super v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[CNFRegListController regController](self, "regController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CNFRegCurrentStringTableMatchesType(objc_msgSend(v5, "serviceType"));

  if (!v6)
  {
    -[CNFRegListController regController](self, "regController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CNFRegSetStringTableForServiceType(objc_msgSend(v7, "serviceType"));

    -[CNFRegListController reloadSpecifiers](self, "reloadSpecifiers");
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEBUG, "CNFRegListController: ViewWillAppear: Updating the string table and reloading specifiers.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      IMLogString();
  }
  v14.receiver = self;
  v14.super_class = (Class)CNFRegListController;
  -[CNFRegListController viewWillAppear:](&v14, sel_viewWillAppear_, v3);
  OSLogHandleForIDSCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = CFSTR("not ");
    if (v3)
      v10 = &stru_24D077260;
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEBUG, "View will appear, %@animated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v11 = CFSTR("not ");
    if (v3)
      v11 = &stru_24D077260;
    v13 = v11;
    IMLogString();
  }
  if (-[CNFRegListController wantsWiFiChooser](self, "wantsWiFiChooser", v13))
  {
    -[CNFRegListController regController](self, "regController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startRequiringWifi");

  }
  -[CNFRegListController setShowingChildController:](self, "setShowingChildController:", 0);
  self->_appeared = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  objc_super v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)CNFRegListController;
  -[CNFRegListController viewDidAppear:](&v12, sel_viewDidAppear_);
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEBUG, "View did appear, adding listener", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isActive") & 1) == 0)
    objc_msgSend(v6, "setActive:", 1);
  objc_msgSend(v6, "addListener:", self);
  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("not ");
    if (v3)
      v8 = &stru_24D077260;
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEBUG, "View did appear, %@animated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = CFSTR("not ");
    if (v3)
      v9 = &stru_24D077260;
    v11 = v9;
    IMLogString();
  }
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8])
    && -[CNFRegListController shouldRerootPreferences](self, "shouldRerootPreferences"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", *MEMORY[0x24BE75C38], 0);
    -[CNFRegListController setShouldRerootPreferences:](self, "setShouldRerootPreferences:", 0);

  }
  -[CNFRegListController _performAppearBlock](self, "_performAppearBlock", v11);
  self->_appeared = 1;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  objc_super v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)CNFRegListController;
  -[CNFRegListController viewWillDisappear:](&v12, sel_viewWillDisappear_);
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEBUG, "View will disappear, removing listener", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeListener:", self);

  OSLogHandleForIDSCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = CFSTR("not ");
    if (v3)
      v8 = &stru_24D077260;
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEBUG, "View will disappear, %@animated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    v9 = CFSTR("not ");
    if (v3)
      v9 = &stru_24D077260;
    v11 = v9;
    IMLogString();
  }
  if (-[CNFRegListController wantsWiFiChooser](self, "wantsWiFiChooser", v11))
  {
    -[CNFRegListController regController](self, "regController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopRequiringWifi");

  }
  -[CNFRegListController setAppearBlock:](self, "setAppearBlock:", 0);
  self->_appeared = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  objc_super v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)CNFRegListController;
  -[CNFRegListController viewDidDisappear:](&v7, sel_viewDidDisappear_);
  OSLogHandleForIDSCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = CFSTR("not ");
    if (v3)
      v6 = &stru_24D077260;
    *(_DWORD *)buf = 138412290;
    v9 = v6;
    _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_DEBUG, "View did disappear, %@animated", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  self->_appeared = 0;
}

- (void)applicationDidResume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNFRegListController;
  -[CNFRegListController applicationDidResume](&v3, sel_applicationDidResume);
  -[CNFRegListController _performAppearBlock](self, "_performAppearBlock");
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 0;
}

- (void)systemApplicationDidEnterBackground
{
  NSObject *v2;
  uint8_t v3[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationDidEnterBackground", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
}

- (void)systemApplicationWillEnterForeground
{
  NSObject *v2;
  uint8_t v3[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationWillEnterForeground", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
}

- (void)systemApplicationDidBecomeActive
{
  NSObject *v2;
  uint8_t v3[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationDidBecomeActive", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
}

- (void)systemApplicationWillResignActive
{
  NSObject *v2;
  uint8_t v3[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationWillResignActive", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
}

- (void)systemApplicationDidSuspend
{
  NSObject *v2;
  uint8_t v3[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationDidSuspend", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
}

- (void)systemApplicationDidResume
{
  NSObject *v2;
  uint8_t v3[16];

  OSLogHandleForIDSCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2138BA000, v2, OS_LOG_TYPE_DEBUG, "systemApplicationDidResume", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (IMShouldLog())
      IMLogString();
  }
}

- (BOOL)_showWiFiAlertIfNecessary
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[CNFRegListController regController](self, "regController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "serviceType");

  if (!v4 || v4 == 2)
  {
    v5 = 0;
    v6 = CFSTR("com.apple.facetime");
  }
  else
  {
    v5 = v4 != 1;
    if (v4 == 1)
      v6 = CFSTR("com.apple.MobileSMS");
    else
      v6 = 0;
  }
  -[CNFRegListController regController](self, "regController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "deviceCanTakeNetworkAction"))
  {
    if (v5)
    {
LABEL_13:
      v10 = 0;
      goto LABEL_33;
    }
    -[CNFRegListController regController](self, "regController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "serviceType") == 1)
    {
LABEL_12:

      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "nonWifiAvailableForBundleId:", v6))
    {

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "wifiAllowedForBundleId:", v6);

    if ((v12 & 1) != 0)
      goto LABEL_13;
  }
  OSLogHandleForIDSCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "nonWifiAvailableForBundleId:", v6))
      v15 = CFSTR("YES");
    else
      v15 = CFSTR("NO");
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "wifiAllowedForBundleId:", v6))
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v27 = v6;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v17;
    _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_DEFAULT, "Showing alert nonWifiAvailableForBUndleID:%@ %@, wifiAllowedForBUndleID %@", buf, 0x20u);

  }
  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "nonWifiAvailableForBundleId:", v6))
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "wifiAllowedForBundleId:", v6))
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    v24 = v19;
    v25 = v21;
    v23 = v6;
    IMLogString();

  }
  objc_msgSend(v7, "showNetworkAlert:", self, v23, v24, v25);
  v10 = 1;
LABEL_33:

  return v10;
}

- (void)handleURL:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!-[CNFRegListController _handleURLDictionary:](self, "_handleURLDictionary:", v4))
  {
    v5.receiver = self;
    v5.super_class = (Class)CNFRegListController;
    -[CNFRegListController handleURL:](&v5, sel_handleURL_, v4);
  }

}

- (BOOL)_handleURLDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  BOOL v11;
  CNFRegListController *v13;
  char v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = v4;
  v14 = 0;
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + (int)*MEMORY[0x24BE75768]));
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "methodSignatureForSelector:", sel__cnfreg_overrideForController_withDictionary_);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self;
      objc_msgSend(v8, "setTarget:", WeakRetained);
      objc_msgSend(v8, "setSelector:", sel__cnfreg_overrideForController_withDictionary_);
      objc_msgSend(v8, "setArgument:atIndex:", &v13, 2);
      objc_msgSend(v8, "setArgument:atIndex:", &v15, 3);
      objc_msgSend(v8, "invoke");
      objc_msgSend(v8, "getReturnValue:", &v14);
      OSLogHandleForIDSCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        if (v14)
          v10 = CFSTR("YES");
        else
          v10 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v17 = v10;
        v18 = 2112;
        v19 = v15;
        _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "Handling url dictionary {%@} : %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();

    }
    v4 = v15;
    v11 = v14 != 0;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)changePasswordControllerDidCancel:(id)a3
{
  -[CNFRegListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)changePasswordControllerDidFinish:(id)a3 withAppleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  CNFRegListController *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "length") && objc_msgSend(v11, "length"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v21 = self;
    -[CNFRegListController regController](self, "regController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appleIDAccounts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v18, "loginDisplayString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v9);

          if (v20)
            objc_msgSend(v18, "updateAuthorizationCredentials:token:", v10, v11);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    self = v21;
  }
  -[CNFRegListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)authorizationController:(id)a3 authorizedAccount:(BOOL)a4
{
  -[CNFRegListController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)wantsWiFiChooser
{
  return !-[CNFRegListController showingChildController](self, "showingChildController");
}

- (id)logName
{
  return CFSTR("RegList");
}

- (void)_setSpecifierEnabled:(id)a3 enabled:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = *MEMORY[0x24BE75A18];
  v12 = v6;
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75A18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || objc_msgSend(v8, "BOOLValue") != v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v10, v7);
    objc_msgSend(v12, "propertyForKey:", *MEMORY[0x24BE75D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCellEnabled:", v5);
    objc_msgSend(v11, "setNeedsDisplay");

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  int *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
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
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CNFRegListController;
  -[CNFRegListController loadView](&v20, sel_loadView);
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "styleUsesCustomTableStyle"))
  {
    objc_msgSend(v3, "tableBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (int *)MEMORY[0x24BE75700];
    if (v4)
    {
      objc_msgSend(v3, "tableBackgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *v5;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "setBackgroundColor:", v6);

      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v7), "setBackgroundView:", 0);
    }
    if (objc_msgSend(v3, "styleUsesCustomSeparatorStyle"))
    {
      v8 = *v5;
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "_setDrawsTopShadowInGroupedSections:", 0);
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "setSeparatorStyle:", objc_msgSend(v3, "tableSeparatorStyle"));
      objc_msgSend(v3, "tableSeparatorColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v3, "tableSeparatorColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "setSeparatorColor:", v10);

      }
      objc_msgSend(v3, "tableSeparatorTopShadowColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v3, "tableSeparatorTopShadowColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "setSeparatorTopShadowColor:", v12);

      }
      objc_msgSend(v3, "tableSeparatorBottomShadowColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v3, "tableSeparatorBottomShadowColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v8), "setSeparatorBottomShadowColor:", v14);

      }
    }
    objc_msgSend(v3, "tableSectionBorderColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "tableSectionBorderColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "setSectionBorderColor:", v16);

    }
  }
  objc_msgSend(v3, "customBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v3, "customBackgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBackgroundColor:", v18);

  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
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
  uint64_t v27;
  void *v28;
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
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  v50 = a4;
  v6 = a5;
  v7 = objc_msgSend(v50, "tag");
  v8 = v7;
  v9 = v7 << 32;
  if (v7 << 32 == 0x800000000)
  {
    objc_msgSend(v50, "editableTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClearButtonMode:", 1);

  }
  +[CNFRegAppearanceController globalAppearanceController](CNFRegAppearanceController, "globalAppearanceController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "styleUsesCustomTableStyle"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = objc_msgSend(v50, "usesStandardBackgroundImage");
    else
      v12 = 0;
    if (v9 != 0xD00000000 || (v12 & 1) != 0)
    {
      objc_msgSend(v11, "tableCellBackgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setBackgroundColor:", v13);
    }
    else
    {
      objc_msgSend(v11, "tableCellButtonImage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v13);
        objc_msgSend(v50, "setBackgroundView:", v14);

      }
      objc_msgSend(v11, "tableCellButtonImageSelected");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v50;
      if (v15)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v15);
        objc_msgSend(v50, "setSelectedBackgroundView:", v17);

        v16 = v50;
      }
      objc_msgSend(v16, "setBackgroundColor:", 0);

    }
    objc_msgSend(v11, "tableCellTextLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v11, "tableCellTextLabelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "textLabel");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTextColor:", v19);

    }
    objc_msgSend(v11, "tableCellTextLabelBackgroundColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v11, "tableCellTextLabelBackgroundColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "textLabel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setBackgroundColor:", v22);

    }
    objc_msgSend(v11, "tableCellDetailLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v11, "tableCellDetailLabelColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "detailTextLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTextColor:", v25);

    }
    v27 = v8;
    objc_msgSend(v11, "tableCellDetailLabelBackgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v11, "tableCellDetailLabelBackgroundColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "detailTextLabel");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setBackgroundColor:", v29);

    }
    if ((v27 | 4) == 0xC)
    {
      objc_msgSend(v11, "tableCellEditableTextPlaceholderColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v11, "tableCellEditableTextPlaceholderColor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "editableTextField");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_placeholderLabel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setTextColor:", v32);

      }
      objc_msgSend(v11, "tableCellEditableTextFieldClearButton");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_msgSend(v50, "editableTextField");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "_clearButton");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tableCellEditableTextFieldClearButton");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setImage:forState:", v38, 0);

      }
      objc_msgSend(v11, "tableCellEditableTextFieldClearButtonPressed");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        objc_msgSend(v50, "editableTextField");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "_clearButton");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "tableCellEditableTextFieldClearButtonPressed");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setImage:forState:", v42, 1);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = v50;
        objc_msgSend(v11, "tableCellEditableTextColor");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        {
          objc_msgSend(v11, "tableCellEditableTextColor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "editableTextField");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setTextColor:", v45);

        }
        objc_msgSend(v11, "tableCellCheckmarkImage");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setCustomCheckmarkImage:", v47);

        objc_msgSend(v11, "tableCellCheckmarkImageSelected");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setCustomCheckmarkImageSelected:", v48);

        if (objc_msgSend(v6, "row"))
        {
          objc_msgSend(v43, "setShadowImage:", 0);
        }
        else
        {
          objc_msgSend(v11, "tableSectionShadowImage");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setShadowImage:", v49);

        }
        objc_msgSend(v43, "setNeedsLayout");

      }
    }
  }

}

- (id)_existingLabelForSpecifier:(id)a3 header:(BOOL)a4
{
  _BOOL4 v4;
  char *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;

  v4 = a4;
  v5 = (char *)a3;
  v6 = v5;
  if (v5 && !*(_QWORD *)&v5[*MEMORY[0x24BE75738]])
  {
    v8 = (_QWORD *)MEMORY[0x24BE75AB0];
    if (!v4)
      v8 = (_QWORD *)MEMORY[0x24BE75A78];
    objc_msgSend(v5, "propertyForKey:", *v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = v9;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_existingLabelForSection:(int64_t)a3 header:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = -[CNFRegListController indexOfGroup:](self, "indexOfGroup:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController _existingLabelForSpecifier:header:](self, "_existingLabelForSpecifier:header:", v8, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_updateExistingLabelForSpecifier:(id)a3 header:(BOOL)a4
{
  _BOOL8 v4;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a4;
  v7 = (char *)a3;
  v8 = v7;
  if (v7)
  {
    v12 = v7;
    if (*(_QWORD *)&v7[*MEMORY[0x24BE75738]])
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFRegListController.m"), 586, CFSTR("Attempted to set a label on a non-group cell"));

      v8 = v12;
    }
    -[CNFRegListController _existingLabelForSpecifier:header:](self, "_existingLabelForSpecifier:header:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateLabelText");
    if (v9)
    {
      v10 = (int)*MEMORY[0x24BE75700];
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "beginUpdates");
      objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v10), "endUpdates");
    }

    v8 = v12;
  }

}

- (void)_setLabel:(id)a3 forSpecifier:(id)a4 header:(BOOL)a5
{
  _BOOL8 v5;
  char *v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v5 = a5;
  v15 = a3;
  v9 = (char *)a4;
  v10 = v9;
  if (v9)
  {
    if (*(_QWORD *)&v9[*MEMORY[0x24BE75738]])
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNFRegListController.m"), 607, CFSTR("Attempted to set a label on a non-group cell"));

    }
    v11 = (id *)MEMORY[0x24BE75AA0];
    if (!v5)
      v11 = (id *)MEMORY[0x24BE75A30];
    v12 = *v11;
    if (v5)
      objc_msgSend(v10, "name");
    else
      objc_msgSend(v10, "propertyForKey:", *MEMORY[0x24BE75A68]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v15 && objc_msgSend(v15, "length"))
    {
      if (v13 != v15 && (objc_msgSend(v15, "isEqualToString:", v13) & 1) == 0)
      {
        if (v5)
          objc_msgSend(v10, "setName:", v15);
        else
          objc_msgSend(v10, "setProperty:forKey:", v15, *MEMORY[0x24BE75A68]);
        -[CNFRegListController _updateExistingLabelForSpecifier:header:](self, "_updateExistingLabelForSpecifier:header:", v10, v5);
      }
    }
    else
    {
      if (v5)
        objc_msgSend(v10, "setName:", 0);
      else
        objc_msgSend(v10, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
      objc_msgSend(v10, "removePropertyForKey:", v12);
    }

  }
}

- (void)_updateTableLabel:(id)a3 withTableView:(id)a4 isTopMostHeader:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  if (a3)
  {
    v5 = a5;
    v7 = a3;
    objc_msgSend(v7, "setCnfreg_tableView:", a4);
    objc_msgSend(v7, "setIsTopmostHeader:", v5);

  }
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  objc_super v13;
  objc_super v14;

  v6 = a3;
  -[CNFRegListController _existingLabelForSection:header:](self, "_existingLabelForSection:header:", a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController _updateTableLabel:withTableView:isTopMostHeader:](self, "_updateTableLabel:withTableView:isTopMostHeader:", v7, v6, a4 == 0);
  v14.receiver = self;
  v14.super_class = (Class)CNFRegListController;
  -[CNFRegListController tableView:heightForHeaderInSection:](&v14, sel_tableView_heightForHeaderInSection_, v6, a4);
  if (a4 && v7)
  {
    v9 = v8;
  }
  else
  {
    -[CNFRegListController _existingLabelForSection:header:](self, "_existingLabelForSection:header:", a4, 1);
    v10 = objc_claimAutoreleasedReturnValue();

    -[CNFRegListController _updateTableLabel:withTableView:isTopMostHeader:](self, "_updateTableLabel:withTableView:isTopMostHeader:", v10, v6, a4 == 0);
    v13.receiver = self;
    v13.super_class = (Class)CNFRegListController;
    -[CNFRegListController tableView:heightForHeaderInSection:](&v13, sel_tableView_heightForHeaderInSection_, v6, a4);
    v9 = v11;
    v7 = (void *)v10;
  }

  return v9;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  objc_super v11;
  objc_super v12;

  v6 = a3;
  -[CNFRegListController _existingLabelForSection:header:](self, "_existingLabelForSection:header:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNFRegListController _updateTableLabel:withTableView:isTopMostHeader:](self, "_updateTableLabel:withTableView:isTopMostHeader:", v7, v6, 0);
  v12.receiver = self;
  v12.super_class = (Class)CNFRegListController;
  -[CNFRegListController tableView:heightForFooterInSection:](&v12, sel_tableView_heightForFooterInSection_, v6, a4);
  if (!v7)
  {
    -[CNFRegListController _existingLabelForSection:header:](self, "_existingLabelForSection:header:", a4, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNFRegListController _updateTableLabel:withTableView:isTopMostHeader:](self, "_updateTableLabel:withTableView:isTopMostHeader:", v7, v6, 0);
    v11.receiver = self;
    v11.super_class = (Class)CNFRegListController;
    -[CNFRegListController tableView:heightForFooterInSection:](&v11, sel_tableView_heightForFooterInSection_, v6, a4);
  }
  v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNFRegListController;
  -[CNFRegListController tableView:viewForHeaderInSection:](&v9, sel_tableView_viewForHeaderInSection_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNFRegListController _updateTableLabel:withTableView:isTopMostHeader:](self, "_updateTableLabel:withTableView:isTopMostHeader:", v7, v6, a4 == 0);
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNFRegListController;
  -[CNFRegListController tableView:viewForFooterInSection:](&v9, sel_tableView_viewForFooterInSection_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CNFRegListController _updateTableLabel:withTableView:isTopMostHeader:](self, "_updateTableLabel:withTableView:isTopMostHeader:", v7, v6, 0);
  }

  return v7;
}

- (void)showAuthKitSignInIfNecessary
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEBUG, "Asked to show AuthKit Sign In", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController regController](self, "regController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "serviceType");

  if (v5 == 2)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BE50368], "facetimeService");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v5 != 1)
  {
    if (v5)
    {
      OSLogHandleForIDSCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEBUG, "Unsupported FTCServiceType provided from regController. Likely programming error.", v13, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
      goto LABEL_20;
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BE50368], "iMessageService");
  v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v7 = (void *)v6;
  if (v6)
  {
    v11 = 0;
    if (+[CNFRegAppleIDSplashViewController shouldShowSplashViewForService:inProgressRegisteringNonPhoneAccount:](CNFRegAppleIDSplashViewController, "shouldShowSplashViewForService:inProgressRegisteringNonPhoneAccount:", v6, &v11))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "postNotificationName:object:", CFSTR("CNFSettingsViewControllerNeedsContainerUpdate"), 0);

    }
    return;
  }
LABEL_20:
  OSLogHandleForIDSCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_DEBUG, "No IMService found for regController. Will now show Apple ID Splash.", v12, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
}

- (void)_setupEventHandlers
{
  NSObject *v3;
  uint8_t v4[16];

  OSLogHandleForIDSCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2138BA000, v3, OS_LOG_TYPE_DEBUG, "Setting up event handlers", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    IMLogString();
  -[CNFRegListController removeAllHandlers](self, "removeAllHandlers");
}

- (void)removeAllHandlers
{
  id v2;

  -[CNFRegListController regController](self, "regController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllHandlers");

}

- (id)appearBlock
{
  return self->_appearBlock;
}

- (BOOL)showingChildController
{
  return self->_showingChildController;
}

- (void)setShowingChildController:(BOOL)a3
{
  self->_showingChildController = a3;
}

- (BOOL)shouldRerootPreferences
{
  return self->_shouldRerootPreferences;
}

- (void)setShouldRerootPreferences:(BOOL)a3
{
  self->_shouldRerootPreferences = a3;
}

- (CNFRegController)regController
{
  return self->_regController;
}

- (void)setRegController:(id)a3
{
  objc_storeStrong((id *)&self->_regController, a3);
}

- (BOOL)appeared
{
  return self->_appeared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regController, 0);
  objc_storeStrong(&self->_appearBlock, 0);
}

@end
