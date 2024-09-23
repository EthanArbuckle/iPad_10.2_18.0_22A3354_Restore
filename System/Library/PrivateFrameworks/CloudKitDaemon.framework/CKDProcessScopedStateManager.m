@implementation CKDProcessScopedStateManager

+ (id)sharedManager
{
  if (qword_1ED702CC8 != -1)
    dispatch_once(&qword_1ED702CC8, &unk_1E7838A10);
  return (id)qword_1ED702CC0;
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDProcessScopedStateManager;
  return -[CKDProcessScopedStateManager init](&v3, sel_init);
}

- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;

  v11 = a4;
  v5 = a3;
  objc_msgSend_sharedConnectionManager(CKDXPCConnectionManager, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dumpStatusReportToFileHandle_(v8, v9, (uint64_t)v5);

  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    v10 = v11;
  }

}

- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3
{
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend_evictPCSSQLCachesForKnownContainers(CKDPCSSQLCache, v3, v4);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1BE990000, v7, OS_LOG_TYPE_INFO, "accountsDidGrantAccessToBundleID:%@ containerIdentifiers:%@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1BE990000, v7, OS_LOG_TYPE_INFO, "accountsDidRevokeAccessToBundleID:%@ containerIdentifiers:%@", buf, 0x16u);
  }
  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1BEC76BFC;
  v12[3] = &unk_1E782EE20;
  v13 = v5;
  v14 = v9;
  v10 = v9;
  v11 = v5;
  CKMuckingWithPersonas(v12);

}

- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  _QWORD *v7;
  os_log_t *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD);
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = (_QWORD *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v8 = (os_log_t *)MEMORY[0x1E0C952B0];
  v9 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v5;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "accountsWillDeleteAccount:%@", buf, 0xCu);
  }
  if (BYSetupAssistantNeedsToRun())
  {
    if (*v7 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Will not unregister any push token as we're in Buddy", buf, 2u);
    }
    if (v6)
      v6[2](v6, 0);
  }
  else
  {
    objc_msgSend_defaultContext(CKDLogicalDeviceContext, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenRegistrationScheduler(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1BEC77070;
    v18[3] = &unk_1E7835A30;
    v19 = v6;
    objc_msgSend_unregisterAllTokensForAccountID_completionHandler_(v16, v17, (uint64_t)v5, v18);

  }
}

- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4
{
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v9 = v6;
    CKStringFromAccountChangeType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1BE990000, v9, OS_LOG_TYPE_INFO, "Account %@ changed with type %@", (uint8_t *)&v18, 0x16u);

  }
  objc_msgSend_sharedAccountStore(CKDAccountStore, v7, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_invalidateCache(v11, v12, v13);

  objc_msgSend_sharedNotifier(CKDAccountNotifier, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postAccountChangedNotificationWithAccountID_changeType_(v16, v17, (uint64_t)v5, a4);

}

- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  id v6;
  CKDAccount *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t isValidTestAccount;
  id inited;

  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  v7 = [CKDAccount alloc];
  inited = (id)objc_msgSend_initExplicitCredentialsAccountWithAccountOverrideInfo_(v7, v8, (uint64_t)v6);

  isValidTestAccount = objc_msgSend_isValidTestAccount(inited, v9, v10);
  v5[2](v5, isValidTestAccount, 0);

}

- (void)_wipePersonaBasedClientCacheForAppRecord:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void (**v14)(_QWORD);
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(_QWORD);
  _QWORD aBlock[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend_identities(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        aBlock[0] = v11;
        aBlock[1] = 3221225472;
        aBlock[2] = sub_1BEC774CC;
        aBlock[3] = &unk_1E782EA40;
        v24 = v3;
        v14 = (void (**)(_QWORD))_Block_copy(aBlock);
        objc_msgSend_personaUniqueString(v13, v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          v20[0] = v11;
          v20[1] = 3221225472;
          v20[2] = sub_1BEC77670;
          v20[3] = &unk_1E782F4D0;
          v21 = v17;
          v22 = v14;
          CKMuckingWithPersonas(v20);

        }
        else
        {
          v14[2](v14);
        }

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v19, (uint64_t)&v25, v29, 16);
    }
    while (v9);
  }

}

- (void)wipeAllCachesAndDie
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint8_t v16[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_enumeratorWithOptions_(MEMORY[0x1E0CA5870], a2, 0);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, v21, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend__wipePersonaBasedClientCacheForAppRecord_(self, v6, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CKGetHomeCacheDir();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtPath_error_(v12, v14, (uint64_t)v13, 0);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v15 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v16 = 0;
    _os_log_error_impl(&dword_1BE990000, v15, OS_LOG_TYPE_ERROR, "It's time for cloudd to die...", v16, 2u);
  }
  exit(1);
}

- (void)wipeServerConfigurationsAndDie
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend_sharedManager(CKDServerConfigurationManager, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wipeAllConfigurations(v3, v4, v5);

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v6 = *MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl(&dword_1BE990000, v6, OS_LOG_TYPE_ERROR, "It's time for cloudd to die...", v7, 2u);
  }
  exit(1);
}

- (void)updatePushTokens
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_defaultContext(CKDLogicalDeviceContext, a2, v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenRegistrationScheduler(v8, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_forceTokenRefreshForAllClients(v5, v6, v7);

}

- (void)kickOffPendingLongLivedOperations
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  dispatch_once_t *v18;
  os_log_t *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend_defaultContext(CKDLogicalDeviceContext, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationInfoCache(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_resumableOperationInfosByAppContainerAccountTuplesWithProgressPurged_(v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = sub_1BEC77B6C;
  v30[3] = &unk_1E782E418;
  v25 = v10;
  v31 = v25;
  v11 = v2;
  v32 = v11;
  v12 = v8;
  v33 = v12;
  CKMuckingWithPersonas(v30);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v26, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    v18 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v19 = (os_log_t *)MEMORY[0x1E0C952B0];
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v13);
        v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
        if (*v18 != -1)
          dispatch_once(v18, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v22 = *v19;
        if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v21;
          _os_log_impl(&dword_1BE990000, v22, OS_LOG_TYPE_INFO, "Forgetting all about operation %{public}@", buf, 0xCu);
        }
        objc_msgSend_deleteAllInfoForOperationWithID_(v12, v23, v21);
        ++v20;
      }
      while (v16 != v20);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v24, (uint64_t)&v26, v36, 16);
    }
    while (v16);
  }

}

- (void)maxInlineMergeableDeltaSizeWithCompletionHandler:(id)a3
{
  void (**v3)(id, uint64_t);
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, uint64_t))a3;
  objc_msgSend_sharedManager(CKDServerConfigurationManager, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastKnownServerConfiguration(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v11 = objc_msgSend_maxInlineMergeableDeltaSize_(v9, v10, 0);
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      v14 = 134217984;
      v15 = v11;
      v13 = "Returning max inline mergeable delta size from configuration: %ld";
LABEL_11:
      _os_log_debug_impl(&dword_1BE990000, v12, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = 92160;
    v12 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      v14 = 134217984;
      v15 = 92160;
      v13 = "Returning default max inline mergeable delta size: %ld";
      goto LABEL_11;
    }
  }
  v3[2](v3, v11);

}

- (void)globalDeviceIdentifierWithCompletionHandler:(id)a3
{
  objc_msgSend__globalDeviceIdentifierWithEntitlements_completionHandler_(self, a2, 0, a3);
}

- (void)_globalDeviceIdentifierWithEntitlements:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend_hasSPIEntitlement(a3, v7, v8))
  {
    objc_msgSend_sharedManager(CKDDeviceIDManager, v9, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_globalDeviceIdentifier(v14, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v13, 0);

    v6 = (void (**)(id, uint64_t, _QWORD))v13;
  }
  else
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v9, *MEMORY[0x1E0C947D8], 8, CFSTR("Connection %@ is not entitled to call CloudKit SPI"), self);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, uint64_t, _QWORD), _QWORD))v6[2])(v6, 0);
  }

}

@end
