@implementation WDContactConsolidationController

- (WDContactConsolidationController)initWithProfile:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  WDContactConsolidationController *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WDContactConsolidationController;
  v8 = -[WDContactConsolidationController init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "healthStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDContactConsolidationController setHealthStore:](v8, "setHealthStore:", v9);

    objc_msgSend(v6, "notificationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDContactConsolidationController setNotificationManager:](v8, "setNotificationManager:", v10);

    -[WDContactConsolidationController setPresentingViewController:](v8, "setPresentingViewController:", v7);
  }

  return v8;
}

- (BOOL)isPresentingConsolidationAlert
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_consolidationAlertController);
  v3 = WeakRetained != 0;

  return v3;
}

- (SOSContactsManager)sosContactsManager
{
  SOSContactsManager *sosContactsManager;
  void *v4;
  objc_class *v5;
  SOSContactsManager *v6;
  SOSContactsManager *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  sosContactsManager = self->_sosContactsManager;
  if (!sosContactsManager)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getSOSContactsManagerClass_softClass;
    v13 = getSOSContactsManagerClass_softClass;
    if (!getSOSContactsManagerClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getSOSContactsManagerClass_block_invoke;
      v9[3] = &unk_24D38E168;
      v9[4] = &v10;
      __getSOSContactsManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (SOSContactsManager *)objc_alloc_init(v5);
    v7 = self->_sosContactsManager;
    self->_sosContactsManager = v6;

    sosContactsManager = self->_sosContactsManager;
  }
  return sosContactsManager;
}

- (void)presentContactConsolidationAlertWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_215814000, v5, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - presentContactConsolidationAlertWithCompletionHandler", v6, 2u);
  }
  -[WDContactConsolidationController setCompletionHandler:](self, "setCompletionHandler:", v4);

  -[WDContactConsolidationController checkAlertNecessity](self, "checkAlertNecessity");
}

- (void)checkAlertNecessity
{
  uint64_t v3;
  os_log_t *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[16];

  v3 = objc_msgSend(MEMORY[0x24BDBACF8], "authorizationStatusForEntityType:", 0);
  _HKInitializeLogging();
  v4 = (os_log_t *)MEMORY[0x24BDD2FE8];
  v5 = *MEMORY[0x24BDD2FE8];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT);
  if (v3 != 3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = "WDContactConsolidationLearnMoreViewController - current process is not authorized to access contacts, skip co"
           "ntact consolidation";
      goto LABEL_9;
    }
LABEL_10:
    -[WDContactConsolidationController notificationManager](self, "notificationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resetEmergencySOSBadge");

    goto LABEL_11;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215814000, v5, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - Checking alert necessity", buf, 2u);
  }
  if (objc_msgSend(getSOSUtilitiesClass(), "isAllowedToMessageSOSContacts"))
  {
    _HKInitializeLogging();
    v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "WDContactConsolidationLearnMoreViewController - isAllowedToMessageSOSContacts - true";
LABEL_9:
      _os_log_impl(&dword_215814000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(getSOSManagerClass(), "deviceSupportsSOS") & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD4198], "hasPairedWatch") & 1) != 0)
  {
    v11 = objc_alloc(MEMORY[0x24BDD3CF0]);
    -[WDContactConsolidationController healthStore](self, "healthStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void (**)(void))objc_msgSend(v11, "initWithHealthStore:", v12);

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __55__WDContactConsolidationController_checkAlertNecessity__block_invoke;
    v15[3] = &unk_24D38E140;
    v15[4] = self;
    objc_msgSend(v10, "fetchMedicalIDDataWithCompletion:", v15);
    goto LABEL_16;
  }
  _HKInitializeLogging();
  v13 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215814000, v13, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - ![getSOSManagerClass() deviceSupportsSOS] && ![_HKBehavior hasPairedWatch]", buf, 2u);
  }
  -[WDContactConsolidationController notificationManager](self, "notificationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "resetEmergencySOSBadge");

  objc_msgSend(getSOSUtilitiesClass(), "setAllowedToMessageSOSContacts:", 1);
LABEL_11:
  -[WDContactConsolidationController completionHandler](self, "completionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return;
  -[WDContactConsolidationController completionHandler](self, "completionHandler");
  v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v10[2]();
LABEL_16:

}

void __55__WDContactConsolidationController_checkAlertNecessity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215814000, v4, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - fetched medical id", buf, 2u);
  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__WDContactConsolidationController_checkAlertNecessity__block_invoke_227;
  v6[3] = &unk_24D38CEC0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __55__WDContactConsolidationController_checkAlertNecessity__block_invoke_227(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(void);
  uint8_t v13[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "setMedicalIDData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "medicalIDData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "emergencyContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

LABEL_4:
    _HKInitializeLogging();
    v8 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_215814000, v8, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - presentContactsConsolidationAlert", v13, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "presentContactsConsolidationAlert");
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "sosContactsManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "legacyContactsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SOSLegacyContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    goto LABEL_4;
  _HKInitializeLogging();
  v9 = *MEMORY[0x24BDD2FE8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215814000, v9, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - self.medicalIDData.emergencyContacts.count == 0 && self.sosContactsManager.legacyContactsManager.SOSLegacyContacts.count == 0", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "notificationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resetEmergencySOSBadge");

  objc_msgSend(getSOSUtilitiesClass(), "setAllowedToMessageSOSContacts:", 1);
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();

  }
}

- (void)presentContactsConsolidationAlert
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  NSObject *v22;
  void *v23;
  void *v24;
  uint8_t buf[16];
  _QWORD v26[5];
  _QWORD v27[5];

  -[WDContactConsolidationController consolidationAlertController](self, "consolidationAlertController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_msgSend(getSOSManagerClass(), "deviceSupportsSOS");
    WDBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = CFSTR("MEDICAL_ID_CONSOLIDATION_ALERT_BODY");
    else
      v7 = CFSTR("MEDICAL_ID_CONSOLIDATION_ALERT_BODY_WATCH_ONLY");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDF67F0];
    WDBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MEDICAL_ID_CONSOLIDATION_ALERT_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v11, v8, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BDF67E8];
    WDBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_MORE_INFO_BUTTON"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __69__WDContactConsolidationController_presentContactsConsolidationAlert__block_invoke;
    v27[3] = &unk_24D38D350;
    v27[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAction:", v17);
    v18 = (void *)MEMORY[0x24BDF67E8];
    WDBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __69__WDContactConsolidationController_presentContactsConsolidationAlert__block_invoke_2;
    v26[3] = &unk_24D38D350;
    v26[4] = self;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addAction:", v21);
    -[WDContactConsolidationController setConsolidationAlertController:](self, "setConsolidationAlertController:", v12);
    _HKInitializeLogging();
    v22 = *MEMORY[0x24BDD2FE8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FE8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215814000, v22, OS_LOG_TYPE_DEFAULT, "WDContactConsolidationLearnMoreViewController - presentingViewController presentViewController:self.consolidationAlertController", buf, 2u);
    }
    -[WDContactConsolidationController presentingViewController](self, "presentingViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WDContactConsolidationController consolidationAlertController](self, "consolidationAlertController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "presentViewController:animated:completion:", v24, 1, 0);

  }
}

uint64_t __69__WDContactConsolidationController_presentContactsConsolidationAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showLearnMoreViewController");
}

void __69__WDContactConsolidationController_presentContactsConsolidationAlert__block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "_consolidateSOSContactsWithMedicalIDContacts");
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)_showLearnMoreViewController
{
  WDContactConsolidationLearnMoreViewController *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  v3 = objc_alloc_init(WDContactConsolidationLearnMoreViewController);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __64__WDContactConsolidationController__showLearnMoreViewController__block_invoke;
  v10 = &unk_24D38CFD8;
  objc_copyWeak(&v11, &location);
  -[WDContactConsolidationLearnMoreViewController setDismissHandler:](v3, "setDismissHandler:", &v7);
  v4 = objc_alloc(MEMORY[0x24BE4A728]);
  v5 = (void *)objc_msgSend(v4, "initWithRootViewController:", v3, v7, v8, v9, v10);
  -[WDContactConsolidationController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __64__WDContactConsolidationController__showLearnMoreViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "presentContactsConsolidationAlert");
    WeakRetained = v2;
  }

}

- (void)_consolidateSOSContactsWithMedicalIDContacts
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[WDContactConsolidationController medicalIDData](self, "medicalIDData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD4218]);
    -[WDContactConsolidationController setMedicalIDData:](self, "setMedicalIDData:", v4);

  }
  -[WDContactConsolidationController sosContactsManager](self, "sosContactsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyContactsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "SOSLegacyContactsExist");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBool:forKey:", 1, *MEMORY[0x24BE4A1D8]);

  }
  -[WDContactConsolidationController medicalIDData](self, "medicalIDData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDContactConsolidationController sosContactsManager](self, "sosContactsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "consolidatedSOSContactsWithSOSContactsManager:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v11, "mutableCopy");

  -[WDContactConsolidationController medicalIDData](self, "medicalIDData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEmergencyContacts:", v18);

  v13 = objc_alloc(MEMORY[0x24BDD3CF0]);
  -[WDContactConsolidationController healthStore](self, "healthStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithHealthStore:", v14);

  -[WDContactConsolidationController medicalIDData](self, "medicalIDData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "updateMedicalIDData:completion:", v16, 0);

  -[WDContactConsolidationController notificationManager](self, "notificationManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resetEmergencySOSBadge");

  objc_msgSend(getSOSUtilitiesClass(), "setAllowedToMessageSOSContacts:", 1);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (_HKMedicalIDData)medicalIDData
{
  return self->_medicalIDData;
}

- (void)setMedicalIDData:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDData, a3);
}

- (void)setSosContactsManager:(id)a3
{
  objc_storeStrong((id *)&self->_sosContactsManager, a3);
}

- (WDNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (void)setNotificationManager:(id)a3
{
  objc_storeStrong((id *)&self->_notificationManager, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIAlertController)consolidationAlertController
{
  return (UIAlertController *)objc_loadWeakRetained((id *)&self->_consolidationAlertController);
}

- (void)setConsolidationAlertController:(id)a3
{
  objc_storeWeak((id *)&self->_consolidationAlertController, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_consolidationAlertController);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_sosContactsManager, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
