@implementation CKProcessScopedStateManager

- (id)untrustedEntitlements
{
  if (self)
    self = (CKProcessScopedStateManager *)self->_resolvedEntitlements;
  return self;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A5F26BC;
  block[3] = &unk_1E1F5F680;
  block[4] = a1;
  if (qword_1ECD96B18 != -1)
    dispatch_once(&qword_1ECD96B18, block);
  return (id)qword_1ECD96B20;
}

- (void)noteSystemIsAvailable
{
  CKProcessScopedStateManager *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 hasDeferredAuthorizationChangeNotice;
  _BOOL4 hasDeferredAccountChangeNotice;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id v19;

  v2 = self;
  objc_sync_enter(v2);
  if (v2)
  {
    v2->_systemIsAvailable = 1;
    hasDeferredAuthorizationChangeNotice = v2->_hasDeferredAuthorizationChangeNotice;
    hasDeferredAccountChangeNotice = v2->_hasDeferredAccountChangeNotice;
    *(_WORD *)&v2->_hasDeferredAuthorizationChangeNotice = 0;
  }
  else
  {
    hasDeferredAuthorizationChangeNotice = 0;
    hasDeferredAccountChangeNotice = 0;
  }
  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_18A6E6D14(v2, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v8, v13, (uint64_t)v2, (uint64_t)CFSTR("CKXPCConnectionInterrupted"), v12);

  objc_sync_exit(v2);
  if (hasDeferredAuthorizationChangeNotice)
    objc_msgSend___refreshAccountAccessAuthorization(v2, v14, v15, v16);
  if (hasDeferredAccountChangeNotice)
  {
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v14, v15, v16);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    CKAccountChangedNotificationName();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_postNotificationName_object_(v19, v18, (uint64_t)v17, 0);

  }
}

- (void)__registerForAuthorizationChangeNotifications
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *notificationQueue;
  int out_token;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A6E6E94;
  aBlock[3] = &unk_1E1F61558;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  out_token = -1;
  v4 = (void *)MEMORY[0x1E0CB3940];
  CKTestNotificationPrefix();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("%@%@"), v7, v5, CFSTR("com.apple.cloudd.authorizationChanged"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  if (self)
    notificationQueue = self->_notificationQueue;
  else
    notificationQueue = 0;
  notify_register_dispatch(v12, &out_token, notificationQueue, v3);

}

- (void)__registerForAccountChangeNotifications
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  NSObject *notificationQueue;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  int out_token;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A6E7668;
  aBlock[3] = &unk_1E1F61558;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  out_token = -1;
  v4 = (void *)MEMORY[0x1E0CB3940];
  CKTestNotificationPrefix();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("%@%@"), v7, v5, CFSTR("com.apple.cloudd.accountChanged"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  if (self)
    notificationQueue = self->_notificationQueue;
  else
    notificationQueue = 0;
  notify_register_dispatch(v12, &out_token, notificationQueue, v3);
  objc_msgSend_untrustedEntitlements(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = sub_18A603A04(v17);

  if (v18)
  {
    out_token = -1;
    v19 = (void *)MEMORY[0x1E0CB3940];
    CKTestNotificationPrefix();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v21, (uint64_t)CFSTR("%@%@"), v22, v20, CFSTR("com.apple.cloudd.accountWarmingUp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (const char *)objc_msgSend_UTF8String(v23, v24, v25, v26);
    if (self)
      v28 = self->_notificationQueue;
    else
      v28 = 0;
    notify_register_dispatch(v27, &out_token, v28, v3);
    v8 = v23;
  }

}

- (void)setFakeEntitlement:(id)a3 forKey:(id)a4
{
  id v6;
  CKProcessScopedStateManager *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *fakeEntitlements;
  NSMutableDictionary *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v11 = v18;
  if (!v18)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v7)
    fakeEntitlements = v7->_fakeEntitlements;
  else
    fakeEntitlements = 0;
  v13 = fakeEntitlements;
  objc_msgSend_setObject_forKeyedSubscript_(v13, v14, (uint64_t)v11, (uint64_t)v6);

  if (!v18)
  sub_18A5FA6B8((uint64_t)v7, v15, v16, v17);
  objc_sync_exit(v7);

}

- (void)clearFakeEntitlementForKey:(id)a3
{
  CKProcessScopedStateManager *v4;
  NSMutableDictionary *fakeEntitlements;
  NSMutableDictionary *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4)
    fakeEntitlements = v4->_fakeEntitlements;
  else
    fakeEntitlements = 0;
  v6 = fakeEntitlements;
  objc_msgSend_setObject_forKeyedSubscript_(v6, v7, 0, (uint64_t)v11);

  sub_18A5FA6B8((uint64_t)v4, v8, v9, v10);
  objc_sync_exit(v4);

}

- (void)__refreshAccountAccessAuthorization
{
  CKProcessScopedStateManager *v2;
  NSHashTable *registeredContainers;
  NSHashTable *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSObject *notificationQueue;
  id obj;
  _QWORD block[5];
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  _QWORD *v29;
  id v30;
  id location;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (v2)
    registeredContainers = v2->_registeredContainers;
  else
    registeredContainers = 0;
  v4 = registeredContainers;
  objc_msgSend_allObjects(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v9 = dispatch_group_create();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v8;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v32, (uint64_t)v37, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        dispatch_group_enter(v9);
        objc_initWeak(&location, v14);
        objc_msgSend_containerID(v14, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = sub_18A6E72F4;
        v26[3] = &unk_1E1F615A8;
        v29 = v36;
        objc_copyWeak(&v30, &location);
        v19 = v18;
        v27 = v19;
        v28 = v9;
        objc_msgSend__refreshAccountAccessAuthorizationWithCompletionHandler_(v14, v20, (uint64_t)v26, v21);

        objc_destroyWeak(&v30);
        objc_destroyWeak(&location);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v32, (uint64_t)v37, 16);
    }
    while (v11);
  }

  if (v2)
    notificationQueue = v2->_notificationQueue;
  else
    notificationQueue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18A6E74D4;
  block[3] = &unk_1E1F5F618;
  block[4] = v36;
  dispatch_group_notify(v9, notificationQueue, block);

  _Block_object_dispose(v36, 8);
}

- (void)getFileMetadataWithFileHandle:(id)a3 openInfo:(id)a4 reply:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, id);
  const char *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, _QWORD, id))a5;
  v14 = 0;
  objc_msgSend_getFileMetadataWithFileHandle_openInfo_error_(CKAsset, v9, (uint64_t)a3, (uint64_t)v7, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (!v10)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v13 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v11;
      _os_log_debug_impl(&dword_18A5C5000, v13, OS_LOG_TYPE_DEBUG, "Failed to get metadata for %@: %@", buf, 0x16u);
      if (!v8)
        goto LABEL_12;
    }
    else if (!v8)
    {
      goto LABEL_12;
    }
    v8[2](v8, 0, v11);
    goto LABEL_12;
  }
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v12 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_debug_impl(&dword_18A5C5000, v12, OS_LOG_TYPE_DEBUG, "Got metadata %@", buf, 0xCu);
    if (!v8)
      goto LABEL_12;
    goto LABEL_6;
  }
  if (v8)
LABEL_6:
    ((void (**)(id, void *, id))v8)[2](v8, v10, 0);
LABEL_12:

}

- (void)connectionBecameInvalid:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9[16];

  v4 = a3;
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v5 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_18A5C5000, v5, OS_LOG_TYPE_ERROR, "The connection to cloudd failed before receiving system availability.", v9, 2u);
  }
  objc_msgSend_noteSystemIsAvailable(self, v6, v7, v8);

}

- (void)handleSignificantIssueBehavior:(unint64_t)a3 reason:(id)a4
{
  CKHandleSignificantIssueBehavior(a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_fakeEntitlements, 0);
  objc_storeStrong((id *)&self->_resolvedEntitlements, 0);
  objc_storeStrong((id *)&self->_baseEntitlements, 0);
  objc_storeStrong((id *)&self->_registeredContainers, 0);
}

@end
