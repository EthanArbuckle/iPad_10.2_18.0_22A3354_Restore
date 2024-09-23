@implementation HUAccessoryDebugModule

- (HUAccessoryDebugModule)initWithItemUpdater:(id)a3 homeKitObject:(id)a4
{
  id v7;
  HUAccessoryDebugModule *v8;
  HUAccessoryDebugModule *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  HMSymptomsHandler *symptomsHandler;
  id v19;
  uint64_t v20;
  HFItem *fakeUnreachableItem;
  id v22;
  uint64_t v23;
  HFItem *fakeWiFiSymptomItem;
  id v25;
  uint64_t v26;
  HFItem *fakeWiFiPerformanceSymptomItem;
  id v28;
  uint64_t v29;
  HFItem *fakeWifiNetworkMismatchSymptomItem;
  id v31;
  uint64_t v32;
  HFItem *fakeInternetFixSymptomItem;
  id v34;
  uint64_t v35;
  HFItem *fakeHardwareFixSymptomItem;
  id v37;
  uint64_t v38;
  HFItem *fakeGeneralFixSymptomItem;
  id v40;
  uint64_t v41;
  HFItem *fakeHomeKitSymptomItem;
  id v43;
  uint64_t v44;
  HFItem *fakeICloudSymptomItem;
  id v46;
  uint64_t v47;
  HFItem *fakeITunesSymptomItem;
  id v49;
  uint64_t v50;
  HFItem *fakeCDPSymptomItem;
  id v52;
  uint64_t v53;
  HFItem *fakeVPNProfileExpiredSymptomItem;
  id v55;
  uint64_t v56;
  HFItem *fake8021xNetworkSymptomItem;
  id v58;
  uint64_t v59;
  HFItem *fakeNetworkProfileFixSymptomItem;
  id v61;
  uint64_t v62;
  HFItem *fakeNetworkProfileInstallSymptomItem;
  id v64;
  uint64_t v65;
  HFItem *fakeNetworkNotShareableSymptomItem;
  id v67;
  uint64_t v68;
  HFItem *fakeCaptiveLeaseRenewalSymptomItem;
  id v70;
  uint64_t v71;
  HFItem *fakeNetworkStrengthErrorItem;
  void *v73;
  uint64_t v74;
  HMSymptomsHandler *v75;
  id v76;
  uint64_t v77;
  HFItem *fakeStereoPairGeneralSymptomItem;
  id v79;
  uint64_t v80;
  HFItem *fakeStereoPairNotFoundSymptomItem;
  id v82;
  uint64_t v83;
  HFItem *fakeStereoPairVersionMismatchSymptomItem;
  id v85;
  uint64_t v86;
  HFItem *v87;
  void *v88;
  uint64_t v89;
  HFStaticItemProvider *debugItemProvider;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD v117[4];
  id v118;
  _QWORD v119[4];
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  _QWORD v129[4];
  id v130;
  _QWORD v131[4];
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[4];
  id v140;
  id location;
  objc_super v142;

  v7 = a3;
  v95 = v7;
  v96 = a4;
  if (!v96)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessoryDebugModule.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitObject"));

    v7 = v95;
  }
  v142.receiver = self;
  v142.super_class = (Class)HUAccessoryDebugModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v142, sel_initWithItemUpdater_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_homeKitObject, a4);
    objc_opt_class();
    v10 = v96;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_opt_class();
    v13 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
    v94 = v14;

    objc_initWeak(&location, v9);
    v93 = v12;
    v15 = objc_msgSend(v12, "hf_isHomePod");
    v16 = MEMORY[0x1E0C809B0];
    if (v15)
    {
      objc_storeStrong((id *)&v9->_accessory, v11);
      objc_msgSend(v93, "symptomsHandler");
      v17 = objc_claimAutoreleasedReturnValue();
      symptomsHandler = v9->_symptomsHandler;
      v9->_symptomsHandler = (HMSymptomsHandler *)v17;

      v19 = objc_alloc(MEMORY[0x1E0D31840]);
      v139[0] = v16;
      v139[1] = 3221225472;
      v139[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke;
      v139[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v140, &location);
      v20 = objc_msgSend(v19, "initWithResultsBlock:", v139);
      fakeUnreachableItem = v9->_fakeUnreachableItem;
      v9->_fakeUnreachableItem = (HFItem *)v20;

      v22 = objc_alloc(MEMORY[0x1E0D31840]);
      v137[0] = v16;
      v137[1] = 3221225472;
      v137[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_2;
      v137[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v138, &location);
      v23 = objc_msgSend(v22, "initWithResultsBlock:", v137);
      fakeWiFiSymptomItem = v9->_fakeWiFiSymptomItem;
      v9->_fakeWiFiSymptomItem = (HFItem *)v23;

      v25 = objc_alloc(MEMORY[0x1E0D31840]);
      v135[0] = v16;
      v135[1] = 3221225472;
      v135[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_3;
      v135[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v136, &location);
      v26 = objc_msgSend(v25, "initWithResultsBlock:", v135);
      fakeWiFiPerformanceSymptomItem = v9->_fakeWiFiPerformanceSymptomItem;
      v9->_fakeWiFiPerformanceSymptomItem = (HFItem *)v26;

      v28 = objc_alloc(MEMORY[0x1E0D31840]);
      v133[0] = v16;
      v133[1] = 3221225472;
      v133[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_4;
      v133[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v134, &location);
      v29 = objc_msgSend(v28, "initWithResultsBlock:", v133);
      fakeWifiNetworkMismatchSymptomItem = v9->_fakeWifiNetworkMismatchSymptomItem;
      v9->_fakeWifiNetworkMismatchSymptomItem = (HFItem *)v29;

      v31 = objc_alloc(MEMORY[0x1E0D31840]);
      v131[0] = v16;
      v131[1] = 3221225472;
      v131[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_5;
      v131[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v132, &location);
      v32 = objc_msgSend(v31, "initWithResultsBlock:", v131);
      fakeInternetFixSymptomItem = v9->_fakeInternetFixSymptomItem;
      v9->_fakeInternetFixSymptomItem = (HFItem *)v32;

      v34 = objc_alloc(MEMORY[0x1E0D31840]);
      v129[0] = v16;
      v129[1] = 3221225472;
      v129[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_6;
      v129[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v130, &location);
      v35 = objc_msgSend(v34, "initWithResultsBlock:", v129);
      fakeHardwareFixSymptomItem = v9->_fakeHardwareFixSymptomItem;
      v9->_fakeHardwareFixSymptomItem = (HFItem *)v35;

      v37 = objc_alloc(MEMORY[0x1E0D31840]);
      v127[0] = v16;
      v127[1] = 3221225472;
      v127[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_7;
      v127[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v128, &location);
      v38 = objc_msgSend(v37, "initWithResultsBlock:", v127);
      fakeGeneralFixSymptomItem = v9->_fakeGeneralFixSymptomItem;
      v9->_fakeGeneralFixSymptomItem = (HFItem *)v38;

      v40 = objc_alloc(MEMORY[0x1E0D31840]);
      v125[0] = v16;
      v125[1] = 3221225472;
      v125[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_8;
      v125[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v126, &location);
      v41 = objc_msgSend(v40, "initWithResultsBlock:", v125);
      fakeHomeKitSymptomItem = v9->_fakeHomeKitSymptomItem;
      v9->_fakeHomeKitSymptomItem = (HFItem *)v41;

      v43 = objc_alloc(MEMORY[0x1E0D31840]);
      v123[0] = v16;
      v123[1] = 3221225472;
      v123[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_9;
      v123[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v124, &location);
      v44 = objc_msgSend(v43, "initWithResultsBlock:", v123);
      fakeICloudSymptomItem = v9->_fakeICloudSymptomItem;
      v9->_fakeICloudSymptomItem = (HFItem *)v44;

      v46 = objc_alloc(MEMORY[0x1E0D31840]);
      v121[0] = v16;
      v121[1] = 3221225472;
      v121[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_10;
      v121[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v122, &location);
      v47 = objc_msgSend(v46, "initWithResultsBlock:", v121);
      fakeITunesSymptomItem = v9->_fakeITunesSymptomItem;
      v9->_fakeITunesSymptomItem = (HFItem *)v47;

      v49 = objc_alloc(MEMORY[0x1E0D31840]);
      v119[0] = v16;
      v119[1] = 3221225472;
      v119[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_11;
      v119[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v120, &location);
      v50 = objc_msgSend(v49, "initWithResultsBlock:", v119);
      fakeCDPSymptomItem = v9->_fakeCDPSymptomItem;
      v9->_fakeCDPSymptomItem = (HFItem *)v50;

      v52 = objc_alloc(MEMORY[0x1E0D31840]);
      v117[0] = v16;
      v117[1] = 3221225472;
      v117[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_12;
      v117[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v118, &location);
      v53 = objc_msgSend(v52, "initWithResultsBlock:", v117);
      fakeVPNProfileExpiredSymptomItem = v9->_fakeVPNProfileExpiredSymptomItem;
      v9->_fakeVPNProfileExpiredSymptomItem = (HFItem *)v53;

      v55 = objc_alloc(MEMORY[0x1E0D31840]);
      v115[0] = v16;
      v115[1] = 3221225472;
      v115[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_13;
      v115[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v116, &location);
      v56 = objc_msgSend(v55, "initWithResultsBlock:", v115);
      fake8021xNetworkSymptomItem = v9->_fake8021xNetworkSymptomItem;
      v9->_fake8021xNetworkSymptomItem = (HFItem *)v56;

      v58 = objc_alloc(MEMORY[0x1E0D31840]);
      v113[0] = v16;
      v113[1] = 3221225472;
      v113[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_14;
      v113[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v114, &location);
      v59 = objc_msgSend(v58, "initWithResultsBlock:", v113);
      fakeNetworkProfileFixSymptomItem = v9->_fakeNetworkProfileFixSymptomItem;
      v9->_fakeNetworkProfileFixSymptomItem = (HFItem *)v59;

      v61 = objc_alloc(MEMORY[0x1E0D31840]);
      v111[0] = v16;
      v111[1] = 3221225472;
      v111[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_15;
      v111[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v112, &location);
      v62 = objc_msgSend(v61, "initWithResultsBlock:", v111);
      fakeNetworkProfileInstallSymptomItem = v9->_fakeNetworkProfileInstallSymptomItem;
      v9->_fakeNetworkProfileInstallSymptomItem = (HFItem *)v62;

      v64 = objc_alloc(MEMORY[0x1E0D31840]);
      v109[0] = v16;
      v109[1] = 3221225472;
      v109[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_16;
      v109[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v110, &location);
      v65 = objc_msgSend(v64, "initWithResultsBlock:", v109);
      fakeNetworkNotShareableSymptomItem = v9->_fakeNetworkNotShareableSymptomItem;
      v9->_fakeNetworkNotShareableSymptomItem = (HFItem *)v65;

      v67 = objc_alloc(MEMORY[0x1E0D31840]);
      v107[0] = v16;
      v107[1] = 3221225472;
      v107[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_17;
      v107[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v108, &location);
      v68 = objc_msgSend(v67, "initWithResultsBlock:", v107);
      fakeCaptiveLeaseRenewalSymptomItem = v9->_fakeCaptiveLeaseRenewalSymptomItem;
      v9->_fakeCaptiveLeaseRenewalSymptomItem = (HFItem *)v68;

      v70 = objc_alloc(MEMORY[0x1E0D31840]);
      v105[0] = v16;
      v105[1] = 3221225472;
      v105[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_18;
      v105[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v106, &location);
      v71 = objc_msgSend(v70, "initWithResultsBlock:", v105);
      fakeNetworkStrengthErrorItem = v9->_fakeNetworkStrengthErrorItem;
      v9->_fakeNetworkStrengthErrorItem = (HFItem *)v71;

      objc_destroyWeak(&v106);
      objc_destroyWeak(&v108);
      objc_destroyWeak(&v110);
      objc_destroyWeak(&v112);
      objc_destroyWeak(&v114);
      objc_destroyWeak(&v116);
      objc_destroyWeak(&v118);
      objc_destroyWeak(&v120);
      objc_destroyWeak(&v122);
      objc_destroyWeak(&v124);
      objc_destroyWeak(&v126);
      objc_destroyWeak(&v128);
      objc_destroyWeak(&v130);
      objc_destroyWeak(&v132);
      objc_destroyWeak(&v134);
      objc_destroyWeak(&v136);
      objc_destroyWeak(&v138);
      objc_destroyWeak(&v140);
    }
    v73 = v94;
    v7 = v95;
    if (v94)
    {
      objc_msgSend(v94, "symptomsHandler");
      v74 = objc_claimAutoreleasedReturnValue();
      v75 = v9->_symptomsHandler;
      v9->_symptomsHandler = (HMSymptomsHandler *)v74;

      v76 = objc_alloc(MEMORY[0x1E0D31840]);
      v103[0] = v16;
      v103[1] = 3221225472;
      v103[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_19;
      v103[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v104, &location);
      v77 = objc_msgSend(v76, "initWithResultsBlock:", v103);
      fakeStereoPairGeneralSymptomItem = v9->_fakeStereoPairGeneralSymptomItem;
      v9->_fakeStereoPairGeneralSymptomItem = (HFItem *)v77;

      v79 = objc_alloc(MEMORY[0x1E0D31840]);
      v101[0] = v16;
      v101[1] = 3221225472;
      v101[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_20;
      v101[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v102, &location);
      v80 = objc_msgSend(v79, "initWithResultsBlock:", v101);
      fakeStereoPairNotFoundSymptomItem = v9->_fakeStereoPairNotFoundSymptomItem;
      v9->_fakeStereoPairNotFoundSymptomItem = (HFItem *)v80;

      v82 = objc_alloc(MEMORY[0x1E0D31840]);
      v99[0] = v16;
      v99[1] = 3221225472;
      v99[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_21;
      v99[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v100, &location);
      v83 = objc_msgSend(v82, "initWithResultsBlock:", v99);
      fakeStereoPairVersionMismatchSymptomItem = v9->_fakeStereoPairVersionMismatchSymptomItem;
      v9->_fakeStereoPairVersionMismatchSymptomItem = (HFItem *)v83;

      v85 = objc_alloc(MEMORY[0x1E0D31840]);
      v97[0] = v16;
      v97[1] = 3221225472;
      v97[2] = __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_22;
      v97[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v98, &location);
      v86 = objc_msgSend(v85, "initWithResultsBlock:", v97);
      v87 = v9->_fake8021xNetworkSymptomItem;
      v9->_fake8021xNetworkSymptomItem = (HFItem *)v86;

      objc_destroyWeak(&v98);
      objc_destroyWeak(&v100);
      objc_destroyWeak(&v102);
      objc_destroyWeak(&v104);
      v73 = v94;
      v7 = v95;
    }
    v88 = (void *)objc_opt_new();
    if (objc_msgSend(MEMORY[0x1E0D319D0], "isInternalInstall"))
    {
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeUnreachableItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeWifiNetworkMismatchSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeWiFiSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeWiFiPerformanceSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeInternetFixSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeHardwareFixSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeGeneralFixSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeHomeKitSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeICloudSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeITunesSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeCDPSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeVPNProfileExpiredSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fake8021xNetworkSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeNetworkProfileFixSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeNetworkProfileInstallSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeNetworkNotShareableSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeCaptiveLeaseRenewalSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeNetworkStrengthErrorItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeStereoPairGeneralSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeStereoPairNotFoundSymptomItem);
      objc_msgSend(v88, "na_safeAddObject:", v9->_fakeStereoPairVersionMismatchSymptomItem);
    }
    v89 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v88);
    debugItemProvider = v9->_debugItemProvider;
    v9->_debugItemProvider = (HFStaticItemProvider *)v89;

    objc_destroyWeak(&location);
  }

  return v9;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Reachability Error"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeUnreachableError");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake WiFi Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeWiFiSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake WiFi Perf Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeWiFiPerformanceSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake WiFi Network Mismatch"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeWiFiNetworkMismatchSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Internet Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeInternetFixSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Hardware Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeHardwareFixSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake General Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeGeneralFixSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake HomeKit Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeHomeKitSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake iCloud Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeICloudSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake iTunes Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeITunesSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake CDP Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeCDPSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake VPN Profile Expired Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeVPNProfileExpiredSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake 802.1x Network Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fake8021xNetworkSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Network Profile Fix Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeNetworkProfileFixSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_15(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Network Profile Install Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeNetworkProfileInstallSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_16(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Network Not Shareable Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeNetworkNotShareableSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Captive Lease Renewal"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeCaptiveLeaseRenewalSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake WiFi Indicator Problem"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeNetworkStrengthError");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Stereo Pair General Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeStereoPairGeneralSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_20(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Stereo Pair not Found Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeStereoPairNotFoundSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake Stereo Pair Version Mismatch Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fakeStereoPairVersionMismatchSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __60__HUAccessoryDebugModule_initWithItemUpdater_homeKitObject___block_invoke_22(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Fake 802.1x Network Symptom"), *MEMORY[0x1E0D30D18]);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(WeakRetained, "fake8021xNetworkSymptom");
  objc_msgSend(v3, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUAccessoryDebugModule debugItemProvider](self, "debugItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
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
  id v40;
  void *v41;

  v4 = a3;
  if (HFPreferencesInternalDebuggingEnabled() && objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[HUAccessoryDebugModule fakeUnreachableItem](self, "fakeUnreachableItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeNetworkStrengthErrorItem](self, "fakeNetworkStrengthErrorItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithObjects:", v6, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_setByIntersectingWithSet:", v4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)MEMORY[0x1E0C99E60];
    -[HUAccessoryDebugModule fakeInternetFixSymptomItem](self, "fakeInternetFixSymptomItem");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeWiFiSymptomItem](self, "fakeWiFiSymptomItem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeWiFiPerformanceSymptomItem](self, "fakeWiFiPerformanceSymptomItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fake8021xNetworkSymptomItem](self, "fake8021xNetworkSymptomItem");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeNetworkProfileFixSymptomItem](self, "fakeNetworkProfileFixSymptomItem");
    v40 = v4;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeNetworkProfileInstallSymptomItem](self, "fakeNetworkProfileInstallSymptomItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeNetworkNotShareableSymptomItem](self, "fakeNetworkNotShareableSymptomItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeHardwareFixSymptomItem](self, "fakeHardwareFixSymptomItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeGeneralFixSymptomItem](self, "fakeGeneralFixSymptomItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeHomeKitSymptomItem](self, "fakeHomeKitSymptomItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeITunesSymptomItem](self, "fakeITunesSymptomItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeICloudSymptomItem](self, "fakeICloudSymptomItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeCDPSymptomItem](self, "fakeCDPSymptomItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeWifiNetworkMismatchSymptomItem](self, "fakeWifiNetworkMismatchSymptomItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeVPNProfileExpiredSymptomItem](self, "fakeVPNProfileExpiredSymptomItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeCaptiveLeaseRenewalSymptomItem](self, "fakeCaptiveLeaseRenewalSymptomItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithObjects:", v41, v31, v39, v38, v37, v36, v35, v30, v9, v10, v29, v11, v12, v13, v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "na_setByIntersectingWithSet:", v40);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v40;
    v17 = (void *)MEMORY[0x1E0C99E60];
    -[HUAccessoryDebugModule fakeStereoPairNotFoundSymptomItem](self, "fakeStereoPairNotFoundSymptomItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeStereoPairVersionMismatchSymptomItem](self, "fakeStereoPairVersionMismatchSymptomItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fakeStereoPairGeneralSymptomItem](self, "fakeStereoPairGeneralSymptomItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessoryDebugModule fake8021xNetworkSymptomItem](self, "fake8021xNetworkSymptomItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithObjects:", v18, v19, v20, v21, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "na_setByIntersectingWithSet:", v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_opt_new();
    __58__HUAccessoryDebugModule_buildSectionsWithDisplayedItems___block_invoke(CFSTR("Accessory Debugging"), v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "na_safeAddObject:", v25);

    __58__HUAccessoryDebugModule_buildSectionsWithDisplayedItems___block_invoke(CFSTR("Symptom Debugging"), v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "na_safeAddObject:", v26);

    __58__HUAccessoryDebugModule_buildSectionsWithDisplayedItems___block_invoke(CFSTR("Stereo Pair Symptom Debugging"), v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "na_safeAddObject:", v27);

  }
  else
  {
    v24 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

id __58__HUAccessoryDebugModule_buildSectionsWithDisplayedItems___block_invoke(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v3);
    objc_msgSend(v5, "setHeaderTitle:", v3);
    objc_msgSend(v5, "setFooterTitle:", CFSTR("*** INTERNAL USE ONLY ***"));
    objc_msgSend(v4, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingComparator:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItems:", v8);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)fakeICloudSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeICloudSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeITunesSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeITunesSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeCDPSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeCDPSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeGeneralFixSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeGeneralFixSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeHomeKitSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeHomeKitSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeUnreachableError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeUnreachableError:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HUAccessoryDebugModule_setFakeUnreachableError___block_invoke;
  v8[3] = &unk_1E6F56FC0;
  v8[4] = self;
  objc_msgSend(v7, "dispatchAccessoryObserverMessage:sender:", v8, 0);

  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

void __50__HUAccessoryDebugModule_setFakeUnreachableError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryDidUpdateReachability:", v3);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessoryDidUpdateReachableTransports:", v4);

  }
}

- (BOOL)fakeWiFiNetworkMismatchSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeWiFiNetworkMismatchSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeVPNProfileExpiredSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeVPNProfileExpiredSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeWiFiSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeWiFiSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeWiFiPerformanceSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeWiFiPerformanceSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeInternetFixSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeInternetFixSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeHardwareFixSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeHardwareFixSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeStereoPairGeneralSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeStereoPairGeneralSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeStereoPairNotFoundSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeStereoPairNotFoundSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeStereoPairVersionMismatchSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeStereoPairVersionMismatchSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fake8021xNetworkSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFake8021xNetworkSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeNetworkProfileFixSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeNetworkProfileFixSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeNetworkProfileInstallSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeNetworkProfileInstallSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeNetworkNotShareableSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeNetworkNotShareableSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeCaptiveLeaseRenewalSymptom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeCaptiveLeaseRenewalSymptom:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _pushSymptomUpdate](self, "_pushSymptomUpdate");
  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (BOOL)fakeNetworkStrengthError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessoryValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (void)setFakeNetworkStrengthError:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUAccessoryDebugModule homeKitObject](self, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HFPreferencesAccessorySetValueForKey();

  -[HUAccessoryDebugModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (void)_reloadItemProviders
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D314C0];
  -[HUAccessoryDebugModule itemProviders](self, "itemProviders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestToReloadItemProviders:senderSelector:", v5, a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "performItemUpdateRequest:", v8);

}

- (void)_pushSymptomUpdate
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  -[HUAccessoryDebugModule symptomsHandler](self, "symptomsHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__HUAccessoryDebugModule__pushSymptomUpdate__block_invoke;
  v5[3] = &unk_1E6F5A650;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "dispatchSymptomsHandlerMessage:sender:", v5, 0);

}

void __44__HUAccessoryDebugModule__pushSymptomUpdate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "symptoms");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "symptomsHandler:didUpdateSymptoms:", v3, v4);

  }
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (HFItem)fakeUnreachableItem
{
  return self->_fakeUnreachableItem;
}

- (HFItem)fakeWiFiSymptomItem
{
  return self->_fakeWiFiSymptomItem;
}

- (HFItem)fakeWiFiPerformanceSymptomItem
{
  return self->_fakeWiFiPerformanceSymptomItem;
}

- (HFItem)fakeInternetFixSymptomItem
{
  return self->_fakeInternetFixSymptomItem;
}

- (HFItem)fakeHardwareFixSymptomItem
{
  return self->_fakeHardwareFixSymptomItem;
}

- (HFItem)fakeGeneralFixSymptomItem
{
  return self->_fakeGeneralFixSymptomItem;
}

- (HFItem)fakeHomeKitSymptomItem
{
  return self->_fakeHomeKitSymptomItem;
}

- (HFItem)fakeICloudSymptomItem
{
  return self->_fakeICloudSymptomItem;
}

- (HFItem)fakeITunesSymptomItem
{
  return self->_fakeITunesSymptomItem;
}

- (HFItem)fakeCDPSymptomItem
{
  return self->_fakeCDPSymptomItem;
}

- (HFItem)fakeWifiNetworkMismatchSymptomItem
{
  return self->_fakeWifiNetworkMismatchSymptomItem;
}

- (HFItem)fakeVPNProfileExpiredSymptomItem
{
  return self->_fakeVPNProfileExpiredSymptomItem;
}

- (HFItem)fake8021xNetworkSymptomItem
{
  return self->_fake8021xNetworkSymptomItem;
}

- (HFItem)fakeNetworkProfileFixSymptomItem
{
  return self->_fakeNetworkProfileFixSymptomItem;
}

- (HFItem)fakeNetworkProfileInstallSymptomItem
{
  return self->_fakeNetworkProfileInstallSymptomItem;
}

- (HFItem)fakeNetworkNotShareableSymptomItem
{
  return self->_fakeNetworkNotShareableSymptomItem;
}

- (HFItem)fakeCaptiveLeaseRenewalSymptomItem
{
  return self->_fakeCaptiveLeaseRenewalSymptomItem;
}

- (HFItem)fakeNetworkStrengthErrorItem
{
  return self->_fakeNetworkStrengthErrorItem;
}

- (HFItem)fakeStereoPairGeneralSymptomItem
{
  return self->_fakeStereoPairGeneralSymptomItem;
}

- (HFItem)fakeStereoPairNotFoundSymptomItem
{
  return self->_fakeStereoPairNotFoundSymptomItem;
}

- (HFItem)fakeStereoPairVersionMismatchSymptomItem
{
  return self->_fakeStereoPairVersionMismatchSymptomItem;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMSymptomsHandler)symptomsHandler
{
  return self->_symptomsHandler;
}

- (HFStaticItemProvider)debugItemProvider
{
  return self->_debugItemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugItemProvider, 0);
  objc_storeStrong((id *)&self->_symptomsHandler, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_fakeStereoPairVersionMismatchSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeStereoPairNotFoundSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeStereoPairGeneralSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeNetworkStrengthErrorItem, 0);
  objc_storeStrong((id *)&self->_fakeCaptiveLeaseRenewalSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeNetworkNotShareableSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeNetworkProfileInstallSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeNetworkProfileFixSymptomItem, 0);
  objc_storeStrong((id *)&self->_fake8021xNetworkSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeVPNProfileExpiredSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeWifiNetworkMismatchSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeCDPSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeITunesSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeICloudSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeHomeKitSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeGeneralFixSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeHardwareFixSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeInternetFixSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeWiFiPerformanceSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeWiFiSymptomItem, 0);
  objc_storeStrong((id *)&self->_fakeUnreachableItem, 0);
  objc_storeStrong((id *)&self->_homeKitObject, 0);
}

@end
