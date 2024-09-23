@implementation AXHAController

+ (id)sharedController
{
  if (sharedController_onceToken_0 != -1)
    dispatch_once(&sharedController_onceToken_0, &__block_literal_global_7);
  return (id)sharedController_Controller_0;
}

void __34__AXHAController_sharedController__block_invoke()
{
  AXHAController *v0;
  void *v1;

  v0 = objc_alloc_init(AXHAController);
  v1 = (void *)sharedController_Controller_0;
  sharedController_Controller_0 = (uint64_t)v0;

}

+ (id)descriptionForHandoffReason:(int64_t)a3
{
  __CFString *v4;

  if (descriptionForHandoffReason__onceToken != -1)
    dispatch_once(&descriptionForHandoffReason__onceToken, &__block_literal_global_1);
  if (objc_msgSend((id)descriptionForHandoffReason__HandoffReasonDeacription, "count") <= (unint64_t)a3)
  {
    v4 = CFSTR("Unknown");
  }
  else
  {
    objc_msgSend((id)descriptionForHandoffReason__HandoffReasonDeacription, "objectAtIndexedSubscript:", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

void __46__AXHAController_descriptionForHandoffReason___block_invoke()
{
  void *v0;

  v0 = (void *)descriptionForHandoffReason__HandoffReasonDeacription;
  descriptionForHandoffReason__HandoffReasonDeacription = (uint64_t)&unk_1EA900598;

}

- (void)cleanUp
{
  -[HUAudioHalController clearAudioHalDevice](self->_audioHalController, "clearAudioHalDevice");
}

- (AXHAController)init
{
  AXHAController *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HUAudioHalController *v9;
  HUAudioHalController *audioHalController;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AXHAController;
  v2 = -[AXHAController init](&v18, sel_init);
  if (v2)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "pairedHearingAids");

    objc_initWeak(&location, v2);
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __22__AXHAController_init__block_invoke;
    v15 = &unk_1EA8E81D0;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v5, "registerUpdateBlock:forRetrieveSelector:withListener:", &v12, sel_pairedHearingAids, v2);

    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance", v12, v13, v14, v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", v2);

    if (-[AXHAController hearingAidsPaired](v2, "hearingAidsPaired"))
    {
      -[AXHAController setListenForAvailableDeviceUpdates:](v2, "setListenForAvailableDeviceUpdates:", 1);
      +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "start");

    }
    if (objc_msgSend(MEMORY[0x1E0D2F990], "deviceIsMultiUser"))
    {
      objc_msgSend(getUMUserManagerClass(), "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "registerUserSwitchStakeHolder:", v2);

    }
    v9 = objc_alloc_init(HUAudioHalController);
    audioHalController = v2->_audioHalController;
    v2->_audioHalController = v9;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __22__AXHAController_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *WeakRetained;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController init]_block_invoke", 107, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = v4;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v5, "UTF8String");
    _os_log_impl(&dword_1DE311000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pairedHearingAids");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "checkPartiallyPairedWithCompletion:", &__block_literal_global_22);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "setPairedHearingAidID:", 0);
  }

}

void __22__AXHAController_init__block_invoke_20(uint64_t a1, char a2)
{
  id v2;

  if ((a2 & 1) == 0)
  {
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "start");

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[AXHAController setPairedDeviceUUID:](self, "setPairedDeviceUUID:", 0);
  -[AXHAController setAvailableDevicesDescription:](self, "setAvailableDevicesDescription:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AXHAController;
  -[AXHAController dealloc](&v4, sel_dealloc);
}

- (void)willSwitchUser
{
  void *v3;
  char v4;

  objc_msgSend(getUMUserManagerClass(), "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLoginSession");

  if ((v4 & 1) == 0)
    -[AXHAController setPairedHearingAidID:](self, "setPairedHearingAidID:", 0);
}

- (id)currentDeviceController
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hearingAidForDeviceID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "leftAvailable") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "rightAvailable") ^ 1;
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isConnected"))
  {

LABEL_12:
    v34 = v5;
    HAInitializeLogging();
    v32 = (void *)MEMORY[0x1E0CB3940];
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v33, "isConnected");
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hearingAidForDeviceID:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isConnecting");
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "state");
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hearingAidForDeviceID:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("Current controller is device %d, %d, %d - %@"), v16, v20, v22, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController currentDeviceController]", 172, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_retainAutorelease(v27);
      v30 = v28;
      *(_DWORD *)buf = 136446210;
      v36 = objc_msgSend(v29, "UTF8String");
      _os_log_impl(&dword_1DE311000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v34;
    goto LABEL_15;
  }
  if ((objc_msgSend(v5, "isConnecting") ^ 1 | v6) == 1)
  {

  }
  else
  {
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "state");

    if (v9 != 2)
      goto LABEL_12;
  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Current controller is nearby"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController currentDeviceController]", 175, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v11);
    v14 = v12;
    *(_DWORD *)buf = 136446210;
    v36 = objc_msgSend(v13, "UTF8String");
    _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v15;
}

- (BOOL)hearingAidsPaired
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  v2 = (void *)MEMORY[0x1E0CB3940];
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pairedHearingAids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Checking paired %d"), v4 != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController hearingAidsPaired]", 184, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pairedHearingAids");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 != 0;

  return v12;
}

- (void)setListenForAvailableDeviceUpdates:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  _QWORD v7[5];

  if (self->_isListening != a3)
  {
    v3 = a3;
    self->_isListening = a3;
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __53__AXHAController_setListenForAvailableDeviceUpdates___block_invoke;
      v7[3] = &unk_1EA8E9598;
      v7[4] = self;
      objc_msgSend(v5, "searchForAvailableDevicesWithCompletion:", v7);

    }
    else
    {
      objc_msgSend(v5, "stopSearching");

    }
  }
}

void __53__AXHAController_setListenForAvailableDeviceUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, _BYTE *);
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pairedDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hearingAidForDeviceID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __53__AXHAController_setListenForAvailableDeviceUpdates___block_invoke_2;
  v25 = &unk_1EA8E9570;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v26 = v8;
  v27 = v9;
  v10 = v7;
  v28 = v10;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v22);

  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("No_HA_Devices"));

  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Available Devices: %@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController setListenForAvailableDeviceUpdates:]_block_invoke", 246, v12, v22, v23, v24, v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v13);
    v16 = v14;
    v17 = objc_msgSend(v15, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v30 = v17;
    _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setAvailableDevicesDescription:", v10);
  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D2F9A0];
  objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v10, 32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "messageWithPayload:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendUpdateMessage:forIdentifier:", v21, 32);

}

void __53__AXHAController_setListenForAvailableDeviceUpdates___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char v7;
  os_log_t *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  os_log_t v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if ((objc_msgSend(v6, "isPaired") & 1) != 0 || objc_msgSend(v6, "isPersistent"))
  {
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));
    v8 = (os_log_t *)MEMORY[0x1E0D2F928];
    if ((v7 & 1) == 0)
    {
      HAInitializeLogging();
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "deviceUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Changing pairing %@ - %@"), v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController setListenForAvailableDeviceUpdates:]_block_invoke_2", 205, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = objc_retainAutorelease(v13);
        v16 = v14;
        *(_DWORD *)buf = 136446210;
        v39 = objc_msgSend(v15, "UTF8String");
        _os_log_impl(&dword_1DE311000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      v17 = *(void **)(a1 + 40);
      objc_msgSend(v6, "deviceUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setPairedHearingAidID:", v18);

      +[AXHeardController sharedServer](AXHeardController, "sharedServer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D2F9A0];
      v21 = (void *)MEMORY[0x1E0D2F990];
      objc_msgSend(v6, "deviceDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "messagePayloadFromDictionary:andIdentifier:", v22, 64);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "messageWithPayload:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendUpdateMessage:forIdentifier:", v24, 64);

    }
    if ((objc_msgSend(v6, "didLoadPersistentProperties") & 1) != 0)
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isiCloudPaired");

      if ((v26 & 1) == 0)
      {
        v27 = *(void **)(a1 + 48);
        objc_msgSend(v6, "deviceDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setDictionary:", v28);

        *a4 = 1;
      }
    }
    else
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing info %@"), v6);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController setListenForAvailableDeviceUpdates:]_block_invoke", 213, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_retainAutorelease(v30);
        v33 = v31;
        v34 = objc_msgSend(v32, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v39 = v34;
        _os_log_impl(&dword_1DE311000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 40), "setPairedHearingAidID:", 0);
    }
  }
  objc_msgSend(v6, "leftPeripheralUUID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(v6, "rightPeripheralUUID");

  }
  objc_msgSend(v6, "availableInputEars");
  objc_msgSend(v6, "earsSupportingWatch");
  objc_msgSend(*(id *)(a1 + 40), "hearingAidsIsLEA2:", v6);
  v36 = *(void **)(a1 + 48);
  objc_msgSend(v6, "deviceDescription");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addEntriesFromDictionary:", v37);

}

- (BOOL)hearingAidsIsLEA2:(id)a3
{
  id v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  os_log_t *v15;
  void *v16;
  id v17;
  NSObject *v18;
  char v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  os_log_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "availableInputEars");
  objc_msgSend(v3, "leftPeripheralUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "rightPeripheralUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hearingAidsLEAVersionFromiCloud");

  HAInitializeLogging();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR(" %@ LEA version from iCloud: %d, real hearing aids: %d, iCloud paired: %d, available input ears: %d"), v11, v9 == 2, v6, objc_msgSend(v12, "isiCloudPaired"), objc_msgSend(v3, "availableInputEars"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController hearingAidsIsLEA2:]", 267, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (os_log_t *)MEMORY[0x1E0D2F928];
  v16 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_retainAutorelease(v14);
    v18 = v16;
    v15 = (os_log_t *)MEMORY[0x1E0D2F928];
    *(_DWORD *)buf = 136446210;
    v31 = objc_msgSend(v17, "UTF8String");
    _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v19 = !v6;
  if (!v4)
    v19 = 1;
  if (v9 == 2)
    v20 = 0;
  else
    v20 = v19;
  if ((v20 & 1) == 0)
  {
    HAInitializeLogging();
    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "name");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR(" %@ is LEA 2.0"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController hearingAidsIsLEA2:]", 271, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *v15;
    if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_retainAutorelease(v24);
      v27 = v25;
      v28 = objc_msgSend(v26, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v31 = v28;
      _os_log_impl(&dword_1DE311000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

  return v20 ^ 1;
}

- (void)setPairedHearingAidID:(id)a3
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
  os_log_t *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  os_log_t v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  os_log_t v41;
  id v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  const __CFString *v54;
  void *v55;
  uint8_t buf[4];
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hearingAidForDeviceID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hearingAidForDeviceID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HAInitializeLogging();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "deviceUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%d, %d, %d - %@ - %@ == %d, %@"), objc_msgSend(v9, "containsPeripheralWithUUID:", v11), objc_msgSend(v9, "hasConnection") ^ 1, objc_msgSend(v6, "hasConnection"), v4, v9, objc_msgSend(v6, "didLoadPersistentProperties"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController setPairedHearingAidID:]", 284, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (os_log_t *)MEMORY[0x1E0D2F928];
  v15 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_retainAutorelease(v13);
    v17 = v15;
    *(_DWORD *)buf = 136446210;
    v57 = objc_msgSend(v16, "UTF8String");
    _os_log_impl(&dword_1DE311000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v6, "deviceUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "containsPeripheralWithUUID:", v18);

  if (v19 && ((objc_msgSend(v9, "hasConnection") & 1) != 0 || !objc_msgSend(v6, "hasConnection"))
    || (objc_msgSend(v6, "didLoadPersistentProperties") & 1) == 0 && v6)
  {
    if (!v4)
LABEL_22:
      -[AXHAController cleanUp](self, "cleanUp");
  }
  else
  {
    objc_msgSend(v9, "setKeepInSync:", 0);
    if ((v19 & 1) == 0)
      objc_msgSend(v9, "disconnectAndUnpair:", 1);
    objc_msgSend(v9, "setIsPaired:", 0);
    objc_msgSend(v6, "deviceUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHAController setPairedDeviceUUID:](self, "setPairedDeviceUUID:", v20);

    -[AXHAController currentDeviceController](self, "currentDeviceController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stopPropertyUpdates");

    if (!v4)
    {
      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "forgetDevice:", v9);

      if ((liveListenStreamSelected() & 1) == 0)
      {
        -[AXHAController liveListenController](self, "liveListenController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stopListeningWithCompletion:", 0);

      }
      -[AXHAController setListenForAvailableDeviceUpdates:](self, "setListenForAvailableDeviceUpdates:", 0);
      +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stop");

      -[AXHAController availableRemoteControllersDidChange](self, "availableRemoteControllersDidChange");
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Hearing aids unpaired. Updated available controllers"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController setPairedHearingAidID:]", 352, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_retainAutorelease(v28);
        v31 = v29;
        v32 = objc_msgSend(v30, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v57 = v32;
        _os_log_impl(&dword_1DE311000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      +[AXHeardController sharedServer](AXHeardController, "sharedServer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0D2F9A0];
      v35 = (void *)MEMORY[0x1E0D2F990];
      v54 = CFSTR("No_HA_Devices");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v36;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "messagePayloadFromDictionary:andIdentifier:", v37, 32);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "messageWithPayload:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "sendUpdateMessage:forIdentifier:", v39, 32);

      goto LABEL_22;
    }
    v22 = (void *)os_transaction_create();
    -[AXHAController setTransaction:](self, "setTransaction:", v22);

    objc_msgSend(v6, "setIsPaired:", 1);
    if ((objc_msgSend(v6, "isConnected") & 1) == 0)
      objc_msgSend(v6, "connect");
    objc_msgSend(v6, "setKeepInSync:", 1);
    if (-[AXHAController hearingAidsPaired](self, "hearingAidsPaired"))
    {
      +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "start");
    }
    else
    {
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping nearby because no hearing aids paired."));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController setPairedHearingAidID:]", 318, v23);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        v42 = objc_retainAutorelease(v40);
        v43 = v41;
        v44 = objc_msgSend(v42, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v57 = v44;
        _os_log_impl(&dword_1DE311000, v43, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }

    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __40__AXHAController_setPairedHearingAidID___block_invoke;
    v53[3] = &unk_1EA8E82F0;
    v53[4] = self;
    objc_msgSend(v45, "checkPartiallyPairedWithCompletion:", v53);

    v52[0] = v46;
    v52[1] = 3221225472;
    v52[2] = __40__AXHAController_setPairedHearingAidID___block_invoke_2;
    v52[3] = &unk_1EA8E95C0;
    v52[4] = self;
    v47 = (void *)MEMORY[0x1DF0EB808](v52);
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "registerForPropertyUpdates:", v47);

    v51[0] = v46;
    v51[1] = 3221225472;
    v51[2] = __40__AXHAController_setPairedHearingAidID___block_invoke_3;
    v51[3] = &unk_1EA8E95C0;
    v51[4] = self;
    v49 = (void *)MEMORY[0x1DF0EB808](v51);
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "registerForPropertyUpdates:", v49);

    -[AXHAController setTransaction:](self, "setTransaction:", 0);
  }

}

uint64_t __40__AXHAController_setPairedHearingAidID___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "setListenForAvailableDeviceUpdates:", 0);
  return result;
}

uint64_t __40__AXHAController_setPairedHearingAidID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processPropertyUpdates:isLocal:", a2, 1);
}

uint64_t __40__AXHAController_setPairedHearingAidID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processPropertyUpdates:isLocal:", a2, 0);
}

- (void)processPropertyUpdates:(id)a3 isLocal:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "copy");
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE isLocal %d %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController processPropertyUpdates:isLocal:]", 366, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (os_log_t *)MEMORY[0x1E0D2F928];
  v10 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v8);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v35 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", &unk_1EA8FFB78);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hearingAidForDeviceID:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v18, "hasConnection") & 1) == 0 && (liveListenStreamSelected() & 1) == 0)
    {
      -[AXHAController liveListenController](self, "liveListenController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stopListeningWithCompletion:", 0);

    }
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection status changed. Updated available controllers"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController processPropertyUpdates:isLocal:]", 378, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_retainAutorelease(v21);
      v24 = v22;
      v25 = objc_msgSend(v23, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v35 = v25;
      _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    -[AXHAController availableRemoteControllersDidChange](self, "availableRemoteControllersDidChange");

  }
  if (-[AXHAController hearingAidsPaired](self, "hearingAidsPaired"))
  {
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "start");

  }
  v27 = (void *)MEMORY[0x1E0D2F9A0];
  objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v6, 64);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "messageWithPayload:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sendUpdateMessage:forIdentifier:", v29, 64);

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isConnected");

  if (v32 && v4)
  {
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sendWriteToAllDevices:", v6);

  }
}

- (void)readLiveListenLevels
{
  AXDispatchTimer *liveListenLevelsTimer;
  id v4;
  AXDispatchTimer *v5;
  AXDispatchTimer *v6;
  AXDispatchTimer *v7;
  _QWORD v8[5];
  id v9;
  id location;

  liveListenLevelsTimer = self->_liveListenLevelsTimer;
  if (!liveListenLevelsTimer)
  {
    v4 = objc_alloc(MEMORY[0x1E0CF3978]);
    v5 = (AXDispatchTimer *)objc_msgSend(v4, "initWithTargetSerialQueue:", MEMORY[0x1E0C80D38]);
    v6 = self->_liveListenLevelsTimer;
    self->_liveListenLevelsTimer = v5;

    liveListenLevelsTimer = self->_liveListenLevelsTimer;
  }
  -[AXDispatchTimer cancel](liveListenLevelsTimer, "cancel");
  objc_initWeak(&location, self);
  v7 = self->_liveListenLevelsTimer;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__AXHAController_readLiveListenLevels__block_invoke;
  v8[3] = &unk_1EA8E95E8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](v7, "afterDelay:processBlock:", v8, 0.05);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__AXHAController_readLiveListenLevels__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  float v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "liveListenController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioLevel");
  v6 = v5;

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "liveListenController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isListening");

  v10 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 512);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1024);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithObjectsAndKeys:", v11, v12, v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v15, 512);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D2F9A0], "messageWithPayload:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sendUpdateMessage:forIdentifier:", v17, 512);

  if ((_DWORD)v9)
  {
    v18 = objc_loadWeakRetained(v2);
    objc_msgSend(v18, "readLiveListenLevels");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLiveListenMessage:", 0);
  }

}

- (void)liveListenControllerStateDidChange
{
  void *v3;
  int v4;

  -[AXHAController liveListenController](self, "liveListenController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isListening");

  if (v4)
    -[AXHAController readLiveListenLevels](self, "readLiveListenLevels");
}

- (id)liveListenController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AXHAController_liveListenController__block_invoke;
  block[3] = &unk_1EA8E8220;
  block[4] = self;
  if (liveListenController_onceToken != -1)
    dispatch_once(&liveListenController_onceToken, block);
  return (id)liveListenController_LiveListenController;
}

uint64_t __38__AXHAController_liveListenController__block_invoke(uint64_t a1)
{
  HULiveListenController *v2;
  void *v3;

  v2 = objc_alloc_init(HULiveListenController);
  v3 = (void *)liveListenController_LiveListenController;
  liveListenController_LiveListenController = (uint64_t)v2;

  return objc_msgSend((id)liveListenController_LiveListenController, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)connectToPairedDevice
{
  id v2;

  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestConnection");

}

- (void)transitionToPeer
{
  id v2;

  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relinquishConnection");

}

- (void)availableRemoteControllersDidChange
{
  -[AXHAController updateNearbyDeviceAvailabilityWithForce:](self, "updateNearbyDeviceAvailabilityWithForce:", 0);
}

- (id)registerForAvailableDevicesUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  char v21;
  char v22;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_should_register_client_key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("ax_hearing_should_begin_searching_key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke;
  v19[3] = &unk_1EA8E9658;
  v21 = v7;
  v19[4] = self;
  v12 = v4;
  v20 = v12;
  v22 = v10;
  objc_msgSend(v11, "checkPartiallyPairedWithCompletion:", v19);

  -[AXHAController availableDevicesDescription](self, "availableDevicesDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0D2F990];
    -[AXHAController availableDevicesDescription](self, "availableDevicesDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messagePayloadFromDictionary:andIdentifier:", v15, 32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replyMessageWithPayload:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke(uint64_t a1, int a2)
{
  double v3;
  void *v5;
  _BOOL4 v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "pairedDeviceUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

    if ((v6 & a2) != 0)
      v3 = 180.0;
    else
      v3 = 0.0;
  }
  v7 = objc_msgSend(*(id *)(a1 + 40), "hasEntitlement:", CFSTR("com.apple.CoreRoutine.preferences"));
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Registing for device availability %d, %d, %lf"), *(unsigned __int8 *)(a1 + 48), v7, *(_QWORD *)&v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController registerForAvailableDevicesUpdates:]_block_invoke", 495, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v9);
    v12 = v10;
    *(_DWORD *)buf = 136446210;
    v15 = objc_msgSend(v11, "UTF8String");
    _os_log_impl(&dword_1DE311000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  AXPerformBlockOnMainThreadAfterDelay();
  objc_msgSend(*(id *)(a1 + 40), "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWantsUpdates:forIdentifier:", *(unsigned __int8 *)(a1 + 48), 32);

}

uint64_t __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke_83(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  _QWORD v6[4];
  char v7;
  char v8;

  if (*(_BYTE *)(a1 + 40))
  {
    if (*(_BYTE *)(a1 + 41))
    {
      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "shouldActiveScan");

      if ((v3 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "setListenForAvailableDeviceUpdates:", 0);
    }
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke_2;
    v6[3] = &__block_descriptor_34_e8_v12__0B8l;
    v7 = *(_BYTE *)(a1 + 42);
    v8 = *(_BYTE *)(a1 + 41);
    objc_msgSend(v4, "checkPartiallyPairedWithCompletion:", v6);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setListenForAvailableDeviceUpdates:", *(unsigned __int8 *)(a1 + 41));
}

void __53__AXHAController_registerForAvailableDevicesUpdates___block_invoke_2(uint64_t a1, char a2)
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE *)(a1 + 32) != 0;
  if (*(_BYTE *)(a1 + 32) && (a2 & 1) == 0)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairedHearingAids");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "isiCloudPaired");

    }
    else
    {
      v3 = 1;
    }

  }
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting active scan %d, %d"), *(unsigned __int8 *)(a1 + 33), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController registerForAvailableDevicesUpdates:]_block_invoke_2", 507, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v8);
    v11 = v9;
    *(_DWORD *)buf = 136446210;
    v16 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (*(_BYTE *)(a1 + 33))
    v14 = v3;
  else
    v14 = 0;
  objc_msgSend(v12, "setShouldActiveScan:", v14);

}

- (id)registerForDeviceUpdates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_should_register_client_key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsUpdates:forIdentifier:", v7, 64);

  -[AXHAController availableRemoteControllersDidChange](self, "availableRemoteControllersDidChange");
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("New device updates client. Updated available controllers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController registerForDeviceUpdates:]", 532, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v10);
    v13 = v11;
    *(_DWORD *)buf = 136446210;
    v20 = objc_msgSend(v12, "UTF8String");
    _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  v14 = (void *)MEMORY[0x1E0D2F990];
  -[AXHAController availableDevicesDescription](self, "availableDevicesDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messagePayloadFromDictionary:andIdentifier:", v15, 32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replyMessageWithPayload:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)readDeviceProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "payload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", &unk_1EA8FFB90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v8);

    if (v10)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __37__AXHAController_readDeviceProperty___block_invoke;
      v12[3] = &unk_1EA8E8E78;
      v12[4] = self;
      v13 = v8;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);

    }
  }

  return 0;
}

void __37__AXHAController_readDeviceProperty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "currentDeviceController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v6, "updateProperty:forDeviceID:", v5, *(_QWORD *)(a1 + 40));
}

- (void)sendUpdatesForProperties:(id)a3 excludingClient:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E08];
  v8 = a3;
  objc_msgSend(v7, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__AXHAController_sendUpdatesForProperties_excludingClient___block_invoke;
  v17[3] = &unk_1EA8E8EF0;
  v11 = v10;
  v18 = v11;
  v12 = v9;
  v19 = v12;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);

  if (objc_msgSend(v12, "count") && objc_msgSend(v11, "length"))
  {
    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D2F990];
    v20 = v11;
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messagePayloadFromDictionary:andIdentifier:", v15, 64);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendClientsMessageWithPayload:excluding:", v16, v6);

  }
}

void __59__AXHAController_sendUpdatesForProperties_excludingClient___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForProperty:forDeviceID:", objc_msgSend(v5, "longLongValue"), *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v4, v5);

}

- (id)writeDeviceProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
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
  id v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  AXHAController *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hearingAidForDeviceID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", &unk_1EA8FFB90);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "deviceUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", v9))
    {
      v11 = objc_msgSend(v7, "isPaired");

      if (v11)
      {
        objc_msgSend(v4, "payload");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __38__AXHAController_writeDeviceProperty___block_invoke;
        v31[3] = &unk_1EA8E8708;
        v32 = v9;
        objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v31);

        objc_msgSend(v4, "payload");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "allKeys");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "client");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXHAController sendUpdatesForProperties:excludingClient:](self, "sendUpdatesForProperties:excludingClient:", v14, v15);

        goto LABEL_14;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "payload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", &unk_1EA8FFB78);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "hearingAidsForUUID:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count"))
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __38__AXHAController_writeDeviceProperty___block_invoke_2;
        v27[3] = &unk_1EA8E9570;
        v28 = v4;
        v29 = self;
        v30 = v9;
        objc_msgSend(v19, "enumerateObjectsUsingBlock:", v27);
        if ((unint64_t)objc_msgSend(v19, "count") >= 2)
        {
          HAInitializeLogging();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found more than one matching hearing aid %@"), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController writeDeviceProperty:]", 611, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)*MEMORY[0x1E0D2F928];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
          {
            v23 = objc_retainAutorelease(v21);
            v24 = v22;
            v25 = objc_msgSend(v23, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v34 = v25;
            _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

          }
        }

      }
    }
  }
LABEL_14:

  return 0;
}

void __38__AXHAController_writeDeviceProperty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isConnected");

  if (v7)
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeValue:forProperty:andDeviceID:", v5, objc_msgSend(v10, "unsignedLongLongValue"), *(_QWORD *)(a1 + 32));

  }
  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeValue:forProperty:andDeviceID:", v5, objc_msgSend(v10, "unsignedLongLongValue"), *(_QWORD *)(a1 + 32));

}

void __38__AXHAController_writeDeviceProperty___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "leftAvailable") & 1) != 0 || objc_msgSend(v8, "rightAvailable"))
  {
    objc_msgSend(*(id *)(a1 + 32), "payload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", &unk_1EA8FFB78);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setValue:forProperty:", v7, 0x200000);
    if (objc_msgSend(v7, "intValue") == 2)
      objc_msgSend(*(id *)(a1 + 40), "setPairedHearingAidID:", *(_QWORD *)(a1 + 48));
    *a4 = 1;

  }
}

- (id)registerForControlMessageUpdates:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("ax_hearing_should_register_client_key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v3, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setWantsUpdates:forIdentifier:", v6, 0x8000000000000000);
  return 0;
}

- (void)updateNearbyDeviceAvailabilityWithForce:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  char v13;
  BOOL v14;

  -[AXHAController pairedDeviceUUID](self, "pairedDeviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isConnected") & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isPartiallyConnected");

    }
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__AXHAController_updateNearbyDeviceAvailabilityWithForce___block_invoke;
    v12[3] = &unk_1EA8E9680;
    v13 = v8;
    v12[4] = self;
    v14 = a3;
    objc_msgSend(v11, "connectedPeerWithCompletion:", v12);

  }
  else
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAvailableHearingDeviceName:", 0);

    if (!a3)
      -[AXHAController sendAvailabilityDidChangeNotification](self, "sendAvailabilityDidChangeNotification");
  }
}

void __58__AXHAController_updateNearbyDeviceAvailabilityWithForce___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  int v15;
  __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[4];
  _QWORD v39[4];
  void *v40;
  void *v41;
  uint8_t buf[4];
  __CFString *v43;
  __int16 v44;
  __CFString *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 40) != 0;
  if (v3 && !*(_BYTE *)(a1 + 40))
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "multideviceSettingsEnabled");

    v4 = *(unsigned __int8 *)(a1 + 40);
  }
  v7 = v4 != 0;
  if (v3 && !v4)
  {
    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "multideviceAudioEnabled");

  }
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pairedDeviceUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hearingAidForDeviceID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if ((v3 || *(_BYTE *)(a1 + 40))
    && (+[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isiCloudPaired"),
        v14,
        !v15))
  {
    v16 = v13;
  }
  else
  {

    v16 = 0;
  }
  +[AXHearingAidDeviceController sharedController](AXHearingAidDeviceController, "sharedController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isBluetoothAvailable");

  +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
    v21 = v16;
  else
    v21 = 0;
  objc_msgSend(v19, "setAvailableHearingDeviceName:", v21);

  if (v13)
    v22 = v13;
  else
    v22 = &stru_1EA8EC4E0;
  objc_msgSend(v3, "name");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (!v23 || !v3 || *(_BYTE *)(a1 + 40))
  {

    v24 = &stru_1EA8EC4E0;
  }
  HCLogHearingHandoff();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v43 = v24;
    v44 = 2112;
    v45 = v16;
    v46 = 2112;
    v47 = v26;
    v48 = 2112;
    v49 = v27;
    _os_log_impl(&dword_1DE311000, v25, OS_LOG_TYPE_DEFAULT, "connectedPeer: %@, Reachable HA: %@, isConnected: %@, audioReachable: %@", buf, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x4000);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v28;
  v38[0] = &unk_1EA8FFBA8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v29;
  v38[1] = &unk_1EA8FFBC0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v30;
  v39[2] = v24;
  v31 = *MEMORY[0x1E0D2F970];
  v38[2] = &unk_1EA8FFBD8;
  v38[3] = v31;
  v39[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 41)
    || (objc_msgSend(*(id *)(a1 + 32), "availableControllersPayload"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v35 = objc_msgSend(v33, "isEqualToDictionary:", v34),
        v34,
        (v35 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAvailableControllersPayload:", v33);
    objc_msgSend(MEMORY[0x1E0D2F990], "messagePayloadFromDictionary:andIdentifier:", v33, 2048);
    v36 = objc_claimAutoreleasedReturnValue();

    +[AXHeardController sharedServer](AXHeardController, "sharedServer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "sendClientsMessageWithPayload:excluding:", v36, 0);

    v33 = (void *)v36;
  }
  if (!*(_BYTE *)(a1 + 41))
    objc_msgSend(*(id *)(a1 + 32), "sendAvailabilityDidChangeNotification");

}

- (void)sendAvailabilityDidChangeNotification
{
  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_101);
}

void __55__AXHAController_sendAvailabilityDidChangeNotification__block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.hearing.audio.transfer.availability"), 0, 0, 1u);
}

- (id)readAvailableDevices:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0D2F990];
  v5 = a3;
  -[AXHAController availableDevicesDescription](self, "availableDevicesDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagePayloadFromDictionary:andIdentifier:", v6, 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replyMessageWithPayload:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)readAvailableControllers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client requesting update to available controllers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAController readAvailableControllers:]", 715, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE311000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXHAController updateNearbyDeviceAvailabilityWithForce:](self, "updateNearbyDeviceAvailabilityWithForce:", 1);
  return 0;
}

- (id)connectToControllerWithID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("controller"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKey:", CFSTR("reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "integerValue");
  else
    v8 = 1;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v9)
  {
    +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8 == 1)
      objc_msgSend(v10, "requestConnectionForMedia");
    else
      objc_msgSend(v10, "requestConnectionForReason:", v8);

  }
  return 0;
}

- (id)disconnectAndForceClient:(id)a3
{
  -[AXHAController transitionToPeer](self, "transitionToPeer", a3);
  return 0;
}

- (id)_toggleLiveListen_BOOLValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 128);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[AXHAController liveListenController](self, "liveListenController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "isListening");

  if (v8 != (_DWORD)v6)
  {
    -[AXHAController liveListenController](self, "liveListenController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      objc_msgSend(v10, "startListeningWithCompletion:", 0);
      v12 = v4;
    }
    else
    {
      objc_msgSend(v10, "stopListeningWithCompletion:", 0);
      v12 = 0;
    }

    -[AXHAController setLiveListenMessage:](self, "setLiveListenMessage:", v12);
  }
  -[AXHAController readLiveListenLevels](self, "readLiveListenLevels");
  v13 = (void *)MEMORY[0x1E0D2F990];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 128);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v14;
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[AXHAController liveListenController](self, "liveListenController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithBool:", objc_msgSend(v16, "isListening"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messagePayloadFromDictionary:andIdentifier:", v18, 128);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replyMessageWithPayload:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_registerForLiveListenUpdates_BOOLValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
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

  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax_hearing_should_register_client_key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsUpdates:forIdentifier:", v7, 512);

  +[AXHeardController sharedServer](AXHeardController, "sharedServer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countOfClientsListeningForIdentifier:", 512);

  if (v10)
  {
    if (v10 == 1)
      -[AXHAController readLiveListenLevels](self, "readLiveListenLevels");
  }
  else
  {
    -[AXDispatchTimer cancel](self->_liveListenLevelsTimer, "cancel");
  }
  v11 = (void *)MEMORY[0x1E0D2F990];
  v12 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 512);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[AXHAController liveListenController](self, "liveListenController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isListening"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1024);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", &unk_1EA9006E8, v13, v16, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messagePayloadFromDictionary:andIdentifier:", v18, 512);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replyMessageWithPayload:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)sendMessagesPriority:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x20000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = *MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "XPC received MessagesPriority isHigh: %d", (uint8_t *)v11, 8u);
  }
  +[HUNearbyHearingAidController sharedInstance](HUNearbyHearingAidController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "sendMessagesPriorityHigh");
  else
    objc_msgSend(v8, "sendMessagesPriorityDefault");

  return 0;
}

- (NSString)pairedDeviceUUID
{
  return self->_pairedDeviceUUID;
}

- (void)setPairedDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDeviceUUID, a3);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (HUAudioHalController)audioHalController
{
  return self->_audioHalController;
}

- (void)setAudioHalController:(id)a3
{
  objc_storeStrong((id *)&self->_audioHalController, a3);
}

- (NSDictionary)availableDevicesDescription
{
  return self->_availableDevicesDescription;
}

- (void)setAvailableDevicesDescription:(id)a3
{
  objc_storeStrong((id *)&self->_availableDevicesDescription, a3);
}

- (NSDictionary)availableControllersPayload
{
  return self->_availableControllersPayload;
}

- (void)setAvailableControllersPayload:(id)a3
{
  objc_storeStrong((id *)&self->_availableControllersPayload, a3);
}

- (HCXPCMessage)liveListenMessage
{
  return self->_liveListenMessage;
}

- (void)setLiveListenMessage:(id)a3
{
  objc_storeStrong((id *)&self->_liveListenMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liveListenMessage, 0);
  objc_storeStrong((id *)&self->_availableControllersPayload, 0);
  objc_storeStrong((id *)&self->_availableDevicesDescription, 0);
  objc_storeStrong((id *)&self->_audioHalController, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_pairedDeviceUUID, 0);
  objc_storeStrong((id *)&self->_liveListenLevelsTimer, 0);
}

@end
