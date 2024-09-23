@implementation NWAccumulator

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  NWAccumulator *v21;
  __int16 v22;
  NSObject *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  NSObject *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[NWAccumulator accumulatedValueForObject:andKeyPath:](self, "accumulatedValueForObject:andKeyPath:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "callback");
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSObject *))v14)[2](v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = 136447490;
      v19 = "-[NWAccumulator observeValueForKeyPath:ofObject:change:context:]";
      v20 = 2112;
      v21 = self;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}s %@ observing value %@ for keyPath %@ of object %@, state: %@", (uint8_t *)&v18, 0x3Eu);
    }

    if (v15)
    {
      objc_msgSend(v12, "accumulation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      objc_msgSend(v17, "updateWithState:atTime:", v15);

    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 136446722;
      v19 = "-[NWAccumulator observeValueForKeyPath:ofObject:change:context:]";
      v20 = 2112;
      v21 = self;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_ERROR, "%{public}s %@ did not find value for object: %@", (uint8_t *)&v18, 0x20u);
    }
  }

}

- (id)accumulatedValueForObject:(id)a3 andKeyPath:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1673;
  v21 = __Block_byref_object_dispose__1674;
  v22 = 0;
  p_lock = &self->_lock;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke;
  v13[3] = &unk_1E14A2198;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  os_unfair_lock_lock(p_lock);
  __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke(v13);
  os_unfair_lock_unlock(p_lock);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __54__NWAccumulator_accumulatedValueForObject_andKeyPath___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1[4] + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
LABEL_4:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
      objc_msgSend(v7, "object", (_QWORD)v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 == (void *)a1[5])
      {
        objc_msgSend(v7, "keyPath");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", a1[6]);

        if (v11)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v7);
          break;
        }
      }
      else
      {

      }
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (!v4)
          break;
        goto LABEL_4;
      }
    }
  }

}

- (NWAccumulator)initWithName:(id)a3
{
  id v5;
  NWAccumulator *v6;
  NWAccumulator *v7;
  NSMutableArray *v8;
  NSMutableArray *accumulatedValues;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NWAccumulator;
  v6 = -[NWAccumulator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    *(_QWORD *)&v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    accumulatedValues = v7->_accumulatedValues;
    v7->_accumulatedValues = v8;

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[NWAccumulator name](v7, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v15 = "-[NWAccumulator initWithName:]";
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_DEBUG, "%{public}s NWAccumulator init %@", buf, 0x16u);

    }
  }

  return v7;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  NWAccumulator *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1673;
  v25 = __Block_byref_object_dispose__1674;
  v26 = 0;
  p_lock = &self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __24__NWAccumulator_dealloc__block_invoke;
  v20[3] = &unk_1E14ACE40;
  v20[4] = self;
  v20[5] = &v21;
  os_unfair_lock_lock(&self->_lock);
  __24__NWAccumulator_dealloc__block_invoke((uint64_t)v20);
  os_unfair_lock_unlock(p_lock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)v22[5];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v11[0] = v4;
        v11[1] = 3221225472;
        v12 = __24__NWAccumulator_dealloc__block_invoke_2;
        v13 = &unk_1E14ACE68;
        v14 = v9;
        v15 = self;
        os_unfair_lock_lock(&self->_kvo_lock);
        v12((uint64_t)v11);
        os_unfair_lock_unlock(&self->_kvo_lock);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    }
    while (v6);
  }

  objc_msgSend((id)v22[5], "removeAllObjects");
  _Block_object_dispose(&v21, 8);

  v10.receiver = self;
  v10.super_class = (Class)NWAccumulator;
  -[NWAccumulator dealloc](&v10, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NWAccumulator name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWAccumulator accumulatedValues](self, "accumulatedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<NWAccumulator %@, NWAccumulations: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)accumulations
{
  id v3;
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  NWAccumulator *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_lock = &self->_lock;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __30__NWAccumulator_accumulations__block_invoke;
  v11 = &unk_1E14ACE68;
  v12 = self;
  v13 = v3;
  v5 = v3;
  os_unfair_lock_lock(p_lock);
  __30__NWAccumulator_accumulations__block_invoke((uint64_t)&v8);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5, v8, v9, v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5
{
  -[NWAccumulator addAccumulation:withName:forKey:stateCallback:](self, "addAccumulation:withName:forKey:stateCallback:", a3, a4, a4, a5);
}

- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6
{
  NWAccumulator *v10;
  id v11;
  NWAccumulator *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NWAccumulator *v19;
  NWAccumulatedValue *v20;
  NWAccumulation *v21;
  NWAccumulatedValue *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  NWAccumulator *v27;
  NWAccumulatedValue *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  NWAccumulator *v32;
  __int16 v33;
  NWAccumulator *v34;
  __int16 v35;
  NSObject *p_super;
  __int16 v37;
  NWAccumulator *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = (NWAccumulator *)a3;
  v11 = a4;
  v12 = (NWAccumulator *)a5;
  v13 = a6;
  v14 = v13;
  if (v10 && v12 && v13)
  {
    -[NWAccumulator accumulatedValueForObject:andKeyPath:](self, "accumulatedValueForObject:andKeyPath:", v10, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v15;
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v17 = (id)gLogObj;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136447234;
        v30 = "-[NWAccumulator addAccumulation:withName:forKey:stateCallback:]";
        v31 = 2112;
        v32 = v10;
        v33 = 2112;
        v34 = v12;
        v35 = 2112;
        p_super = v16;
        v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_182FBE000, v17, OS_LOG_TYPE_INFO, "%{public}s Existing NWAccumulatedValue for object: %@ and keyPath: %@: %@, resetting %@", buf, 0x34u);
      }

      -[NSObject setCallback:](v16, "setCallback:", v14);
      -[NSObject accumulation](v16, "accumulation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "reset");

      -[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:](self, "registerObserverForKeyPath:ofObject:alreadyRegistered:", v12, v10, 1);
    }
    else
    {
      v20 = objc_alloc_init(NWAccumulatedValue);
      -[NWAccumulatedValue setObject:](v20, "setObject:", v10);
      -[NWAccumulatedValue setKeyPath:](v20, "setKeyPath:", v12);
      -[NWAccumulatedValue setCallback:](v20, "setCallback:", v14);
      v21 = -[NWAccumulation initWithName:]([NWAccumulation alloc], "initWithName:", v11);
      -[NWAccumulatedValue setAccumulation:](v20, "setAccumulation:", v21);
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke;
      v26 = &unk_1E14ACE68;
      v27 = self;
      v28 = v20;
      v22 = v20;
      os_unfair_lock_lock(&self->_lock);
      __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke((uint64_t)&v23);
      os_unfair_lock_unlock(&self->_lock);
      -[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:](self, "registerObserverForKeyPath:ofObject:alreadyRegistered:", v12, v10, 0, v23, v24, v25, v26, v27, v28);

      v16 = 0;
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = (NWAccumulator *)_Block_copy(v14);
      *(_DWORD *)buf = 136447234;
      v30 = "-[NWAccumulator addAccumulation:withName:forKey:stateCallback:]";
      v31 = 2112;
      v32 = self;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      p_super = &v12->super;
      v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_ERROR, "%{public}s %@ invalid value passed to addAccumulation: object (%@), key (%@), callback (%@)", buf, 0x34u);

    }
  }

}

- (void)registerObserverForKeyPath:(id)a3 ofObject:(id)a4 alreadyRegistered:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  os_unfair_lock_s *p_kvo_lock;
  id v12;
  id v13;
  void *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  void *v19;
  char *backtrace_string;
  _BOOL4 v21;
  char *v22;
  _BOOL4 v23;
  _QWORD v24[7];
  BOOL v25;
  char v26;
  os_log_type_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    v27 = OS_LOG_TYPE_ERROR;
    v26 = 0;
    if (!__nwlog_fault(v15, &v27, &v26))
      goto LABEL_34;
    if (v27 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v27;
      if (os_log_type_enabled(v16, v27))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        v18 = "%{public}s called with null keyPath";
LABEL_32:
        _os_log_impl(&dword_182FBE000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v26)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v27;
      v21 = os_log_type_enabled(v16, v27);
      if (backtrace_string)
      {
        if (v21)
        {
          *(_DWORD *)buf = 136446466;
          v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
          v30 = 2082;
          v31 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s called with null keyPath, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_34:
        if (!v15)
          goto LABEL_4;
LABEL_35:
        free(v15);
        goto LABEL_4;
      }
      if (v21)
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        v18 = "%{public}s called with null keyPath, no backtrace";
        goto LABEL_32;
      }
    }
    else
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v27;
      if (os_log_type_enabled(v16, v27))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
        v18 = "%{public}s called with null keyPath, backtrace limit exceeded";
        goto LABEL_32;
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v9)
  {
    p_kvo_lock = &self->_kvo_lock;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__NWAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke;
    v24[3] = &unk_1E149F6D8;
    v25 = a5;
    v12 = v9;
    v24[4] = v12;
    v24[5] = self;
    v13 = v8;
    v24[6] = v13;
    os_unfair_lock_lock(p_kvo_lock);
    __71__NWAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke((uint64_t)v24);
    os_unfair_lock_unlock(p_kvo_lock);

    goto LABEL_4;
  }
  __nwlog_obj();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
  v15 = (char *)_os_log_send_and_compose_impl();

  v27 = OS_LOG_TYPE_ERROR;
  v26 = 0;
  if (!__nwlog_fault(v15, &v27, &v26))
    goto LABEL_34;
  if (v27 == OS_LOG_TYPE_FAULT)
  {
    __nwlog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v27;
    if (os_log_type_enabled(v16, v27))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      v18 = "%{public}s called with null object";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (!v26)
  {
    __nwlog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v27;
    if (os_log_type_enabled(v16, v27))
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      v18 = "%{public}s called with null object, backtrace limit exceeded";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v22 = (char *)__nw_create_backtrace_string();
  __nwlog_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v27;
  v23 = os_log_type_enabled(v16, v27);
  if (!v22)
  {
    if (v23)
    {
      *(_DWORD *)buf = 136446210;
      v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      v18 = "%{public}s called with null object, no backtrace";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (v23)
  {
    *(_DWORD *)buf = 136446466;
    v29 = "-[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    v30 = 2082;
    v31 = v22;
    _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s called with null object, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v22);
  if (v15)
    goto LABEL_35;
LABEL_4:

}

- (void)reset
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[6];
  uint8_t v19[128];
  _BYTE buf[24];
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NWAccumulator snapshot](self, "snapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWAccumulator setLastSnapshot:](self, "setLastSnapshot:", v3);

  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v4 = (id)gLogObj;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[NWAccumulator lastSnapshot](self, "lastSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[NWAccumulator reset]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl(&dword_182FBE000, v4, OS_LOG_TYPE_INFO, "%{public}s Reset, saved snapshot: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v21 = __Block_byref_object_copy__1673;
  v22 = __Block_byref_object_dispose__1674;
  v23 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __22__NWAccumulator_reset__block_invoke;
  v18[3] = &unk_1E14ACE40;
  v18[4] = self;
  v18[5] = buf;
  os_unfair_lock_lock(&self->_lock);
  __22__NWAccumulator_reset__block_invoke((uint64_t)v18);
  os_unfair_lock_unlock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "accumulation", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "reset");

        objc_msgSend(v10, "keyPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:](self, "registerObserverForKeyPath:ofObject:alreadyRegistered:", v12, v13, 1);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }

  _Block_object_dispose(buf, 8);
}

- (id)snapshot
{
  NWAccumulator *v3;
  void *v4;
  NWAccumulator *v5;
  os_unfair_lock_s *p_lock;
  NWAccumulator *v7;
  NWAccumulator *v8;
  _QWORD v10[6];

  v3 = [NWAccumulator alloc];
  -[NWAccumulator name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NWAccumulator initWithName:](v3, "initWithName:", v4);

  p_lock = &self->_lock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __25__NWAccumulator_snapshot__block_invoke;
  v10[3] = &unk_1E14ACE68;
  v10[4] = self;
  v7 = v5;
  v10[5] = v7;
  os_unfair_lock_lock(p_lock);
  __25__NWAccumulator_snapshot__block_invoke((uint64_t)v10);
  os_unfair_lock_unlock(p_lock);
  v8 = v7;

  return v8;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  id v5;
  os_unfair_lock_s *p_lock;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  NWAccumulator *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NWAccumulator name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_lock = &self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __41__NWAccumulator_dictionaryRepresentation__block_invoke;
  v12 = &unk_1E14ACE68;
  v13 = self;
  v14 = v5;
  v7 = v5;
  os_unfair_lock_lock(p_lock);
  __41__NWAccumulator_dictionaryRepresentation__block_invoke((uint64_t)&v9);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("durations"), v9, v10, v11, v12, v13, v14);

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NWAccumulator)lastSnapshot
{
  return self->_lastSnapshot;
}

- (void)setLastSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_lastSnapshot, a3);
}

- (NSMutableArray)accumulatedValues
{
  return self->_accumulatedValues;
}

- (void)setAccumulatedValues:(id)a3
{
  objc_storeStrong((id *)&self->_accumulatedValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accumulatedValues, 0);
  objc_storeStrong((id *)&self->_lastSnapshot, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __41__NWAccumulator_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v14;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v5);
        v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v6, "accumulation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("name"));

        objc_msgSend(v6, "accumulation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "durations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("durations"));

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

void __25__NWAccumulator_snapshot__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "snapshot", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "accumulatedValues");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __22__NWAccumulator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __71__NWAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 5, 0);
}

uint64_t __63__NWAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

void __30__NWAccumulator_accumulations__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "accumulation", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __24__NWAccumulator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

void __24__NWAccumulator_dealloc__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", v2, v3);

}

@end
