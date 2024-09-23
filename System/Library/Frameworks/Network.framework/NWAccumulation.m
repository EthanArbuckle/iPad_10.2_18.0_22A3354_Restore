@implementation NWAccumulation

- (void)updateWithState:(id)a3 atTime:(double)a4
{
  id v6;
  NSObject *v7;
  os_unfair_lock_s *p_lock;
  id v9;
  _QWORD v10[7];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  NWAccumulation *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NWAccumulation isSnapshot](self, "isSnapshot"))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v7 = (id)gLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "-[NWAccumulation updateWithState:atTime:]";
      v13 = 2112;
      v14 = self;
      v15 = 2112;
      v16 = v6;
      v17 = 2048;
      v18 = a4;
      _os_log_impl(&dword_182FBE000, v7, OS_LOG_TYPE_DEBUG, "%{public}s %@ skipping update for snapshot (state: %@ at time %f)", buf, 0x2Au);
    }

  }
  else
  {
    p_lock = &self->_lock;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__NWAccumulation_updateWithState_atTime___block_invoke;
    v10[3] = &unk_1E14AB278;
    v10[4] = self;
    v9 = v6;
    v10[5] = v9;
    *(double *)&v10[6] = a4;
    os_unfair_lock_lock(p_lock);
    __41__NWAccumulation_updateWithState_atTime___block_invoke((uint64_t)v10);
    os_unfair_lock_unlock(p_lock);

  }
}

- (BOOL)isSnapshot
{
  return self->_isSnapshot;
}

void __41__NWAccumulation_updateWithState_atTime___block_invoke(uint64_t a1)
{
  NSObject *v2;
  char *v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  char *v11;
  NSObject *v12;
  char *v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  void *v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  const char *v36;
  void *v37;
  char *backtrace_string;
  _BOOL4 v39;
  char *v40;
  _BOOL4 v41;
  char v42;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  char *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(char **)(a1 + 32);
    v4 = *(double *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136446978;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    v46 = 2112;
    v47 = v3;
    v48 = 2112;
    v49 = v4;
    v50 = 2048;
    v51 = v5;
    _os_log_impl(&dword_182FBE000, v2, OS_LOG_TYPE_DEBUG, "%{public}s %@ new state: %@ at time %f", buf, 0x2Au);
  }

  if (!*(_QWORD *)(a1 + 40))
  {
    __nwlog_obj();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    v33 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v42 = 0;
    if (!__nwlog_fault(v33, &type, &v42))
      goto LABEL_54;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state";
LABEL_52:
        _os_log_impl(&dword_182FBE000, v34, v35, v36, buf, 0xCu);
      }
    }
    else if (v42)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      v39 = os_log_type_enabled(v34, type);
      if (backtrace_string)
      {
        if (v39)
        {
          *(_DWORD *)buf = 136446466;
          v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
          v46 = 2082;
          v47 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v34, v35, "%{public}s called with null state, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
LABEL_54:
        if (!v33)
          return;
        goto LABEL_55;
      }
      if (v39)
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state, no backtrace";
        goto LABEL_52;
      }
    }
    else
    {
      __nwlog_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null state, backtrace limit exceeded";
        goto LABEL_52;
      }
    }
LABEL_53:

    goto LABEL_54;
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  if (!v7)
  {
    __nwlog_obj();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    v33 = (char *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v42 = 0;
    if (!__nwlog_fault(v33, &type, &v42))
      goto LABEL_54;
    if (type == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null _durations";
        goto LABEL_52;
      }
    }
    else
    {
      if (v42)
      {
        v40 = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = type;
        v41 = os_log_type_enabled(v34, type);
        if (v40)
        {
          if (v41)
          {
            *(_DWORD *)buf = 136446466;
            v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
            v46 = 2082;
            v47 = v40;
            _os_log_impl(&dword_182FBE000, v34, v35, "%{public}s called with null _durations, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(v40);
          if (!v33)
            return;
LABEL_55:
          free(v33);
          return;
        }
        if (!v41)
          goto LABEL_53;
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null _durations, no backtrace";
        goto LABEL_52;
      }
      __nwlog_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = type;
      if (os_log_type_enabled(v34, type))
      {
        *(_DWORD *)buf = 136446210;
        v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
        v36 = "%{public}s called with null _durations, backtrace limit exceeded";
        goto LABEL_52;
      }
    }
    goto LABEL_53;
  }
  if (!*(_QWORD *)(v6 + 32) || (v8 = *(double *)(v6 + 40), v8 == 0.0))
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v12 = (id)gLogObj;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(char **)(a1 + 32);
      v14 = *(double *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136446978;
      v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
      v46 = 2112;
      v47 = v13;
      v48 = 2112;
      v49 = v14;
      v50 = 2048;
      v51 = v15;
      _os_log_impl(&dword_182FBE000, v12, OS_LOG_TYPE_DEBUG, "%{public}s %@ initial update, state: %@ at time %f", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));
    goto LABEL_13;
  }
  v9 = *(double *)(a1 + 48) - v8;
  if (v9 < 0.0)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v10 = (id)gLogObj;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(char **)(a1 + 32);
      *(_DWORD *)buf = 136446722;
      v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
      v46 = 2112;
      v47 = v11;
      v48 = 2048;
      v49 = v9;
      _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_ERROR, "%{public}s %@ negative time delta: %f", buf, 0x20u);
    }
LABEL_13:

LABEL_14:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 48);
    return;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedLongLongValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17 + (unint64_t)v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v18, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  v19 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isEqualToString:", *(_QWORD *)(a1 + 40));
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v20 = (id)gLogObj;
  v10 = v20;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v28 = *(_QWORD *)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *(double *)(v28 + 32);
      v31 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136447746;
      v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
      v46 = 2112;
      v47 = (char *)v28;
      v48 = 2112;
      v49 = v30;
      v50 = 2048;
      v51 = v17;
      v52 = 2048;
      v53 = v17 + (unint64_t)v9;
      v54 = 2112;
      v55 = v29;
      v56 = 2048;
      v57 = v31;
      _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_INFO, "%{public}s %@ exiting state: %@, previous duration %llu, new duration %llu, entering state: %@ at time %f", buf, 0x48u);
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 40);
    v23 = *(double *)(v21 + 32);
    v24 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136447746;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    v46 = 2112;
    v47 = (char *)v21;
    v48 = 2112;
    v49 = v23;
    v50 = 2048;
    v51 = v17;
    v52 = 2048;
    v53 = v17 + (unint64_t)v9;
    v54 = 2112;
    v55 = v22;
    v56 = 2048;
    v57 = v24;
    _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_DEBUG, "%{public}s %@ exiting state: %@, previous duration %llu, new duration %llu, entering state: %@ at time %f", buf, 0x48u);
  }

  if (v9 >= 1.0)
    goto LABEL_14;
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v25 = (id)gLogObj;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = *(char **)(*(_QWORD *)(a1 + 32) + 40);
    v27 = *(double *)(a1 + 48);
    *(_DWORD *)buf = 136446722;
    v45 = "-[NWAccumulation updateWithState:atTime:]_block_invoke";
    v46 = 2048;
    v47 = v26;
    v48 = 2048;
    v49 = v27;
    _os_log_impl(&dword_182FBE000, v25, OS_LOG_TYPE_DEBUG, "%{public}s delta is less than one second, not updating timestamp from %f (ignoring new timestamp %f)", buf, 0x20u);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (NWAccumulation)initWithName:(id)a3
{
  id v5;
  NWAccumulation *v6;
  NWAccumulation *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *durations;
  NSString *currentState;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NWAccumulation;
  v6 = -[NWAccumulation init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    durations = v7->_durations;
    v7->_durations = v8;

    currentState = v7->_currentState;
    v7->_currentState = 0;

    v7->_lastUpdateTime = 0.0;
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[NWAccumulation name](v7, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v16 = "-[NWAccumulation initWithName:]";
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_DEBUG, "%{public}s NWAccumulation init %@", buf, 0x16u);

    }
  }

  return v7;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__NWAccumulation_dealloc__block_invoke;
  v5[3] = &unk_1E14ACFD0;
  v5[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __25__NWAccumulation_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)NWAccumulation;
  -[NWAccumulation dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  const char *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[NWAccumulation isSnapshot](self, "isSnapshot"))
    v4 = " [Snapshot]";
  else
    v4 = "";
  -[NWAccumulation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<NWAccumulation%s %@, states: %@>"), v4, v5, self->_durations);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)durations
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1673;
  v20 = __Block_byref_object_dispose__1674;
  v21 = 0;
  p_lock = &self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __27__NWAccumulation_durations__block_invoke;
  v15[3] = &unk_1E14ACE40;
  v15[4] = self;
  v15[5] = &v16;
  os_unfair_lock_lock(&self->_lock);
  __27__NWAccumulation_durations__block_invoke((uint64_t)v15);
  os_unfair_lock_unlock(p_lock);
  if (v17[5] && !-[NWAccumulation isSnapshot](self, "isSnapshot"))
  {
    v5 = v17[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[NWAccumulation updateWithState:atTime:](self, "updateWithState:atTime:", v5);
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1673;
  v13 = __Block_byref_object_dispose__1674;
  v14 = 0;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __27__NWAccumulation_durations__block_invoke_2;
  v8[3] = &unk_1E14ACE40;
  v8[4] = self;
  v8[5] = &v9;
  os_unfair_lock_lock(p_lock);
  __27__NWAccumulation_durations__block_invoke_2((uint64_t)v8);
  os_unfair_lock_unlock(p_lock);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v16, 8);
  return (NSMutableDictionary *)v6;
}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  _QWORD v3[5];

  p_lock = &self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __23__NWAccumulation_reset__block_invoke;
  v3[3] = &unk_1E14ACFD0;
  v3[4] = self;
  os_unfair_lock_lock(&self->_lock);
  __23__NWAccumulation_reset__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

- (id)snapshot
{
  NWAccumulation *v3;
  void *v4;
  NWAccumulation *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NWAccumulation *v9;
  _QWORD v11[7];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  NWAccumulation *v25;
  __int16 v26;
  NWAccumulation *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = [NWAccumulation alloc];
  -[NWAccumulation name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NWAccumulation initWithName:](v3, "initWithName:", v4);

  -[NWAccumulation setIsSnapshot:](v5, "setIsSnapshot:", 1);
  -[NWAccumulation durations](self, "durations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[NWAccumulation setDurations:](v5, "setDurations:", v7);

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1673;
  v20 = __Block_byref_object_dispose__1674;
  v21 = 0;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __26__NWAccumulation_snapshot__block_invoke;
  v11[3] = &unk_1E14A54F0;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  os_unfair_lock_lock(&self->_lock);
  __26__NWAccumulation_snapshot__block_invoke(v11);
  os_unfair_lock_unlock(&self->_lock);
  -[NWAccumulation setCurrentState:](v5, "setCurrentState:", v17[5]);
  -[NWAccumulation setLastUpdateTime:](v5, "setLastUpdateTime:", v13[3]);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v8 = (id)gLogObj;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v23 = "-[NWAccumulation snapshot]";
    v24 = 2112;
    v25 = self;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_182FBE000, v8, OS_LOG_TYPE_DEBUG, "%{public}s %@ created snapshot: %@", buf, 0x20u);
  }

  v9 = v5;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setDurations:(id)a3
{
  objc_storeStrong((id *)&self->_durations, a3);
}

- (NSString)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(double)a3
{
  self->_lastUpdateTime = a3;
}

- (void)setIsSnapshot:(BOOL)a3
{
  self->_isSnapshot = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_durations, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

double __26__NWAccumulation_snapshot__block_invoke(_QWORD *a1)
{
  double result;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 32));
  result = *(double *)(a1[4] + 40);
  *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

uint64_t __23__NWAccumulation_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

void __27__NWAccumulation_durations__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

void __27__NWAccumulation_durations__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __25__NWAccumulation_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

@end
