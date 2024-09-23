@implementation WirelessModemBundleController

- (WirelessModemBundleController)initWithParentListController:(id)a3
{
  WirelessModemBundleController *v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSString *carrierName;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSString *tetheringURL;
  NSObject *v20;
  uint64_t v21;
  id v22;
  NSString *tetheringPhoneNumber;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  WirelessModemBundleController *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)WirelessModemBundleController;
  v3 = -[WirelessModemBundleController initWithParentListController:](&v33, sel_initWithParentListController_, a3);
  if (!v3)
  {
LABEL_28:
    v27 = v3;
    goto LABEL_29;
  }
  if ((MGGetBoolAnswer() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_MISStateChangedNotification_, CFSTR("MISManagerStateChangedNotification"), 0);

    v5 = WiFiManagerClientCreate();
    if (v5)
    {
      v6 = (const void *)v5;
      v3->_wifiTetheringSupported = WiFiManagerClientIsTetheringSupported() != 0;
      CFRelease(v6);
    }
    v7 = objc_alloc_init(MEMORY[0x24BDC2810]);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
    v32 = 0;
    objc_msgSend(v7, "getCurrentDataSubscriptionContextSync:", &v32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v32;
    if (v10)
    {
      v11 = v10;
      WMSLogComponent();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WirelessModemBundleController initWithParentListController:].cold.4();

    }
    v31 = 0;
    v13 = objc_msgSend(v7, "copyCarrierBundleValue:key:bundleType:error:", v9, CFSTR("CarrierName"), v8, &v31);
    v14 = v31;
    carrierName = v3->_carrierName;
    v3->_carrierName = (NSString *)v13;

    if (v14)
    {
      WMSLogComponent();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[WirelessModemBundleController initWithParentListController:].cold.3();

    }
    v30 = 0;
    v17 = objc_msgSend(v7, "copyCarrierBundleValue:key:bundleType:error:", v9, CFSTR("TetheringURL"), v8, &v30);
    v18 = v30;
    tetheringURL = v3->_tetheringURL;
    v3->_tetheringURL = (NSString *)v17;

    if (v18)
    {
      WMSLogComponent();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[WirelessModemBundleController initWithParentListController:].cold.2();

    }
    v29 = 0;
    v21 = objc_msgSend(v7, "copyCarrierBundleValue:key:bundleType:error:", v9, CFSTR("TetheringPhoneNumber"), v8, &v29);
    v22 = v29;
    tetheringPhoneNumber = v3->_tetheringPhoneNumber;
    v3->_tetheringPhoneNumber = (NSString *)v21;

    if (v22)
    {
      WMSLogComponent();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[WirelessModemBundleController initWithParentListController:].cold.1();

    }
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
    {
      +[MISManager sharedManager](MISManager, "sharedManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "authenticate");

    }
    else
    {
      dispatch_sync(MEMORY[0x24BDAC9B8], &__block_literal_global_0);
    }

    goto LABEL_28;
  }
  WMSLogComponent();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[WirelessModemBundleController initWithParentListController:].cold.5(v26);

  v27 = 0;
LABEL_29:

  return v27;
}

- (id)specifiersWithSpecifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[WirelessModemBundleController _specifiersWithSpecifierMain:](self, "_specifiersWithSpecifierMain:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v13[5];
    v13[5] = v5;

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__WirelessModemBundleController_specifiersWithSpecifier___block_invoke;
    block[3] = &unk_24FDBB520;
    v11 = &v12;
    block[4] = self;
    v10 = v4;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

  }
  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_specifiersWithSpecifierMain:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *specifiers;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  specifiers = self->_specifiers;
  self->_specifiers = v4;

  v13 = 0;
  +[MISManager sharedManager](MISManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getState:andReason:", (char *)&v13 + 4, &v13);

  WMSLogComponent();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[WirelessModemBundleController _specifiersWithSpecifierMain:].cold.1((int *)&v13 + 1, (int *)&v13, v7);

  v15[0] = CFSTR("ph-mis-state");
  v14[0] = CFSTR("type");
  v14[1] = CFSTR("value");
  if ((HIDWORD(v13) - 1020) > 3)
    v8 = CFSTR("unknown");
  else
    v8 = off_24FDBB540[HIDWORD(v13) - 1020];
  v15[1] = v8;
  v14[2] = CFSTR("context");
  if (v13 > 6)
    v9 = CFSTR("unknown");
  else
    v9 = off_24FDBB560[(int)v13];
  v15[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WMSubmitUIEventMetric(v10);

  if (HIDWORD(v13) != 1020)
  {
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24FDBBCF8, self, 0, 0, 0, -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", CFSTR("INTERNET_TETHERING"), *MEMORY[0x24BE75AC0]);
    -[WirelessModemBundleController updateSpecifiersForState:andReason:andButton:](self, "updateSpecifiersForState:andReason:andButton:", HIDWORD(v13), v13, v11);
    -[NSMutableArray addObject:](self->_specifiers, "addObject:", v11);

  }
  return self->_specifiers;
}

void __62__WirelessModemBundleController_initWithParentListController___block_invoke()
{
  id v0;

  +[MISManager sharedManager](MISManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "authenticate");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UIAlertController dismissViewControllerAnimated:completion:](self->_tetheringAlert, "dismissViewControllerAnimated:completion:", 1, 0);
  v4.receiver = self;
  v4.super_class = (Class)WirelessModemBundleController;
  -[WirelessModemBundleController dealloc](&v4, sel_dealloc);
}

- (void)MISStateChangedNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WirelessModemBundleController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke;
  v6[3] = &unk_24FDBB4D0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id WeakRetained;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("State"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Reason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PreviousState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  if (v10 == 1020)
  {
    if (v4 < 0x3FD)
      return;
    WMSLogComponent();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + (int)*MEMORY[0x24BE75688]));
    objc_msgSend(WeakRetained, "reloadSpecifiers");
    goto LABEL_14;
  }
  if ((_DWORD)v4 != 1020)
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "count"))
      goto LABEL_15;
    v29 = *(id **)(a1 + 40);
    objc_msgSend(v29[6], "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "updateSpecifiersForState:andReason:andButton:", v4, v7, v30);

    WMSLogComponent();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_3(v31, v32, v33, v34, v35, v36, v37, v38);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + (int)*MEMORY[0x24BE75688]));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "objectAtIndexedSubscript:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v39, 1);

LABEL_14:
LABEL_15:
    if (v4 >= 0x3FE)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "dismissViewControllerAnimated:completion:", 1, 0);
    return;
  }
  WMSLogComponent();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);

  v28 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + (int)*MEMORY[0x24BE75688]));
  objc_msgSend(v28, "removeContiguousSpecifiers:animated:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), 1);

}

- (void)showSetupAlert:(id)a3
{
  id v4;
  id *p_tetheringAlert;
  void *v6;
  uint64_t v7;
  NSString *v8;
  NSString *tetheringPhoneNumber;
  NSString *tetheringURL;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id WeakRetained;
  NSString *v37;
  NSString *v38;
  void *v39;
  NSString *v40;
  void *v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[6];

  v4 = a3;
  p_tetheringAlert = (id *)&self->_tetheringAlert;
  if (self->_tetheringAlert)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SETUP_ALERT_TITLE"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = self->_carrierName;
  tetheringPhoneNumber = self->_tetheringPhoneNumber;
  tetheringURL = self->_tetheringURL;
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v42 = v4;
  if (tetheringPhoneNumber)
  {
    if (tetheringURL)
    {
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SETUP_ALERT_MESSAGE_ALL_INFO"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_tetheringPhoneNumber;
      v38 = self->_tetheringURL;
    }
    else
    {
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SETUP_ALERT_MESSAGE_NO_URL"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_tetheringPhoneNumber;
    }
    v37 = v15;
    goto LABEL_9;
  }
  if (!tetheringURL)
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SETUP_ALERT_MESSAGE_NO_INFO"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    objc_msgSend(v11, "stringWithFormat:", v14, v8, v37, v38);
    goto LABEL_10;
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SETUP_ALERT_MESSAGE_NO_NUMBER"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v14, self->_tetheringURL, v37, v38);
LABEL_10:
  v16 = objc_claimAutoreleasedReturnValue();
  v40 = v8;

  WMSLogComponent();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[WirelessModemBundleController showSetupAlert:].cold.2(v7, v16, v17);

  v41 = (void *)v7;
  v39 = (void *)v16;
  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v7, v16, 1);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *p_tetheringAlert;
  *p_tetheringAlert = (id)v18;

  v20 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SETUP_ALERT_WEB_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __48__WirelessModemBundleController_showSetupAlert___block_invoke;
  v44[3] = &unk_24FDBB4F8;
  v44[4] = self;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 0, v44);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SETUP_ALERT_CALL_BUTTON"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v23;
  v43[1] = 3221225472;
  v43[2] = __48__WirelessModemBundleController_showSetupAlert___block_invoke_47;
  v43[3] = &unk_24FDBB4F8;
  v43[4] = self;
  objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 0, v43);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = self->_tetheringURL;
  if (self->_tetheringPhoneNumber)
    objc_msgSend(*p_tetheringAlert, "addAction:", v28);
  if (v29)
    objc_msgSend(*p_tetheringAlert, "addAction:", v24);
  v30 = *p_tetheringAlert;
  v31 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 1, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAction:", v34);

  v4 = v42;
LABEL_17:
  WMSLogComponent();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    -[WirelessModemBundleController showSetupAlert:].cold.1();

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", *p_tetheringAlert, 1, 0);

}

uint64_t __48__WirelessModemBundleController_showSetupAlert___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  WMSLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48__WirelessModemBundleController_showSetupAlert___block_invoke_cold_1();

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v4, 0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __48__WirelessModemBundleController_showSetupAlert___block_invoke_47(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WMSLogComponent();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __48__WirelessModemBundleController_showSetupAlert___block_invoke_47_cold_1();

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("tel:%@"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withCompletionHandler:", v6, 0);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)getTetheringStatus:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  int v10;

  v10 = 0;
  +[MISManager sharedManager](MISManager, "sharedManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getState:andReason:", &v10, 0);

  v4 = v10;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 1023)
    v7 = CFSTR("ON");
  else
    v7 = CFSTR("OFF");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)updateSpecifiersForState:(int)a3 andReason:(int)a4 andButton:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char *v20;

  v20 = (char *)a5;
  v7 = *MEMORY[0x24BE75998];
  objc_msgSend(v20, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75998]);
  v8 = *MEMORY[0x24BE75A18];
  objc_msgSend(v20, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  v9 = v20;
  if (a3 != 1020)
  {
    if (a3 != 1021 || a4 == 2)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MAIN_SPEC_PROVISIONED"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setName:", v13);

      v14 = (int *)MEMORY[0x24BE75738];
      *(_QWORD *)&v20[*MEMORY[0x24BE75738]] = 2;
      *(_QWORD *)&v20[*MEMORY[0x24BE75750]] = sel_getTetheringStatus_;
      *(_QWORD *)&v20[*MEMORY[0x24BE75740]] = objc_opt_class();
      v9 = v20;
      if (a4 == 4
        && (+[MISManager sharedManager](MISManager, "sharedManager"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v15, "didUserPreventData"),
            v15,
            v9 = v20,
            v16))
      {
        v17 = MEMORY[0x24BDBD1C0];
        v18 = v20;
        v19 = v8;
      }
      else
      {
        if (a3 != 1021)
          goto LABEL_13;
        *(_QWORD *)&v9[*v14] = 6;
        v17 = MEMORY[0x24BDBD1C8];
        v18 = v20;
        v19 = v7;
      }
      objc_msgSend(v18, "setProperty:forKey:", v17, v19);
      v9 = v20;
      goto LABEL_13;
    }
    if (a4 == 4)
      objc_msgSend(v20, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v8);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MAIN_SPEC_UNPROVISIONED"), &stru_24FDBBCF8, CFSTR("WirelessModemSettings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setName:", v11);

    *(_QWORD *)&v20[*MEMORY[0x24BE75738]] = 13;
    objc_msgSend(v20, "setButtonAction:", sel_showSetupAlert_);
    v9 = v20;
    *(_QWORD *)&v20[*MEMORY[0x24BE75750]] = 0;
    *(_QWORD *)&v20[*MEMORY[0x24BE75740]] = 0;
  }
LABEL_13:

}

void __57__WirelessModemBundleController_specifiersWithSpecifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_specifiersWithSpecifierMain:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_tetheringURL, 0);
  objc_storeStrong((id *)&self->_tetheringPhoneNumber, 0);
  objc_storeStrong((id *)&self->_tetheringAlert, 0);
}

- (void)initWithParentListController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_22FE37000, v0, v1, "Error returned when trying to get tethering phone number: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithParentListController:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_22FE37000, v0, v1, "Error returned when trying to get tethering URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithParentListController:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_22FE37000, v0, v1, "Error returned when trying to get carrier name: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithParentListController:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_22FE37000, v0, v1, "Error returned when trying to get current Data Subscription Context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithParentListController:(os_log_t)log .cold.5(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22FE37000, log, OS_LOG_TYPE_ERROR, "Device doesn't have Personal Hotspot!", v1, 2u);
}

void __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FE37000, a1, a3, "%s - reloading ALL parent specs", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FE37000, a1, a3, "%s - removing ourselves from the parent list", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __61__WirelessModemBundleController_MISStateChangedNotification___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22FE37000, a1, a3, "%s - reloading just our specifier", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)showSetupAlert:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22FE37000, v0, v1, "%s: showing tethering alert %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)showSetupAlert:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[WirelessModemBundleController showSetupAlert:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_22FE37000, log, OS_LOG_TYPE_ERROR, "%s: title %@ message %@", (uint8_t *)&v3, 0x20u);
}

void __48__WirelessModemBundleController_showSetupAlert___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22FE37000, v0, v1, "%s: tapped setup web button, url %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __48__WirelessModemBundleController_showSetupAlert___block_invoke_47_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_22FE37000, v0, v1, "%s: tapped call button, phone %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_specifiersWithSpecifierMain:(os_log_t)log .cold.1(int *a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_22FE37000, log, OS_LOG_TYPE_ERROR, "Initial MIS state: %u, reason: %u", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_1();
}

@end
