@implementation FALaunchScreenTimeSetupHook

- (FALaunchScreenTimeSetupHook)init
{
  FASTChildSetupControllerProvider *v3;
  id v4;
  _TtC14FamilyCircleUI21FAFamilyCircleFetcher *v5;
  void *v6;
  FALaunchScreenTimeSetupHook *v7;

  v3 = objc_alloc_init(FASTChildSetupControllerProvider);
  v4 = objc_alloc_init(MEMORY[0x24BE30AE8]);
  v5 = objc_alloc_init(_TtC14FamilyCircleUI21FAFamilyCircleFetcher);
  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FALaunchScreenTimeSetupHook initWithAccountStore:screenTimeRequestProvider:childSetupControllerProvider:familyFetcher:](self, "initWithAccountStore:screenTimeRequestProvider:childSetupControllerProvider:familyFetcher:", v6, v4, v3, v5);

  return v7;
}

- (FALaunchScreenTimeSetupHook)initWithAccountStore:(id)a3 screenTimeRequestProvider:(id)a4 childSetupControllerProvider:(id)a5 familyFetcher:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FALaunchScreenTimeSetupHook *v15;
  FALaunchScreenTimeSetupHook *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FALaunchScreenTimeSetupHook;
  v15 = -[FALaunchScreenTimeSetupHook init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountStore, a3);
    objc_storeStrong((id *)&v16->_screenTimeRequestProvider, a4);
    objc_storeStrong((id *)&v16->_childSetupControllerProvider, a5);
    objc_storeStrong((id *)&v16->_familyFetcher, a6);
  }

  return v16;
}

- (BOOL)shouldMatchElement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("family:launchScreenTimeSetup"));

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE7EE50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("family:launchScreenTimeSetup"));

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  id v10;

  v8 = a6;
  v9 = a5;
  -[FALaunchScreenTimeSetupHook extractDSIDFromObjectModel:](self, "extractDSIDFromObjectModel:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[FALaunchScreenTimeSetupHook _launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:inObjectModel:withCompletion:](self, "_launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:inObjectModel:withCompletion:", v10, v9, v8);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[FALaunchScreenTimeSetupHook extractDSIDFromObjectModel:](self, "extractDSIDFromObjectModel:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FALaunchScreenTimeSetupHook _launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:inObjectModel:withCompletion:](self, "_launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:inObjectModel:withCompletion:", v8, v7, v6);

}

- (void)_launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID:(id)a3 inObjectModel:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __114__FALaunchScreenTimeSetupHook__launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID_inObjectModel_withCompletion___block_invoke;
  v14[3] = &unk_24C88C908;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[FALaunchScreenTimeSetupHook _refreshFamilyCircleIfNeededForMemberDSID:completionHandler:](self, "_refreshFamilyCircleIfNeededForMemberDSID:completionHandler:", v13, v14);

}

void __114__FALaunchScreenTimeSetupHook__launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID_inObjectModel_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __114__FALaunchScreenTimeSetupHook__launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID_inObjectModel_withCompletion___block_invoke_2;
  v3[3] = &unk_24C88C3C8;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __114__FALaunchScreenTimeSetupHook__launchScreenTimeSetupAndRefreshFamilyIfNeededForDSID_inObjectModel_withCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchScreenTimeSetupForUser:inObjectModel:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_launchScreenTimeSetupForUser:(id)a3 inObjectModel:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  int v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD aBlock[4];
  _QWORD v75[2];
  id v76;
  id v77;
  id v78;
  _QWORD v79[4];
  uint8_t buf[4];
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _FALogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20DE41000, v11, OS_LOG_TYPE_DEFAULT, "Launching screentime hook", buf, 2u);
  }

  _FALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138477827;
      v81 = v8;
      _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "Setting up screen time for dsid %{private}@", buf, 0xCu);
    }

    -[FALaunchScreenTimeSetupHook _extractAgeFromObjectModel:](self, "_extractAgeFromObjectModel:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    -[FALaunchScreenTimeSetupHook _extractNameFromObjectModel:](self, "_extractNameFromObjectModel:", v9);
    v15 = objc_claimAutoreleasedReturnValue();
    -[FALaunchScreenTimeSetupHook accountStore](self, "accountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "aa_primaryAppleAccount");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = v10;
    v69 = v8;
    v70 = v17;
    v66 = (void *)v15;
    v67 = (void *)v14;
    if (-[FALaunchScreenTimeSetupHook isChildDevice](self, "isChildDevice") || !v17)
    {
      if (v17)
      {
        -[FALaunchScreenTimeSetupHook screenTimeRequestProvider](self, "screenTimeRequestProvider");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isScreenTimeSetupForDSID:", v8);

        _FALogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[FALaunchScreenTimeSetupHook _launchScreenTimeSetupForUser:inObjectModel:withCompletion:].cold.2();

        v29 = v27 ^ 1;
      }
      else
      {
        _FALogSystem();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          -[FALaunchScreenTimeSetupHook _launchScreenTimeSetupForUser:inObjectModel:withCompletion:].cold.1();

        v29 = 1;
      }
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke;
      aBlock[3] = &unk_24C88C958;
      v22 = (id *)v75;
      v31 = v8;
      v75[0] = v31;
      v75[1] = self;
      v76 = v70;
      v77 = v9;
      v78 = v10;
      v32 = _Block_copy(aBlock);
      -[FALaunchScreenTimeSetupHook childSetupControllerProvider](self, "childSetupControllerProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v33;
      if (v29)
        v35 = objc_msgSend(v33, "newChildSetupControllerOnChildDeviceWithDSID:childAge:childName:introductionModelCompletionHandler:", v31, v14, v15, v32);
      else
        v35 = objc_msgSend(v33, "newChildSetupControllerWithDSID:updateExistingSettings:childAge:childName:introductionModelCompletionHandler:", v31, 1, v14, v15, v32);
      v24 = (void *)v35;

      v25 = v76;
    }
    else
    {
      _FALogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[FALaunchScreenTimeSetupHook _launchScreenTimeSetupForUser:inObjectModel:withCompletion:].cold.3(v17, v18);

      -[FALaunchScreenTimeSetupHook screenTimeRequestProvider](self, "screenTimeRequestProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isScreenTimeSetupForDSID:", v8);

      -[FALaunchScreenTimeSetupHook childSetupControllerProvider](self, "childSetupControllerProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_40;
      v71[3] = &unk_24C88C980;
      v22 = &v72;
      v23 = v8;
      v72 = v23;
      v73 = v10;
      v24 = (void *)objc_msgSend(v21, "newChildSetupControllerWithDSID:updateExistingSettings:childAge:childName:completionHandler:", v23, v20, v14, v15, v71);

      v25 = v73;
    }

    v65 = v24;
    objc_msgSend(v24, "initialViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "defaultPages");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "addChildViewController:", v36);
    objc_msgSend(v38, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v40);

    objc_msgSend(v36, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v55 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v36, "view");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "topAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:", v61);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v60;
    objc_msgSend(v36, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v54;
    objc_msgSend(v36, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "leadingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v42;
    objc_msgSend(v36, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v46);
    v47 = v9;
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v79[3] = v48;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 4);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v49);

    v9 = v47;
    objc_msgSend(v36, "didMoveToParentViewController:", v38);

    v10 = v68;
    v8 = v69;
  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20DE41000, v12, OS_LOG_TYPE_DEFAULT, "No dsid present, jumping to screen time settings", buf, 2u);
    }

    -[FALaunchScreenTimeSetupHook _launchScreenTimeSettings](self, "_launchScreenTimeSettings");
    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 1, 0);
  }

}

void __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Screen Time Model for %@", buf, 0xCu);
    }

    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_34;
    v15[3] = &unk_24C88C930;
    v11 = *(_QWORD *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 40);
    v17 = v12;
    v18 = v13;
    v19 = *(id *)(a1 + 64);
    objc_msgSend(v9, "_enableScreentimeWithIntroductionModel:account:dsidNum:completion:", v12, v11, v10, v15);

  }
  else
  {
    if (v7)
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_20DE41000, v6, OS_LOG_TYPE_DEFAULT, "Screen Time should not be enabled, don't save state. %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v8 = v7;

  objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("stIntroductionModel"));
  objc_msgSend(*(id *)(a1 + 32), "setClientInfo:", v8);
  objc_msgSend(*(id *)(a1 + 48), "completionAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 48), "completionAction");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "copy");
    ((void (**)(_QWORD, void *))v10)[2](v10, v11);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _FALogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_40_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138478083;
    v8 = v6;
    v9 = 2112;
    v10 = 0;
    _os_log_impl(&dword_20DE41000, v5, OS_LOG_TYPE_DEFAULT, "conclude screentime flow for %{private}@ %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_refreshFamilyCircleIfNeededForMemberDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  FALaunchScreenTimeSetupHook *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v17 = v6;
    _os_log_impl(&dword_20DE41000, v8, OS_LOG_TYPE_DEFAULT, "Starting family refresh if needed for dsid: %{private}@", buf, 0xCu);
  }

  -[FALaunchScreenTimeSetupHook familyFetcher](self, "familyFetcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke;
  v12[3] = &unk_24C88C9A8;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "fetchCachedFamilyCircleWithQualityOfService:completionHandler:", 25, v12);

}

void __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_cold_1();

  }
  objc_msgSend(v5, "memberForDSID:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _FALogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      v23 = v11;
      _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "Family member exist locally dsid: %{private}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "screenTimeRequestProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "forceRefreshScreenTimeForDSID:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v10)
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      v23 = v13;
      _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "Family member with dsid: %{private}@ does not exist locally. Force fetching...", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "familyFetcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_43;
    v18[3] = &unk_24C88C9A8;
    v15 = *(id *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v19 = v15;
    v20 = v16;
    v21 = v17;
    objc_msgSend(v14, "forceFetchFamilyCircleWithQualityOfService:completionHandler:", 25, v18);

    v12 = v19;
  }

}

void __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _FALogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_43_cold_1();

  }
  objc_msgSend(v5, "memberForDSID:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _FALogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v12 = 138477827;
      v13 = v10;
      _os_log_impl(&dword_20DE41000, v9, OS_LOG_TYPE_DEFAULT, "Found member for %{private}@ after force fetching", (uint8_t *)&v12, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "screenTimeRequestProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "forceRefreshScreenTimeForDSID:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)_enableScreentimeWithIntroductionModel:(id)a3 account:(id)a4 dsidNum:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  v10 = a5;
  v11 = a6;
  v12 = (objc_class *)MEMORY[0x24BE30AF0];
  v13 = a3;
  v14 = [v12 alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithIntroductionModel:date:dsid:", v13, v15, v10);

  _FALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (a4)
  {
    if (v18)
      -[FALaunchScreenTimeSetupHook _enableScreentimeWithIntroductionModel:account:dsidNum:completion:].cold.2(v17, v19, v20, v21, v22, v23, v24, v25);

    -[FALaunchScreenTimeSetupHook screenTimeRequestProvider](self, "screenTimeRequestProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_47;
    v31[3] = &unk_24C88CA20;
    v31[4] = self;
    v32 = v10;
    v33 = v11;
    v27 = v11;
    objc_msgSend(v26, "enableScreenTimeSettingsForDSID:screentimeObject:completionHandler:", v10, v16, v31);

    v28 = v32;
  }
  else
  {
    if (v18)
      -[FALaunchScreenTimeSetupHook _enableScreentimeWithIntroductionModel:account:dsidNum:completion:].cold.1(v17, v19, v20, v21, v22, v23, v24, v25);

    -[FALaunchScreenTimeSetupHook screenTimeRequestProvider](self, "screenTimeRequestProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke;
    v34[3] = &unk_24C88C9D0;
    v35 = v10;
    v36 = v16;
    v37 = v11;
    v30 = v11;
    objc_msgSend(v29, "cacheScreenTimeSettingToDiskWithDSID:screentimeObject:completionHandler:", v10, v36, v34);

    v28 = v35;
  }

}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_cold_2();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "BOOLValue");
  _FALogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_47_cold_1(v9);

    objc_msgSend(*(id *)(a1 + 32), "screenTimeRequestProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "ephemeralAuthResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "BOOLValue");
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_48;
    v15[3] = &unk_24C88C9F8;
    v17 = *(id *)(a1 + 48);
    v16 = v5;
    objc_msgSend(v10, "updateScreenTimeServerFlagSettingsForDSID:ephemeralAuthResults:enabled:completionHandler:", v11, v12, v13, v15);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_47_cold_2((uint64_t)v6, v9, v14);

    (*(void (**)(_QWORD, BOOL, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5 != 0, v6);
  }

}

uint64_t __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_48(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) != 0, a2);
}

- (id)_extractAgeFromObjectModel:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dependentAge"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(v5, "numberFromString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_extractNameFromObjectModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "clientInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dependentFirstName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("dependentLastName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDD1730]);
  objc_msgSend(v8, "setGivenName:", v5);
  objc_msgSend(v8, "setFamilyName:", v7);
  v9 = objc_alloc_init(MEMORY[0x24BDD1738]);
  objc_msgSend(v9, "setStyle:", 1);
  objc_msgSend(v9, "stringFromPersonNameComponents:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    v11 = v10;
  else
    v11 = v5;
  v12 = v11;

  return v12;
}

- (id)extractDSIDFromObjectModel:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "clientInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dsid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en-US"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocale:", v6);

  objc_msgSend(v5, "numberFromString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_launchScreenTimeSettings
{
  void *v2;
  void *v3;
  uint64_t v4;

  v4 = 0;
  objc_msgSend(MEMORY[0x24BE30B48], "urlDestinationTo:error:", 7, &v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

- (RUIServerHookDelegate)delegate
{
  return (RUIServerHookDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isChildDevice
{
  return self->_isChildDevice;
}

- (void)setIsChildDevice:(BOOL)a3
{
  self->_isChildDevice = a3;
}

- (NSDictionary)ephemeralAuthResults
{
  return self->_ephemeralAuthResults;
}

- (void)setEphemeralAuthResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionAction
{
  return self->_completionAction;
}

- (void)setCompletionAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FASTChildSetupControllerProviderProtocol)childSetupControllerProvider
{
  return self->_childSetupControllerProvider;
}

- (void)setChildSetupControllerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_childSetupControllerProvider, a3);
}

- (FAScreenTimeRequestProviderProtocol)screenTimeRequestProvider
{
  return self->_screenTimeRequestProvider;
}

- (void)setScreenTimeRequestProvider:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeRequestProvider, a3);
}

- (FAACAccountStoreProtocol)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (FAFamilyCircleFetcherProtocol)familyFetcher
{
  return self->_familyFetcher;
}

- (void)setFamilyFetcher:(id)a3
{
  objc_storeStrong((id *)&self->_familyFetcher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyFetcher, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_screenTimeRequestProvider, 0);
  objc_storeStrong((id *)&self->_childSetupControllerProvider, 0);
  objc_storeStrong(&self->_completionAction, 0);
  objc_storeStrong((id *)&self->_ephemeralAuthResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_launchScreenTimeSetupForUser:inObjectModel:withCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_20DE41000, v0, v1, "%s - running on device with no icloud account %@, %@", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_launchScreenTimeSetupForUser:inObjectModel:withCompletion:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4(&dword_20DE41000, v0, v1, "%s - running on child device %@, %@", v2);
  OUTLINED_FUNCTION_8();
}

- (void)_launchScreenTimeSetupForUser:(void *)a1 inObjectModel:(NSObject *)a2 withCompletion:.cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "aa_altDSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315395;
  v6 = "-[FALaunchScreenTimeSetupHook _launchScreenTimeSetupForUser:inObjectModel:withCompletion:]";
  v7 = 2113;
  v8 = v3;
  OUTLINED_FUNCTION_9(&dword_20DE41000, a2, v4, "%s - running on guardian's device %{private}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_8();
}

void __90__FALaunchScreenTimeSetupHook__launchScreenTimeSetupForUser_inObjectModel_withCompletion___block_invoke_40_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20DE41000, v0, v1, "Error setting up screen time for %{private}@ %@");
  OUTLINED_FUNCTION_2();
}

void __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20DE41000, v0, v1, "Error fetching cached family for %{private}@ %@");
  OUTLINED_FUNCTION_2();
}

void __91__FALaunchScreenTimeSetupHook__refreshFamilyCircleIfNeededForMemberDSID_completionHandler___block_invoke_43_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_4(&dword_20DE41000, v0, v1, "Error force fetching family for %{private}@ %@");
  OUTLINED_FUNCTION_2();
}

- (void)_enableScreentimeWithIntroductionModel:(uint64_t)a3 account:(uint64_t)a4 dsidNum:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_20DE41000, a1, a3, "account is nil caching screentime model", a5, a6, a7, a8, 0);
}

- (void)_enableScreentimeWithIntroductionModel:(uint64_t)a3 account:(uint64_t)a4 dsidNum:(uint64_t)a5 completion:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_20DE41000, a1, a3, "account is not nil applying screentime model", a5, a6, a7, a8, 0);
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_20DE41000, v0, v1, "FALaunchScreenTimeSetupHook screentime data saved for %@, %@", v2);
  OUTLINED_FUNCTION_2();
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_20DE41000, v0, v1, "FALaunchScreenTimeSetupHook failed to save screentime data %@, %@", v2);
  OUTLINED_FUNCTION_2();
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_47_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FALaunchScreenTimeSetupHook _enableScreentimeWithIntroductionModel:account:dsidNum:completion:]_block_invoke";
  _os_log_debug_impl(&dword_20DE41000, log, OS_LOG_TYPE_DEBUG, "FALaunchScreenTimeSetupHook %s: screentime all setup", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __97__FALaunchScreenTimeSetupHook__enableScreentimeWithIntroductionModel_account_dsidNum_completion___block_invoke_47_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[FALaunchScreenTimeSetupHook _enableScreentimeWithIntroductionModel:account:dsidNum:completion:]_block_invoke_2";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_1_0(&dword_20DE41000, a2, a3, "FALaunchScreenTimeSetupHook %s: Error Setting up Screentime: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

@end
