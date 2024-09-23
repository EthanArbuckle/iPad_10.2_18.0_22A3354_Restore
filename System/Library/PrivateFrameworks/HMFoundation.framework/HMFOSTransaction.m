@implementation HMFOSTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)dealloc
{
  void *v3;
  HMFOSTransaction *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
  objc_super v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC355C](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFOSTransaction transaction](v4, "transaction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v9 = v8;
    -[HMFOSTransaction creationTime](v4, "creationTime");
    *(_DWORD *)buf = 138543874;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2048;
    v22 = v9 - v10;
    _os_log_impl(&dword_19B546000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Completed transaction '%@' - held for %.3fs", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMFOSTransaction transaction](v4, "transaction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 5000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__HMFOSTransaction_dealloc__block_invoke;
  block[3] = &unk_1E3B37AF8;
  v16 = v11;
  v13 = v11;
  dispatch_after(v12, MEMORY[0x1E0C80D38], block);

  v14.receiver = v4;
  v14.super_class = (Class)HMFOSTransaction;
  -[HMFOSTransaction dealloc](&v14, sel_dealloc);
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (HMFOSTransaction)initWithName:(id)a3
{
  id v4;
  HMFOSTransaction *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  OS_os_transaction *transaction;
  void *v13;
  HMFOSTransaction *v14;
  NSObject *v15;
  void *v16;
  OS_os_transaction *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  OS_os_transaction *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMFOSTransaction;
  v5 = -[HMFOSTransaction init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v5->_creationTime = v6;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "UTF8String");
    v11 = os_transaction_create();
    transaction = v5->_transaction;
    v5->_transaction = (OS_os_transaction *)v11;

    v13 = (void *)MEMORY[0x1A1AC355C]();
    v14 = v5;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v5->_transaction;
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_19B546000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Creating transaction '%@'", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);

  }
  return v5;
}

- (HMFOSTransaction)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

void __27__HMFOSTransaction_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC355C]();
  HMFGetOSLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_19B546000, v3, OS_LOG_TYPE_DEBUG, "%{public}@Releasing transaction '%@'", (uint8_t *)&v6, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

- (double)creationTime
{
  return self->_creationTime;
}

@end
