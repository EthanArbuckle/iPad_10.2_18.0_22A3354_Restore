@implementation CRCarPlayAppPolicyEvaluator

+ (id)_carIntentIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CBD648];
  v6[0] = *MEMORY[0x1E0CBD640];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0CBD668];
  v6[2] = *MEMORY[0x1E0CBD650];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0CBD620];
  v6[4] = *MEMORY[0x1E0CBD658];
  v6[5] = v4;
  v6[6] = *MEMORY[0x1E0CBD660];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allIntentIdentifiers
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CBD680];
  v9[0] = *MEMORY[0x1E0CBD688];
  v9[1] = v3;
  v4 = *MEMORY[0x1E0CBD638];
  v9[2] = *MEMORY[0x1E0CBD630];
  v9[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_carIntentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CRCarPlayAppPolicyEvaluator)init
{
  CRCarPlayAppPolicyEvaluator *v2;
  CRCarPlayAppDenylist *v3;
  CRCarPlayAppPolicyEvaluator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *lockedOrHiddenApps;
  void *v11;
  id v12;
  _QWORD block[4];
  CRCarPlayAppPolicyEvaluator *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRCarPlayAppPolicyEvaluator;
  v2 = -[CRCarPlayAppPolicyEvaluator init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CRCarPlayAppDenylist);
    -[CRCarPlayAppPolicyEvaluator setDenylist:](v2, "setDenylist:", v3);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__CRCarPlayAppPolicyEvaluator_init__block_invoke;
    block[3] = &unk_1E5427E58;
    v4 = v2;
    v15 = v4;
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, block);
    v5 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(MEMORY[0x1E0CF9688], "lockedAppBundleIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF9688], "hiddenAppBundleIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unionSet:", v8);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    lockedOrHiddenApps = v4->_lockedOrHiddenApps;
    v4->_lockedOrHiddenApps = (NSSet *)v9;

    objc_msgSend(MEMORY[0x1E0CF96A8], "subjectMonitorRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "addMonitor:subjectMask:subscriptionOptions:", v4, 1, 1);

  }
  return v2;
}

void __35__CRCarPlayAppPolicyEvaluator_init__block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const void *v1;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v1 = (const void *)objc_opt_class();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v1, (CFNotificationCallback)CRCarPlayAppServicePolicyChangedHandler, CFSTR("com.apple.carkit.app.denylist-changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)setWantsGeoSupported
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *geoQueue;
  NSObject *v5;

  if (!-[CRCarPlayAppPolicyEvaluator evaluatorWantsGeoManagement](self, "evaluatorWantsGeoManagement"))
  {
    self->_evaluatorWantsGeoManagement = 1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.carplay.policy_geo_queue", v5);
    geoQueue = self->_geoQueue;
    self->_geoQueue = v3;

    -[CRCarPlayAppPolicyEvaluator updateGeoSupported](self, "updateGeoSupported");
  }
}

- (void)updateGeoSupported
{
  -[CRCarPlayAppPolicyEvaluator updateGeoSupportedWithCompletion:](self, "updateGeoSupportedWithCompletion:", 0);
}

- (void)updateGeoSupportedWithCompletion:(id)a3
{
  id v4;
  NSObject *geoQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (-[CRCarPlayAppPolicyEvaluator evaluatorWantsGeoManagement](self, "evaluatorWantsGeoManagement"))
  {
    geoQueue = self->_geoQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64__CRCarPlayAppPolicyEvaluator_updateGeoSupportedWithCompletion___block_invoke;
    v6[3] = &unk_1E54281B8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(geoQueue, v6);

  }
}

void __64__CRCarPlayAppPolicyEvaluator_updateGeoSupportedWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "currentCountrySupportsCarIntegration");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = v2;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);

}

- (BOOL)isGeoSupported
{
  NSObject *geoQueue;
  int geoSupported;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (-[CRCarPlayAppPolicyEvaluator evaluatorWantsGeoManagement](self, "evaluatorWantsGeoManagement"))
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    geoQueue = self->_geoQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__CRCarPlayAppPolicyEvaluator_isGeoSupported__block_invoke;
    v6[3] = &unk_1E5429290;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(geoQueue, v6);
    geoSupported = *((unsigned __int8 *)v8 + 24);
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    geoSupported = self->_geoSupported;
  }
  return geoSupported != 0;
}

uint64_t __45__CRCarPlayAppPolicyEvaluator_isGeoSupported__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 17);
  return result;
}

- (id)currentSession
{
  CARSessionStatus *sessionStatus;
  CARSessionStatus *v4;
  CARSessionStatus *v5;

  sessionStatus = self->_sessionStatus;
  if (!sessionStatus)
  {
    v4 = objc_alloc_init(CARSessionStatus);
    v5 = self->_sessionStatus;
    self->_sessionStatus = v4;

    sessionStatus = self->_sessionStatus;
  }
  -[CARSessionStatus waitForSessionInitialization](sessionStatus, "waitForSessionInitialization");
  return -[CARSessionStatus currentSession](self->_sessionStatus, "currentSession");
}

- (id)_vehicleProtocolsForCertificateSerial:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CRPairedVehicleManager *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  if (v4)
    goto LABEL_2;
  -[CRCarPlayAppPolicyEvaluator currentSession](self, "currentSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "MFiCertificateSerialNumber");
    v4 = objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      CarGeneralLogging();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[CRCarPlayAppPolicyEvaluator _vehicleProtocolsForCertificateSerial:].cold.1(v4);
      v13 = 0;
      goto LABEL_15;
    }
LABEL_2:
    +[CRVehicleAccessoryManager sharedInstance](CRVehicleAccessoryManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vehicleAccessoryForCertificateSerial:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v6, "accessoryProtocols");
      v9 = (CRPairedVehicleManager *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = objc_alloc_init(CRPairedVehicleManager);
      -[CRPairedVehicleManager vehicleForCertificateSerial:](v9, "vehicleForCertificateSerial:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "accessoryProtocols");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }

    }
    v13 = v10;

LABEL_15:
    return v13;
  }
  v13 = 0;
  return v13;
}

- (BOOL)_vehicleProtocolsIntersectAppProtocols:(id)a3 certificateSerial:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  char v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CRCarPlayAppPolicyEvaluator _vehicleProtocolsForCertificateSerial:](self, "_vehicleProtocolsForCertificateSerial:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CarGeneralLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1A83A2000, v8, OS_LOG_TYPE_DEFAULT, "Received automaker protocols %{public}@", (uint8_t *)&v11, 0xCu);
  }

  if (v7)
    v9 = objc_msgSend(v6, "intersectsSet:", v7);
  else
    v9 = 0;

  return v9;
}

- (BOOL)_checkIfDeclaration:(id)a3 supportsIntents:(id)a4 requireAllIntents:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char v18;
  BOOL v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v11 = (void *)getLSApplicationRecordClass_softClass;
  v35 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __getLSApplicationRecordClass_block_invoke;
    v31[3] = &unk_1E5428AD0;
    v31[4] = &v32;
    __getLSApplicationRecordClass_block_invoke((uint64_t)v31);
    v11 = (void *)v33[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v32, 8);
  v26 = 0;
  v13 = (void *)objc_msgSend([v12 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v10, 0, &v26);
  v14 = v26;
  if (!v13)
  {
    CarGeneralLogging();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CRCarPlayAppPolicyEvaluator _checkIfDeclaration:supportsIntents:requireAllIntents:].cold.1((uint64_t)v10, (uint64_t)v14, v17);
    goto LABEL_15;
  }
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "supportedIntents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject count](v17, "count")
    || (!v5 ? (v18 = objc_msgSend(v9, "intersectsSet:", v17)) : (v18 = objc_msgSend(v9, "isSubsetOfSet:", v17)),
        (v18 & 1) == 0))
  {
    objc_msgSend(v13, "applicationExtensionRecords");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __85__CRCarPlayAppPolicyEvaluator__checkIfDeclaration_supportsIntents_requireAllIntents___block_invoke;
      v22[3] = &unk_1E54292B8;
      v25 = v5;
      v24 = &v27;
      v23 = v9;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v22);

    }
LABEL_15:

    v19 = *((_BYTE *)v28 + 24) != 0;
    goto LABEL_16;
  }

  v19 = 1;
LABEL_16:

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __85__CRCarPlayAppPolicyEvaluator__checkIfDeclaration_supportsIntents_requireAllIntents___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "supportedIntents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    v8 = objc_msgSend(v7, "isSubsetOfSet:", v9);
  else
    v8 = objc_msgSend(v7, "intersectsSet:", v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (BOOL)_appWithDeclaration:(id)a3 supportsAllIntents:(id)a4
{
  return -[CRCarPlayAppPolicyEvaluator _checkIfDeclaration:supportsIntents:requireAllIntents:](self, "_checkIfDeclaration:supportsIntents:requireAllIntents:", a3, a4, 1);
}

- (BOOL)_appWithDeclaration:(id)a3 supportsAnyIntents:(id)a4
{
  return -[CRCarPlayAppPolicyEvaluator _checkIfDeclaration:supportsIntents:requireAllIntents:](self, "_checkIfDeclaration:supportsIntents:requireAllIntents:", a3, a4, 0);
}

- (unint64_t)_applicationCategoryForAppDeclaration:(id)a3 policy:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "_applicationCategory");
  if (!v7)
  {
    if (objc_msgSend(v6, "launchUsingTemplateUI"))
    {
      if ((objc_msgSend(v5, "supportsAudio") & 1) != 0)
        goto LABEL_21;
      if ((objc_msgSend(v5, "supportsMaps") & 1) != 0)
      {
        v7 = 8;
        goto LABEL_22;
      }
      if ((objc_msgSend(v5, "supportsCalling") & 1) != 0)
      {
        v7 = 4;
        goto LABEL_22;
      }
      if ((objc_msgSend(v5, "supportsMessaging") & 1) != 0)
      {
        v7 = 2;
        goto LABEL_22;
      }
      if ((objc_msgSend(v5, "supportsCharging") & 1) != 0)
      {
        v7 = 256;
        goto LABEL_22;
      }
      if ((objc_msgSend(v5, "supportsParking") & 1) != 0)
      {
        v7 = 512;
        goto LABEL_22;
      }
      if ((objc_msgSend(v5, "supportsQuickOrdering") & 1) != 0)
      {
        v7 = 128;
        goto LABEL_22;
      }
      if ((objc_msgSend(v5, "supportsFueling") & 1) != 0)
      {
        v7 = 2048;
        goto LABEL_22;
      }
      if ((objc_msgSend(v5, "supportsDrivingTask") & 1) != 0)
      {
        v7 = 4096;
        goto LABEL_22;
      }
    }
    if ((objc_msgSend(v6, "launchUsingMusicUIService") & 1) == 0)
      goto LABEL_22;
LABEL_21:
    v7 = 16;
  }
LABEL_22:

  return v7;
}

- (id)effectivePolicyForAppDeclaration:(id)a3
{
  return -[CRCarPlayAppPolicyEvaluator effectivePolicyForAppDeclaration:inVehicleWithCertificateSerial:](self, "effectivePolicyForAppDeclaration:inVehicleWithCertificateSerial:", a3, 0);
}

- (id)effectivePolicyForAppDeclaration:(id)a3 inVehicleWithCertificateSerial:(id)a4
{
  id v6;
  id v7;
  CRCarPlayAppPolicy *v8;
  void *v9;
  void *v10;
  char v11;
  int v12;
  unsigned int v13;
  int v14;
  _BOOL4 v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  char v38;
  int v39;
  NSSet *lockedOrHiddenApps;
  void *v41;
  _BOOL4 v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void **v46;
  void *v47;
  unsigned int v48;
  void *v49;
  id v50;
  void *v51;
  _BOOL8 v52;
  void *v53;
  id v54;
  uint64_t v55;
  unsigned int v57;
  unsigned int v58;
  _BOOL4 v59;
  unsigned int v60;
  void *v61;
  int v62;
  int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[2];
  _QWORD v76[2];
  __int128 buf;
  void *(*v78)(uint64_t);
  void *v79;
  uint64_t *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CRCarPlayAppPolicy);
  if (!v6)
    goto LABEL_62;
  -[CRCarPlayAppPolicyEvaluator denylist](self, "denylist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsBundleIdentifier:", v10);

  if ((v11 & 1) != 0)
    goto LABEL_62;
  v12 = objc_msgSend(v6, "launchUsingSiri");
  v63 = objc_msgSend(v6, "launchNotificationsUsingSiri");
  v13 = objc_msgSend(v6, "supportsTemplates");
  v14 = objc_msgSend(v6, "isSystemApp");
  v60 = v13;
  v62 = v12;
  if (v14)
  {
    if (objc_msgSend(v6, "requiresGeoSupport"))
      v15 = -[CRCarPlayAppPolicyEvaluator isGeoSupported](self, "isGeoSupported");
    else
      v15 = 1;
  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(v6, "supportsPlayableContent");
  objc_msgSend(v6, "autoMakerProtocols");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14 | v16;
  v18 = v16 | v15;
  if (v61
    && -[CRCarPlayAppPolicyEvaluator _vehicleProtocolsIntersectAppProtocols:certificateSerial:](self, "_vehicleProtocolsIntersectAppProtocols:certificateSerial:", v61, v7))
  {
    +[CRCarPlayAppPolicyEvaluator _carIntentIdentifiers](CRCarPlayAppPolicyEvaluator, "_carIntentIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[CRCarPlayAppPolicyEvaluator _appWithDeclaration:supportsAnyIntents:](self, "_appWithDeclaration:supportsAnyIntents:", v6, v19);

    v17 = 1;
    v18 = 1;
    v15 = 1;
  }
  else
  {
    v59 = 0;
  }
  v20 = objc_msgSend(v6, "supportsPublicSafety");
  v66 = v20 | v17;
  v21 = v20 | v18;
  v22 = v20 | v15;
  if ((objc_msgSend(v6, "supportsMessaging") & 1) != 0 || objc_msgSend(v6, "supportsCommunication"))
  {
    v23 = *MEMORY[0x1E0CBD638];
    v76[0] = *MEMORY[0x1E0CBD630];
    v76[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[CRCarPlayAppPolicyEvaluator _appWithDeclaration:supportsAllIntents:](self, "_appWithDeclaration:supportsAllIntents:", v6, v24);

    v65 = v22;
    if (v25)
    {
      v22 = objc_msgSend(v6, "supportsTemplates");
      v65 = 1;
      v66 = 1;
      v21 = 1;
      v62 = objc_msgSend(v6, "supportsTemplates") ^ 1;
      v63 = 1;
    }
  }
  else
  {
    v65 = v22;
  }
  if ((objc_msgSend(v6, "supportsCalling") & 1) != 0 || objc_msgSend(v6, "supportsCommunication"))
  {
    v26 = *MEMORY[0x1E0CBD680];
    v75[0] = *MEMORY[0x1E0CBD688];
    v75[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[CRCarPlayAppPolicyEvaluator _appWithDeclaration:supportsAnyIntents:](self, "_appWithDeclaration:supportsAnyIntents:", v6, v27);

    if (v28)
    {
      v22 = objc_msgSend(v6, "supportsTemplates");
      v65 = 1;
      v66 = 1;
      v21 = 1;
      v62 = objc_msgSend(v6, "supportsTemplates") ^ 1;
      v63 = 1;
    }
  }
  if ((objc_msgSend(v6, "supportsMaps") & 1) != 0
    || (objc_msgSend(v6, "supportsAudio") & 1) != 0
    || (objc_msgSend(v6, "supportsCharging") & 1) != 0
    || (objc_msgSend(v6, "supportsParking") & 1) != 0
    || (objc_msgSend(v6, "supportsQuickOrdering") & 1) != 0
    || (objc_msgSend(v6, "supportsFueling") & 1) != 0
    || objc_msgSend(v6, "supportsDrivingTask"))
  {
    v66 = 1;
    v21 = 1;
    v22 = 1;
  }
  if ((objc_msgSend(v6, "supportsParking") & 1) != 0 || (v29 = objc_msgSend(v6, "supportsCharging"), v30 = v65, v29))
  {
    v63 = 0;
    v30 = 1;
  }
  v58 = v30;
  objc_msgSend(v6, "bundleIdentifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "isEqualToString:", CFSTR("com.apple.Home")))
  {

LABEL_35:
    v62 = 0;
    v34 = 1;
    goto LABEL_37;
  }
  objc_msgSend(v6, "bundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("com.apple.shortcuts"));

  if (v33)
    goto LABEL_35;
  v34 = 0;
LABEL_37:
  objc_msgSend(v6, "bundleIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("com.apple.mobilephone"));

  objc_msgSend(v6, "bundleIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("com.apple.MobileSMS"));

  if ((v38 & 1) != 0)
  {
    v60 = 1;
    v64 = 0;
    v65 = 1;
    v57 = 1;
    v22 = 1;
    v21 = 1;
    v66 = 1;
  }
  else
  {
    v39 = (v36 ^ 1) & (v34 | v63);
    v64 = (v36 ^ 1) & v62;
    v57 = v39;
    if ((v21 | v22) != 1)
    {
      v22 = 0;
      goto LABEL_54;
    }
  }
  lockedOrHiddenApps = self->_lockedOrHiddenApps;
  objc_msgSend(v6, "bundleIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[NSSet containsObject:](lockedOrHiddenApps, "containsObject:", v41);

  if (v42)
  {
    CarGeneralLogging();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "bundleIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v44;
      _os_log_impl(&dword_1A83A2000, v43, OS_LOG_TYPE_DEFAULT, "Application locked by policy: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v22 = 0;
    v45 = 0;
LABEL_57:

    v52 = !v42;
    goto LABEL_58;
  }
  if (v21)
  {
    objc_msgSend(v6, "bundleIdentifier");
    v43 = objc_claimAutoreleasedReturnValue();
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v46 = (void **)getkAssistantDirectActionEventKeySymbolLoc_ptr;
    v70 = getkAssistantDirectActionEventKeySymbolLoc_ptr;
    if (!getkAssistantDirectActionEventKeySymbolLoc_ptr)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v78 = __getkAssistantDirectActionEventKeySymbolLoc_block_invoke;
      v79 = &unk_1E5428AD0;
      v80 = &v67;
      __getkAssistantDirectActionEventKeySymbolLoc_block_invoke((uint64_t)&buf);
      v46 = (void **)v68[3];
    }
    _Block_object_dispose(&v67, 8);
    if (!v46)
    {
      -[CRCarPlayAppPolicyEvaluator effectivePolicyForAppDeclaration:inVehicleWithCertificateSerial:].cold.1();
      __break(1u);
    }
    v47 = *v46;
    if (v47)
      v48 = v64;
    else
      v48 = 0;
    if (v48 == 1)
    {
      v74[0] = v43;
      v73[0] = CFSTR("__bundleId");
      v73[1] = CFSTR("__supportsCarFullScreen");
      v49 = (void *)MEMORY[0x1E0CB37E8];
      v50 = v47;
      objc_msgSend(v49, "numberWithBool:", v22);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v51;
      v73[2] = v50;
      v74[2] = &unk_1E543F688;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
    }
    else
    {
      v71[1] = CFSTR("__supportsCarFullScreen");
      v72[0] = v43;
      v71[0] = CFSTR("__bundleId");
      v53 = (void *)MEMORY[0x1E0CB37E8];
      v54 = v47;
      objc_msgSend(v53, "numberWithBool:", v22);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = v51;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_57;
  }
LABEL_54:
  v52 = 0;
  v45 = 0;
LABEL_58:
  -[CRCarPlayAppPolicy setCarPlayCapable:](v8, "setCarPlayCapable:", v66);
  -[CRCarPlayAppPolicy setCarPlaySupported:](v8, "setCarPlaySupported:", v52);
  -[CRCarPlayAppPolicy setCanDisplayOnCarScreen:](v8, "setCanDisplayOnCarScreen:", v22);
  -[CRCarPlayAppPolicy setLaunchUsingSiri:](v8, "setLaunchUsingSiri:", v64);
  -[CRCarPlayAppPolicy setLaunchNotificationsUsingSiri:](v8, "setLaunchNotificationsUsingSiri:", v57);
  -[CRCarPlayAppPolicy setSiriActivationOptions:](v8, "setSiriActivationOptions:", v45);
  if ((v22 & 1) != 0)
    v55 = 0;
  else
    v55 = objc_msgSend(v6, "supportsPlayableContent");
  -[CRCarPlayAppPolicy setLaunchUsingMusicUIService:](v8, "setLaunchUsingMusicUIService:", v55);
  -[CRCarPlayAppPolicy setBadgesAppIcon:](v8, "setBadgesAppIcon:", v65);
  -[CRCarPlayAppPolicy setShowsNotifications:](v8, "setShowsNotifications:", v58);
  -[CRCarPlayAppPolicy setHandlesCarIntents:](v8, "setHandlesCarIntents:", v59);
  -[CRCarPlayAppPolicy setLaunchUsingTemplateUI:](v8, "setLaunchUsingTemplateUI:", v60);
  -[CRCarPlayAppPolicy setApplicationCategory:](v8, "setApplicationCategory:", -[CRCarPlayAppPolicyEvaluator _applicationCategoryForAppDeclaration:policy:](self, "_applicationCategoryForAppDeclaration:policy:", v6, v8));

LABEL_62:
  return v8;
}

- (void)fetchApplicationBundleIdentifiersForCarIntents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB35D8];
  +[CRCarPlayAppPolicyEvaluator _carIntentIdentifiers](CRCarPlayAppPolicyEvaluator, "_carIntentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_intents_extensionMatchingAttributesForIntents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB35D8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__CRCarPlayAppPolicyEvaluator_fetchApplicationBundleIdentifiersForCarIntents___block_invoke;
  v10[3] = &unk_1E54292E0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "extensionsWithMatchingAttributes:completion:", v7, v10);

}

void __78__CRCarPlayAppPolicyEvaluator_fetchApplicationBundleIdentifiersForCarIntents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v27 = v6;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v28 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    v10 = a1;
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v32;
      v13 = 0x1E0CA5000uLL;
      v29 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "_plugIn");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "containingUrl");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(*(id *)(v13 + 2144), "applicationProxyForBundleURL:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              +[CRCarPlayAppDeclaration declarationForAppProxy:](CRCarPlayAppDeclaration, "declarationForAppProxy:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "autoMakerProtocols");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19
                && objc_msgSend(*(id *)(v10 + 32), "_vehicleProtocolsIntersectAppProtocols:certificateSerial:", v19, 0))
              {
                objc_msgSend(v18, "bundleIdentifier");
                v20 = v8;
                v21 = v13;
                v22 = v10;
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v23);

                v10 = v22;
                v13 = v21;
                v8 = v20;
                v12 = v29;
              }

            }
          }

        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v11);
    }

    CarGeneralLogging();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v30;
      _os_log_impl(&dword_1A83A2000, v24, OS_LOG_TYPE_INFO, "car intents applications: %@", buf, 0xCu);
    }

    v25 = *(_QWORD *)(v10 + 40);
    v7 = v27;
    if (v25)
      (*(void (**)(uint64_t, void *, _QWORD))(v25 + 16))(v25, v30, 0);

    v5 = v28;
  }
  else
  {
    v26 = *(_QWORD *)(a1 + 40);
    if (v26)
      (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v7);
  }

}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *lockedOrHiddenApps;
  id v10;

  v5 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(MEMORY[0x1E0CF9688], "lockedAppBundleIdentifiers", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithSet:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF9688], "hiddenAppBundleIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v7);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v10);
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  lockedOrHiddenApps = self->_lockedOrHiddenApps;
  self->_lockedOrHiddenApps = v8;

}

- (void)setGeoSupported:(BOOL)a3
{
  self->_geoSupported = a3;
}

- (CRCarPlayAppDenylist)denylist
{
  return self->_denylist;
}

- (void)setDenylist:(id)a3
{
  objc_storeStrong((id *)&self->_denylist, a3);
}

- (OS_dispatch_queue)geoQueue
{
  return self->_geoQueue;
}

- (void)setGeoQueue:(id)a3
{
  objc_storeStrong((id *)&self->_geoQueue, a3);
}

- (BOOL)geo_queue_geoSupported
{
  return self->_geo_queue_geoSupported;
}

- (void)setGeo_queue_geoSupported:(BOOL)a3
{
  self->_geo_queue_geoSupported = a3;
}

- (BOOL)evaluatorWantsGeoManagement
{
  return self->_evaluatorWantsGeoManagement;
}

- (void)setEvaluatorWantsGeoManagement:(BOOL)a3
{
  self->_evaluatorWantsGeoManagement = a3;
}

- (NSSet)lockedOrHiddenApps
{
  return self->_lockedOrHiddenApps;
}

- (void)setLockedOrHiddenApps:(id)a3
{
  objc_storeStrong((id *)&self->_lockedOrHiddenApps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedOrHiddenApps, 0);
  objc_storeStrong((id *)&self->_geoQueue, 0);
  objc_storeStrong((id *)&self->_denylist, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

- (void)_vehicleProtocolsForCertificateSerial:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A83A2000, log, OS_LOG_TYPE_ERROR, "No available certificate serial for vehicle.", v1, 2u);
}

- (void)_checkIfDeclaration:(uint64_t)a1 supportsIntents:(uint64_t)a2 requireAllIntents:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A83A2000, log, OS_LOG_TYPE_ERROR, "Failed to lookup app %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

- (uint64_t)effectivePolicyForAppDeclaration:inVehicleWithCertificateSerial:.cold.1()
{
  dlerror();
  abort_report_np();
  return __getLSApplicationRecordClass_block_invoke_cold_1();
}

@end
