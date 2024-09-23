@implementation IDSServerBagInProcessContentProvider

- (IDSServerBagInProcessContentProvider)initWithConfig:(id)a3 queue:(id)a4 validator:(id)a5 networkLoader:(id)a6 cacheLoader:(id)a7
{
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  IDSServerBagInProcessContentProvider *v17;
  IDSServerBagInProcessContentProvider *v18;
  IDSServerBagCacheLoader *cacheLoader;
  uint64_t v20;
  const char *v21;
  double v22;
  dispatch_time_t v23;
  id v25;
  _QWORD block[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v25 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)IDSServerBagInProcessContentProvider;
  v17 = -[IDSServerBagInProcessContentProvider init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v17->_config, a3);
    objc_storeStrong((id *)&v18->_queue, a4);
    objc_storeStrong((id *)&v18->_validator, a5);
    objc_storeStrong((id *)&v18->_networkLoader, a6);
    objc_storeStrong((id *)&v18->_cacheLoader, a7);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v18);
    cacheLoader = v18->_cacheLoader;
    v20 = MEMORY[0x1E0C809B0];
    if (cacheLoader)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = sub_19BA7D2A4;
      v28[3] = &unk_1E3C21338;
      objc_copyWeak(&v29, &location);
      objc_msgSend_setCacheDidReloadBlock_(cacheLoader, v21, (uint64_t)v28, v22, v25);
      objc_destroyWeak(&v29);
    }
    v23 = dispatch_time(0, 2000000000);
    block[0] = v20;
    block[1] = 3221225472;
    block[2] = sub_19BA7D5AC;
    block[3] = &unk_1E3C21360;
    objc_copyWeak(&v27, &location);
    dispatch_after(v23, v13, block);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (void)setContentsUpdatedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)loadOverrideValuesIfPresent
{
  uint64_t v2;
  double v3;

  return (id)objc_msgSend_loadOverrideValuesIfPresent(self->_cacheLoader, a2, v2, v3);
}

- (IDSServerBagInProcessContentProvider)initWithConfig:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  IDSServerBagNetworkLoader *v11;
  const char *v12;
  double v13;
  void *v14;
  IDSServerBagValidator *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  IDSServerBagCacheLoader *v25;
  const char *v26;
  double v27;
  IDSServerBagInProcessContentProvider *v28;
  uint64_t v30;
  uint64_t v31;
  id (*v32)(uint64_t, const char *, uint64_t, double);
  void *v33;
  id v34;
  id v35;

  v6 = a3;
  v7 = a4;
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = sub_19BA7D1F0;
  v33 = &unk_1E3C212F0;
  v8 = v7;
  v34 = v8;
  v9 = v6;
  v35 = v9;
  v10 = _Block_copy(&v30);
  v11 = [IDSServerBagNetworkLoader alloc];
  v14 = (void *)objc_msgSend_initWithConfig_queue_connectionMonitorBlock_URLSessionCreationBlock_(v11, v12, (uint64_t)v9, v13, v8, &unk_1E3C1B8B0, v10, v30, v31, v32, v33);
  v15 = [IDSServerBagValidator alloc];
  v18 = (void *)objc_msgSend_initWithConfig_(v15, v16, (uint64_t)v9, v17);
  objc_msgSend_defaultsDomain(v9, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v25 = [IDSServerBagCacheLoader alloc];
    v22 = (void *)objc_msgSend_initWithConfig_queue_(v25, v26, (uint64_t)v9, v27, v8);
  }
  v28 = (IDSServerBagInProcessContentProvider *)objc_msgSend_initWithConfig_queue_validator_networkLoader_cacheLoader_(self, v23, (uint64_t)v9, v24, v8, v18, v14, v22);

  return v28;
}

- (id)currentLoadedContentsWithError:(id *)a3
{
  double v3;
  IDSServerBagCacheLoader *cacheLoader;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  IDSServerBagValidator *validator;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  BOOL v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  NSObject *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  IDSServerBagInProcessContentProvider *v46;
  __int16 v47;
  NSObject *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  cacheLoader = self->_cacheLoader;
  if (!cacheLoader)
    return 0;
  v42 = 0;
  objc_msgSend_loadFromCacheWithError_(cacheLoader, a2, (uint64_t)&v42, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v42;
  v11 = v7;
  if (v6)
    v12 = v7 == 0;
  else
    v12 = 0;
  if (v12)
  {
    validator = self->_validator;
    v41 = 0;
    objc_msgSend_trustedContentsFromRawContents_shouldReport_withError_(validator, v8, (uint64_t)v6, v10, 0, &v41);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v41;
    if (v21)
      v26 = v22 == 0;
    else
      v26 = 0;
    if (v26)
    {
      os_unfair_lock_lock(&self->_lock);
      objc_storeStrong((id *)&self->_loadedRawContents, v6);
      os_unfair_lock_unlock(&self->_lock);
      objc_msgSend_config(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_logCategory(v36, v37, v38, v39);
      v17 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v40 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        v44 = v40;
        v45 = 2048;
        v46 = self;
        v47 = 2112;
        v48 = v21;
        _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "<%@:%p> cache loaded {loadedContents: %@}", buf, 0x20u);
      }
      goto LABEL_17;
    }
    v17 = v22;
    objc_msgSend_config(self, v23, v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logCategory(v27, v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v44 = v32;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v17;
      _os_log_impl(&dword_19B949000, v31, OS_LOG_TYPE_DEFAULT, "<%@:%p> cache not validated {cacheValidationError: %@}", buf, 0x20u);
    }

  }
  else
  {
    objc_msgSend_config(self, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logCategory(v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v44 = v18;
      v45 = 2048;
      v46 = self;
      v47 = 2112;
      v48 = v11;
      _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "<%@:%p> cache not found {cacheLoadError: %@}", buf, 0x20u);
    }
  }
  v21 = 0;
LABEL_17:

  return v21;
}

- (IDSServerBagConfig)config
{
  return self->_config;
}

- (BOOL)isServerAvailable
{
  uint64_t v2;
  double v3;

  return objc_msgSend_isServerAvailable(self->_networkLoader, a2, v2, v3);
}

- (BOOL)isLoading
{
  uint64_t v2;
  double v3;

  return objc_msgSend_isLoading(self->_networkLoader, a2, v2, v3);
}

- (id)updateContentsIfPossibleShouldForce:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  uint64_t v7;
  double v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  double v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  const char *v19;
  uint64_t v20;
  double v21;
  int v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  double v26;
  int isLoading;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  IDSServerBagInProcessContentProvider *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  __int16 v54;
  const __CFString *v55;
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_loadDate(self->_loadedRawContents, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceNow(v9, v10, v11, v12);
  if (v15 >= 0.0)
    v16 = v15;
  else
    v16 = -v15;
  objc_msgSend_timeToLive(self->_loadedRawContents, v13, v14, v15);
  v18 = v17;
  os_unfair_lock_unlock(p_lock);
  v22 = v16 >= v18 || v3;
  objc_msgSend_networkLoader(self, v19, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  isLoading = objc_msgSend_isLoading(v23, v24, v25, v26);

  objc_msgSend_config(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logCategory(v31, v32, v33, v34);
  v35 = objc_claimAutoreleasedReturnValue();

  if (v22 == 1 && isLoading == 0)
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_opt_class();
      v40 = CFSTR("NO");
      *(_DWORD *)buf = 138413570;
      v45 = v39;
      v46 = 2048;
      if (v3)
        v40 = CFSTR("YES");
      v47 = self;
      v48 = 2112;
      v49 = v9;
      v50 = 2048;
      v51 = v16;
      v52 = 2048;
      v53 = v18;
      v54 = 2112;
      v55 = v40;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "<%@:%p> Ready to start loading bag {lastLoad: %@, timeSinceLoad: %f, timeToLive: %f, force: %@}", buf, 0x3Eu);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19BA7D86C;
    block[3] = &unk_1E3C1F898;
    block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v37 = objc_opt_class();
      v38 = CFSTR("NO");
      *(_DWORD *)buf = 138413570;
      v45 = v37;
      v46 = 2048;
      if (v3)
        v38 = CFSTR("YES");
      v47 = self;
      v48 = 2112;
      v49 = v9;
      v50 = 2048;
      v51 = v16;
      v52 = 2048;
      v53 = v18;
      v54 = 2112;
      v55 = v38;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_INFO, "<%@:%p> Should not start loading bag {lastLoad: %@, timeSinceLoad: %f, timeToLive: %f, force: %@}", buf, 0x3Eu);
    }

  }
  return 0;
}

- (id)writeOverrideValues:(id)a3
{
  double v3;

  return (id)objc_msgSend_writeOverrideValues_(self->_cacheLoader, a2, (uint64_t)a3, v3);
}

- (id)clearOverrideValues
{
  uint64_t v2;
  double v3;

  return (id)objc_msgSend_clearOverrideValues(self->_cacheLoader, a2, v2, v3);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (NSString *)objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@:%p; networkLoader: %@; cacheLoader: %@; validator: %@>"),
                       *(double *)&self->_networkLoader,
                       v4,
                       self,
                       self->_networkLoader,
                       self->_cacheLoader,
                       self->_validator);
}

- (id)contentsUpdatedBlock
{
  return self->_contentsUpdatedBlock;
}

- (IDSServerBagRawContents)loadedRawContents
{
  return self->_loadedRawContents;
}

- (void)setLoadedRawContents:(id)a3
{
  objc_storeStrong((id *)&self->_loadedRawContents, a3);
}

- (NSMutableDictionary)overrideValues
{
  return self->_overrideValues;
}

- (void)setOverrideValues:(id)a3
{
  objc_storeStrong((id *)&self->_overrideValues, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (IDSServerBagNetworkLoader)networkLoader
{
  return self->_networkLoader;
}

- (void)setNetworkLoader:(id)a3
{
  objc_storeStrong((id *)&self->_networkLoader, a3);
}

- (IDSServerBagCacheLoader)cacheLoader
{
  return self->_cacheLoader;
}

- (void)setCacheLoader:(id)a3
{
  objc_storeStrong((id *)&self->_cacheLoader, a3);
}

- (IDSServerBagValidator)validator
{
  return self->_validator;
}

- (void)setValidator:(id)a3
{
  objc_storeStrong((id *)&self->_validator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_cacheLoader, 0);
  objc_storeStrong((id *)&self->_networkLoader, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_overrideValues, 0);
  objc_storeStrong((id *)&self->_loadedRawContents, 0);
  objc_storeStrong(&self->_contentsUpdatedBlock, 0);
}

@end
