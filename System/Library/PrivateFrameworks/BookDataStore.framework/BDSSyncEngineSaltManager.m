@implementation BDSSyncEngineSaltManager

- (BDSSyncEngineSaltManager)initWithDatabase:(id)a3 observer:(id)a4
{
  id v7;
  id v8;
  BDSSyncEngineSaltManager *v9;
  BDSSyncEngineSaltManager *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BDSSyncEngineSaltManager;
  v9 = -[BDSSyncEngineSaltManager init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_database, a3);
    objc_storeWeak((id *)&v10->_observer, v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.BDSSyncEngineSaltManager.workQueue", v11);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v12;

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v18, v19, (uint64_t)v10, (uint64_t)sel__updatedReachability, (uint64_t)CFSTR("kNetworkReachabilityChangedNotification"), 0);

  }
  return v10;
}

- (NSString)establishedSaltVersionIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_227D751CC;
  v14 = sub_227D751DC;
  v15 = 0;
  objc_msgSend_workQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_227D751E4;
  v9[3] = &unk_24F089190;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSString *)v7;
}

- (void)refreshSalt:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_workQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D752F8;
  block[3] = &unk_24F0891B8;
  objc_copyWeak(&v13, &location);
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)refreshSaltIfNeeded:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_workQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D75410;
  block[3] = &unk_24F0891B8;
  objc_copyWeak(&v13, &location);
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)wq_refreshSalt:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id buf[2];

  v4 = a3;
  if (objc_msgSend_isSaltRefreshInProgress(self, v5, v6, v7, v8))
  {
    BDSCloudKitLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_227D4F000, v12, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Salt refresh already in progress. Ignoring -refreshSalt: call", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    objc_msgSend_setIsSaltRefreshInProgress_(self, v9, 1, v10, v11);
    objc_msgSend_wq_invalidateSalt(self, v13, v14, v15, v16);
    BDSCloudKitLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_227D4F000, v17, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Establishing record salt", (uint8_t *)buf, 2u);
    }

    v18 = objc_alloc(MEMORY[0x24BDB91E8]);
    v12 = objc_msgSend_initWithRecordName_(v18, v19, (uint64_t)CFSTR("recordIDSalt"), v20, v21);
    objc_initWeak(buf, self);
    objc_msgSend_database(self, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_227D756D4;
    v29[3] = &unk_24F089230;
    objc_copyWeak(&v31, buf);
    v30 = v4;
    objc_msgSend_fetchRecordWithID_completionHandler_(v26, v27, (uint64_t)v12, (uint64_t)v29, v28);

    objc_destroyWeak(&v31);
    objc_destroyWeak(buf);
  }

}

- (void)invalidateSalt
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend_workQueue(self, v3, v4, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_227D76414;
  v8[3] = &unk_24F089258;
  objc_copyWeak(&v9, &location);
  dispatch_async(v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)wq_invalidateSalt
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10[16];

  BDSCloudKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager: Invalidate record salt", v10, 2u);
  }

  objc_msgSend_setCurrentSalt_(self, v4, 0, v5, v6);
  objc_msgSend_setCurrentSaltVersionIdentifier_(self, v7, 0, v8, v9);
}

- (BOOL)establishedSalt
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BDSSyncEngineSaltManager *v5;
  NSObject *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v5 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend_workQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_227D7657C;
  v8[3] = &unk_24F089190;
  v8[4] = v5;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  BDSSyncEngineSaltManager *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_227D751CC;
  v26 = sub_227D751DC;
  v27 = 0;
  objc_msgSend_workQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_227D766E8;
  v17[3] = &unk_24F089280;
  v18 = v7;
  v19 = self;
  v20 = v6;
  v21 = &v22;
  v13 = v6;
  v14 = v7;
  dispatch_sync(v12, v17);

  v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (id)_wq_saltedAndHashedIDFromLocalID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  CCHmacContext v43;
  _QWORD macOut[2];
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_workQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend_currentSalt(self, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = objc_retainAutorelease(v14);
    v21 = (const void *)objc_msgSend_bytes(v16, v17, v18, v19, v20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0,
                          0);
    v26 = objc_msgSend_length(v16, v22, v23, v24, v25);
    CCHmacInit(&v43, 0, v21, v26);
    v27 = objc_retainAutorelease(v4);
    v32 = (const char *)objc_msgSend_UTF8String(v27, v28, v29, v30, v31);
    v33 = strlen(v32);
    CCHmacUpdate(&v43, v32, v33);
    macOut[0] = 0;
    macOut[1] = 0;
    v45 = 0;
    CCHmacFinal(&v43, macOut);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v34, (uint64_t)macOut, 20, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_base64EncodedStringWithOptions_(v36, v37, 0, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    BDSCloudKitLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_227E5874C();

    v40 = 0;
  }

  return v40;
}

- (void)_updatedReachability
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int isOffline;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  isOffline = objc_msgSend_isOffline(BDSReachability, a2, v2, v3, v4);
  BDSCloudKitLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = isOffline ^ 1;
    _os_log_impl(&dword_227D4F000, v7, OS_LOG_TYPE_DEFAULT, "BDSSyncEngineSaltManager network reachability changed. Reachable: %{BOOL}d", (uint8_t *)v11, 8u);
  }

  if ((isOffline & 1) == 0)
    objc_msgSend_refreshSaltIfNeeded_(self, v8, (uint64_t)&unk_24F0892C0, v9, v10);
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (BDSSyncEngineSaltManagerObserver)observer
{
  return (BDSSyncEngineSaltManagerObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSData)currentSalt
{
  return self->_currentSalt;
}

- (void)setCurrentSalt:(id)a3
{
  objc_storeStrong((id *)&self->_currentSalt, a3);
}

- (NSString)currentSaltVersionIdentifier
{
  return self->_currentSaltVersionIdentifier;
}

- (void)setCurrentSaltVersionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentSaltVersionIdentifier, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (BOOL)isSaltRefreshInProgress
{
  return self->_isSaltRefreshInProgress;
}

- (void)setIsSaltRefreshInProgress:(BOOL)a3
{
  self->_isSaltRefreshInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_currentSaltVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSalt, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
