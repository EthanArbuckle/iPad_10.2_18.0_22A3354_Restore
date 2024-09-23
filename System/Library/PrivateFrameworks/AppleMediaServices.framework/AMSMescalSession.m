@implementation AMSMescalSession

- (id)_cachedCertData
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[AMSMescalSession _cachedCertPath](self, "_cachedCertPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v26 = (id)objc_opt_class();
      v16 = v26;
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_INFO, "%{public}@: Failed to determine cache path", buf, 0xCu);

    }
    v6 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 0, &v24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    v8 = v7;
    if (!v6 || v7)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v9, "OSLogObject");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v17 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v26 = v17;
        v27 = 2114;
        v28 = v8;
        v18 = v17;
        _os_log_impl(&dword_18C849000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to find cert data. Error: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      +[AMSDefaults mescalCertExpiration](AMSDefaults, "mescalCertExpiration");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 && -[NSObject compare:](v10, "compare:", v9) != 1)
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
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v21 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v26 = v21;
          v22 = v21;
          _os_log_impl(&dword_18C849000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: Loaded cert data", buf, 0xCu);

        }
      }
      else
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v12, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v26 = v14;
          v15 = v14;
          _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Removing expired cert data cache", buf, 0xCu);

        }
        -[AMSMescalSession _cacheCertData:expiration:](self, "_cacheCertData:expiration:", 0, 0.0);

        v6 = 0;
      }
    }

LABEL_28:
    goto LABEL_29;
  }
  v6 = 0;
LABEL_29:

  return v6;
}

void __34__AMSMescalSession_defaultSession__block_invoke()
{
  AMSMescalSession *v0;
  void *v1;

  v0 = -[AMSMescalSession initWithType:]([AMSMescalSession alloc], "initWithType:", 1);
  v1 = (void *)qword_1ECEAD648;
  qword_1ECEAD648 = (uint64_t)v0;

}

- (AMSMescalSession)initWithType:(int64_t)a3
{
  AMSMescalSession *v4;
  AMSMescalFairplaySession *v5;
  uint64_t v6;
  uint64_t v7;
  AMSMescalFairplaySession *session;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AMSMescalSession;
  v4 = -[AMSMescalSession init](&v15, sel_init);
  if (v4)
  {
    objc_initWeak(&location, v4);
    v5 = [AMSMescalFairplaySession alloc];
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33__AMSMescalSession_initWithType___block_invoke;
    v12[3] = &unk_1E25431F0;
    objc_copyWeak(&v13, &location);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __33__AMSMescalSession_initWithType___block_invoke_4;
    v10[3] = &unk_1E2543218;
    objc_copyWeak(&v11, &location);
    v7 = -[AMSMescalFairplaySession initWithMescalType:cachedCertificateProvider:certificateCacher:](v5, "initWithMescalType:cachedCertificateProvider:certificateCacher:", a3, v12, v10);
    session = v4->_session;
    v4->_session = (AMSMescalFairplaySession *)v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (id)signData:(id)a3 bag:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  -[AMSMescalSession signData:bag:](self, "signData:bag:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultWithError:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (AMSMescalSession)sessionWithType:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    +[AMSMescalSession primeSession](AMSMescalSession, "primeSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    +[AMSMescalSession defaultSession](AMSMescalSession, "defaultSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (AMSMescalSession *)v3;
}

+ (id)defaultSession
{
  if (_MergedGlobals_126 != -1)
    dispatch_once(&_MergedGlobals_126, &__block_literal_global_84);
  return (id)qword_1ECEAD648;
}

- (id)_cachedCertPath
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0C99D20]);
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithObjects:", v4, CFSTR("com.apple.AppleMediaServices"), 0);

  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if ((objc_msgSend(v7, "fileExistsAtPath:", v6) & 1) != 0
    || (v8 = 0,
        objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0)))
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("sap-setup-cert.txt"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id __33__AMSMescalSession_initWithType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_cachedCertData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Attempted to get cached certificate from deallocated AMSMescalSession", (uint8_t *)&v7, 0xCu);
    }

    v3 = 0;
  }

  return v3;
}

void __33__AMSMescalSession_initWithType___block_invoke_4(uint64_t a1, void *a2, double a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_cacheCertData:expiration:", v5, a3);
  }
  else
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = objc_opt_class();
      _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Attempted to cache certificate in deallocated AMSMescalSession", (uint8_t *)&v10, 0xCu);
    }

  }
}

+ (id)primeSession
{
  if (qword_1ECEAD650 != -1)
    dispatch_once(&qword_1ECEAD650, &__block_literal_global_7_2);
  return (id)qword_1ECEAD658;
}

void __32__AMSMescalSession_primeSession__block_invoke()
{
  AMSMescalSession *v0;
  void *v1;

  v0 = -[AMSMescalSession initWithType:]([AMSMescalSession alloc], "initWithType:", 2);
  v1 = (void *)qword_1ECEAD658;
  qword_1ECEAD658 = (uint64_t)v0;

}

- (id)primeSignatureForData:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  AMSMutablePromise *v8;
  AMSMescalFairplaySession *session;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(AMSMutablePromise);
  session = self->_session;
  AMSLogKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v8, "completionHandlerAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMescalFairplaySession primeSignatureForData:bag:logKey:completionHandler:](session, "primeSignatureForData:bag:logKey:completionHandler:", v7, v6, v10, v11);

  return v8;
}

- (id)signData:(id)a3 bag:(id)a4
{
  id v6;
  id v7;
  AMSMutablePromise *v8;
  AMSMescalFairplaySession *session;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(AMSMutablePromise);
  session = self->_session;
  AMSLogKey();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSPromise completionHandlerAdapter](v8, "completionHandlerAdapter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMescalFairplaySession signData:bag:logKey:completionHandler:](session, "signData:bag:logKey:completionHandler:", v7, v6, v10, v11);

  return v8;
}

- (id)verifyData:(id)a3 withSignature:(id)a4 bag:(id)a5
{
  id v8;
  id v9;
  id v10;
  AMSMutableBinaryPromise *v11;
  AMSMescalFairplaySession *session;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(AMSMutableBinaryPromise);
  session = self->_session;
  AMSLogKey();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSBinaryPromise completionHandlerAdapter](v11, "completionHandlerAdapter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMescalFairplaySession verifyData:signature:bag:logKey:completionHandler:](session, "verifyData:signature:bag:logKey:completionHandler:", v10, v9, v8, v13, v14);

  return v11;
}

- (id)verifyPrimeSignature:(id)a3
{
  id v4;
  AMSMutableBinaryPromise *v5;
  AMSMescalFairplaySession *session;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(AMSMutableBinaryPromise);
  session = self->_session;
  -[AMSBinaryPromise completionHandlerAdapter](v5, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSMescalFairplaySession verifyPrimeSignature:completionHandler:](session, "verifyPrimeSignature:completionHandler:", v4, v7);

  return v5;
}

- (BOOL)_cacheCertData:(id)a3 expiration:(double)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint32_t v23;
  void *v24;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AMSMescalSession _cachedCertPath](self, "_cachedCertPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
      v29 = 0;
      v8 = objc_msgSend(v6, "writeToFile:options:error:", v7, 1, &v29);
      v9 = v29;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "dateByAddingTimeInterval:", a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSDefaults setMescalCertExpiration:](AMSDefaults, "setMescalCertExpiration:", v11);

        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        -[NSObject OSLogObject](v12, "OSLogObject");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          goto LABEL_29;
        v14 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v31 = v14;
        v32 = 2048;
        v33 = (uint64_t)a4;
        v15 = v14;
        v16 = "%{public}@: Saved mescal cert with expiration: %ld";
        v17 = v13;
        v18 = OS_LOG_TYPE_INFO;
        goto LABEL_22;
      }
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      -[NSObject OSLogObject](v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      v32 = 2114;
      v33 = (uint64_t)v9;
      v15 = v22;
      v16 = "%{public}@: Failed to cache mescal cert. Error: %{public}@";
LABEL_21:
      v17 = v13;
      v18 = OS_LOG_TYPE_ERROR;
LABEL_22:
      v23 = 22;
LABEL_28:
      _os_log_impl(&dword_18C849000, v17, v18, v16, buf, v23);

LABEL_29:
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    LOBYTE(v8) = objc_msgSend(v20, "removeItemAtPath:error:", v7, &v28);
    v9 = v28;

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v9, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqual:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        if (objc_msgSend(v9, "code") == 4)
        {

LABEL_32:
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
            v12 = objc_claimAutoreleasedReturnValue();
          }
          -[NSObject OSLogObject](v12, "OSLogObject");
          v13 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            goto LABEL_29;
          v27 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v31 = v27;
          v32 = 2114;
          v33 = (uint64_t)v9;
          v15 = v27;
          v16 = "%{public}@: Failed to remove existing mescal cert. Error: %{public}@";
          goto LABEL_21;
        }
        v26 = objc_msgSend(v9, "code");

        if (v26 == 260)
          goto LABEL_32;
      }
      else
      {

      }
    }
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = objc_claimAutoreleasedReturnValue();
    }
    -[NSObject OSLogObject](v12, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_29;
    v24 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v31 = v24;
    v15 = v24;
    v16 = "%{public}@: Removed mescal cert if there was one present.";
    v17 = v13;
    v18 = OS_LOG_TYPE_INFO;
    v23 = 12;
    goto LABEL_28;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v31 = (id)objc_opt_class();
    v19 = v31;
    _os_log_impl(&dword_18C849000, v12, OS_LOG_TYPE_INFO, "%{public}@: Failed to determine cache path", buf, 0xCu);

  }
  LOBYTE(v8) = 0;
LABEL_30:

  return v8;
}

- (id)primeSignatureForData:(id)a3 bag:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;

  -[AMSMescalSession primeSignatureForData:bag:](self, "primeSignatureForData:bag:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultWithError:", a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4
{
  void *v5;

  -[AMSMescalSession verifyPrimeSignature:](self, "verifyPrimeSignature:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v5, "resultWithError:", a4);

  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
