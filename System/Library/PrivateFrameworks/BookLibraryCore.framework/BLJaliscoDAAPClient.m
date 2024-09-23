@implementation BLJaliscoDAAPClient

- (id)newManagedObjectContextWithPrivateQueueConcurrency
{
  void *v2;
  void *v3;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newManagedObjectContextWithPrivateQueueConcurrency");

  return v3;
}

+ (BOOL)workaround_18397698
{
  void *v2;
  char v3;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "workaround");

  return v3;
}

+ (void)initialize
{
  void *v2;
  void *v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v2, CFSTR("kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary"));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerDefaults:", v4);

  }
}

+ (id)sharedClient
{
  BLJaliscoDAAPClient *v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_253DB1F50);
  if (!qword_253DB1FB8)
  {
    v2 = objc_alloc_init(BLJaliscoDAAPClient);
    v3 = (void *)qword_253DB1FB8;
    qword_253DB1FB8 = (uint64_t)v2;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_253DB1F50);
  return (id)qword_253DB1FB8;
}

- (BLJaliscoDAAPClient)init
{
  char *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BLJaliscoDAAPClient *v26;
  NSObject *v27;
  uint8_t v29[16];
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)BLJaliscoDAAPClient;
  v2 = -[BLJaliscoDAAPClient init](&v30, sel_init);
  if (!v2)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeStoreAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_DSID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_queue_create("Jalisco_DAAP_Server_Worker_Queue", v7);
  v9 = (void *)*((_QWORD *)v2 + 5);
  *((_QWORD *)v2 + 5) = v8;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("Jalisco_DAAP_DSID_Queue", v11);
  v13 = (void *)*((_QWORD *)v2 + 14);
  *((_QWORD *)v2 + 14) = v12;

  *(_OWORD *)(v2 + 88) = xmmword_212CD0B60;
  *((_QWORD *)v2 + 6) = 0;
  v14 = objc_opt_new();
  v15 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v14;

  v16 = objc_opt_new();
  v17 = (void *)*((_QWORD *)v2 + 3);
  *((_QWORD *)v2 + 3) = v16;

  v2[68] = 0;
  v2[60] = 0;
  v18 = objc_opt_new();
  v19 = (void *)*((_QWORD *)v2 + 15);
  *((_QWORD *)v2 + 15) = v18;

  v20 = objc_opt_new();
  v21 = (void *)*((_QWORD *)v2 + 16);
  *((_QWORD *)v2 + 16) = v20;

  *((_DWORD *)v2 + 16) = 0;
  *((_DWORD *)v2 + 14) = 0;
  if (*((_QWORD *)v2 + 1))
  {
    v22 = (void *)objc_msgSend(v2, "_newPurchaseDAAPServerWithDSID:");
    objc_msgSend(*((id *)v2 + 15), "setObject:forKeyedSubscript:", v22, *((_QWORD *)v2 + 1));

    ++*((_QWORD *)v2 + 11);
  }
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = objc_msgSend(v2, "newManagedObjectContextWithPrivateQueueConcurrency");
    v25 = (void *)*((_QWORD *)v2 + 17);
    *((_QWORD *)v2 + 17) = v24;

    objc_msgSend(v2, "_startObservingNotifications");
LABEL_6:
    v26 = v2;
    goto LABEL_10;
  }
  BLJaliscoLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_212C78000, v27, OS_LOG_TYPE_ERROR, "Unable to initialize BLJaliscoDAAPClient", v29, 2u);
  }

  v26 = 0;
LABEL_10:

  return v26;
}

- (void)_startObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:accountTypes:", self, 1);

}

+ (void)preWarmSync
{
  MEMORY[0x24BEDD108](BLJaliscoServerSource, sel_preWarmSync);
}

+ (BOOL)isSupported
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[BLJaliscoDAAPClient _stopObservingNotifications](self, "_stopObservingNotifications");
  v3.receiver = self;
  v3.super_class = (Class)BLJaliscoDAAPClient;
  -[BLJaliscoDAAPClient dealloc](&v3, sel_dealloc);
}

- (void)_stopObservingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:accountTypes:", self, 1);

}

- (NSPersistentHistoryToken)currentJaliscoHistoryToken
{
  void *v2;
  void *v3;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentJaliscoHistoryToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentHistoryToken *)v3;
}

- (void)setIsGDPRPrivacyAcknowledgementRequired:(BOOL)a3
{
  os_unfair_lock_s *p_isGDPRPrivacyAcknowledgementLock;
  _QWORD v4[5];
  BOOL v5;

  p_isGDPRPrivacyAcknowledgementLock = &self->_isGDPRPrivacyAcknowledgementLock;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_212CAD600;
  v4[3] = &unk_24CE8BC50;
  v4[4] = self;
  v5 = a3;
  os_unfair_lock_lock(&self->_isGDPRPrivacyAcknowledgementLock);
  sub_212CAD600((uint64_t)v4);
  os_unfair_lock_unlock(p_isGDPRPrivacyAcknowledgementLock);
}

- (BOOL)isGDPRPrivacyAcknowledgementRequired
{
  os_unfair_lock_s *p_isGDPRPrivacyAcknowledgementLock;
  _QWORD *v3;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t);
  void *v7;
  BLJaliscoDAAPClient *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_isGDPRPrivacyAcknowledgementLock = &self->_isGDPRPrivacyAcknowledgementLock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v6 = sub_212CAD6D8;
  v7 = &unk_24CE8BC78;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock(p_isGDPRPrivacyAcknowledgementLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_isGDPRPrivacyAcknowledgementLock);

  LOBYTE(p_isGDPRPrivacyAcknowledgementLock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_isGDPRPrivacyAcknowledgementLock;
}

- (void)setStoreAuthenticationRequired:(BOOL)a3
{
  os_unfair_lock_s *p_authenticationLock;
  _QWORD v4[5];
  BOOL v5;

  p_authenticationLock = &self->_authenticationLock;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_212CAD760;
  v4[3] = &unk_24CE8BC50;
  v4[4] = self;
  v5 = a3;
  os_unfair_lock_lock(&self->_authenticationLock);
  sub_212CAD760((uint64_t)v4);
  os_unfair_lock_unlock(p_authenticationLock);
}

- (BOOL)storeAuthenticationRequired
{
  os_unfair_lock_s *p_authenticationLock;
  _QWORD *v3;
  _QWORD v5[2];
  uint64_t (*v6)(uint64_t);
  void *v7;
  BLJaliscoDAAPClient *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_authenticationLock = &self->_authenticationLock;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v6 = sub_212CAD838;
  v7 = &unk_24CE8BC78;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock(p_authenticationLock);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_authenticationLock);

  LOBYTE(p_authenticationLock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_authenticationLock;
}

- (void)refreshSignInStatus
{
  NSObject *serverWorkerQueue;
  _QWORD block[5];

  serverWorkerQueue = self->_serverWorkerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CAD8A4;
  block[3] = &unk_24CE8B1F0;
  block[4] = self;
  dispatch_async(serverWorkerQueue, block);
}

- (void)jaliscoArtworkTimebombed
{
  NSObject *serverWorkerQueue;
  NSObject *v4;
  unint64_t timebombRetries;
  _QWORD block[5];
  uint8_t buf[4];
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_timebombRetries > 2)
  {
    BLJaliscoLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      timebombRetries = self->_timebombRetries;
      *(_DWORD *)buf = 134217984;
      v8 = timebombRetries;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEBUG, "ARTWORK: Ignoring timebomb on its %lu try.", buf, 0xCu);
    }

  }
  else
  {
    serverWorkerQueue = self->_serverWorkerQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212CAD9B8;
    block[3] = &unk_24CE8B1F0;
    block[4] = self;
    dispatch_async(serverWorkerQueue, block);
  }
  ++self->_timebombRetries;
}

- (void)forceJaliscoArtworkUpdateWithCompletion:(id)a3
{
  id v4;
  NSObject *serverWorkerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serverWorkerQueue = self->_serverWorkerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212CADB28;
  v7[3] = &unk_24CE8BCA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serverWorkerQueue, v7);

}

- (void)fetchItemsForStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *moc;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  moc = self->_moc;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CADD48;
  v11[3] = &unk_24CE8BCF0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSManagedObjectContext performBlock:](moc, "performBlock:", v11);

}

- (id)fetchItemsForStoreIDs:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectContext *moc;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  BLJaliscoDAAPClient *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  moc = self->_moc;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212CADF60;
  v12[3] = &unk_24CE8BD18;
  v13 = v4;
  v14 = self;
  v7 = v5;
  v15 = v7;
  v8 = v4;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v12);
  v9 = v15;
  v10 = v7;

  return v10;
}

- (id)fetchAllBookletIDsWithParentStoreIDs:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectContext *moc;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  BLJaliscoDAAPClient *v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  moc = self->_moc;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CAE154;
  v11[3] = &unk_24CE8BD18;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v7 = v5;
  v8 = v4;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v11);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)fetchItemsForBuyParameters:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSManagedObjectContext *moc;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  moc = self->_moc;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CAE328;
  v11[3] = &unk_24CE8BCF0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[NSManagedObjectContext performBlock:](moc, "performBlock:", v11);

}

- (void)hideItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *serverWorkerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serverWorkerQueue = self->_serverWorkerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CAE52C;
  block[3] = &unk_24CE8BCF0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serverWorkerQueue, block);

}

- (void)fetchAllHiddenItemStoreIDsWithCompletion:(id)a3
{
  id v4;
  NSManagedObjectContext *moc;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  moc = self->_moc;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_212CAE71C;
  v7[3] = &unk_24CE8BCA0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSManagedObjectContext performBlock:](moc, "performBlock:", v7);

}

- (void)setItemHidden:(BOOL)a3 forStoreID:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v6 = a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v25 = a5;
  v9 = -[BLJaliscoDAAPClient newManagedObjectContext](self, "newManagedObjectContext");
  -[BLJaliscoDAAPClient fetchRequestForStoreIDIncludingHidden:](self, "fetchRequestForStoreIDIncludingHidden:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v10, &v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v31;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIsHidden:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v9, "hasChanges"))
  {
    v26 = 0;
    LODWORD(v19) = objc_msgSend(v9, "save:", &v26);
    v20 = v26;
    if (v20)
      v19 = v19;
    else
      v19 = 1;
    if ((v19 & 1) == 0)
    {
      BLJaliscoLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v20;
        _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_ERROR, "Set items hidden: Moc Save Error:  %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v19 = 1;
  }
  v22 = MEMORY[0x2199A44E0](v25);
  v23 = (void *)v22;
  if (v22)
    (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v22, v19);

}

- (void)resetPurchasedTokenForStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[BLJaliscoDAAPClient newManagedObjectContext](self, "newManagedObjectContext");
  -[BLJaliscoDAAPClient fetchRequestForAllStoreIDs:](self, "fetchRequestForAllStoreIDs:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setPurchasedTokenCode:", CFSTR("0"));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v8, "hasChanges"))
  {
    v22 = 0;
    LODWORD(v17) = objc_msgSend(v8, "save:", &v22);
    v18 = v22;
    if (v18)
      v17 = v17;
    else
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      BLJaliscoLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v18;
        _os_log_impl(&dword_212C78000, v19, OS_LOG_TYPE_ERROR, "Reset purchase token: Moc Save Error:  %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v17 = 1;
  }
  v20 = MEMORY[0x2199A44E0](v7);
  v21 = (void *)v20;
  if (v20)
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v17);

}

- (void)storeIDsWithNonEmptyPurchasedToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id v21;
  uint8_t buf[4];
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  v8 = -[BLJaliscoDAAPClient newManagedObjectContext](self, "newManagedObjectContext");
  -[BLJaliscoDAAPClient fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:](self, "fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = CFSTR("storeID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v10);

  objc_msgSend(v9, "setResultType:", 2);
  v21 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  if (v12)
  {
    BLJaliscoLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_impl(&dword_212C78000, v13, OS_LOG_TYPE_ERROR, "Non-empty purchase token storeIDs: Moc Fetch Error:  %@", buf, 0xCu);
    }

  }
  objc_msgSend(v11, "valueForKey:", CFSTR("storeID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bu_arrayByRemovingNSNulls");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = (void *)MEMORY[0x24BDBD1A8];
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199A44E0](v6);
  if (v20)
    ((void (**)(_QWORD, void *, BOOL))v20)[2](v20, v19, v12 == 0);

}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CAEF8C;
  v10[3] = &unk_24CE8BD68;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[BLJaliscoDAAPClient updatePolitely:reason:completion:](self, "updatePolitely:reason:completion:", v6, a4, v10);

}

- (void)updatePolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *serverWorkerQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a5;
  serverWorkerQueue = self->_serverWorkerQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CAF1F8;
  v11[3] = &unk_24CE8BE80;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a4;
  v10 = v8;
  dispatch_async(serverWorkerQueue, v11);

}

- (void)updatePolitelyAfterSignOut:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  NSObject *dsidQueue;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *currentAccountNumber;
  NSObject *v15;
  NSNumber *v16;
  _QWORD block[5];
  uint8_t buf[4];
  _DWORD v19[7];

  v6 = a3;
  *(_QWORD *)&v19[5] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  BLJaliscoLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v19[0] = v6;
    LOWORD(v19[1]) = 2048;
    *(_QWORD *)((char *)&v19[1] + 2) = a4;
    _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEFAULT, "updatePolitelyAfterSignOut politely:%{BOOL}d reason:%ld", buf, 0x12u);
  }

  dsidQueue = self->_dsidQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CB039C;
  block[3] = &unk_24CE8B1F0;
  block[4] = self;
  dispatch_sync(dsidQueue, block);
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeStoreAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_DSID");
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  currentAccountNumber = self->_currentAccountNumber;
  self->_currentAccountNumber = v13;

  -[BLJaliscoDAAPClient _resetPurchaseDAAPServersWithQueue:](self, "_resetPurchaseDAAPServersWithQueue:", self->_serverWorkerQueue);
  -[BLJaliscoDAAPClient _addPurchaseServerForCurrentUser](self, "_addPurchaseServerForCurrentUser");
  BLJaliscoLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = self->_currentAccountNumber;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v19 = v16;
    _os_log_impl(&dword_212C78000, v15, OS_LOG_TYPE_DEFAULT, "updatePolitelyAfterSignOut Triggering updatePolitely now for %@", buf, 0xCu);
  }

  -[BLJaliscoDAAPClient updatePolitely:reason:completion:](self, "updatePolitely:reason:completion:", v6, a4, v8);
}

- (id)_newPurchaseDAAPServerWithDSID:(id)a3
{
  id v4;
  void *v5;
  BLPurchaseDAAPServer *v6;

  v4 = a3;
  +[BLPrivacyInfo sharedPrivacyInfo](BLPrivacyInfo, "sharedPrivacyInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BLPurchaseDAAPServer initWithDSID:delegate:privacyInfo:]([BLPurchaseDAAPServer alloc], "initWithDSID:delegate:privacyInfo:", v4, self, v5);

  return v6;
}

- (void)_addPurchaseServerForCurrentUser
{
  NSNumber *currentAccountNumber;
  NSObject *v4;
  _BOOL4 v5;
  NSNumber *v6;
  NSObject *dsidQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NSNumber *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  currentAccountNumber = self->_currentAccountNumber;
  BLJaliscoLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (currentAccountNumber)
  {
    if (v5)
    {
      v6 = self->_currentAccountNumber;
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEFAULT, "_addPurchaseServerForCurrentUser dsid:%@", buf, 0xCu);
    }

    dsidQueue = self->_dsidQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_212CB0560;
    block[3] = &unk_24CE8B1F0;
    block[4] = self;
    dispatch_sync(dsidQueue, block);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v4, OS_LOG_TYPE_DEFAULT, "_addPurchaseServerForCurrentUser no current account", buf, 2u);
    }

  }
}

- (void)refreshStoreWithCompletion:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshStoreWithCompletion:", v3);

}

- (void)updatePolitelyAfterSignIn:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  NSNumber *currentAccountNumber;
  NSObject *v14;
  _DWORD v15[2];
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  BLJaliscoLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109376;
    v15[1] = v6;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_212C78000, v9, OS_LOG_TYPE_DEFAULT, "updatePolitelyAfterSignIn politely:%{BOOL}d reason:%ld", (uint8_t *)v15, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeStoreAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ams_DSID");
  v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  currentAccountNumber = self->_currentAccountNumber;
  self->_currentAccountNumber = v12;

  -[BLJaliscoDAAPClient _addPurchaseServerForCurrentUser](self, "_addPurchaseServerForCurrentUser");
  -[BLJaliscoDAAPClient _resetPurchaseDAAPServersWithQueue:](self, "_resetPurchaseDAAPServersWithQueue:", self->_serverWorkerQueue);
  -[BLJaliscoDAAPClient resetPoliteTimers](self, "resetPoliteTimers");
  BLJaliscoLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15[0]) = 0;
    _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_DEFAULT, "updatePolitelyAfterSignIn Triggering updatePolitely now", (uint8_t *)v15, 2u);
  }

  -[BLJaliscoDAAPClient updatePolitely:reason:completion:](self, "updatePolitely:reason:completion:", v6, a4, v8);
}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completionWithError:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_212CB0958;
  v10[3] = &unk_24CE8BD68;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[BLJaliscoDAAPClient updateFamilyPolitely:reason:completion:](self, "updateFamilyPolitely:reason:completion:", v6, a4, v10);

}

- (void)updateFamilyPolitely:(BOOL)a3 reason:(int64_t)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  int AppBooleanValue;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  int64_t v23;
  BOOL v24;
  id buf;
  uint64_t v26;

  v6 = a3;
  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_212CB0D90;
  v21[3] = &unk_24CE8BEF8;
  v21[4] = self;
  v10 = v8;
  v22 = v10;
  v23 = a4;
  v24 = v6;
  v11 = (void *)MEMORY[0x2199A44E0](v21);
  BLJaliscoLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v6;
    _os_log_impl(&dword_212C78000, v12, OS_LOG_TYPE_DEFAULT, "Starting jalisco family purchase update (politely: %d)", (uint8_t *)&buf, 8u);
  }

  LOBYTE(buf) = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), (Boolean *)&buf);
  if ((_BYTE)buf && AppBooleanValue)
  {
    BLJaliscoLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_212C78000, v14, OS_LOG_TYPE_DEFAULT, "Skipping update family due to store demo mode.", (uint8_t *)&buf, 2u);
    }

    v15 = MEMORY[0x2199A44E0](v10);
    v16 = (void *)v15;
    if (v15)
      (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, 1);

  }
  else
  {
    objc_initWeak(&buf, self);
    +[BLFamilyCircleController sharedInstance](BLFamilyCircleController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = sub_212CB1798;
    v18[3] = &unk_24CE8BF20;
    objc_copyWeak(&v20, &buf);
    v19 = v11;
    objc_msgSend(v17, "refreshWithCompletion:", v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&buf);
  }

}

- (id)fetchRequestForStoreID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLJaliscoDAAPClient _dsids](self, "_dsids");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestForStoreIDs:dsids:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchRequestForStoreIDIncludingHidden:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[BLJaliscoDAAPClient _dsids](self, "_dsids");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestForAllStoreIDs:dsids:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchRequestForStoreIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoDAAPClient _dsids](self, "_dsids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestForStoreIDs:dsids:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchRequestForAllStoreIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoDAAPClient _dsids](self, "_dsids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestForAllStoreIDs:dsids:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoDAAPClient _dsids](self, "_dsids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestForAllStoreIDsWithNonEmptyPurchasedToken:dsids:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fetchRequestForBuyParameters:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestForBuyParameters:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchRequestForBookletItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestForBookletItemsForStoreIDs:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)fetchRequestForHiddenItems
{
  void *v3;
  void *v4;
  void *v5;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoDAAPClient _dsids](self, "_dsids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestForHiddenItemsWithAccountIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)predicateForItems:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoDAAPClient _dsids](self, "_dsids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForItems:dsids:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)predicateForBookletItems:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLJaliscoDAAPClient _dsids](self, "_dsids");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForBookletItems:dsids:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)newManagedObjectContext
{
  void *v2;
  void *v3;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newManagedObjectContext");

  return v3;
}

- (id)persistentStoreCoordinator
{
  void *v2;
  void *v3;

  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)resetPoliteTimers
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BLJaliscoLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "valueForKey:", CFSTR("kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_212C78000, v3, OS_LOG_TYPE_DEFAULT, "Resetting polite timers ... clearing old dictionary:%@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("kJaliscoDAAPClientLastSuccessfulFullUpdateDateDictionary"));

  v6 = objc_msgSend(v2, "synchronize");
  if ((v6 & 1) == 0)
  {
    BLJaliscoLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_212C78000, v7, OS_LOG_TYPE_ERROR, "ERROR: Could not reset polite timer.", (uint8_t *)&v9, 2u);
    }

  }
  return v6;
}

- (void)deleteItemsWithStoreIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSManagedObjectContext *moc;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BLJaliscoLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_212C78000, v8, OS_LOG_TYPE_ERROR, "deleteItemsWithStoreIDs storeIDs:%@", buf, 0xCu);
  }

  moc = self->_moc;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_212CB1FC4;
  v12[3] = &unk_24CE8BCF0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v12);

}

- (id)_fetchItemsForNeedsImport:(BOOL)a3
{
  void *v5;
  NSManagedObjectContext *moc;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v5 = (void *)objc_opt_new();
  moc = self->_moc;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_212CB23E8;
  v11[3] = &unk_24CE8BF48;
  v13 = a3;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  -[NSManagedObjectContext performBlockAndWait:](moc, "performBlockAndWait:", v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (id)_allPurchaseDAAPServers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_212CADC14;
  v11 = sub_212CADC24;
  v12 = 0;
  -[BLJaliscoDAAPClient dsidQueue](self, "dsidQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB25F4;
  v6[3] = &unk_24CE8BC78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_currentPurchaseDAAPServers
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_212CADC14;
  v11 = sub_212CADC24;
  v12 = 0;
  -[BLJaliscoDAAPClient dsidQueue](self, "dsidQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB2728;
  v6[3] = &unk_24CE8B4E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_familyPurchaseDAAPServers
{
  NSObject *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_212CADC14;
  v11 = sub_212CADC24;
  v12 = 0;
  -[BLJaliscoDAAPClient dsidQueue](self, "dsidQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB28C8;
  v6[3] = &unk_24CE8BC78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_dsids
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_212CADC14;
  v11 = sub_212CADC24;
  v12 = 0;
  -[BLJaliscoDAAPClient dsidQueue](self, "dsidQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_212CB2A74;
  v6[3] = &unk_24CE8BC78;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_fetchRequestForNotInStoreAccountIDs:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestForNotInStoreAccountIDs:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_processFamilyCircleAdded:(id)a3 removed:(id)a4 unchanged:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dsidQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  BLJaliscoDAAPClient *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dsidQueue = self->_dsidQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CB2C70;
  block[3] = &unk_24CE8BFC0;
  v20 = v10;
  v21 = v12;
  v22 = self;
  v23 = v11;
  v24 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  v18 = v10;
  dispatch_async(dsidQueue, block);

}

- (void)_sendCompletionHandlersWithSuccess:(BOOL)a3 generation:(unint64_t)a4
{
  NSObject *serverWorkerQueue;
  _QWORD block[6];
  BOOL v6;

  serverWorkerQueue = self->_serverWorkerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_212CB3564;
  block[3] = &unk_24CE8C010;
  block[4] = self;
  block[5] = a4;
  v6 = a3;
  dispatch_async(serverWorkerQueue, block);
}

- (void)_resetPurchaseDAAPServersWithQueue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BLJaliscoDAAPClient _allPurchaseDAAPServers](self, "_allPurchaseDAAPServers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "resetWithQueue:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)purchaseServerHandleClientExpired
{
  id v3;

  -[BLJaliscoDAAPClient delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDetectedPurchaseServerClientExpired:", self);

}

- (void)purchaseServerRequestGDPRPrivacyAcknowledgementRequired
{
  -[BLJaliscoDAAPClient setIsGDPRPrivacyAcknowledgementRequired:](self, "setIsGDPRPrivacyAcknowledgementRequired:", 1);
}

- (void)purchaseServerRequestITunesAuthentication
{
  -[BLJaliscoDAAPClient setStoreAuthenticationRequired:](self, "setStoreAuthenticationRequired:", 1);
}

- (void)resetStaleJaliscoDatabaseWithCompletion:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[BLJaliscoServerSource sharedSource](BLJaliscoServerSource, "sharedSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = objc_msgSend(v4, "truncateDatabaseError:", &v14);
  v6 = v14;

  BLJaliscoLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v9 = "Account Changed. Truncated jalisco database";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEFAULT;
    v12 = 2;
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    v9 = "Could not truncate database. error:  %@";
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 12;
  }
  _os_log_impl(&dword_212C78000, v10, v11, v9, buf, v12);
LABEL_7:

  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199A44E0](v3);
  if (v13)
    ((void (**)(_QWORD, id))v13)[2](v13, v6);

}

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  NSObject *v6;
  NSNumber *currentAccountNumber;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  NSNumber *v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *dsidQueue;
  uint64_t *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  BLJaliscoDAAPClient *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  BLJaliscoDAAPClient *v31;
  uint8_t buf[4];
  unint64_t v33;
  __int16 v34;
  NSNumber *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return;
  BLJaliscoLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    currentAccountNumber = self->_currentAccountNumber;
    objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activeStoreAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ams_DSID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218499;
    v33 = a4;
    v34 = 2113;
    v35 = currentAccountNumber;
    v36 = 2113;
    v37 = v10;
    _os_log_impl(&dword_212C78000, v6, OS_LOG_TYPE_DEFAULT, "Account Changed. Resetting and refreshing... with reason %lu. Updating accountNumber from old:%{private}@ to new:%{private}@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BE0FBE8], "sharedProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeStoreAccount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "ams_DSID");
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = self->_currentAccountNumber;
  self->_currentAccountNumber = v13;

  v15 = a4 - 101;
  if (a4 - 101 > 1)
  {
    if (a4 != 100 || !self->_currentAccountNumber)
      goto LABEL_12;
    dsidQueue = self->_dsidQueue;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = sub_212CB3D48;
    v25 = &unk_24CE8B1F0;
    v26 = self;
    v18 = &v22;
  }
  else
  {
    BLJaliscoLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v16, OS_LOG_TYPE_DEFAULT, "Jalisco account stale .. removeAllObjects", buf, 2u);
    }

    dsidQueue = self->_dsidQueue;
    v27 = MEMORY[0x24BDAC760];
    v28 = 3221225472;
    v29 = sub_212CB3D18;
    v30 = &unk_24CE8B1F0;
    v31 = self;
    v18 = &v27;
  }
  dispatch_sync(dsidQueue, v18);
LABEL_12:
  -[BLJaliscoDAAPClient _resetPurchaseDAAPServersWithQueue:](self, "_resetPurchaseDAAPServersWithQueue:", self->_serverWorkerQueue, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31);
  -[BLJaliscoDAAPClient delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 > 1)
  {
    BLJaliscoLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v21, OS_LOG_TYPE_DEFAULT, "Triggering clientDetectedStoreChange", buf, 2u);
    }

    objc_msgSend(v19, "clientDetectedStoreChange:", self);
  }
  else
  {
    -[BLJaliscoDAAPClient resetPoliteTimers](self, "resetPoliteTimers");
    BLJaliscoLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212C78000, v20, OS_LOG_TYPE_DEFAULT, "Triggering clientDetectedStoreChangeAndAccountChange", buf, 2u);
    }

    objc_msgSend(v19, "clientDetectedStoreChangeAndAccountChange:", self);
  }

}

- (BOOL)isInitiallyLoadingJalisco
{
  return self->_initiallyLoadingJalisco;
}

- (BLJaliscoDAAPClientDelegate)delegate
{
  return (BLJaliscoDAAPClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BLImageManager)imageManagerDelegate
{
  return (BLImageManager *)objc_loadWeakRetained((id *)&self->_imageManagerDelegate);
}

- (void)setImageManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_imageManagerDelegate, a3);
}

- (unint64_t)currentServerGeneration
{
  return self->_currentServerGeneration;
}

- (void)setCurrentServerGeneration:(unint64_t)a3
{
  self->_currentServerGeneration = a3;
}

- (unint64_t)pendingUpdateGeneration
{
  return self->_pendingUpdateGeneration;
}

- (void)setPendingUpdateGeneration:(unint64_t)a3
{
  self->_pendingUpdateGeneration = a3;
}

- (id)resetJaliscoStatusHandler
{
  return self->_resetJaliscoStatusHandler;
}

- (void)setResetJaliscoStatusHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (OS_dispatch_queue)dsidQueue
{
  return self->_dsidQueue;
}

- (void)setDsidQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dsidQueue, a3);
}

- (NSMutableDictionary)swqDSIDToDAAPServer
{
  return self->_swqDSIDToDAAPServer;
}

- (void)setSwqDSIDToDAAPServer:(id)a3
{
  objc_storeStrong((id *)&self->_swqDSIDToDAAPServer, a3);
}

- (NSMutableSet)purchaseDAAPSyncsInFlight
{
  return self->_purchaseDAAPSyncsInFlight;
}

- (void)setPurchaseDAAPSyncsInFlight:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseDAAPSyncsInFlight, a3);
}

- (NSManagedObjectContext)moc
{
  return self->_moc;
}

- (void)setMoc:(id)a3
{
  objc_storeStrong((id *)&self->_moc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moc, 0);
  objc_storeStrong((id *)&self->_purchaseDAAPSyncsInFlight, 0);
  objc_storeStrong((id *)&self->_swqDSIDToDAAPServer, 0);
  objc_storeStrong((id *)&self->_dsidQueue, 0);
  objc_storeStrong(&self->_resetJaliscoStatusHandler, 0);
  objc_destroyWeak((id *)&self->_imageManagerDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverWorkerQueue, 0);
  objc_storeStrong((id *)&self->_familyCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_currentAccountNumber, 0);
}

@end
