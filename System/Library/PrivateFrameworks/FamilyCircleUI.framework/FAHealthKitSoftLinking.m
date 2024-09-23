@implementation FAHealthKitSoftLinking

- (id)_pathToEmergencyRow
{
  return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 2);
}

- (FAHealthKitSoftLinking)initWithFamilyCircle:(id)a3
{
  id v5;
  FAHealthKitSoftLinking *v6;
  FAHealthKitSoftLinking *v7;
  void *v8;
  objc_class *v9;
  HKHealthStore *v10;
  HKHealthStore *healthStore;
  void *v12;
  objc_class *v13;
  uint64_t v14;
  HKMedicalIDStore *medicalIDStore;
  void *v16;
  objc_class *v17;
  _HKMedicalIDData *v18;
  _HKMedicalIDData *medicalIDData;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;
  Class (*v24)(uint64_t);
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FAHealthKitSoftLinking;
  v6 = -[FAHealthKitSoftLinking init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_familyCircle, a3);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v8 = (void *)getHKHealthStoreClass_softClass_0;
    v30 = getHKHealthStoreClass_softClass_0;
    if (!getHKHealthStoreClass_softClass_0)
    {
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __getHKHealthStoreClass_block_invoke_0;
      v25 = &unk_24C88B7B0;
      v26 = &v27;
      __getHKHealthStoreClass_block_invoke_0((uint64_t)&v22);
      v8 = (void *)v28[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v27, 8);
    v10 = (HKHealthStore *)objc_alloc_init(v9);
    healthStore = v7->_healthStore;
    v7->_healthStore = v10;

    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v12 = (void *)getHKMedicalIDStoreClass_softClass_0;
    v30 = getHKMedicalIDStoreClass_softClass_0;
    if (!getHKMedicalIDStoreClass_softClass_0)
    {
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __getHKMedicalIDStoreClass_block_invoke_0;
      v25 = &unk_24C88B7B0;
      v26 = &v27;
      __getHKMedicalIDStoreClass_block_invoke_0((uint64_t)&v22);
      v12 = (void *)v28[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v27, 8);
    v14 = objc_msgSend([v13 alloc], "initWithHealthStore:", v7->_healthStore);
    medicalIDStore = v7->_medicalIDStore;
    v7->_medicalIDStore = (HKMedicalIDStore *)v14;

    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v16 = (void *)get_HKMedicalIDDataClass_softClass;
    v30 = get_HKMedicalIDDataClass_softClass;
    if (!get_HKMedicalIDDataClass_softClass)
    {
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __get_HKMedicalIDDataClass_block_invoke;
      v25 = &unk_24C88B7B0;
      v26 = &v27;
      __get_HKMedicalIDDataClass_block_invoke((uint64_t)&v22);
      v16 = (void *)v28[3];
    }
    v17 = objc_retainAutorelease(v16);
    _Block_object_dispose(&v27, 8);
    v18 = (_HKMedicalIDData *)objc_alloc_init(v17);
    medicalIDData = v7->_medicalIDData;
    v7->_medicalIDData = v18;

    -[FAHealthKitSoftLinking _startEmergencyContactsChangeObserver](v7, "_startEmergencyContactsChangeObserver");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[FAHealthKitSoftLinking _stopEmergencyContactsChangeObserver](self, "_stopEmergencyContactsChangeObserver");
  v3.receiver = self;
  v3.super_class = (Class)FAHealthKitSoftLinking;
  -[FAHealthKitSoftLinking dealloc](&v3, sel_dealloc);
}

- (void)updateFamily:(id)a3
{
  objc_storeStrong((id *)&self->_familyCircle, a3);
}

- (void)presentMedicalIDViewController:(id)a3 withFamily:(id)a4 isEmergencyContactSetup:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v9 = a4;
  v8 = a3;
  if (_os_feature_enabled_impl())
    -[FAHealthKitSoftLinking presentMedicalIDV2ViewController:](self, "presentMedicalIDV2ViewController:", v8);
  else
    -[FAHealthKitSoftLinking presentHKMedicalIDViewController:withFamily:isEmergencyContactSetup:](self, "presentHKMedicalIDViewController:withFamily:isEmergencyContactSetup:", v8, v9, v5);

}

- (void)presentMedicalIDV2ViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  MIUIMedicalIDViewController *v10;
  MIUIMedicalIDViewController *medicalIDV2ViewController;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v5 = (void *)getMIUIDisplayConfigurationClass_softClass;
  v23 = getMIUIDisplayConfigurationClass_softClass;
  if (!getMIUIDisplayConfigurationClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getMIUIDisplayConfigurationClass_block_invoke;
    v18 = &unk_24C88B7B0;
    v19 = &v20;
    __getMIUIDisplayConfigurationClass_block_invoke((uint64_t)&v15);
    v5 = (void *)v21[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v6, "standardConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEntryPoint:", 1);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v8 = (void *)getMIUIMedicalIDViewControllerClass_softClass;
  v23 = getMIUIMedicalIDViewControllerClass_softClass;
  if (!getMIUIMedicalIDViewControllerClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getMIUIMedicalIDViewControllerClass_block_invoke;
    v18 = &unk_24C88B7B0;
    v19 = &v20;
    __getMIUIMedicalIDViewControllerClass_block_invoke((uint64_t)&v15);
    v8 = (void *)v21[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v20, 8);
  v10 = (MIUIMedicalIDViewController *)objc_msgSend([v9 alloc], "initWithHealthStore:medicalIDData:displayConfiguration:", self->_healthStore, 0, v7);
  medicalIDV2ViewController = self->_medicalIDV2ViewController;
  self->_medicalIDV2ViewController = v10;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_medicalIDV2ViewController);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissMedicalID);
  -[MIUIMedicalIDViewController navigationItem](self->_medicalIDV2ViewController, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v13);

  objc_msgSend(v4, "presentViewController:animated:completion:", v12, 1, 0);
}

- (void)dismissMedicalID
{
  id v2;

  -[MIUIMedicalIDViewController navigationController](self->_medicalIDV2ViewController, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)presentHKMedicalIDViewController:(id)a3 withFamily:(id)a4 isEmergencyContactSetup:(BOOL)a5
{
  id v7;
  FAFamilyCircle *v8;
  FAFamilyCircle *familyCircle;
  FAFamilyCircle *v10;
  HKMedicalIDViewController *v11;
  HKMedicalIDViewController *medicalIDViewController;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a3;
  v8 = (FAFamilyCircle *)a4;
  if (getSOSUtilitiesClass() && (objc_msgSend(getSOSUtilitiesClass(), "isAllowedToMessageSOSContacts") & 1) == 0)
    objc_msgSend(getSOSUtilitiesClass(), "setAllowedToMessageSOSContacts:", 1);
  familyCircle = self->_familyCircle;
  self->_familyCircle = v8;
  v10 = v8;

  v11 = (HKMedicalIDViewController *)objc_msgSend(objc_alloc((Class)getHKMedicalIDViewControllerClass()), "initInEditMode:", 1);
  medicalIDViewController = self->_medicalIDViewController;
  self->_medicalIDViewController = v11;

  -[HKMedicalIDViewController setHealthStore:](self->_medicalIDViewController, "setHealthStore:", self->_healthStore);
  -[HKMedicalIDViewController setMedicalIDStore:](self->_medicalIDViewController, "setMedicalIDStore:", self->_medicalIDStore);
  -[HKMedicalIDViewController setMedicalID:](self->_medicalIDViewController, "setMedicalID:", self->_medicalIDData);
  -[HKMedicalIDViewController setDelegate:](self->_medicalIDViewController, "setDelegate:", self);
  -[HKMedicalIDViewController setAllowsEditing:](self->_medicalIDViewController, "setAllowsEditing:", 1);
  -[HKMedicalIDViewController setShouldShowHints:](self->_medicalIDViewController, "setShouldShowHints:", 1);
  -[HKMedicalIDViewController setShowsDeleteButton:](self->_medicalIDViewController, "setShowsDeleteButton:", 0);
  -[HKMedicalIDViewController setShowsEditMedicalIDRowInViewMode:](self->_medicalIDViewController, "setShowsEditMedicalIDRowInViewMode:", 1);
  -[FAHealthKitSoftLinking _pathToEmergencyRow](self, "_pathToEmergencyRow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_medicalIDViewController);
  v15 = (void *)MEMORY[0x24BEBDB00];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __94__FAHealthKitSoftLinking_presentHKMedicalIDViewController_withFamily_isEmergencyContactSetup___block_invoke;
  v21[3] = &unk_24C88B958;
  v22 = v7;
  v23 = v14;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __94__FAHealthKitSoftLinking_presentHKMedicalIDViewController_withFamily_isEmergencyContactSetup___block_invoke_2;
  v19[3] = &unk_24C88C030;
  v19[4] = self;
  v20 = v13;
  v16 = v13;
  v17 = v14;
  v18 = v7;
  objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 196608, v21, v19, 0.1, 0.0);

}

uint64_t __94__FAHealthKitSoftLinking_presentHKMedicalIDViewController_withFamily_isEmergencyContactSetup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __94__FAHealthKitSoftLinking_presentHKMedicalIDViewController_withFamily_isEmergencyContactSetup___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollToRowAtIndexPath:atScrollPosition:animated:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)fetchMedicalIDData:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, uint64_t, uint64_t, uint64_t);
  NSObject *v9;
  HKMedicalIDStore *medicalIDStore;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  FAHealthKitSoftLinking *v22;
  id v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v7 = a3;
  v8 = (void (**)(id, uint64_t, uint64_t, uint64_t))a4;
  objc_storeStrong((id *)&self->_familyCircle, a3);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__0;
  v42 = __Block_byref_object_dispose__0;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = 0;
  v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  medicalIDStore = self->_medicalIDStore;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __63__FAHealthKitSoftLinking_fetchMedicalIDData_completionHandler___block_invoke;
  v21 = &unk_24C88C058;
  v25 = &v38;
  v22 = self;
  v11 = v7;
  v23 = v11;
  v26 = &v34;
  v27 = &v28;
  v12 = v9;
  v24 = v12;
  -[HKMedicalIDStore fetchMedicalIDDataWithCompletion:](medicalIDStore, "fetchMedicalIDDataWithCompletion:", &v18);
  v13 = dispatch_time(0, 1000000000);
  if (dispatch_group_wait(v12, v13))
  {
    _FALogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FAHealthKitSoftLinking fetchMedicalIDData:completionHandler:].cold.1(v14);

    v35[3] = 0;
    v15 = objc_alloc(MEMORY[0x24BDD1540]);
    v16 = objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("com.apple.FAHealthKitSoftLinking"), -1001, &unk_24C8CD6A8, v18, v19, v20, v21, v22, v23);
    v17 = (void *)v29[5];
    v29[5] = v16;

  }
  v8[2](v8, v39[5], v35[3], v29[5]);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

}

void __63__FAHealthKitSoftLinking_fetchMedicalIDData_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v6 && (objc_msgSend(v6, "isEmpty") & 1) == 0)
  {
    v32 = v7;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v33 = v6;
    objc_msgSend(v6, "emergencyContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (!v11)
      goto LABEL_18;
    v12 = v11;
    v13 = *(_QWORD *)v40;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v15, "nameContactIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(v15, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "length");

          if (!v18)
            continue;
          objc_msgSend(v15, "nameContactIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v19);

          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v16);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (!v12)
      {
LABEL_18:

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v31 = a1;
        objc_msgSend(*(id *)(a1 + 40), "members");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (!v21)
        {
          v23 = 0;
          goto LABEL_32;
        }
        v22 = v21;
        v23 = 0;
        v24 = *(_QWORD *)v36;
        while (1)
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v20);
            v26 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
            if ((objc_msgSend(v26, "isMe") & 1) == 0)
            {
              objc_msgSend(v26, "contact");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "identifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v8, "containsObject:", v28))
              {

              }
              else
              {
                objc_msgSend(v26, "fullName");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v34, "containsObject:", v29);

                if (!v30)
                  continue;
              }
              ++v23;
            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (!v22)
          {
LABEL_32:

            a1 = v31;
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v31 + 64) + 8) + 24) = v23;
            v7 = v32;
            v6 = v33;
            goto LABEL_33;
          }
        }
      }
    }
  }
  if (v7)
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __63__FAHealthKitSoftLinking_fetchMedicalIDData_completionHandler___block_invoke_cold_1(v7, v9);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  }
LABEL_33:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)emergencyContactFlow:(id)a3 didSelectContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(getSOSUtilitiesClass(), "isAllowedToMessageSOSContacts") & 1) == 0)
    objc_msgSend(getSOSUtilitiesClass(), "setAllowedToMessageSOSContacts:", 1);
  -[_HKMedicalIDData emergencyContacts](self->_medicalIDData, "emergencyContacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[_HKMedicalIDData emergencyContacts](self->_medicalIDData, "emergencyContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObject:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[_HKMedicalIDData setEmergencyContacts:](self->_medicalIDData, "setEmergencyContacts:", v8);
  -[HKMedicalIDViewController tableView](self->_medicalIDViewController, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)medicalIDViewControllerDidSave:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke;
  v3[3] = &unk_24C88B7F0;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

uint64_t __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "fetchMedicalIDData:completionHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), &__block_literal_global_6);
}

void __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v4;
  NSObject *v5;
  uint64_t v6;

  v4 = a4;
  if (v4)
  {
    _FALogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke_2_cold_1((uint64_t)v4, v5, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v5, "postNotificationName:object:", *MEMORY[0x24BE30960], 0);
  }

}

- (void)medicalIDViewControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__FAHealthKitSoftLinking_medicalIDViewControllerDidCancel___block_invoke;
  v3[3] = &unk_24C88B7F0;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

void __59__FAHealthKitSoftLinking_medicalIDViewControllerDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;

}

- (void)fetchLastModifiedDate:(id)a3 completionHandler:(id)a4
{
  id v5;
  FAFamilyCircle *familyCircle;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  familyCircle = self->_familyCircle;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__FAHealthKitSoftLinking_fetchLastModifiedDate_completionHandler___block_invoke;
  v8[3] = &unk_24C88C0C0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[FAHealthKitSoftLinking fetchMedicalIDData:completionHandler:](self, "fetchMedicalIDData:completionHandler:", familyCircle, v8);

}

void __66__FAHealthKitSoftLinking_fetchLastModifiedDate_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v5 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "dateSaved");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke_2_cold_1((uint64_t)v5, v7, v8);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "emergencyContactsModifiedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "emergencyContactsModifiedDate");
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_startEmergencyContactsChangeObserver
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v4;
  const __CFString *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = (const char *)getkHKMedicalIDEmergencyContactsDidChangeNotification();
  v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_EmergencyContactsDidChangeNotification, v5, 0, (CFNotificationSuspensionBehavior)0);
}

- (void)_stopEmergencyContactsChangeObserver
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const char *v4;
  const __CFString *v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v4 = (const char *)getkHKMedicalIDEmergencyContactsDidChangeNotification();
  v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0);
}

+ (BOOL)isMedicalIDViewControllerSupportedOnDevice
{
  return objc_msgSend(getHKMedicalIDViewControllerClass(), "isSupportedOnThisDevice");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDV2ViewController, 0);
  objc_storeStrong((id *)&self->_navViewController, 0);
  objc_storeStrong((id *)&self->_medicalIDViewController, 0);
  objc_storeStrong((id *)&self->_contactFlow, 0);
  objc_storeStrong((id *)&self->_familyCircle, 0);
  objc_storeStrong((id *)&self->_medicalIDData, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)fetchMedicalIDData:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DE41000, log, OS_LOG_TYPE_ERROR, "Failed fetchMedicalIDDataWithCompletion! Timed out", v1, 2u);
}

void __63__FAHealthKitSoftLinking_fetchMedicalIDData_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, v4, "fetchMedicalIDData failed with error: %@", (uint8_t *)&v5);

}

void __57__FAHealthKitSoftLinking_medicalIDViewControllerDidSave___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_20DE41000, a2, a3, "Failed to fetch medical data %@", (uint8_t *)&v3);
}

@end
