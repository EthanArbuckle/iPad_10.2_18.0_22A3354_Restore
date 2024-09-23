@implementation NWNumericAccumulator

void __48__NWNumericAccumulator_addCount_toAccumulation___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "unsignedLongLongValue");
    v6 = objc_msgSend(*(id *)(a1 + 56), "unsignedLongLongValue");
    v7 = __CFADD__(v5, v6);
    v8 = v5 + v6;
    if (v7)
    {
      if (gLogDatapath)
      {
        __nwlog_obj();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = objc_msgSend(*(id *)(a1 + 56), "unsignedLongLongValue");
          v16 = 136446978;
          v17 = "-[NWNumericAccumulator addCount:toAccumulation:]_block_invoke";
          v18 = 2082;
          v19 = "longValue";
          v20 = 2048;
          v21 = v15;
          v22 = 2048;
          v23 = v8;
          _os_log_impl(&dword_182FBE000, v14, OS_LOG_TYPE_DEBUG, "%{public}s Overflow: %{public}s, increment %llu, result %llu", (uint8_t *)&v16, 0x2Au);
        }

      }
      v8 = -1;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = *(id *)(a1 + 56);
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v10 = (id)gLogObj;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(const char **)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 40);
    v16 = 136447234;
    v17 = "-[NWNumericAccumulator addCount:toAccumulation:]_block_invoke";
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = (uint64_t)v9;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_182FBE000, v10, OS_LOG_TYPE_DEBUG, "%{public}s New value for %@: %@ (+%@), states: %@", (uint8_t *)&v16, 0x34u);
  }

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

void __46__NWNumericAccumulator_overrideStateWithName___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1[4] + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "name", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

        if (v9)
        {
          objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __44__NWNumericAccumulator_updateState_forName___block_invoke(_QWORD *a1)
{
  void *v2;
  NWAccumulatorOverrideState *v4;
  uint64_t v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
  if (v2)
    return objc_msgSend(v2, "setState:", a1[5]);
  v4 = objc_alloc_init(NWAccumulatorOverrideState);
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setName:", a1[4]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "setState:", a1[5]);
  return objc_msgSend(*(id *)(a1[6] + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));
}

void __40__NWNumericAccumulator_aggregatedStates__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v6), "state");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%@,"), v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v4);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "state");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("%@,"), v18);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "substringToIndex:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length") - 1);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

- (void)updateState:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  os_log_type_t v18;
  char *backtrace_string;
  os_log_type_t v20;
  _BOOL4 v21;
  char *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  os_log_type_t v25;
  os_log_type_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  NWNumericAccumulator *v30;
  _BYTE *v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  _BYTE v41[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v41 = 136446210;
    *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
    v14 = (char *)_os_log_send_and_compose_impl();

    buf[0] = 16;
    v32 = 0;
    if (!__nwlog_fault(v14, buf, &v32))
      goto LABEL_42;
    if (buf[0] == 17)
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = buf[0];
      if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
      {
        *(_DWORD *)v41 = 136446210;
        *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl(&dword_182FBE000, v15, v16, "%{public}s called with null state", v41, 0xCu);
      }
    }
    else if (v32)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v20 = buf[0];
      v21 = os_log_type_enabled(v15, (os_log_type_t)buf[0]);
      if (backtrace_string)
      {
        if (v21)
        {
          *(_DWORD *)v41 = 136446466;
          *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
          *(_WORD *)&v41[12] = 2082;
          *(_QWORD *)&v41[14] = backtrace_string;
          _os_log_impl(&dword_182FBE000, v15, v20, "%{public}s called with null state, dumping backtrace:%{public}s", v41, 0x16u);
        }

        free(backtrace_string);
LABEL_42:
        if (!v14)
          goto LABEL_8;
LABEL_43:
        free(v14);
        goto LABEL_8;
      }
      if (v21)
      {
        *(_DWORD *)v41 = 136446210;
        *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl(&dword_182FBE000, v15, v20, "%{public}s called with null state, no backtrace", v41, 0xCu);
      }
    }
    else
    {
      __nwlog_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      v25 = buf[0];
      if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
      {
        *(_DWORD *)v41 = 136446210;
        *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
        _os_log_impl(&dword_182FBE000, v15, v25, "%{public}s called with null state, backtrace limit exceeded", v41, 0xCu);
      }
    }
LABEL_41:

    goto LABEL_42;
  }
  if (v7)
  {
    *(_QWORD *)v41 = 0;
    *(_QWORD *)&v41[8] = v41;
    *(_QWORD *)&v41[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__1673;
    v43 = __Block_byref_object_dispose__1674;
    -[NWNumericAccumulator overrideStateWithName:](self, "overrideStateWithName:", v7);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v9 = (id)gLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&v41[8] + 40), "state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v34 = "-[NWNumericAccumulator updateState:forName:]";
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v10;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_INFO, "%{public}s Updating state of %@ from %@ to %@", buf, 0x2Au);

    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v11 = (id)gLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&v41[8] + 40), "state");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v34 = "-[NWNumericAccumulator updateState:forName:]";
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v12;
      v39 = 2112;
      v40 = v6;
      _os_log_impl(&dword_182FBE000, v11, OS_LOG_TYPE_DEBUG, "%{public}s Updating state of %@ from %@ to %@", buf, 0x2Au);

    }
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __44__NWNumericAccumulator_updateState_forName___block_invoke;
    v27[3] = &unk_1E14A2198;
    v31 = v41;
    v28 = v8;
    v29 = v6;
    v30 = self;
    os_unfair_lock_lock(&self->_lock);
    __44__NWNumericAccumulator_updateState_forName___block_invoke(v27);
    os_unfair_lock_unlock(&self->_lock);

    _Block_object_dispose(v41, 8);
    goto LABEL_8;
  }
  __nwlog_obj();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v41 = 136446210;
  *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
  v14 = (char *)_os_log_send_and_compose_impl();

  buf[0] = 16;
  v32 = 0;
  if (!__nwlog_fault(v14, buf, &v32))
    goto LABEL_42;
  if (buf[0] == 17)
  {
    __nwlog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    v18 = buf[0];
    if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
    {
      *(_DWORD *)v41 = 136446210;
      *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
      _os_log_impl(&dword_182FBE000, v15, v18, "%{public}s called with null name", v41, 0xCu);
    }
    goto LABEL_41;
  }
  if (!v32)
  {
    __nwlog_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    v26 = buf[0];
    if (os_log_type_enabled(v15, (os_log_type_t)buf[0]))
    {
      *(_DWORD *)v41 = 136446210;
      *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
      _os_log_impl(&dword_182FBE000, v15, v26, "%{public}s called with null name, backtrace limit exceeded", v41, 0xCu);
    }
    goto LABEL_41;
  }
  v22 = (char *)__nw_create_backtrace_string();
  __nwlog_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  v23 = buf[0];
  v24 = os_log_type_enabled(v15, (os_log_type_t)buf[0]);
  if (!v22)
  {
    if (v24)
    {
      *(_DWORD *)v41 = 136446210;
      *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
      _os_log_impl(&dword_182FBE000, v15, v23, "%{public}s called with null name, no backtrace", v41, 0xCu);
    }
    goto LABEL_41;
  }
  if (v24)
  {
    *(_DWORD *)v41 = 136446466;
    *(_QWORD *)&v41[4] = "-[NWNumericAccumulator updateState:forName:]";
    *(_WORD *)&v41[12] = 2082;
    *(_QWORD *)&v41[14] = v22;
    _os_log_impl(&dword_182FBE000, v15, v23, "%{public}s called with null name, dumping backtrace:%{public}s", v41, 0x16u);
  }

  free(v22);
  if (v14)
    goto LABEL_43;
LABEL_8:

}

- (id)overrideStateWithName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1673;
  v16 = __Block_byref_object_dispose__1674;
  v17 = 0;
  p_lock = &self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__NWNumericAccumulator_overrideStateWithName___block_invoke;
  v9[3] = &unk_1E14A2D98;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  os_unfair_lock_lock(p_lock);
  __46__NWNumericAccumulator_overrideStateWithName___block_invoke(v9);
  os_unfair_lock_unlock(p_lock);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)aggregatedStates
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1673;
  v10 = __Block_byref_object_dispose__1674;
  v11 = objc_alloc_init(MEMORY[0x1E0CB3940]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__NWNumericAccumulator_aggregatedStates__block_invoke;
  v5[3] = &unk_1E14ACE40;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_lock(&self->_lock);
  __40__NWNumericAccumulator_aggregatedStates__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(&self->_lock);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addCount:(id)a3 toAccumulation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_lock;
  id v11;
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
  _QWORD v24[8];
  char v25;
  os_log_type_t v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __nwlog_obj();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
    v15 = (char *)_os_log_send_and_compose_impl();

    v26 = OS_LOG_TYPE_ERROR;
    v25 = 0;
    if (!__nwlog_fault(v15, &v26, &v25))
      goto LABEL_34;
    if (v26 == OS_LOG_TYPE_FAULT)
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v26;
      if (os_log_type_enabled(v16, v26))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        v18 = "%{public}s called with null count";
LABEL_32:
        _os_log_impl(&dword_182FBE000, v16, v17, v18, buf, 0xCu);
      }
    }
    else if (v25)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v26;
      v21 = os_log_type_enabled(v16, v26);
      if (backtrace_string)
      {
        if (v21)
        {
          *(_DWORD *)buf = 136446466;
          v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
          v29 = 2082;
          v30 = backtrace_string;
          _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s called with null count, dumping backtrace:%{public}s", buf, 0x16u);
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
        v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        v18 = "%{public}s called with null count, no backtrace";
        goto LABEL_32;
      }
    }
    else
    {
      __nwlog_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v26;
      if (os_log_type_enabled(v16, v26))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
        v18 = "%{public}s called with null count, backtrace limit exceeded";
        goto LABEL_32;
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v7)
  {
    -[NWNumericAccumulator aggregatedStates](self, "aggregatedStates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    p_lock = &self->_lock;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __48__NWNumericAccumulator_addCount_toAccumulation___block_invoke;
    v24[3] = &unk_1E14AB4D8;
    v24[4] = self;
    v24[5] = v9;
    v11 = v8;
    v24[6] = v11;
    v12 = v6;
    v24[7] = v12;
    v13 = v9;
    os_unfair_lock_lock(p_lock);
    __48__NWNumericAccumulator_addCount_toAccumulation___block_invoke((uint64_t)v24);
    os_unfair_lock_unlock(p_lock);

    goto LABEL_4;
  }
  __nwlog_obj();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
  v15 = (char *)_os_log_send_and_compose_impl();

  v26 = OS_LOG_TYPE_ERROR;
  v25 = 0;
  if (!__nwlog_fault(v15, &v26, &v25))
    goto LABEL_34;
  if (v26 == OS_LOG_TYPE_FAULT)
  {
    __nwlog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v26;
    if (os_log_type_enabled(v16, v26))
    {
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
      v18 = "%{public}s called with null name";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (!v25)
  {
    __nwlog_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v26;
    if (os_log_type_enabled(v16, v26))
    {
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
      v18 = "%{public}s called with null name, backtrace limit exceeded";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  v22 = (char *)__nw_create_backtrace_string();
  __nwlog_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v26;
  v23 = os_log_type_enabled(v16, v26);
  if (!v22)
  {
    if (v23)
    {
      *(_DWORD *)buf = 136446210;
      v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
      v18 = "%{public}s called with null name, no backtrace";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (v23)
  {
    *(_DWORD *)buf = 136446466;
    v28 = "-[NWNumericAccumulator addCount:toAccumulation:]";
    v29 = 2082;
    v30 = v22;
    _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s called with null name, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v22);
  if (v15)
    goto LABEL_35;
LABEL_4:

}

- (NWNumericAccumulator)initWithName:(id)a3
{
  id v5;
  NWNumericAccumulator *v6;
  NWNumericAccumulator *v7;
  NSMutableArray *v8;
  NSMutableArray *kvoWatchers;
  NSMutableArray *v10;
  NSMutableArray *overriddenStates;
  NSMutableDictionary *v12;
  NSMutableDictionary *accumulations;
  NSObject *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NWNumericAccumulator;
  v6 = -[NWNumericAccumulator init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    *(_QWORD *)&v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    kvoWatchers = v7->_kvoWatchers;
    v7->_kvoWatchers = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    overriddenStates = v7->_overriddenStates;
    v7->_overriddenStates = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accumulations = v7->_accumulations;
    v7->_accumulations = v12;

    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v14 = (id)gLogObj;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[NWNumericAccumulator name](v7, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v19 = "-[NWNumericAccumulator initWithName:]";
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_182FBE000, v14, OS_LOG_TYPE_DEBUG, "%{public}s NWNumericAccumulator init %@", buf, 0x16u);

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
  NWNumericAccumulator *v15;
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
  v20[2] = __31__NWNumericAccumulator_dealloc__block_invoke;
  v20[3] = &unk_1E14ACE40;
  v20[4] = self;
  v20[5] = &v21;
  os_unfair_lock_lock(&self->_lock);
  __31__NWNumericAccumulator_dealloc__block_invoke((uint64_t)v20);
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
        v12 = __31__NWNumericAccumulator_dealloc__block_invoke_2;
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
  v10.super_class = (Class)NWNumericAccumulator;
  -[NWNumericAccumulator dealloc](&v10, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NWNumericAccumulator name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWNumericAccumulator kvoWatchers](self, "kvoWatchers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<NWNumericAccumulator %@, NWAccumulatorKVOWatchers: %zu>"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)watcherForObject:(id)a3 andKeyPath:(id)a4
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
  v13[2] = __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke;
  v13[3] = &unk_1E14A2198;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  os_unfair_lock_lock(p_lock);
  __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke(v13);
  os_unfair_lock_unlock(p_lock);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)addAccumulation:(id)a3 forKey:(id)a4 stateCallback:(id)a5
{
  -[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:](self, "addAccumulation:withName:forKey:stateCallback:", a3, a4, a4, a5);
}

- (void)addAccumulation:(id)a3 withName:(id)a4 forKey:(id)a5 stateCallback:(id)a6
{
  NWNumericAccumulator *v10;
  id v11;
  NWNumericAccumulator *v12;
  id v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NWNumericAccumulator *v18;
  NWAccumulatorKVOWatcher *v19;
  NWAccumulatorKVOWatcher *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  NWNumericAccumulator *v25;
  NWAccumulatorKVOWatcher *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  NWNumericAccumulator *v30;
  __int16 v31;
  NWNumericAccumulator *v32;
  __int16 v33;
  NSObject *p_super;
  __int16 v35;
  NWNumericAccumulator *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = (NWNumericAccumulator *)a3;
  v11 = a4;
  v12 = (NWNumericAccumulator *)a5;
  v13 = a6;
  v14 = v13;
  if (v10 && v12 && v13)
  {
    -[NWNumericAccumulator watcherForObject:andKeyPath:](self, "watcherForObject:andKeyPath:", v10, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v16 = (id)gLogObj;
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 136447234;
        v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v12;
        v33 = 2112;
        p_super = v15;
        v35 = 2112;
        v36 = v12;
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_INFO, "%{public}s Existing NWAccumulatorKVOWatcher for object: %@ and keyPath: %@: %@, resetting %@", buf, 0x34u);
      }

      -[NSObject setCallback:](v15, "setCallback:", v14);
      -[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:](self, "registerObserverForKeyPath:ofObject:alreadyRegistered:", v12, v10, 1);
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 136446722;
        v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v12;
        _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_INFO, "%{public}s Adding new NWAccumulatorKVOWatcher for object: %@ and keyPath: %@", buf, 0x20u);
      }

      v19 = objc_alloc_init(NWAccumulatorKVOWatcher);
      -[NWAccumulatorKVOWatcher setName:](v19, "setName:", v11);
      -[NWAccumulatorKVOWatcher setObject:](v19, "setObject:", v10);
      -[NWAccumulatorKVOWatcher setKeyPath:](v19, "setKeyPath:", v12);
      -[NWAccumulatorKVOWatcher setCallback:](v19, "setCallback:", v14);
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke;
      v24 = &unk_1E14ACE68;
      v25 = self;
      v26 = v19;
      v20 = v19;
      os_unfair_lock_lock(&self->_lock);
      __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke((uint64_t)&v21);
      os_unfair_lock_unlock(&self->_lock);
      -[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:](self, "registerObserverForKeyPath:ofObject:alreadyRegistered:", v12, v10, 0, v21, v22, v23, v24, v25, v26);

      v15 = 0;
    }
  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v18 = (NWNumericAccumulator *)_Block_copy(v14);
      *(_DWORD *)buf = 136447234;
      v28 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]";
      v29 = 2112;
      v30 = self;
      v31 = 2112;
      v32 = v10;
      v33 = 2112;
      p_super = &v12->super;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_182FBE000, v15, OS_LOG_TYPE_ERROR, "%{public}s %@ invalid value passed to addAccumulation: object (%@), key (%@), callback (%@)", buf, 0x34u);

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
    v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
        v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
          v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
        v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
        v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
    v24[2] = __78__NWNumericAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke;
    v24[3] = &unk_1E149F6D8;
    v25 = a5;
    v12 = v9;
    v24[4] = v12;
    v24[5] = self;
    v13 = v8;
    v24[6] = v13;
    os_unfair_lock_lock(p_kvo_lock);
    __78__NWNumericAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke((uint64_t)v24);
    os_unfair_lock_unlock(p_kvo_lock);

    goto LABEL_4;
  }
  __nwlog_obj();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 136446210;
  v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
      v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
      v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
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
      v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
      v18 = "%{public}s called with null object, no backtrace";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  if (v23)
  {
    *(_DWORD *)buf = 136446466;
    v29 = "-[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:]";
    v30 = 2082;
    v31 = v22;
    _os_log_impl(&dword_182FBE000, v16, v17, "%{public}s called with null object, dumping backtrace:%{public}s", buf, 0x16u);
  }

  free(v22);
  if (v15)
    goto LABEL_35;
LABEL_4:

}

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
  int v17;
  const char *v18;
  __int16 v19;
  NWNumericAccumulator *v20;
  __int16 v21;
  NSObject *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[NWNumericAccumulator watcherForObject:andKeyPath:](self, "watcherForObject:andKeyPath:", v10, v9);
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
      v17 = 136447490;
      v18 = "-[NWNumericAccumulator observeValueForKeyPath:ofObject:change:context:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v9;
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_182FBE000, v16, OS_LOG_TYPE_DEBUG, "%{public}s %@ observing value %@ for keyPath %@ of object %@, state: %@", (uint8_t *)&v17, 0x3Eu);
    }

    if (v15)
      objc_msgSend(v12, "updateWithState:", v15);

  }
  else
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v13 = (id)gLogObj;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446722;
      v18 = "-[NWNumericAccumulator observeValueForKeyPath:ofObject:change:context:]";
      v19 = 2112;
      v20 = self;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_ERROR, "%{public}s %@ did not find value for object: %@", (uint8_t *)&v17, 0x20u);
    }
  }

}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1673;
  v20 = __Block_byref_object_dispose__1674;
  v21 = 0;
  p_lock = &self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __29__NWNumericAccumulator_reset__block_invoke;
  v15[3] = &unk_1E14ACE40;
  v15[4] = self;
  v15[5] = &v16;
  os_unfair_lock_lock(&self->_lock);
  __29__NWNumericAccumulator_reset__block_invoke((uint64_t)v15);
  os_unfair_lock_unlock(p_lock);
  -[NSMutableDictionary removeAllObjects](self->_accumulations, "removeAllObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)v17[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "keyPath", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWNumericAccumulator registerObserverForKeyPath:ofObject:alreadyRegistered:](self, "registerObserverForKeyPath:ofObject:alreadyRegistered:", v9, v10, 1);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v16, 8);
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
  NWNumericAccumulator *v13;
  id v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NWNumericAccumulator name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("name"));

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  p_lock = &self->_lock;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke;
  v12 = &unk_1E14ACE68;
  v13 = self;
  v14 = v5;
  v7 = v5;
  os_unfair_lock_lock(p_lock);
  __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke((uint64_t)&v9);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("states"), v9, v10, v11, v12, v13, v14);

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

- (NSMutableDictionary)accumulations
{
  return self->_accumulations;
}

- (void)setAccumulations:(id)a3
{
  objc_storeStrong((id *)&self->_accumulations, a3);
}

- (NSMutableArray)kvoWatchers
{
  return self->_kvoWatchers;
}

- (void)setKvoWatchers:(id)a3
{
  objc_storeStrong((id *)&self->_kvoWatchers, a3);
}

- (NSMutableArray)overriddenStates
{
  return self->_overriddenStates;
}

- (void)setOverriddenStates:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenStates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overriddenStates, 0);
  objc_storeStrong((id *)&self->_kvoWatchers, 0);
  objc_storeStrong((id *)&self->_accumulations, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 24);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_2;
  v4[3] = &unk_1E149A660;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  _BYTE *v30;
  NSObject *v31;
  os_log_type_t v32;
  const char *v33;
  char *backtrace_string;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  _BYTE *v38;
  _QWORD v39[4];
  id v40;
  char v41;
  os_log_type_t type;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  if (v11 == objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count") + v12)
  {
    v38 = a4;
    if (!objc_msgSend(v10, "count"))
    {
LABEL_15:
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_151;
      v39[3] = &unk_1E149A638;
      v28 = v9;
      v40 = v28;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v39);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v28);

      goto LABEL_35;
    }
    v13 = 0;
    while (1)
    {
      v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
      v15 = *(_QWORD *)(a1 + 32);
      if (v13 >= v14)
      {
        v18 = *(void **)(v15 + 40);
        v17 = v13 - objc_msgSend(*(id *)(v15 + 32), "count");
        v16 = v18;
      }
      else
      {
        v16 = *(void **)(v15 + 32);
        v17 = v13;
      }
      objc_msgSend(v16, "objectAtIndex:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "objectAtIndex:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v22 = (id)gLogObj;
      v23 = v22;
      if (!v20)
        break;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446722;
        v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
        v45 = 2112;
        v46 = (uint64_t)v20;
        v47 = 2112;
        v48 = (uint64_t)v21;
        _os_log_impl(&dword_182FBE000, v23, OS_LOG_TYPE_DEBUG, "%{public}s Processing name %@ state %@", buf, 0x20u);
      }

      objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, v20);
      if (++v13 >= objc_msgSend(v10, "count"))
        goto LABEL_15;
    }
    *(_DWORD *)buf = 136446466;
    v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
    v45 = 2112;
    v46 = (uint64_t)v21;
    v29 = (void *)_os_log_send_and_compose_impl();

    type = OS_LOG_TYPE_ERROR;
    v41 = 0;
    v30 = v38;
    if (!__nwlog_fault((const char *)v29, &type, &v41))
    {
LABEL_30:
      if (!v29)
      {
LABEL_32:
        if (v30)
          *v30 = 1;

        goto LABEL_35;
      }
LABEL_31:
      free(v29);
      goto LABEL_32;
    }
    if (type == OS_LOG_TYPE_FAULT)
    {
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v31 = (id)gLogObj;
      v32 = type;
      if (!os_log_type_enabled(v31, type))
      {
LABEL_29:

        goto LABEL_30;
      }
      *(_DWORD *)buf = 136446466;
      v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
      v45 = 2112;
      v46 = (uint64_t)v21;
      v33 = "%{public}s failed to get name for state: %@";
    }
    else
    {
      if (v41)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v35 = (id)gLogObj;
        v36 = type;
        v37 = os_log_type_enabled(v35, type);
        if (backtrace_string)
        {
          if (v37)
          {
            *(_DWORD *)buf = 136446722;
            v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
            v45 = 2112;
            v46 = (uint64_t)v21;
            v47 = 2082;
            v48 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_182FBE000, v35, v36, "%{public}s failed to get name for state: %@, dumping backtrace:%{public}s", buf, 0x20u);
          }

          free(backtrace_string);
          v30 = v38;
          if (!v29)
            goto LABEL_32;
        }
        else
        {
          if (v37)
          {
            *(_DWORD *)buf = 136446466;
            v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
            v45 = 2112;
            v46 = (uint64_t)v21;
            _os_log_impl(&dword_182FBE000, v35, v36, "%{public}s failed to get name for state: %@, no backtrace", buf, 0x16u);
          }

          v30 = v38;
          if (!v29)
            goto LABEL_32;
        }
        goto LABEL_31;
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      v31 = (id)gLogObj;
      v32 = type;
      if (!os_log_type_enabled(v31, type))
        goto LABEL_29;
      *(_DWORD *)buf = 136446466;
      v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke";
      v45 = 2112;
      v46 = (uint64_t)v21;
      v33 = "%{public}s failed to get name for state: %@, backtrace limit exceeded";
    }
    _os_log_impl(&dword_182FBE000, v31, v32, v33, buf, 0x16u);
    goto LABEL_29;
  }
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v24 = (id)gLogObj;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = objc_msgSend(v10, "count");
    v26 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
    v27 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
    *(_DWORD *)buf = 136446978;
    v44 = "-[NWNumericAccumulator dictionaryRepresentation]_block_invoke_2";
    v45 = 2048;
    v46 = v25;
    v47 = 2048;
    v48 = v26;
    v49 = 2048;
    v50 = v27;
    _os_log_impl(&dword_182FBE000, v24, OS_LOG_TYPE_ERROR, "%{public}s Components count (%zu) != kvoWatchers count (%zu) + overriddenStates count (%zu)", buf, 0x2Au);
  }

  if (a4)
    *a4 = 1;
LABEL_35:

}

uint64_t __48__NWNumericAccumulator_dictionaryRepresentation__block_invoke_151(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __29__NWNumericAccumulator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "mutableCopy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __78__NWNumericAccumulator_registerObserverForKeyPath_ofObject_alreadyRegistered___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:forKeyPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 5, 0);
}

void __70__NWNumericAccumulator_addAccumulation_withName_forKey_stateCallback___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  v2 = (id)gLogObj;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
    v4 = 136446466;
    v5 = "-[NWNumericAccumulator addAccumulation:withName:forKey:stateCallback:]_block_invoke";
    v6 = 2048;
    v7 = v3;
    _os_log_impl(&dword_182FBE000, v2, OS_LOG_TYPE_DEBUG, "%{public}s Now have %zu watchers", (uint8_t *)&v4, 0x16u);
  }

}

void __52__NWNumericAccumulator_watcherForObject_andKeyPath___block_invoke(_QWORD *a1)
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

void __31__NWNumericAccumulator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

}

void __31__NWNumericAccumulator_dealloc__block_invoke_2(uint64_t a1)
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
