@implementation BLTPairedSyncCoordinator

+ (id)syncState
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__BLTPairedSyncCoordinator_syncState__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (syncState_onceToken != -1)
    dispatch_once(&syncState_onceToken, block);
  +[BLTPairedSyncState sharedInstance](BLTPairedSyncState, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __37__BLTPairedSyncCoordinator_syncState__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)__sharedInstance;
  __sharedInstance = (uint64_t)v1;

}

- (BLTPairedSyncCoordinator)init
{
  BLTPairedSyncCoordinator *v2;
  void *v3;
  uint64_t v4;
  PSYSyncCoordinator *pairedSyncCoordinator;
  PSYSyncCoordinator *v6;
  void *v7;
  PSYInitialSyncStateObserver *v8;
  PSYInitialSyncStateObserver *pairedInitialSyncObserver;
  uint64_t v10;
  NSObject *v11;
  PSYSyncSessionObserver *v12;
  PSYSyncSessionObserver *pairedSyncObserver;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)BLTPairedSyncCoordinator;
  v2 = -[BLTPairedSyncCoordinator init](&v15, sel_init);
  if (v2)
  {
    +[BLTPairedSyncState sharedInstance](BLTPairedSyncState, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE6E698], "syncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.bulletindistributor"));
    v4 = objc_claimAutoreleasedReturnValue();
    pairedSyncCoordinator = v2->_pairedSyncCoordinator;
    v2->_pairedSyncCoordinator = (PSYSyncCoordinator *)v4;

    v6 = v2->_pairedSyncCoordinator;
    BLTWorkQueue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSYSyncCoordinator setDelegate:queue:](v6, "setDelegate:queue:", v2, v7);

    v8 = (PSYInitialSyncStateObserver *)objc_alloc_init(MEMORY[0x24BE6E690]);
    pairedInitialSyncObserver = v2->_pairedInitialSyncObserver;
    v2->_pairedInitialSyncObserver = v8;

    -[PSYInitialSyncStateObserver setDelegate:](v2->_pairedInitialSyncObserver, "setDelegate:", v2);
    v10 = -[PSYSyncCoordinator syncRestriction](v2->_pairedSyncCoordinator, "syncRestriction");
    blt_general_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v10;
      _os_log_impl(&dword_2173D9000, v11, OS_LOG_TYPE_DEFAULT, "Paired sync coordinator says current sync restriction is %lu", buf, 0xCu);
    }

    objc_msgSend(v3, "setState:", 2 * (v10 != 1));
    if (v10 == 1)
    {
      v12 = (PSYSyncSessionObserver *)objc_alloc_init(MEMORY[0x24BE6E6A0]);
      pairedSyncObserver = v2->_pairedSyncObserver;
      v2->_pairedSyncObserver = v12;

      -[PSYSyncSessionObserver setDelegate:](v2->_pairedSyncObserver, "setDelegate:", v2);
      -[PSYSyncSessionObserver startObservingSyncSessionsWithCompletion:](v2->_pairedSyncObserver, "startObservingSyncSessionsWithCompletion:", &__block_literal_global);
    }
    -[BLTPairedSyncCoordinator _initInitialSyncStateComplete](v2, "_initInitialSyncStateComplete");

  }
  return v2;
}

- (void)_initInitialSyncStateComplete
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke;
  v4[3] = &unk_24D761EA8;
  v4[4] = self;
  objc_msgSend(v3, "waitForPairingStorePathPairingID:", v4);

}

void __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  blt_general_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Requesting initial sync state for %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "requestInitialSyncStateForPairingIdentifier:completion:", v4, &__block_literal_global_9);
}

void __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke_7(uint64_t a1, char a2)
{
  NSObject *v3;
  _QWORD block[4];
  char v5;

  BLTWorkQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke_2;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a2;
  dispatch_async(v3, block);

}

void __57__BLTPairedSyncCoordinator__initInitialSyncStateComplete__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  blt_general_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = "";
    else
      v3 = " NOT";
    v5 = 136315138;
    v6 = v3;
    _os_log_impl(&dword_2173D9000, v2, OS_LOG_TYPE_DEFAULT, "PSY says initial sync state is%s complete", (uint8_t *)&v5, 0xCu);
  }

  +[BLTPairedSyncState sharedInstance](BLTPairedSyncState, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInitialSyncComplete:", *(unsigned __int8 *)(a1 + 32));

}

+ (void)syncDidComplete
{
  objc_msgSend((id)__sharedInstance, "_syncDidComplete");
}

- (void)_syncDidComplete
{
  id v2;

  self->_clientSyncComplete = 1;
  -[PSYSyncCoordinator activeSyncSession](self->_pairedSyncCoordinator, "activeSyncSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDidComplete");

}

+ (void)reportProgress:(double)a3
{
  objc_msgSend((id)__sharedInstance, "_reportProgress:", a3);
}

- (void)_reportProgress:(double)a3
{
  id v4;

  -[PSYSyncCoordinator activeSyncSession](self->_pairedSyncCoordinator, "activeSyncSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportProgress:", a3);

}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BLTPairedSyncCoordinator *v10;

  v5 = a4;
  BLTWorkQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__BLTPairedSyncCoordinator_syncSessionObserver_didReceiveUpdate___block_invoke;
  v8[3] = &unk_24D761AA8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __65__BLTPairedSyncCoordinator_syncSessionObserver_didReceiveUpdate___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __65__BLTPairedSyncCoordinator_syncSessionObserver_didReceiveUpdate___block_invoke_2;
  v3[3] = &unk_24D761ED0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateNewlyRunningActivitiesWithBlock:", v3);
}

void __65__BLTPairedSyncCoordinator_syncSessionObserver_didReceiveUpdate___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString **v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "activityInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 4;
  v7 = BLTCanStartListeningDuringPairedSyncActivities;
  while (!objc_msgSend(v5, "isEqualToString:", *v7))
  {
    ++v7;
    if (!--v6)
      goto LABEL_8;
  }
  blt_general_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_INFO, "PSY Observer says %@ is now running", (uint8_t *)&v12, 0xCu);
  }

  +[BLTPairedSyncState sharedInstance](BLTPairedSyncState, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leaveState:", 0);

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 32);
  *(_QWORD *)(v10 + 32) = 0;

LABEL_8:
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  blt_general_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "Received beginSyncSession.", v8, 2u);
  }

  +[BLTPairedSyncState sharedInstance](BLTPairedSyncState, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leaveState:", 1);

  if (self->_clientSyncComplete)
  {
    -[PSYSyncCoordinator activeSyncSession](self->_pairedSyncCoordinator, "activeSyncSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syncDidComplete");

  }
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = -[PSYSyncCoordinator syncRestriction](self->_pairedSyncCoordinator, "syncRestriction", a3);
  blt_general_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_2173D9000, v4, OS_LOG_TYPE_DEFAULT, "Received syncCoordinatorDidChangeSyncRestriction. Coordinator says current sync restriction is %lu", (uint8_t *)&v6, 0xCu);
  }

  if (v3 != 1)
  {
    +[BLTPairedSyncState sharedInstance](BLTPairedSyncState, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leaveState:", 1);

  }
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  NSObject *v4;

  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, &__block_literal_global_15);

}

void __96__BLTPairedSyncCoordinator_initialSyncStateObserver_initialSyncDidCompleteForPairingIdentifier___block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  blt_general_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2173D9000, v0, OS_LOG_TYPE_DEFAULT, "InitialSyncState observer says initial sync is entirely complete", v2, 2u);
  }

  +[BLTPairedSyncState sharedInstance](BLTPairedSyncState, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInitialSyncComplete:", 1);

}

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
  NSObject *v4;

  BLTWorkQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v4, &__block_literal_global_16);

}

void __89__BLTPairedSyncCoordinator_initialSyncStateObserver_syncDidCompleteForPairingIdentifier___block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  blt_general_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2173D9000, v0, OS_LOG_TYPE_DEFAULT, "InitialSyncState observer says sync is entirely complete", v2, 2u);
  }

  +[BLTPairedSyncState sharedInstance](BLTPairedSyncState, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setInitialSyncComplete:", 1);

}

- (PSYSyncCoordinator)pairedSyncCoordinator
{
  return self->_pairedSyncCoordinator;
}

- (void)setPairedSyncCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, a3);
}

- (PSYInitialSyncStateObserver)pairedInitialSyncObserver
{
  return self->_pairedInitialSyncObserver;
}

- (void)setPairedInitialSyncObserver:(id)a3
{
  objc_storeStrong((id *)&self->_pairedInitialSyncObserver, a3);
}

- (PSYSyncSessionObserver)pairedSyncObserver
{
  return self->_pairedSyncObserver;
}

- (void)setPairedSyncObserver:(id)a3
{
  objc_storeStrong((id *)&self->_pairedSyncObserver, a3);
}

- (BOOL)clientSyncComplete
{
  return self->_clientSyncComplete;
}

- (void)setClientSyncComplete:(BOOL)a3
{
  self->_clientSyncComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSyncObserver, 0);
  objc_storeStrong((id *)&self->_pairedInitialSyncObserver, 0);
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
}

@end
