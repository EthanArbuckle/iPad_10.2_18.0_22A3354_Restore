@implementation CKProcessScopedDaemonProxy

+ (NSXPCInterface)CKXPCDaemonToClientProcessScopedInterface
{
  if (qword_1ECD96B40 != -1)
    dispatch_once(&qword_1ECD96B40, &unk_1E1F59738);
  return (NSXPCInterface *)(id)qword_1ECD96B38;
}

+ (NSXPCInterface)CKXPCClientToDaemonProcessScopedInterface
{
  if (qword_1ECD96B30 != -1)
    dispatch_once(&qword_1ECD96B30, &unk_1E1F58F78);
  return (NSXPCInterface *)(id)qword_1ECD96B28;
}

- (CKProcessScopedDaemonProxy)initWithConnection:(id)a3
{
  id v4;
  CKProcessScopedDaemonProxy *v5;
  CKProcessScopedDaemonProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKProcessScopedDaemonProxy;
  v5 = -[CKProcessScopedDaemonProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_connection, v4);

  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  objc_super v12;

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_connectionInterruptedObserver(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_(v5, v10, (uint64_t)v9, v11);

  v12.receiver = self;
  v12.super_class = (Class)CKProcessScopedDaemonProxy;
  -[CKProcessScopedDaemonProxy dealloc](&v12, sel_dealloc);
}

- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/accounts-did-grant-access-to-bundle-id", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_CKDeepCopy(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18A6E80C4;
  v20[3] = &unk_1E1F615D0;
  v21 = v6;
  v22 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = sub_18A6E81BC;
  v17[3] = &unk_1E1F615F8;
  v14 = v21;
  v18 = v14;
  v15 = v22;
  v19 = v15;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v16, 0, (uint64_t)v20, v17);

  os_activity_scope_leave(&state);
}

- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/accounts-did-revoke-access-to-bundle-id", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  objc_msgSend_CKDeepCopy(v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_18A6E8330;
  v20[3] = &unk_1E1F615D0;
  v21 = v6;
  v22 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = sub_18A6E8428;
  v17[3] = &unk_1E1F615F8;
  v14 = v21;
  v18 = v14;
  v15 = v22;
  v19 = v15;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v16, 0, (uint64_t)v20, v17);

  os_activity_scope_leave(&state);
}

- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/accounts-will-delete-account", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A6E8588;
  v16[3] = &unk_1E1F60C30;
  v17 = v6;
  v18 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = sub_18A6E8688;
  v13[3] = &unk_1E1F61620;
  v10 = v17;
  v14 = v10;
  v11 = v18;
  v15 = v11;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v12, 0, (uint64_t)v16, v13);

  os_activity_scope_leave(&state);
}

- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = _os_activity_create(&dword_18A5C5000, "client/account-with-id-changed-with-change-type", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v8 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    CKStringFromAccountChangeType(a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_18A5C5000, v8, OS_LOG_TYPE_INFO, "Notifying cloudd that account %@ changed with type %{public}@", buf, 0x16u);

  }
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A6E8898;
  v16[3] = &unk_1E1F5F958;
  v17 = v6;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = sub_18A6E8984;
  v13[3] = &unk_1E1F61648;
  v11 = v17;
  v14 = v11;
  v15 = a4;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v12, a4 == 5, (uint64_t)v16, v13);

  os_activity_scope_leave(&state);
}

- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/fetch-usability-for-test-account-credentials", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_18A6E8AD0;
  v16[3] = &unk_1E1F60910;
  v17 = v7;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = sub_18A6E8B94;
  v13[3] = &unk_1E1F61620;
  v10 = v6;
  v14 = v10;
  v11 = v17;
  v15 = v11;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v12, 0, (uint64_t)v16, v13);

  os_activity_scope_leave(&state);
}

- (void)wipeAllCachesAndDie
{
  NSObject *v3;
  const char *v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_18A5C5000, "client/wipe-all-caches-and-die", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v4, 0, (uint64_t)&unk_1E1F58418, &unk_1E1F58BD8);
  os_activity_scope_leave(&v5);

}

- (void)wipeServerConfigurationsAndDie
{
  NSObject *v3;
  const char *v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_18A5C5000, "client/wipe-server-configurations-and-die", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v4, 0, (uint64_t)&unk_1E1F58BF8, &unk_1E1F58C18);
  os_activity_scope_leave(&v5);

}

- (void)updatePushTokens
{
  NSObject *v3;
  const char *v4;
  os_activity_scope_state_s v5;

  v3 = _os_activity_create(&dword_18A5C5000, "client/update-push-tokens", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v4, 0, (uint64_t)&unk_1E1F58C58, &unk_1E1F58C78);
  os_activity_scope_leave(&v5);

}

- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_18A5C5000, "client/dump-all-clients-status-report", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_18A6E9054;
  v12[3] = &unk_1E1F61620;
  v9 = v6;
  v13 = v9;
  v10 = v7;
  v14 = v10;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v11, 0, (uint64_t)v10, v12);

  os_activity_scope_leave(&state);
}

- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/clear-pcs-chaches-for-known-containers", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6E9170;
  v11[3] = &unk_1E1F60910;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = sub_18A6E9184;
  v9[3] = &unk_1E1F61690;
  v7 = v12;
  v10 = v7;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v8, 0, (uint64_t)v11, v9);

  os_activity_scope_leave(&state);
}

- (void)kill
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  pid_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  objc_msgSend_connection(self, a2, v2, v3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_processIdentifier(v10, v4, v5, v6);
  if (v7)
  {
    kill(v7, 9);
    objc_msgSend_invalidate_(v10, v8, 0, v9);
  }

}

- (void)_getProcessScopedDaemonProxySynchronous:(BOOL)a3 errorHandler:(id)a4 daemonProxyHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  BOOL v16;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_18A6E9284;
  v13[3] = &unk_1E1F60850;
  v16 = v6;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend__getProcessScopedDaemonProxyCreatorSynchronous_completionHandler_(self, v12, v6, (uint64_t)v13);

}

- (id)globalDeviceIdentifierWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_18A5C5000, "client/global-device-identifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v6 = ck_log_facility_distributed_sync;
  if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18A5C5000, v6, OS_LOG_TYPE_INFO, "Will fetch global device identifier from daemon", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = sub_18A6E9528;
  v22 = sub_18A6E9538;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_18A6E9528;
  v16 = sub_18A6E9538;
  v17 = 0;
  v10[5] = buf;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_18A6E9540;
  v11[3] = &unk_1E1F60CF0;
  v11[4] = &v12;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_18A6E9638;
  v10[3] = &unk_1E1F616B8;
  v10[4] = &v12;
  objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(self, v7, 1, (uint64_t)v11, v10);
  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  v8 = *((id *)v19 + 5);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

  return v8;
}

- (unint64_t)maxInlineMergeableDeltaSize
{
  NSObject *v3;
  CKProcessScopedDaemonProxy *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  const char *v10;
  unint64_t v11;
  uint8_t v13[16];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_18A5C5000, "client/max-inline-mergeable-delta-size", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E0C99D68], v5, v6, v7);
  if (v8 - *(double *)&qword_1EDF6F730 > 86400.0)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v9 = ck_log_facility_distributed_sync;
    if (os_log_type_enabled((os_log_t)ck_log_facility_distributed_sync, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18A5C5000, v9, OS_LOG_TYPE_INFO, "Will fetch max inline delta size from daemon", v13, 2u);
    }
    objc_msgSend__getProcessScopedDaemonProxySynchronous_errorHandler_daemonProxyHandler_(v4, v10, 1, (uint64_t)&unk_1E1F58D38, &unk_1E1F616D8);
  }
  v11 = qword_1EDF69388;
  objc_sync_exit(v4);

  os_activity_scope_leave(&state);
  return v11;
}

- (void)_getProcessScopedDaemonProxyCreatorSynchronous:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, void *, _QWORD);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CKProcessScopedDaemonProxy *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  CKProcessScopedDaemonProxy *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  _QWORD v33[5];
  void (**v34)(id, void *, _QWORD);
  _QWORD v35[4];
  id v36;
  id location;

  v4 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend_connection(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend_connectionInterruptedObserver(v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_initWeak(&location, v11);
    objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = sub_18A6E9DA0;
    v35[3] = &unk_1E1F60878;
    objc_copyWeak(&v36, &location);
    objc_msgSend_addObserverForName_object_queue_usingBlock_(v19, v20, (uint64_t)CFSTR("CKXPCConnectionInterrupted"), (uint64_t)v10, 0, v35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setConnectionInterruptedObserver_(v11, v22, (uint64_t)v21, v23);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v11);

  v24 = v11;
  objc_sync_enter(v24);
  if (objc_msgSend_hasValidProcessScopedDaemonProxyCreator(v24, v25, v26, v27))
  {
    objc_msgSend_processScopedDaemonProxyCreator(v24, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  objc_sync_exit(v24);

  if (v31)
  {
    v6[2](v6, v31, 0);
  }
  else
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = sub_18A6E9E8C;
    v33[3] = &unk_1E1F61740;
    v33[4] = v24;
    v34 = v6;
    objc_msgSend_getProcessScopedDaemonProxyCreatorSynchronous_completionHandler_(v10, v32, v4, (uint64_t)v33);

  }
}

- (CKXPCProcessScopedDaemon)processScopedDaemonProxyCreator
{
  return self->_processScopedDaemonProxyCreator;
}

- (void)setProcessScopedDaemonProxyCreator:(id)a3
{
  objc_storeStrong((id *)&self->_processScopedDaemonProxyCreator, a3);
}

- (BOOL)hasValidProcessScopedDaemonProxyCreator
{
  return self->_hasValidProcessScopedDaemonProxyCreator;
}

- (void)setHasValidProcessScopedDaemonProxyCreator:(BOOL)a3
{
  self->_hasValidProcessScopedDaemonProxyCreator = a3;
}

- (NSObject)connectionInterruptedObserver
{
  return self->_connectionInterruptedObserver;
}

- (void)setConnectionInterruptedObserver:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInterruptedObserver, a3);
}

- (CKXPCConnection)connection
{
  return (CKXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_connectionInterruptedObserver, 0);
  objc_storeStrong((id *)&self->_processScopedDaemonProxyCreator, 0);
}

@end
