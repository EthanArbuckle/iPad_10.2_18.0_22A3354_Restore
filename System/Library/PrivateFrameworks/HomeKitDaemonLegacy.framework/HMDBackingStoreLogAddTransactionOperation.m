@implementation HMDBackingStoreLogAddTransactionOperation

- (HMDBackingStoreLogAddTransactionOperation)initWithTransaction:(id)a3
{
  id v4;
  HMDBackingStoreLogAddTransactionOperation *v5;

  v4 = a3;
  v5 = -[HMDBackingStoreLogAddTransactionOperation initWithAtomicSaveEnabled:transaction:](self, "initWithAtomicSaveEnabled:transaction:", !isWatch(), v4);

  return v5;
}

- (HMDBackingStoreLogAddTransactionOperation)initWithAtomicSaveEnabled:(BOOL)a3 transaction:(id)a4
{
  id v7;
  HMDBackingStoreLogAddTransactionOperation *v8;
  HMDBackingStoreLogAddTransactionOperation *v9;
  HMDBackingStoreLogAddTransactionOperation *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDBackingStoreLogAddTransactionOperation;
  v8 = -[HMDBackingStoreOperation init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_transaction, a4);
    v9->_isAtomicSaveEnabled = a3;
    v10 = v9;
  }

  return v9;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMDBackingStoreLogAddTransactionOperation *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29[2];
  char v30;
  id v31;
  _BYTE location[12];
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HMDBackingStoreOperation store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_begin");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDBackingStoreOperation store](self, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "local");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreOperation store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "root");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreLogAddTransactionOperation transaction](self, "transaction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreLogAddTransactionOperation transaction](self, "transaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "options");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v13 = (void *)objc_msgSend(v7, "_insertLogWithRoot:transaction:set:error:", v9, v10, objc_msgSend(v12, "destination") | 0x100000000000000, &v31);
    v5 = v31;

    if (v5)
    {
      -[HMDBackingStoreOperation store](self, "store");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "local");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_rollback");

    }
    else if (-[HMDBackingStoreLogAddTransactionOperation isAtomicSaveEnabled](self, "isAtomicSaveEnabled"))
    {
      objc_initWeak((id *)location, self);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __63__HMDBackingStoreLogAddTransactionOperation_mainReturningError__block_invoke;
      v27[3] = &unk_1E89B6120;
      objc_copyWeak(v29, (id *)location);
      v29[1] = v13;
      v28 = 0;
      v30 = 0;
      -[HMDBackingStoreOperation setOperationFinishBlock:](self, "setOperationFinishBlock:", v27);

      objc_destroyWeak(v29);
      objc_destroyWeak((id *)location);
    }
    else
    {
      -[HMDBackingStoreOperation store](self, "store");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "local");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_commit");
      v18 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1D17BA0A0]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v18)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v23;
          v33 = 2048;
          v34 = v13;
          v35 = 2112;
          v36 = v18;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit non-atomic transaction %lu: %@", location, 0x20u);

        }
        objc_autoreleasePoolPop(v19);
        v5 = (id)v18;
      }
      else
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138543618;
          *(_QWORD *)&location[4] = v24;
          v33 = 2048;
          v34 = v13;
          _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully committed non-atomic transaction %lu to log", location, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
      }
    }
  }
  v25 = v5;

  return v25;
}

- (HMDBackingStoreTransactionBlock)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_transaction, a3);
}

- (int64_t)pushFlags
{
  return self->_pushFlags;
}

- (void)setPushFlags:(int64_t)a3
{
  self->_pushFlags = a3;
}

- (BOOL)isAtomicSaveEnabled
{
  return self->_isAtomicSaveEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

void __63__HMDBackingStoreLogAddTransactionOperation_mainReturningError__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_13;
  if (!v3)
  {
    objc_msgSend(WeakRetained, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "local");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_commit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = v5;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v6)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 48);
        v16 = *(_QWORD *)(a1 + 32);
        v22 = 138543874;
        v23 = v14;
        v24 = 2048;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        v17 = "%{public}@Failed to commit atomic transaction %lu: %@";
        v18 = v13;
        v19 = OS_LOG_TYPE_ERROR;
        v20 = 32;
LABEL_10:
        _os_log_impl(&dword_1CD062000, v18, v19, v17, (uint8_t *)&v22, v20);

      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 48);
      v22 = 138543618;
      v23 = v14;
      v24 = 2048;
      v25 = v21;
      v17 = "%{public}@Successfully committed atomic transaction %lu to log";
      v18 = v13;
      v19 = OS_LOG_TYPE_DEFAULT;
      v20 = 22;
      goto LABEL_10;
    }

    objc_autoreleasePoolPop(v10);
    goto LABEL_12;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "local");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_rollback");

LABEL_12:
  }
LABEL_13:

}

@end
