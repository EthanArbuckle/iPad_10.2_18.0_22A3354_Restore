@implementation AMSMescalFairPlay

void __51__AMSMescalFairPlay__dataWithFairPlayBytes_length___block_invoke(uint64_t a1, uint64_t a2)
{
  jEHf8Xzsv8K(a2);
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t context;
  uint64_t v9;
  id v10;
  int v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  context = (uint64_t)self->_context;
  if (context)
  {
    v27 = 0;
    v26 = 0;
    v25 = -1;
    if (self->_mescalType == 2)
      v9 = 210;
    else
      v9 = 200;
    v10 = objc_retainAutorelease(v6);
    Mib5yocT(v9, (uint64_t)&self->_hardwareInfo, context, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (uint64_t)&v27, (uint64_t)&v26, (uint64_t)&v25);
    if (v11)
    {
      v12 = v11;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v13, "OSLogObject");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        v16 = v15;
        -[AMSMescalFairPlay logKey](self, "logKey");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v15;
        v30 = 2114;
        v31 = v17;
        v32 = 2048;
        v33 = v12;
        _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] SAPExchange failed: %ld", buf, 0x20u);

      }
      context = 0;
    }
    else
    {
      self->_complete = v25 == 0;
      -[AMSMescalFairPlay _dataWithFairPlayBytes:length:](self, "_dataWithFairPlayBytes:length:", v27, v26);
      context = objc_claimAutoreleasedReturnValue();
    }
    v18 = 0;
  }
  else
  {
    AMSError(304, CFSTR("Mescal Failed"), CFSTR("No context available for exchange"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  if (!(v18 | context))
  {
    AMSError(0, CFSTR("FairPlay Mescal Failed"), CFSTR("An unknown error occurred exchanging data"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  if (v18)
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease((id)v18);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v19, "OSLogObject");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_opt_class();
        v22 = v21;
        -[AMSMescalFairPlay logKey](self, "logKey");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v21;
        v30 = 2114;
        v31 = v23;
        v32 = 2114;
        v33 = v18;
        _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to exchange data. Error = %{public}@", buf, 0x20u);

      }
    }
  }

  return (id)context;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t context;
  id v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  unsigned int v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  context = (uint64_t)self->_context;
  if (context)
  {
    v28 = 0;
    v27 = 0;
    v9 = objc_retainAutorelease(v6);
    Fc3vhtJDvr(context, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (uint64_t)&v28, (uint64_t)&v27);
    if (v10)
    {
      v11 = v10;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_opt_class();
        v15 = v14;
        -[AMSMescalFairPlay logKey](self, "logKey");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v14;
        v31 = 2114;
        v32 = v16;
        v33 = 2048;
        v34 = v11;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] SAPExchange failed: %ld", buf, 0x20u);

      }
      if (v11 == -42186)
      {
        v17 = CFSTR("Bad SAP session for signing");
        v18 = 302;
        v19 = 0;
      }
      else
      {
        v17 = CFSTR("Mescal Failed");
        v19 = CFSTR("Bad SAP signature");
        v18 = 304;
      }
      AMSError(v18, v17, v19, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      context = 0;
    }
    else
    {
      -[AMSMescalFairPlay _dataWithFairPlayBytes:length:](self, "_dataWithFairPlayBytes:length:", v28, v27);
      context = objc_claimAutoreleasedReturnValue();
      v20 = 0;
    }
  }
  else
  {
    AMSError(304, CFSTR("Mescal Failed"), CFSTR("No SAP context for signing"), 0);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  if (!(v20 | context))
  {
    AMSError(0, CFSTR("FairPlay Mescal Failed"), CFSTR("An unknown error occurred signing data"), 0);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  if (v20)
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease((id)v20);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "OSLogObject");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_opt_class();
        v24 = v23;
        -[AMSMescalFairPlay logKey](self, "logKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v30 = v23;
        v31 = 2114;
        v32 = v25;
        v33 = 2114;
        v34 = v20;
        _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to signing data. Error = %{public}@", buf, 0x20u);

      }
    }
  }

  return (id)context;
}

- (id)_dataWithFairPlayBytes:(const char *)a3 length:(unsigned int)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:deallocator:", a3, a4, &__block_literal_global_83);
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (AMSMescalFairPlay)initWithMescalType:(int64_t)a3 logKey:(id)a4 error:(id *)a5
{
  id v8;
  AMSMescalFairPlay *v9;
  AMSMescalFairPlay *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSString *logKey;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  AMSMescalFairPlay *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)AMSMescalFairPlay;
  v9 = -[AMSMescalFairPlay init](&v30, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_13;
  if (!AMSFairPlayGetHardwareInfo((uint64_t)&v9->_hardwareInfo))
  {
    AMSError(12, CFSTR("Mescal Failed"), CFSTR("Failed to fetch hardware info"), 0);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  cp2g1b9ro((uint64_t)&v10->_context, (uint64_t)&v10->_hardwareInfo);
  if (v11)
  {
    AMSErrorWithFormat(12, CFSTR("Mescal Failed"), CFSTR("SAPInit failed: %ld"), v12, v13, v14, v15, v16, v11);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v18 = (id)v17;
    goto LABEL_7;
  }
  v18 = 0;
LABEL_7:
  v10->_mescalType = a3;
  v19 = objc_msgSend(v8, "copy");
  logKey = v10->_logKey;
  v10->_logKey = (NSString *)v19;

  if (!v18)
  {
LABEL_13:
    v25 = v10;
    v18 = 0;
    goto LABEL_20;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    v24 = objc_opt_class();
    if (v8)
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: [%@] "), v24, v8);
    else
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@: "), v24, v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    AMSLogableError(v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v26;
    v33 = 2112;
    v34 = v27;
    _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@Init failed: %@", buf, 0x16u);

  }
  if (a5)
  {
    v18 = objc_retainAutorelease(v18);
    v25 = 0;
    *a5 = v18;
  }
  else
  {
    v25 = 0;
  }
LABEL_20:

  return v25;
}

- (void)dealloc
{
  FPSAPContextOpaque_ *context;
  objc_super v4;

  context = self->_context;
  if (context)
    IPaI1oem5iL((uint64_t)context);
  v4.receiver = self;
  v4.super_class = (Class)AMSMescalFairPlay;
  -[AMSMescalFairPlay dealloc](&v4, sel_dealloc);
}

- (id)primingSignatureForData:(id)a3 error:(id *)a4
{
  FPSAPContextOpaque_ *context;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  unsigned int v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v27 = 0;
  context = self->_context;
  v7 = objc_retainAutorelease(a3);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  jfkdDAjba3jd((uint64_t)context, 100, v8, v9, &v28, &v27);
  if (v10)
  {
    v11 = v10;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      -[AMSMescalFairPlay logKey](self, "logKey");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v14;
      v31 = 2114;
      v32 = v16;
      v33 = 2048;
      v34 = (id)v11;
      _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Could not SAP prime: %lu", buf, 0x20u);

    }
  }
  else
  {
    -[AMSMescalFairPlay _dataWithFairPlayBytes:length:](self, "_dataWithFairPlayBytes:length:", v28, v27);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v19 = (void *)v20;
      v18 = 0;
      goto LABEL_18;
    }
  }
  AMSError(0, CFSTR("FairPlay Mescal Failed"), CFSTR("An unknown error occurred priming data"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  if (!a4)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v21, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_opt_class();
      v24 = v23;
      -[AMSMescalFairPlay logKey](self, "logKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v23;
      v31 = 2114;
      v32 = v25;
      v33 = 2114;
      v34 = v18;
      _os_log_impl(&dword_18C849000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to prime data. Error = %{public}@", buf, 0x20u);

    }
    goto LABEL_17;
  }
  v18 = objc_retainAutorelease(v17);
  v19 = 0;
  *a4 = v18;
LABEL_18:

  return v19;
}

- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!self->_context)
  {
    AMSError(304, CFSTR("Mescal Failed"), CFSTR("No SAP context for prime verification"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v16;
      if (a4)
      {
        v18 = objc_retainAutorelease(v16);
        *a4 = v18;

      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v20, "OSLogObject");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_opt_class();
          v23 = v22;
          -[AMSMescalFairPlay logKey](self, "logKey");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543874;
          v27 = v22;
          v28 = 2114;
          v29 = v24;
          v30 = 2114;
          v31 = v17;
          _os_log_impl(&dword_18C849000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to verify primed signature. Error = %{public}@", (uint8_t *)&v26, 0x20u);

        }
      }
    }
    goto LABEL_17;
  }
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  gLg1CWr7p();
  if (v9)
  {
    v10 = v9;
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      -[AMSMescalFairPlay logKey](self, "logKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v13;
      v28 = 2048;
      v29 = v15;
      v30 = 2048;
      v31 = (void *)v10;
      _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%public}@] SAPExchange failed: %ld", (uint8_t *)&v26, 0x20u);

    }
    -[AMSMescalFairPlay _teardownSession](self, "_teardownSession");
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  v19 = 1;
LABEL_18:

  return v19;
}

- (BOOL)verifySignature:(id)a3 forData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!self->_context)
  {
    v19 = CFSTR("Mescal Failed");
    v20 = CFSTR("No SAP context for signature verification");
LABEL_12:
    v21 = 304;
    goto LABEL_13;
  }
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "mutableBytes");
  objc_msgSend(v11, "length");
  gLg1CWr7p();
  if (!v12)
  {
    v22 = 1;
    goto LABEL_23;
  }
  v13 = v12;
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    v17 = v16;
    -[AMSMescalFairPlay logKey](self, "logKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v16;
    v33 = 2114;
    v34 = v18;
    v35 = 2048;
    v36 = (void *)v13;
    _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] SAPExchange failed: %ld", (uint8_t *)&v31, 0x20u);

  }
  if (v13 != -42186)
  {
    v19 = CFSTR("Mescal Failed");
    v20 = CFSTR("Bad SAP signature verification");
    goto LABEL_12;
  }
  v19 = CFSTR("Bad Session");
  v20 = CFSTR("Bad SAP session for signature verification");
  v21 = 302;
LABEL_13:
  AMSError(v21, v19, v20, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if (a5)
    {
      *a5 = objc_retainAutorelease(v23);
    }
    else
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v25, "OSLogObject");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_opt_class();
        v28 = v27;
        -[AMSMescalFairPlay logKey](self, "logKey");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 138543874;
        v32 = v27;
        v33 = 2114;
        v34 = v29;
        v35 = 2114;
        v36 = v24;
        _os_log_impl(&dword_18C849000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to verifying signature. Error = %{public}@", (uint8_t *)&v31, 0x20u);

      }
    }

  }
  v22 = 0;
LABEL_23:

  return v22;
}

- (void)_teardownSession
{
  FPSAPContextOpaque_ *context;

  context = self->_context;
  if (context)
  {
    IPaI1oem5iL((uint64_t)context);
    self->_context = 0;
  }
  self->_complete = 0;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
}

@end
