@implementation CKDPCSKeySyncTracker

- (unint64_t)state
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;

  objc_msgSend_syncGroup(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  objc_msgSend_completionDate(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v7, v8, v9);
  v11 = v10;

  objc_msgSend_completionDate(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && fabs(v11) < 1800.0)
    return 2;
  objc_msgSend_syncStatus(self, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v17 = 3;
  else
    v17 = 1;

  return v17;
}

- (void)waitOnSyncWithQueue:(id)a3 waiterOperationID:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend_syncGroup(self, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BEB1CA5C;
  block[3] = &unk_1E782F678;
  block[4] = self;
  v17 = v8;
  v18 = v9;
  v14 = v9;
  v15 = v8;
  dispatch_group_notify(v13, v10, block);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSString)accountDsid
{
  return self->_accountDsid;
}

- (void)setAccountDsid:(id)a3
{
  objc_storeStrong((id *)&self->_accountDsid, a3);
}

- (BOOL)isManatee
{
  return self->_manatee;
}

- (void)setManatee:(BOOL)a3
{
  self->_manatee = a3;
}

- (OS_dispatch_group)syncGroup
{
  return self->_syncGroup;
}

- (void)setSyncGroup:(id)a3
{
  objc_storeStrong((id *)&self->_syncGroup, a3);
}

- (NSDate)completionDate
{
  return self->_completionDate;
}

- (void)setCompletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_completionDate, a3);
}

- (NSNumber)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(id)a3
{
  objc_storeStrong((id *)&self->_syncStatus, a3);
}

- (NSError)syncError
{
  return self->_syncError;
}

- (void)setSyncError:(id)a3
{
  objc_storeStrong((id *)&self->_syncError, a3);
}

- (BOOL)KRSReturnedExistingIdentity
{
  return self->_KRSReturnedExistingIdentity;
}

- (void)setKRSReturnedExistingIdentity:(BOOL)a3
{
  self->_KRSReturnedExistingIdentity = a3;
}

- (NSString)requestorOperationID
{
  return self->_requestorOperationID;
}

- (void)setRequestorOperationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestorOperationID, 0);
  objc_storeStrong((id *)&self->_syncError, 0);
  objc_storeStrong((id *)&self->_syncStatus, 0);
  objc_storeStrong((id *)&self->_completionDate, 0);
  objc_storeStrong((id *)&self->_syncGroup, 0);
  objc_storeStrong((id *)&self->_accountDsid, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
