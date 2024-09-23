@implementation BDSLiverpoolStatusMonitor

- (void)updateWithOptedIn:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  int isCloudKitEnabled;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t isPrimaryAccountManagedAppleID;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  const __CFString *v43;
  int v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  isCloudKitEnabled = objc_msgSend_isCloudKitEnabled(self, a2, a3, v3, v4);
  v16 = objc_msgSend_optedInKnown(self, v8, v9, v10, v11);
  if (a3)
  {
    isPrimaryAccountManagedAppleID = 1;
    objc_msgSend_setOptedIn_(self, v12, 1, v14, v15);
  }
  else
  {
    objc_msgSend_sharedProvider(MEMORY[0x24BE0FBE8], v12, v13, v14, v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    isPrimaryAccountManagedAppleID = objc_msgSend_isPrimaryAccountManagedAppleID(v22, v23, v24, v25, v26);

    objc_msgSend_setOptedIn_(self, v27, isPrimaryAccountManagedAppleID, v28, v29);
  }
  if (((isCloudKitEnabled ^ objc_msgSend_isCloudKitEnabled(self, v18, v19, v20, v21)) & v16) == 1)
    objc_msgSend_p_iCloudIdentityDidChange_(self, v30, 0, v31, v32);
  objc_msgSend_refreshICloudTokensAndUpdateWithOptedIn_(self, v30, isPrimaryAccountManagedAppleID, v31, v32);
  BDSCloudKitLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    if (objc_msgSend_isCloudKitEnabled(self, v34, v35, v36, v37))
      v42 = CFSTR("YES");
    else
      v42 = CFSTR("NO");
    if (objc_msgSend_optedIn(self, v38, v39, v40, v41))
      v43 = CFSTR("YES");
    else
      v43 = CFSTR("NO");
    v44 = 138543618;
    v45 = v42;
    v46 = 2114;
    v47 = v43;
    _os_log_impl(&dword_227D4F000, v33, OS_LOG_TYPE_INFO, "BCLiverpoolStatusMonitor CloudKit=%{public}@ optedIn=%{public}@", (uint8_t *)&v44, 0x16u);
  }

}

- (BOOL)isCloudKitEnabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BDSLiverpoolStatusMonitor *v5;
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
  objc_msgSend_dispatchQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_227D69294;
  v8[3] = &unk_24F089190;
  v8[4] = v5;
  v8[5] = &v9;
  dispatch_sync(v6, v8);

  LOBYTE(v5) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v5;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)dq_archiveCurrentICloudIdentityToken
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentICloudIdentityToken(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_token(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, (uint64_t)CFSTR("liverpoolIdentityToken"), v18);

  objc_msgSend_currentICloudIdentityToken(self, v19, v20, v21, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v28 = (void *)v23;
    v29 = objc_msgSend_optedInKnown(self, v24, v25, v26, v27);

    if (v29)
    {
      objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v24, v25, v26, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_currentICloudIdentityToken(self, v31, v32, v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_token(v35, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v30, v41, (uint64_t)v40, (uint64_t)CFSTR("nonNilLiverpoolIdentityToken"), v42);

    }
  }
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v24, v25, v26, v27);
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synchronize(v47, v43, v44, v45, v46);

}

- (BDSICloudIdentityToken)currentICloudIdentityToken
{
  return self->_currentICloudIdentityToken;
}

- (void)dq_refreshICloudAvailabilityStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BDSICloudIdentityToken *v6;
  BDSICloudIdentityToken *currentICloudIdentityToken;
  BDSICloudIdentityToken *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  BDSICloudIdentityToken *v21;
  BDSICloudIdentityToken *lastArchivedICloudIdentityToken;
  BDSICloudIdentityToken *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  BDSICloudIdentityToken *v35;
  BDSICloudIdentityToken *lastArchivedNonNilICloudIdentityToken;
  id v37;

  objc_msgSend_tokenForCurrentIdentityIfCloudKitEnabled(BDSICloudIdentityToken, a2, v2, v3, v4);
  v6 = (BDSICloudIdentityToken *)objc_claimAutoreleasedReturnValue();
  currentICloudIdentityToken = self->_currentICloudIdentityToken;
  self->_currentICloudIdentityToken = v6;

  v8 = [BDSICloudIdentityToken alloc];
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v13, v14, (uint64_t)CFSTR("liverpoolIdentityToken"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (BDSICloudIdentityToken *)objc_msgSend_initFromArchive_(v8, v18, (uint64_t)v17, v19, v20);
  lastArchivedICloudIdentityToken = self->_lastArchivedICloudIdentityToken;
  self->_lastArchivedICloudIdentityToken = v21;

  v23 = [BDSICloudIdentityToken alloc];
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v24, v25, v26, v27);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_valueForKey_(v37, v28, (uint64_t)CFSTR("nonNilLiverpoolIdentityToken"), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (BDSICloudIdentityToken *)objc_msgSend_initFromArchive_(v23, v32, (uint64_t)v31, v33, v34);
  lastArchivedNonNilICloudIdentityToken = self->_lastArchivedNonNilICloudIdentityToken;
  self->_lastArchivedNonNilICloudIdentityToken = v35;

}

- (BOOL)dq_isCloudKitEnabled
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int isSignedIntoICloud;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int isCloudKitSyncOptedIn;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  isSignedIntoICloud = objc_msgSend_isSignedIntoICloud(BDSSyncUserDefaults, a2, v2, v3, v4);
  isCloudKitSyncOptedIn = objc_msgSend_isCloudKitSyncOptedIn(BDSSyncUserDefaults, v7, v8, v9, v10);
  BDSCloudKitLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (isSignedIntoICloud)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    if (isCloudKitSyncOptedIn)
      v23 = CFSTR("YES");
    else
      v23 = CFSTR("NO");
    v25 = 138412802;
    if (objc_msgSend_optedIn(self, v13, v14, v15, v16))
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v26 = v22;
    v27 = 2112;
    v28 = v23;
    v29 = 2112;
    v30 = v24;
    _os_log_debug_impl(&dword_227D4F000, v12, OS_LOG_TYPE_DEBUG, "BDSLiverpoolStatusMonitor: dq_isCloudKitEnabled: signedIn = %@, cloudKit = %@, optedIn = %@", (uint8_t *)&v25, 0x20u);
  }

  if ((isSignedIntoICloud & isCloudKitSyncOptedIn) == 1)
    return objc_msgSend_optedIn(self, v17, v18, v19, v20);
  else
    return 0;
}

- (void)setTccNotifyToken:(int)a3
{
  self->_tccNotifyToken = a3;
}

- (void)setOptedIn:(BOOL)a3
{
  if (self->_optedIn != a3)
  {
    self->_optedIn = a3;
    self->_optedInKnown = 1;
  }
}

- (void)setCoordinatingObserver:(id)a3
{
  objc_storeWeak((id *)&self->_coordinatingObserver, a3);
}

- (void)restartObserving
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend_dispatchQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D69E14;
  block[3] = &unk_24F08A3E0;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)registerCoordinatingObserver:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  if (v8)
  {
    objc_msgSend_dispatchQueue(self, v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_227D69B18;
    v10[3] = &unk_24F08A408;
    v10[4] = self;
    v11 = v8;
    dispatch_async(v9, v10);

  }
}

- (void)refreshICloudTokensAndUpdateWithOptedIn:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[5];
  BOOL v13;

  objc_msgSend_setOptedIn_(self, a2, a3, v3, v4);
  objc_msgSend_dispatchQueue(self, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_227D69A44;
  v12[3] = &unk_24F08B1A8;
  v13 = a3;
  v12[4] = self;
  dispatch_async(v11, v12);

}

- (BOOL)optedIn
{
  return self->_optedIn;
}

- (BOOL)optedInKnown
{
  return self->_optedInKnown;
}

- (BDSICloudIdentityToken)lastArchivedICloudIdentityToken
{
  return self->_lastArchivedICloudIdentityToken;
}

- (BDSLiverpoolStatusMonitor)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  BDSLiverpoolStatusMonitor *v5;
  uint64_t v6;
  NSHashTable *observers;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  dispatch_queue_t v10;
  OS_dispatch_queue *notifyQueue;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  BDSLiverpoolStatusMonitor *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  NSObject *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  id location;
  int out_token;
  _QWORD block[4];
  BDSLiverpoolStatusMonitor *v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)BDSLiverpoolStatusMonitor;
  v5 = -[BDSLiverpoolStatusMonitor init](&v53, sel_init);
  if (v5)
  {
    objc_msgSend_hashTableWithOptions_(MEMORY[0x24BDD15C0], v2, 517, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    v8 = dispatch_queue_create("com.apple.iBooks.BDSLiverpoolStatusMonitor.dispatchQueue", 0);
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.iBooks.BDSLiverpoolStatusMonitor.notifyQueue", 0);
    notifyQueue = v5->_notifyQueue;
    v5->_notifyQueue = (OS_dispatch_queue *)v10;

    objc_msgSend_sharedProvider(MEMORY[0x24BE0FBE8], v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_optedIn = objc_msgSend_isPrimaryAccountManagedAppleID(v16, v17, v18, v19, v20);

    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_valueForKey_(v25, v26, (uint64_t)CFSTR("nonNilLiverpoolIdentityToken"), v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch = v29 != 0;

    v30 = v5->_dispatchQueue;
    v31 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227D6A0F0;
    block[3] = &unk_24F08A3E0;
    v32 = v5;
    v52 = v32;
    dispatch_async(v30, block);
    out_token = -1;
    objc_initWeak(&location, v32);
    v37 = (const char *)objc_msgSend_UTF8String(CFSTR("com.apple.tcc.access.changed"), v33, v34, v35, v36);
    v38 = MEMORY[0x24BDAC9B8];
    v39 = MEMORY[0x24BDAC9B8];
    v44 = v31;
    v45 = 3221225472;
    v46 = sub_227DAB020;
    v47 = &unk_24F089318;
    objc_copyWeak(&v48, &location);
    LODWORD(v37) = notify_register_dispatch(v37, &out_token, v38, &v44);

    if ((_DWORD)v37)
      objc_msgSend_setTccNotifyToken_(v32, v40, 0xFFFFFFFFLL, v41, v42, v44, v45, v46, v47);
    else
      objc_msgSend_setTccNotifyToken_(v32, v40, out_token, v41, v42, v44, v45, v46, v47);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);

  }
  return v5;
}

+ (id)makeOSStateHandler
{
  return (id)((uint64_t (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(BDSSyncUserDefaults, sel_makeOSStateHandler);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  objc_super v19;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v6, v7, (uint64_t)self, v8, v9);

  if (objc_msgSend_tccNotifyToken(self, v10, v11, v12, v13) != -1)
  {
    v18 = objc_msgSend_tccNotifyToken(self, v14, v15, v16, v17);
    notify_cancel(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)BDSLiverpoolStatusMonitor;
  -[BDSLiverpoolStatusMonitor dealloc](&v19, sel_dealloc);
}

- (BCICloudIdentityToken)iCloudIdentityToken
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
  v13 = sub_227DAB1AC;
  v14 = sub_227DAB1BC;
  v15 = 0;
  objc_msgSend_dispatchQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_227DAB1C4;
  v9[3] = &unk_24F089190;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v6, v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (BCICloudIdentityToken *)v7;
}

- (void)addObserver:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  if (v8)
  {
    objc_msgSend_dispatchQueue(self, v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_227DAB298;
    v10[3] = &unk_24F08A408;
    v10[4] = self;
    v11 = v8;
    dispatch_async(v9, v10);

  }
}

- (void)removeObserver:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v8 = a3;
  if (v8)
  {
    objc_msgSend_dispatchQueue(self, v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_227DAB3D4;
    v10[3] = &unk_24F08A408;
    v10[4] = self;
    v11 = v8;
    dispatch_async(v9, v10);

  }
}

- (void)p_iCloudIdentityDidChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend_dispatchQueue(self, a2, (uint64_t)a3, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227DAB4C0;
  block[3] = &unk_24F08A3E0;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)_notifyObserversWithCurrentToken:(id)a3 lastToken:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD block[5];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v6 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend_observers(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v41, (uint64_t)v45, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v42;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v42 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend_notifyQueue(self, v18, v19, v20, v21);
          v22 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = sub_227DAB83C;
          block[3] = &unk_24F08A3B8;
          block[4] = v17;
          v39 = v33;
          v40 = v6;
          dispatch_async(v22, block);

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v18, (uint64_t)&v41, (uint64_t)v45, 16);
    }
    while (v14);
  }

  objc_msgSend_coordinatingObserver(self, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend_notifyQueue(self, v28, v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = sub_227DAB84C;
    v34[3] = &unk_24F08A3B8;
    v35 = v27;
    v36 = v33;
    v37 = v6;
    dispatch_async(v32, v34);

  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isCloudKitEnabled(self, v6, v7, v8, v9))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (objc_msgSend_optedIn(self, v10, v11, v12, v13))
    objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@(%p) CloudKit=%@ optedIn=%@"), v16, v17, v5, self, v14, CFSTR("YES"));
  else
    objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@(%p) CloudKit=%@ optedIn=%@"), v16, v17, v5, self, v14, CFSTR("NO"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)setLastArchivedICloudIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BDSICloudIdentityToken)lastArchivedNonNilICloudIdentityToken
{
  return self->_lastArchivedNonNilICloudIdentityToken;
}

- (void)setLastArchivedNonNilICloudIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setCurrentICloudIdentityToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setOptedInKnown:(BOOL)a3
{
  self->_optedInKnown = a3;
}

- (BOOL)lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch
{
  return self->_lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch;
}

- (void)setLastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch:(BOOL)a3
{
  self->_lastArchivedNonNilICloudIdentityTokenWasNonNilAtColdLaunch = a3;
}

- (int)tccNotifyToken
{
  return self->_tccNotifyToken;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (OS_dispatch_queue)containerQueue
{
  return self->_containerQueue;
}

- (void)setContainerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_containerQueue, a3);
}

- (OS_dispatch_queue)notifyQueue
{
  return self->_notifyQueue;
}

- (void)setNotifyQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notifyQueue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BDSLiverpoolStatusChangeObserving)coordinatingObserver
{
  return (BDSLiverpoolStatusChangeObserving *)objc_loadWeakRetained((id *)&self->_coordinatingObserver);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinatingObserver);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notifyQueue, 0);
  objc_storeStrong((id *)&self->_containerQueue, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_currentICloudIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedNonNilICloudIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastArchivedICloudIdentityToken, 0);
}

@end
