@implementation NNMKSyncStateManager

- (NNMKSyncStateManager)init
{
  NNMKSyncStateManager *v2;
  BLTPingSubscriber *v3;
  BLTPingSubscriber *notificationsPingSubscriber;
  BLTPingSubscriber *v5;
  uint64_t v6;
  PSYSyncCoordinator *initialSyncCoordinator;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NNMKSyncStateManager;
  v2 = -[NNMKSyncStateManager init](&v17, sel_init);
  if (v2)
  {
    v3 = (BLTPingSubscriber *)objc_alloc_init(MEMORY[0x24BE0FEF8]);
    notificationsPingSubscriber = v2->_notificationsPingSubscriber;
    v2->_notificationsPingSubscriber = v3;

    objc_initWeak(&location, v2);
    v5 = v2->_notificationsPingSubscriber;
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __28__NNMKSyncStateManager_init__block_invoke;
    v14 = &unk_24F9F6DA0;
    objc_copyWeak(&v15, &location);
    -[BLTPingSubscriber subscribeToSectionID:withNotificationAckForwardHandler:](v5, "subscribeToSectionID:withNotificationAckForwardHandler:", CFSTR("com.apple.mobilemail"), &v11);
    objc_msgSend(MEMORY[0x24BE6E698], "syncCoordinatorWithServiceName:", CFSTR("com.apple.pairedsync.mail"), v11, v12, v13, v14);
    v6 = objc_claimAutoreleasedReturnValue();
    initialSyncCoordinator = v2->_initialSyncCoordinator;
    v2->_initialSyncCoordinator = (PSYSyncCoordinator *)v6;

    -[PSYSyncCoordinator setDelegate:](v2->_initialSyncCoordinator, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleDidUnpairNotification_, *MEMORY[0x24BE6B450], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__handlePairedDeviceChangedNotification_, *MEMORY[0x24BE6B420], 0);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)pairingStorePath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairingStorePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (BOOL)isInitialSyncRestricted
{
  return -[PSYSyncCoordinator syncRestriction](self->_initialSyncCoordinator, "syncRestriction") == 1;
}

void __28__NNMKSyncStateManager_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (v5)
  {
    v6 = a2;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __28__NNMKSyncStateManager_init__block_invoke_2;
    v9[3] = &unk_24F9F6D78;
    v10 = v5;
    objc_msgSend(v8, "syncStateManager:handleForwardForNotification:completion:", WeakRetained, v6, v9);

  }
}

uint64_t __28__NNMKSyncStateManager_init__block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t (*v6)(void);
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = __logCategories;
  v5 = os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Calling ack block back with BLTPingSubscribingForwardAllow", buf, 2u);
    }
    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Calling ack block back with BLTPingSubscribingForwardSuppress", v8, 2u);
    }
    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  return v6();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BE6B450], 0);

  v4.receiver = self;
  v4.super_class = (Class)NNMKSyncStateManager;
  -[NNMKSyncStateManager dealloc](&v4, sel_dealloc);
}

- (void)reportInitialSyncProgress:(double)a3
{
  id v4;

  -[PSYSyncCoordinator activeSyncSession](self->_initialSyncCoordinator, "activeSyncSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportProgress:", a3);

}

- (void)reportInitialSyncDidCompleteSending
{
  id v2;

  -[PSYSyncCoordinator activeSyncSession](self->_initialSyncCoordinator, "activeSyncSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDidCompleteSending");

}

- (void)reportInitialSyncDidComplete
{
  id v2;

  -[PSYSyncCoordinator activeSyncSession](self->_initialSyncCoordinator, "activeSyncSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncDidComplete");

}

- (void)reportInitialSyncDidFailWithError:(id)a3
{
  PSYSyncCoordinator *initialSyncCoordinator;
  id v4;
  id v5;

  initialSyncCoordinator = self->_initialSyncCoordinator;
  v4 = a3;
  -[PSYSyncCoordinator activeSyncSession](initialSyncCoordinator, "activeSyncSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncDidFailWithError:", v4);

}

- (id)pairedDeviceScreenSize
{
  void *v2;
  void *v3;

  -[NNMKSyncStateManager _pairedNanoRegistryDevice](self, "_pairedNanoRegistryDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B3C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pairedDeviceScreenScale
{
  void *v2;
  void *v3;

  -[NNMKSyncStateManager _pairedNanoRegistryDevice](self, "_pairedNanoRegistryDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForProperty:", *MEMORY[0x24BE6B3C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)willPresentNotificationForMessage:(id)a3
{
  id v4;
  void *v5;
  dispatch_semaphore_t v6;
  BLTPingSubscriber *notificationsPingSubscriber;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "checkState:", 1))
  {
LABEL_9:
    v16 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v4, "accountId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v15 = (void *)qword_253E87A90;
    if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
      -[NNMKSyncStateManager willPresentNotificationForMessage:].cold.1(v15, v4);
    goto LABEL_9;
  }
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v6 = dispatch_semaphore_create(0);
  notificationsPingSubscriber = self->_notificationsPingSubscriber;
  -[NNMKSyncStateManager _bbSubsectionIdsForMessage:](self, "_bbSubsectionIdsForMessage:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __58__NNMKSyncStateManager_willPresentNotificationForMessage___block_invoke;
  v18[3] = &unk_24F9F6DC8;
  v20 = &v26;
  v21 = &v22;
  v9 = v6;
  v19 = v9;
  -[BLTPingSubscriber getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:](notificationsPingSubscriber, "getWillNanoPresentNotificationForSectionID:subsectionIDs:completion:", CFSTR("com.apple.mobilemail"), v8, v18);

  v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  v11 = qword_253E87A90;
  if (*((_BYTE *)v23 + 24))
  {
    v12 = (id)qword_253E87A90;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "messageId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *((unsigned __int8 *)v27 + 24);
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      v32 = 1024;
      v33 = v14;
      _os_log_impl(&dword_22E161000, v12, OS_LOG_TYPE_DEFAULT, "#BulletinDistributor Ping Subscriber did respond. (Id: %{public}@, Notification: %d)", buf, 0x12u);

    }
  }
  else if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_ERROR))
  {
    -[NNMKSyncStateManager willPresentNotificationForMessage:].cold.2(v11);
  }
  v16 = *((_BYTE *)v27 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
LABEL_13:

  return v16;
}

intptr_t __58__NNMKSyncStateManager_willPresentNotificationForMessage___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handleDidUnpairNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "Received Unpair notification from NanoRegistry. Informing NNMKSyncProvider...", v6, 2u);
  }
  -[NNMKSyncStateManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncStateManagerDidUnpair:", self);

}

- (void)_handlePairedDeviceChangedNotification:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22E161000, v4, OS_LOG_TYPE_DEFAULT, "Received Paired Device Changed notification from NanoRegistry. Informing NNMKSyncProvider...", v6, 2u);
  }
  -[NNMKSyncStateManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncStateManagerDidChangePairedDevice:", self);

}

- (BOOL)pairedDeviceSupportsMailContentProtectedChannel
{
  void *v2;
  void *v3;
  char v4;

  -[NNMKSyncStateManager _pairedNanoRegistryDevice](self, "_pairedNanoRegistryDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("0AEBD96A-0D13-42E0-9D9B-3D4BFAB8B7DB"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a4;
  v6 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Received notification from PairedSync to begin SyncSession. Informing NNMKSyncProvider...", v11, 2u);
  }
  -[NNMKSyncStateManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncSessionType");
  NSStringfromPSYSyncSessionType();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncStateManagerDidBeginSyncSession:syncSessionType:syncSessionIdentifier:", self, v8, v10);

}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v5 = a4;
  v6 = qword_253E87A90;
  if (os_log_type_enabled((os_log_t)qword_253E87A90, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22E161000, v6, OS_LOG_TYPE_DEFAULT, "Received notification from PairedSync to invalidate SyncSession. Informing NNMKSyncProvider...", v10, 2u);
  }
  -[NNMKSyncStateManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sessionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncStateManagerDidInvalidateSyncSession:syncSessionIdentifier:", self, v9);

}

- (id)_bbSubsectionIdsForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v4, "accountId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "checkState:", 64))
    objc_msgSend(v7, "addObject:", CFSTR("com.apple.mobilemail.bulletin-subsection.VIP"));
  if (objc_msgSend(v4, "checkState:", 128))
    objc_msgSend(v7, "addObject:", CFSTR("com.apple.mobilemail.bulletin-subsection.ThreadNotify"));
  -[NNMKSyncStateManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailboxId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "syncStateManagerShouldAddFavoriteSubsectionForMailboxId:", v9);

  if (v10)
    objc_msgSend(v7, "addObject:", CFSTR("com.apple.mobilemail.bulletin-subsection.FavoriteMailboxes"));

  return v7;
}

- (id)_pairedNanoRegistryDevice
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)pairedDeviceSupportsMultipleMailboxes
{
  void *v2;
  int v3;

  -[NNMKSyncStateManager _pairedNanoRegistryDevice](self, "_pairedNanoRegistryDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NRWatchOSVersionForRemoteDevice();

  return (v3 & 0xFFFC0000) != 0;
}

- (BOOL)pairedDeviceSupportsStandaloneMode
{
  void *v2;
  void *v3;
  char v4;

  -[NNMKSyncStateManager _pairedNanoRegistryDevice](self, "_pairedNanoRegistryDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CFACCB8-FFEB-4682-A50E-16F853583912"));
  v4 = objc_msgSend(v2, "supportsCapability:", v3);

  return v4;
}

- (NNMKSyncStateManagerDelegate)delegate
{
  return (NNMKSyncStateManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (BLTPingSubscriber)notificationsPingSubscriber
{
  return self->_notificationsPingSubscriber;
}

- (void)setNotificationsPingSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsPingSubscriber, a3);
}

- (PSYSyncCoordinator)initialSyncCoordinator
{
  return self->_initialSyncCoordinator;
}

- (void)setInitialSyncCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_initialSyncCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncCoordinator, 0);
  objc_storeStrong((id *)&self->_notificationsPingSubscriber, 0);
  objc_destroyWeak((id *)&self->delegate);
}

- (void)willPresentNotificationForMessage:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_22E161000, v3, OS_LOG_TYPE_ERROR, "Received message with nil accountId. It will not preset notification. %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)willPresentNotificationForMessage:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22E161000, log, OS_LOG_TYPE_ERROR, "Please file a radar. #BulletinDistributor Ping Subscriber did NOT respond within 5 seconds. Assuming we WILL generate a notification.", v1, 2u);
}

@end
