@implementation BLTSettingSync

- (BLTSettingSync)initWithSectionConfiguration:(id)a3 queue:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[BLTSettingSync initWithSectionConfiguration:queue:]", "BLTSettingSync.m", 89, "0");
}

- (BLTSettingSync)initWithSectionConfiguration:(id)a3 queue:(id)a4 watchKitAppList:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLTSettingSync *v11;
  BLTSettingSync *v12;
  uint64_t v13;
  NSMutableDictionary *reloadBBCompletions;
  BLTMuteSync *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *sectionInfoSyncCoordinatorQueue;
  BLTSettingSyncSendQueue *v19;
  BLTSettingSyncSendQueue *settingSendQueue;
  BLTSettingSyncSendQueue *v21;
  uint64_t v22;
  id v23;
  BLTSettingSyncSendQueue *v24;
  BLTSettingSyncSendQueue *v25;
  BLTSettingSyncSendQueue *v26;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)BLTSettingSync;
  v11 = -[BLTSettingSyncInternal initWithSectionConfiguration:queue:](&v38, sel_initWithSectionConfiguration_queue_, v8, v9);
  v12 = v11;
  if (v11)
  {
    -[BLTSettingSyncInternal connect](v11, "connect");
    if (initWithSectionConfiguration_queue_watchKitAppList__onceToken != -1)
      dispatch_once(&initWithSectionConfiguration_queue_watchKitAppList__onceToken, &__block_literal_global_17);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    reloadBBCompletions = v12->_reloadBBCompletions;
    v12->_reloadBBCompletions = (NSMutableDictionary *)v13;

    objc_storeStrong((id *)&v12->_watchKitAppList, a5);
    v15 = objc_alloc_init(BLTMuteSync);
    -[BLTSettingSyncInternal setMuteSync:](v12, "setMuteSync:", v15);
    objc_msgSend(v8, "setDelegate:", v12);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.bulletindistributor.sectionInfoSyncCoordinator", v16);
    sectionInfoSyncCoordinatorQueue = v12->_sectionInfoSyncCoordinatorQueue;
    v12->_sectionInfoSyncCoordinatorQueue = (OS_dispatch_queue *)v17;

    -[BLTSettingSync _initSettingSyncSendQueueMaxConcurrentSendCount](v12, "_initSettingSyncSendQueueMaxConcurrentSendCount");
    v19 = -[BLTSettingSyncSendQueue initWithMaxConcurrentSendCount:]([BLTSettingSyncSendQueue alloc], "initWithMaxConcurrentSendCount:", v12->_settingSyncSendQueueMaxConcurrentSendCount);
    settingSendQueue = v12->_settingSendQueue;
    v12->_settingSendQueue = v19;

    -[BLTSettingSyncSendQueue setIconAllowList:](v12->_settingSendQueue, "setIconAllowList:", sectionParameterSubtypeIconSectionIDAllowList);
    objc_initWeak(&location, v12);
    v21 = v12->_settingSendQueue;
    v22 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2;
    v35[3] = &unk_24D763618;
    objc_copyWeak(&v36, &location);
    -[BLTSettingSyncSendQueue setSectionParametersProvider:](v21, "setSectionParametersProvider:", v35);
    v28 = v9;
    v23 = v10;
    v24 = v12->_settingSendQueue;
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_4;
    v33[3] = &unk_24D7636E0;
    objc_copyWeak(&v34, &location);
    -[BLTSettingSyncSendQueue setSectionInfoSender:](v24, "setSectionInfoSender:", v33);
    v25 = v12->_settingSendQueue;
    v31[0] = v22;
    v31[1] = 3221225472;
    v31[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_5;
    v31[3] = &unk_24D763730;
    objc_copyWeak(&v32, &location);
    -[BLTSettingSyncSendQueue setSectionIconSender:](v25, "setSectionIconSender:", v31);
    v26 = v12->_settingSendQueue;
    v29[0] = v22;
    v29[1] = 3221225472;
    v29[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2_21;
    v29[3] = &unk_24D763758;
    objc_copyWeak(&v30, &location);
    -[BLTSettingSyncSendQueue setSectionRemoveSender:](v26, "setSectionRemoveSender:", v29);
    -[BLTSettingSync _spoolInitialSync](v12, "_spoolInitialSync");
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

    v10 = v23;
    v9 = v28;
  }

  return v12;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke()
{
  void *v0;

  v0 = (void *)sectionParameterSubtypeIconSectionIDAllowList;
  sectionParameterSubtypeIconSectionIDAllowList = (uint64_t)&unk_24D7864F0;

}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "observer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_3;
  v10[3] = &unk_24D7635F0;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "getParametersForSectionID:withCompletion:", v6, v10);

}

uint64_t __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_4(uint64_t a1, void *a2, void *a3, char a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 *v24;
  char v25;
  _QWORD v26[4];
  id v27;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a5;
  v14 = (void *)MEMORY[0x219A0BFAC]();
  blt_settings_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_INFO, "Sending info %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v30 = 0x2020000000;
  v31 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_12;
  v26[3] = &unk_24D763668;
  v27 = v12;
  p_buf = &buf;
  v21[0] = v18;
  v21[1] = 3221225472;
  v21[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_3_15;
  v21[3] = &unk_24D7636B8;
  v19 = v27;
  v22 = v19;
  v20 = v13;
  v25 = a4;
  v23 = v20;
  v24 = &buf;
  objc_msgSend(v17, "setSectionInfo:withSent:withAcknowledgement:keypaths:spoolToFile:", v11, v26, v21, 0, a6);

  if (v20 && (a4 & 1) == 0)
    (*((void (**)(id, uint64_t, uint64_t))v20 + 2))(v20, 1, 1);

  _Block_object_dispose(&buf, 8);
  objc_autoreleasePoolPop(v14);

}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_12(uint64_t a1, char a2)
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2_13;
  v3[3] = &unk_24D763640;
  v2 = *(NSObject **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = a2;
  dispatch_async(v2, v3);
}

uint64_t __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2_13(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(result + 40);
  return result;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_3_15(uint64_t a1, char a2)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  char v10;
  char v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_4_16;
  block[3] = &unk_24D763690;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v10 = *(_BYTE *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  v11 = a2;
  dispatch_async(v4, block);

}

uint64_t __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_4_16(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (*(_BYTE *)(a1 + 48))
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned __int8 *)(a1 + 49));
  }
  return result;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_5(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, char a6, void *a7, char a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id WeakRetained;
  void *v21;
  id v22;
  uint64_t v23;
  void *context;
  _QWORD v25[4];
  id v26;
  char v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v15 = a2;
  v16 = a3;
  v17 = a5;
  v18 = a7;
  context = (void *)MEMORY[0x219A0BFAC]();
  blt_settings_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v16;
    v30 = 2048;
    v31 = a4;
    _os_log_impl(&dword_2173D9000, v19, OS_LOG_TYPE_INFO, "Sending section icon for section %@, subtype %ld", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_19;
  v25[3] = &unk_24D763708;
  v22 = v18;
  v26 = v22;
  v27 = a6;
  LOBYTE(v23) = a8;
  objc_msgSend(v21, "setSectionSubtypeParametersIcon:forSectionID:forSubtypeID:withQueue:withSent:withAcknowledgement:spoolToFile:", v15, v16, a4, v17, 0, v25, v23);

  if (v22 && (a6 & 1) == 0)
    (*((void (**)(id, uint64_t))v22 + 2))(v22, 1);

  objc_autoreleasePoolPop(context);
}

uint64_t __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    if (*(_BYTE *)(a1 + 40))
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __69__BLTSettingSync_initWithSectionConfiguration_queue_watchKitAppList___block_invoke_2_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  blt_settings_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_INFO, "Sending remove section %@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeSectionWithSectionID:sent:", v5, v6);

}

- (void)_storeSyncState:(unint64_t)a3
{
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  void *v7;
  uint64_t v8;
  __int16 v9;

  if (a3 == 1)
  {
    blt_settings_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      v5 = "Storing send sync state";
      v6 = (uint8_t *)&v8;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (!a3)
  {
    blt_settings_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v5 = "Storing idle sync state";
      v6 = (uint8_t *)&v9;
LABEL_7:
      _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("BLTSettingSyncState"), v7, CFSTR("com.apple.bulletindistributor"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));

}

- (unint64_t)_fetchSyncState
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));
  return CFPreferencesGetAppIntegerValue(CFSTR("BLTSettingSyncState"), CFSTR("com.apple.bulletindistributor"), 0);
}

- (unint64_t)_fetchSettingSyncMaxCountOverride
{
  CFIndex AppIntegerValue;
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  unint64_t v12;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  unint64_t v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("BLTSettingSyncSendQueueMaxConcurrentSendCount"), CFSTR("com.apple.bulletindistributor"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    return 2;
  v3 = AppIntegerValue;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("BLTSettingSyncSendQueueMaxConcurrentSendCountTimestamp"), CFSTR("com.apple.bulletindistributor"));
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  blt_settings_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v15 = v3;
    v16 = 2048;
    v17 = v9;
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_2173D9000, v10, OS_LOG_TYPE_INFO, "Found override value: %ld timestamp: %f now: %f", buf, 0x20u);
  }

  if (v6 > v9 + 86400.0)
  {
    CFPreferencesSetAppValue(CFSTR("BLTSettingSyncSendQueueMaxConcurrentSendCount"), 0, CFSTR("com.apple.bulletindistributor"));
    return 2;
  }
  v12 = 4;
  if (v3 < 4)
    v12 = v3;
  if (v12 <= 1)
    return 1;
  else
    return v12;
}

- (void)_initSettingSyncSendQueueMaxConcurrentSendCount
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unint64_t settingSyncSendQueueMaxConcurrentSendCount;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  blt_settings_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_2173D9000, v3, OS_LOG_TYPE_INFO, "Initializing sync send queue max concurrent send count", (uint8_t *)&v10, 2u);
  }

  self->_settingSyncSendQueueMaxConcurrentSendCount = 2;
  if (-[BLTSettingSync _fetchSyncState](self, "_fetchSyncState") == 1)
  {
    blt_settings_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_INFO, "Detected in section info send", (uint8_t *)&v10, 2u);
    }

    CFPreferencesSetAppValue(CFSTR("BLTSettingSyncSendQueueMaxConcurrentSendCount"), &unk_24D7866E0, CFSTR("com.apple.bulletindistributor"));
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    CFPreferencesSetAppValue(CFSTR("BLTSettingSyncSendQueueMaxConcurrentSendCountTimestamp"), v7, CFSTR("com.apple.bulletindistributor"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.bulletindistributor"));
    self->_settingSyncSendQueueMaxConcurrentSendCount = 1;
    -[BLTSettingSync _storeSyncState:](self, "_storeSyncState:", 0);

  }
  else
  {
    self->_settingSyncSendQueueMaxConcurrentSendCount = -[BLTSettingSync _fetchSettingSyncMaxCountOverride](self, "_fetchSettingSyncMaxCountOverride");
  }
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    settingSyncSendQueueMaxConcurrentSendCount = self->_settingSyncSendQueueMaxConcurrentSendCount;
    v10 = 134217984;
    v11 = settingSyncSendQueueMaxConcurrentSendCount;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_INFO, "Sync send queue max concurrent send count set to %lu", (uint8_t *)&v10, 0xCu);
  }

}

- (id)universalSectionIDForSectionID:(id)a3
{
  return -[BLTSectionInfoList universalSectionIDForSectionID:](self->_sectionInfoList, "universalSectionIDForSectionID:", a3);
}

- (void)_setupSectionInfoListWithCompletion:(id)a3
{
  BLTSectionInfoList *sectionInfoList;
  BLTSectionInfoList *v5;
  BLTSectionInfoList *v6;
  BLTSectionInfoListBBProvider *v7;
  void *v8;
  BLTSectionInfoListBBProvider *v9;
  BLTSectionInfoListBridgeProvider *v10;
  void *v11;
  BLTSectionInfoListBridgeProvider *v12;
  BLTSectionInfoListBridgeProvider *bridgeProvider;
  void *v14;
  id v15;

  v15 = a3;
  sectionInfoList = self->_sectionInfoList;
  if (!sectionInfoList)
  {
    v5 = objc_alloc_init(BLTSectionInfoList);
    v6 = self->_sectionInfoList;
    self->_sectionInfoList = v5;

    v7 = [BLTSectionInfoListBBProvider alloc];
    -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[BLTSectionInfoListBBProvider initWithSettingsGateway:](v7, "initWithSettingsGateway:", v8);

    -[BLTSectionInfoList setSectionInfoProvider:](self->_sectionInfoList, "setSectionInfoProvider:", v9);
    v10 = [BLTSectionInfoListBridgeProvider alloc];
    -[BLTSettingSyncInternal sectionConfiguration](self, "sectionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[BLTSectionInfoListBridgeProvider initWithSectionConfiguration:](v10, "initWithSectionConfiguration:", v11);
    bridgeProvider = self->_bridgeProvider;
    self->_bridgeProvider = v12;

    -[BLTSectionInfoList setOverrideProvider:](self->_sectionInfoList, "setOverrideProvider:", self->_bridgeProvider);
    -[BLTSectionInfoList setDelegate:](self->_sectionInfoList, "setDelegate:", self);

    sectionInfoList = self->_sectionInfoList;
  }
  if (!-[BLTSectionInfoList hasLoaded](sectionInfoList, "hasLoaded"))
  {
    -[BLTSectionInfoList reloadWithCompletion:](self->_sectionInfoList, "reloadWithCompletion:", v15);
    goto LABEL_7;
  }
  v14 = v15;
  if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
LABEL_7:
    v14 = v15;
  }

}

- (void)performInitialSyncWithProgress:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "PSY says sync! sectionInfo push!", buf, 2u);
  }

  self->_initialSyncPerformed = 1;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke;
  v11[3] = &unk_24D7637A8;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[BLTSettingSync _setupSectionInfoListWithCompletion:](self, "_setupSectionInfoListWithCompletion:", v11);

}

void __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  BLTWorkQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_2;
  block[3] = &unk_24D7637A8;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id *v6;
  id *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  blt_settings_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_INFO, "Section info list reloaded due to PSY sync; syncing", buf, 2u);
  }

  v3 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsFileSettingSync");
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x24BDAC760];
  if ((v3 & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_3;
    v10[3] = &unk_24D761B98;
    v6 = &v11;
    v11 = *(id *)(a1 + 40);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_4;
    v8[3] = &unk_24D763780;
    v7 = &v9;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_sendSpooledSyncWithCompletion:withProgress:", v10, v8);
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_36;
    v14[3] = &unk_24D761B98;
    v6 = &v15;
    v15 = *(id *)(a1 + 40);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_2_37;
    v12[3] = &unk_24D763780;
    v7 = &v13;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v4, "_updateAllBBSectionsWithCompletion:withProgress:spoolToFile:", v14, v12, 0);
  }

}

uint64_t __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_2_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__BLTSettingSync_performInitialSyncWithProgress_completion___block_invoke_4(uint64_t a1, double a2)
{
  NSObject *v4;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  blt_settings_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a2;
    _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_DEFAULT, "Setting sync completion: %f", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2);
}

- (unint64_t)performSyncIfNeededForSectionID:(id)a3 gizmoSectionInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  _QWORD v16[4];
  id v17;
  BLTSettingSync *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke;
  v16[3] = &unk_24D763820;
  v11 = v9;
  v17 = v11;
  v18 = self;
  v12 = v8;
  v19 = v12;
  v13 = v10;
  v20 = v13;
  v21 = &v22;
  -[BLTSettingSync _setupSectionInfoListWithCompletion:](self, "_setupSectionInfoListWithCompletion:", v16);
  v14 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _BYTE *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(*(id *)(a1 + 32), "mappedSectionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[2] = __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke_2;
    block[3] = &unk_24D7637D0;
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v6 = *(NSObject **)(v4 + 104);
    block[1] = 3221225472;
    block[4] = v4;
    v24 = v5;
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 64);
    v25 = v7;
    v26 = v8;
    v27 = &v28;
    dispatch_sync(v6, block);

  }
  if (!*((_BYTE *)v29 + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "mapSection:map:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "mappedSectionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      v10 = *(void **)(a1 + 48);
    v11 = v10;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "bbSectionInfoForSectionID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = *(_BYTE **)(a1 + 40);
      if (!v9 && v13[112])
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        v14 = *(_QWORD *)(a1 + 56);
        if (v14)
          (*(void (**)(void))(v14 + 16))();
        goto LABEL_18;
      }
      v32 = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v32, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sendSectionInfosWithSectionIDs:completion:spoolToFile:", v19, *(_QWORD *)(a1 + 56), 0);
    }
    else
    {
      blt_settings_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v11;
        _os_log_impl(&dword_2173D9000, v15, (os_log_type_t)0x90u, "Section needs sync but doesn't exist in BB: %@", buf, 0xCu);
      }

      _BLTCaptureBug(CFSTR("SectionInfoDoesNotExist"));
      v16 = (void *)objc_msgSend(*(id *)(a1 + 56), "copy");
      if (v16)
        objc_msgSend(*(id *)(a1 + 40), "_addReloadBBCompletion:sectionID:", v16, v11);
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(void **)(v17 + 72);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke_41;
      v20[3] = &unk_24D7637F8;
      v20[4] = v17;
      v19 = v16;
      v22 = v19;
      v21 = v11;
      objc_msgSend(v18, "reloadBBSection:completion:", v21, v20);

    }
LABEL_18:

  }
  _Block_object_dispose(&v28, 8);
}

void __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke_2(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(a1[4] + 96);
  if (v1)
  {
    v3 = a1[5];
    BLTWorkQueue();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v1, "performSyncForSectionID:queue:completion:", v3, v4, a1[6]);

    if (v5 == 1)
    {
      v6 = 2;
    }
    else
    {
      if (v5 != 3)
      {
LABEL_7:
        *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;
        return;
      }
      v6 = 0;
    }
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
    goto LABEL_7;
  }
}

uint64_t __78__BLTSettingSync_performSyncIfNeededForSectionID_gizmoSectionInfo_completion___block_invoke_41(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_callAndRemoveReloadBBCompletion:sectionID:", *(_QWORD *)(result + 48), *(_QWORD *)(result + 40));
  return result;
}

- (void)_spoolInitialSync
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsFileSettingSync"))
  {
    +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTSettingsSync _spoolInitialSync"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __35__BLTSettingSync__spoolInitialSync__block_invoke;
    v5[3] = &unk_24D761AA8;
    v5[4] = self;
    v6 = v3;
    v4 = v3;
    -[BLTSettingSync _setupSectionInfoListWithCompletion:](self, "_setupSectionInfoListWithCompletion:", v5);

  }
}

void __35__BLTSettingSync__spoolInitialSync__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  BLTWorkQueue();
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__BLTSettingSync__spoolInitialSync__block_invoke_2;
  v4[3] = &unk_24D761AA8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __35__BLTSettingSync__spoolInitialSync__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  blt_settings_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "Section info list reloaded due to spooling section infos to file", buf, 2u);
  }

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__BLTSettingSync__spoolInitialSync__block_invoke_46;
  v4[3] = &unk_24D761AD0;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_updateAllBBSectionsWithCompletion:withProgress:spoolToFile:", v4, 0, 1);

}

- (void)_sendSpooledSyncWithCompletion:(id)a3 withProgress:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  BLTSettingSyncSendQueue *settingSendQueue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  blt_settings_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Sending spooled settings", buf, 2u);
  }

  settingSendQueue = self->_settingSendQueue;
  v15 = v6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke;
  v16[3] = &unk_24D763848;
  v16[4] = self;
  v13 = v7;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_4;
  v14[3] = &unk_24D761B98;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_5;
  v12[3] = &unk_24D763780;
  v10 = v7;
  v11 = v6;
  -[BLTSettingSyncSendQueue sendSpooledRequestsNowWithSender:completion:progress:](settingSendQueue, "sendSpooledRequestsNowWithSender:completion:progress:", v16, v14, v12);

}

void __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_2;
  v12[3] = &unk_24D762330;
  v13 = v5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_3;
  v10[3] = &unk_24D763780;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "sendSpooledRequestsNowWithSent:withAcknowledgement:", v12, v10);

}

uint64_t __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __62__BLTSettingSync__sendSpooledSyncWithCompletion_withProgress___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_sendSyncSupportedAppListWithInstalled:(id)a3 removed:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BLTSettingSyncSendQueue *settingSendQueue;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  BLTSettingSync *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  NSObject *v27;
  BLTSettingSyncSendQueue *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id obj;
  _QWORD block[5];
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  BLTSettingSync *v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BLTWorkQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v6, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    v12 = v10;
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    settingSendQueue = self->_settingSendQueue;
    v48[0] = v11;
    v48[1] = 3221225472;
    v48[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke;
    v48[3] = &unk_24D763870;
    v49 = v9;
    v50 = self;
    v51 = v6;
    v45[0] = v11;
    v45[1] = 3221225472;
    v45[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_51;
    v45[3] = &unk_24D763898;
    v46 = v49;
    v47 = v13;
    v43[0] = v11;
    v43[1] = 3221225472;
    v43[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_2;
    v43[3] = &unk_24D761AA8;
    v43[4] = self;
    v44 = v47;
    v15 = v47;
    -[BLTSettingSyncSendQueue sendEffectiveSectionInfosUsingProvider:count:sectionInfoSendCompleted:completion:progress:spoolToFile:](settingSendQueue, "sendEffectiveSectionInfosUsingProvider:count:sectionInfoSendCompleted:completion:progress:spoolToFile:", v48, v12, v45, v43, &__block_literal_global_54, 0);

  }
  if (objc_msgSend(v7, "count"))
  {
    v32 = v9;
    v16 = dispatch_group_create();
    v17 = (void *)objc_msgSend(v7, "mutableCopy");
    v33 = v7;
    objc_msgSend(v7, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = self;
    -[BLTSettingSync _filteredAlertingSectionIDs:](self, "_filteredAlertingSectionIDs:", v18);
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "minusSet:", v20);
    blt_general_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v20;
      _os_log_impl(&dword_2173D9000, v21, OS_LOG_TYPE_DEFAULT, "Sync supported apps removed but because bundle IDs still alert for notifications, not sending setting/icon removals for %@", buf, 0xCu);
    }
    v31 = (void *)v20;

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v17;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(obj);
          v26 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          dispatch_group_enter(v16);
          blt_general_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v26;
            _os_log_impl(&dword_2173D9000, v27, OS_LOG_TYPE_DEFAULT, "Removing sync supported app %@", buf, 0xCu);
          }

          v28 = v19->_settingSendQueue;
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_55;
          v37[3] = &unk_24D7638E0;
          v38 = v16;
          -[BLTSettingSyncSendQueue sendRemoveSectionWithSectionID:sent:](v28, "sendRemoveSectionWithSectionID:sent:", v26, v37, v31);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v23);
    }

    BLTWorkQueue();
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_2_56;
    block[3] = &unk_24D761AA8;
    block[4] = v19;
    v36 = obj;
    v30 = obj;
    dispatch_group_notify(v16, v29, block);

    v7 = v33;
    v9 = v32;
  }

}

BLTPBSectionInfo *__65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  BLTPBSectionInfo *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "effectiveSectionInfoForSectionID:", v3);
  v4 = (BLTPBSectionInfo *)objc_claimAutoreleasedReturnValue();
  blt_general_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      v13 = 138412290;
      v14 = (uint64_t)v3;
      _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_INFO, "Sending bb section info for sync supported app %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v6)
    {
      v13 = 138412290;
      v14 = (uint64_t)v3;
      _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_INFO, "Sending fake section info for sync supported app %@", (uint8_t *)&v13, 0xCu);
    }

    v4 = objc_alloc_init(BLTPBSectionInfo);
    -[BLTPBSectionInfo setExcludeFromBulletinBoard:](v4, "setExcludeFromBulletinBoard:", 1);
    -[BLTPBSectionInfo setSectionID:](v4, "setSectionID:", v3);
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBSectionInfo setDisplayName:](v4, "setDisplayName:", v7);

    -[BLTPBSectionInfo setAuthorizationStatus:](v4, "setAuthorizationStatus:", 0);
    BLTPBSectionIconFromBBSectionIcon(0, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    -[BLTPBSectionInfo setIcon:](v4, "setIcon:", v5);
  }

  blt_general_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[BLTPBSectionInfo icon](v4, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "variants");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v13 = 134217984;
    v14 = v11;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_INFO, "Section info contains %lu icons", (uint8_t *)&v13, 0xCu);

  }
  return v4;
}

void __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_51(uint64_t a1, uint64_t a2, int a3)
{
  id v4;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

  }
}

void __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStoreWithInstalled:removed:", v1, v3);

}

void __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_55(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__BLTSettingSync__sendSyncSupportedAppListWithInstalled_removed___block_invoke_2_56(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStoreWithInstalled:removed:", v3, *(_QWORD *)(a1 + 40));

}

- (void)handleAllSyncComplete
{
  NSObject *v3;
  BLTSyncSupportedAppList *v4;
  BLTSyncSupportedAppList *syncSupportedAppList;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsSiriActionAppList"))
  {
    v4 = objc_alloc_init(BLTSyncSupportedAppList);
    syncSupportedAppList = self->_syncSupportedAppList;
    self->_syncSupportedAppList = v4;

    -[BLTSyncSupportedAppList setDelegate:](self->_syncSupportedAppList, "setDelegate:", self);
    -[BLTSyncSupportedAppList installed](self->_syncSupportedAppList, "installed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSyncSupportedAppList removed](self->_syncSupportedAppList, "removed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    blt_general_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218240;
      v10 = objc_msgSend(v6, "count");
      v11 = 2048;
      v12 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "Sending sync supported app action list of %lu apps and removed %lu apps", (uint8_t *)&v9, 0x16u);
    }

    -[BLTSettingSync _sendSyncSupportedAppListWithInstalled:removed:](self, "_sendSyncSupportedAppListWithInstalled:removed:", v6, v7);
  }
}

- (void)syncSupportedAppListUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__BLTSettingSync_syncSupportedAppListUpdated___block_invoke;
  block[3] = &unk_24D761AD0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __46__BLTSettingSync_syncSupportedAppListUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "installed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "removed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") || objc_msgSend(v3, "count"))
  {
    blt_general_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134218240;
      v6 = objc_msgSend(v2, "count");
      v7 = 2048;
      v8 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_DEFAULT, "Sending updated sync supported app action list of %lu apps and removed %lu apps", (uint8_t *)&v5, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_sendSyncSupportedAppListWithInstalled:removed:", v2, v3);
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BLTSettingSyncInternal observer](self, "observer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)BLTSettingSync;
  -[BLTSettingSyncInternal dealloc](&v4, sel_dealloc);
}

- (BOOL)isSectionInfoSentCacheEmpty
{
  void *v2;
  char v3;

  -[BLTSettingSyncInternal connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSectionInfoSentCacheEmpty");

  return v3;
}

- (void)clearSectionInfoSentCache
{
  id v2;

  -[BLTSettingSyncInternal connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearSectionInfoSentCache");

}

- (void)_sendSectionSubtypeParameterIcons:(id)a3 sectionID:(id)a4 waitForAcknowledgement:(BOOL)a5 spoolToFile:(BOOL)a6 andCompletion:(id)a7
{
  -[BLTSettingSyncSendQueue sendSectionSubtypeParameterIcons:sectionID:waitForAcknowledgement:spoolToFile:completion:](self->_settingSendQueue, "sendSectionSubtypeParameterIcons:sectionID:waitForAcknowledgement:spoolToFile:completion:", a3, a4, a5, a6, a7);
}

- (id)_filteredAlertingSectionIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__BLTSettingSync__filteredAlertingSectionIDs___block_invoke;
  v11[3] = &unk_24D763908;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v8 = v12;
  v9 = v7;

  return v9;
}

void __46__BLTSettingSync__filteredAlertingSectionIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "willNanoPresentNotificationForSectionID:subsectionIDs:subtype:") & 0xFFFFFFFFFFFFFC7FLL) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "sectionConfiguration"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "shouldSectionIDSettingsAlwaysSync:", v12),
        v3,
        v4)
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "universalSectionIDForSectionID:", v12),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_overriddenSectionInfoForSectionID:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "factorySectionID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(*(id *)(a1 + 32), "sectionConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "factorySectionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "shouldSectionIDSettingsAlwaysSync:", v10);

      if (v11)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
    }

  }
}

- (void)_updateAllBBSectionsWithCompletion:(id)a3 withProgress:(id)a4 spoolToFile:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *sectionInfoSyncCoordinatorQueue;
  uint64_t v14;
  id v15;
  BLTSettingSyncSendQueue *settingSendQueue;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id *v21;
  id *v22;
  _QWORD v23[5];
  BOOL v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id location;
  _QWORD block[5];
  id v34;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  BLTWorkQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[BLTSectionInfoList sectionIDs](self->_sectionInfoList, "sectionIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSettingSync _filteredAlertingSectionIDs:](self, "_filteredAlertingSectionIDs:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  sectionInfoSyncCoordinatorQueue = self->_sectionInfoSyncCoordinatorQueue;
  v14 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke;
  block[3] = &unk_24D761AA8;
  block[4] = self;
  v15 = v12;
  v34 = v15;
  dispatch_sync(sectionInfoSyncCoordinatorQueue, block);
  -[BLTSettingSync _storeSyncState:](self, "_storeSyncState:", 1);
  objc_initWeak(&location, self);
  settingSendQueue = self->_settingSendQueue;
  v31[0] = v14;
  v31[1] = 3221225472;
  v31[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_2;
  v31[3] = &unk_24D763980;
  v31[4] = self;
  v17 = objc_msgSend(v15, "count");
  v30[0] = v14;
  v30[1] = 3221225472;
  v30[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_2_65;
  v30[3] = &unk_24D7639A8;
  v30[4] = self;
  v27[0] = v14;
  v27[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_4;
  v27[3] = &unk_24D7639D0;
  v27[1] = 3221225472;
  objc_copyWeak(&v29, &location);
  v27[4] = self;
  v18 = v8;
  v28 = v18;
  if (v9)
  {
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_6;
    v25[3] = &unk_24D763780;
    v19 = v25;
    v21 = &v26;
    v26 = v9;
  }
  else
  {
    v19 = 0;
  }
  -[BLTSettingSyncSendQueue sendEffectiveSectionInfosUsingProvider:count:sectionInfoSendCompleted:completion:progress:spoolToFile:](settingSendQueue, "sendEffectiveSectionInfosUsingProvider:count:sectionInfoSendCompleted:completion:progress:spoolToFile:", v31, v17, v30, v27, v19, v5, v21);
  -[BLTSectionInfoList sectionOverridesOnly](self->_sectionInfoList, "sectionOverridesOnly");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_7;
  v23[3] = &unk_24D7639F8;
  v23[4] = self;
  v24 = v5;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v23);

  if (v9)
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke(uint64_t a1)
{
  NSObject *v1;
  BLTSectionInfoSyncCoordinator *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
  {
    blt_settings_log();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_cold_1(v1);

  }
  else
  {
    v3 = [BLTSectionInfoSyncCoordinator alloc];
    objc_msgSend(*(id *)(a1 + 40), "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_62;
    v8[3] = &unk_24D763930;
    v8[4] = *(_QWORD *)(a1 + 32);
    v5 = -[BLTSectionInfoSyncCoordinator initWithAlertingSectionIDs:infoProvider:](v3, "initWithAlertingSectionIDs:infoProvider:", v4, v8);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 96);
    *(_QWORD *)(v6 + 96) = v5;

  }
}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_62(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "effectiveSectionInfoForSectionID:", a2);
}

id __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 104);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_64;
  block[3] = &unk_24D763958;
  block[4] = v2;
  block[5] = &v7;
  block[6] = a2;
  dispatch_sync(v3, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_64(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 96), "effectiveSectionInfoForSectionIDIndex:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_2_65(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 104);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_3;
  v4[3] = &unk_24D7621F8;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_sync(v3, v4);
}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "sectionInfoSendCompleted:", *(_QWORD *)(a1 + 40));
}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_5;
  block[3] = &unk_24D761AD0;
  v5 = WeakRetained;
  v7 = v5;
  dispatch_sync(v3, block);
  objc_msgSend(v5, "_storeSyncState:", 0);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 96);
  *(_QWORD *)(v1 + 96) = 0;

}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendOverrideOnly:sectionID:spoolToFile:", a3, a2, *(unsigned __int8 *)(a1 + 40));
}

- (void)sendOverrideOnly:(id)a3 sectionID:(id)a4 spoolToFile:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
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
  id v21;

  v5 = a5;
  v21 = a3;
  v8 = a4;
  objc_msgSend(v21, "level");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[BLTSettingSyncInternal connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "level");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNotificationsLevel:sectionID:mirror:spoolToFile:", BLTPBSetNotificationsAlertLevelToBLTSettingSyncingNotificationsLevel(objc_msgSend(v11, "intValue")), v8, 0, v5);

  }
  objc_msgSend(v21, "grouping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[BLTSettingSyncInternal connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "grouping");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNotificationsGrouping:sectionID:spoolToFile:", objc_msgSend(v14, "intValue"), v8, v5);

  }
  objc_msgSend(v21, "sound");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[BLTSettingSyncInternal connection](self, "connection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sound");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setNotificationsSoundEnabled:sectionID:", objc_msgSend(v17, "intValue"), v8);

  }
  objc_msgSend(v21, "criticalAlert");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[BLTSettingSyncInternal connection](self, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "criticalAlert");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNotificationsCriticalAlertEnabled:sectionID:", objc_msgSend(v20, "intValue"), v8);

  }
}

- (id)_overriddenSectionInfoForSectionID:(id)a3
{
  return -[BLTSectionInfoList overriddenSectionInfoForSectionID:](self->_sectionInfoList, "overriddenSectionInfoForSectionID:", a3);
}

- (void)sendSectionInfosWithSectionIDs:(id)a3 completion:(id)a4 spoolToFile:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a4;
  BLTWorkQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __72__BLTSettingSync_sendSectionInfosWithSectionIDs_completion_spoolToFile___block_invoke;
  v13[3] = &unk_24D763A48;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __72__BLTSettingSync_sendSectionInfosWithSectionIDs_completion_spoolToFile___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  int *v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  int *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_filteredAlertingSectionIDs:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", v2);
  v4 = objc_msgSend(v2, "count");
  v40 = v3;
  v41 = v2;
  v39 = v4;
  if (v4)
  {
    objc_msgSend(v2, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    blt_settings_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v5;
      _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_DEFAULT, "Sending single section infos %@", buf, 0xCu);
    }

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v49;
      v11 = &OBJC_IVAR___BLTRemoteRequestLogItem__sessionState;
      v12 = &OBJC_IVAR___BLTRemoteRequestLogItem__sessionState;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v7);
          v14 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v11[600]), "watchKitAppDefinitionWithBundleID:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            if (objc_msgSend(v15, "runsIndependently"))
            {
              if (objc_msgSend(v16, "isInstalled"))
              {
                v17 = v12[604];
                if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v17), "hasCustomSettingsSetForSectionID:", v14) & 1) == 0)
                {
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v17), "bbSectionInfoForSectionID:", v14);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  v19 = (void *)objc_msgSend(v18, "copy");

                  v20 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
                  objc_msgSend(v16, "watchKitAppBundleID");
                  v21 = v7;
                  v22 = v12;
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "setCustomSettingsWithSectionInfo:watchSectionID:", v19, v23);

                  v12 = v22;
                  v7 = v21;
                  v11 = &OBJC_IVAR___BLTRemoteRequestLogItem__sessionState;

                }
              }
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v9);
    }

    v24 = *(_QWORD *)(a1 + 32);
    v25 = *(void **)(v24 + 80);
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __72__BLTSettingSync_sendSectionInfosWithSectionIDs_completion_spoolToFile___block_invoke_67;
    v46[3] = &unk_24D763A20;
    v46[4] = v24;
    v47 = v7;
    v26 = *(_QWORD *)(a1 + 48);
    v27 = *(unsigned __int8 *)(a1 + 56);
    v28 = v7;
    v4 = v39;
    objc_msgSend(v25, "sendEffectiveSectionInfosUsingProvider:count:sectionInfoSendCompleted:completion:progress:spoolToFile:", v46, v39, 0, v26, 0, v27);

    v3 = v40;
    v2 = v41;
  }
  if (objc_msgSend(v3, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = v3;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v43 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "sectionOverrideOnlyForSectionID:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          blt_settings_log();
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
          if (v35)
          {
            if (v37)
            {
              *(_DWORD *)buf = 138412290;
              v55 = v34;
              _os_log_impl(&dword_2173D9000, v36, OS_LOG_TYPE_DEFAULT, "Sending single section settings override for %@", buf, 0xCu);
            }

            objc_msgSend(*(id *)(a1 + 32), "sendOverrideOnly:sectionID:spoolToFile:", v35, v34, *(unsigned __int8 *)(a1 + 56));
          }
          else
          {
            if (v37)
            {
              *(_DWORD *)buf = 138412290;
              v55 = v34;
              _os_log_impl(&dword_2173D9000, v36, OS_LOG_TYPE_DEFAULT, "Not sending settings for %@ as it has no override and is not alerting", buf, 0xCu);
            }

          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v31);
    }

    v3 = v40;
    v2 = v41;
    v4 = v39;
  }
  if (!v4)
  {
    v38 = *(_QWORD *)(a1 + 48);
    if (v38)
      (*(void (**)(void))(v38 + 16))();
  }

}

id __72__BLTSettingSync_sendSectionInfosWithSectionIDs_completion_spoolToFile___block_invoke_67(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveSectionInfoForSectionID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sendRemoveSectionWithSectionID:(id)a3 sent:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  BLTWorkQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__BLTSettingSync_sendRemoveSectionWithSectionID_sent___block_invoke;
  block[3] = &unk_24D761D48;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __54__BLTSettingSync_sendRemoveSectionWithSectionID_sent___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 144), "watchKitAppDefinitionWithBundleID:", a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4
    && objc_msgSend(v4, "runsIndependently")
    && objc_msgSend(v4, "isInstalled")
    && (objc_msgSend(*(id *)(a1[4] + 72), "hasCustomSettingsSetForSectionID:", a1[5]) & 1) == 0)
  {
    v2 = *(void **)(a1[4] + 120);
    objc_msgSend(v4, "watchKitAppBundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enableCustomSettingsForWatchSectionID:", v3);

  }
  objc_msgSend(*(id *)(a1[4] + 80), "sendRemoveSectionWithSectionID:sent:", a1[5], a1[6]);

}

- (void)sendAllSectionInfoWithSpool:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v6 = a4;
  if (v4 && (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsFileSettingSync") & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __57__BLTSettingSync_sendAllSectionInfoWithSpool_completion___block_invoke_3;
    v10[3] = &unk_24D761B98;
    v7 = &v11;
    v11 = v6;
    v8 = v6;
    -[BLTSettingSync _sendSpooledSyncWithCompletion:withProgress:](self, "_sendSpooledSyncWithCompletion:withProgress:", v10, &__block_literal_global_69_0);
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__BLTSettingSync_sendAllSectionInfoWithSpool_completion___block_invoke;
    v12[3] = &unk_24D761B98;
    v7 = &v13;
    v13 = v6;
    v9 = v6;
    -[BLTSettingSync _updateAllBBSectionsWithCompletion:withProgress:spoolToFile:](self, "_updateAllBBSectionsWithCompletion:withProgress:spoolToFile:", v12, &__block_literal_global_68, 0);
  }

}

uint64_t __57__BLTSettingSync_sendAllSectionInfoWithSpool_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __57__BLTSettingSync_sendAllSectionInfoWithSpool_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)spoolSectionInfoWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsFileSettingSync"))
    -[BLTSettingSync _updateAllBBSectionsWithCompletion:withProgress:spoolToFile:](self, "_updateAllBBSectionsWithCompletion:withProgress:spoolToFile:", v4, 0, 1);

}

- (id)settingOverrides
{
  return -[BLTSectionInfoList overrides](self->_sectionInfoList, "overrides");
}

- (id)originalSettings
{
  return -[BLTSectionInfoList originalSettings](self->_sectionInfoList, "originalSettings");
}

- (id)overriddenSettings
{
  return -[BLTSectionInfoList overriddenSettings](self->_sectionInfoList, "overriddenSettings");
}

- (id)settingsDescriptionForSectionIDs:(id)a3
{
  return -[BLTSectionInfoList settingsDescriptionForSectionIDs:](self->_sectionInfoList, "settingsDescriptionForSectionIDs:", a3);
}

- (void)setSectionInfo:(id)a3 completion:(id)a4
{
  -[BLTSettingSync setSectionInfo:keypaths:completion:](self, "setSectionInfo:keypaths:completion:", a3, 0, a4);
}

- (void)setSectionInfo:(id)a3 keypaths:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[4];
  void (**v34)(_QWORD);
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  blt_settings_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v8;
      v38 = 2112;
      v39 = v9;
      _os_log_impl(&dword_2173D9000, v12, OS_LOG_TYPE_DEFAULT, "setSectionInfo: %@ keypaths: %@", buf, 0x16u);
    }

    BBSectionInfoFromBLTPBSectionInfo(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sectionInfoForSectionID:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v16, "applyKeypaths:from:", v9, v13);
      v17 = v16;

      v13 = v17;
    }
    v18 = objc_alloc(MEMORY[0x24BDC1540]);
    objc_msgSend(v13, "sectionID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v20 = (void *)objc_msgSend(v18, "initWithBundleIdentifier:allowPlaceholder:error:", v19, 0, &v35);
    v21 = v35;

    if (v21)
    {
      blt_settings_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[BLTSettingSync setSectionInfo:keypaths:completion:].cold.2((uint64_t)v8, (uint64_t)v21, v22);

    }
    if (v20)
    {
      blt_settings_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v8;
        v38 = 2112;
        v39 = v20;
        _os_log_impl(&dword_2173D9000, v23, OS_LOG_TYPE_DEFAULT, "setSectionInfo: %@ record: %@", buf, 0x16u);
      }

      v24 = (void *)objc_msgSend(v13, "copy");
      objc_msgSend(v16, "displayName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v16, "displayName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setDisplayName:", v26);

      }
      -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sectionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __53__BLTSettingSync_setSectionInfo_keypaths_completion___block_invoke;
      v33[3] = &unk_24D761B98;
      v34 = v10;
      objc_msgSend(v27, "setSectionInfo:forSectionID:withCompletion:", v24, v28, v33);

    }
    else
    {
      objc_msgSend(v8, "watchSectionID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v8, "watchSectionID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSectionID:", v30);

        blt_settings_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "watchSectionID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v37 = v32;
          _os_log_impl(&dword_2173D9000, v31, OS_LOG_TYPE_INFO, "Setting custom settings for watch app %@", buf, 0xCu);

        }
        -[BLTSectionInfoListBridgeProvider setCustomSettingsWithSectionInfo:](self->_bridgeProvider, "setCustomSettingsWithSectionInfo:", v13);
      }
    }

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BLTSettingSync setSectionInfo:keypaths:completion:].cold.1(v12);

    if (v10)
      v10[2](v10);
  }

}

uint64_t __53__BLTSettingSync_setSectionInfo_keypaths_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeSectionWithSectionID:(id)a3
{
  -[BLTSectionInfoListBridgeProvider removeSectionWithSectionID:](self->_bridgeProvider, "removeSectionWithSectionID:", a3);
}

- (void)setNotificationsLevel:(unint64_t)a3 sectionID:(id)a4 mirror:(BOOL)a5 fromRemote:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = a5;
  v22 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  if (a3 - 4 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    blt_settings_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_2173D9000, v10, OS_LOG_TYPE_INFO, "Removing section info cache info for %@", (uint8_t *)&v18, 0xCu);
    }

    -[BLTSettingSyncInternal connection](self, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeSectionInfoSentCacheForSectionID:", v9);

  }
  if (v6)
  {
    -[BLTSectionInfoList bbSectionInfoForSectionID:](self->_sectionInfoList, "bbSectionInfoForSectionID:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    v14 = v13 == 0;
    blt_settings_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412546;
        v19 = v9;
        v20 = 2112;
        v21 = v17;
        _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_INFO, "Setting notification level for %@ to %@", (uint8_t *)&v18, 0x16u);

      }
      objc_msgSend(v13, "bltApplyNotificationLevel:", a3);
      -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject setSectionInfo:forSectionID:](v15, "setSectionInfo:forSectionID:", v13, v9);
    }
    else if (v16)
    {
      v18 = 138412290;
      v19 = v9;
      _os_log_impl(&dword_2173D9000, v15, OS_LOG_TYPE_INFO, "Phone section not found: %@. Must be watch section only", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    v14 = 0;
  }
  if (a3 != 3)
    -[BLTSectionInfoListBridgeProvider setNotificationsLevel:sectionID:forceCustom:](self->_bridgeProvider, "setNotificationsLevel:sectionID:forceCustom:", BLTSettingSyncingNotificationsLevelToBLTPBSetNotificationsAlertLevel(a3), v9, v14 || !v6);
  -[BLTSettingSync makeAuthorizationPermanentForSectionID:](self, "makeAuthorizationPermanentForSectionID:", v9);

}

- (void)makeAuthorizationPermanentForSectionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionInfoForSectionID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7 && objc_msgSend(v7, "authorizationStatus") == 4)
  {
    objc_msgSend(v7, "makeAuthorizationPermanent");
    objc_initWeak(&location, self);
    -[BLTSettingSyncInternal settingsGateway](self, "settingsGateway");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __57__BLTSettingSync_makeAuthorizationPermanentForSectionID___block_invoke;
    v9[3] = &unk_24D763AB0;
    v10 = v4;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v8, "setSectionInfo:forSectionID:withCompletion:", v7, v10, v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __57__BLTSettingSync_makeAuthorizationPermanentForSectionID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  blt_settings_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_INFO, "makeAuthorizationPermanentForSectionID settingsGateway saved %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__BLTSettingSync_makeAuthorizationPermanentForSectionID___block_invoke_72;
  v6[3] = &unk_24D761AD0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "sendSectionInfosWithSectionIDs:completion:spoolToFile:", v5, v6, 0);

}

void __57__BLTSettingSync_makeAuthorizationPermanentForSectionID___block_invoke_72(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  blt_settings_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_INFO, "makeAuthorizationPermanentForSectionID sendSectionInfosWithSectionIDs complete %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)observer:(id)a3 noteSectionParametersChanged:(id)a4 forSectionID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  v15[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSettingSync _filteredAlertingSectionIDs:](self, "_filteredAlertingSectionIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend((id)sectionParameterSubtypeIconSectionIDAllowList, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "BOOLValue"))
    {
      blt_settings_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = 138412290;
        v14 = v8;
        _os_log_impl(&dword_2173D9000, v12, OS_LOG_TYPE_INFO, "Sending sectionSubtypeParameters icons for %@", (uint8_t *)&v13, 0xCu);
      }

      -[BLTSettingSync _sendSectionSubtypeParameterIcons:sectionID:waitForAcknowledgement:spoolToFile:andCompletion:](self, "_sendSectionSubtypeParameterIcons:sectionID:waitForAcknowledgement:spoolToFile:andCompletion:", v7, v8, 0, !self->_initialSyncPerformed, 0);
    }

  }
}

- (void)sectionInfoList:(id)a3 receivedUpdatedSectionInfoForSectionID:(id)a4 transaction:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v15[0] = a4;
  v8 = (void *)MEMORY[0x24BDBCE30];
  v9 = a4;
  objc_msgSend(v8, "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __85__BLTSettingSync_sectionInfoList_receivedUpdatedSectionInfoForSectionID_transaction___block_invoke;
  v13[3] = &unk_24D761AD0;
  v14 = v7;
  v11 = !self->_initialSyncPerformed;
  v12 = v7;
  -[BLTSettingSync sendSectionInfosWithSectionIDs:completion:spoolToFile:](self, "sendSectionInfosWithSectionIDs:completion:spoolToFile:", v10, v13, v11);

  -[BLTSettingSync _callReloadBBCompletionsForSectionID:](self, "_callReloadBBCompletionsForSectionID:", v9);
}

- (void)sectionInfoList:(id)a3 receivedRemoveSectionWithSectionID:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v7 = a5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__BLTSettingSync_sectionInfoList_receivedRemoveSectionWithSectionID_transaction___block_invoke;
  v9[3] = &unk_24D7638E0;
  v10 = v7;
  v8 = v7;
  -[BLTSettingSync sendRemoveSectionWithSectionID:sent:](self, "sendRemoveSectionWithSectionID:sent:", a4, v9);

}

- (BOOL)sectionInfoListSectionIDHadDisplayedCriticalBulletins:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[BLTSettingSyncInternal sectionConfiguration](self, "sectionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSectionIDDisplayedCriticalBulletins:", v4);

  return v6;
}

- (BOOL)sectionInfoList:(id)a3 override:(id)a4 shouldApplyToSectionInfoForSectionID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;

  v7 = a5;
  v8 = a4;
  -[BLTSettingSyncInternal sectionConfiguration](self, "sectionConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "override:appliesToConfigurationForSectionID:", v8, v7);

  return v10 ^ 1;
}

- (void)sectionInfoList:(id)a3 makeAuthorizationPermanentForSectionID:(id)a4
{
  -[BLTSettingSync makeAuthorizationPermanentForSectionID:](self, "makeAuthorizationPermanentForSectionID:", a4);
}

- (void)sectionConfiguration:(id)a3 addedSectionIDs:(id)a4 removedSectionIDs:(id)a5
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    +[BLTTransaction transactionWithDescription:](BLTTransaction, "transactionWithDescription:", CFSTR("BLTSettingsSync sectionConfiguration:addedSectionIDs:removedSectionIDs:"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __73__BLTSettingSync_sectionConfiguration_addedSectionIDs_removedSectionIDs___block_invoke;
    v9[3] = &unk_24D761AD0;
    v10 = v7;
    v8 = v7;
    -[BLTSettingSync sendSectionInfosWithSectionIDs:completion:spoolToFile:](self, "sendSectionInfosWithSectionIDs:completion:spoolToFile:", v6, v9, 0);

  }
}

- (void)_callReloadBBCompletionsForSectionID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__BLTSettingSync__callReloadBBCompletionsForSectionID___block_invoke;
  v6[3] = &unk_24D761AA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  BLTDispatchWorkQueue(v6);

}

void __55__BLTSettingSync__callReloadBBCompletionsForSectionID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)_addReloadBBCompletion:(id)a3 sectionID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__BLTSettingSync__addReloadBBCompletion_sectionID___block_invoke;
  v10[3] = &unk_24D761D48;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  BLTDispatchWorkQueue(v10);

}

void __51__BLTSettingSync__addReloadBBCompletion_sectionID___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1[4] + 128), "objectForKeyedSubscript:", a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1[4] + 128), "setObject:forKeyedSubscript:");
  }
  v2 = (void *)MEMORY[0x219A0C15C](a1[6]);
  objc_msgSend(v3, "addObject:", v2);

}

- (void)_callAndRemoveReloadBBCompletion:(id)a3 sectionID:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__BLTSettingSync__callAndRemoveReloadBBCompletion_sectionID___block_invoke;
  v10[3] = &unk_24D761D48;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  BLTDispatchWorkQueue(v10);

}

void __61__BLTSettingSync__callAndRemoveReloadBBCompletion_sectionID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 128), "objectForKeyedSubscript:", a1[5]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v2 = (void *)MEMORY[0x219A0C15C](a1[6]);
    v3 = objc_msgSend(v4, "indexOfObject:", v2);

    if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "removeObjectAtIndex:", v3);
      (*(void (**)(void))(a1[6] + 16))();
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchKitAppList, 0);
  objc_storeStrong((id *)&self->_syncSupportedAppList, 0);
  objc_storeStrong((id *)&self->_reloadBBCompletions, 0);
  objc_storeStrong((id *)&self->_bridgeProvider, 0);
  objc_storeStrong((id *)&self->_sectionInfoSyncCoordinatorQueue, 0);
  objc_storeStrong((id *)&self->_sectionInfoSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_settingSendQueue, 0);
  objc_storeStrong((id *)&self->_sectionInfoList, 0);
}

void __78__BLTSettingSync__updateAllBBSectionsWithCompletion_withProgress_spoolToFile___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Can't call update all bb sections while it is already processing", v1, 2u);
}

- (void)setSectionInfo:(NSObject *)a1 keypaths:completion:.cold.1(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_2173D9000, a1, OS_LOG_TYPE_ERROR, "**** sectionInfo is nil!\n%@", (uint8_t *)&v3, 0xCu);

}

- (void)setSectionInfo:(uint64_t)a1 keypaths:(uint64_t)a2 completion:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "setSectionInfo: %@ error: %@", (uint8_t *)&v3, 0x16u);
}

@end
