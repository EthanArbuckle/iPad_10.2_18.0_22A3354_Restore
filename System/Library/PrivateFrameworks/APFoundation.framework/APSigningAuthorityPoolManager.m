@implementation APSigningAuthorityPoolManager

- (int64_t)state
{
  return self->_state;
}

- (APSigningAuthority)currentSigningAuthority
{
  return self->_currentSigningAuthority;
}

- (APSigningAuthorityPoolManager)initWithName:(id)a3 poolSize:(unint64_t)a4 numberToStash:(unint64_t)a5 setupCompletion:(id)a6
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  APSigningAuthorityPoolManager *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *signingAuthorityPool;
  APUnfairRecursiveLock *v36;
  APUnfairRecursiveLock *lock;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  APSigningAuthorityPoolManager *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v58[4];
  APSigningAuthorityPoolManager *v59;
  id v60;
  objc_super v61;
  uint8_t buf[4];
  const __CFString *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if ((objc_msgSend_isAllowedClient(APSigningClientValidator, v13, v14, v15) & 1) != 0)
  {
    v61.receiver = self;
    v61.super_class = (Class)APSigningAuthorityPoolManager;
    v16 = -[APSigningAuthorityPoolManager init](&v61, sel_init);
    if (v16)
    {
      v16->_lastStateChangeTime = CFAbsoluteTimeGetCurrent();
      objc_msgSend__evaluateRotationEntitlement(v16, v17, v18, v19);
      objc_msgSend_setPoolSize_(v16, v20, a4, v21);
      v25 = objc_msgSend_poolSize(v16, v22, v23, v24);
      if (v25 >= a5)
        v26 = a5;
      else
        v26 = v25;
      v16->_numberToStash = v26;
      objc_storeStrong((id *)&v16->_name, a3);
      v27 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v31 = objc_msgSend_poolSize(v16, v28, v29, v30);
      v34 = objc_msgSend_initWithCapacity_(v27, v32, v31, v33);
      signingAuthorityPool = v16->_signingAuthorityPool;
      v16->_signingAuthorityPool = (NSMutableArray *)v34;

      v36 = objc_alloc_init(APUnfairRecursiveLock);
      lock = v16->_lock;
      v16->_lock = v36;

      objc_msgSend__clearStashedContextsIfIndicated(v16, v38, v39, v40);
      v41 = dispatch_queue_create("com.apple.ap.signingAuthorityPoolManager.setup", 0);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = sub_1CF277D80;
      v58[3] = &unk_1E8C484C8;
      v59 = v16;
      v60 = v12;
      dispatch_async(v41, v58);

    }
    else
    {
      APLogForCategory(0x2AuLL);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CF251000, v50, OS_LOG_TYPE_ERROR, "Unable to create pool manager, super class initialization failed.", buf, 2u);
      }

      objc_msgSend_setState_(0, v51, 18002, v52);
      if (v12)
      {
        v56 = objc_msgSend_state(0, v53, v54, v55);
        (*((void (**)(id, uint64_t))v12 + 2))(v12, v56);
      }
    }
    self = v16;
    v49 = self;
  }
  else
  {
    APLogForCategory(0x2AuLL);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v63 = CFSTR("Unable to create pool manager, not a valid client.");
      _os_log_impl(&dword_1CF251000, v42, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    APSimulateCrash((const char *)5, CFSTR("Unable to create pool manager, not a valid client."), 0);
    objc_msgSend_setState_(self, v43, 18002, v44);
    if (v12)
    {
      v48 = objc_msgSend_state(self, v45, v46, v47);
      (*((void (**)(id, uint64_t))v12 + 2))(v12, v48);
    }
    v49 = 0;
  }

  return v49;
}

- (APSigningAuthorityPoolManager)initWithName:(id)a3 poolSize:(unint64_t)a4 numberToStash:(unint64_t)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  APSigningAuthorityPoolManager *v13;
  APSigningAuthorityPoolManager *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *signingAuthorityPool;
  APUnfairRecursiveLock *v34;
  APUnfairRecursiveLock *lock;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  objc_super v41;
  uint8_t buf[4];
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((objc_msgSend_isAllowedClient(APSigningClientValidator, v10, v11, v12) & 1) == 0)
  {
    APLogForCategory(0x2AuLL);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v43 = CFSTR("Unable to create pool manager, not a valid client.");
      _os_log_impl(&dword_1CF251000, v39, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    APSimulateCrash((const char *)5, CFSTR("Unable to create pool manager, not a valid client."), 0);
    goto LABEL_10;
  }
  v41.receiver = self;
  v41.super_class = (Class)APSigningAuthorityPoolManager;
  v13 = -[APSigningAuthorityPoolManager init](&v41, sel_init);
  if (!v13)
  {
    APLogForCategory(0x2AuLL);
    self = (APSigningAuthorityPoolManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF251000, &self->super, OS_LOG_TYPE_ERROR, "Unable to create pool manager, super class initialization failed.", buf, 2u);
    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  v14 = v13;
  v13->_lastStateChangeTime = CFAbsoluteTimeGetCurrent();
  objc_msgSend__evaluateRotationEntitlement(v14, v15, v16, v17);
  objc_msgSend_setPoolSize_(v14, v18, a4, v19);
  v23 = objc_msgSend_poolSize(v14, v20, v21, v22);
  if (v23 >= a5)
    v24 = a5;
  else
    v24 = v23;
  v14->_numberToStash = v24;
  objc_storeStrong((id *)&v14->_name, a3);
  v25 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v29 = objc_msgSend_poolSize(v14, v26, v27, v28);
  v32 = objc_msgSend_initWithCapacity_(v25, v30, v29, v31);
  signingAuthorityPool = v14->_signingAuthorityPool;
  v14->_signingAuthorityPool = (NSMutableArray *)v32;

  v34 = objc_alloc_init(APUnfairRecursiveLock);
  lock = v14->_lock;
  v14->_lock = v34;

  v14->_state = 18004;
  objc_msgSend__clearStashedContextsIfIndicated(v14, v36, v37, v38);
LABEL_11:

  return v14;
}

- (void)setupWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  APUnfairLock *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  dispatch_time_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD block[5];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;

  v6 = a4;
  objc_msgSend_setState_(self, v7, 18000, v8);
  v9 = [APUnfairLock alloc];
  v12 = (void *)objc_msgSend_initWithOptions_(v9, v10, 1, v11);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 0;
  v13 = dispatch_queue_create("com.apple.ap.signingAuthorityPoolManager.setupWatchDog", 0);
  v14 = dispatch_queue_create("com.apple.ap.signingAuthorityPoolManager.setup", 0);
  v15 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CF27813C;
  block[3] = &unk_1E8C48518;
  block[4] = self;
  v16 = v12;
  v26 = v16;
  v28 = v29;
  v17 = v6;
  v27 = v17;
  dispatch_async(v14, block);
  v18 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = sub_1CF278234;
  v21[3] = &unk_1E8C48540;
  v23 = v17;
  v24 = v29;
  v22 = v16;
  v19 = v17;
  v20 = v16;
  dispatch_after(v18, v13, v21);

  _Block_object_dispose(v29, 8);
}

- (void)setupWithCompletion:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend_setState_(self, v5, 18000, v6);
  APLogForCategory(0x2AuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1CF251000, v7, OS_LOG_TYPE_INFO, "Pool manager is being setup", v13, 2u);
  }

  objc_msgSend_setSetupCompletion_(self, v8, (uint64_t)v4, v9);
  objc_msgSend__refillSigningAuthorityPool(self, v10, v11, v12);
}

- (void)setState:(int64_t)a3
{
  double Current;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  APSigningAuthorityPoolManager *v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  APLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend_state(self, v7, v8, v9);
    if ((unint64_t)(v10 - 18001) > 4)
      v14 = CFSTR("setup started");
    else
      v14 = off_1E8C485D8[v10 - 18001];
    if ((unint64_t)(a3 - 18001) > 4)
      v15 = CFSTR("setup started");
    else
      v15 = off_1E8C485D8[a3 - 18001];
    objc_msgSend_lastStateChangeTime(self, v11, v12, v13);
    v17 = Current - v16;
    v18 = CFAbsoluteTimeGetCurrent();
    objc_msgSend_refillStartTime(self, v19, v20, v21);
    v27 = 134219010;
    v28 = self;
    v29 = 2112;
    v30 = (int64_t)v14;
    v31 = 2112;
    v32 = v15;
    v33 = 2048;
    v34 = v17;
    v35 = 2048;
    v36 = v18 - v22;
    _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_INFO, "Signing pool manager %p state %@ -> %@ (%.6f) (%.6f)", (uint8_t *)&v27, 0x34u);
  }

  objc_msgSend_setLastStateChangeTime_(self, v23, v24, v25, Current);
  APLogForCategory(0x2AuLL);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = 134218240;
    v28 = self;
    v29 = 2050;
    v30 = a3;
    _os_log_impl(&dword_1CF251000, v26, OS_LOG_TYPE_INFO, "Pool manager %p state changed to %{public}ld", (uint8_t *)&v27, 0x16u);
  }

  self->_state = a3;
}

- (void)setPoolSize:(unint64_t)a3
{
  NSObject *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 >= 5)
  {
    APLogForCategory(0x2AuLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543362;
      v6 = CFSTR("Requested pool size is greater than max allowed pool size, setting poolSize to max pool size.");
      _os_log_impl(&dword_1CF251000, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
    }

    a3 = 4;
  }
  self->_poolSize = a3;
}

- (void)_evaluateRotationEntitlement
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  uint8_t v5[16];

  if (qword_1ED2BBE68 == -1)
  {
    APLogForCategory(0x2AuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CF251000, v2, OS_LOG_TYPE_INFO, "Setting the signing entitlement value.", v5, 2u);
    }

    qword_1ED2BBE68 = objc_msgSend_hasEntitlement_(APSigningClientValidator, v3, (uint64_t)CFSTR("com.apple.ap.promotedcontent.signing.client"), v4);
  }
}

- (void)setCurrentSigningAuthority:(id)a3
{
  APSigningAuthority *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  APSigningAuthorityPoolManager *v22;
  __int16 v23;
  APSigningAuthority *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (APSigningAuthority *)a3;
  APLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v21 = 134218240;
    v22 = self;
    v23 = 2048;
    v24 = v5;
    _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_INFO, "Pool manager %p setting current authority %p", (uint8_t *)&v21, 0x16u);
  }

  if (self->_currentSigningAuthority != v5)
  {
    objc_msgSend_lock(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v10, v11, v12, v13);

    objc_storeStrong((id *)&self->_currentSigningAuthority, a3);
    objc_msgSend_lock(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unlock(v17, v18, v19, v20);

  }
}

- (void)_refillSigningAuthorityPool
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CFAbsoluteTime Current;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  APSigningAuthority *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v66;
  APSigningAuthorityPoolManager *v67;
  NSObject *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t v73[128];
  uint8_t buf[4];
  APSigningAuthorityPoolManager *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_state(self, a2, v2, v3) == 18002)
  {
    APLogForCategory(0x2AuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v75 = self;
      _os_log_impl(&dword_1CF251000, v8, OS_LOG_TYPE_INFO, "Pool manager %p is in a permanent failure state. Cannot refill.", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend_lock(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lock(v9, v10, v11, v12);

    APLogForCategory(0x2AuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v75 = self;
      _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_INFO, "Pool manager %p refilling", buf, 0xCu);
    }

    if (objc_msgSend__numSigningAuthoritiesToCreate(self, v14, v15, v16))
    {
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend_setRefillStartTime_(self, v18, v19, v20, Current);
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend_signingAuthorityPool(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v69, (uint64_t)v73, 16);
      if (v26)
      {
        v30 = v26;
        v31 = 0;
        v32 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v70 != v32)
              objc_enumerationMutation(v24);
            v31 += objc_msgSend_usingStashedContext(*(void **)(*((_QWORD *)&v69 + 1) + 8 * i), v27, v28, v29);
          }
          v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v69, (uint64_t)v73, 16);
        }
        while (v30);
      }
      else
      {
        v31 = 0;
      }

      v44 = objc_msgSend_numberToStash(self, v41, v42, v43);
      v45 = [APSigningAuthority alloc];
      objc_msgSend_name(self, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend_initWithPoolName_(v45, v50, (uint64_t)v49, v51);

      if (v8 && objc_msgSend_state(v8, v52, v53, v54) != 7203)
      {
        v63 = MEMORY[0x1E0C809B0];
        v64 = 3221225472;
        v65 = sub_1CF278AB4;
        v66 = &unk_1E8C48568;
        v67 = self;
        v68 = v8;
        objc_msgSend_setupWithCompletion_completion_(v68, v58, v44 != v31, (uint64_t)&v63);

      }
      else
      {
        objc_msgSend_setState_(self, v52, 18002, v54);
      }
      objc_msgSend_lock(self, v55, v56, v57, v63, v64, v65, v66, v67);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unlock(v59, v60, v61, v62);

    }
    else
    {
      APLogForCategory(0x2AuLL);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v75 = self;
        _os_log_impl(&dword_1CF251000, v34, OS_LOG_TYPE_INFO, "No need to refill signing authority pool %p, it's full.", buf, 0xCu);
      }

      objc_msgSend_lock(self, v35, v36, v37);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_unlock(v8, v38, v39, v40);
    }
  }

}

- (void)_handleCompletedSigningAuthority:(id)a3
{
  id v4;
  NSObject *v5;
  double Current;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  APSigningAuthoritySettings *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  APSigningAuthorityPoolManager *v103;
  __int16 v104;
  id v105;
  __int16 v106;
  double v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  APLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend_refillStartTime(self, v7, v8, v9);
    v102 = 134218498;
    v103 = self;
    v104 = 2112;
    v105 = v4;
    v106 = 2048;
    v107 = Current - v10;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_INFO, "Pool manager %p received completed signing authority %@ in %.6f seconds since refill started.", (uint8_t *)&v102, 0x20u);
  }

  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v11, v12, v13))
  {
    v17 = objc_alloc_init(APSigningAuthoritySettings);
    objc_msgSend_maxContextsAllowed(v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_integerValue(v21, v22, v23, v24) <= 0)
    {

    }
    else
    {
      objc_msgSend_maxContextsAllowed(v17, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_unsignedIntValue(v28, v29, v30, v31);
      objc_msgSend_signingAuthorityPool(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend_count(v36, v37, v38, v39);

      if (v40 == v32)
        objc_msgSend_setFailureError_(v4, v41, 7201, v42);
    }

  }
  switch(objc_msgSend_failureError(v4, v14, v15, v16))
  {
    case 7200:
    case 7205:
      APLogForCategory(0x2AuLL);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v47 = objc_msgSend_failureError(v4, v44, v45, v46);
        v102 = 134218496;
        v103 = self;
        v104 = 2048;
        v105 = v4;
        v106 = 2048;
        v107 = *(double *)&v47;
        _os_log_impl(&dword_1CF251000, v43, OS_LOG_TYPE_ERROR, "Pool manager %p encountered an error setting up authority %p with error %ld. Retrying.", (uint8_t *)&v102, 0x20u);
      }

      objc_msgSend_enterBackoff(self, v48, v49, v50);
      goto LABEL_26;
    case 7201:
      APLogForCategory(0x2AuLL);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        v102 = 134218240;
        v103 = self;
        v104 = 2048;
        v105 = v4;
        _os_log_impl(&dword_1CF251000, v57, OS_LOG_TYPE_INFO, "Pool manager %p rejecting authority %p due to exceeding max allowed count.", (uint8_t *)&v102, 0x16u);
      }

      objc_msgSend_signingAuthorityPool(self, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend_count(v61, v62, v63, v64);

      if (!v65)
        objc_msgSend_setState_(self, v66, 6101, v68);
      objc_msgSend_signingAuthorityPool(self, v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_count(v69, v70, v71, v72);
      v77 = objc_msgSend_poolSize(self, v74, v75, v76);

      if (v73 != v77)
        objc_msgSend_setState_(self, v78, 18005, v80);
      objc_msgSend__callSetupCompletionHandler(self, v78, v79, v80);

      goto LABEL_26;
    case 7202:
      APLogForCategory(0x2AuLL);
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        v102 = 134218240;
        v103 = self;
        v104 = 2048;
        v105 = v4;
        _os_log_impl(&dword_1CF251000, v81, OS_LOG_TYPE_ERROR, "Pool manager %p encountered an error signing with authority %p.", (uint8_t *)&v102, 0x16u);
      }

      objc_msgSend__refillSigningAuthorityPool(self, v82, v83, v84);
LABEL_26:
      v4 = 0;
      break;
    case 7203:
    case 7206:
      APLogForCategory(0x2AuLL);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v102 = 134218240;
        v103 = self;
        v104 = 2048;
        v105 = v4;
        _os_log_impl(&dword_1CF251000, v51, OS_LOG_TYPE_ERROR, "Pool manager %p: authority %p is either not supported on this platform or the caller does not have sufficient permissions.", (uint8_t *)&v102, 0x16u);
      }

      objc_msgSend_setState_(self, v52, 18002, v53);
      objc_msgSend__callSetupCompletionHandler(self, v54, v55, v56);
      break;
    case 7204:
      APLogForCategory(0x2AuLL);
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        v102 = 134218240;
        v103 = self;
        v104 = 2048;
        v105 = v4;
        _os_log_impl(&dword_1CF251000, v85, OS_LOG_TYPE_INFO, "Pool manager %p adding signing authority %p to pool.", (uint8_t *)&v102, 0x16u);
      }

      objc_msgSend__addSigningAuthorityToPool_(self, v86, (uint64_t)v4, v87);
      objc_msgSend_signingAuthorityPool(self, v88, v89, v90);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = objc_msgSend_count(v91, v92, v93, v94);

      if (v95 == 1)
      {
        objc_msgSend_setState_(self, v96, 18001, v98);
        objc_msgSend__callSetupCompletionHandler(self, v99, v100, v101);
      }
      objc_msgSend__refillSigningAuthorityPool(self, v96, v97, v98);
      break;
    default:
      break;
  }

}

- (void)_callSetupCompletionHandler
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  double Current;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  APSigningAuthoritySettings *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  dispatch_time_t v42;
  const char *v43;
  uint64_t v44;
  void (**v45)(_QWORD, _QWORD);
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x2AuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v7 = objc_msgSend_state(self, v4, v5, v6) - 18001;
    if (v7 > 4)
      v8 = CFSTR("setup started");
    else
      v8 = off_1E8C485D8[v7];
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend_refillStartTime(self, v10, v11, v12);
    *(_DWORD *)buf = 138412546;
    v52 = v8;
    v53 = 2048;
    v54 = Current - v13;
    _os_log_impl(&dword_1CF251000, v3, OS_LOG_TYPE_INFO, "Pool manager calling setup completion handler with state %@ (%.6f)", buf, 0x16u);
  }

  objc_msgSend_setupCompletion(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (objc_msgSend_isAppleInternalInstall(APSystemInternal, v18, v19, v20))
    {
      v24 = objc_alloc_init(APSigningAuthoritySettings);
      objc_msgSend_callbackDelay(v24, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend_unsignedIntValue(v28, v29, v30, v31);

      if (v32)
      {
        v33 = dispatch_queue_create("com.apple.ap.signingpoolmanager.delay", 0);
        objc_msgSend_callbackDelay(v24, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend_unsignedIntValue(v37, v38, v39, v40);
        v42 = dispatch_time(0, 1000000000 * v41);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1CF279198;
        block[3] = &unk_1E8C48590;
        block[4] = self;
        dispatch_after(v42, v33, block);

        objc_msgSend_setSetupCompletion_(self, v43, 0, v44);
        return;
      }

    }
    objc_msgSend_setupCompletion(self, v21, v22, v23);
    v45 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend_state(self, v46, v47, v48);
    v45[2](v45, v49);

  }
  objc_msgSend_setSetupCompletion_(self, v18, 0, v20);
}

- (unint64_t)_numSigningAuthoritiesToCreate
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  objc_msgSend_lock(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);

  v12 = objc_msgSend_poolSize(self, v9, v10, v11);
  objc_msgSend_signingAuthorityPool(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v12 - objc_msgSend_count(v16, v17, v18, v19);

  objc_msgSend_lock(self, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v24, v25, v26, v27);

  return v20;
}

- (void)_addSigningAuthorityToPool:(id)a3
{
  id v4;
  double Current;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  CFAbsoluteTime v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  const char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint32_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  APSigningAuthorityPoolManager *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  CFAbsoluteTime v53;
  __int16 v54;
  double v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  APLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v48 = 134218240;
    v49 = self;
    v50 = 2048;
    v51 = v4;
    _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_INFO, "Pool manager %p adding signing authority %p", (uint8_t *)&v48, 0x16u);
  }

  objc_msgSend_lock(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13);

  objc_msgSend_cancelBackoff(self, v14, v15, v16);
  objc_msgSend_signingAuthorityPool(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v20;
  if (v4)
  {
    if (!objc_msgSend_count(v20, v21, v22, v23))
      objc_msgSend_setCurrentSigningAuthority_(self, v25, (uint64_t)v4, v27);
    if (objc_msgSend__numSigningAuthoritiesToCreate(self, v25, v26, v27))
    {
      objc_msgSend_addObject_(v24, v28, (uint64_t)v4, v29);
      APLogForCategory(0x2AuLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = CFAbsoluteTimeGetCurrent() - Current;
        v32 = CFAbsoluteTimeGetCurrent();
        objc_msgSend_refillStartTime(self, v33, v34, v35);
        v48 = 134218752;
        v49 = self;
        v50 = 2048;
        v51 = v4;
        v52 = 2048;
        v53 = v31;
        v54 = 2048;
        v55 = v32 - v36;
        v37 = "Pool manager %p added and validated signing authority %p (%.6f) (%.6f)";
        v38 = v30;
        v39 = OS_LOG_TYPE_INFO;
        v40 = 42;
LABEL_13:
        _os_log_impl(&dword_1CF251000, v38, v39, v37, (uint8_t *)&v48, v40);
      }
    }
    else
    {
      APLogForCategory(0x2AuLL);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v48 = 134218240;
        v49 = self;
        v50 = 2048;
        v51 = v4;
        v37 = "Pool manager %p not adding authority %p to pool, it is already full.";
        v38 = v30;
        v39 = OS_LOG_TYPE_ERROR;
        v40 = 22;
        goto LABEL_13;
      }
    }
  }
  else
  {
    APLogForCategory(0x2AuLL);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      v37 = "Signing authority is nil, unable to add to pool";
      v38 = v30;
      v39 = OS_LOG_TYPE_ERROR;
      v40 = 2;
      goto LABEL_13;
    }
  }

  objc_msgSend_lock(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v44, v45, v46, v47);

}

- (void)_removeSigningAuthority:(id)a3 shouldRefill:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  double Current;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  APSigningAuthorityPoolManager *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  CFAbsoluteTime v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  id v36;
  uint8_t buf[4];
  APSigningAuthorityPoolManager *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  CFAbsoluteTime v42;
  __int16 v43;
  double v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  APLogForCategory(0x2AuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v38 = self;
    v39 = 2048;
    v40 = v6;
    _os_log_impl(&dword_1CF251000, v8, OS_LOG_TYPE_INFO, "Pool manager %p removing signing authority %p", buf, 0x16u);
  }

  objc_msgSend_currentSigningAuthority(self, v9, v10, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  APLogForCategory(0x2AuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v12 == v6)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_INFO, "This is the current signing authority, set it to nil and rotate.", buf, 2u);
    }

    objc_msgSend_setCurrentSigningAuthority_(self, v21, 0, v22);
    v36 = 0;
    objc_msgSend__rotateWithError_(self, v23, (uint64_t)&v36, v24);
    v18 = (APSigningAuthorityPoolManager *)v36;
    if (v18)
    {
      APLogForCategory(0x2AuLL);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v38 = v18;
        _os_log_impl(&dword_1CF251000, v25, OS_LOG_TYPE_ERROR, "Error encountered while attempting to rotate: %{public}@", buf, 0xCu);
      }

    }
  }
  else
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_INFO, "This is a signing authority in the pool, remove it and its observer, and refill the pool.", buf, 2u);
    }

    objc_msgSend_signingAuthorityPool(self, v15, v16, v17);
    v18 = (APSigningAuthorityPoolManager *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObject_(v18, v19, (uint64_t)v6, v20);
  }

  if (v4)
    objc_msgSend__refillSigningAuthorityPool(self, v26, v27, v28);
  APLogForCategory(0x2AuLL);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = CFAbsoluteTimeGetCurrent() - Current;
    v31 = CFAbsoluteTimeGetCurrent();
    objc_msgSend_refillStartTime(self, v32, v33, v34);
    *(_DWORD *)buf = 134218752;
    v38 = self;
    v39 = 2048;
    v40 = v6;
    v41 = 2048;
    v42 = v30;
    v43 = 2048;
    v44 = v31 - v35;
    _os_log_impl(&dword_1CF251000, v29, OS_LOG_TYPE_INFO, "Pool manager %p finished removing signing authority %p (%.6f) (%.6f)", buf, 0x2Au);
  }

}

- (void)_removeAllSigningAuthorities
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint8_t v38[16];
  uint8_t buf[16];

  APLogForCategory(0x2AuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF251000, v3, OS_LOG_TYPE_DEBUG, "All signing authorities are being removed from the pool.", buf, 2u);
  }

  objc_msgSend_lock(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v7, v8, v9, v10);

  objc_msgSend_currentSigningAuthority(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    APLogForCategory(0x2AuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_INFO, "This is the current signing authority, set it to nil.", v38, 2u);
    }

    objc_msgSend_setCurrentSigningAuthority_(self, v19, 0, v20);
  }
  objc_msgSend_signingAuthorityPool(self, v15, v16, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v21, v22, v23, v24);

  objc_msgSend_lock(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v28, v29, v30, v31);

  objc_msgSend_name(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_destroyAndClearAllContextsForPool_(APSigningContextStorage, v36, (uint64_t)v35, v37);

}

- (void)_clearStashedContextsIfIndicated
{
  uint64_t v2;
  uint64_t v3;
  APSigningAuthoritySettings *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isAppleInternalInstall(APSystemInternal, a2, v2, v3))
  {
    v5 = objc_alloc_init(APSigningAuthoritySettings);
    objc_msgSend_clearStashedContexts(v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      APLogForCategory(0x2AuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_name(self, v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v14;
        _os_log_impl(&dword_1CF251000, v10, OS_LOG_TYPE_INFO, "Clearing all contexts for pool '%@'", (uint8_t *)&v21, 0xCu);

      }
      objc_msgSend_name(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_destroyAndClearAllContextsForPool_(APSigningContextStorage, v19, (uint64_t)v18, v20);

    }
  }
}

- (BOOL)rotateWithError:(id *)a3
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  char v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v24[16];

  APLogForCategory(0x2AuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_1CF251000, v5, OS_LOG_TYPE_INFO, "Rotate the current signing authority.", v24, 2u);
  }

  objc_msgSend_lock(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v9, v10, v11, v12);

  v15 = objc_msgSend__rotateWithError_(self, v13, (uint64_t)a3, v14);
  objc_msgSend_lock(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v19, v20, v21, v22);

  return v15;
}

- (BOOL)_rotateWithError:(id *)a3
{
  CFAbsoluteTime Current;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  APRotationRequestor *v32;
  const char *v33;
  uint64_t v34;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  __int128 *p_buf;
  CFAbsoluteTime v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  __int128 buf;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  APLogForCategory(0x2AuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_1CF251000, v6, OS_LOG_TYPE_INFO, "Pool manager %p rotating", (uint8_t *)&buf, 0xCu);
  }

  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  if (objc_msgSend_state(self, v7, v8, v9) == 18002)
  {
    APLogForCategory(0x2AuLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_ERROR, "Error: Unable to rotate, we are in a permanent failure state.", (uint8_t *)&buf, 2u);
    }

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v51[0] = CFSTR("Pool manager in permanent error state, unable to rotate.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v51, (uint64_t)&v50, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v17, (uint64_t)CFSTR("com.apple.ap.signingAuthorityPoolManagerErrorDomain"), 6101, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = objc_retainAutorelease(v18);
    v19 = *((unsigned __int8 *)v42 + 24);
  }
  else
  {
    objc_msgSend_signingAuthorityPool(self, v10, v11, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_AD_validSigningAuthority(v18, v20, v21, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      APLogForCategory(0x2AuLL);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1CF251000, v26, OS_LOG_TYPE_INFO, "Successfully set up signing authority exists in the pool, set it to the current signing authority.", (uint8_t *)&buf, 2u);
      }

      objc_msgSend_removeObject_(v18, v27, (uint64_t)v25, v28);
    }
    objc_msgSend_setCurrentSigningAuthority_(self, v23, (uint64_t)v25, v24);
    objc_msgSend__refillSigningAuthorityPool(self, v29, v30, v31);
    v19 = 1;
    *((_BYTE *)v42 + 24) = 1;
    if (qword_1ED2BBE68 == 1)
    {
      v32 = objc_alloc_init(APRotationRequestor);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v46 = 0x3032000000;
      v47 = sub_1CF279E48;
      v48 = sub_1CF279E58;
      v49 = 0;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = sub_1CF279E60;
      v36[3] = &unk_1E8C485B8;
      v38 = &v41;
      p_buf = &buf;
      v36[4] = self;
      v37 = v18;
      v40 = Current;
      objc_msgSend_rotate_(v32, v33, (uint64_t)v36, v34);
      if (a3)
        *a3 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));

      _Block_object_dispose(&buf, 8);
      v19 = *((unsigned __int8 *)v42 + 24);
    }

  }
  _Block_object_dispose(&v41, 8);
  return v19 != 0;
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_lock(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13);

  objc_msgSend_currentSigningAuthority(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_state(self, v18, v19, v20);
  objc_msgSend_lock(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v25, v26, v27, v28);

  if (v21 == 18002 || !v17)
  {
    v36 = CFSTR("Pool manager in permanent error state, unable to sign data.");
    if (v21 == 18002)
    {
      v37 = 6101;
    }
    else
    {
      v36 = CFSTR("Signing authority not setup, unable to sign data.");
      v37 = 6100;
    }
    goto LABEL_13;
  }
  if (objc_msgSend_state(v17, v29, v30, v31) != 17002)
  {
    v36 = CFSTR("Signing authority not setup, unable to sign data.");
    v37 = 6100;
LABEL_13:
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    v56[0] = v36;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v56, (uint64_t)&v55, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v38, v40, (uint64_t)CFSTR("com.apple.ap.signingAuthorityPoolManagerErrorDomain"), v37, v39);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    if (!a4)
    {
      v32 = 0;
      goto LABEL_19;
    }
    APLogForCategory(0x2AuLL);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v33, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v45;
      _os_log_impl(&dword_1CF251000, v41, OS_LOG_TYPE_ERROR, "Error: %{public}@", buf, 0xCu);

    }
    v46 = objc_retainAutorelease(v33);
    v33 = v46;
    v32 = 0;
    goto LABEL_17;
  }
  v52 = 0;
  objc_msgSend_signatureForData_error_(v17, v29, (uint64_t)v6, (uint64_t)&v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v52;
  APLogForCategory(0x2AuLL);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v33 && v32)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF251000, v35, OS_LOG_TYPE_DEBUG, "Successfully got a signature", buf, 2u);
    }

    v33 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_localizedDescription(v33, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v51;
    _os_log_impl(&dword_1CF251000, v35, OS_LOG_TYPE_ERROR, "Error getting signature: %{public}@", buf, 0xCu);

  }
  if (a4)
  {
    v46 = objc_retainAutorelease(v33);
    v33 = v46;
LABEL_17:
    *a4 = v46;
  }
LABEL_19:

  return v32;
}

- (id)signatureForRawData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_lock(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v10, v11, v12, v13);

  objc_msgSend_currentSigningAuthority(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_state(self, v18, v19, v20);
  objc_msgSend_lock(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v25, v26, v27, v28);

  if (v21 == 18002 || !v17)
  {
    v36 = CFSTR("Pool manager in permanent error state, unable to sign data.");
    if (v21 == 18002)
    {
      v37 = 6101;
    }
    else
    {
      v36 = CFSTR("Signing authority not setup, unable to sign data.");
      v37 = 6100;
    }
    goto LABEL_13;
  }
  if (objc_msgSend_state(v17, v29, v30, v31) != 17002)
  {
    v36 = CFSTR("Signing authority not setup, unable to sign data.");
    v37 = 6100;
LABEL_13:
    v38 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D50];
    v56[0] = v36;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v29, (uint64_t)v56, (uint64_t)&v55, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v38, v40, (uint64_t)CFSTR("com.apple.ap.signingAuthorityPoolManagerErrorDomain"), v37, v39);
    v33 = (id)objc_claimAutoreleasedReturnValue();

    if (!a4)
    {
      v32 = 0;
      goto LABEL_19;
    }
    APLogForCategory(0x2AuLL);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v33, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v45;
      _os_log_impl(&dword_1CF251000, v41, OS_LOG_TYPE_ERROR, "Error: %{public}@", buf, 0xCu);

    }
    v46 = objc_retainAutorelease(v33);
    v33 = v46;
    v32 = 0;
    goto LABEL_17;
  }
  v52 = 0;
  objc_msgSend_signatureForRawData_error_(v17, v29, (uint64_t)v6, (uint64_t)&v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v52;
  APLogForCategory(0x2AuLL);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (!v33 && v32)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF251000, v35, OS_LOG_TYPE_DEBUG, "Successfully got a signature", buf, 2u);
    }

    v33 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_localizedDescription(v33, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v54 = v51;
    _os_log_impl(&dword_1CF251000, v35, OS_LOG_TYPE_ERROR, "Error getting signature: %{public}@", buf, 0xCu);

  }
  if (a4)
  {
    v46 = objc_retainAutorelease(v33);
    v33 = v46;
LABEL_17:
    *a4 = v46;
  }
LABEL_19:

  return v32;
}

- (void)enterBackoff
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  APBackoffTimer *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  id v22;

  objc_msgSend_backoffTimer(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v9 = [APBackoffTimer alloc];
    v11 = (void *)objc_msgSend_initWithSchedule_name_(v9, v10, (uint64_t)&unk_1E8C5BD48, (uint64_t)CFSTR("APSigningAuthorityPoolManager"));
    objc_msgSend_setBackoffTimer_(self, v12, (uint64_t)v11, v13);

    objc_msgSend_backoffTimer(self, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDelegate_(v17, v18, (uint64_t)self, v19);

  }
  objc_msgSend_backoffTimer(self, v6, v7, v8);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheduleNextLevelWithQueue_(v22, v20, 0, v21);

}

- (void)cancelBackoff
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  objc_msgSend_backoffTimer(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_reset(v5, v6, v7, v8);

  objc_msgSend_setBackoffTimer_(self, v9, 0, v10);
}

- (void)backoffTimerFired
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  id v29;

  objc_msgSend_backoffTimer(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_scheduleTerminated(v5, v6, v7, v8);

  if (v9)
  {
    objc_msgSend_signingAuthorityPool(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_count(v13, v14, v15, v16);

    if (!v17)
      objc_msgSend_setState_(self, v18, 18002, v20);
    objc_msgSend__callSetupCompletionHandler(self, v18, v19, v20);
    objc_msgSend_cancelBackoff(self, v21, v22, v23);
  }
  else
  {
    objc_msgSend__refillSigningAuthorityPool(self, v10, v11, v12);
    objc_msgSend_backoffTimer(self, v24, v25, v26);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scheduleNextLevelWithQueue_(v29, v27, 0, v28);

  }
}

- (unint64_t)poolSize
{
  return self->_poolSize;
}

- (unint64_t)numberToStash
{
  return self->_numberToStash;
}

- (void)setNumberToStash:(unint64_t)a3
{
  self->_numberToStash = a3;
}

- (NSMutableArray)signingAuthorityPool
{
  return self->_signingAuthorityPool;
}

- (void)setSigningAuthorityPool:(id)a3
{
  objc_storeStrong((id *)&self->_signingAuthorityPool, a3);
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (double)lastStateChangeTime
{
  return self->_lastStateChangeTime;
}

- (void)setLastStateChangeTime:(double)a3
{
  self->_lastStateChangeTime = a3;
}

- (double)refillStartTime
{
  return self->_refillStartTime;
}

- (void)setRefillStartTime:(double)a3
{
  self->_refillStartTime = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (APBackoffTimer)backoffTimer
{
  return self->_backoffTimer;
}

- (void)setBackoffTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backoffTimer, a3);
}

- (id)setupCompletion
{
  return self->_setupCompletion;
}

- (void)setSetupCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupCompletion, 0);
  objc_storeStrong((id *)&self->_backoffTimer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_signingAuthorityPool, 0);
  objc_storeStrong((id *)&self->_currentSigningAuthority, 0);
}

@end
