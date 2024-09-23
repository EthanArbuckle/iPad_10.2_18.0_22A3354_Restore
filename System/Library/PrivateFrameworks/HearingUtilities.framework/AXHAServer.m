@implementation AXHAServer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_4);
  return (id)sharedInstance_Server;
}

void __28__AXHAServer_sharedInstance__block_invoke()
{
  AXHAServer *v0;
  void *v1;

  v0 = objc_alloc_init(AXHAServer);
  v1 = (void *)sharedInstance_Server;
  sharedInstance_Server = (uint64_t)v0;

}

- (AXHAServer)init
{
  AXHAServer *v2;
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *responseBlocks;
  uint64_t v6;
  NSMutableDictionary *connectionStateBlocks;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)AXHAServer;
  v2 = -[HCServer init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXHAServer setUpdates:](v2, "setUpdates:", v3);

    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    responseBlocks = v2->_responseBlocks;
    v2->_responseBlocks = v4;

    v6 = objc_opt_new();
    connectionStateBlocks = v2->_connectionStateBlocks;
    v2->_connectionStateBlocks = (NSMutableDictionary *)v6;

    +[HUHearingAidSettings sharedInstance](HUHearingAidSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pairedHearingAids");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 2048);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v10;
      v16[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HCServer sendMessageWithPayload:andIdentifier:](v2, "sendMessageWithPayload:andIdentifier:", v11, 2048);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)shouldHandleServerStarting, CFSTR("com.apple.accessibility.hearing.server.ready"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)shouldRestartOnInterruption:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AXHAServer_shouldRestartOnInterruption___block_invoke;
  v5[3] = &unk_1EA8E8860;
  v6 = v3;
  v4 = v3;
  hearingDeamonShouldBeRunning(v5);

}

uint64_t __42__AXHAServer_shouldRestartOnInterruption___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startServerWithDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXHAServer;
  -[HCServer startServerWithDelegate:](&v4, sel_startServerWithDelegate_, a3);
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900288, 4);
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA9002B0, 0x10000);
}

- (void)resetConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXHAServer;
  -[HCServer resetConnection](&v8, sel_resetConnection);
  -[AXHAServer updates](self, "updates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__AXHAServer_resetConnection__block_invoke;
  v7[3] = &unk_1EA8E8888;
  v7[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  -[AXHAServer availableHearingAids](self, "availableHearingAids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXHAServer updateProperty:forDeviceID:](self, "updateProperty:forDeviceID:", 0xD07D42105FCLL, v6);

}

void __29__AXHAServer_resetConnection__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "sendMessageWithPayload:andIdentifier:", &unk_1EA9002D8, objc_msgSend(v5, "unsignedLongLongValue"));

}

- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  id v13;
  NSObject *v14;
  char v15;
  AXHAServer *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  os_log_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  os_log_t v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  _QWORD v46[5];
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 0x40000)
  {
    -[AXHAServer environmentalDosimetryDidUpdate:](self, "environmentalDosimetryDidUpdate:", v6);
    goto LABEL_44;
  }
  HAInitializeLogging();
  v7 = (void *)MEMORY[0x1E0CB3940];
  messageIdentifierDescription();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Handle incoming message ID: %@ %@"), v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer handleMessageWithPayload:forIdentifier:]", 128, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (os_log_t *)MEMORY[0x1E0D2F928];
  v12 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v10);
    v14 = v12;
    *(_DWORD *)buf = 136446210;
    v48 = objc_msgSend(v13, "UTF8String");
    _os_log_impl(&dword_1DE311000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if ((uint64_t)a4 > 255)
  {
    if ((uint64_t)a4 >= 0x100000)
    {
      if ((uint64_t)a4 >= 0x400000)
      {
        if (a4 != 0x400000)
        {
          if (a4 == 0x1000000)
            -[AXHAServer comfortSoundsAssetsDidUpdate:](self, "comfortSoundsAssetsDidUpdate:", v6);
          goto LABEL_44;
        }
        v16 = self;
        v17 = v6;
        v18 = 0x400000;
      }
      else if (a4 == 0x100000)
      {
        v16 = self;
        v17 = v6;
        v18 = 0x100000;
      }
      else
      {
        if (a4 != 0x200000)
          goto LABEL_44;
        v16 = self;
        v17 = v6;
        v18 = 0x200000;
      }
      -[AXHAServer _headphoneLevelDidUpdate:messageIdentifier:](v16, "_headphoneLevelDidUpdate:messageIdentifier:", v17, v18);
      goto LABEL_44;
    }
    if (a4 != 256)
    {
      if (a4 == 512)
      {
LABEL_39:
        -[AXHAServer liveListenDidUpdate:](self, "liveListenDidUpdate:", v6);
        goto LABEL_44;
      }
      if (a4 != 2048)
        goto LABEL_44;
      HAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Availability %@"), v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer handleMessageWithPayload:forIdentifier:]", 167, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_retainAutorelease(v20);
        v23 = v21;
        v24 = objc_msgSend(v22, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v48 = v24;
        _os_log_impl(&dword_1DE311000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 2048);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHAServer setAvailableControllers:](self, "setAvailableControllers:", v26);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x4000);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "objectForKey:", &unk_1EA8FF9E0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "BOOLValue");

      objc_msgSend(v28, "objectForKey:", &unk_1EA8FF9F8);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "BOOLValue");

      objc_msgSend(v28, "objectForKey:", *MEMORY[0x1E0D2F970]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v33, "length"))
      {

        v33 = 0;
      }
      -[AXHAServer setHearingDeviceName:](self, "setHearingDeviceName:", v33);
      -[AXHAServer setHearingAidReachableForAudioTransfer:](self, "setHearingAidReachableForAudioTransfer:", v32);
      if ((_DWORD)v30 != -[AXHAServer hearingAidConnectedOrReachable](self, "hearingAidConnectedOrReachable"))
      {
        -[AXHAServer availableHearingAids](self, "availableHearingAids");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "deviceUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXHAServer updateProperty:forDeviceID:](self, "updateProperty:forDeviceID:", 0x200000, v36);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "postNotificationName:object:", CFSTR("com.apple.accessibility.hearingaid.nearby.devices.changed"), 0);

      }
      objc_msgSend(v28, "objectForKey:", &unk_1EA8FFA10);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v38, "length"))
      {

        v38 = 0;
      }
      -[AXHAServer setConnectedDeviceName:](self, "setConnectedDeviceName:", v38);
      -[AXHAServer setHearingAidConnectedOrReachable:](self, "setHearingAidConnectedOrReachable:", v30);

LABEL_31:
      goto LABEL_44;
    }
LABEL_28:
    HAInitializeLogging();
    v39 = (void *)MEMORY[0x1E0CB3940];
    messageIdentifierDescription();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Unexpected message ID: %@"), v40);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer handleMessageWithPayload:forIdentifier:]", 138, v28);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v43 = objc_retainAutorelease(v41);
      v44 = v42;
      v45 = objc_msgSend(v43, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v48 = v45;
      _os_log_impl(&dword_1DE311000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    goto LABEL_31;
  }
  v15 = a4 - 2;
  if (a4 - 2 > 0x3E)
    goto LABEL_37;
  if (((1 << v15) & 0x45) != 0)
    goto LABEL_28;
  if (((1 << v15) & 0x4000000000004000) != 0)
  {
    -[AXHAServer deviceDidUpdateProperty:](self, "deviceDidUpdateProperty:", v6);
    goto LABEL_44;
  }
  if (a4 == 32)
  {
    -[AXHAServer availableDevicesDidUpdate:](self, "availableDevicesDidUpdate:", v6);
    goto LABEL_44;
  }
LABEL_37:
  if (a4 == 0x8000000000000000)
  {
    -[AXHAServer controlMessageDidUpdate:](self, "controlMessageDidUpdate:", v6);
    goto LABEL_44;
  }
  if (a4 == 128)
    goto LABEL_39;
LABEL_44:
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __53__AXHAServer_handleMessageWithPayload_forIdentifier___block_invoke;
  v46[3] = &unk_1EA8E88B0;
  v46[4] = self;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v46);

}

void __53__AXHAServer_handleMessageWithPayload_forIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

}

- (void)deviceDidUpdateProperty:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  HCPerformSafeBlock();

}

void __38__AXHAServer_deviceDidUpdateProperty___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "updates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "availableHearingAids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isPaired"))
    v6 = objc_msgSend(v5, "hasConnection");
  else
    v6 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__AXHAServer_deviceDidUpdateProperty___block_invoke_2;
  v15[3] = &unk_1EA8E88D8;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);
  if (objc_msgSend(v5, "isPaired") && v6 != objc_msgSend(v5, "hasConnection"))
  {
    +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearAudioRoutes");

  }
  v9 = *(void **)(a1 + 40);
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __38__AXHAServer_deviceDidUpdateProperty___block_invoke_3;
    v14[3] = &unk_1EA8E8900;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);
  }

}

void __38__AXHAServer_deviceDidUpdateProperty___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);

  objc_msgSend(a2, "lastObject");
  v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(_QWORD *)(a1 + 32));

}

void __38__AXHAServer_deviceDidUpdateProperty___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  BOOL v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = objc_msgSend(a2, "integerValue") == 0x200000;
  v8 = v12;
  if (v7)
  {
    objc_msgSend(v12, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 1;
    if (objc_msgSend(v9, "intValue") != 2)
    {
      objc_msgSend(v12, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "intValue") == 2;

    }
    objc_msgSend(*(id *)(a1 + 32), "updateListenersWithConnectionStatus:", v10);
    *a4 = 1;
    v8 = v12;
  }

}

- (void)updateListenersWithConnectionStatus:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  BOOL v10;

  v3 = a3;
  -[HCServer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HCServer delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hearingAidConnectionDidChange:", v3);

  }
  -[AXHAServer connectionStateBlocks](self, "connectionStateBlocks");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__AXHAServer_updateListenersWithConnectionStatus___block_invoke;
  v9[3] = &__block_descriptor_33_e32_v32__0__NSNumber_8___v__B_16_B24l;
  v10 = v3;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

}

uint64_t __50__AXHAServer_updateListenersWithConnectionStatus___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, *(unsigned __int8 *)(a1 + 32));
}

- (void)availableDevicesDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__AXHAServer_availableDevicesDidUpdate___block_invoke;
  v12[3] = &unk_1EA8E8998;
  v12[4] = self;
  v6 = v5;
  v13 = v6;
  v14 = &v15;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v12);
  -[AXHAServer setAvailableHearingAids:](self, "setAvailableHearingAids:", v6);
  if (*((_BYTE *)v16 + 24) || !objc_msgSend(v6, "count"))
  {
    -[AXHAServer updates](self, "updates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    v11 = v6;
    HCPerformSafeBlock();

  }
  _Block_object_dispose(&v15, 8);

}

void __40__AXHAServer_availableDevicesDidUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  AXRemoteHearingAidDevice *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  AXRemoteHearingAidDevice *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;

  v12 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "availableHearingAids");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __40__AXHAServer_availableDevicesDidUpdate___block_invoke_2;
      v16[3] = &unk_1EA8E8948;
      v8 = v12;
      v17 = v8;
      v9 = objc_msgSend(v6, "indexOfObjectPassingTest:", v16);
      if (v9 == 0x7FFFFFFFFFFFFFFFLL || !v6)
      {
        v10 = -[AXRemoteHearingAidDevice initWithRemoteRepresentation:andDeviceID:]([AXRemoteHearingAidDevice alloc], "initWithRemoteRepresentation:andDeviceID:", v5, v8);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndex:", v9);
        v10 = (AXRemoteHearingAidDevice *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
          v13[0] = v7;
          v13[1] = 3221225472;
          v13[2] = __40__AXHAServer_availableDevicesDidUpdate___block_invoke_3;
          v13[3] = &unk_1EA8E8970;
          v10 = v10;
          v11 = *(_QWORD *)(a1 + 48);
          v14 = v10;
          v15 = v11;
          objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);

        }
      }

    }
  }

}

uint64_t __40__AXHAServer_availableDevicesDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsPeripheralWithUUID:", *(_QWORD *)(a1 + 32));
}

uint64_t __40__AXHAServer_availableDevicesDidUpdate___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  uint64_t result;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend(v5, "availableEars");
  objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", v6, objc_msgSend(v7, "unsignedLongLongValue"));

  v9 = objc_msgSend(v7, "unsignedLongLongValue");
  result = propertyContainsProperty(v9, 8);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "availableEars");
    if ((_DWORD)result != v8)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __40__AXHAServer_availableDevicesDidUpdate___block_invoke_4(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__AXHAServer_availableDevicesDidUpdate___block_invoke_5;
  v2[3] = &unk_1EA8E88D8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

void __40__AXHAServer_availableDevicesDidUpdate___block_invoke_5(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);

  objc_msgSend(a2, "lastObject");
  v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(_QWORD *)(a1 + 32));

}

- (void)_liveListenDidUpdate_BOOLValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v4 = a3;
  -[AXHAServer updates](self, "updates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 256);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 512);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1024);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "BOOLValue");
  v13 = v7;
  v12 = v7;
  HCPerformSafeBlock();

}

uint64_t __45__AXHAServer__liveListenDidUpdate_BOOLValue___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__AXHAServer__liveListenDidUpdate_BOOLValue___block_invoke_2;
  v3[3] = &__block_descriptor_41_e24_v32__0__NSArray_8Q16_B24l;
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __45__AXHAServer__liveListenDidUpdate_BOOLValue___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD, double);

  objc_msgSend(a2, "lastObject");
  v3 = (void (**)(id, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(unsigned __int8 *)(a1 + 40), *(double *)(a1 + 32));

}

- (void)unregisterUpdateListener:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHAServer unregisterUpdateListenerHash:](self, "unregisterUpdateListenerHash:", v4);

}

- (void)unregisterUpdateListenerHash:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HCServer connectionQueue](self, "connectionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HCServer connectionQueue](self, "connectionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __43__AXHAServer_unregisterUpdateListenerHash___block_invoke;
    v7[3] = &unk_1EA8E81F8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v6, v7);

  }
  else
  {
    -[AXHAServer _unregisterUpdateListenerHash:](self, "_unregisterUpdateListenerHash:", v4);
  }

}

uint64_t __43__AXHAServer_unregisterUpdateListenerHash___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterUpdateListenerHash:", *(_QWORD *)(a1 + 40));
}

- (void)_unregisterUpdateListenerHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unregister from updates listenerHash: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer _unregisterUpdateListenerHash:]", 425, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1DE311000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 2, 0, v4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 4, 0, v4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 256, 0, v4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 0x8000000000000000, 0, v4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 0x40000, 0, v4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 0x100000, 0, v4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 0x200000, 0, v4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 0x400000, 0, v4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", 0, 0x1000000, 0, v4);
  -[AXHAServer registerListener:forConnectionStateHandler:listenerHash:](self, "registerListener:forConnectionStateHandler:listenerHash:", 0, 0, v4);

}

- (void)registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 withListener:(id)a5
{
  void *v9;
  id v10;
  id v11;
  id v12;

  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "numberWithUnsignedLongLong:", a5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:listenerHash:](self, "registerUpdateBlock:forIdentifier:withListener:listenerHash:", v11, a4, v10, v12);

}

- (void)registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 withListener:(id)a5 listenerHash:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (v11)
    -[AXHAServer setupListenerHelperForListener:withAddress:](self, "setupListenerHelperForListener:withAddress:", v11, v12);
  -[HCServer connectionQueue](self, "connectionQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_initWeak(&location, self);
    -[HCServer connectionQueue](self, "connectionQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__AXHAServer_registerUpdateBlock_forIdentifier_withListener_listenerHash___block_invoke;
    block[3] = &unk_1EA8E8A08;
    objc_copyWeak(v18, &location);
    v16 = v10;
    v18[1] = (id)a4;
    v17 = v12;
    dispatch_async(v14, block);

    objc_destroyWeak(v18);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AXHAServer _registerUpdateBlock:forIdentifier:listenerHash:](self, "_registerUpdateBlock:forIdentifier:listenerHash:", v10, a4, v12);
  }

}

void __74__AXHAServer_registerUpdateBlock_forIdentifier_withListener_listenerHash___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_registerUpdateBlock:forIdentifier:listenerHash:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)_registerUpdateBlock:(id)a3 forIdentifier:(unint64_t)a4 listenerHash:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[AXHAServer updates](self, "updates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13 = (void *)objc_msgSend(v8, "copy");
    v24[0] = v9;
    v14 = (void *)MEMORY[0x1DF0EB808]();
    v24[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXHAServer updates](self, "updates");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v12, v17);

    }
    objc_msgSend(v12, "addObject:", v15);

  }
  else
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __62__AXHAServer__registerUpdateBlock_forIdentifier_listenerHash___block_invoke;
    v22 = &unk_1EA8E8A30;
    v23 = v9;
    objc_msgSend(v12, "indexesOfObjectsPassingTest:", &v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count", v19, v20, v21, v22))
      objc_msgSend(v12, "removeObjectsAtIndexes:", v18);
    if (!objc_msgSend(v12, "count"))
      -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900300, a4);

  }
}

uint64_t __62__AXHAServer__registerUpdateBlock_forIdentifier_listenerHash___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)registerResponseBlock:(id)a3 forUUID:(id)a4
{
  id v6;
  NSMutableDictionary *responseBlocks;
  void *v8;
  id v9;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v9 = (id)objc_msgSend(a3, "copy");
      responseBlocks = self->_responseBlocks;
      v8 = (void *)MEMORY[0x1DF0EB808]();
      -[NSMutableDictionary setObject:forKey:](responseBlocks, "setObject:forKey:", v8, v6);

    }
  }
}

- (void)registerListener:(id)a3 forAvailableDeviceHandler:(id)a4
{
  -[AXHAServer _registerListener:forAvailableDeviceHandler:beginSearching:](self, "_registerListener:forAvailableDeviceHandler:beginSearching:", a3, a4, 1);
}

- (void)registerPassiveListener:(id)a3 forAvailableDeviceHandler:(id)a4
{
  -[AXHAServer _registerListener:forAvailableDeviceHandler:beginSearching:](self, "_registerListener:forAvailableDeviceHandler:beginSearching:", a3, a4, 0);
}

- (void)_registerListener:(id)a3 forAvailableDeviceHandler:(id)a4 beginSearching:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v5 = a5;
  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v19[0] = CFSTR("ax_hearing_should_register_client_key");
  v19[1] = CFSTR("ax_hearing_should_begin_searching_key");
  v20[0] = MEMORY[0x1E0C9AAB0];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v12, 2);

  v13 = (void *)MEMORY[0x1DF0EB808](v8);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", v13, 2, v10);

  -[AXHAServer availableHearingAids](self, "availableHearingAids");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v8 && v15)
  {
    -[HCServer connectionQueue](self, "connectionQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AXHAServer__registerListener_forAvailableDeviceHandler_beginSearching___block_invoke;
    block[3] = &unk_1EA8E86E0;
    block[4] = self;
    v18 = v8;
    dispatch_async(v16, block);

  }
}

void __73__AXHAServer__registerListener_forAvailableDeviceHandler_beginSearching___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "availableHearingAids");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)registerListener:(id)a3 forPropertyUpdateHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900328, 4);
  v8 = (id)MEMORY[0x1DF0EB808](v6);

  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", v8, 4, v7);
}

- (void)updateProperty:(unint64_t)a3 forDeviceID:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithUnsignedLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v8, &unk_1EA8FFA28, v8, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v10, 16);
}

- (void)writeValue:(id)a3 forProperty:(unint64_t)a4 andDeviceID:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "numberWithUnsignedLongLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", v10, &unk_1EA8FFA28, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC sending payload %@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer writeValue:forProperty:andDeviceID:]", 557, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_retainAutorelease(v15);
    v18 = v16;
    *(_DWORD *)buf = 136446210;
    v20 = objc_msgSend(v17, "UTF8String");
    _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v13, 8);

}

- (void)sendMessagesPriorityHigh
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC sending messagesPriority: Urgent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer sendMessagesPriorityHigh]", 563, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v13 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x20000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v9, 0x20000);

}

- (void)sendMessagesPriorityDefault
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPC sending messagesPriority: Default"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer sendMessagesPriorityDefault]", 569, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F928];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v13 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE311000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x20000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v9, 0x20000);

}

- (void)requestHearingAidReachabilityStatus
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 2048);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v4, 2048);

}

- (NSArray)availableHearingAids
{
  AXHAServer *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSArray copy](v2->_availableHearingAids, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setAvailableHearingAids:(id)a3
{
  AXHAServer *v4;
  uint64_t v5;
  NSArray *availableHearingAids;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  availableHearingAids = v4->_availableHearingAids;
  v4->_availableHearingAids = (NSArray *)v5;

  objc_sync_exit(v4);
}

- (void)registerListener:(id)a3 forConnectionStateHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[AXHAServer registerListener:forConnectionStateHandler:listenerHash:](self, "registerListener:forConnectionStateHandler:listenerHash:", v8, v7, v9);

}

- (void)registerListener:(id)a3 forConnectionStateHandler:(id)a4 listenerHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
    -[AXHAServer setupListenerHelperForListener:withAddress:](self, "setupListenerHelperForListener:withAddress:", v8, v10);
  -[HCServer connectionQueue](self, "connectionQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_initWeak(&location, self);
    -[HCServer connectionQueue](self, "connectionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__AXHAServer_registerListener_forConnectionStateHandler_listenerHash___block_invoke;
    v13[3] = &unk_1EA8E8A58;
    objc_copyWeak(&v16, &location);
    v15 = v9;
    v14 = v10;
    dispatch_async(v12, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    -[AXHAServer _registerConnectionStateBlock:listenerHash:](self, "_registerConnectionStateBlock:listenerHash:", v9, v10);
  }

}

void __70__AXHAServer_registerListener_forConnectionStateHandler_listenerHash___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_registerConnectionStateBlock:listenerHash:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void)_registerConnectionStateBlock:(id)a3 listenerHash:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  if (a3)
  {
    v9 = (id)objc_msgSend(a3, "copy");
    -[AXHAServer connectionStateBlocks](self, "connectionStateBlocks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1DF0EB808](v9);
    objc_msgSend(v7, "setObject:forKey:", v8, v6);

    v6 = v7;
  }
  else
  {
    -[AXHAServer connectionStateBlocks](self, "connectionStateBlocks");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v6);
  }

}

- (void)connectToControllerWithID:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("controller"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v4, 0x8000);

}

- (void)requestHearingAidConnectionWithReason:(int64_t)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 == 5)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.accessibility.hearing.audio.transfer"), 0, 0, 1u);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("controller"), v8, CFSTR("reason"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v9, 0x8000);
  }
}

- (void)cancelHearingAidConnectionRequest
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, CFSTR("controller"), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v5, 0x2000);
}

- (void)registerListener:(id)a3 forLiveListenLevelsHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900350, 256);
  v8 = (id)MEMORY[0x1DF0EB808](v6);

  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", v8, 256, v7);
}

- (void)unregisterLiveListenLevelListener:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", 0, 256, a3);
  -[AXHAServer updates](self, "updates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 256);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
    -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900378, 256);

}

- (void)startLiveListen
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 128);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v5, 128);
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA9003A0, 256);

}

- (void)stopLiveListen
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 128);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AAA0], v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v5, 128);
}

- (void)registerListener:(id)a3 forLiveDosimetryUpdates:(BOOL)a4 withDoseHandler:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a3;
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA9003C8, 0x40000);
  v9 = (id)MEMORY[0x1DF0EB808](v7);

  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", v9, 0x40000, v8);
}

- (void)unregisterDoseHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", 0, 0x40000, a3);
  -[AXHAServer updates](self, "updates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x40000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
    -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA9003F0, 0x40000);

}

- (void)environmentalDosimetryDidUpdate:(id)a3
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
  id v16;
  void *v17;

  v4 = a3;
  -[AXHAServer updates](self, "updates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x40000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("HUEDSlowLeqIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("HUEDFastLeqIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("HUEDEnabledIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("HUEDThresholdCrossedIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("HUEDSlowAttenuationLevelIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("HUEDFastAttenuationLevelIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("HUEDWearingAirPodsIdentifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("HUEDDeviceTypeIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "unsignedIntegerValue");
  v17 = v7;
  v16 = v7;
  HCPerformSafeBlock();

}

uint64_t __46__AXHAServer_environmentalDosimetryDidUpdate___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _QWORD v4[4];
  __int128 v5;
  __int128 v6;
  __int16 v7;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AXHAServer_environmentalDosimetryDidUpdate___block_invoke_2;
  v4[3] = &__block_descriptor_66_e24_v32__0__NSArray_8Q16_B24l;
  v7 = *(_WORD *)(a1 + 72);
  v2 = *(_OWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 56);
  v5 = v2;
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);
}

void __46__AXHAServer_environmentalDosimetryDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "lastObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, float, float, float, float))v3 + 2))(v3, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 40), *(float *)(a1 + 48), *(float *)(a1 + 52), *(float *)(a1 + 56), *(float *)(a1 + 60));

}

- (void)registerListener:(id)a3 forLiveHeadphoneLevelHandler:(id)a4
{
  -[AXHAServer _registerListener:forLiveHeadphoneLevelHandler:messageIdentifier:](self, "_registerListener:forLiveHeadphoneLevelHandler:messageIdentifier:", a3, a4, 0x100000);
}

- (void)unregisterLiveHeadphoneLevelHandler:(id)a3
{
  -[AXHAServer _unregisterLiveHeadphoneLevelHandler:messageIdentifier:](self, "_unregisterLiveHeadphoneLevelHandler:messageIdentifier:", a3, 0x100000);
}

- (void)registerListener:(id)a3 forRemoteLiveHeadphoneLevelHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceIsTinker");

  if (v9)
  {
    HCLogSoundMeter();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_INFO, "Watch is in family mode. Not requesting remote live headphone data", v11, 2u);
    }

  }
  else
  {
    -[AXHAServer _registerListener:forLiveHeadphoneLevelHandler:messageIdentifier:](self, "_registerListener:forLiveHeadphoneLevelHandler:messageIdentifier:", v6, v7, 0x200000);
  }

}

- (void)unregisterRemoteLiveHeadphoneLevelHandler:(id)a3
{
  -[AXHAServer _unregisterLiveHeadphoneLevelHandler:messageIdentifier:](self, "_unregisterLiveHeadphoneLevelHandler:messageIdentifier:", a3, 0x200000);
}

- (void)registerListener:(id)a3 forRemoteLiveHeadphoneLevelChangesHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a3;
  v7 = a4;
  +[HUUtilities sharedUtilities](HUUtilities, "sharedUtilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceIsTinker");

  if (v9)
  {
    HCLogSoundMeter();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_INFO, "Watch is in family mode. Not requesting remote headphone data changes", v11, 2u);
    }

  }
  else
  {
    -[AXHAServer _registerListener:forLiveHeadphoneLevelHandler:messageIdentifier:](self, "_registerListener:forLiveHeadphoneLevelHandler:messageIdentifier:", v6, v7, 0x400000);
  }

}

- (void)unregisterRemoteLiveHeadphoneLevelChangesHandler:(id)a3
{
  -[AXHAServer _unregisterLiveHeadphoneLevelHandler:messageIdentifier:](self, "_unregisterLiveHeadphoneLevelHandler:messageIdentifier:", a3, 0x400000);
}

- (void)_registerListener:(id)a3 forLiveHeadphoneLevelHandler:(id)a4 messageIdentifier:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900418, a5);
  v10 = (id)MEMORY[0x1DF0EB808](v8);

  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", v10, a5, v9);
}

- (void)_unregisterLiveHeadphoneLevelHandler:(id)a3 messageIdentifier:(unint64_t)a4
{
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", 0, a4, a3);
}

- (void)_headphoneLevelDidUpdate:(id)a3 messageIdentifier:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a3;
  -[AXHAServer updates](self, "updates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v6;
  v11 = v9;
  HCPerformSafeBlock();

}

void __57__AXHAServer__headphoneLevelDidUpdate_messageIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__AXHAServer__headphoneLevelDidUpdate_messageIdentifier___block_invoke_2;
  v2[3] = &unk_1EA8E88D8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

void __57__AXHAServer__headphoneLevelDidUpdate_messageIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  objc_msgSend(a2, "lastObject");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v3[2](v3, *(_QWORD *)(a1 + 32));
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (void)registerListener:(id)a3 forControlMessageHandler:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)MEMORY[0x1DF0EB808](a4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", v7, 0x8000000000000000, v6);

  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900440, 0x8000000000000000);
}

- (void)unregisterControlMessageHandler:(id)a3
{
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", 0, 0x8000000000000000, a3);
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900468, 0x8000000000000000);
}

- (void)controlMessageDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v4 = a3;
  -[AXHAServer updates](self, "updates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x8000000000000000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v4;
  v8 = v4;
  v9 = v7;
  HCPerformSafeBlock();

}

void __38__AXHAServer_controlMessageDidUpdate___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__AXHAServer_controlMessageDidUpdate___block_invoke_2;
  v2[3] = &unk_1EA8E88D8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

void __38__AXHAServer_controlMessageDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD, _QWORD);
  id v4;

  objc_msgSend(a2, "lastObject");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v3[2](v3, *(_QWORD *)(a1 + 32));
    v3 = (void (**)(_QWORD, _QWORD))v4;
  }

}

- (void)registerListener:(id)a3 forComfortSoundsModelUpdatesHandler:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)MEMORY[0x1DF0EB808](a4);
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", v7, 0x1000000, v6);

  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA900490, 0x1000000);
}

- (void)unregisterComfortSoundsModelUpdatesHandler:(id)a3
{
  -[AXHAServer registerUpdateBlock:forIdentifier:withListener:](self, "registerUpdateBlock:forIdentifier:withListener:", 0, 0x1000000, a3);
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA9004B8, 0x1000000);
}

- (void)comfortSoundsAssetsDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v4 = a3;
  -[AXHAServer updates](self, "updates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x1000000);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v4;
  v8 = v7;
  v9 = v4;
  HCPerformSafeBlock();

}

void __43__AXHAServer_comfortSoundsAssetsDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CF2D60];
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("HUComfortSoundsAvailableAssetsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v2, "unarchivedAssets:error:", v3, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("HUComfortSoundsDownloadProgressKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error unarchiving assets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer comfortSoundsAssetsDidUpdate:]_block_invoke", 909, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v8);
      v11 = v9;
      v12 = objc_msgSend(v10, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v21 = v12;
      _os_log_impl(&dword_1DE311000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  v13 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __43__AXHAServer_comfortSoundsAssetsDidUpdate___block_invoke_103;
  v16[3] = &unk_1EA8E8AC8;
  v17 = v4;
  v18 = v6;
  v14 = v6;
  v15 = v4;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);

}

void __43__AXHAServer_comfortSoundsAssetsDidUpdate___block_invoke_103(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  id v4;

  objc_msgSend(a2, "lastObject");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v3[2](v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  }

}

- (void)reregisterForComfortSoundsAssetsUpdatesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[AXHAServer updates](self, "updates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0x1000000);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CSInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reregistering for updates %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AXHAServer reregisterForComfortSoundsAssetsUpdatesIfNeeded]", 924, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D2F918];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v12 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE311000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  if (objc_msgSend(v5, "count"))
    -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1EA9004E0, 0x1000000);

}

- (void)downloadComfortSoundAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[AXHAServer reregisterForComfortSoundsAssetsUpdatesIfNeeded](self, "reregisterForComfortSoundsAssetsUpdatesIfNeeded");
    v9 = CFSTR("HUComfortSoundsDownloadAssetKey");
    objc_msgSend(v4, "assetId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v8, 0x1000000);

  }
}

- (void)removeComfortSoundAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "assetId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[AXHAServer reregisterForComfortSoundsAssetsUpdatesIfNeeded](self, "reregisterForComfortSoundsAssetsUpdatesIfNeeded");
    v9 = CFSTR("HUComfortSoundsRemoveAssetKey");
    objc_msgSend(v4, "assetId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", v8, 0x1000000);

  }
}

- (void)setupListenerHelperForListener:(id)a3 withAddress:(id)a4
{
  id v5;
  AXHAListenerHelper *v6;
  id object;

  object = a3;
  v5 = a4;
  objc_getAssociatedObject(object, &AXHAListenerHelperKey);
  v6 = (AXHAListenerHelper *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[AXHAListenerHelper initWithListenerAddress:]([AXHAListenerHelper alloc], "initWithListenerAddress:", v5);
    objc_setAssociatedObject(object, &AXHAListenerHelperKey, v6, (void *)1);
  }

}

- (NSArray)availableControllers
{
  return self->_availableControllers;
}

- (void)setAvailableControllers:(id)a3
{
  objc_storeStrong((id *)&self->_availableControllers, a3);
}

- (BOOL)hearingAidReachableForAudioTransfer
{
  return self->_hearingAidReachableForAudioTransfer;
}

- (void)setHearingAidReachableForAudioTransfer:(BOOL)a3
{
  self->_hearingAidReachableForAudioTransfer = a3;
}

- (NSString)hearingDeviceName
{
  return self->_hearingDeviceName;
}

- (void)setHearingDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_hearingDeviceName, a3);
}

- (NSString)connectedDeviceName
{
  return self->_connectedDeviceName;
}

- (void)setConnectedDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_connectedDeviceName, a3);
}

- (BOOL)hearingAidConnectedOrReachable
{
  return self->_hearingAidConnectedOrReachable;
}

- (void)setHearingAidConnectedOrReachable:(BOOL)a3
{
  self->_hearingAidConnectedOrReachable = a3;
}

- (NSMutableDictionary)updates
{
  return self->_updates;
}

- (void)setUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_updates, a3);
}

- (NSMutableDictionary)connectionStateBlocks
{
  return self->_connectionStateBlocks;
}

- (void)setConnectionStateBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_connectionStateBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionStateBlocks, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_connectedDeviceName, 0);
  objc_storeStrong((id *)&self->_hearingDeviceName, 0);
  objc_storeStrong((id *)&self->_availableControllers, 0);
  objc_storeStrong((id *)&self->_availableHearingAids, 0);
  objc_storeStrong((id *)&self->_responseBlocks, 0);
}

@end
