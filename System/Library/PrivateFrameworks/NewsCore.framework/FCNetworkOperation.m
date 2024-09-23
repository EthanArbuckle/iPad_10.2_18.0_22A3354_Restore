@implementation FCNetworkOperation

- (FCNetworkOperation)initWithNetworkReachability:(id)a3
{
  id v5;
  FCNetworkOperation *v6;
  FCNetworkOperation *v7;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "networkReachability");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCNetworkOperation initWithNetworkReachability:]";
    v13 = 2080;
    v14 = "FCNetworkOperation.m";
    v15 = 1024;
    v16 = 37;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10.receiver = self;
  v10.super_class = (Class)FCNetworkOperation;
  v6 = -[FCOperation init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_networkReachability, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkReachability, 0);
}

- (BOOL)validateOperationError:(id *)a3
{
  void *v5;
  BOOL v6;
  id v7;
  uint64_t v9;

  -[FCNetworkOperation networkReachability](self, "networkReachability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = -[FCNetworkOperation areNetworkRequirementsSatisfiedWithReachability:offlineReason:](self, "areNetworkRequirementsSatisfiedWithReachability:offlineReason:", v5, &v9);
  v7 = 0;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "fc_offlineErrorWithReason:", v9);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  *a3 = v7;

  return v6;
}

- (void)prepareOperation
{
  id v3;

  -[FCNetworkOperation networkReachability](self, "networkReachability");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (FCNetworkReachabilityType)networkReachability
{
  return self->_networkReachability;
}

- (FCNetworkOperation)init
{
  void *v3;
  FCNetworkOperation *v4;

  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCNetworkOperation initWithNetworkReachability:](self, "initWithNetworkReachability:", v3);

  return v4;
}

- (double)preferredTimeoutIntervalForRequest
{
  unint64_t v2;
  double result;

  v2 = -[FCOperation retryCount](self, "retryCount");
  result = 15.0;
  if (!v2)
    return 5.0;
  return result;
}

- (unint64_t)maxRetries
{
  return 1;
}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  void *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = a3;
  v7 = *MEMORY[0x1E0CB3388];
  v8 = *MEMORY[0x1E0C947D8];
  v9 = (const __CFString *)*MEMORY[0x1E0C94808];
  v33 = *MEMORY[0x1E0CB28A8];
  v31 = v6;
  v32 = *MEMORY[0x1E0CB32E8];
  while (1)
  {
    v10 = v6;
    v11 = v10;
    if (!self || (objc_msgSend(v10, "fc_isServiceUnavailableError", v31) & 1) != 0)
    {
LABEL_4:

      goto LABEL_27;
    }
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v8) & 1) != 0)
    {
      objc_msgSend(v11, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v11, "userInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = v9;
        goto LABEL_12;
      }
    }
    else
    {

    }
    objc_msgSend(v11, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", CFSTR("FCErrorDomain")) & 1) != 0)
      break;

LABEL_15:
    objc_msgSend(v11, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", v33))
    {
      v26 = objc_msgSend(v11, "code");

      if (v26 == 4097)
        goto LABEL_21;
    }
    else
    {

    }
    objc_msgSend(v11, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", v32);

    if (!v28 || (objc_msgSend(v11, "code") | 4) != 0xFFFFFFFFFFFFFC17)
      goto LABEL_4;
LABEL_21:
    v24 = 1;
    v23 = 1.0;
    if (a4)
      goto LABEL_25;
LABEL_26:

    if ((v24 & 1) != 0)
      goto LABEL_30;
LABEL_27:
    objc_msgSend(v11, "userInfo", v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v7);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v11 = 0;
      goto LABEL_31;
    }
  }
  objc_msgSend(v11, "userInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("FCErrorRetryAfter"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_15;
  objc_msgSend(v11, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = CFSTR("FCErrorRetryAfter");
LABEL_12:
  objc_msgSend(v15, "objectForKeyedSubscript:", v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v21, "doubleValue");
    v23 = v22;
    v24 = 1;
  }
  else
  {
    v24 = 0;
    v23 = 0.0;
  }

  if (!a4)
    goto LABEL_26;
LABEL_25:
  if (!v24)
    goto LABEL_26;
  *a4 = -[FCOperationDelayedRetrySignal initWithDelay:]([FCOperationDelayedRetrySignal alloc], "initWithDelay:", v23);

LABEL_30:
  LOBYTE(v6) = 1;
LABEL_31:

  return (char)v6;
}

- (BOOL)areNetworkRequirementsSatisfiedWithReachability:(id)a3 offlineReason:(int64_t *)a4
{
  id v5;
  char v6;

  v5 = a3;
  v6 = objc_msgSend(v5, "isNetworkReachable");
  if ((v6 & 1) == 0)
    *a4 = objc_msgSend(v5, "offlineReason");

  return v6;
}

- (BOOL)shouldStartThrottlingWithError:(id)a3 retryAfter:(double *)a4
{
  id v6;
  void *v7;
  double v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __CFString **v14;
  void *v15;
  int v16;
  void *v17;
  double v18;

  v6 = a3;
  -[FCOperation throttleGroup](self, "throttleGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  if (!v7)
  {
LABEL_10:
    if (!a4)
      goto LABEL_12;
LABEL_11:
    *a4 = fmin(v8, 43200.0);
    goto LABEL_12;
  }
  v9 = objc_msgSend(v6, "fc_isServiceUnavailableError");

  if (!v9)
    goto LABEL_9;
  objc_msgSend(v6, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("FCErrorDomain"));

  if (v11)
  {
    objc_msgSend(v6, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = FCErrorRetryAfterKey;
    goto LABEL_7;
  }
  objc_msgSend(v6, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if (!v16)
  {
LABEL_9:
    LOBYTE(v7) = 0;
    goto LABEL_10;
  }
  objc_msgSend(v6, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = (__CFString **)MEMORY[0x1E0C94808];
LABEL_7:
  objc_msgSend(v12, "objectForKeyedSubscript:", *v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "doubleValue");
    v8 = v18;
    LOBYTE(v7) = 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  if (a4)
    goto LABEL_11;
LABEL_12:

  return (char)v7;
}

- (void)networkReachabilityDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FCOperation hasOperationStarted](self, "hasOperationStarted"))
  {
    v8 = 0;
    if (!-[FCNetworkOperation areNetworkRequirementsSatisfiedWithReachability:offlineReason:](self, "areNetworkRequirementsSatisfiedWithReachability:offlineReason:", v4, &v8))
    {
      v5 = (void *)FCOperationLog;
      if (os_log_type_enabled((os_log_t)FCOperationLog, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v5;
        -[FCOperation shortOperationDescription](self, "shortOperationDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v10 = v7;
        v11 = 2048;
        v12 = v8;
        _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "cancelling %{public}@ due to failure to satisfy network requirements with offline reason %ld", buf, 0x16u);

      }
      -[FCOperation cancel](self, "cancel");
    }
  }

}

@end
