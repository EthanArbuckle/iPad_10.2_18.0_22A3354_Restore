@implementation HDSyncSession

- (HDSyncStore)syncStore
{
  return self->_syncStore;
}

- (void)syncWillBegin
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "syncSessionWillBegin:", self);

}

- (void)syncDidFinishWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  HDSyncSessionDelegate **p_delegate;
  id v7;
  id WeakRetained;

  v4 = a3;
  p_delegate = &self->_delegate;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncSession:didFinishSuccessfully:error:", self, v4, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_shortSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_syncStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_sessionUUID, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p uuid:%@ reason:\"%@\">"), v4, self, v5, self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)syncDidBeginWithProfile:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)excludedSyncStores
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HDSyncSession syncStore](self, "syncStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)sendChanges:(id)a3 completion:(id)a4
{
  HDSyncSessionDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "syncSession:sendChanges:completion:", self, v8, v7);

}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HDSyncSession)initWithSyncStore:(id)a3 reason:(id)a4 delegate:(id)a5
{
  id v10;
  id v11;
  id v12;
  HDSyncSession *v13;
  HDSyncSession *v14;
  uint64_t v15;
  NSUUID *sessionUUID;
  void *v17;
  uint64_t v18;
  NSString *shortSessionIdentifier;
  uint64_t v20;
  NSDate *startDate;
  uint64_t v22;
  NSCalendar *calendar;
  uint64_t v24;
  NSString *reason;
  HDAssertion *databaseAccessibilityAssertion;
  void *v28;
  objc_super v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSyncSession.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

  }
  v29.receiver = self;
  v29.super_class = (Class)HDSyncSession;
  v13 = -[HDSyncSession init](&v29, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    objc_storeStrong((id *)&v14->_syncStore, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    sessionUUID = v14->_sessionUUID;
    v14->_sessionUUID = (NSUUID *)v15;

    -[NSUUID UUIDString](v14->_sessionUUID, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringToIndex:", 4);
    v18 = objc_claimAutoreleasedReturnValue();
    shortSessionIdentifier = v14->_shortSessionIdentifier;
    v14->_shortSessionIdentifier = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = objc_claimAutoreleasedReturnValue();
    startDate = v14->_startDate;
    v14->_startDate = (NSDate *)v20;

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v22 = objc_claimAutoreleasedReturnValue();
    calendar = v14->_calendar;
    v14->_calendar = (NSCalendar *)v22;

    v24 = objc_msgSend(v11, "copy");
    reason = v14->_reason;
    v14->_reason = (NSString *)v24;

    databaseAccessibilityAssertion = v14->_databaseAccessibilityAssertion;
    v14->_databaseAccessibilityAssertion = 0;
    v14->_databaseAccessibilityTimeout = 30.0;

  }
  return v14;
}

- (HDSyncSession)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSyncPredicate)syncPredicate
{
  HDSyncPredicate *v3;
  void *v4;
  void *v5;
  void *v6;
  HDSyncPredicate *v7;

  v3 = [HDSyncPredicate alloc];
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[HDSyncStore syncProvenance](self->_syncStore, "syncProvenance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSyncPredicate initWithExcludedSyncProvenances:dateInterval:includedObjectTypes:defaultMaximumObjectAge:defaultMaximumTombstoneAge:maximumObjectAgeByType:](v3, "initWithExcludedSyncProvenances:dateInterval:includedObjectTypes:defaultMaximumObjectAge:defaultMaximumTombstoneAge:maximumObjectAgeByType:", v6, 0, 0, 0, 0, 0);

  return v7;
}

- (void)willSyncAnchorRanges:(id)a3
{
  id v4;
  id v5;
  char v6;
  id v7;
  id to;

  v4 = a3;
  objc_copyWeak(&to, (id *)&self->_delegate);
  v5 = objc_loadWeakRetained(&to);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained(&to);
    objc_msgSend(v7, "syncSession:willSyncAnchorRanges:", self, v4);

  }
  objc_destroyWeak(&to);

}

- (BOOL)transactionDidEndWithError:(id *)a3
{
  HDSyncSessionDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = objc_msgSend(v9, "syncSession:didEndTransactionWithError:", self, a3);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = objc_opt_class();
    v9 = objc_loadWeakRetained((id *)p_delegate);
    NSStringFromSelector(sel_syncSession_didEndTransactionWithError_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v12, a2, CFSTR("%@ does not respond to selector %@"), v9, v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v10 = 0;
  }

  return v10;
}

- (BOOL)requiresSyncForChangesFromAnchorRangeMap:(id)a3
{
  return 1;
}

- (id)excludedSyncIdentities
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)shouldOverrideCycleTrackingSymptomsForBackwardsCompatibilty
{
  return 0;
}

- (id)newChangeWithSyncEntityClass:(Class)a3 version:(id)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (int64_t)maxEncodedBytesPerCodableChangeForSyncEntityClass:(Class)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)maxEncodedBytesPerChangeSetForSyncEntityClass:(Class)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (HDSyncSessionDelegate)delegate
{
  return (HDSyncSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)shortSessionIdentifier
{
  return self->_shortSessionIdentifier;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)reason
{
  return self->_reason;
}

- (HDAssertion)databaseAccessibilityAssertion
{
  return self->_databaseAccessibilityAssertion;
}

- (void)setDatabaseAccessibilityAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_databaseAccessibilityAssertion, a3);
}

- (double)databaseAccessibilityTimeout
{
  return self->_databaseAccessibilityTimeout;
}

- (void)setDatabaseAccessibilityTimeout:(double)a3
{
  self->_databaseAccessibilityTimeout = a3;
}

@end
