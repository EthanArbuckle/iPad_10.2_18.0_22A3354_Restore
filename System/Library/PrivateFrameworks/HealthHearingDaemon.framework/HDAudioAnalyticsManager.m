@implementation HDAudioAnalyticsManager

- (HDAudioAnalyticsManager)initWithProfile:(id)a3
{
  id v4;
  HDAudioAnalyticsManager *v5;
  HDAudioAnalyticsManager *v6;
  double v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  id WeakRetained;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDAudioAnalyticsManager;
  v5 = -[HDAudioAnalyticsManager init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = (double)(uint64_t)*MEMORY[0x24BDAC608];
    v6->_calculationPeriod = (double)(uint64_t)*MEMORY[0x24BDAC600];
    v6->_retryPeriod = v7;
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    *(_WORD *)&v6->_unitTesting = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerDaemonReadyObserver:queue:", v6, v6->_queue);

  }
  return v6;
}

- (void)daemonReady:(id)a3
{
  id v4;
  HDPeriodicActivity *v5;
  HDPeriodicActivity *periodicActivity;
  id v7;

  v4 = objc_alloc(MEMORY[0x24BE40B70]);
  -[HDAudioAnalyticsManager profile](self, "profile");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDAudioAnalyticsManager calculationPeriod](self, "calculationPeriod");
  v5 = (HDPeriodicActivity *)objc_msgSend(v4, "initWithProfile:name:interval:delegate:loggingCategory:", v7, CFSTR("com.apple.healthd.hearing.HDAudioAnalyticsCalculator"), self, *MEMORY[0x24BDD3000]);
  periodicActivity = self->_periodicActivity;
  self->_periodicActivity = v5;

}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  void (**v10)(double);

  v10 = (void (**)(double))a4;
  -[HDAudioAnalyticsManager capturePhoneAnalytics](self, "capturePhoneAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");
  if (v6 == 2 || v6 == 1)
  {
    -[HDAudioAnalyticsManager retryPeriod](self, "retryPeriod");
    v8 = v7;
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v8);

  }
  else if (!v6)
  {
    -[HDAudioAnalyticsManager retryPeriod](self, "retryPeriod");
    ((void (*)(void (**)(double), _QWORD, _QWORD))v10[2])(v10, 0, 0);
  }

}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (id)lastSuccessfulCalculation
{
  void *v2;
  void *v3;

  -[HDAudioAnalyticsManager periodicActivity](self, "periodicActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastSuccessfulRunDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)capturePhoneAnalytics
{
  HDProfile **p_profile;
  id WeakRetained;
  uint64_t v5;
  uint64_t v7;
  HDAudioAnalyticsExposureCalculator *v8;
  void *v9;
  HDAudioAnalyticsExposureCalculator *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  HDAudioAnalyticsExposureCalculator *v17;
  void *v18;
  HDAudioAnalyticsExposureCalculator *v19;
  uint64_t v20;
  id v21;
  id v22;
  HDAudioAnalyticsExposureCalculator *v23;
  void *v24;
  id v25;
  HDAudioAnalyticsExposureCalculator *v26;
  void *v27;
  HDAudioAnalyticsExposureCalculator *v28;
  id v29;
  id v30;
  id v31;
  HDAudioAnalyticsExposureCalculator *v32;
  void *v33;
  HDAudioAnalyticsExposureCalculator *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  HDAudioAnalyticsResult *v42;
  void *v43;
  HDAudioAnalyticsExposureCalculator *v44;
  HDAudioAnalyticsExposureCalculator *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  HDAudioAnalyticsSettingsPreferences *v65;
  id v66;
  void *v67;
  HDAudioAnalyticsExposureCalculator *v68;
  void *v69;
  id v70;
  HDAudioAnalyticsExposureCalculator *v71;
  HDAudioAnalyticsExposureCalculator *v72;
  void *v73;
  HDAudioAnalyticsExposureCalculator *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108[2];

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = objc_msgSend(WeakRetained, "profileType");

  if (v5 != 1 || -[HDAudioAnalyticsManager _recordedDataForToday](self, "_recordedDataForToday"))
    return -[HDAudioAnalyticsResult initWithStatus:error:]([HDAudioAnalyticsResult alloc], "initWithStatus:error:", 2, 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = [HDAudioAnalyticsExposureCalculator alloc];
  -[HDAudioAnalyticsManager profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDAudioAnalyticsExposureCalculator initWithTargetDate:exposureType:profile:](v8, "initWithTargetDate:exposureType:profile:", v7, 0, v9);

  v108[0] = 0;
  -[HDAudioAnalyticsExposureCalculator audioExposureResultWithError:](v10, "audioExposureResultWithError:", v108);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v108[0];
  v107 = v11;
  -[HDAudioAnalyticsExposureCalculator notificationCountForRollingDays:error:](v10, "notificationCountForRollingDays:error:", 1, &v107);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v107;

  v106 = v13;
  -[HDAudioAnalyticsExposureCalculator notificationCountForRollingDays:error:](v10, "notificationCountForRollingDays:error:", 30, &v106);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v106;

  v105 = v15;
  v72 = v10;
  -[HDAudioAnalyticsExposureCalculator sevenDayDoseForMostRecentNotificationWithError:](v10, "sevenDayDoseForMostRecentNotificationWithError:", &v105);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v105;

  v17 = [HDAudioAnalyticsExposureCalculator alloc];
  -[HDAudioAnalyticsManager profile](self, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HDAudioAnalyticsExposureCalculator initWithTargetDate:exposureType:profile:](v17, "initWithTargetDate:exposureType:profile:", v7, 1, v18);

  v104 = v16;
  -[HDAudioAnalyticsExposureCalculator audioExposureResultWithError:](v19, "audioExposureResultWithError:", &v104);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v104;

  v103 = v21;
  -[HDAudioAnalyticsExposureCalculator notificationCountForRollingDays:error:](v19, "notificationCountForRollingDays:error:", 1, &v103);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v103;

  v102 = v22;
  v71 = v19;
  v23 = v19;
  v24 = (void *)v20;
  -[HDAudioAnalyticsExposureCalculator notificationCountForRollingDays:error:](v23, "notificationCountForRollingDays:error:", 30, &v102);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v102;

  v26 = [HDAudioAnalyticsExposureCalculator alloc];
  -[HDAudioAnalyticsManager profile](self, "profile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HDAudioAnalyticsExposureCalculator initWithTargetDate:exposureType:profile:](v26, "initWithTargetDate:exposureType:profile:", v7, 2, v27);

  v101 = v25;
  -[HDAudioAnalyticsExposureCalculator audioExposureResultWithError:](v28, "audioExposureResultWithError:", &v101);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v101;

  v100 = v29;
  -[HDAudioAnalyticsExposureCalculator notificationCountForRollingDays:error:](v28, "notificationCountForRollingDays:error:", 1, &v100);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v100;

  v99 = v30;
  -[HDAudioAnalyticsExposureCalculator notificationCountForRollingDays:error:](v28, "notificationCountForRollingDays:error:", 30, &v99);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v99;

  v32 = [HDAudioAnalyticsExposureCalculator alloc];
  -[HDAudioAnalyticsManager profile](self, "profile");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)v7;
  v34 = -[HDAudioAnalyticsExposureCalculator initWithTargetDate:exposureType:profile:](v32, "initWithTargetDate:exposureType:profile:", v7, 3, v33);

  v98 = v31;
  -[HDAudioAnalyticsExposureCalculator audioExposureResultWithError:](v34, "audioExposureResultWithError:", &v98);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v98;

  v36 = v76;
  v74 = v34;
  if (v76 && v24 && v12 && v14 && v82 && v81 && v80 && v79 && v78 && v77 && v34)
  {
    v68 = v28;
    v69 = v24;
    v67 = v14;
    v37 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v37, "deviceContextManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v35;
    objc_msgSend(v38, "numberOfDeviceContextsPerDeviceType:", &v97);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v97;

    if (v39)
    {
      v66 = v40;
      objc_msgSend(v39, "objectForKeyedSubscript:", &unk_24DC66958);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        objc_msgSend(v39, "objectForKeyedSubscript:", &unk_24DC66958);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v63 = &unk_24DC66970;
      }

      objc_msgSend(v39, "objectForKeyedSubscript:", &unk_24DC66988);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        objc_msgSend(v39, "objectForKeyedSubscript:", &unk_24DC66988);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v62 = &unk_24DC66970;
      }

      objc_msgSend(v39, "objectForKeyedSubscript:", &unk_24DC669A0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (v47)
      {
        objc_msgSend(v39, "objectForKeyedSubscript:", &unk_24DC669A0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v48 = &unk_24DC66970;
      }

      objc_msgSend(v39, "objectForKeyedSubscript:", &unk_24DC669B8);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        objc_msgSend(v39, "objectForKeyedSubscript:", &unk_24DC669B8);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v50 = &unk_24DC66970;
      }

      v65 = objc_alloc_init(HDAudioAnalyticsSettingsPreferences);
      -[HDAudioAnalyticsSettingsPreferences noisePreferences](v65, "noisePreferences");
      v51 = objc_claimAutoreleasedReturnValue();
      -[HDAudioAnalyticsSettingsPreferences headphonePreferences](v65, "headphonePreferences");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_loadWeakRetained((id *)p_profile);
      objc_msgSend(v52, "daemon");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "behavior");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "isiPad");

      v83 = (void *)v51;
      v55 = (void *)v51;
      v84 = v48;
      v85 = v50;
      v56 = v50;
      v86 = v82;
      v87 = v12;
      v14 = v67;
      v88 = v67;
      v89 = v81;
      v90 = v80;
      v24 = v69;
      v91 = v69;
      v92 = v76;
      v93 = v75;
      v94 = v79;
      v95 = v78;
      v96 = v77;
      v57 = v56;
      v58 = v62;
      v70 = v48;
      v59 = v63;
      v60 = v55;
      v61 = v64;
      AnalyticsSendEventLazy();
      v42 = -[HDAudioAnalyticsResult initWithStatus:error:]([HDAudioAnalyticsResult alloc], "initWithStatus:error:", 0, 0);

      v44 = v72;
      v43 = v73;
      v45 = v71;
      v35 = v66;
    }
    else
    {
      v42 = -[HDAudioAnalyticsResult initWithStatus:error:]([HDAudioAnalyticsResult alloc], "initWithStatus:error:", 1, v40);
      v44 = v72;
      v43 = v73;
      v45 = v71;
      v24 = v69;
      v35 = v40;
    }
    v28 = v68;

    v36 = v76;
  }
  else
  {
    v42 = -[HDAudioAnalyticsResult initWithStatus:error:]([HDAudioAnalyticsResult alloc], "initWithStatus:error:", 1, v35);
    v44 = v72;
    v43 = v73;
    v45 = v71;
  }

  return v42;
}

id __48__HDAudioAnalyticsManager_capturePhoneAnalytics__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  __CFString *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  _BOOL8 v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v104;
  void *v105;
  _QWORD v106[8];
  _QWORD v107[8];
  _QWORD v108[11];
  _QWORD v109[2];
  __int128 v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  _QWORD v118[4];
  uint64_t v119;
  __int128 v120;
  uint64_t v121;
  _QWORD v122[2];
  _QWORD v123[4];

  v123[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 35);
  objc_msgSend(*(id *)(a1 + 32), "localDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "haeRetention");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "localDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hasHAENRequired");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 40), CFSTR("HDAudioAnalyticsManager.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("headphonePreferences.localDevice.hasHAENRequired.BOOLValue"));

    }
    v8 = CFSTR("dataRetentionHAENiPad");
    if (!*(_BYTE *)(a1 + 184))
      v8 = CFSTR("dataRetentionHAENPhone");
    v9 = *(void **)(a1 + 32);
    v10 = v8;
    objc_msgSend(v9, "localDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "haeRetention");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "haeRetention");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hasHAENRequired");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if ((v17 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 40), CFSTR("HDAudioAnalyticsManager.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("headphonePreferences.activePairedWatch.hasHAENRequired.BOOLValue"));

    }
    objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "haeRetention");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("dataRetentionHAENWatch"));

  }
  v122[0] = CFSTR("hasEligibleWatchPaired");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "hasWatchPairedWithNoiseApp"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = CFSTR("hasEnvironmentalNoiseEnabled");
  v123[0] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "hasNoiseEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v22);

  objc_msgSend(*(id *)(a1 + 32), "localDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "hasHAENEnabled");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = CFSTR("hasHAENEnablediPad");
    if (!*(_BYTE *)(a1 + 184))
      v25 = CFSTR("hasHAENEnabledPhone");
    v26 = *(void **)(a1 + 32);
    v27 = v25;
    objc_msgSend(v26, "localDevice");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hasHAENEnabled");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v29, v27);

  }
  objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "hasHAENEnabled");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "hasHAENEnabled");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v33, CFSTR("hasHAENEnabledWatch"));

  }
  objc_msgSend(*(id *)(a1 + 32), "localDevice");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "hasMeasureLevelsEnabled");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = CFSTR("hasHeadphoneAudioExposureEnablediPad");
    if (!*(_BYTE *)(a1 + 184))
      v36 = CFSTR("hasHeadphoneAudioExposureEnabledPhone");
    v37 = *(void **)(a1 + 32);
    v38 = v36;
    objc_msgSend(v37, "localDevice");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "hasMeasureLevelsEnabled");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v40, v38);

  }
  objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "hasMeasureLevelsEnabled");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "hasMeasureLevelsEnabled");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v44, CFSTR("hasHeadphoneAudioExposureEnabledWatch"));

  }
  objc_msgSend(*(id *)(a1 + 32), "localDevice");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "hasIncludeOtherHeadphonesEnabled");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = CFSTR("hasHeadphoneAudioExposureOtherEnablediPad");
    if (!*(_BYTE *)(a1 + 184))
      v47 = CFSTR("hasHeadphoneAudioExposureOtherEnabledPhone");
    v48 = *(void **)(a1 + 32);
    v49 = v47;
    objc_msgSend(v48, "localDevice");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "hasIncludeOtherHeadphonesEnabled");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v51, v49);

  }
  objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "hasIncludeOtherHeadphonesEnabled");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "hasIncludeOtherHeadphonesEnabled");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v55, CFSTR("hasHeadphoneAudioExposureOtherEnabledWatch"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "hasNoiseNotificationsEnabled"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v56, CFSTR("hasNoiseNotificationsEnabled"));

  v57 = CFSTR("isHAENRequirediPad");
  if (!*(_BYTE *)(a1 + 184))
    v57 = CFSTR("isHAENRequiredPhone");
  v58 = *(void **)(a1 + 32);
  v59 = v57;
  objc_msgSend(v58, "localDevice");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "hasHAENRequired");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v61, v59);

  objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(*(id *)(a1 + 32), "activePairedWatch");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "hasHAENRequired");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v64, CFSTR("isHAENRequiredWatch"));

  }
  v65 = *(_QWORD *)(a1 + 56);
  v118[0] = CFSTR("countPairediPhone");
  v118[1] = CFSTR("countPairedWatch");
  v120 = *(_OWORD *)(a1 + 64);
  v118[2] = CFSTR("countPairediPad");
  v118[3] = CFSTR("countPairedVisionPro");
  v66 = *(_QWORD *)(a1 + 80);
  v119 = v65;
  v121 = v66;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v119, v118, 4);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v67);

  v68 = HKImproveHealthAndActivityAnalyticsAllowed();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v69, CFSTR("isImproveHealthAndActivityAllowed"));

  if ((v68 & 1) != 0)
  {
    v108[0] = CFSTR("actualDosePercentAtNotification");
    v108[1] = CFSTR("countHAENotificationsLast24Hours");
    v70 = *(_QWORD *)(a1 + 96);
    v109[0] = *(_QWORD *)(a1 + 88);
    v109[1] = v70;
    v110 = *(_OWORD *)(a1 + 104);
    v108[2] = CFSTR("countHAENotificationsLast30Days");
    v108[3] = CFSTR("countEAENotificationsLast24Hours");
    v71 = *(void **)(a1 + 128);
    v111 = *(_QWORD *)(a1 + 120);
    v108[4] = CFSTR("countEAENotificationsLast30Days");
    v108[5] = CFSTR("EAE7DayDosePercentage");
    objc_msgSend(v71, "audioExposureDose");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v72;
    v108[6] = CFSTR("EAE7DayDuration");
    objc_msgSend(*(id *)(a1 + 128), "audioExposureDuration");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v73;
    v108[7] = CFSTR("EAE7DayLEQ");
    objc_msgSend(*(id *)(a1 + 128), "audioExposureLEQ");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v74;
    v108[8] = CFSTR("hAE7DayDosePercentage");
    objc_msgSend(*(id *)(a1 + 136), "audioExposureDose");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v75;
    v108[9] = CFSTR("hAE7DayDuration");
    objc_msgSend(*(id *)(a1 + 136), "audioExposureDuration");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v76;
    v108[10] = CFSTR("hAE7DayLEQ");
    objc_msgSend(*(id *)(a1 + 136), "audioExposureLEQ");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v77;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, v108, 11);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v78);

    objc_msgSend(*(id *)(a1 + 144), "audioExposureDuration");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "doubleValue");
    v81 = v80 > 0.0;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v82, CFSTR("hasEnvironmentalSoundReductionDataPast7Days"));

    objc_msgSend(MEMORY[0x24BE4BE58], "sharedInstance");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "activeHearingProtectionAvailable");
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE4BE58], "sharedInstance");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "activeHearingProtectionEnabled");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v84)
    {
      objc_msgSend(v84, "allValues");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "containsObject:", MEMORY[0x24BDBD1C8]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v89, CFSTR("hasEnvironmentalSoundReductionAvailable"));

      if ((_DWORD)v88)
      {
        if (v86)
        {
          objc_msgSend(v86, "allValues");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "containsObject:", MEMORY[0x24BDBD1C8]);

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v92, CFSTR("hasEnvironmentalSoundReductionEnabled"));

        }
      }
    }
    v106[0] = CFSTR("EAE7DayDoseWithEnvironmentalSoundReduction");
    objc_msgSend(*(id *)(a1 + 152), "audioExposureDose");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v93;
    v106[1] = CFSTR("EAE7DayDurationWithEnvironmentalSoundReduction");
    objc_msgSend(*(id *)(a1 + 152), "audioExposureDuration");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v94;
    v106[2] = CFSTR("EAE7DayLEQWithEnvironmentalSoundReduction");
    objc_msgSend(*(id *)(a1 + 152), "audioExposureLEQ");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v107[2] = v95;
    v106[3] = CFSTR("soundReduction7DayDuration");
    objc_msgSend(*(id *)(a1 + 144), "audioExposureDuration");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v107[3] = v96;
    v106[4] = CFSTR("soundReduction7DayLEQ");
    objc_msgSend(*(id *)(a1 + 144), "audioExposureLEQ");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = *(_QWORD *)(a1 + 160);
    v99 = *(_QWORD *)(a1 + 168);
    v107[4] = v97;
    v107[5] = v98;
    v106[5] = CFSTR("countEAENotificationsWithSoundReductionLast24Hours");
    v106[6] = CFSTR("countEAENotificationsWithSoundReductionLast30Days");
    v107[6] = v99;
    v106[7] = CFSTR("noiseThresholdSetting");
    objc_msgSend(*(id *)(a1 + 48), "noiseThreshold");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v107[7] = v100;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v107, v106, 8);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addEntriesFromDictionary:", v101);

    v102 = (void *)objc_msgSend(v2, "copy");
  }
  else
  {
    v102 = (void *)objc_msgSend(v2, "copy");
  }

  return v102;
}

- (void)_unitTesting_setRecordedDataForToday:(BOOL)a3
{
  self->_unitTesting = 1;
  self->_unitTesting_recordedDataForToday = a3;
}

- (BOOL)_recordedDataForToday
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_unitTesting)
  {
    LOBYTE(v3) = self->_unitTesting_recordedDataForToday;
  }
  else
  {
    -[HDAudioAnalyticsManager lastSuccessfulCalculation](self, "lastSuccessfulCalculation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HDAudioAnalyticsManager _dayForDate:](self, "_dayForDate:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDAudioAnalyticsManager _dayForDate:](self, "_dayForDate:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = !-[HDAudioAnalyticsManager _dayComponents:lessThan:](self, "_dayComponents:lessThan:", v5, v7);
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

- (id)_dayForDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HDAudioAnalyticsUtilities localGregorianCalendar](HDAudioAnalyticsUtilities, "localGregorianCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 30, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_dayComponents:(id)a3 lessThan:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "era");
  if (v7 >= objc_msgSend(v6, "era")
    && (v8 = objc_msgSend(v5, "year"), v8 >= objc_msgSend(v6, "year"))
    && (v9 = objc_msgSend(v5, "month"), v9 >= objc_msgSend(v6, "month")))
  {
    v12 = objc_msgSend(v5, "day");
    v10 = v12 < objc_msgSend(v6, "day");
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (double)calculationPeriod
{
  return self->_calculationPeriod;
}

- (double)retryPeriod
{
  return self->_retryPeriod;
}

- (HDPeriodicActivity)periodicActivity
{
  return self->_periodicActivity;
}

- (void)setPeriodicActivity:(id)a3
{
  objc_storeStrong((id *)&self->_periodicActivity, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (BOOL)unitTesting_recordedDataForToday
{
  return self->_unitTesting_recordedDataForToday;
}

- (void)setUnitTesting_recordedDataForToday:(BOOL)a3
{
  self->_unitTesting_recordedDataForToday = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_periodicActivity, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
