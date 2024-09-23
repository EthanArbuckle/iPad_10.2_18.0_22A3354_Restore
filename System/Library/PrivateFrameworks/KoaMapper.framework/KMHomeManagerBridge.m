@implementation KMHomeManagerBridge

- (KMHomeManagerBridge)init
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  KM_HMFLocationAuthorization *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  KMHomeManagerBridge *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v3 = (void *)getHMMutableHomeManagerConfigurationClass_softClass;
  v21 = getHMMutableHomeManagerConfigurationClass_softClass;
  if (!getHMMutableHomeManagerConfigurationClass_softClass)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __getHMMutableHomeManagerConfigurationClass_block_invoke;
    v16 = &unk_24D9613B0;
    v17 = &v18;
    __getHMMutableHomeManagerConfigurationClass_block_invoke((uint64_t)&v13);
    v3 = (void *)v19[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v18, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithOptions:cachePolicy:", 1025, 0);
  objc_msgSend(v5, "setDiscretionary:", 0);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "setDelegateQueue:", v6);

  v7 = objc_alloc_init(KM_HMFLocationAuthorization);
  objc_msgSend(v5, "setLocationAuthorization:", v7);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)getHMHomeManagerClass_softClass;
  v21 = getHMHomeManagerClass_softClass;
  if (!getHMHomeManagerClass_softClass)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __getHMHomeManagerClass_block_invoke;
    v16 = &unk_24D9613B0;
    v17 = &v18;
    __getHMHomeManagerClass_block_invoke((uint64_t)&v13);
    v8 = (void *)v19[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithHomeMangerConfiguration:", v5);
  v11 = -[KMHomeManagerBridge initWithHomeManager:setupTimeout:]([KMHomeManagerBridge alloc], "initWithHomeManager:setupTimeout:", v10, 30.0);

  return v11;
}

- (KMHomeManagerBridge)initWithHomeManager:(id)a3 setupTimeout:(double)a4
{
  id v7;
  KMHomeManagerBridge *v8;
  KMHomeManagerBridge *v9;
  HMHomeManager **p_homeManager;
  dispatch_semaphore_t v11;
  OS_dispatch_semaphore *setupSema;
  id v13;
  uint64_t v14;
  id v15;
  KVItemMapper *itemMapper;
  KMHomeManagerBridge *v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  id location;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)KMHomeManagerBridge;
  v8 = -[KMHomeManagerBridge init](&v23, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  p_homeManager = &v8->_homeManager;
  objc_storeStrong((id *)&v8->_homeManager, a3);
  if (!*p_homeManager)
  {
    v18 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[KMHomeManagerBridge initWithHomeManager:setupTimeout:]";
      _os_log_error_impl(&dword_218838000, v18, OS_LOG_TYPE_ERROR, "%s Cannot initialize KMHomeManagerBridge with nil homeManager", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v11 = dispatch_semaphore_create(0);
  setupSema = v9->_setupSema;
  v9->_setupSema = (OS_dispatch_semaphore *)v11;

  v9->_setupTimeout = a4;
  v13 = objc_initWeak(&location, v9);
  -[HMHomeManager setDelegate:](v9->_homeManager, "setDelegate:", v9);

  v21 = 0;
  v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE5E8F0]), "initWithObjectClass:error:", objc_opt_class(), &v21);
  v15 = v21;
  itemMapper = v9->_itemMapper;
  v9->_itemMapper = (KVItemMapper *)v14;

  if (!v9->_itemMapper)
  {
    v19 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[KMHomeManagerBridge initWithHomeManager:setupTimeout:]";
      v26 = 2112;
      v27 = v15;
      _os_log_error_impl(&dword_218838000, v19, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }

    objc_destroyWeak(&location);
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }

  objc_destroyWeak(&location);
LABEL_5:
  v17 = v9;
LABEL_12:

  return v17;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[KMHomeManagerBridge homeManagerDidUpdateHomes:]";
    _os_log_impl(&dword_218838000, v4, OS_LOG_TYPE_INFO, "%s homeManagerDidUpdateHomes being invoked", (uint8_t *)&v5, 0xCu);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_setupSema);
}

- (unsigned)cascadeItemType
{
  return 7690;
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E898];
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v5)(id, _QWORD);
  void **p_cache;
  void *v7;
  void *v8;
  double setupTimeout;
  NSObject *v10;
  void *v11;
  NSObject *setupSema;
  dispatch_time_t v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  KVItemMapper *itemMapper;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *context;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = (uint64_t (**)(id, _QWORD))a4;
  p_cache = KMDeltaContactCollector.cache;
  v7 = (void *)KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    setupTimeout = self->_setupTimeout;
    v10 = v7;
    objc_msgSend(v8, "numberWithDouble:", setupTimeout);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v56 = "-[KMHomeManagerBridge enumerateItemsWithError:usingBlock:]";
    v57 = 2112;
    v58 = v11;
    _os_log_impl(&dword_218838000, v10, OS_LOG_TYPE_INFO, "%s Waiting up to %@ seconds for home manager setup", buf, 0x16u);

  }
  setupSema = self->_setupSema;
  v13 = dispatch_time(0, (uint64_t)(self->_setupTimeout * 1000000000.0));
  if (dispatch_semaphore_wait(setupSema, v13))
  {
    v14 = KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v56 = "-[KMHomeManagerBridge enumerateItemsWithError:usingBlock:]";
      _os_log_impl(&dword_218838000, v14, OS_LOG_TYPE_INFO, "%s Timed out waiting for home manager setup", buf, 0xCu);
    }
    v15 = 0;
  }
  else
  {
    -[HMHomeManager homes](self->_homeManager, "homes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)KMLogContextCore;
    if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v36 = (void *)MEMORY[0x24BDD16E0];
      v37 = v17;
      objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v56 = "-[KMHomeManagerBridge enumerateItemsWithError:usingBlock:]";
      v57 = 2112;
      v58 = v38;
      _os_log_debug_impl(&dword_218838000, v37, OS_LOG_TYPE_DEBUG, "%s Home manager is ready. homesCount: %@", buf, 0x16u);

    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v18 = v16;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v50;
      v42 = v18;
      v40 = *(_QWORD *)v50;
      while (2)
      {
        v23 = 0;
        v24 = v21;
        v41 = v20;
        do
        {
          if (*(_QWORD *)v50 != v22)
            objc_enumerationMutation(v18);
          v25 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v23);
          context = (void *)MEMORY[0x219A1AD04]();
          itemMapper = self->_itemMapper;
          v48 = v24;
          -[KVItemMapper mapObject:error:](itemMapper, "mapObject:error:", v25, &v48);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v48;

          if (!v27)
          {
            v39 = p_cache[340];
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v56 = "-[KMHomeManagerBridge enumerateItemsWithError:usingBlock:]";
              v57 = 2112;
              v58 = v21;
              _os_log_error_impl(&dword_218838000, v39, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
            }
            objc_autoreleasePoolPop(context);

            KVSetError();
LABEL_27:
            v15 = 0;
            goto LABEL_29;
          }
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v28 = v27;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v45;
            while (2)
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v45 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
                v34 = (void *)MEMORY[0x219A1AD04]();
                LODWORD(v33) = v5[2](v5, v33);
                objc_autoreleasePoolPop(v34);
                if (!(_DWORD)v33)
                {

                  objc_autoreleasePoolPop(context);
                  v18 = v42;

                  goto LABEL_27;
                }
              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
              if (v30)
                continue;
              break;
            }
          }

          objc_autoreleasePoolPop(context);
          ++v23;
          v24 = v21;
          v18 = v42;
          p_cache = (void **)(KMDeltaContactCollector + 16);
          v22 = v40;
        }
        while (v23 != v41);
        v20 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
        if (v20)
          continue;
        break;
      }

      v15 = 1;
    }
    else
    {
      v15 = 1;
      v21 = v18;
    }
LABEL_29:

  }
  return v15;
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (OS_dispatch_semaphore)setupSema
{
  return self->_setupSema;
}

- (double)setupTimeout
{
  return self->_setupTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSema, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_itemMapper, 0);
}

@end
