@implementation CKDProcessScopedStateManagerEntitledWrapper

- (CKDProcessScopedStateManagerEntitledWrapper)initWithEntitlements:(id)a3
{
  id v5;
  CKDProcessScopedStateManagerEntitledWrapper *v6;
  CKDProcessScopedStateManagerEntitledWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDProcessScopedStateManagerEntitledWrapper;
  v6 = -[CKDProcessScopedStateManagerEntitledWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entitlements, a3);

  return v7;
}

- (void)dumpAllClientsStatusReportToFileHandle:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dumpAllClientsStatusReportToFileHandle_completionHandler_(v10, v9, (uint64_t)v6, v5);

}

- (void)clearPCSCachesForKnownContainersWithCompletionHandler:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v3 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clearPCSCachesForKnownContainersWithCompletionHandler_(v7, v6, (uint64_t)v3);

}

- (void)accountsDidGrantAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountsDidGrantAccessToBundleID_containerIdentifiers_(v10, v9, (uint64_t)v6, v5);

}

- (void)accountsDidRevokeAccessToBundleID:(id)a3 containerIdentifiers:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountsDidRevokeAccessToBundleID_containerIdentifiers_(v10, v9, (uint64_t)v6, v5);

}

- (void)accountsWillDeleteAccount:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountsWillDeleteAccount_completionHandler_(v10, v9, (uint64_t)v6, v5);

}

- (void)accountWithID:(id)a3 changedWithChangeType:(int64_t)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v5 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountWithID_changedWithChangeType_(v9, v8, (uint64_t)v5, a4);

}

- (void)fetchUsabilityForTestAccountCredentials:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchUsabilityForTestAccountCredentials_completionHandler_(v10, v9, (uint64_t)v6, v5);

}

- (void)wipeAllCachesAndDie
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_sharedManager(CKDProcessScopedStateManager, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wipeAllCachesAndDie(v5, v3, v4);

}

- (void)wipeServerConfigurationsAndDie
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_sharedManager(CKDProcessScopedStateManager, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wipeServerConfigurationsAndDie(v5, v3, v4);

}

- (void)updatePushTokens
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_sharedManager(CKDProcessScopedStateManager, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updatePushTokens(v5, v3, v4);

}

- (void)maxInlineMergeableDeltaSizeWithCompletionHandler:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;

  v3 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v4, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_maxInlineMergeableDeltaSizeWithCompletionHandler_(v7, v6, (uint64_t)v3);

}

- (void)globalDeviceIdentifierWithCompletionHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = a3;
  objc_msgSend_sharedManager(CKDProcessScopedStateManager, v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__globalDeviceIdentifierWithEntitlements_completionHandler_(v11, v10, (uint64_t)v9, v4);

}

- (CKEntitlements)entitlements
{
  return (CKEntitlements *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
}

@end
