@implementation FCCKPrivateDatabaseOperation

- (FCCKPrivateDatabaseOperation)init
{
  FCCKPrivateDatabaseOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCCKPrivateDatabaseOperation;
  result = -[FCOperation init](&v3, sel_init);
  if (result)
  {
    result->_skipPreflight = 0;
    result->_handleIdentityLoss = 1;
  }
  return result;
}

- (BOOL)validateOperation
{
  BOOL v3;
  void *v4;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)FCCKPrivateDatabaseOperation;
  v3 = -[FCOperation validateOperation](&v7, sel_validateOperation);
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't execute a private database operation without a database"));
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCCKPrivateDatabaseOperation validateOperation]";
    v10 = 2080;
    v11 = "FCCKPrivateDatabaseOperation.m";
    v12 = 1024;
    v13 = 41;
    v14 = 2114;
    v15 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  return v4 && v3;
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6;
  FCOperationNotificationRetrySignal *v7;
  FCOperationNotificationRetrySignal *v8;
  FCOperationExternalSignal *v9;
  FCCKSecureDatabaseResetOperation *v10;
  void *v11;
  BOOL v12;
  FCOperationExternalSignal *v13;
  FCOperationExternalSignal *v14;
  FCOperationDelayedRetrySignal *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  FCCKPrivateDatabaseOperation *v21;
  FCOperationExternalSignal *v22;

  v6 = a3;
  if (objc_msgSend(v6, "fc_hasIdentityStillSyncingError"))
  {
    v7 = [FCOperationNotificationRetrySignal alloc];
    v8 = -[FCOperationNotificationRetrySignal initWithNotificationName:timeout:](v7, "initWithNotificationName:timeout:", *MEMORY[0x1E0C94870], 30.0);
LABEL_8:
    *a4 = v8;
    v12 = 1;
    goto LABEL_10;
  }
  if (!-[FCCKPrivateDatabaseOperation handleIdentityLoss](self, "handleIdentityLoss")
    || !objc_msgSend(v6, "fc_hasIdentityLostError"))
  {
    if (!objc_msgSend(v6, "fc_hasXPCInterruptedOrInvalidError"))
    {
      v12 = 0;
      goto LABEL_10;
    }
    v15 = [FCOperationDelayedRetrySignal alloc];
    CKRetryAfterSecondsForError();
    v8 = -[FCOperationDelayedRetrySignal initWithDelay:](v15, "initWithDelay:");
    goto LABEL_8;
  }
  v9 = objc_alloc_init(FCOperationExternalSignal);
  v10 = objc_alloc_init(FCCKSecureDatabaseResetOperation);
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKSecureDatabaseResetOperation setDatabase:](v10, "setDatabase:", v11);

  v12 = 1;
  -[FCCKSecureDatabaseResetOperation setDeleteZones:](v10, "setDeleteZones:", 1);
  -[FCCKSecureDatabaseResetOperation setRestoreSecureSentinel:](v10, "setRestoreSecureSentinel:", 1);
  -[FCCKSecureDatabaseResetOperation setRestoreZoneContents:](v10, "setRestoreZoneContents:", 1);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __61__FCCKPrivateDatabaseOperation_canRetryWithError_retryAfter___block_invoke;
  v20 = &unk_1E463B318;
  v21 = self;
  v22 = v9;
  v13 = v9;
  -[FCCKSecureDatabaseResetOperation setResetCompletionHandler:](v10, "setResetCompletionHandler:", &v17);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v10, v17, v18, v19, v20, v21);
  -[FCOperation start](v10, "start");
  v14 = objc_retainAutorelease(v13);
  *a4 = v14;

LABEL_10:
  return v12;
}

uint64_t __61__FCCKPrivateDatabaseOperation_canRetryWithError_retryAfter___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  void *v6;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a2;
    objc_msgSend(v4, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateDatabase takeDatabaseOfflineDueToError:]((uint64_t)v6, v5);

  }
  return objc_msgSend(*(id *)(a1 + 40), "triggerWithRetry:", a2 == 0);
}

- (void)runChildCKOperation:(id)a3 destination:(int64_t)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  id v9;

  v6 = a3;
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v6);
  v7 = -[FCCKPrivateDatabaseOperation skipPreflight](self, "skipPreflight");
  -[FCCKPrivateDatabaseOperation database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (v8)
      -[FCCKPrivateDatabase _addCKOperation:destination:]((uint64_t)v8, v6, a4);
  }
  else
  {
    -[FCCKPrivateDatabase addCKOperation:destination:](v8, v6, a4);
  }

}

- (FCCKPrivateDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (BOOL)skipPreflight
{
  return self->_skipPreflight;
}

- (void)setSkipPreflight:(BOOL)a3
{
  self->_skipPreflight = a3;
}

- (BOOL)handleIdentityLoss
{
  return self->_handleIdentityLoss;
}

- (void)setHandleIdentityLoss:(BOOL)a3
{
  self->_handleIdentityLoss = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
