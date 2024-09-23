@implementation AMSKeepAlive

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!+[AMSKeepAlive _isRBSAssertionsEnabled](AMSKeepAlive, "_isRBSAssertionsEnabled"))
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "OSLogObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_opt_class();
      AMSLogKey();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_18C849000, v4, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Releasing", buf, 0x16u);

    }
    -[AMSKeepAlive invalidate](self, "invalidate");
  }
  v7.receiver = self;
  v7.super_class = (Class)AMSKeepAlive;
  -[AMSKeepAlive dealloc](&v7, sel_dealloc);
}

+ (BOOL)_isRBSAssertionsEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)rbs_keepAliveWithName:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[AMSKeepAlive initRBSWithName:]([AMSKeepAlive alloc], "initRBSWithName:", v3);

  return v4;
}

- (id)initRBSWithName:(id)a3 style:(int64_t)a4
{
  id v6;
  AMSKeepAlive *v7;
  uint64_t v8;
  AMSRBSKeepAlive *rbsKeepAlive;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSKeepAlive;
  v7 = -[AMSKeepAlive init](&v11, sel_init);
  if (v7)
  {
    +[AMSRBSKeepAlive keepAliveWithName:style:](AMSRBSKeepAlive, "keepAliveWithName:style:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    rbsKeepAlive = v7->_rbsKeepAlive;
    v7->_rbsKeepAlive = (AMSRBSKeepAlive *)v8;

  }
  return v7;
}

- (id)initRBSWithName:(id)a3
{
  return -[AMSKeepAlive initRBSWithName:style:](self, "initRBSWithName:style:", a3, 0);
}

- (void)rbs_invalidate
{
  -[AMSRBSKeepAlive invalidate](self->_rbsKeepAlive, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_rbsKeepAlive, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

+ (id)keepAliveWithName:(id)a3
{
  id v3;
  AMSKeepAlive *v4;

  v3 = a3;
  v4 = -[AMSKeepAlive initWithName:]([AMSKeepAlive alloc], "initWithName:", v3);

  return v4;
}

- (void)invalidate
{
  if (+[AMSKeepAlive _isRBSAssertionsEnabled](AMSKeepAlive, "_isRBSAssertionsEnabled"))
  {
    -[AMSRBSKeepAlive invalidate](self->_rbsKeepAlive, "invalidate");
  }
  else
  {
    -[AMSKeepAlive _removeProcessAssertion](self, "_removeProcessAssertion");
    -[AMSKeepAlive _removeOSTransaction](self, "_removeOSTransaction");
  }
}

+ (id)keepAliveWithName:(id)a3 style:(int64_t)a4
{
  id v5;
  AMSKeepAlive *v6;

  v5 = a3;
  v6 = -[AMSKeepAlive initWithName:style:]([AMSKeepAlive alloc], "initWithName:style:", v5, a4);

  return v6;
}

- (AMSKeepAlive)initWithName:(id)a3 style:(int64_t)a4
{
  id v7;
  AMSKeepAlive *v8;
  uint64_t v9;
  AMSRBSKeepAlive *rbsKeepAlive;
  int64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSString *logKey;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSKeepAlive;
  v8 = -[AMSKeepAlive init](&v19, sel_init);
  if (v8)
  {
    if (+[AMSKeepAlive _isRBSAssertionsEnabled](AMSKeepAlive, "_isRBSAssertionsEnabled"))
    {
      +[AMSRBSKeepAlive keepAliveWithName:style:](AMSRBSKeepAlive, "keepAliveWithName:style:", v7, a4);
      v9 = objc_claimAutoreleasedReturnValue();
      rbsKeepAlive = v8->_rbsKeepAlive;
      v8->_rbsKeepAlive = (AMSRBSKeepAlive *)v9;

    }
    else
    {
      if (a4)
        v11 = a4;
      else
        v11 = 2;
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "OSLogObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = objc_opt_class();
        AMSLogKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v21 = v14;
        v22 = 2114;
        v23 = v15;
        v24 = 2114;
        v25 = v7;
        v26 = 2048;
        v27 = v11;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Starting keep alive with assertion: %{public}@-%ld", buf, 0x2Au);

      }
      AMSLogKey();
      v16 = objc_claimAutoreleasedReturnValue();
      logKey = v8->_logKey;
      v8->_logKey = (NSString *)v16;

      objc_storeStrong((id *)&v8->_name, a3);
      v8->_style = v11;
      -[AMSKeepAlive _takeOSTransaction](v8, "_takeOSTransaction");
      -[AMSKeepAlive _takeProcessAssertion](v8, "_takeProcessAssertion");
      -[AMSKeepAlive _startLogTimer](v8, "_startLogTimer");
    }
  }

  return v8;
}

- (AMSKeepAlive)initWithName:(id)a3
{
  return -[AMSKeepAlive initWithName:style:](self, "initWithName:style:", a3, 0);
}

+ (id)keepAliveWithFormat:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  AMSKeepAlive *v6;
  uint64_t v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:locale:arguments:", v4, 0, &v8);

  v6 = -[AMSKeepAlive initWithName:]([AMSKeepAlive alloc], "initWithName:", v5);
  return v6;
}

+ (void)keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5
{
  void (**v7)(_QWORD);
  id v8;

  v7 = (void (**)(_QWORD))a5;
  +[AMSKeepAlive keepAliveWithName:style:](AMSKeepAlive, "keepAliveWithName:style:", a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7[2](v7);

  objc_msgSend(v8, "invalidate");
}

+ (id)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = -[AMSKeepAlive initRBSWithName:style:]([AMSKeepAlive alloc], "initRBSWithName:style:", v5, a4);

  return v6;
}

+ (void)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4 block:(id)a5
{
  +[AMSRBSKeepAlive keepAliveWithName:style:block:](AMSRBSKeepAlive, "keepAliveWithName:style:block:", a3, a4, a5);
}

+ (void)rbs_keepAliveWithName:(id)a3 style:(int64_t)a4 qosOverrideIfRBManaged:(unsigned int)a5 relativePriority:(int64_t)a6 block:(id)a7
{
  +[AMSRBSKeepAlive keepAliveWithName:style:qosOverrideIfRBManaged:relativePriority:block:](AMSRBSKeepAlive, "keepAliveWithName:style:qosOverrideIfRBManaged:relativePriority:block:", a3, a4, *(_QWORD *)&a5, a6, a7);
}

+ (void)_accessAssertionCache:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, id);
  _QWORD block[4];
  id v15;
  id v16;

  v3 = (void (**)(id, id))a3;
  if (qword_1ECEAD2A8 != -1)
    dispatch_once(&qword_1ECEAD2A8, &__block_literal_global_66);
  if (qword_1ECEAD2B0 != -1)
    dispatch_once(&qword_1ECEAD2B0, &__block_literal_global_16_0);
  v4 = (id)qword_1ECEAD2B8;
  if (dispatch_get_specific((const void *)_accessAssertionCache__queueMarker))
  {
    v3[2](v3, v4);
  }
  else
  {
    v5 = (void *)_MergedGlobals_114;
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __38__AMSKeepAlive__accessAssertionCache___block_invoke_3;
    v11[3] = &unk_1E253E978;
    v13 = v3;
    v12 = v4;
    v7 = v11;
    v8 = v5;
    AMSLogKey();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __AMSDispatchSync_block_invoke_0;
    block[3] = &unk_1E253DC28;
    v15 = v9;
    v16 = v7;
    v10 = v9;
    dispatch_sync(v8, block);

  }
}

void __38__AMSKeepAlive__accessAssertionCache___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.AMSKeepAlive.assertions", 0);
  v1 = (void *)_MergedGlobals_114;
  _MergedGlobals_114 = (uint64_t)v0;

  dispatch_queue_set_specific((dispatch_queue_t)_MergedGlobals_114, (const void *)_accessAssertionCache__queueMarker, (void *)_MergedGlobals_114, 0);
}

void __38__AMSKeepAlive__accessAssertionCache___block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECEAD2B8;
  qword_1ECEAD2B8 = (uint64_t)v0;

}

uint64_t __38__AMSKeepAlive__accessAssertionCache___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_assertionName
{
  void *v2;
  NSString *logKey;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  logKey = self->_logKey;
  -[AMSKeepAlive _cacheKey](self, "_cacheKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("AMSKeepAlive[%@]:%@"), logKey, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_cacheKey
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AMSKeepAlive name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%ld"), v4, -[AMSKeepAlive style](self, "style"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)_handleAssertionExpiration
{
  objc_msgSend(a1, "_accessAssertionCache:", &__block_literal_global_23_0);
}

void __42__AMSKeepAlive__handleAssertionExpiration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v2, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "valid"))
          objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "removeAllObjects");
}

- (void)_removeOSTransaction
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD *v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  OS_os_transaction *transaction;
  _QWORD v11[5];
  _QWORD v12[5];
  OS_os_transaction *v13;
  _QWORD block[4];
  id v15;
  id v16;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__38;
  v12[4] = __Block_byref_object_dispose__38;
  v13 = self->_transaction;
  if (v13)
  {
    dispatch_get_global_queue(0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __36__AMSKeepAlive__removeOSTransaction__block_invoke;
    v11[3] = &unk_1E253DDB8;
    v11[4] = v12;
    v5 = v3;
    v6 = v11;
    AMSLogKey();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, 500000000);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __AMSDispatchAfter_block_invoke_2;
    block[3] = &unk_1E253DC28;
    v15 = v7;
    v16 = v6;
    v9 = v7;
    dispatch_after(v8, v5, block);

  }
  transaction = self->_transaction;
  self->_transaction = 0;

  _Block_object_dispose(v12, 8);
}

void __36__AMSKeepAlive__removeOSTransaction__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)_removeProcessAssertion
{
  NSString *v3;
  void *v4;
  NSString *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  NSString *v9;

  v3 = self->_logKey;
  -[AMSKeepAlive _cacheKey](self, "_cacheKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__AMSKeepAlive__removeProcessAssertion__block_invoke;
  v7[3] = &unk_1E2541A08;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  +[AMSKeepAlive _accessAssertionCache:](AMSKeepAlive, "_accessAssertionCache:", v7);

}

void __39__AMSKeepAlive__removeProcessAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setAms_assertionCount:", objc_msgSend(v4, "ams_assertionCount") - 1);
    if (!objc_msgSend(v5, "ams_assertionCount"))
    {
      if (objc_msgSend(v5, "valid"))
        objc_msgSend(v5, "invalidate");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "OSLogObject");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = objc_opt_class();
        v9 = *(_QWORD *)(a1 + 40);
        v10 = 138543618;
        v11 = v8;
        v12 = 2114;
        v13 = v9;
        _os_log_impl(&dword_18C849000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Assertion released", (uint8_t *)&v10, 0x16u);
      }

    }
  }

}

- (void)_startLogTimer
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id location;
  _QWORD block[4];
  id v13;
  id v14;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__AMSKeepAlive__startLogTimer__block_invoke;
  v9[3] = &unk_1E253E9A0;
  objc_copyWeak(&v10, &location);
  v4 = v2;
  v5 = v9;
  AMSLogKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0, 30000000000);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __AMSDispatchAfter_block_invoke_2;
  block[3] = &unk_1E253DC28;
  v13 = v6;
  v14 = v5;
  v8 = v6;
  dispatch_after(v7, v4, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __30__AMSKeepAlive__startLogTimer__block_invoke(uint64_t a1)
{
  _QWORD v1[4];
  id v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __30__AMSKeepAlive__startLogTimer__block_invoke_2;
  v1[3] = &unk_1E2542678;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[AMSKeepAlive _accessAssertionCache:](AMSKeepAlive, "_accessAssertionCache:", v1);
  objc_destroyWeak(&v2);
}

void __30__AMSKeepAlive__startLogTimer__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_cacheKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = v5[1];
    if (v7 | v8)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "OSLogObject");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_opt_class();
        v12 = v5[2];
        v13 = 138544130;
        v14 = v11;
        v15 = 2114;
        v16 = v12;
        v17 = 1024;
        v18 = v7 != 0;
        v19 = 1024;
        v20 = v8 != 0;
        _os_log_impl(&dword_18C849000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Still alive. (a: %d, t: %d)", (uint8_t *)&v13, 0x22u);
      }

      objc_msgSend(v5, "_startLogTimer");
    }

  }
}

- (void)_takeOSTransaction
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  id v5;

  -[AMSKeepAlive _assertionName](self, "_assertionName");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "UTF8String");
  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

}

- (void)_takeProcessAssertion
{
  _QWORD v3[5];

  if (+[AMSEphemeralDefaults processAssertionsEnabled](AMSEphemeralDefaults, "processAssertionsEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __37__AMSKeepAlive__takeProcessAssertion__block_invoke;
    v3[3] = &unk_1E25426C0;
    v3[4] = self;
    +[AMSKeepAlive _accessAssertionCache:](AMSKeepAlive, "_accessAssertionCache:", v3);
  }
}

void __37__AMSKeepAlive__takeProcessAssertion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AMSBKSProcessAssertion *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_cacheKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_assertionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (AMSBKSProcessAssertion *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "style");
    if (v7 == 2)
    {
      v8 = 7;
    }
    else
    {
      if (v7 != 1)
      {
        v6 = 0;
        goto LABEL_19;
      }
      v8 = 3;
    }
    if (+[AMSProcessInfo BOOLForEntitlement:](AMSProcessInfo, "BOOLForEntitlement:", CFSTR("com.apple.multitasking.systemappassertions")))
    {
      v9 = 10004;
    }
    else
    {
      v9 = 4;
    }
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v6 = -[BKSProcessAssertion initWithPID:flags:reason:name:]([AMSBKSProcessAssertion alloc], "initWithPID:flags:reason:name:", getpid(), v8, v9, v5);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __37__AMSKeepAlive__takeProcessAssertion__block_invoke_2;
    v15[3] = &unk_1E253DBD8;
    v11 = v10;
    v16 = v11;
    -[BKSAssertion setInvalidationHandler:](v6, "setInvalidationHandler:", v15);
    if (kUnboundedAssertionEntitlement_block_invoke_onceToken != -1)
      dispatch_once(&kUnboundedAssertionEntitlement_block_invoke_onceToken, &__block_literal_global_28);
    if (!-[BKSProcessAssertion acquire](v6, "acquire"))
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
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v18 = v14;
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_18C849000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to acquire assertion", buf, 0x16u);
      }

    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v4);

  }
LABEL_19:
  -[AMSBKSProcessAssertion setAms_assertionCount:](v6, "setAms_assertionCount:", -[AMSBKSProcessAssertion ams_assertionCount](v6, "ams_assertionCount") + 1);

}

void __37__AMSKeepAlive__takeProcessAssertion__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_18C849000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Assertion invalidated", (uint8_t *)&v6, 0x16u);
  }

}

void __37__AMSKeepAlive__takeProcessAssertion__block_invoke_27()
{
  id v0;

  dispatch_get_global_queue(0, 0);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  BKSProcessAssertionSetExpirationHandler();

}

uint64_t __37__AMSKeepAlive__takeProcessAssertion__block_invoke_2_29()
{
  void *v0;
  NSObject *v1;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v0)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v0, "OSLogObject");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = objc_opt_class();
    _os_log_impl(&dword_18C849000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Assertion expiration notice received", (uint8_t *)&v3, 0xCu);
  }

  return +[AMSKeepAlive _handleAssertionExpiration](AMSKeepAlive, "_handleAssertionExpiration");
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)style
{
  return self->_style;
}

@end
