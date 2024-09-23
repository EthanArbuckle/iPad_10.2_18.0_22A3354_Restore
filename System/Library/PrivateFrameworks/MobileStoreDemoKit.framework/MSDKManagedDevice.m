@implementation MSDKManagedDevice

- (BOOL)isBetterTogetherDemoDevice
{
  void *v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    +[MSDKDemoState sharedInstance](MSDKDemoState, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v3, "_isStoreDemoModeEnabled:", 0);

    if ((_DWORD)v4)
    {
      v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v5, "RequestOperation", "GetDeviceOptions");
      xpc_dictionary_set_string(v5, "SubKey", (const char *)objc_msgSend(CFSTR("enable_better_together"), "UTF8String"));
      -[MSDKManagedDevice setupConnection](self, "setupConnection");
      -[MSDKManagedDevice connection](self, "connection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[MSDKManagedDevice connection](self, "connection");
        v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        v7 = xpc_connection_send_message_with_reply_sync(v4, v5);

        LOBYTE(v4) = xpc_dictionary_get_BOOL(v7, (const char *)objc_msgSend(CFSTR("enable_better_together"), "UTF8String"));
      }
      else
      {
        defaultLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[MSDKManagedDevice isBetterTogetherDemoDevice].cold.1(v7, v9, v10, v11, v12, v13, v14, v15);
        LOBYTE(v4) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (BOOL)isDeviceClassSupported
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)MGCopyAnswer();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("iPhone"), CFSTR("iPad"), CFSTR("iPod"), CFSTR("Watch"), CFSTR("AppleTV"), CFSTR("RealityDevice"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = v2 && (objc_msgSend(v3, "containsObject:", v2) & 1) != 0;

  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_7);
  return (id)sharedInstance_device;
}

void __35__MSDKManagedDevice_sharedInstance__block_invoke()
{
  MSDKManagedDevice *v0;
  void *v1;

  v0 = objc_alloc_init(MSDKManagedDevice);
  v1 = (void *)sharedInstance_device;
  sharedInstance_device = (uint64_t)v0;

}

- (MSDKManagedDevice)init
{
  MSDKManagedDevice *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  MSDKManagedDevice *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)MSDKManagedDevice;
  v2 = -[MSDKManagedDevice init](&v10, sel_init);
  if (v2)
  {
    defaultLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213A7E000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_213AB433A, buf, 2u);
    }

    defaultLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "processName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_213A7E000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ started to use MobileStoreDemoKit.", buf, 0xCu);

    }
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[MSDKManagedDevice setXpc_cache:](v2, "setXpc_cache:", v7);

    v8 = v2;
  }

  return v2;
}

- (void)setXpc_cache:(id)a3
{
  objc_storeStrong((id *)&self->_xpc_cache, a3);
}

- (id)getAppDataFolderPathWithReturnError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 9, 1, 0, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (v5)
  {
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("MSDPersistentData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_213A7E000, v9, OS_LOG_TYPE_DEFAULT, "appDataFolderPath:  %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(PersistentStorage) getAppDataFolderPathWithReturnError:].cold.1(v6, v9);
    v8 = 0;
  }

  return v8;
}

- (BOOL)preserveAppDataToPersistentStorageWithReturnError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  _xpc_connection_s *v11;
  xpc_object_t v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  const char *string;
  __CFString *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  -[MSDKManagedDevice getAppDataFolderPathWithReturnError:](self, "getAppDataFolderPathWithReturnError:", &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  v7 = v6;
  if (!v5)
  {
    if (a3)
    {
      v14 = 0;
      *a3 = objc_retainAutorelease(v6);
      goto LABEL_20;
    }
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "RequestOperation", "preserveSecondPartyAppDataToShelter");
  v9 = objc_retainAutorelease(v5);
  xpc_dictionary_set_string(v8, "SourcePath", (const char *)objc_msgSend(v9, "UTF8String"));
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    safeAssignErrorWithReason(a3, 3727744774, (uint64_t)CFSTR("Error preserving data to shelter."), (uint64_t)CFSTR("Failed to setup XPC connection."));
    defaultLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(PersistentStorage) preserveAppDataToPersistentStorageWithReturnError:].cold.1(v15, v16, v17);

    goto LABEL_18;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v12 = xpc_connection_send_message_with_reply_sync(v11, v8);

  if (!xpc_dictionary_get_BOOL(v12, "Result"))
  {
    string = xpc_dictionary_get_string(v12, "ErrorMsg");
    if (string)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = CFSTR("Error preserving data to shelter.");
    }
    safeAssignErrorWithReason(a3, 3727744774, (uint64_t)CFSTR("Error preserving data to shelter."), (uint64_t)v19);
    defaultLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(PersistentStorage) preserveAppDataToPersistentStorageWithReturnError:].cold.2((uint64_t)v9, a3, v20);

LABEL_18:
    goto LABEL_19;
  }
  defaultLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v9;
    _os_log_impl(&dword_213A7E000, v13, OS_LOG_TYPE_DEFAULT, "Successfully preserved app data from %{public}@ to persistent storage.", buf, 0xCu);
  }

  v14 = 1;
LABEL_20:

  return v14;
}

- (BOOL)closeRunningAppsExcept:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  void *v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "CloseRunningApps");
  objc_msgSend(v4, "xpcArrayFromArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_value(v5, "ScreenSaverAppIDs", v6);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v8, v5);

    v10 = xpc_dictionary_get_BOOL(v9, "Result");
  }
  else
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(CloseApps) closeRunningAppsExcept:].cold.1(v9, v12, v13, v14, v15, v16, v17, v18);
    v10 = 0;
  }

  return v10;
}

- (BOOL)initializeAppSwitcherContent
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "InitializeAppSwitcherContent");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Result");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(CloseApps) initializeAppSwitcherContent].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (void)checkInWithCompletion:(id)a3
{
  id v4;
  MSDKManagedDevice *v5;
  NSObject *v6;
  xpc_object_t v7;
  void *v8;
  _BOOL4 v9;
  _xpc_connection_s *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  id v28;
  id v29;
  _QWORD v30[5];
  MSDKManagedDevice *v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__1;
  v32[4] = __Block_byref_object_dispose__1;
  v33 = (id)MEMORY[0x2199BBB24]();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__8;
  v5 = self;
  v31 = v5;
  if (-[MSDKManagedDevice isDeviceClassSupported](v5, "isDeviceClassSupported"))
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[MSDKManagedDevice(DemoUnitRequest) checkInWithCompletion:]";
      _os_log_impl(&dword_213A7E000, v6, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
    }

    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "RequestOperation", "DeviceCheckIn");
    -[MSDKManagedDevice setupConnection](v5, "setupConnection");
    -[MSDKManagedDevice connection](v5, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
      -[MSDKManagedDevice connection](v5, "connection");
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __60__MSDKManagedDevice_DemoUnitRequest__checkInWithCompletion___block_invoke;
      v27[3] = &unk_24D0AD8F0;
      v27[4] = v30;
      v27[5] = v32;
      xpc_connection_send_message_with_reply(v10, v7, 0, v27);

      v11 = 0;
      goto LABEL_6;
    }
    v28 = 0;
    safeAssignError(&v28, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v11 = v28;
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) checkInWithCompletion:].cold.1(v12, v20, v21, v22, v23, v24, v25, v26);
  }
  else
  {
    v29 = 0;
    safeAssignError(&v29, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v11 = v29;
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) checkInWithCompletion:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
    v7 = 0;
  }

  if (v4)
    (*((void (**)(id, _QWORD, _QWORD, id))v4 + 2))(v4, 0, 0, v11);
LABEL_6:
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
}

uint64_t __60__MSDKManagedDevice_DemoUnitRequest__checkInWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_handleCheckInXPCResponse:withCompletion:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)markAsNotDemoWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  MSDKManagedDevice *v5;
  NSObject *v6;
  xpc_object_t v7;
  void *v8;
  _BOOL4 v9;
  _xpc_connection_s *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  id v28;
  id v29;
  _QWORD v30[5];
  MSDKManagedDevice *v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__1;
  v32[4] = __Block_byref_object_dispose__1;
  v33 = (id)MEMORY[0x2199BBB24]();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__7;
  v30[4] = __Block_byref_object_dispose__8;
  v5 = self;
  v31 = v5;
  if (-[MSDKManagedDevice isDeviceClassSupported](v5, "isDeviceClassSupported"))
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v35 = "-[MSDKManagedDevice(DemoUnitRequest) markAsNotDemoWithCompletion:]";
      _os_log_impl(&dword_213A7E000, v6, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
    }

    v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "RequestOperation", "MarkAsNotDemo");
    -[MSDKManagedDevice setupConnection](v5, "setupConnection");
    -[MSDKManagedDevice connection](v5, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

    if (!v9)
    {
      -[MSDKManagedDevice connection](v5, "connection");
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __66__MSDKManagedDevice_DemoUnitRequest__markAsNotDemoWithCompletion___block_invoke;
      v27[3] = &unk_24D0AD8F0;
      v27[4] = v30;
      v27[5] = v32;
      xpc_connection_send_message_with_reply(v10, v7, 0, v27);

      v11 = 0;
      goto LABEL_6;
    }
    v28 = 0;
    safeAssignError(&v28, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v11 = v28;
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) markAsNotDemoWithCompletion:].cold.1(v12, v20, v21, v22, v23, v24, v25, v26);
  }
  else
  {
    v29 = 0;
    safeAssignError(&v29, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v11 = v29;
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) markAsNotDemoWithCompletion:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
    v7 = 0;
  }

  if (v4)
    v4[2](v4, 0, v11);
LABEL_6:

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

uint64_t __66__MSDKManagedDevice_DemoUnitRequest__markAsNotDemoWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_handleMarkAsNotDemoXPCResponse:withCompletion:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)searchStoreWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  MSDKManagedDevice *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _xpc_connection_s *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[6];
  id v32;
  id v33;
  _QWORD v34[5];
  MSDKManagedDevice *v35;
  _QWORD v36[5];
  id v37;
  uint8_t buf[4];
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__1;
  v36[4] = __Block_byref_object_dispose__1;
  v37 = (id)MEMORY[0x2199BBB24]();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__7;
  v34[4] = __Block_byref_object_dispose__8;
  v8 = self;
  v35 = v8;
  if (-[MSDKManagedDevice isDeviceClassSupported](v8, "isDeviceClassSupported"))
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v39 = "-[MSDKManagedDevice(DemoUnitRequest) searchStoreWithOptions:completion:]";
      _os_log_impl(&dword_213A7E000, v9, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
    }

    if (v6)
    {
      objc_msgSend(v6, "createXPCDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = xpc_dictionary_create(0, 0, 0);
    }
    v11 = v10;
    xpc_dictionary_set_string(v10, "RequestOperation", "StoreSearch");
    -[MSDKManagedDevice setupConnection](v8, "setupConnection");
    -[MSDKManagedDevice connection](v8, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      -[MSDKManagedDevice connection](v8, "connection");
      v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __72__MSDKManagedDevice_DemoUnitRequest__searchStoreWithOptions_completion___block_invoke;
      v31[3] = &unk_24D0AD8F0;
      v31[4] = v34;
      v31[5] = v36;
      xpc_connection_send_message_with_reply(v14, v11, 0, v31);

      v15 = 0;
      goto LABEL_9;
    }
    v32 = 0;
    safeAssignError(&v32, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v15 = v32;
    defaultLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) searchStoreWithOptions:completion:].cold.1(v16, v24, v25, v26, v27, v28, v29, v30);
  }
  else
  {
    v33 = 0;
    safeAssignError(&v33, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v15 = v33;
    defaultLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) searchStoreWithOptions:completion:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
    v11 = 0;
  }

  if (v7)
    v7[2](v7, 0, v15);
LABEL_9:

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

uint64_t __72__MSDKManagedDevice_DemoUnitRequest__searchStoreWithOptions_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_handleSearchXPCResponse:withCompletion:", a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)_handleCheckInXPCResponse:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, _BOOL8, _BOOL8, id);
  _BOOL8 v7;
  _BOOL8 v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v5 = a3;
  v6 = (void (**)(id, _BOOL8, _BOOL8, id))a4;
  if (MEMORY[0x2199BBE54](v5) != MEMORY[0x24BDACFA0])
  {
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) _handleCheckInXPCResponse:withCompletion:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

LABEL_9:
    v18 = 0;
    safeAssignError(&v18, 3727741189, (uint64_t)CFSTR("Unexpected demod xpc response."));
    v9 = v18;
    v8 = 0;
    v7 = 0;
    if (!v6)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (!xpc_dictionary_get_BOOL(v5, "Result"))
    goto LABEL_9;
  v7 = xpc_dictionary_get_BOOL(v5, "Eligible");
  v8 = xpc_dictionary_get_BOOL(v5, "ShowUI");
  v9 = 0;
  if (v6)
LABEL_4:
    v6[2](v6, v7, v8, v9);
LABEL_5:

}

- (void)_handleMarkAsNotDemoXPCResponse:(id)a3 withCompletion:(id)a4
{
  void (**v5)(id, _BOOL8, id);
  _BOOL8 v6;
  id v7;
  id v8;

  v5 = (void (**)(id, _BOOL8, id))a4;
  v6 = xpc_dictionary_get_BOOL(a3, "Result");
  if (v6)
  {
    v7 = 0;
    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = 0;
  safeAssignError(&v8, 3727741189, (uint64_t)CFSTR("Unexpected demod xpc response."));
  v7 = v8;
  if (v5)
LABEL_5:
    v5[2](v5, v6, v7);
LABEL_6:

}

- (void)_handleSearchXPCResponse:(id)a3 withCompletion:(id)a4
{
  id v5;
  void (**v6)(id, void *, id);
  const void *data;
  void *v8;
  void *v9;
  id v10;
  char v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  size_t length;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  length = 0;
  if (MEMORY[0x2199BBE54](v5) != MEMORY[0x24BDACFA0])
  {
    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:].cold.5(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_18;
  }
  if (!xpc_dictionary_get_BOOL(v5, "Result"))
  {
    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:].cold.4(v14, v22, v23, v24, v25, v26, v27, v28);
LABEL_18:
    v10 = 0;
    v11 = 0;
    v9 = 0;
    v8 = 0;
    goto LABEL_28;
  }
  data = xpc_dictionary_get_data(v5, "ResultData", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", data, length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 0, &v44);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v44;
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = 1;
        goto LABEL_7;
      }
      defaultLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:].cold.3((uint64_t)v9, v14);
    }
    else
    {
      defaultLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:].cold.2(v14, v36, v37, v38, v39, v40, v41, v42);
      v9 = 0;
    }
  }
  else
  {
    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:].cold.1(v14, v29, v30, v31, v32, v33, v34, v35);
    v10 = 0;
    v9 = 0;
    v8 = 0;
  }
  v11 = 1;
LABEL_28:

LABEL_7:
  defaultLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "-[MSDKManagedDevice(DemoUnitRequest) _handleSearchXPCResponse:withCompletion:]";
    v48 = 2114;
    v49 = v9;
    _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, "%s - Store Search return with result list - %{public}@", buf, 0x16u);
  }

  if ((v11 & 1) == 0)
  {
    v43 = v10;
    safeAssignError(&v43, 3727741189, (uint64_t)CFSTR("Unexpected demod xpc response."));
    v13 = v43;

    v10 = v13;
  }
  if (v6)
    v6[2](v6, v9, v10);

}

- (id)getCurrentAppUsageSessionUUID
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  const char *string;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (!-[MSDKManagedDevice isEnrolled](self, "isEnrolled")
    || !-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    v8 = 0;
    return v8;
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "GetAppUsageSessionUUID");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(dataCollection) getCurrentAppUsageSessionUUID].cold.1(v6, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_17;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

  if (!xpc_dictionary_get_BOOL(v6, "Result"))
  {
    defaultLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(dataCollection) getCurrentAppUsageSessionUUID].cold.3(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_16;
  }
  string = xpc_dictionary_get_string(v6, "SessionUUID");
  if (!string)
  {
    defaultLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(dataCollection) getCurrentAppUsageSessionUUID].cold.2(v17, v25, v26, v27, v28, v29, v30, v31);
LABEL_16:

LABEL_17:
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (BOOL)collectAppUsageWithSessionStart:(id)a3 andEnd:(id)a4
{
  id v6;
  id v7;
  double v8;
  xpc_object_t v9;
  double v10;
  xpc_object_t v11;
  xpc_object_t v12;
  void *v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  if (-[MSDKManagedDevice isEnrolled](self, "isEnrolled")
    && -[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    objc_msgSend(v6, "timeIntervalSince1970");
    v9 = xpc_double_create(v8);
    objc_msgSend(v7, "timeIntervalSince1970");
    v11 = xpc_double_create(v10);
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v12, "RequestOperation", "CollectAppUsageData");
    xpc_dictionary_set_value(v12, "StartTime", v9);
    xpc_dictionary_set_value(v12, "EndTime", v11);
    -[MSDKManagedDevice setupConnection](self, "setupConnection");
    -[MSDKManagedDevice connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MSDKManagedDevice connection](self, "connection");
      v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v15 = xpc_connection_send_message_with_reply_sync(v14, v12);

      v16 = xpc_dictionary_get_BOOL(v15, "Result");
    }
    else
    {
      defaultLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice(dataCollection) collectAppUsageWithSessionStart:andEnd:].cold.1(v15, v18, v19, v20, v21, v22, v23, v24);
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)sendAutoEnrollmentResult:(double)a3 withStoreId:(id)a4 withHelpMenuRowSelection:(id)a5
{
  __CFString *v8;
  id v9;
  xpc_object_t v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  void *v14;
  _xpc_connection_s *v15;
  NSObject *v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v8 = (__CFString *)a4;
  v9 = a5;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "RequestOperation", "AutoEnrollmentResults");
  xpc_dictionary_set_double(v10, "AutoEnrollmentTimeStamp", a3);
  if (v8)
    v11 = v8;
  else
    v11 = &stru_24D0AE900;
  v12 = objc_retainAutorelease(v11);
  xpc_dictionary_set_string(v10, "AutoEnrollmentSelectedStoreID", (const char *)-[__CFString cStringUsingEncoding:](v12, "cStringUsingEncoding:", 4));
  if (v9)
  {
    v13 = objc_retainAutorelease(v9);
    xpc_dictionary_set_data(v10, "AutoEnrollmentHelpMenuUserTapped", (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
  }
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v16 = xpc_connection_send_message_with_reply_sync(v15, v10);

    v17 = xpc_dictionary_get_BOOL(v16, "Result");
  }
  else
  {
    defaultLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(AutoEnrollmentResult) sendAutoEnrollmentResult:withStoreId:withHelpMenuRowSelection:].cold.1(v16, v19, v20, v21, v22, v23, v24, v25);
    v17 = 0;
  }

  return v17;
}

- (BOOL)sendAutoEnrollmentAbortEvent:(id)a3 countryCode:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  xpc_object_t v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "RequestOperation", "AutoEnrollmentAbortEvent");
  if (v6)
    v9 = v6;
  else
    v9 = &stru_24D0AE900;
  v10 = objc_retainAutorelease(v9);
  xpc_dictionary_set_string(v8, "AutoEnrollmentAbortLanguageCodeInfo", (const char *)-[__CFString cStringUsingEncoding:](v10, "cStringUsingEncoding:", 4));
  if (v7)
    v11 = v7;
  else
    v11 = &stru_24D0AE900;
  v12 = objc_retainAutorelease(v11);
  xpc_dictionary_set_string(v8, "AutoEnrollmentAbortCountryCodeInfo", (const char *)-[__CFString cStringUsingEncoding:](v12, "cStringUsingEncoding:", 4));
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v15 = xpc_connection_send_message_with_reply_sync(v14, v8);

    v16 = xpc_dictionary_get_BOOL(v15, "Result");
  }
  else
  {
    defaultLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(AutoEnrollmentResult) sendAutoEnrollmentAbortEvent:countryCode:].cold.1(v15, v18, v19, v20, v21, v22, v23, v24);
    v16 = 0;
  }

  return v16;
}

- (BOOL)setLastShallowRefreshTime:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  xpc_object_t v8;
  id v9;
  void *v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  BOOL v13;

  v4 = (objc_class *)MEMORY[0x24BDD1500];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setDateFormat:", CFSTR("dd-MM-yyyy_HH:mm:ss:SSS"));
  objc_msgSend(v6, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "RequestOperation", "SetLastShallowRefreshTime");
  v9 = objc_retainAutorelease(v7);
  xpc_dictionary_set_string(v8, "LastShallowRefreshTime", (const char *)objc_msgSend(v9, "cStringUsingEncoding:", 4));
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v12 = xpc_connection_send_message_with_reply_sync(v11, v8);

    v13 = xpc_dictionary_get_BOOL(v12, "Result");
  }
  else
  {
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(SetLastShallowRefreshTime) setLastShallowRefreshTime:].cold.1(v12);
    v13 = 0;
  }

  return v13;
}

- (void)setDelegate:(id)a3
{
  _xpc_connection_s *v5;

  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    -[MSDKManagedDevice setupConnection](self, "setupConnection");
  }
  else
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v5);

    -[MSDKManagedDevice setConnection:](self, "setConnection:", 0);
  }
}

- (MSDKManagedDeviceDelegate)delegate
{
  return (MSDKManagedDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)setSEPDemoMode:(BOOL)a3
{
  xpc_object_t v5;
  void *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "SetSEPDemoMode");
  xpc_dictionary_set_BOOL(v5, "SEPDemoMode", a3);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    v9 = xpc_dictionary_get_BOOL(v8, "Result");
  }
  else
  {
    defaultLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice setSEPDemoMode:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
    v9 = 0;
  }

  return v9;
}

- (BOOL)prepare
{
  return -[MSDKManagedDevice _prepareWithOptions:](self, "_prepareWithOptions:", 0);
}

- (BOOL)enterOfflineModeWithOptions:(id)a3 error:(id *)a4
{
  xpc_object_t v6;
  void *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  BOOL v10;
  id v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported", a3))
  {
    safeAssignError(a4, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v6 = 0;
    v9 = 0;
    v11 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "RequestOperation", "EnterOfflineMode");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v8, v6);

    v10 = xpc_dictionary_get_BOOL(v9, "Acknowledged");
    v11 = 0;
    if (a4)
    {
LABEL_4:
      v11 = objc_retainAutorelease(v11);
      *a4 = v11;
    }
  }
  else
  {
    v21 = 0;
    safeAssignError(&v21, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v11 = v21;
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice enterOfflineModeWithOptions:error:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    v9 = 0;
    v10 = 0;
    if (a4)
      goto LABEL_4;
  }
LABEL_6:

  return v10;
}

- (BOOL)isOfflineMode:(id *)a3
{
  NSObject *v5;
  xpc_object_t v6;
  void *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  id v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[MSDKManagedDevice isOfflineMode:]";
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
  }

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "QueryDeviceInfo", "MSDDeviceInOfflineMode");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v8, v6);

    LOBYTE(v10) = xpc_dictionary_get_BOOL(v9, "QueryDeviceInfoResult")
               && xpc_dictionary_get_BOOL(v9, "MSDDeviceInOfflineMode");
  }
  else
  {
    v21 = 0;
    safeAssignError(&v21, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v10 = v21;
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice isOfflineMode:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    if (v10)
    {
      v20 = objc_retainAutorelease(v10);
      *a3 = v20;

      LOBYTE(v10) = 0;
    }
    v9 = 0;
  }

  return (char)v10;
}

- (BOOL)prepareWithWiFi:(id)a3 password:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("SSID");
  v11[1] = CFSTR("Password");
  v12[0] = a3;
  v12[1] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = -[MSDKManagedDevice _prepareWithOptions:](self, "_prepareWithOptions:", v9);
  return (char)v8;
}

- (BOOL)isEnrolled
{
  return -[MSDKManagedDevice _isEnrolled:checkDemo:](self, "_isEnrolled:checkDemo:", 0, 0);
}

- (BOOL)isEnrolled:(id *)a3
{
  return -[MSDKManagedDevice _isEnrolled:checkDemo:](self, "_isEnrolled:checkDemo:", a3, 1);
}

- (BOOL)isContentFrozen_xpc
{
  return -[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:](self, "_isContentFrozen_xpc:checkDemo:", 0, 0);
}

- (BOOL)isContentFrozen:(id *)a3
{
  return -[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:](self, "_isContentFrozen_xpc:checkDemo:", a3, 1);
}

- (unint64_t)typeOfDemoDevice
{
  return -[MSDKManagedDevice _typeOfDemoDevice:checkDemo:](self, "_typeOfDemoDevice:checkDemo:", 0, 0);
}

- (unint64_t)typeOfDemoDevice:(id *)a3
{
  return -[MSDKManagedDevice _typeOfDemoDevice:checkDemo:](self, "_typeOfDemoDevice:checkDemo:", a3, 1);
}

- (int64_t)getDemoInstallState
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  int64_t int64;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    v3 = 0;
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "QueryDeviceInfo", "MSDDemoDeviceInstallState");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice getDemoInstallState].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    goto LABEL_6;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

  if (!xpc_dictionary_get_BOOL(v6, "QueryDeviceInfoResult"))
  {
LABEL_7:
    int64 = 0;
    goto LABEL_8;
  }
  int64 = xpc_dictionary_get_int64(v6, "MSDDemoDeviceInstallState");
LABEL_8:

  return int64;
}

- (BOOL)isContentFrozen
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.plist"));

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.demo-settings.plist"));

  return v6 && -[MSDKManagedDevice inferContentFrozenFromPreferencesFile](self, "inferContentFrozenFromPreferencesFile");
}

- (BOOL)lockDemoContent
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "Demo");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice lockDemoContent].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (BOOL)unlockDemoContent
{
  return -[MSDKManagedDevice _unlockDemoContentWithOptions:outError:](self, "_unlockDemoContentWithOptions:outError:", 0, 0);
}

- (BOOL)revertDemoContent
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "DemoSnapshotRevert");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice revertDemoContent].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (BOOL)commitNewDemoContent
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "DemoSnapshotCommit");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice commitNewDemoContent].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (BOOL)unenroll:(BOOL)a3
{
  void *v4;
  BOOL v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("ObliterateDevice"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = -[MSDKManagedDevice _unenrollWithOptions:outError:](self, "_unenrollWithOptions:outError:", v4, 0);

  return v5;
}

- (id)getDeviceOptions
{
  return -[MSDKManagedDevice _getDeviceOptions:checkDemo:](self, "_getDeviceOptions:checkDemo:", 0, 0);
}

- (id)getDeviceOptions:(id *)a3
{
  return -[MSDKManagedDevice _getDeviceOptions:checkDemo:](self, "_getDeviceOptions:checkDemo:", a3, 1);
}

- (id)getStoreType:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[MSDKManagedDevice _getDeviceOptions:checkDemo:](self, "_getDeviceOptions:checkDemo:", a3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("store_type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      safeAssignError(a3, 3727744773, (uint64_t)CFSTR("Invalid device options."));
  }
  else
  {
    safeAssignErrorNoOverwrite(a3, 3727744768, CFSTR("An error has occurred."));
    v6 = 0;
  }

  return v6;
}

- (id)getStoreID
{
  return -[MSDKManagedDevice _getStoreID:checkDemo:](self, "_getStoreID:checkDemo:", 0, 0);
}

- (id)getStoreID:(id *)a3
{
  return -[MSDKManagedDevice _getStoreID:checkDemo:](self, "_getStoreID:checkDemo:", a3, 1);
}

- (id)getFriendlyDeviceName
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  _BOOL4 v7;
  const char *string;
  void *v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    v3 = 0;
LABEL_7:
    v6 = 0;
    v9 = 0;
    goto LABEL_8;
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "QueryDeviceInfo", "MSDFriendlyDeviceName");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice getFriendlyDeviceName].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    goto LABEL_7;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

  v7 = xpc_dictionary_get_BOOL(v6, "QueryDeviceInfoResult");
  string = xpc_dictionary_get_string(v6, "MSDFriendlyDeviceName");
  v9 = 0;
  if (v7 && string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v9;
}

- (BOOL)setStoreOpenAt:(int64_t)a3 openMinute:(int64_t)a4 closeHour:(int64_t)a5 closeMinute:(int64_t)a6
{
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  BOOL v14;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _xpc_connection_s *v19;
  xpc_object_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 136315138;
    v32 = "-[MSDKManagedDevice setStoreOpenAt:openMinute:closeHour:closeMinute:]";
    _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v31, 0xCu);
  }

  if (-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    if ((unint64_t)a3 < 0x18)
    {
      if ((unint64_t)a5 < 0x18)
      {
        if ((unint64_t)a4 < 0x3C)
        {
          if ((unint64_t)a6 < 0x3C)
          {
            v12 = xpc_dictionary_create(0, 0, 0);
            xpc_dictionary_set_string(v12, "RequestOperation", "SetStoreHour");
            xpc_dictionary_set_int64(v12, "OpenHour", a3);
            xpc_dictionary_set_int64(v12, "OpenMinute", a4);
            xpc_dictionary_set_int64(v12, "CloseHour", a5);
            xpc_dictionary_set_int64(v12, "CloseMinute", a6);
            -[MSDKManagedDevice setupConnection](self, "setupConnection");
            -[MSDKManagedDevice connection](self, "connection");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            defaultLogHandle();
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = v17;
            if (v16)
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v31) = 0;
                _os_log_impl(&dword_213A7E000, v18, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: sending xpc...", (uint8_t *)&v31, 2u);
              }

              -[MSDKManagedDevice connection](self, "connection");
              v19 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
              v20 = xpc_connection_send_message_with_reply_sync(v19, v12);

              defaultLogHandle();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v31) = 0;
                _os_log_impl(&dword_213A7E000, v21, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: received response from xpc...", (uint8_t *)&v31, 2u);
              }

              defaultLogHandle();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                v23 = MEMORY[0x2199BBD28](v20);
                v31 = 136315138;
                v32 = (const char *)v23;
                _os_log_impl(&dword_213A7E000, v22, OS_LOG_TYPE_DEFAULT, "xpc dictionary from reply: %s", (uint8_t *)&v31, 0xCu);
              }

              v14 = xpc_dictionary_get_BOOL(v20, "Result");
              goto LABEL_19;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              -[MSDKManagedDevice setStoreOpenAt:openMinute:closeHour:closeMinute:].cold.1(v18, v24, v25, v26, v27, v28, v29, v30);

          }
          else
          {
            defaultLogHandle();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v31) = 0;
              v13 = "Close minute out of range.";
              goto LABEL_17;
            }
          }
        }
        else
        {
          defaultLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v31) = 0;
            v13 = "Open minute out of range.";
            goto LABEL_17;
          }
        }
      }
      else
      {
        defaultLogHandle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v31) = 0;
          v13 = "Close hour out of range.";
          goto LABEL_17;
        }
      }
    }
    else
    {
      defaultLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31) = 0;
        v13 = "Open hour out of range.";
LABEL_17:
        _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v31, 2u);
      }
    }
    v14 = 0;
LABEL_19:

    return v14;
  }
  return 0;
}

- (BOOL)setIdleDelay:(int64_t)a3
{
  NSObject *v5;
  xpc_object_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315138;
    v24 = "-[MSDKManagedDevice setIdleDelay:]";
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v23, 0xCu);
  }

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "RequestOperation", "SetScreenSaverIdleDelay");
  xpc_dictionary_set_int64(v6, "IdleDelay", a3);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_213A7E000, v9, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: sending xpc...", (uint8_t *)&v23, 2u);
    }

    -[MSDKManagedDevice connection](self, "connection");
    v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v10, v6);

    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: received response from xpc...", (uint8_t *)&v23, 2u);
    }

    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = MEMORY[0x2199BBD28](v9);
      v23 = 136446210;
      v24 = (const char *)v13;
      _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, "xpc dictionary from reply: %{public}s", (uint8_t *)&v23, 0xCu);
    }

    v14 = xpc_dictionary_get_BOOL(v9, "Result");
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice setIdleDelay:].cold.1(v9, v16, v17, v18, v19, v20, v21, v22);
    v14 = 0;
  }

  return v14;
}

- (BOOL)configureWiFi:(id)a3 password:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  void *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  if (-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "RequestOperation", "ConfigureWiFi");
    xpc_dictionary_set_string(v8, "SSID", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    if (v7)
      xpc_dictionary_set_string(v8, "Password", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    -[MSDKManagedDevice setupConnection](self, "setupConnection");
    -[MSDKManagedDevice connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[MSDKManagedDevice connection](self, "connection");
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v11 = xpc_connection_send_message_with_reply_sync(v10, v8);

      v12 = xpc_dictionary_get_BOOL(v11, "Result");
    }
    else
    {
      defaultLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice configureWiFi:password:].cold.1(v11, v14, v15, v16, v17, v18, v19, v20);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)disconnectAndForgetWiFi:(id *)a3
{
  xpc_object_t v5;
  void *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  BOOL v9;
  id v10;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    safeAssignError(a3, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v5 = 0;
    v8 = 0;
    v10 = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "DisconnectAndForgetWiFi");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v20 = 0;
    safeAssignError(&v20, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v10 = v20;
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice disconnectAndForgetWiFi:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    if (a3)
    {
      v10 = objc_retainAutorelease(v10);
      v8 = 0;
      v9 = 0;
      *a3 = v10;
      goto LABEL_6;
    }
    v8 = 0;
    goto LABEL_5;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

  v9 = xpc_dictionary_get_BOOL(v8, "Result");
  v10 = 0;
LABEL_6:

  return v9;
}

- (BOOL)setDeviceLanguage:(id)a3 andRegion:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  void *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  if (-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "RequestOperation", "SetLanguageAndRegion");
    xpc_dictionary_set_string(v8, "languageIdentifier", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    xpc_dictionary_set_string(v8, "regionCode", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    -[MSDKManagedDevice setupConnection](self, "setupConnection");
    -[MSDKManagedDevice connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[MSDKManagedDevice connection](self, "connection");
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v11 = xpc_connection_send_message_with_reply_sync(v10, v8);

      v12 = xpc_dictionary_get_BOOL(v11, "Result");
    }
    else
    {
      defaultLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice setDeviceLanguage:andRegion:].cold.1(v11, v14, v15, v16, v17, v18, v19, v20);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)getDeviceLanguageandRegion
{
  NSObject *v3;
  xpc_object_t v4;
  void *v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[MSDKManagedDevice getDeviceLanguageandRegion]";
    _os_log_impl(&dword_213A7E000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", buf, 0xCu);
  }

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "RequestOperation", "GetLanguageAndRegion");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(v7, "languageIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", xpc_dictionary_get_string(v7, "regionCode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = CFSTR("languageIdentifier");
    v19[1] = CFSTR("regionCode");
    v20[0] = v8;
    v20[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice getDeviceLanguageandRegion].cold.1(v7, v12, v13, v14, v15, v16, v17, v18);
    v10 = 0;
  }

  return v10;
}

- (BOOL)saveBluetoothPairingInfo
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "SaveBTPairingInfo");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Result");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice saveBluetoothPairingInfo].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (BOOL)checkInBlockingUI
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "UICheckIn");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice checkInBlockingUI].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (BOOL)cancelOperation
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "Cancel");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Acknowledged");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice cancelOperation].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (BOOL)isStoreOpen:(id *)a3
{
  xpc_object_t v5;
  void *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  id v13;
  NSObject *v14;
  id v15;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "IsStoreOpen");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    v9 = xpc_dictionary_get_BOOL(v8, "ResultData");
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MSDKManagedDevice isStoreOpen:].cold.2(v9, v10);

    v11 = 0;
    if (a3)
      *a3 = 0;
  }
  else
  {
    v15 = 0;
    safeAssignError(&v15, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v13 = v15;
    v11 = v13;
    if (a3)
    {
      v11 = objc_retainAutorelease(v13);
      *a3 = v11;
      if (v11)
      {
        defaultLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[MSDKManagedDevice isStoreOpen:].cold.1(a3);

      }
    }
    v8 = 0;
    v9 = 0;
  }

  return v9;
}

- (id)nextStoreOpenDate:(id *)a3
{
  xpc_object_t v5;
  void *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "NextStoreOpenDate");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithXPCDictionary:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("Result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("NextStoreHour"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        defaultLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[MSDKManagedDevice nextStoreOpenDate:].cold.2();

        v14 = 0;
        if (a3)
          *a3 = 0;
        goto LABEL_9;
      }
      v18 = 0;
      safeAssignError(&v18, 3727744768, (uint64_t)CFSTR("Invalid value for nextStoreOpenDate returned by demod"));
      v14 = v18;
    }
    else
    {
      v19 = 0;
      objc_msgSend(v6, "objectForKey:", CFSTR("ErrorMessage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      safeAssignError(&v19, 3727744515, (uint64_t)v16);
      v14 = v19;

    }
  }
  else
  {
    v20 = 0;
    safeAssignError(&v20, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v14 = v20;
    v10 = 0;
    v8 = 0;
  }
  if (a3)
  {
    v14 = objc_retainAutorelease(v14);
    *a3 = v14;
    if (v14)
    {
      defaultLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice nextStoreOpenDate:].cold.1(a3);

    }
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)nextStoreCloseDate:(id *)a3
{
  xpc_object_t v5;
  void *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "NextStoreCloseDate");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithXPCDictionary:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("Result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("NextStoreHour"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        defaultLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[MSDKManagedDevice nextStoreCloseDate:].cold.2();

        v14 = 0;
        if (a3)
          *a3 = 0;
        goto LABEL_9;
      }
      v18 = 0;
      safeAssignError(&v18, 3727744768, (uint64_t)CFSTR("Invalid value for nextStoreCloseDate returned by demod"));
      v14 = v18;
    }
    else
    {
      v19 = 0;
      objc_msgSend(v6, "objectForKey:", CFSTR("ErrorMessage"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      safeAssignError(&v19, 3727744515, (uint64_t)v16);
      v14 = v19;

    }
  }
  else
  {
    v20 = 0;
    safeAssignError(&v20, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v14 = v20;
    v10 = 0;
    v8 = 0;
  }
  if (a3)
  {
    v14 = objc_retainAutorelease(v14);
    *a3 = v14;
    if (v14)
    {
      defaultLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice nextStoreCloseDate:].cold.1(a3);

    }
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (void)updateStoreHours:(id)a3 evaluateAgainstDate:(id)a4
{
  id v6;
  void *v7;
  xpc_object_t v8;
  double v9;
  double v10;
  void *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  NSObject *v14;
  id v15;

  v6 = a4;
  objc_msgSend(a3, "xpcArrayFromArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "RequestOperation", "UpdateStoreHours");
  xpc_dictionary_set_value(v8, "RawStoreHours", v7);
  objc_msgSend(v6, "timeIntervalSince1970");
  v10 = v9;

  xpc_dictionary_set_date(v8, "EvaluateAgainstDate", (uint64_t)v10);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v13 = xpc_connection_send_message_with_reply_sync(v12, v8);

    if (xpc_dictionary_get_BOOL(v13, "Result"))
      goto LABEL_6;
  }
  else
  {
    v15 = 0;
    safeAssignError(&v15, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));

    v13 = 0;
  }
  defaultLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[MSDKManagedDevice updateStoreHours:evaluateAgainstDate:].cold.1();

LABEL_6:
}

- (BOOL)storeDataBlob:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  _xpc_connection_s *v11;
  xpc_object_t v12;
  BOOL v13;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    v13 = 0;
    goto LABEL_11;
  }
  if (!v4)
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice storeDataBlob:].cold.1();
    goto LABEL_21;
  }
  if ((unint64_t)objc_msgSend(v4, "length") > 0x400000)
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice storeDataBlob:].cold.2(v4, v7);
    goto LABEL_21;
  }
  -[MSDKManagedDevice getCacheIdentifier](self, "getCacheIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  defaultLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice storeDataBlob:].cold.3();
    goto LABEL_21;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543618;
    v24 = v5;
    v25 = 2048;
    v26 = objc_msgSend(v4, "length");
    _os_log_impl(&dword_213A7E000, v7, OS_LOG_TYPE_DEFAULT, "uniqueIdentifier:%{public}@ %lu", (uint8_t *)&v23, 0x16u);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "RequestOperation", "StoreDataBlob");
  v8 = objc_retainAutorelease(v5);
  xpc_dictionary_set_string(v7, "ContainerUniqueIdentifier", (const char *)objc_msgSend(v8, "UTF8String"));
  v9 = objc_retainAutorelease(v4);
  xpc_dictionary_set_data(v7, "PersistentDataBlob", (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    defaultLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice storeDataBlob:].cold.4(v15, v16, v17, v18, v19, v20, v21, v22);

LABEL_21:
    v13 = 0;
    goto LABEL_9;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v12 = xpc_connection_send_message_with_reply_sync(v11, v7);

  v13 = xpc_dictionary_get_BOOL(v12, "Acknowledged");
LABEL_9:

LABEL_11:
  return v13;
}

- (id)retrieveDataBlob
{
  id v3;
  xpc_object_t v4;
  void *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  void *v8;
  const void *bytes_ptr;
  size_t length;
  void *v11;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    v4 = 0;
    v7 = 0;
    v8 = 0;
    v3 = 0;
    goto LABEL_9;
  }
  -[MSDKManagedDevice getCacheIdentifier](self, "getCacheIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = 0;
LABEL_8:
    v7 = 0;
    v8 = 0;
    goto LABEL_9;
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "RequestOperation", "RetrieveSavedDataBlob");
  v3 = objc_retainAutorelease(v3);
  xpc_dictionary_set_string(v4, "ContainerUniqueIdentifier", (const char *)objc_msgSend(v3, "UTF8String"));
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    defaultLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice retrieveDataBlob].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    goto LABEL_8;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

  xpc_dictionary_get_value(v7, "SavedDataBlob");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  bytes_ptr = xpc_data_get_bytes_ptr(v8);
  length = xpc_data_get_length(v8);
  if (!length)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", bytes_ptr, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (BOOL)deleteDataBlob
{
  uint64_t v3;
  void *v4;
  xpc_object_t v5;
  NSObject *v6;
  void *v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  -[MSDKManagedDevice getCacheIdentifier](self, "getCacheIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "DeleteDataBlob");
  v6 = objc_retainAutorelease(v4);
  xpc_dictionary_set_string(v5, "ContainerUniqueIdentifier", (const char *)-[NSObject UTF8String](v6, "UTF8String"));
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v8, v5);

    v10 = xpc_dictionary_get_BOOL(v9, "Acknowledged");
    v11 = v6;
    v6 = v9;
  }
  else
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice deleteDataBlob].cold.1(v11, v13, v14, v15, v16, v17, v18, v19);
    v10 = 0;
  }

  return v10;
}

- (id)getPersistentWiFiSsid
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("PersistentWiFiSSID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:](self, "_getCurrentNetworkInfoForKeys:outError:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("PersistentWiFiSSID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isDigitalSecurityEnabled
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[MSDKManagedDevice isDigitalSecurityEnabled]";
    _os_log_impl(&dword_213A7E000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v8, 0xCu);
  }

  -[MSDKManagedDevice _readOwnershipWarningFromNvram](self, "_readOwnershipWarningFromNvram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_9;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[MSDKManagedDevice isDigitalSecurityEnabled]";
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "%s - ownershipWarning:  %{public}@", (uint8_t *)&v8, 0x16u);
  }

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("1")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("2")) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
LABEL_9:
    v6 = 0;
  }

  return v6;
}

- (BOOL)needOwnershipWarning:(id *)a3
{
  return -[MSDKManagedDevice _needOwnershipWarning:error:](self, "_needOwnershipWarning:error:", a3, 0);
}

- (BOOL)clearOwnershipWarning
{
  NSObject *v3;
  void *v4;
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[MSDKManagedDevice clearOwnershipWarning]";
    _os_log_impl(&dword_213A7E000, v3, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v19, 0xCu);
  }

  -[MSDKManagedDevice readNVRam:](self, "readNVRam:", CFSTR("ownership-warning"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "command", "deleteNvram:");
    xpc_dictionary_set_string(v5, "payload", (const char *)objc_msgSend(CFSTR("ownership-warning"), "cStringUsingEncoding:", 4));
    -[MSDKManagedDevice setupHelperConnection](self, "setupHelperConnection");
    -[MSDKManagedDevice helperConnection](self, "helperConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: sending xpc...", (uint8_t *)&v19, 2u);
      }

      -[MSDKManagedDevice helperConnection](self, "helperConnection");
      v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v8 = xpc_connection_send_message_with_reply_sync(v9, v5);

      v10 = xpc_dictionary_get_BOOL(v8, "result");
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice clearOwnershipWarning].cold.1(v8, v12, v13, v14, v15, v16, v17, v18);
      v10 = 0;
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (id)saveStoreHour:(id)a3
{
  id v3;
  NSObject *v4;
  int64_t int64;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  xpc_object_t reply;
  int64_t v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[MSDKManagedDevice saveStoreHour:]";
    _os_log_impl(&dword_213A7E000, v4, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", buf, 0xCu);
  }

  int64 = xpc_dictionary_get_int64(v3, "OpenHour");
  v6 = xpc_dictionary_get_int64(v3, "OpenMinute");
  v20 = xpc_dictionary_get_int64(v3, "CloseHour");
  v7 = xpc_dictionary_get_int64(v3, "CloseMinute");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", int64);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, CFSTR("Hour"), v11, CFSTR("Minute"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v12, CFSTR("StoreOpenAt"));
  v13 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithObjectsAndKeys:", v14, CFSTR("Hour"), v15, CFSTR("Minute"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("StoreCloseAt"));
  objc_msgSend(v8, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"), 1);
  defaultLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[MSDKManagedDevice saveStoreHour:]";
    _os_log_impl(&dword_213A7E000, v17, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s will return", buf, 0xCu);
  }

  reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_set_BOOL(reply, "Result", 1);

  return reply;
}

- (id)saveScreenSaverIdleDelay:(id)a3
{
  id v3;
  NSObject *v4;
  int64_t int64;
  void *v6;
  void *v7;
  NSObject *v8;
  xpc_object_t reply;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDKManagedDevice saveScreenSaverIdleDelay:]";
    _os_log_impl(&dword_213A7E000, v4, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", (uint8_t *)&v11, 0xCu);
  }

  int64 = xpc_dictionary_get_int64(v3, "IdleDelay");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", int64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("IdleDelayInMinutes"));

  objc_msgSend(v6, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"), 1);
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDKManagedDevice saveScreenSaverIdleDelay:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s will return", (uint8_t *)&v11, 0xCu);
  }

  reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_set_BOOL(reply, "Result", 1);

  return reply;
}

- (id)getScreenSaverConfig
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"));
}

- (BOOL)saveScreenSaverConfig:(id)a3
{
  objc_msgSend(a3, "writeToFile:atomically:", CFSTR("/var/mobile/Library/Preferences/com.apple.MobileStoreDemo.ScreenSaverConfig.plist"), 1);
  return 1;
}

- (BOOL)setupConnection:(id)a3 withMachService:(id)a4
{
  id v6;
  id v7;
  MSDKManagedDevice *v8;
  void *v9;
  _xpc_connection_s *mach_service;
  id v11;
  _xpc_connection_s *v12;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  MSDKManagedDevice *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[MSDKManagedDevice valueForKey:](v8, "valueForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4), 0, 0);
    -[MSDKManagedDevice setValue:forKey:](v8, "setValue:forKey:", mach_service, v6);
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke;
    v19 = &unk_24D0ADD40;
    v20 = v8;
    v11 = v6;
    v21 = v11;
    xpc_connection_set_event_handler(mach_service, &v16);
    if (mach_service)
    {
      -[MSDKManagedDevice valueForKey:](v8, "valueForKey:", v11, v16, v17, v18, v19, v20);
      v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_resume(v12);

    }
  }
  objc_sync_exit(v8);

  -[MSDKManagedDevice valueForKey:](v8, "valueForKey:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 != 0;

  return v14;
}

void __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  uint8_t buf[2];

  v3 = a2;
  v4 = MEMORY[0x2199BBE54]();
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_3(v4, v5, v6);

  defaultLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_2((uint64_t)v3, v7);

  if (v4 == MEMORY[0x24BDACFB8])
  {
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", 0, *(_QWORD *)(a1 + 40));
    if (v3 == (id)MEMORY[0x24BDACF38])
    {
      defaultLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "XPC_ERROR_CONNECTION_INVALID";
        v10 = buf;
        goto LABEL_14;
      }
    }
    else
    {
      if (v3 != (id)MEMORY[0x24BDACF30])
        goto LABEL_16;
      defaultLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 0;
        v9 = "XPC_ERROR_CONNECTION_INTERRUPTED";
        v10 = (uint8_t *)&v11;
LABEL_14:
        _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      }
    }

    goto LABEL_16;
  }
  if (v4 != MEMORY[0x24BDACFA0])
    __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 32), "handleMessage:", v3);
LABEL_16:

}

- (BOOL)setupConnection
{
  return -[MSDKManagedDevice setupConnection:withMachService:](self, "setupConnection:withMachService:", CFSTR("connection"), CFSTR("com.apple.mobilestoredemod"));
}

- (BOOL)setupHelperConnection
{
  return -[MSDKManagedDevice setupConnection:withMachService:](self, "setupConnection:withMachService:", CFSTR("helperConnection"), CFSTR("com.apple.mobilestoredemodhelper"));
}

- (void)handleMessage:(id)a3
{
  const char *string;
  id v5;

  v5 = a3;
  string = xpc_dictionary_get_string(v5, "ContentUpdateStatus");
  if (string)
    -[MSDKManagedDevice handleContentUpdateStatus:event:](self, "handleContentUpdateStatus:event:", string, v5);

}

- (void)handleContentUpdateStatus:(const char *)a3 event:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  int v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  _QWORD v39[5];
  _QWORD applier[5];
  uint8_t v41[4];
  uint64_t v42;
  _BYTE buf[24];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!strncmp(a3, "Error", 6uLL))
  {
    -[MSDKManagedDevice errorWithXPCDictionary:](self, "errorWithXPCDictionary:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v10;
      _os_log_impl(&dword_213A7E000, v9, OS_LOG_TYPE_DEFAULT, "Received an error: %{public}@", buf, 0xCu);

    }
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v8;
      _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "Will call didReceiveError with %{public}@", buf, 0xCu);
    }

    -[MSDKManagedDevice delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      -[MSDKManagedDevice delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "didReceiveError:", v8);

    }
  }
  else
  {
    if (!strncmp(a3, "Progress", 9uLL))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v44 = 0;
      defaultLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[MSDKManagedDevice handleContentUpdateStatus:event:].cold.1();

      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __53__MSDKManagedDevice_handleContentUpdateStatus_event___block_invoke;
      applier[3] = &unk_24D0ADD68;
      applier[4] = buf;
      xpc_dictionary_apply(v6, applier);
      defaultLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
        *(_DWORD *)v41 = 134217984;
        v42 = v17;
        _os_log_impl(&dword_213A7E000, v16, OS_LOG_TYPE_DEFAULT, "Will call didReceiveProgress with %td", v41, 0xCu);
      }

      -[MSDKManagedDevice delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_opt_respondsToSelector();

      if ((v19 & 1) != 0)
      {
        -[MSDKManagedDevice delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "didReceiveProgress:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));

      }
      goto LABEL_29;
    }
    if (strncmp(a3, "Completed", 0xAuLL))
    {
      if (strncmp(a3, "AllowContentUpdateCancel", 0x19uLL))
      {
        defaultLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = a3;
          _os_log_impl(&dword_213A7E000, v7, OS_LOG_TYPE_DEFAULT, "Unkown message from xpc: %{public}s", buf, 0xCu);
        }

        goto LABEL_30;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v44) = 0;
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __53__MSDKManagedDevice_handleContentUpdateStatus_event___block_invoke_157;
      v39[3] = &unk_24D0ADD68;
      v39[4] = buf;
      xpc_dictionary_apply(v6, v39);
      defaultLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
        *(_DWORD *)v41 = 67109120;
        LODWORD(v42) = v29;
        _os_log_impl(&dword_213A7E000, v28, OS_LOG_TYPE_DEFAULT, "Will call didReceiveAllowCancel with %d", v41, 8u);
      }

      -[MSDKManagedDevice delegate](self, "delegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) != 0)
      {
        -[MSDKManagedDevice delegate](self, "delegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "didReceiveAllowCancel:", *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24));

      }
LABEL_29:
      _Block_object_dispose(buf, 8);
LABEL_30:
      v8 = 0;
      goto LABEL_31;
    }
    -[MSDKManagedDevice errorWithXPCDictionary:](self, "errorWithXPCDictionary:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    defaultLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v8)
    {
      if (v22)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213A7E000, v21, OS_LOG_TYPE_DEFAULT, "Will call operationCompleted.", buf, 2u);
      }

      -[MSDKManagedDevice delegate](self, "delegate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_opt_respondsToSelector();

      -[MSDKManagedDevice delegate](self, "delegate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if ((v34 & 1) != 0)
      {
        objc_msgSend(v35, "blockingStateChanged:", 0);

      }
      else
      {
        v37 = objc_opt_respondsToSelector();

        if ((v37 & 1) != 0)
        {
          -[MSDKManagedDevice delegate](self, "delegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "operationCompleted");

        }
      }
      goto LABEL_30;
    }
    if (v22)
    {
      v23 = objc_msgSend(v8, "code");
      objc_msgSend(v8, "localizedDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v24;
      _os_log_impl(&dword_213A7E000, v21, OS_LOG_TYPE_DEFAULT, "Will call operationFailed: with error %tx:%{public}@.", buf, 0x16u);

    }
    -[MSDKManagedDevice delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[MSDKManagedDevice delegate](self, "delegate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "operationFailed:", v8);

    }
  }
LABEL_31:

}

uint64_t __53__MSDKManagedDevice_handleContentUpdateStatus_event___block_invoke(uint64_t a1, char *__s1, void *a3)
{
  if (!strncmp(__s1, "Percentage", 0xBuLL))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_int64_get_value(a3);
  return 1;
}

uint64_t __53__MSDKManagedDevice_handleContentUpdateStatus_event___block_invoke_157(uint64_t a1, char *__s1, void *a3)
{
  if (!strncmp(__s1, "allowCancel", 0xCuLL))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_BOOL_get_value(a3);
  return 1;
}

- (id)errorWithXPCDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD applier[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __44__MSDKManagedDevice_errorWithXPCDictionary___block_invoke;
  applier[3] = &unk_24D0ADD90;
  applier[4] = &v20;
  applier[5] = &v14;
  applier[6] = &v8;
  xpc_dictionary_apply(v3, applier);
  v4 = v21[3];
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v15[5], v4, v9[5]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v5;
}

uint64_t __44__MSDKManagedDevice_errorWithXPCDictionary___block_invoke(_QWORD *a1, const char *a2, void *a3)
{
  id v5;
  const char *string_ptr;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  if (!strncmp(a2, "ErrorCode", 0xAuLL))
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = xpc_int64_get_value(v5);
  }
  else if (!strncmp(a2, "ErrorDomain", 0xCuLL))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", xpc_string_get_string_ptr(v5), 4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else if (strncmp(a2, "ContentUpdateStatus", 0x14uLL))
  {
    string_ptr = xpc_string_get_string_ptr(v5);
    if (string_ptr)
    {
      v7 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", string_ptr, 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2, 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v8, v9);

    }
  }

  return 1;
}

- (BOOL)inferContentFrozenFromPreferencesFile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  int v8;
  BOOL v9;

  +[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("demo-install-state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[MSDPreferencesFile sharedInstance](MSDPreferencesFile, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("device_options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("disable_snapshot_mode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = objc_msgSend(v3, "integerValue") == 5;
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
    if (!v6)
    {
LABEL_8:
      LOBYTE(v8) = 1;
      goto LABEL_9;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v8 = objc_msgSend(v6, "BOOLValue") ^ 1;
LABEL_9:
  v9 = v7 & v8;

  return v9;
}

- (id)getCacheIdentifier
{
  void *v2;
  void *v3;
  const void *v4;
  const void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (const void *)MGCopyAnswer();
    if (v4)
    {
      v5 = v4;
      if (CFEqual(v4, CFSTR("Internal")))
      {
        objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "processName");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v3 = 0;
      }
      CFRelease(v5);
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)readNVRam:(id)a3
{
  __CFString *v3;
  io_registry_entry_t v4;
  io_object_t v5;
  void *CFProperty;
  mach_port_t mainPort;

  v3 = (__CFString *)a3;
  mainPort = 0;
  if (IOMasterPort(*MEMORY[0x24BDAD2F0], &mainPort))
  {
    NSLog(CFSTR("Couldn't locate bootstrap_port mach port"));
LABEL_7:
    CFProperty = 0;
    goto LABEL_4;
  }
  v4 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v4)
  {
    NSLog(CFSTR("Couldn't locate options node in IODeviceTree"));
    goto LABEL_7;
  }
  v5 = v4;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, v3, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  IOObjectRelease(v5);
LABEL_4:

  return CFProperty;
}

- (BOOL)_prepareWithOptions:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    goto LABEL_4;
  if (v4)
  {
    objc_msgSend(v4, "createXPCDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_4:
      v6 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v5 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_dictionary_set_string(v5, "RequestOperation", "DemoPrepare");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v8, v5);

    v6 = xpc_dictionary_get_BOOL(v9, "DemoPrepareAcknowledged");
  }
  else
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _prepareWithOptions:].cold.1(v9, v11, v12, v13, v14, v15, v16, v17);
    v6 = 0;
  }

LABEL_9:
  return v6;
}

- (BOOL)_isEnrolled:(id *)a3 checkDemo:(BOOL)a4
{
  _BOOL4 v4;
  MSDKManagedDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  _xpc_connection_s *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[MSDKManagedDevice _isEnrolled:checkDemo:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MSDKManagedDevice isDeviceClassSupported](v6, "isDeviceClassSupported"))
  {
    safeAssignError(a3, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    LOBYTE(a3) = 0;
    goto LABEL_7;
  }
  -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a3) = objc_msgSend(v11, "BOOLValue");

    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[MSDKManagedDevice _isEnrolled:checkDemo:]";
      v41 = 1024;
      v42 = (int)a3;
      _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, "%s - Found cached result: %d", buf, 0x12u);
    }

    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_7;
  }
  if (v4)
  {
    +[MSDKDemoState sharedInstance](MSDKDemoState, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v19 = objc_msgSend(v18, "_isDeviceEnrolledWithDeKOTA:", &v38);
    v13 = v38;

    if (v13)
    {
      v16 = 0;
LABEL_20:
      if (a3)
      {
        v13 = objc_retainAutorelease(v13);
        v14 = 0;
        v15 = 0;
        v32 = a3;
        LOBYTE(a3) = 0;
        *v32 = v13;
      }
      else
      {
        v14 = 0;
        v15 = 0;
      }
      goto LABEL_7;
    }
    if ((v19 & 1) == 0)
    {
      defaultLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v40 = "-[MSDKManagedDevice _isEnrolled:checkDemo:]";
        _os_log_impl(&dword_213A7E000, v33, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
      }

      v15 = 0;
      v16 = 0;
      goto LABEL_26;
    }
  }
  defaultLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[MSDKManagedDevice _isEnrolled:checkDemo:]";
    _os_log_impl(&dword_213A7E000, v20, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
  }

  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "QueryDeviceInfo", "MSDDemoDeviceManaged");
  -[MSDKManagedDevice setupConnection](v6, "setupConnection");
  -[MSDKManagedDevice connection](v6, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21 == 0;

  if (v22)
  {
    v37 = 0;
    safeAssignError(&v37, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v13 = v37;
    defaultLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _isEnrolled:checkDemo:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

    goto LABEL_20;
  }
  -[MSDKManagedDevice connection](v6, "connection");
  v23 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v15 = xpc_connection_send_message_with_reply_sync(v23, v16);

  if (!xpc_dictionary_get_BOOL(v15, "QueryDeviceInfoResult"))
  {
LABEL_26:
    a3 = 0;
    goto LABEL_27;
  }
  a3 = (id *)xpc_dictionary_get_BOOL(v15, "MSDDemoDeviceManaged");
LABEL_27:
  v14 = (void *)MAEGetActivationStateWithError();
  v13 = 0;
  if (!v13 && v14)
  {
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE66A50]))
    {
      defaultLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v40 = "-[MSDKManagedDevice _isEnrolled:checkDemo:]";
        v41 = 1024;
        v42 = (int)a3;
        _os_log_impl(&dword_213A7E000, v34, OS_LOG_TYPE_DEFAULT, "%s - caching value %d", buf, 0x12u);
      }

      -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v36, v7);

    }
    v13 = 0;
  }
LABEL_7:

  objc_sync_exit(v6);
  return (char)a3;
}

- (BOOL)_isContentFrozen_xpc:(id *)a3 checkDemo:(BOOL)a4
{
  _BOOL4 v4;
  MSDKManagedDevice *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  _BOOL4 v20;
  _xpc_connection_s *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v4 = a4;
  v41 = *MEMORY[0x24BDAC8D0];
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MSDKManagedDevice isDeviceClassSupported](v6, "isDeviceClassSupported"))
  {
    safeAssignError(a3, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v13 = 0;
    v14 = 0;
    v15 = 0;
LABEL_7:
    LOBYTE(a3) = 0;
    goto LABEL_30;
  }
  -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(a3) = objc_msgSend(v11, "BOOLValue");

    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]";
      v39 = 1024;
      v40 = (int)a3;
      _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, "%s - Found cached result: %d", buf, 0x12u);
    }

    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_30;
  }
  if (v4)
  {
    +[MSDKDemoState sharedInstance](MSDKDemoState, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v17 = objc_msgSend(v16, "_isDeviceEnrolledWithDeKOTA:", &v36);
    v13 = v36;

    if (v13)
    {
      v15 = 0;
LABEL_20:
      if (!a3)
      {
        v14 = 0;
        goto LABEL_30;
      }
      v13 = objc_retainAutorelease(v13);
      v14 = 0;
      *a3 = v13;
      goto LABEL_7;
    }
    if ((v17 & 1) == 0)
    {
      defaultLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v38 = "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]";
        _os_log_impl(&dword_213A7E000, v30, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
      }

      v14 = 0;
      v15 = 0;
      goto LABEL_26;
    }
  }
  defaultLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]";
    _os_log_impl(&dword_213A7E000, v18, OS_LOG_TYPE_DEFAULT, "%s - making XPC call", buf, 0xCu);
  }

  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "QueryDeviceInfo", "MSDDemoDeviceFrozen");
  -[MSDKManagedDevice setupConnection](v6, "setupConnection");
  -[MSDKManagedDevice connection](v6, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
  {
    v35 = 0;
    safeAssignError(&v35, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v13 = v35;
    defaultLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    goto LABEL_20;
  }
  -[MSDKManagedDevice connection](v6, "connection");
  v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v14 = xpc_connection_send_message_with_reply_sync(v21, v15);

  if (!xpc_dictionary_get_BOOL(v14, "QueryDeviceInfoResult"))
  {
LABEL_26:
    a3 = 0;
    goto LABEL_27;
  }
  a3 = (id *)xpc_dictionary_get_BOOL(v14, "MSDDemoDeviceFrozen");
LABEL_27:
  defaultLogHandle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "-[MSDKManagedDevice _isContentFrozen_xpc:checkDemo:]";
    v39 = 1024;
    v40 = (int)a3;
    _os_log_impl(&dword_213A7E000, v31, OS_LOG_TYPE_DEFAULT, "%s - caching value %d", buf, 0x12u);
  }

  -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKey:", v33, v7);

  v13 = 0;
LABEL_30:

  objc_sync_exit(v6);
  return (char)a3;
}

- (unint64_t)_typeOfDemoDevice:(id *)a3 checkDemo:(BOOL)a4
{
  _BOOL4 v4;
  MSDKManagedDevice *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  uint64_t uint64;
  id v16;
  xpc_object_t v17;
  void *v19;
  _BOOL4 v20;
  _xpc_connection_s *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v4 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", buf, 0xCu);
  }

  if (!-[MSDKManagedDevice isDeviceClassSupported](v6, "isDeviceClassSupported"))
  {
    safeAssignError(a3, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v16 = 0;
    a3 = 0;
    v17 = 0;
    goto LABEL_9;
  }
  -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    defaultLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    uint64 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]";
      v38 = 2048;
      v39 = v13;
      _os_log_impl(&dword_213A7E000, v14, OS_LOG_TYPE_DEFAULT, "%s - Found cached result: %lu", buf, 0x16u);
    }

    v16 = 0;
    a3 = 0;
    v17 = 0;
    goto LABEL_10;
  }
  if (!v4 || (MGGetBoolAnswer() & 1) != 0)
  {
    v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v17, "QueryDeviceInfo", "MSDTypeOfDemoDevice");
    -[MSDKManagedDevice setupConnection](v6, "setupConnection");
    -[MSDKManagedDevice connection](v6, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 == 0;

    if (v20)
    {
      v35 = 0;
      safeAssignError(&v35, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
      v16 = v35;
      defaultLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice _typeOfDemoDevice:checkDemo:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

      if (a3)
      {
        v16 = objc_retainAutorelease(v16);
        uint64 = 0;
        *a3 = v16;
        a3 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      -[MSDKManagedDevice connection](v6, "connection");
      v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      a3 = (id *)xpc_connection_send_message_with_reply_sync(v21, v17);

      if (xpc_dictionary_get_BOOL(a3, "QueryDeviceInfoResult"))
      {
        uint64 = xpc_dictionary_get_uint64(a3, "MSDTypeOfDemoDevice");
        if (uint64 != 1)
        {
          v16 = 0;
          goto LABEL_10;
        }
        goto LABEL_21;
      }
      v16 = 0;
    }
LABEL_9:
    uint64 = 0;
    goto LABEL_10;
  }
  defaultLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]";
    _os_log_impl(&dword_213A7E000, v22, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
  }

  v17 = 0;
  a3 = 0;
LABEL_21:
  v23 = (void *)MAEGetActivationStateWithError();
  v16 = 0;
  if (!v16 && v23 && objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BE66A50]))
  {
    defaultLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[MSDKManagedDevice _typeOfDemoDevice:checkDemo:]";
      v38 = 2048;
      v39 = 1;
      _os_log_impl(&dword_213A7E000, v24, OS_LOG_TYPE_DEFAULT, "%s - caching value %lu", buf, 0x16u);
    }

    -[MSDKManagedDevice xpc_cache](v6, "xpc_cache");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, v7);

  }
  uint64 = 1;
LABEL_10:

  objc_sync_exit(v6);
  return uint64;
}

- (BOOL)_unlockDemoContentWithOptions:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  xpc_object_t v9;
  BOOL v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;

  v6 = a3;
  if (-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    if (v6)
    {
      objc_msgSend(v6, "createXPCDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v23 = 0;
        safeAssignError(&v23, 3727744769, (uint64_t)CFSTR("Input is invalid"));
        v8 = v23;
        goto LABEL_14;
      }
    }
    else
    {
      v7 = xpc_dictionary_create(0, 0, 0);
    }
    xpc_dictionary_set_string(v7, "RequestOperation", "DemoMaualUpdate");
    -[MSDKManagedDevice setupConnection](self, "setupConnection");
    -[MSDKManagedDevice connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v22 = 0;
      safeAssignError(&v22, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
      v8 = v22;
      defaultLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice _unlockDemoContentWithOptions:outError:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

LABEL_14:
      v9 = 0;
      v10 = 0;
      if (!a4)
        goto LABEL_10;
      goto LABEL_9;
    }
    -[MSDKManagedDevice connection](self, "connection");
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v12, v7);

    v10 = xpc_dictionary_get_BOOL(v9, "Acknowledged");
    v8 = 0;
    if (a4)
    {
LABEL_9:
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
  }
  else
  {
    v7 = 0;
    v9 = 0;
    v8 = 0;
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (BOOL)_unenrollWithOptions:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  xpc_object_t v9;
  BOOL v10;
  void *v11;
  _xpc_connection_s *v12;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;

  v6 = a3;
  if (-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    if (v6)
    {
      objc_msgSend(v6, "createXPCDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        v23 = 0;
        safeAssignError(&v23, 3727744769, (uint64_t)CFSTR("Input is invalid"));
        v8 = v23;
        goto LABEL_14;
      }
    }
    else
    {
      v7 = xpc_dictionary_create(0, 0, 0);
    }
    xpc_dictionary_set_string(v7, "RequestOperation", "Virgin");
    -[MSDKManagedDevice setupConnection](self, "setupConnection");
    -[MSDKManagedDevice connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v22 = 0;
      safeAssignError(&v22, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
      v8 = v22;
      defaultLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MSDKManagedDevice _unenrollWithOptions:outError:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

LABEL_14:
      v9 = 0;
      v10 = 0;
      if (!a4)
        goto LABEL_10;
      goto LABEL_9;
    }
    -[MSDKManagedDevice connection](self, "connection");
    v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v12, v7);

    v10 = xpc_dictionary_get_BOOL(v9, "Acknowledged");
    v8 = 0;
    if (a4)
    {
LABEL_9:
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
  }
  else
  {
    safeAssignError(a4, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    v7 = 0;
    v9 = 0;
    v8 = 0;
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (id)_getDeviceOptions:(id *)a3 checkDemo:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  char v8;
  char *v9;
  NSObject *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  void *v13;
  void *v14;
  _xpc_connection_s *v15;
  const char *string;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x24BDAC8D0];
  if (-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    if (!v4)
      goto LABEL_13;
    +[MSDKDemoState sharedInstance](MSDKDemoState, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v8 = objc_msgSend(v7, "_isDeviceEnrolledWithDeKOTA:", &v29);
    v9 = (char *)v29;

    if (!v9 && (v8 & 1) == 0)
    {
      defaultLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[MSDKManagedDevice _getDeviceOptions:checkDemo:]";
        _os_log_impl(&dword_213A7E000, v10, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
      }

      goto LABEL_9;
    }
    if (v9)
    {
      v11 = 0;
      v12 = 0;
    }
    else
    {
LABEL_13:
      v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v12, "RequestOperation", "GetDeviceOptions");
      -[MSDKManagedDevice setupConnection](self, "setupConnection");
      -[MSDKManagedDevice connection](self, "connection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[MSDKManagedDevice connection](self, "connection");
        v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        v11 = xpc_connection_send_message_with_reply_sync(v15, v12);

        string = xpc_dictionary_get_string(v11, "device_options");
        v9 = (char *)string;
        if (string)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", string, strlen(string));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v17, 0, &v27);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (char *)v27;

          goto LABEL_21;
        }
      }
      else
      {
        v28 = 0;
        safeAssignError(&v28, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
        v9 = (char *)v28;
        defaultLogHandle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[MSDKManagedDevice _getDeviceOptions:checkDemo:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

        v11 = 0;
      }
    }
    if (a3)
    {
      v9 = objc_retainAutorelease(v9);
      v13 = 0;
      *a3 = v9;
      goto LABEL_21;
    }
    goto LABEL_10;
  }
  safeAssignError(a3, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
LABEL_9:
  v11 = 0;
  v9 = 0;
  v12 = 0;
LABEL_10:
  v13 = 0;
LABEL_21:

  return v13;
}

- (id)_getCurrentNetworkInfoForKeys:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  xpc_object_t empty;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  void *v18;
  _xpc_connection_s *v19;
  xpc_object_t v20;
  id v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("CurrentWiFiSSID"), CFSTR("PersistentWiFiSSID"), CFSTR("EmbeddedSIMInstalled"), CFSTR("ActiveNetworkInterface"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    safeAssignError(a4, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:].cold.5(v10, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_19;
  }
  if (!v6
    || (objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isSubsetOfSet:", v7),
        v8,
        (v9 & 1) == 0))
  {
    safeAssignError(a4, 3727744769, (uint64_t)CFSTR("Input is invalid"));
    defaultLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:].cold.1(v10, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_19;
  }
  v63 = a4;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "RequestOperation", "GetCurrentNetworkInfo");
  empty = xpc_array_create_empty();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v65;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v65 != v15)
          objc_enumerationMutation(v12);
        v17 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v16)), "UTF8String"));
        xpc_array_append_value(empty, v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    }
    while (v14);
  }

  xpc_dictionary_set_value(v10, "NetworkInfoKeys", empty);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    safeAssignError(v63, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    defaultLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:].cold.2(v40, v41, v42, v43, v44, v45, v46, v47);

    goto LABEL_19;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v19 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v20 = xpc_connection_send_message_with_reply_sync(v19, v10);

  if (v20 == (xpc_object_t)MEMORY[0x24BDACF38] || !v20 || v20 == (xpc_object_t)MEMORY[0x24BDACF30])
  {
    safeAssignError(v63, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    defaultLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:].cold.3(v48, v49, v50, v51, v52, v53, v54, v55);
    goto LABEL_30;
  }
  v21 = objc_alloc(MEMORY[0x24BDBCE70]);
  xpc_dictionary_get_value(v20, "Result");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithXPCDictionary:", v22);

  if (!v23)
  {
    safeAssignError(v63, 3727741189, (uint64_t)CFSTR("Unexpected demod xpc response."));
    defaultLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _getCurrentNetworkInfoForKeys:outError:].cold.4(v48, v56, v57, v58, v59, v60, v61, v62);
LABEL_30:

LABEL_19:
    v24 = 0;
    goto LABEL_20;
  }
  v24 = v23;

  v10 = v24;
LABEL_20:

  return v24;
}

- (id)_getStoreID:(id *)a3 checkDemo:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  xpc_object_t v11;
  xpc_object_t v12;
  void *v13;
  void *v14;
  _xpc_connection_s *v15;
  const char *string;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
  {
    safeAssignError(a3, 3727741188, (uint64_t)CFSTR("Device is unsupported by MobileStoreDemoKit."));
LABEL_9:
    v11 = 0;
    v9 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  if (v4)
  {
    +[MSDKDemoState sharedInstance](MSDKDemoState, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v8 = objc_msgSend(v7, "_isDeviceEnrolledWithDeKOTA:", &v27);
    v9 = v27;

    if (!v9 && (v8 & 1) == 0)
    {
      defaultLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[MSDKManagedDevice _getStoreID:checkDemo:]";
        _os_log_impl(&dword_213A7E000, v10, OS_LOG_TYPE_DEFAULT, "%s - Device is not demo device", buf, 0xCu);
      }

      goto LABEL_9;
    }
    if (v9)
    {
      v11 = 0;
      v12 = 0;
      if (!a3)
        goto LABEL_10;
LABEL_18:
      v9 = objc_retainAutorelease(v9);
      v13 = 0;
      *a3 = v9;
      goto LABEL_19;
    }
  }
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "RequestOperation", "GetDeviceOptions");
  xpc_dictionary_set_string(v12, "SubKey", (const char *)objc_msgSend(CFSTR("store_id"), "UTF8String"));
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v26 = 0;
    safeAssignError(&v26, 3727741186, (uint64_t)CFSTR("Failed to establish xpc connection to demod."));
    v9 = v26;
    defaultLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice _getStoreID:checkDemo:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    v11 = 0;
    if (!a3)
      goto LABEL_10;
    goto LABEL_18;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v11 = xpc_connection_send_message_with_reply_sync(v15, v12);

  string = xpc_dictionary_get_string(v11, (const char *)objc_msgSend(CFSTR("store_id"), "UTF8String"));
  if (string)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_19;
  }
  v9 = 0;
  if (a3)
    goto LABEL_18;
LABEL_10:
  v13 = 0;
LABEL_19:

  return v13;
}

- (id)_readOwnershipWarningFromNvram
{
  void *v2;
  void *v3;

  -[MSDKManagedDevice readNVRam:](self, "readNVRam:", CFSTR("ownership-warning"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", objc_msgSend(objc_retainAutorelease(v2), "bytes"), 4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_needOwnershipWarning:(id *)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[MSDKManagedDevice _needOwnershipWarning:error:]";
    _os_log_impl(&dword_213A7E000, v7, OS_LOG_TYPE_DEFAULT, "MobileStoreDemoKit: %s called.", buf, 0xCu);
  }

  v8 = (void *)MAEGetActivationStateWithError();
  v9 = 0;
  if (!v9
    && v8
    && ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE66A50]) & 1) != 0
     || (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE66A58]) & 1) != 0))
  {
    v10 = 0;
LABEL_8:
    v11 = 0;
    goto LABEL_17;
  }
  -[MSDKManagedDevice _readOwnershipWarningFromNvram](self, "_readOwnershipWarningFromNvram");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_18;
  defaultLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[MSDKManagedDevice _needOwnershipWarning:error:]";
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, "%s - ownershipWarning:  %{public}@", buf, 0x16u);
  }

  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("1")) & 1) == 0
    && !objc_msgSend(v10, "isEqualToString:", CFSTR("2")))
  {
LABEL_18:
    if (a4)
    {
      v11 = 0;
      *a4 = objc_retainAutorelease(v9);
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  if (a3)
  {
    +[MSDLocalization getLocalizedOwnershipWarnings:](MSDLocalization, "getLocalizedOwnershipWarnings:", v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = 1;
LABEL_17:

  return v11;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_xpc_object)helperConnection
{
  return self->_helperConnection;
}

- (void)setHelperConnection:(id)a3
{
  objc_storeStrong((id *)&self->_helperConnection, a3);
}

- (NSMutableDictionary)xpc_cache
{
  return self->_xpc_cache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpc_cache, 0);
  objc_storeStrong((id *)&self->_helperConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)stashCurrentWallpaperSettingsIfNeeded
{
  return -[MSDKManagedDevice _manageWallpaperSettingsWithAction:](self, "_manageWallpaperSettingsWithAction:", "Stash");
}

- (BOOL)restoreWallpaperSettingsIfNeeded
{
  return -[MSDKManagedDevice _manageWallpaperSettingsWithAction:](self, "_manageWallpaperSettingsWithAction:", "Restore");
}

- (BOOL)_manageWallpaperSettingsWithAction:(const char *)a3
{
  xpc_object_t v5;
  void *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  BOOL v9;

  if (!-[MSDKManagedDevice isDeviceClassSupported](self, "isDeviceClassSupported"))
    return 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "ManageWallpaperSettings");
  xpc_dictionary_set_string(v5, "Action", a3);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    v9 = xpc_dictionary_get_BOOL(v8, "Result");
  }
  else
  {
    defaultLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(Wallpaper) _manageWallpaperSettingsWithAction:].cold.1(v8);
    v9 = 0;
  }

  return v9;
}

- (id)retrieveXPCConnectionToPeerService
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "SetUpPeerService");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(PeerService) retrieveXPCConnectionToPeerService].cold.1(v6, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_16;
  }
  -[MSDKManagedDevice connection](self, "connection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

  if (MEMORY[0x2199BBE54](v6) == MEMORY[0x24BDACFB8])
  {
    defaultLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(PeerService) retrieveXPCConnectionToPeerService].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_15;
  }
  if (!xpc_dictionary_get_BOOL(v6, "Result"))
  {
    defaultLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(PeerService) retrieveXPCConnectionToPeerService].cold.4(v19, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_15;
  }
  xpc_dictionary_get_value(v6, "PeerServiceXPCEndpoint");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    defaultLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(PeerService) retrieveXPCConnectionToPeerService].cold.3(v19, v34, v35, v36, v37, v38, v39, v40);
LABEL_15:

LABEL_16:
    v10 = 0;
    goto LABEL_6;
  }
  v8 = (void *)v7;
  v9 = objc_alloc_init(MEMORY[0x24BDD19A0]);
  -[NSObject _setEndpoint:](v9, "_setEndpoint:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v9);

  v6 = v9;
LABEL_6:

  return v10;
}

- (BOOL)refreshDeviceSettings
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "RefreshDeviceSettings");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Result");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(RefreshSettings) refreshDeviceSettings].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (BOOL)initializeDeviceSettingsWithOverwrite:(BOOL)a3
{
  xpc_object_t v5;
  void *v6;
  _xpc_connection_s *v7;
  NSObject *v8;
  BOOL v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "RequestOperation", "InitializeDeviceSettings");
  xpc_dictionary_set_BOOL(v5, "InitializeSettingsOverwrite", a3);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v8 = xpc_connection_send_message_with_reply_sync(v7, v5);

    v9 = xpc_dictionary_get_BOOL(v8, "Result");
  }
  else
  {
    defaultLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(RefreshSettings) initializeDeviceSettingsWithOverwrite:].cold.1(v8, v11, v12, v13, v14, v15, v16, v17);
    v9 = 0;
  }

  return v9;
}

- (void)launchApp:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  _xpc_connection_s *v17;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    defaultLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(Test) launchApp:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  xpc_dictionary_set_string(v5, "RequestOperation", "LaunchApp");
  v15 = objc_retainAutorelease(v4);
  v16 = (const char *)objc_msgSend(v15, "UTF8String");

  xpc_dictionary_set_string(v5, "BundleID", v16);
  -[MSDKManagedDevice connection](self, "connection");
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v17, v5);

}

- (BOOL)reloadDemodsPreferencesFile
{
  xpc_object_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _xpc_connection_s *v13;
  xpc_object_t v14;

  v3 = xpc_dictionary_create(0, 0, 0);
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    defaultLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(Test) reloadDemodsPreferencesFile].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  xpc_dictionary_set_string(v3, "RequestOperation", "ReloadDemodsPreferencesFile");
  -[MSDKManagedDevice connection](self, "connection");
  v13 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v14 = xpc_connection_send_message_with_reply_sync(v13, v3);

  LOBYTE(v13) = xpc_dictionary_get_BOOL(v14, "Result");
  return (char)v13;
}

- (BOOL)clearCurrentSafariHistory
{
  xpc_object_t v3;
  void *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  BOOL v7;

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "RequestOperation", "ClearSafariHistory");
  -[MSDKManagedDevice setupConnection](self, "setupConnection");
  -[MSDKManagedDevice connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MSDKManagedDevice connection](self, "connection");
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_send_message_with_reply_sync(v5, v3);

    v7 = xpc_dictionary_get_BOOL(v6, "Result");
  }
  else
  {
    defaultLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MSDKManagedDevice(ClearSafariHistory) clearCurrentSafariHistory].cold.1(v6);
    v7 = 0;
  }

  return v7;
}

- (void)setSEPDemoMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)enterOfflineModeWithOptions:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isOfflineMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getDemoInstallState
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)lockDemoContent
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)revertDemoContent
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)commitNewDemoContent
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isBetterTogetherDemoDevice
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getFriendlyDeviceName
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setStoreOpenAt:(uint64_t)a3 openMinute:(uint64_t)a4 closeHour:(uint64_t)a5 closeMinute:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setIdleDelay:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)configureWiFi:(uint64_t)a3 password:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)disconnectAndForgetWiFi:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setDeviceLanguage:(uint64_t)a3 andRegion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getDeviceLanguageandRegion
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)saveBluetoothPairingInfo
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)checkInBlockingUI
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)cancelOperation
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isStoreOpen:(id *)a1 .cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_1(&dword_213A7E000, v2, v3, "%s - %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

- (void)isStoreOpen:(char)a1 .cold.2(char a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[MSDKManagedDevice isStoreOpen:]";
  v4 = 1024;
  v5 = a1 & 1;
  _os_log_debug_impl(&dword_213A7E000, a2, OS_LOG_TYPE_DEBUG, "%s - result :%d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)nextStoreOpenDate:(id *)a1 .cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_1(&dword_213A7E000, v2, v3, "%s - %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

- (void)nextStoreOpenDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_1(&dword_213A7E000, v0, v1, "%s Date: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)nextStoreCloseDate:(id *)a1 .cold.1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_1(&dword_213A7E000, v2, v3, "%s - %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7_0();
}

- (void)nextStoreCloseDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_7_1(&dword_213A7E000, v0, v1, "%s Date: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)updateStoreHours:evaluateAgainstDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Failed to update demod's saved store hours", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)storeDataBlob:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "there is no data to store.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)storeDataBlob:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 134217984;
  v4 = objc_msgSend(a1, "length");
  _os_log_error_impl(&dword_213A7E000, a2, OS_LOG_TYPE_ERROR, "Data store size requested (%lu) is greater than MAX limit", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_7_0();
}

- (void)storeDataBlob:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "Could not create a valid unique identifier.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)storeDataBlob:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)retrieveDataBlob
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)deleteDataBlob
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)clearOwnershipWarning
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_1()
{
  __assert_rtn("-[MSDKManagedDevice setupConnection:withMachService:]_block_invoke", "MSDKManagedDevice.m", 1964, "type == XPC_TYPE_DICTIONARY");
}

void __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 136446210;
  v5 = MEMORY[0x2199BBD28]();
  OUTLINED_FUNCTION_8_1(&dword_213A7E000, a2, v3, "description of xpc reply: %{public}s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7_0();
}

void __53__MSDKManagedDevice_setupConnection_withMachService___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_8_1(&dword_213A7E000, a2, a3, "XPC type is %{public}@\n", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)handleContentUpdateStatus:event:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_213A7E000, v0, OS_LOG_TYPE_DEBUG, "Receiving a progress", v1, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_prepareWithOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_isEnrolled:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_isContentFrozen_xpc:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_typeOfDemoDevice:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_unlockDemoContentWithOptions:(uint64_t)a3 outError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_unenrollWithOptions:(uint64_t)a3 outError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getDeviceOptions:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Received nil array or invalid key.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to send XPC message.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to extract network info from XPC response.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getCurrentNetworkInfoForKeys:(uint64_t)a3 outError:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Device class is not supported.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_getStoreID:(uint64_t)a3 checkDemo:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s - Failed to setup XPC connection.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
