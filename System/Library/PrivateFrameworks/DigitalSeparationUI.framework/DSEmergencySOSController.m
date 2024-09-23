@implementation DSEmergencySOSController

- (DSEmergencySOSController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  DSEmergencySOSController *v9;
  os_log_t v10;
  void *v11;
  HKHealthStore *v12;
  HKHealthStore *healthStore;
  uint64_t v14;
  HKMedicalIDStore *medicalIDStore;
  id v16;
  uint64_t v17;
  DSAppSharing *appSharing;
  NSString *kappaApprovedAppID;
  objc_super v21;

  v3 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("EmergencySOSIcon"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  DSUILocStringForKey(CFSTR("EMERGENCY_SOS_DETAIL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE82B80], "isKappaUnmasked")
    && objc_msgSend(MEMORY[0x24BE82B80], "isKappaDetectionSupportedOnCurrentDevice"))
  {
    DSUILocStringForKeyInTable(CFSTR("EMERGENCY_SOS_DETAIL_WITH_CRASH"), CFSTR("DigitalSeparationUI-SYDRO_FEATURES"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  DSUILocStringForKey(CFSTR("EMERGENCY_SOS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)DSEmergencySOSController;
  v9 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v21, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, v8, v6, v5, 0);

  if (v9)
  {
    v10 = os_log_create("com.apple.DigitalSeparation", "DSEmergencySOSController");
    v11 = (void *)DSLog_11;
    DSLog_11 = (uint64_t)v10;

    v12 = (HKHealthStore *)objc_alloc_init(MEMORY[0x24BDD3C40]);
    healthStore = v9->_healthStore;
    v9->_healthStore = v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD3CF0]), "initWithHealthStore:", v9->_healthStore);
    medicalIDStore = v9->_medicalIDStore;
    v9->_medicalIDStore = (HKMedicalIDStore *)v14;

    v16 = objc_alloc_init(MEMORY[0x24BE2CC90]);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE2CC50]), "initWithTCCStore:", v16);
    appSharing = v9->_appSharing;
    v9->_appSharing = (DSAppSharing *)v17;

    kappaApprovedAppID = v9->_kappaApprovedAppID;
    v9->_kappaApprovedAppID = 0;

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DSEmergencySOSController;
  -[DSTableWelcomeController viewDidLoad](&v9, sel_viewDidLoad);
  -[DSEmergencySOSController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    DSUILocStringForKey(CFSTR("CONTINUE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", self, v4, v3, sel_pushNextPane);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setBoldButton:](self, "setBoldButton:", v5);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditing:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsSelectionDuringEditing:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsMultipleSelectionDuringEditing:", 0);

  self->_hasRetriedEmergencyContactFetch = 0;
  -[DSEmergencySOSController gatherEmergencyContacts](self, "gatherEmergencyContacts");
  -[DSEmergencySOSController updateKappaBundleID](self, "updateKappaBundleID");

}

- (void)updateKappaBundleID
{
  void *v3;
  _QWORD v4[5];

  -[DSEmergencySOSController appSharing](self, "appSharing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__DSEmergencySOSController_updateKappaBundleID__block_invoke;
  v4[3] = &unk_24EFF33F0;
  v4[4] = self;
  objc_msgSend(v3, "approvedBundleIdForKappa:handler:", MEMORY[0x24BDAC9B8], v4);

}

void __47__DSEmergencySOSController_updateKappaBundleID__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setKappaApprovedAppID:", v4);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (BOOL)maybeRetryDueToError:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD0B88]) || objc_msgSend(v6, "code") != 4097)
  {

    goto LABEL_8;
  }
  v9 = -[DSEmergencySOSController hasRetriedEmergencyContactFetch](self, "hasRetriedEmergencyContactFetch");

  if (v9)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" %@"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = DSLog_11;
  if (os_log_type_enabled((os_log_t)DSLog_11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl(&dword_2278DF000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v12 = 1;
  -[DSEmergencySOSController setHasRetriedEmergencyContactFetch:](self, "setHasRetriedEmergencyContactFetch:", 1);
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__DSEmergencySOSController_maybeRetryDueToError_withReason___block_invoke;
  block[3] = &unk_24EFF3670;
  objc_copyWeak(&v16, (id *)buf);
  v13 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

LABEL_9:
  return v12;
}

void __60__DSEmergencySOSController_maybeRetryDueToError_withReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "gatherEmergencyContacts");

}

- (void)gatherEmergencyContacts
{
  void *v3;
  NSObject *v4;
  HKMedicalIDStore *medicalIDStore;
  uint64_t v6;
  NSObject *v7;
  HKMedicalIDStore *v8;
  NSObject *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id location;

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showsBusyIndicator");

  objc_initWeak(&location, self);
  v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  medicalIDStore = self->_medicalIDStore;
  v6 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke;
  v14[3] = &unk_24EFF4420;
  objc_copyWeak(&v16, &location);
  v7 = v4;
  v15 = v7;
  -[HKMedicalIDStore fetchMedicalIDDataWithCompletion:](medicalIDStore, "fetchMedicalIDDataWithCompletion:", v14);
  dispatch_group_enter(v7);
  v8 = self->_medicalIDStore;
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_222;
  v11[3] = &unk_24EFF4448;
  objc_copyWeak(&v13, &location);
  v9 = v7;
  v12 = v9;
  -[HKMedicalIDStore fetchMedicalIDEmergencyContactsWithCompletion:](v8, "fetchMedicalIDEmergencyContactsWithCompletion:", v11);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_2;
  v10[3] = &unk_24EFF33A0;
  v10[4] = self;
  dispatch_group_notify(v9, MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v6)
      goto LABEL_6;
    if (os_log_type_enabled((os_log_t)DSLog_11, OS_LOG_TYPE_ERROR))
      __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_cold_1();
    if ((objc_msgSend(WeakRetained, "maybeRetryDueToError:withReason:", v6, CFSTR("Retrying medicalIDData fetch.")) & 1) == 0)
    {
LABEL_6:
      if (v5)
      {
        objc_msgSend(WeakRetained, "setMedicalIDData:", v5);
      }
      else
      {
        v8 = objc_alloc_init(MEMORY[0x24BDD4218]);
        objc_msgSend(WeakRetained, "setMedicalIDData:", v8);

      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    }
  }

}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v6)
      goto LABEL_6;
    if (os_log_type_enabled((os_log_t)DSLog_11, OS_LOG_TYPE_ERROR))
      __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_222_cold_1();
    if ((objc_msgSend(WeakRetained, "maybeRetryDueToError:withReason:", v6, CFSTR("Retrying emergencyContacts fetch.")) & 1) == 0)
    {
LABEL_6:
      v8 = DSLog_11;
      if (os_log_type_enabled((os_log_t)DSLog_11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v5;
        _os_log_impl(&dword_2278DF000, v8, OS_LOG_TYPE_INFO, "Fetched emergencyContacts: %@ ", buf, 0xCu);
      }
      objc_initWeak((id *)buf, WeakRetained);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_225;
      v9[3] = &unk_24EFF3708;
      objc_copyWeak(&v11, (id *)buf);
      v10 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v9);
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_225(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setEmergencyContacts:", v1);

}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "boldButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hidesBusyIndicator");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[DSEmergencySOSController hasAppWithKappaApproved](self, "hasAppWithKappaApproved", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v4;
  void *v5;

  if (a4 == 1)
    return 1;
  -[DSEmergencySOSController emergencyContacts](self, "emergencyContacts", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "count") + 1;

  return v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4 == 1)
    DSUILocStringForKeyInTable(CFSTR("CAR_CRASH_TABLE_TITLE"), CFSTR("DigitalSeparationUI-SYDRO_FEATURES"));
  else
    DSUILocStringForKey(CFSTR("EMERGENCY_SOS_TABLE_TITLE"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4 != 1)
    return &stru_24EFF4790;
  DSUILocStringForKeyInTable(CFSTR("CAR_CRASH_TABLE_DETAIL"), CFSTR("DigitalSeparationUI-SYDRO_FEATURES"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
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

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x24BEBD9F8]);
  objc_msgSend(MEMORY[0x24BEBD728], "valueCellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemFillColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  objc_msgSend(v7, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 0);

  objc_msgSend(v7, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineBreakMode:", 0);

  if (objc_msgSend(v5, "section"))
  {
    if (-[DSEmergencySOSController hasAppWithKappaApproved](self, "hasAppWithKappaApproved"))
    {
      -[DSEmergencySOSController kappaApprovedAppID](self, "kappaApprovedAppID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      displayNameForApp();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v12);

      -[DSEmergencySOSController kappaApprovedAppID](self, "kappaApprovedAppID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[DSUIUtilities appIconForAppID:format:](DSUIUtilities, "appIconForAppID:format:", v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImage:", v14);

    }
  }
  else
  {
    v15 = objc_msgSend(v5, "row");
    -[DSEmergencySOSController emergencyContacts](self, "emergencyContacts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v15 >= v17)
    {
      DSUILocStringForKey(CFSTR("ADD_EMERGENCY_CONTACT"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v24);

      objc_msgSend(v7, "textProperties");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setColor:", v26);

      v27 = objc_msgSend(v6, "accessibilityTraits");
      objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BEBDF00] | v27);
    }
    else
    {
      -[DSEmergencySOSController emergencyContacts](self, "emergencyContacts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setText:", v20);

      -[DSEmergencySOSController emergencyContacts](self, "emergencyContacts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "phoneNumber");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSecondaryText:", v23);

      objc_msgSend(v7, "setPrefersSideBySideTextAndSecondaryText:", 0);
    }
  }
  objc_msgSend(v6, "setContentConfiguration:", v7);

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    v6 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "row");
    -[DSEmergencySOSController emergencyContacts](self, "emergencyContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = v7 == objc_msgSend(v8, "count");

    if ((v7 & 1) != 0)
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  BOOL v6;
  uint64_t v7;
  void *v8;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "row");
    -[DSEmergencySOSController emergencyContacts](self, "emergencyContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == objc_msgSend(v8, "count");

  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a4;
  v6 = a3;
  objc_msgSend(v6, "indexPathForSelectedRow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

  if (!objc_msgSend(v11, "section"))
  {
    v8 = objc_msgSend(v11, "row");
    -[DSEmergencySOSController emergencyContacts](self, "emergencyContacts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 == v10)
      -[DSEmergencySOSController chooseNewEmergencyContact](self, "chooseNewEmergencyContact");
  }

}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  if (objc_msgSend(v9, "section"))
  {
    -[DSEmergencySOSController revokeKappaPermission](self, "revokeKappaPermission");
  }
  else if (a4 == 2)
  {
    -[DSEmergencySOSController chooseNewEmergencyContact](self, "chooseNewEmergencyContact");
  }
  else if (a4 == 1)
  {
    -[DSEmergencySOSController emergencyContacts](self, "emergencyContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v9, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[DSEmergencySOSController removeEmergencyContact:](self, "removeEmergencyContact:", v8);
  }

}

- (void)_showMaxContactsAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("MAX_SOS_CONTACTS_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v4, 0, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("OK"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 1, &__block_literal_global_18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v7);

  -[DSEmergencySOSController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

- (void)removeEmergencyContact:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[DSEmergencySOSController medicalIDStore](self, "medicalIDStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__DSEmergencySOSController_removeEmergencyContact___block_invoke;
  v6[3] = &unk_24EFF4388;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "removeEmergencyContact:completion:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __51__DSEmergencySOSController_removeEmergencyContact___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD block[4];
  id v8;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__DSEmergencySOSController_removeEmergencyContact___block_invoke_2;
    block[3] = &unk_24EFF3670;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v8);
  }
  else if (v5 && os_log_type_enabled((os_log_t)DSLog_11, OS_LOG_TYPE_ERROR))
  {
    __51__DSEmergencySOSController_removeEmergencyContact___block_invoke_cold_1();
  }

}

void __51__DSEmergencySOSController_removeEmergencyContact___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "gatherEmergencyContacts");

}

- (void)chooseNewEmergencyContact
{
  id v3;
  void *v4;
  HKMedicalIDEmergencyContactFlow *v5;
  HKMedicalIDEmergencyContactFlow *contactFlow;
  void *v7;
  id v8;

  v3 = objc_alloc(MEMORY[0x24BE4A6F0]);
  -[DSEmergencySOSController medicalIDData](self, "medicalIDData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (HKMedicalIDEmergencyContactFlow *)objc_msgSend(v3, "initWithPresentingViewController:forMedicalIDData:", self, v4);
  contactFlow = self->_contactFlow;
  self->_contactFlow = v5;

  -[DSEmergencySOSController contactFlow](self, "contactFlow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[DSEmergencySOSController contactFlow](self, "contactFlow");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentEmergencyContactFlow");

}

- (void)emergencyContactFlowDidCancel:(id)a3
{
  -[DSEmergencySOSController setSelectedEmergencyContact:](self, "setSelectedEmergencyContact:", 0);
}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BE82B80], "isAllowedToMessageSOSContacts") & 1) == 0)
    objc_msgSend(MEMORY[0x24BE82B80], "setAllowedToMessageSOSContacts:", 1);
  -[DSEmergencySOSController medicalIDData](self, "medicalIDData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emergencyContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[DSEmergencySOSController medicalIDData](self, "medicalIDData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "emergencyContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[DSEmergencySOSController medicalIDData](self, "medicalIDData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEmergencyContacts:", v12);

  objc_initWeak(&location, self);
  -[DSEmergencySOSController medicalIDStore](self, "medicalIDStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSEmergencySOSController medicalIDData](self, "medicalIDData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke;
  v16[3] = &unk_24EFF4388;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v14, "updateMedicalIDData:completion:", v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD block[4];
  id v7;

  v5 = a3;
  if (v5 && os_log_type_enabled((os_log_t)DSLog_11, OS_LOG_TYPE_ERROR))
  {
    __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke_cold_1();
    if (!a2)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (a2)
  {
LABEL_4:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke_250;
    block[3] = &unk_24EFF3670;
    objc_copyWeak(&v7, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v7);
  }
LABEL_5:

}

void __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke_250(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "gatherEmergencyContacts");

}

- (void)revokeKappaPermission
{
  void *v3;

  -[DSEmergencySOSController kappaApprovedAppID](self, "kappaApprovedAppID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TCCAccessResetForBundleId();

  -[DSEmergencySOSController updateKappaBundleID](self, "updateKappaBundleID");
}

- (BOOL)hasAppWithKappaApproved
{
  void *v2;
  BOOL v3;

  -[DSEmergencySOSController kappaApprovedAppID](self, "kappaApprovedAppID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKMedicalIDStore)medicalIDStore
{
  return self->_medicalIDStore;
}

- (void)setMedicalIDStore:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDStore, a3);
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDData, a3);
}

- (NSArray)emergencyContacts
{
  return self->_emergencyContacts;
}

- (void)setEmergencyContacts:(id)a3
{
  objc_storeStrong((id *)&self->_emergencyContacts, a3);
}

- (_HKEmergencyContact)selectedEmergencyContact
{
  return self->_selectedEmergencyContact;
}

- (void)setSelectedEmergencyContact:(id)a3
{
  objc_storeStrong((id *)&self->_selectedEmergencyContact, a3);
}

- (HKMedicalIDEmergencyContactFlow)contactFlow
{
  return self->_contactFlow;
}

- (void)setContactFlow:(id)a3
{
  objc_storeStrong((id *)&self->_contactFlow, a3);
}

- (BOOL)hasRetriedEmergencyContactFetch
{
  return self->_hasRetriedEmergencyContactFetch;
}

- (void)setHasRetriedEmergencyContactFetch:(BOOL)a3
{
  self->_hasRetriedEmergencyContactFetch = a3;
}

- (DSAppSharing)appSharing
{
  return self->_appSharing;
}

- (void)setAppSharing:(id)a3
{
  objc_storeStrong((id *)&self->_appSharing, a3);
}

- (NSString)kappaApprovedAppID
{
  return self->_kappaApprovedAppID;
}

- (void)setKappaApprovedAppID:(id)a3
{
  objc_storeStrong((id *)&self->_kappaApprovedAppID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kappaApprovedAppID, 0);
  objc_storeStrong((id *)&self->_appSharing, 0);
  objc_storeStrong((id *)&self->_contactFlow, 0);
  objc_storeStrong((id *)&self->_selectedEmergencyContact, 0);
  objc_storeStrong((id *)&self->_emergencyContacts, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Error fetching medicalIDData: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __51__DSEmergencySOSController_gatherEmergencyContacts__block_invoke_222_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Error fetching emergencyContacts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __51__DSEmergencySOSController_removeEmergencyContact___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Error removing emergencyContact: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

void __66__DSEmergencySOSController_emergencyContactFlow_didSelectContact___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_2278DF000, v0, v1, "Error updating medicalIDData error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0_0();
}

@end
