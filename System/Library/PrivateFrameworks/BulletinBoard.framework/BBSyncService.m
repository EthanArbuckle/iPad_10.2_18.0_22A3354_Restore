@implementation BBSyncService

- (BBSyncService)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  BBSyncService *v8;
  BBSyncService *v9;
  uint64_t v10;
  NSMutableSet *pendingDismissalIDs;
  uint64_t v12;
  NSMutableSet *pendingDismissalDictionaries;
  uint64_t v14;
  IDSService *service;
  BBSyncService *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BBSyncService;
  v8 = -[BBSyncService init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingDismissalIDs = v9->_pendingDismissalIDs;
    v9->_pendingDismissalIDs = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    pendingDismissalDictionaries = v9->_pendingDismissalDictionaries;
    v9->_pendingDismissalDictionaries = (NSMutableSet *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.bulletinboard"));
    service = v9->_service;
    v9->_service = (IDSService *)v14;

    -[IDSService addDelegate:queue:](v9->_service, "addDelegate:queue:", v9, v9->_queue);
    v16 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BSContinuousMachTimer invalidate](self->_sendTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BBSyncService;
  -[BBSyncService dealloc](&v3, sel_dealloc);
}

- (unint64_t)pairedDeviceCount
{
  void *v2;
  unint64_t v3;

  -[IDSService devices](self->_service, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "IDS activeAccountsChanged", v5, 2u);
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id WeakRetained;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  objc_msgSend(a3, "deviceForFromID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("f"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v9, "objectForKey:", CFSTR("s"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("u"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("b"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("m"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v11, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v36 = v9;
      v37 = 2114;
      v38 = v14;
      v39 = 2114;
      v40 = v15;
      v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_20CCB9000, v18, OS_LOG_TYPE_DEFAULT, "Received IDS message %@ for %{public}@ and %{public}@ from \"%{public}@\", buf, 0x2Au);

    }
    if (v14)
    {
      -[BBSyncService _platformFromDeviceType:](self, "_platformFromDeviceType:", objc_msgSend(v11, "deviceType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v33 = v13;
        objc_msgSend(MEMORY[0x24BE15820], "sharedCategories");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "bundleIDForPlatform:fromBundleID:platform:", *MEMORY[0x24BE157F8], v14, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "length"))
        {
          v23 = BBLogSync;
          if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v36 = v14;
            v37 = 2114;
            v38 = v22;
            _os_log_impl(&dword_20CCB9000, v23, OS_LOG_TYPE_DEFAULT, "Mapping bundle id using categories: %{public}@ -> %{public}@", buf, 0x16u);
          }
          v24 = v22;

          v14 = v24;
        }
        v13 = v33;

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "syncService:receivedDismissalDictionaries:dismissalIDs:inSection:universalSectionID:forFeeds:", self, v34, v16, v14, v15, v13);

  }
  else
  {
    v26 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR))
      -[BBSyncService service:account:incomingMessage:fromID:].cold.1((uint64_t)v10, v26, v27, v28, v29, v30, v31, v32);
  }

}

- (void)enqueueSyncedRemovalForBulletin:(id)a3 feeds:(unint64_t)a4
{
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[BBSyncService _hasDestination](self, "_hasDestination"))
    -[BBSyncService _reallyEnqueueBulletin:feeds:](self, "_reallyEnqueueBulletin:feeds:", v6, a4);

}

- (id)_syncAccount
{
  void *v2;
  void *v3;

  -[IDSService accounts](self->_service, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_hasDestination
{
  void *v3;
  BOOL v4;

  -[BBSyncService _syncAccount](self, "_syncAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = -[BBSyncService _syncHasDefaultPairedDevice](self, "_syncHasDefaultPairedDevice");

  return v4;
}

- (void)_reallyEnqueueBulletin:(id)a3 feeds:(unint64_t)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  NSString *v9;
  NSString *queuedUniversalSectionID;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableSet *pendingDismissalDictionaries;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v6, "sectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_queuedFeed != a4 || !-[NSString isEqualToString:](self->_queuedSectionID, "isEqualToString:", v7))
  {
    -[BBSyncService _reallySend](self, "_reallySend");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "syncService:universalSectionIdentifierForSectionIdentifier:", self, v7);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

    self->_queuedFeed = a4;
    objc_storeStrong((id *)&self->_queuedSectionID, v7);
    queuedUniversalSectionID = self->_queuedUniversalSectionID;
    self->_queuedUniversalSectionID = v9;

  }
  v11 = (void *)BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v6, "bulletinID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v13;
    _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "really enqueueing bulletin %@", (uint8_t *)&v17, 0xCu);

  }
  objc_msgSend(v6, "dismissalID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSMutableSet addObject:](self->_pendingDismissalIDs, "addObject:", v14);
  }
  else
  {
    pendingDismissalDictionaries = self->_pendingDismissalDictionaries;
    -[BBSyncService _dismissalDictionaryForBulletin:](self, "_dismissalDictionaryForBulletin:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](pendingDismissalDictionaries, "addObject:", v16);

  }
  -[BBSyncService _startTimerIfNecessary](self, "_startTimerIfNecessary");

}

- (BOOL)_syncHasDefaultPairedDevice
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[IDSService devices](self->_service, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isDefaultPairedDevice") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_syncLocalDevices
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IDSService devices](self->_service, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 138412290;
    v14 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDefaultPairedDevice", v14))
        {
          if (v6)
          {
            v10 = BBLogSync;
            if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v14;
              v20 = v9;
              _os_log_error_impl(&dword_20CCB9000, v10, OS_LOG_TYPE_ERROR, "Dismissal sync found more than one default paired device! Device: %@", buf, 0xCu);
            }
          }
          else
          {
            v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          }
          v12 = (void *)IDSCopyIDForDevice();
          objc_msgSend(v6, "addObject:", v12);

        }
        else
        {
          v11 = BBLogSync;
          if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v9;
            _os_log_impl(&dword_20CCB9000, v11, OS_LOG_TYPE_DEFAULT, "Found non default device: %@", buf, 0xCu);
          }
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_reallySend
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *queuedSectionID;
  NSString *queuedUniversalSectionID;
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BBSyncService _stopTimer](self, "_stopTimer");
  if (self->_queuedSectionID)
  {
    if (self->_queuedFeed)
    {
      v3 = -[NSMutableSet count](self->_pendingDismissalDictionaries, "count");
      v4 = -[NSMutableSet count](self->_pendingDismissalIDs, "count");
      if (v3 | v4)
      {
        v5 = v4;
        v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
        objc_msgSend(v11, "bs_setSafeObject:forKey:", self->_queuedSectionID, CFSTR("s"));
        objc_msgSend(v11, "bs_setSafeObject:forKey:", self->_queuedUniversalSectionID, CFSTR("u"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_queuedFeed);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bs_setSafeObject:forKey:", v6, CFSTR("f"));

        if (v3)
        {
          -[NSMutableSet allObjects](self->_pendingDismissalDictionaries, "allObjects");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bs_setSafeObject:forKey:", v7, CFSTR("b"));

        }
        if (v5)
        {
          -[NSMutableSet allObjects](self->_pendingDismissalIDs, "allObjects");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bs_setSafeObject:forKey:", v8, CFSTR("m"));

        }
        -[BBSyncService _sendSyncMessage:](self, "_sendSyncMessage:", v11);
        -[NSMutableSet removeAllObjects](self->_pendingDismissalDictionaries, "removeAllObjects");
        -[NSMutableSet removeAllObjects](self->_pendingDismissalIDs, "removeAllObjects");
        queuedSectionID = self->_queuedSectionID;
        self->_queuedFeed = 0;
        self->_queuedSectionID = 0;

        queuedUniversalSectionID = self->_queuedUniversalSectionID;
        self->_queuedUniversalSectionID = 0;

      }
    }
  }
}

- (void)_sendSyncMessage:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  IDSService *service;
  char v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  IDSService *v23;
  char v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BBSyncService _syncAccount](self, "_syncAccount");
  v5 = objc_claimAutoreleasedReturnValue();
  -[BBSyncService _syncLocalDevices](self, "_syncLocalDevices");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6)
  {
    if (v5)
    {
      v7 = (void *)IDSCopyIDForAccount();
      if (v7)
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", v7, 0);
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }
    v9 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v39 = v8;
      v40 = 2112;
      v41 = v6;
      v42 = 2112;
      v43 = v4;
      _os_log_impl(&dword_20CCB9000, v9, OS_LOG_TYPE_DEFAULT, "sending IDS message toCloudDestinations : %@ andToLocalDestinations: %@ message : %@", buf, 0x20u);
    }
    v10 = objc_alloc(MEMORY[0x24BDBCED8]);
    v11 = (void *)objc_msgSend(v10, "initWithObjectsAndKeys:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE4FA90], &unk_24C583670, *MEMORY[0x24BE4FB30], 0);
    service = self->_service;
    v36 = 0;
    v37 = 0;
    v13 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](service, "sendMessage:toDestinations:priority:options:identifier:error:", v4, v8, 100, v11, &v37, &v36);
    v14 = v37;
    v15 = v36;
    if ((v13 & 1) == 0)
    {
      v16 = BBLogSync;
      if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR))
        -[BBSyncService _sendSyncMessage:].cold.2((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
    }
    if (objc_msgSend((id)v6, "count"))
    {
      objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE4FAD8]);
      v23 = self->_service;
      v34 = v15;
      v35 = v14;
      v24 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v23, "sendMessage:toDestinations:priority:options:identifier:error:", v4, v6, 300, v11, &v35, &v34);
      v25 = v35;

      v26 = v34;
      if ((v24 & 1) == 0)
      {
        v27 = BBLogSync;
        if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR))
          -[BBSyncService _sendSyncMessage:].cold.1((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33);
      }
    }
    else
    {
      v25 = v14;
      v26 = v15;
    }

  }
}

- (id)_dismissalDictionaryForBulletin:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncHash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("h"));

  objc_msgSend(v4, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("d"));

  }
  return v5;
}

- (void)_startTimerIfNecessary
{
  BSContinuousMachTimer *v3;
  BSContinuousMachTimer *sendTimer;
  BSContinuousMachTimer *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_sendTimer)
  {
    objc_initWeak(&location, self);
    v3 = (BSContinuousMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x24BE0BDE8]), "initWithIdentifier:", CFSTR("com.apple.bulletinboard.BBSyncService.sendTimer"));
    sendTimer = self->_sendTimer;
    self->_sendTimer = v3;

    v5 = self->_sendTimer;
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __39__BBSyncService__startTimerIfNecessary__block_invoke;
    v7[3] = &unk_24C5656C8;
    objc_copyWeak(&v8, &location);
    -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v5, "scheduleWithFireInterval:leewayInterval:queue:handler:", queue, v7, 0.1, 0.1);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __39__BBSyncService__startTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reallySend");

}

- (void)_stopTimer
{
  BSContinuousMachTimer *sendTimer;
  BSContinuousMachTimer *v4;

  sendTimer = self->_sendTimer;
  if (sendTimer)
  {
    -[BSContinuousMachTimer invalidate](sendTimer, "invalidate");
    v4 = self->_sendTimer;
    self->_sendTimer = 0;

  }
}

- (id)_platformFromDeviceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return **((id **)&unk_24C5656E8 + a3 - 1);
}

- (BBSyncServiceDelegate)delegate
{
  return (BBSyncServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sendTimer, 0);
  objc_storeStrong((id *)&self->_queuedUniversalSectionID, 0);
  objc_storeStrong((id *)&self->_queuedSectionID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pendingDismissalIDs, 0);
  objc_storeStrong((id *)&self->_pendingDismissalDictionaries, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)service:(uint64_t)a3 account:(uint64_t)a4 incomingMessage:(uint64_t)a5 fromID:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "Received IDS message from invalid device: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_sendSyncMessage:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "send to local devices failed with error : %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_sendSyncMessage:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20CCB9000, a2, a3, "sending to cloud failed with error : %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
