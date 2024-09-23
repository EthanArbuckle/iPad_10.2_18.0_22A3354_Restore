@implementation BCCloudKitDatabaseController

- (BCCloudKitDatabaseController)initWithConfiguration:(id)a3 archiveURL:(id)a4
{
  id v7;
  id v8;
  BCCloudKitDatabaseController *v9;
  BCCloudKitDatabaseController *v10;
  uint64_t v11;
  NSMutableDictionary *observers;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMapTable *zoneObservers;
  uint64_t v19;
  NSMutableDictionary *tokenStores;
  uint64_t v21;
  NSMutableSet *changedRecordZoneIDs;
  NSObject *v23;
  dispatch_queue_t v24;
  NSObject *accessQueue;
  uint64_t v26;
  void **v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id location;
  _QWORD block[4];
  void **v63;
  objc_super v64;

  v7 = a3;
  v8 = a4;
  v64.receiver = self;
  v64.super_class = (Class)BCCloudKitDatabaseController;
  v9 = -[BCCloudKitDatabaseController init](&v64, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    objc_storeStrong((id *)&v10->_archiveURL, a4);
    v11 = objc_opt_new();
    observers = v10->_observers;
    v10->_observers = (NSMutableDictionary *)v11;

    objc_msgSend_strongToWeakObjectsMapTable(MEMORY[0x24BDD1650], v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    zoneObservers = v10->_zoneObservers;
    v10->_zoneObservers = (NSMapTable *)v17;

    v10->_zoneObserversLock._os_unfair_lock_opaque = 0;
    v19 = objc_opt_new();
    tokenStores = v10->_tokenStores;
    v10->_tokenStores = (NSMutableDictionary *)v19;

    v21 = objc_opt_new();
    changedRecordZoneIDs = v10->_changedRecordZoneIDs;
    v10->_changedRecordZoneIDs = (NSMutableSet *)v21;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.iBooks.CloudKitDatabaseController", v23);

    objc_storeStrong((id *)&v10->_accessQueue, v24);
    accessQueue = v10->_accessQueue;
    v26 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227D69B10;
    block[3] = &unk_24F08A3E0;
    v27 = v10;
    v63 = v27;
    dispatch_sync(accessQueue, block);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sharedReachabilityForInternetConnection(BDSReachability, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v32, v38, (uint64_t)v27, (uint64_t)sel_p_internetReachabilityChanged_, (uint64_t)CFSTR("kNetworkReachabilityChangedNotification"), v37);

    objc_initWeak(&location, v27);
    v39 = objc_alloc(MEMORY[0x24BE0FC00]);
    v58[0] = v26;
    v58[1] = 3221225472;
    v58[2] = sub_227D9CF98;
    v58[3] = &unk_24F08A768;
    objc_copyWeak(&v60, &location);
    v59 = v8;
    v41 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v39, v40, (uint64_t)v58, 10, (uint64_t)CFSTR("_coalescedArchive in BCCloudKitDatabaseController"), &unk_24F08A788);
    v42 = v27[8];
    v27[8] = (void *)v41;

    objc_msgSend_setCoalescingDelay_(v27[8], v43, v44, v45, v46, 1.0);
    v47 = objc_alloc(MEMORY[0x24BE0FC00]);
    v56[0] = v26;
    v56[1] = 3221225472;
    v56[2] = sub_227D9D250;
    v56[3] = &unk_24F08A6A0;
    objc_copyWeak(&v57, &location);
    v49 = objc_msgSend_initWithNotifyBlock_notifyTimeout_blockDescription_notifyTimeoutBlock_(v47, v48, (uint64_t)v56, 10, (uint64_t)CFSTR("_coalescedZoneFetch in BCCloudKitDatabaseController"), &unk_24F08A7D0);
    v50 = v27[18];
    v27[18] = (void *)v49;

    objc_msgSend_setCoalescingDelay_(v27[18], v51, v52, v53, v54, 2.0);
    objc_destroyWeak(&v57);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (NSMapTable)zoneObservers
{
  return self->_zoneObservers;
}

- (void)willAttachToContainer:(id)a3 serviceMode:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a5;
  objc_msgSend_accessQueue(self, v10, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D696E0;
  block[3] = &unk_24F08A890;
  block[4] = self;
  v18 = v8;
  v20 = a4;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  dispatch_sync(v14, block);

}

- (void)p_unarchive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  objc_msgSend_accessQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend_archiveURL(self, v7, v8, v9, v10);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v11 = objc_alloc(MEMORY[0x24BDBCE50]);
    v15 = objc_msgSend_initWithContentsOfURL_(v11, v12, (uint64_t)v21, v13, v14);
    if (v15)
    {
      v19 = (void *)v15;
      v20 = (id)objc_msgSend_p_unarchiveFromData_(self, v16, v15, v17, v18);

    }
  }

}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSURL)archiveURL
{
  return self->_archiveURL;
}

- (void)addObserver:(id)a3 zoneID:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_zoneObserversLock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BCCloudKitDatabaseController *v14;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  p_zoneObserversLock = &self->_zoneObserversLock;
  v11[2] = sub_227D69B94;
  v11[3] = &unk_24F08A3B8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  os_unfair_lock_lock(p_zoneObserversLock);
  ((void (*)(_QWORD *))sub_227D69B94)(v11);
  os_unfair_lock_unlock(p_zoneObserversLock);

}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (NSString)subscriptionID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_configuration(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dbSubscriptionID(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (id)appBundleIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_configuration(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appBundleIdentifier(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)fetchChangesWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_containerIdentifier(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v10;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - fetchChangesWithCompletion:", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  objc_msgSend_accessQueue(self, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = sub_227D9D960;
  v17[3] = &unk_24F0891B8;
  objc_copyWeak(&v19, (id *)buf);
  v18 = v4;
  v16 = v4;
  dispatch_async(v15, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)fetchRecordForRecordID:(id)a3 completion:(id)a4
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
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend_accessQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_227D9DED8;
  v15[3] = &unk_24F08A740;
  objc_copyWeak(&v18, &location);
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)connectUserTo:(id)a3 container:(id)a4 updateSubscription:(BOOL)a5 completion:(id)a6 subscriptionCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  BDSCloudKitLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_containerIdentifier(v13, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v21;
    _os_log_impl(&dword_227D4F000, v16, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - connectUserTo:container:updateSubscription:completion:", buf, 0xCu);

  }
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = sub_227D9E2C0;
  v29[3] = &unk_24F08A900;
  v29[4] = self;
  v30 = v13;
  v34 = a5;
  v31 = v12;
  v32 = v15;
  v33 = v14;
  v22 = v14;
  v23 = v15;
  v24 = v12;
  v25 = v13;
  objc_msgSend_fetchUserRecordIDWithCompletionHandler_(v25, v26, (uint64_t)v29, v27, v28);

}

- (void)attachToZones:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  os_activity_t v17;
  id v18;
  id v19;
  os_activity_t v20;
  _QWORD block[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v20 = _os_activity_create(&dword_227D4F000, "BCCloudKitDatabaseController/attachToZones-cloud", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);
  objc_msgSend_containerIdentifier(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_containsString_(v12, v13, (uint64_t)CFSTR("cloudData"), v14, v15);

  if ((v16 & 1) == 0)
  {
    v17 = _os_activity_create(&dword_227D4F000, "BCCloudKitDatabaseController/attachToZones-secureData", MEMORY[0x24BDACB20], OS_ACTIVITY_FLAG_DEFAULT);

    v20 = v17;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D9E728;
  block[3] = &unk_24F08A9A0;
  v22 = v6;
  v23 = v7;
  block[4] = self;
  v18 = v6;
  v19 = v7;
  os_activity_apply(v20, block);

}

- (void)detach
{
  uint64_t v2;

  objc_msgSend_detachWithError_completion_(self, a2, 0, 0, v2);
}

- (void)detachWithError:(id)a3 completion:(id)a4
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
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend_accessQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D9F53C;
  block[3] = &unk_24F08A9C8;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v13 = v7;
  v14 = v6;
  dispatch_async(v12, block);

}

- (void)getAttached:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_227D9F700;
  v11[3] = &unk_24F08A9F0;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)recordZoneWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  BCCloudKitDatabaseController *v20;
  id v21;

  v6 = a3;
  v11 = a4;
  if (v11)
  {
    objc_msgSend_database(self, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend_accessQueue(self, v13, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_227D9F84C;
      block[3] = &unk_24F08AA18;
      v19 = v6;
      v20 = self;
      v21 = v11;
      dispatch_async(v17, block);

    }
    else
    {
      (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    }
  }

}

- (id)saltedAndHashedIDFromLocalID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  size_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  CCHmacContext v38;
  _QWORD macOut[2];
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_recordIDSalt(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_retainAutorelease(v9);
    v16 = (const void *)objc_msgSend_bytes(v11, v12, v13, v14, v15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
    v21 = objc_msgSend_length(v11, v17, v18, v19, v20);
    CCHmacInit(&v38, 0, v16, v21);
    v22 = objc_retainAutorelease(v4);
    v27 = (const char *)objc_msgSend_UTF8String(v22, v23, v24, v25, v26);
    v28 = strlen(v27);
    CCHmacUpdate(&v38, v27, v28);
    macOut[0] = 0;
    macOut[1] = 0;
    v40 = 0;
    CCHmacFinal(&v38, macOut);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v29, (uint64_t)macOut, 20, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_base64EncodedStringWithOptions_(v31, v32, 0, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    BDSCloudKitLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_227E5C1C4();

    v35 = 0;
  }

  return v35;
}

- (BOOL)establishedSalt
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_recordIDSalt(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)invalidateSalt
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_setRecordIDSalt_(self, a2, 0, v2, v3);
}

- (id)recordNameFromRecordType:(id)a3 identifier:(id)a4
{
  __CFString *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;

  v6 = (__CFString *)a3;
  v10 = a4;
  if (!v10)
    goto LABEL_6;
  objc_msgSend_saltedAndHashedIDFromLocalID_(self, v7, (uint64_t)v10, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_6;
  v15 = (void *)v11;
  v16 = CFSTR("-");
  if (v6)
    v16 = v6;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("%@.%@"), v13, v14, v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_6:
    BDSCloudKitLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E5C224();

    v17 = 0;
  }

  return v17;
}

- (void)p_unsubscribeToContainer:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id location;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_privateCloudDatabase(v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_initWeak(&location, self);
    v10 = objc_alloc(MEMORY[0x24BDB9160]);
    objc_msgSend_subscriptionID(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v15;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, (uint64_t)v46, 1, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(v10, v19, 0, (uint64_t)v18, v20);

    objc_msgSend_bds_defaultConfiguration(MEMORY[0x24BDB9188], v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v26, v27, (uint64_t)v4, v28, v29);
    objc_msgSend_setConfiguration_(v21, v30, (uint64_t)v26, v31, v32);
    objc_msgSend_setDatabase_(v21, v33, (uint64_t)v9, v34, v35);
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = sub_227D9FD88;
    v42[3] = &unk_24F08AA40;
    objc_copyWeak(&v44, &location);
    v43 = v4;
    objc_msgSend_setModifySubscriptionsCompletionBlock_(v21, v36, (uint64_t)v42, v37, v38);
    objc_msgSend_addOperation_(v9, v39, (uint64_t)v21, v40, v41);

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
  }

}

- (void)p_subscribeWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  NSObject *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(void **, uint64_t, uint64_t, void *);
  void *v96;
  BCCloudKitDatabaseController *v97;
  id v98;
  id v99;
  id location;
  uint8_t buf[4];
  void *v102;
  _QWORD v103[2];

  v103[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_containerIdentifier(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v102 = v15;
    _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_INFO, "p_subscribeWithCompletion (%{public}@)", buf, 0xCu);

  }
  if ((objc_msgSend_hasSubscription(self, v16, v17, v18, v19) & 1) != 0
    || (objc_msgSend_database(self, v20, v21, v22, v23),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = v24 == 0,
        v24,
        v25))
  {
    v92 = _Block_copy(v4);
    v36 = v92;
    if (v92)
      (*((void (**)(void *))v92 + 2))(v92);
  }
  else
  {
    BDSCloudKitLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227D4F000, v26, OS_LOG_TYPE_INFO, "Attempting CKModifySubscriptionsOperation", buf, 2u);
    }

    v27 = objc_alloc(MEMORY[0x24BDB9070]);
    objc_msgSend_subscriptionID(self, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend_initWithSubscriptionID_(v27, v33, (uint64_t)v32, v34, v35);

    v37 = objc_alloc_init(MEMORY[0x24BDB9178]);
    objc_msgSend_setShouldSendContentAvailable_(v37, v38, 1, v39, v40);
    objc_msgSend_setNotificationInfo_(v36, v41, (uint64_t)v37, v42, v43);
    objc_initWeak(&location, self);
    v44 = objc_alloc(MEMORY[0x24BDB9160]);
    v103[0] = v36;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v45, (uint64_t)v103, 1, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(v44, v48, (uint64_t)v47, 0, v49);

    objc_msgSend_bds_defaultConfiguration(MEMORY[0x24BDB9188], v51, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v55, v61, (uint64_t)v60, v62, v63);

    objc_msgSend_setConfiguration_(v50, v64, (uint64_t)v55, v65, v66);
    objc_msgSend_database(self, v67, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDatabase_(v50, v72, (uint64_t)v71, v73, v74);

    v93 = MEMORY[0x24BDAC760];
    v94 = 3221225472;
    v95 = sub_227DA02DC;
    v96 = &unk_24F08AA68;
    objc_copyWeak(&v99, &location);
    v97 = self;
    v98 = v4;
    objc_msgSend_setModifySubscriptionsCompletionBlock_(v50, v75, (uint64_t)&v93, v76, v77);
    BDSCloudKitLog();
    v78 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_operationID(v50, v79, v80, v81, v82, v93, v94, v95, v96, v97);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      sub_227E5C284((uint64_t)v50, v83, buf, v78);
    }

    objc_msgSend_database(self, v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_(v88, v89, (uint64_t)v50, v90, v91);

    objc_destroyWeak(&v99);
    objc_destroyWeak(&location);

  }
}

- (void)p_fetchDatabaseChanges:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD);
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(uint64_t, void *, uint64_t, void *);
  void *v111;
  BCCloudKitDatabaseController *v112;
  id v113;
  _BYTE *v114;
  _QWORD v115[5];
  id v116;
  _QWORD v117[5];
  _QWORD v118[6];
  _QWORD v119[6];
  _QWORD v120[6];
  uint8_t v121[4];
  void *v122;
  __int16 v123;
  void (**v124)(_QWORD, _QWORD);
  _BYTE buf[24];
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;

  v129 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_containerIdentifier(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serverChangeToken(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- Adding fetch database changes, serverChangeToken: %{public}@", buf, 0x16u);

  }
  objc_msgSend_database(self, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = objc_alloc(MEMORY[0x24BDB90A8]);
    objc_msgSend_serverChangeToken(self, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void (**)(_QWORD, _QWORD))objc_msgSend_initWithPreviousServerChangeToken_(v26, v32, (uint64_t)v31, v33, v34);

    objc_msgSend_setFetchAllChanges_(v35, v36, 1, v37, v38);
    objc_msgSend_bds_defaultConfiguration(MEMORY[0x24BDB9188], v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v43, v49, (uint64_t)v48, v50, v51);

    objc_msgSend_setConfiguration_(v35, v52, (uint64_t)v43, v53, v54);
    objc_msgSend_database(self, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDatabase_(v35, v60, (uint64_t)v59, v61, v62);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v126 = sub_227DA0A98;
    v127 = sub_227DA0AA8;
    v128 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v63 = MEMORY[0x24BDAC760];
    v120[0] = MEMORY[0x24BDAC760];
    v120[1] = 3221225472;
    v120[2] = sub_227DA0AB0;
    v120[3] = &unk_24F08AA90;
    v120[4] = self;
    v120[5] = buf;
    objc_msgSend_setRecordZoneWithIDWasDeletedBlock_(v35, v64, (uint64_t)v120, v65, v66);
    v119[0] = v63;
    v119[1] = 3221225472;
    v119[2] = sub_227DA0C20;
    v119[3] = &unk_24F08AA90;
    v119[4] = self;
    v119[5] = buf;
    objc_msgSend_setRecordZoneWithIDWasPurgedBlock_(v35, v67, (uint64_t)v119, v68, v69);
    v118[0] = v63;
    v118[1] = 3221225472;
    v118[2] = sub_227DA0D90;
    v118[3] = &unk_24F08AA90;
    v118[4] = self;
    v118[5] = buf;
    objc_msgSend_setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock_(v35, v70, (uint64_t)v118, v71, v72);
    v117[0] = v63;
    v117[1] = 3221225472;
    v117[2] = sub_227DA0F00;
    v117[3] = &unk_24F08AAD8;
    v117[4] = self;
    objc_msgSend_setChangeTokenUpdatedBlock_(v35, v73, (uint64_t)v117, v74, v75);
    v76 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend_configuration(self, v77, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appZones(v81, v82, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v76, v87, (uint64_t)v86, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    v115[0] = v63;
    v115[1] = 3221225472;
    v115[2] = sub_227DA10BC;
    v115[3] = &unk_24F08AB20;
    v115[4] = self;
    v91 = v90;
    v116 = v91;
    objc_msgSend_setRecordZoneWithIDChangedBlock_(v35, v92, (uint64_t)v115, v93, v94);
    v108 = v63;
    v109 = 3221225472;
    v110 = sub_227DA12D0;
    v111 = &unk_24F08AB70;
    v114 = buf;
    v112 = self;
    v113 = v4;
    objc_msgSend_setFetchDatabaseChangesCompletionBlock_(v35, v95, (uint64_t)&v108, v96, v97);
    BDSCloudKitLog();
    v98 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_containerIdentifier(self, v99, v100, v101, v102, v108, v109, v110, v111, v112);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v121 = 138543618;
      v122 = v103;
      v123 = 2112;
      v124 = v35;
      _os_log_impl(&dword_227D4F000, v98, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- Adding fetch database changes %@", v121, 0x16u);

    }
    objc_msgSend_addOperation_(v25, v104, (uint64_t)v35, v105, v106);

    _Block_object_dispose(buf, 8);
    goto LABEL_9;
  }
  v35 = (void (**)(_QWORD, _QWORD))_Block_copy(v4);
  if (v35)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v107, (uint64_t)CFSTR("BDSErrorDomain"), 1004, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v35)[2](v35, v43);
LABEL_9:

  }
}

- (void)p_createRecordZones:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  id v25;
  id v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  _BYTE buf[24];
  void *v84;
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_accessQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend_database(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  BDSCloudKitLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_containerIdentifier(self, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)MEMORY[0x24BDBCEB8];
    v25 = v6;
    v26 = objc_alloc_init(v24);
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_227DA9AE8;
    v84 = &unk_24F08B088;
    v85 = v26;
    v27 = v26;
    objc_msgSend_enumerateObjectsUsingBlock_(v25, v28, (uint64_t)buf, v29, v30);
    objc_msgSend_componentsJoinedByString_(v27, v31, (uint64_t)CFSTR(","), v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_database(self, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v34;
    *(_WORD *)&buf[22] = 2114;
    v84 = v39;
    _os_log_impl(&dword_227D4F000, v18, OS_LOG_TYPE_DEFAULT, "[BCCloudKitDatabaseController (%@)] 2. p_createRecordZones:%@ database:%{public}@", buf, 0x20u);

  }
  if (objc_msgSend_count(v6, v40, v41, v42, v43) && v17)
  {
    v44 = objc_alloc(MEMORY[0x24BDB90E0]);
    v48 = (void *)objc_msgSend_initWithRecordZoneIDs_(v44, v45, (uint64_t)v6, v46, v47);
    objc_msgSend_bds_defaultConfiguration(MEMORY[0x24BDB9188], v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v53, v59, (uint64_t)v58, v60, v61);
    objc_msgSend_setConfiguration_(v48, v62, (uint64_t)v53, v63, v64);
    objc_msgSend_setDatabase_(v48, v65, (uint64_t)v17, v66, v67);
    objc_initWeak((id *)buf, self);
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = sub_227DA1A64;
    v77[3] = &unk_24F08AC88;
    objc_copyWeak(&v82, (id *)buf);
    v81 = v7;
    v78 = v6;
    v68 = v58;
    v79 = v68;
    v69 = v17;
    v80 = v69;
    objc_msgSend_setFetchRecordZonesCompletionBlock_(v48, v70, (uint64_t)v77, v71, v72);
    objc_msgSend_addOperation_(v69, v73, (uint64_t)v48, v74, v75);

    objc_destroyWeak(&v82);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v76 = _Block_copy(v7);
    v48 = v76;
    if (v76)
      (*((void (**)(void *, _QWORD))v76 + 2))(v76, 0);
  }

}

- (void)p_createRecordIDSaltWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_containerIdentifier(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_database(self, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v15;
    v39 = 2114;
    v40 = v20;
    _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) Establishing record salt, database:%{public}@", buf, 0x16u);

  }
  v21 = objc_alloc(MEMORY[0x24BDB91E8]);
  v25 = (void *)objc_msgSend_initWithRecordName_(v21, v22, (uint64_t)CFSTR("recordIDSalt"), v23, v24);
  objc_initWeak((id *)buf, self);
  objc_msgSend_database(self, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_227DA3020;
  v34[3] = &unk_24F08ACD8;
  objc_copyWeak(&v36, (id *)buf);
  v34[4] = self;
  v31 = v4;
  v35 = v31;
  objc_msgSend_fetchRecordWithID_completionHandler_(v30, v32, (uint64_t)v25, (uint64_t)v34, v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);

}

- (void)p_fetchZoneChanges:(id)a3
{
  void (**v4)(id, _QWORD);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;
  void (**v51)(id, _QWORD);
  _QWORD v52[5];
  id v53;
  id v54;
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (objc_msgSend_serverFetchPostponed(self, v10, v11, v12, v13))
  {
    BDSCloudKitLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_227D4F000, v18, OS_LOG_TYPE_DEFAULT, "fetch zone changes attempted while postponing such fetches.  Nil error, but this operation will be attempted again after the back-off period.", buf, 2u);
    }

    v4[2](v4, 0);
  }
  else
  {
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v14, v15, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenStores(self, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v29, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x24BDAC760];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = sub_227DA3EF4;
    v52[3] = &unk_24F08AD00;
    v52[4] = self;
    v53 = v19;
    v36 = v24;
    v54 = v36;
    v37 = v19;
    objc_msgSend_enumerateObjectsUsingBlock_(v34, v38, (uint64_t)v52, v39, v40);

    v45 = (void *)objc_msgSend_copy(v37, v41, v42, v43, v44);
    v49[0] = v35;
    v49[1] = 3221225472;
    v49[2] = sub_227DA3FD8;
    v49[3] = &unk_24F08A978;
    v49[4] = self;
    v50 = v36;
    v51 = v4;
    v46 = v36;
    objc_msgSend_p_fetchRecordZoneChangesForRecordZoneIDs_completionHandler_(self, v47, (uint64_t)v45, (uint64_t)v49, v48);

  }
}

- (void)p_fetchRecordZoneChangesForRecordZoneIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  void *v53;
  void *v54;
  _QWORD block[4];
  id v56;
  BCCloudKitDatabaseController *v57;
  id v58;
  id v59;
  _QWORD v60[5];
  dispatch_group_t v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_accessQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v17 = objc_msgSend_count(v6, v13, v14, v15, v16);
  BDSCloudKitLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (v17)
  {
    if (v19)
    {
      objc_msgSend_containerIdentifier(self, v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v24;
      v68 = 2114;
      v69 = v6;
      _os_log_impl(&dword_227D4F000, v18, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- fetching record zone changes for recordZoneIDs:%{public}@", buf, 0x16u);

    }
    objc_msgSend_recordZones(self, v25, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_desiredRecordZoneIDs(self, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x24BDAC760];
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = sub_227DA44A8;
    v63[3] = &unk_24F08AD28;
    v64 = v29;
    v65 = v34;
    v36 = v34;
    v37 = v29;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v38, (uint64_t)v63, v39, v40);
    v41 = (void *)objc_opt_new();
    v60[0] = v35;
    v60[1] = 3221225472;
    v60[2] = sub_227DA4550;
    v60[3] = &unk_24F08AD00;
    v60[4] = self;
    v61 = dispatch_group_create();
    v42 = v41;
    v62 = v42;
    v43 = v61;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v44, (uint64_t)v60, v45, v46);
    objc_msgSend_accessQueue(self, v47, v48, v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
    block[0] = v35;
    block[1] = 3221225472;
    block[2] = sub_227DA4774;
    block[3] = &unk_24F089EC8;
    v56 = v42;
    v57 = self;
    v58 = v6;
    v59 = v7;
    v52 = v42;
    dispatch_group_notify(v43, v51, block);

  }
  else
  {
    if (v19)
    {
      objc_msgSend_containerIdentifier(self, v20, v21, v22, v23);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v53;
      _os_log_impl(&dword_227D4F000, v18, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@)- No record zone changes to fetch", buf, 0xCu);

    }
    self->_fetchRecordZoneChangesSuccess = 1;
    v54 = _Block_copy(v7);
    v37 = v54;
    if (v54)
      (*((void (**)(void *, _QWORD))v54 + 2))(v54, 0);
  }

}

- (void)p_updateRetryParametersFromFetchZoneChangesOperationError:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int isEqualToString;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  id v45;

  v45 = a3;
  objc_msgSend_accessQueue(self, v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend_domain(v45, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v13, v14, *MEMORY[0x24BDB8EA8], v15, v16);

  v22 = 5.0;
  if (!isEqualToString)
    goto LABEL_7;
  objc_opt_class();
  objc_msgSend_userInfo(v45, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v27, v28, *MEMORY[0x24BDB8EB8], v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  BUDynamicCast();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v32, v33, v34, v35, v36);
  v22 = v37;

  if (v22 > 0.0)
  {
LABEL_7:
    objc_msgSend_setBackOffInterval_(self, v18, v19, v20, v21, v22);
    goto LABEL_8;
  }
  v38 = objc_msgSend_code(v45, v18, v19, v20, v21);
  if (v38 <= 0x17 && ((1 << v38) & 0x8000C0) != 0)
  {
    objc_msgSend_backOffInterval(self, v39, v40, v41, v42);
    v22 = 5.0;
    if (v43 >= 5.0)
    {
      objc_msgSend_backOffInterval(self, v18, v19, v20, v21);
      v22 = v44 + v44;
    }
    goto LABEL_7;
  }
LABEL_8:

}

- (void)p_fetchRecordZoneChanges:(id)a3 optionsByRecordZoneID:(id)a4 completionHandler:(id)a5
{
  id v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_class *v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  void (**v110)(void *, void *);
  void *v111;
  id aBlock;
  _QWORD v113[5];
  id v114;
  id v115;
  _QWORD *v116;
  _BYTE *v117;
  id v118;
  _QWORD v119[5];
  id v120;
  _QWORD *v121;
  _BYTE *v122;
  _QWORD v123[5];
  id v124;
  _BYTE *v125;
  _QWORD v126[5];
  _QWORD v127[6];
  id location;
  _QWORD v129[5];
  id v130;
  uint8_t v131[4];
  void *v132;
  __int16 v133;
  void *v134;
  _BYTE buf[24];
  uint64_t (*v136)(uint64_t, uint64_t);
  __int128 v137;
  uint64_t v138;

  v138 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (uint64_t (*)(uint64_t, uint64_t))a4;
  aBlock = a5;
  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  v16 = MEMORY[0x24BDAC760];
  if (v11)
  {
    objc_msgSend_containerIdentifier(self, v12, v13, v14, v15, aBlock);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)MEMORY[0x24BDBCEB8];
    v19 = v8;
    *(_QWORD *)buf = v16;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = sub_227DA9AE8;
    v136 = (uint64_t (*)(uint64_t, uint64_t))&unk_24F08B088;
    *(_QWORD *)&v137 = objc_alloc_init(v18);
    v20 = (id)v137;
    objc_msgSend_enumerateObjectsUsingBlock_(v19, v21, (uint64_t)buf, v22, v23);
    objc_msgSend_componentsJoinedByString_(v20, v24, (uint64_t)CFSTR(","), v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_database(self, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v27;
    *(_WORD *)&buf[22] = 2114;
    v136 = v9;
    LOWORD(v137) = 2048;
    *(_QWORD *)((char *)&v137 + 2) = v32;
    _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) p_fetchRecordZoneChanges recordZoneIDs:%{public}@, optionsByRecordZoneID:%{public}@ self.database=%p", buf, 0x2Au);

  }
  objc_msgSend_database(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v136 = sub_227DA0A98;
    *(_QWORD *)&v137 = sub_227DA0AA8;
    *((_QWORD *)&v137 + 1) = objc_opt_new();
    v129[0] = 0;
    v129[1] = v129;
    v129[2] = 0x3032000000;
    v129[3] = sub_227DA0A98;
    v129[4] = sub_227DA0AA8;
    v130 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
    v38 = objc_alloc(MEMORY[0x24BDB90C8]);
    v41 = (void *)objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(v38, v39, (uint64_t)v8, (uint64_t)v9, v40);
    objc_msgSend_setFetchAllChanges_(v41, v42, 1, v43, v44);
    objc_msgSend_bds_defaultConfiguration(MEMORY[0x24BDB9188], v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_container(self, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContainer_(v49, v55, (uint64_t)v54, v56, v57);

    objc_msgSend_setQualityOfService_(v49, v58, 17, v59, v60);
    objc_msgSend_setDiscretionaryNetworkBehavior_(v49, v61, 0, v62, v63);
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v49, v64, 0, v65, v66);
    objc_msgSend_setConfiguration_(v41, v67, (uint64_t)v49, v68, v69);
    objc_msgSend_database(self, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDatabase_(v41, v75, (uint64_t)v74, v76, v77);

    objc_initWeak(&location, self);
    v127[0] = v16;
    v127[1] = 3221225472;
    v127[2] = sub_227DA5108;
    v127[3] = &unk_24F08ADA0;
    v127[4] = self;
    v127[5] = buf;
    objc_msgSend_setRecordChangedBlock_(v41, v78, (uint64_t)v127, v79, v80);
    v126[0] = v16;
    v126[1] = 3221225472;
    v126[2] = sub_227DA5348;
    v126[3] = &unk_24F08ADC8;
    v126[4] = self;
    objc_msgSend_setRecordWithIDWasDeletedBlock_(v41, v81, (uint64_t)v126, v82, v83);
    v123[0] = v16;
    v123[1] = 3221225472;
    v123[2] = sub_227DA5588;
    v123[3] = &unk_24F08AE18;
    v123[4] = self;
    v84 = v8;
    v124 = v84;
    v125 = buf;
    objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(v41, v85, (uint64_t)v123, v86, v87);
    v119[0] = v16;
    v119[1] = 3221225472;
    v119[2] = sub_227DA5814;
    v119[3] = &unk_24F08AE88;
    v119[4] = self;
    v88 = v84;
    v120 = v88;
    v121 = v129;
    v122 = buf;
    objc_msgSend_setRecordZoneFetchCompletionBlock_(v41, v89, (uint64_t)v119, v90, v91);
    v113[0] = v16;
    v113[1] = 3221225472;
    v113[2] = sub_227DA5F1C;
    v113[3] = &unk_24F08AF48;
    v113[4] = self;
    objc_copyWeak(&v118, &location);
    v116 = v129;
    v114 = v88;
    v117 = buf;
    v115 = aBlock;
    objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(v41, v92, (uint64_t)v113, v93, v94);
    BDSCloudKitLog();
    v95 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_containerIdentifier(self, v96, v97, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v131 = 138543618;
      v132 = v100;
      v133 = 2112;
      v134 = v41;
      _os_log_impl(&dword_227D4F000, v95, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) p_fetchRecordZoneChanges Adding fetchRecordZoneChangesOperation=%@", v131, 0x16u);

    }
    objc_msgSend_database(self, v101, v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_(v105, v106, (uint64_t)v41, v107, v108);

    objc_destroyWeak(&v118);
    objc_destroyWeak(&location);

    _Block_object_dispose(v129, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v110 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (v110)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v109, (uint64_t)CFSTR("BDSErrorDomain"), 1004, 0);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v110[2](v110, v111);

    }
  }

}

- (void)p_internetReachabilityChanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  objc_msgSend_accessQueue(self, a2, (uint64_t)a3, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227DA68E4;
  block[3] = &unk_24F08A3E0;
  block[4] = self;
  dispatch_async(v6, block);

}

- (void)p_informObserversOfAttachmentChange
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  const __CFString *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  BDSCloudKitLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_containerIdentifier(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_attachedToContainer(self, v9, v10, v11, v12);
    v14 = CFSTR("NO");
    if (v13)
      v14 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v69 = v8;
    v70 = 2112;
    v71 = v14;
    _os_log_impl(&dword_227D4F000, v3, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfAttachmentChange. Attached to container: %@", buf, 0x16u);

  }
  objc_msgSend_accessQueue(self, v15, v16, v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  objc_msgSend_observers(self, v20, v21, v22, v23);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v24, (uint64_t)&v62, (uint64_t)v67, 16);
  if (v25)
  {
    v30 = v25;
    v31 = *(_QWORD *)v63;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v63 != v31)
          objc_enumerationMutation(obj);
        v33 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v32);
        objc_msgSend_observers(self, v26, v27, v28, v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v34, v35, v33, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_count(v38, v39, v40, v41, v42))
        {
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v43 = v38;
          v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v58, (uint64_t)v66, 16);
          if (v45)
          {
            v50 = v45;
            v51 = *(_QWORD *)v59;
            do
            {
              v52 = 0;
              do
              {
                if (*(_QWORD *)v59 != v51)
                  objc_enumerationMutation(v43);
                v53 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v52);
                v54 = objc_msgSend_attachedToContainer(self, v46, v47, v48, v49);
                objc_msgSend_databaseController_attachmentChanged_(v53, v55, (uint64_t)self, v54, v56);
                ++v52;
              }
              while (v50 != v52);
              v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v58, (uint64_t)v66, 16);
            }
            while (v50);
          }

        }
        ++v32;
      }
      while (v32 != v30);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v62, (uint64_t)v67, 16);
    }
    while (v30);
  }

}

- (void)p_informObserversOfRecordsChanged:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  BDSCloudKitLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_containerIdentifier(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v10;
    _os_log_impl(&dword_227D4F000, v5, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfRecordsChanged.", buf, 0xCu);

  }
  objc_msgSend_accessQueue(self, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  if (objc_msgSend_count(v4, v16, v17, v18, v19))
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_227DA6EEC;
    v23[3] = &unk_24F08AF70;
    v23[4] = self;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v4, v20, (uint64_t)v23, v21, v22);
  }

}

- (void)p_informObserversOfSaltVersionIdentifierChanged:(id)a3 forZones:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_zoneObserversLock;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_zoneObserversLock = &self->_zoneObserversLock;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_227DA70AC;
  v15[3] = &unk_24F089EC8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  os_unfair_lock_lock(p_zoneObserversLock);
  sub_227DA70AC((void **)v15);
  os_unfair_lock_unlock(p_zoneObserversLock);

}

- (void)p_informObserversOfRecordsChanged:(id)a3 forRecordType:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  id v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_accessQueue(self, v8, v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  BDSCloudKitLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_containerIdentifier(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v61 = v18;
    v62 = 2050;
    v63 = objc_msgSend_count(v6, v19, v20, v21, v22);
    v64 = 2114;
    v65 = v7;
    _os_log_impl(&dword_227D4F000, v13, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfRecordsChanged: changedRecords.count=%{public}lu recordType=%{public}@", buf, 0x20u);

  }
  if (objc_msgSend_count(v6, v23, v24, v25, v26))
  {
    objc_msgSend_observers(self, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v31, v32, (uint64_t)v7, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_count(v35, v36, v37, v38, v39))
    {
      v54 = v7;
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v40 = v35;
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v55, (uint64_t)v59, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v56;
        do
        {
          v45 = 0;
          do
          {
            if (*(_QWORD *)v56 != v44)
              objc_enumerationMutation(v40);
            v46 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v45);
            v47 = objc_alloc(MEMORY[0x24BDBCE30]);
            v50 = (void *)objc_msgSend_initWithArray_copyItems_(v47, v48, (uint64_t)v6, 1, v49);
            objc_msgSend_databaseController_recordsChanged_(v46, v51, (uint64_t)self, (uint64_t)v50, v52);

            ++v45;
          }
          while (v43 != v45);
          v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v53, (uint64_t)&v55, (uint64_t)v59, 16);
        }
        while (v43);
      }

      v7 = v54;
    }

  }
}

- (void)p_informObserversOfCompletedFetchOfZone:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend_containerIdentifier(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v15;
    v60 = 2114;
    v61 = v4;
    _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_INFO, "BCCloudKitDatabaseController (%{public}@) - p_informObserversOfCompletedFetchOfZone zoneName=%{public}@", buf, 0x16u);

  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend_observers(self, v16, v17, v18, v19);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v52, (uint64_t)v57, 16);
  if (v21)
  {
    v26 = v21;
    v27 = *(_QWORD *)v53;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v53 != v27)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v28);
        objc_msgSend_observers(self, v22, v23, v24, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v30, v31, v29, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_count(v34, v35, v36, v37, v38))
        {
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v39 = v34;
          v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v48, (uint64_t)v56, 16);
          if (v41)
          {
            v44 = v41;
            v45 = *(_QWORD *)v49;
            do
            {
              v46 = 0;
              do
              {
                if (*(_QWORD *)v49 != v45)
                  objc_enumerationMutation(v39);
                objc_msgSend_databaseController_fetchedAllRecordsInZone_(*(void **)(*((_QWORD *)&v48 + 1) + 8 * v46++), v42, (uint64_t)self, (uint64_t)v4, v43);
              }
              while (v44 != v46);
              v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v42, (uint64_t)&v48, (uint64_t)v56, 16);
            }
            while (v44);
          }

        }
        ++v28;
      }
      while (v28 != v26);
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v52, (uint64_t)v57, 16);
    }
    while (v26);
  }

}

- (void)p_scheduleArchiveWithCompletion:(id)a3
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend_coalescedArchive(self, v10, v11, v12, v13);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalWithCompletion_(v17, v14, (uint64_t)v4, v15, v16);

}

- (id)p_archiveToData
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *inited;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;

  objc_msgSend_accessQueue(self, a2, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = objc_alloc(MEMORY[0x24BDD1618]);
  inited = (void *)objc_msgSend_initRequiringSecureCoding_(v7, v8, 1, v9, v10);
  if (inited)
  {
    if (objc_msgSend_hasSubscription(self, v11, v12, v13, v14))
      objc_msgSend_encodeInteger_forKey_(inited, v16, 1, (uint64_t)CFSTR("hasUpdatedSubscription"), v19);
    objc_msgSend_serverChangeToken(self, v16, v17, v18, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend_encodeObject_forKey_(inited, v20, (uint64_t)v22, (uint64_t)CFSTR("serverChangeToken"), v21);

    objc_msgSend_changedRecordZoneIDs(self, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend_count(v27, v28, v29, v30, v31);

    if (v32)
    {
      objc_msgSend_changedRecordZoneIDs(self, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(inited, v38, (uint64_t)v37, (uint64_t)CFSTR("changedRecordZoneIDs"), v39);

    }
    objc_msgSend_containerIdentifier(self, v33, v34, v35, v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend_length(v40, v41, v42, v43, v44);

    if (v45)
    {
      objc_msgSend_containerIdentifier(self, v46, v47, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(inited, v51, (uint64_t)v50, (uint64_t)CFSTR("containerIdentifier"), v52);

    }
    objc_msgSend_userRecordID(self, v46, v47, v48, v49);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend_userRecordID(self, v54, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(inited, v59, (uint64_t)v58, (uint64_t)CFSTR("userRecordID"), v60);

    }
    objc_msgSend_finishEncoding(inited, v54, v55, v56, v57);
    objc_msgSend_encodedData(inited, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v65 = 0;
  }

  return v65;
}

- (id)p_unarchiveFromData:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  _BOOL8 v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v65;

  v4 = a3;
  objc_msgSend_accessQueue(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v4)
  {
    v10 = objc_alloc(MEMORY[0x24BDD1620]);
    v65 = 0;
    v13 = (void *)objc_msgSend_initForReadingFromData_error_(v10, v11, (uint64_t)v4, (uint64_t)&v65, v12);
    v17 = v65;
    if (v17)
    {
      BDSCloudKitLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_227E5C588();
    }
    else
    {
      v19 = objc_msgSend_decodeIntegerForKey_(v13, v14, (uint64_t)CFSTR("hasUpdatedSubscription"), v15, v16) == 1;
      objc_msgSend_setHasSubscription_(self, v20, v19, v21, v22);
      v23 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v13, v24, v23, (uint64_t)CFSTR("serverChangeToken"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setServerChangeToken_(self, v27, (uint64_t)v26, v28, v29);

      v30 = (void *)MEMORY[0x24BDBCF20];
      v31 = objc_opt_class();
      v32 = objc_opt_class();
      objc_msgSend_setWithObjects_(v30, v33, v31, v34, v35, v32, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClasses_forKey_(v13, v37, (uint64_t)v36, (uint64_t)CFSTR("changedRecordZoneIDs"), v38);
      v18 = objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend_setChangedRecordZoneIDs_(self, v39, (uint64_t)v18, v40, v41);
      }
      else
      {
        v42 = (void *)objc_opt_new();
        objc_msgSend_setChangedRecordZoneIDs_(self, v43, (uint64_t)v42, v44, v45);

      }
      v46 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v13, v47, v46, (uint64_t)CFSTR("containerIdentifier"), v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setContainerIdentifier_(self, v50, (uint64_t)v49, v51, v52);

      v53 = objc_opt_class();
      objc_msgSend_decodeObjectOfClass_forKey_(v13, v54, v53, (uint64_t)CFSTR("userRecordID"), v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUserRecordID_(self, v57, (uint64_t)v56, v58, v59);

      objc_msgSend_finishDecoding(v13, v60, v61, v62, v63);
    }

  }
  return 0;
}

+ (id)encodeRecordSystemFields:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *inited;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v3 = (objc_class *)MEMORY[0x24BDD1618];
  v4 = a3;
  v5 = [v3 alloc];
  inited = (void *)objc_msgSend_initRequiringSecureCoding_(v5, v6, 1, v7, v8);
  objc_msgSend_encodeSystemFieldsWithCoder_(v4, v10, (uint64_t)inited, v11, v12);

  objc_msgSend_finishEncoding(inited, v13, v14, v15, v16);
  objc_msgSend_encodedData(inited, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)decodeRecordFromSystemFields:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v3 = (objc_class *)MEMORY[0x24BDD1620];
  v4 = a3;
  v5 = [v3 alloc];
  v21 = 0;
  v8 = (void *)objc_msgSend_initForReadingFromData_error_(v5, v6, (uint64_t)v4, (uint64_t)&v21, v7);

  v9 = v21;
  if (v9)
  {
    BDSCloudKitLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_227E5C588();

    v11 = 0;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x24BDB91D8]);
    v11 = (void *)objc_msgSend_initWithCoder_(v12, v13, (uint64_t)v8, v14, v15);
    objc_msgSend_finishDecoding(v8, v16, v17, v18, v19);
  }

  return v11;
}

+ (void)startInternetConnectionReachabilityNotifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_sharedReachabilityForInternetConnection(BDSReachability, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startNotifier(v9, v5, v6, v7, v8);

}

- (void)_deleteRecordZonesWithIDs:(id)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD);
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, void *, void *, void *);
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend_accessQueue(self, v10, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  BDSCloudKitLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v43 = v8;
    _os_log_impl(&dword_227D4F000, v15, OS_LOG_TYPE_INFO, "Deleting zone: (%{public}@)", buf, 0xCu);
  }

  if (self->_container)
  {
    v16 = objc_alloc(MEMORY[0x24BDB9150]);
    v19 = (void (**)(_QWORD, _QWORD))objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(v16, v17, 0, (uint64_t)v8, v18);
    v36 = MEMORY[0x24BDAC760];
    v37 = 3221225472;
    v38 = sub_227DA8200;
    v39 = &unk_24F08AFC0;
    v40 = v8;
    v41 = v9;
    objc_msgSend_setModifyRecordZonesCompletionBlock_(v19, v20, (uint64_t)&v36, v21, v22);
    objc_msgSend_setQualityOfService_(v19, v23, a4, v24, v25, v36, v37, v38, v39);
    objc_msgSend_privateCloudDatabase(self->_container, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addOperation_(v30, v31, (uint64_t)v19, v32, v33);

    v34 = v40;
LABEL_7:

    goto LABEL_8;
  }
  v19 = (void (**)(_QWORD, _QWORD))_Block_copy(v9);
  if (v19)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v35, *MEMORY[0x24BDB8EA8], 5, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v19)[2](v19, v34);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)zonesUnreadableDueToMissingD2DEncryptionIdentity:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  char *v17;
  _QWORD block[5];
  char *v19;
  id v20;

  v6 = (char *)a3;
  v7 = a4;
  BDSCloudKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_227E5C65C(self, v6, v8, v9, v10);

  objc_msgSend_accessQueue(self, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227DA839C;
  block[3] = &unk_24F08A9C8;
  block[4] = self;
  v19 = v6;
  v20 = v7;
  v16 = v7;
  v17 = v6;
  dispatch_async(v15, block);

}

- (void)zonesTemporarilyUnreadableWithError:(id)a3 completion:(id)a4
{
  char *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  char *v17;
  _QWORD block[5];
  char *v19;
  id v20;

  v6 = (char *)a3;
  v7 = a4;
  BDSCloudKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_227E5C6E4(self, v6, v8, v9, v10);

  objc_msgSend_accessQueue(self, v11, v12, v13, v14);
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227DA86C8;
  block[3] = &unk_24F08A9C8;
  block[4] = self;
  v19 = v6;
  v20 = v7;
  v16 = v7;
  v17 = v6;
  dispatch_async(v15, block);

}

- (void)zonesDeletedOrReset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BDSCloudKitLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_containerIdentifier(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v13;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_227D4F000, v8, OS_LOG_TYPE_DEFAULT, "BCCloudKitDatabaseController (%{public}@) - zonesDeletedOrReset: %{public}@", buf, 0x16u);

  }
  objc_msgSend_accessQueue(self, v14, v15, v16, v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_227DA88BC;
  v20[3] = &unk_24F08A928;
  v20[4] = self;
  v21 = v7;
  v19 = v7;
  dispatch_async(v18, v20);

}

- (void)addObserver:(id)a3 recordType:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v12 = v7;
  if (v6 && objc_msgSend_length(v7, v8, v9, v10, v11))
  {
    objc_msgSend_accessQueue(self, v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DA8A68;
    block[3] = &unk_24F08A3B8;
    block[4] = self;
    v20 = v12;
    v21 = v6;
    dispatch_async(v17, block);

  }
  else
  {
    BDSCloudKitLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E5C76C();

  }
}

- (void)removeObserver:(id)a3 recordType:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v12 = v7;
  if (v6 && objc_msgSend_length(v7, v8, v9, v10, v11))
  {
    objc_msgSend_accessQueue(self, v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DA8C40;
    block[3] = &unk_24F08A3B8;
    block[4] = self;
    v20 = v12;
    v21 = v6;
    dispatch_async(v17, block);

  }
  else
  {
    BDSCloudKitLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_227E5C76C();

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
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;

  v8 = a3;
  if (v8)
  {
    objc_msgSend_accessQueue(self, v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = sub_227DA8E48;
    v18[3] = &unk_24F08A408;
    v18[4] = self;
    v19 = v8;
    dispatch_async(v9, v18);

  }
  else
  {
    BDSCloudKitLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_227E5C89C(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (void)registerServerChangeTokenStore:(id)a3 forZoneID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  BCCloudKitDatabaseController *v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    objc_initWeak(&location, self);
    objc_msgSend_accessQueue(self, v9, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DA90B0;
    block[3] = &unk_24F08B038;
    objc_copyWeak(&v19, &location);
    v16 = v8;
    v17 = v6;
    v18 = self;
    dispatch_async(v13, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    BDSCloudKitLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_227E5C96C();

  }
}

- (void)unregisterServerChangeTokenStore:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    objc_msgSend_accessQueue(self, v5, v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_227DA950C;
    block[3] = &unk_24F08A5F0;
    objc_copyWeak(&v20, &location);
    v19 = v4;
    dispatch_async(v9, block);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    BDSCloudKitLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_227E5CA34(v10, v11, v12, v13, v14, v15, v16, v17);

  }
}

- (id)diagnosticDatabaseInfo
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  BDSCloudSyncDiagnosticDatabaseInfo *v10;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, const char *, uint64_t, uint64_t, uint64_t);
  void *v23;
  BCCloudKitDatabaseController *v24;
  NSObject *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_227DA0A98;
  v32 = sub_227DA0AA8;
  v33 = 0;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  objc_msgSend_accessQueue(self, v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = sub_227DA9828;
  v23 = &unk_24F08B060;
  v26 = &v34;
  v27 = &v28;
  v24 = self;
  v9 = v3;
  v25 = v9;
  dispatch_async(v8, &v20);

  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = [BDSCloudSyncDiagnosticDatabaseInfo alloc];
  v11 = *((unsigned __int8 *)v35 + 24);
  v16 = objc_msgSend_establishedSalt(self, v12, v13, v14, v15, v20, v21, v22, v23, v24);
  v18 = (void *)objc_msgSend_initWithAttached_establishedSalt_container_(v10, v17, v11 != 0, v16, v29[5]);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  return v18;
}

- (CKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (BOOL)hasSubscription
{
  return self->_hasSubscription;
}

- (void)setHasSubscription:(BOOL)a3
{
  self->_hasSubscription = a3;
}

- (void)setArchiveURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)desiredRecordZoneIDs
{
  return self->_desiredRecordZoneIDs;
}

- (void)setDesiredRecordZoneIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSMutableSet)changedRecordZoneIDs
{
  return self->_changedRecordZoneIDs;
}

- (void)setChangedRecordZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_changedRecordZoneIDs, a3);
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (BUCoalescingCallBlock)coalescedArchive
{
  return self->_coalescedArchive;
}

- (void)setCoalescedArchive:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedArchive, a3);
}

- (BCCloudKitConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CKRecordID)userRecordID
{
  return self->_userRecordID;
}

- (void)setUserRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_userRecordID, a3);
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (void)setServerChangeToken:(id)a3
{
  objc_storeStrong((id *)&self->_serverChangeToken, a3);
}

- (NSData)recordIDSalt
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRecordIDSalt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)recordZones
{
  return self->_recordZones;
}

- (void)setRecordZones:(id)a3
{
  objc_storeStrong((id *)&self->_recordZones, a3);
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setZoneObservers:(id)a3
{
  objc_storeStrong((id *)&self->_zoneObservers, a3);
}

- (NSMutableDictionary)tokenStores
{
  return self->_tokenStores;
}

- (void)setTokenStores:(id)a3
{
  objc_storeStrong((id *)&self->_tokenStores, a3);
}

- (BUCoalescingCallBlock)coalescedZoneFetch
{
  return self->_coalescedZoneFetch;
}

- (void)setCoalescedZoneFetch:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedZoneFetch, a3);
}

- (BOOL)attachedToContainer
{
  return self->_attachedToContainer;
}

- (void)setAttachedToContainer:(BOOL)a3
{
  self->_attachedToContainer = a3;
}

- (double)backOffInterval
{
  return self->_backOffInterval;
}

- (void)setBackOffInterval:(double)a3
{
  self->_backOffInterval = a3;
}

- (BOOL)serverFetchPostponed
{
  return self->_serverFetchPostponed;
}

- (void)setServerFetchPostponed:(BOOL)a3
{
  self->_serverFetchPostponed = a3;
}

- (BOOL)fetchRecordZoneChangesSuccess
{
  return self->_fetchRecordZoneChangesSuccess;
}

- (void)setFetchRecordZoneChangesSuccess:(BOOL)a3
{
  self->_fetchRecordZoneChangesSuccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedZoneFetch, 0);
  objc_storeStrong((id *)&self->_tokenStores, 0);
  objc_storeStrong((id *)&self->_zoneObservers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_recordZones, 0);
  objc_storeStrong((id *)&self->_recordIDSalt, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_userRecordID, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_coalescedArchive, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_changedRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_desiredRecordZoneIDs, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
