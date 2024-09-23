@implementation HDDataCollectionAssertion

- (void)setObserverState:(id)a3
{
  HDDataCollectionObserverState *v4;
  HDDataCollectionObserverState *observerState;
  _QWORD *WeakRetained;
  HDDataCollectionAssertion *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _BYTE buf[24];
  void *v16;
  _QWORD *v17;
  HDDataCollectionAssertion *v18;
  id v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (objc_msgSend(v14, "isEqual:", self->_observerState))
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v4 = (HDDataCollectionObserverState *)objc_msgSend(v14, "copy");
    observerState = self->_observerState;
    self->_observerState = v4;

    os_unfair_lock_unlock(&self->_lock);
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataCollectionManager);
    v7 = self;
    v8 = v14;
    if (WeakRetained)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB52A8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52A8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = WeakRetained;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v7;
        *(_WORD *)&buf[22] = 2114;
        v16 = v8;
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Data collection observer %{public}@ changed to state %{public}@", buf, 0x20u);
      }
      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__dataCollectionObserver_didChangeState_, WeakRetained, CFSTR("HDDataCollectionManager.m"), 380, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state != nil"));

      }
      +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", WeakRetained, CFSTR("ObserverDidChangeState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = WeakRetained[17];
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __66__HDDataCollectionManager__dataCollectionObserver_didChangeState___block_invoke;
      v16 = &unk_1E6CECCA8;
      v17 = WeakRetained;
      v18 = v7;
      v19 = v8;
      v20 = v10;
      v12 = v10;
      dispatch_async(v11, buf);

    }
  }

}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDDataCollectionAssertion;
  -[HDAssertion description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %@, %@>"), v5, self->_sampleTypes, self->_observerState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (HDDataCollectionObserverState)observerState
{
  return self->_observerState;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCollectionManager);
  objc_storeStrong((id *)&self->_sampleTypes, 0);
  objc_storeStrong((id *)&self->_observerState, 0);
}

@end
