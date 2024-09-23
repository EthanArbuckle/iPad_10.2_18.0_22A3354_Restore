@implementation _CDMemoryUsageIntervalTracker

+ (id)sharedInstance
{
  objc_opt_self();
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_instance;
}

- (void)endInterval:(uint64_t)a1
{
  _QWORD *v3;
  os_unfair_lock_s *v4;
  unint64_t v5;
  unint64_t v6;
  const char *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  _BOOL4 v22;
  _BOOL4 v24;
  NSObject *v25;
  NSObject *v26;
  char v27;
  os_log_type_t v28;
  __CFString *v29;
  uint64x2_t v30;
  const char *v31;
  float64x2_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  int v38;
  float64x2_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  os_unfair_lock_s *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  unint64_t v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  __CFString *v58;
  __int16 v59;
  float64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  float64_t v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  double v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  uint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v50 = 0;
    get_memory_usage(v3 + 3, &v50, v3 + 4, 0);
    if (v3)
    {
      v5 = v3[11];
      v6 = v50;
      if (v5 >= v50)
      {
        v50 = v3[11];
        v7 = "*";
        v6 = v5;
      }
      else
      {
        v7 = "";
      }
      v3[12] = v6;
    }
    else if (v50)
    {
      v7 = "";
    }
    else
    {
      v50 = 0;
      v7 = "*";
    }
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v75, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v47;
      v12 = "*";
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v13);
          if (v14)
          {
            v15 = v50;
            v16 = *(_QWORD *)(v14 + 80);
            if (*(_QWORD *)(v14 + 88) > v50)
              v15 = *(_QWORD *)(v14 + 88);
            *(_QWORD *)(v14 + 88) = v15;
          }
          else
          {
            v16 = 0;
          }
          objc_msgSend(v8, "addIndex:", v16);
          ++v13;
        }
        while (v10 != v13);
        v17 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v75, 16);
        v10 = v17;
      }
      while (v17);
    }
    else
    {
      v12 = "";
    }

    if (v3)
      v18 = v3[1];
    else
      v18 = 0;
    v19 = *(_QWORD *)(a1 + 24);
    v20 = (double)v19;
    v21 = (double)v19 * 0.9;
    v22 = v21 < (double)v50 && v21 > (double)v18;
    v24 = v18 < v19 && v50 > v19;
    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v22)
      v27 = 16;
    else
      v27 = 2;
    if (v24)
      v28 = OS_LOG_TYPE_FAULT;
    else
      v28 = v27;
    if (os_log_type_enabled(v25, v28))
    {
      v44 = v7;
      v45 = v4;
      v43 = v12;
      if (v3)
        v41 = v3[10];
      else
        v41 = 0;
      objc_msgSend(v3, "name");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "client");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v29 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("error: operation peaked over limit of %.0fMB "), v20 * 0.0009765625 * 0.0009765625);
        v38 = 0;
      }
      else if (v22)
      {
        v29 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("warning: operation peaked near limit of %.0fMB "), v20 * 0.0009765625 * 0.0009765625);
        v38 = 1;
      }
      else
      {
        v38 = 0;
        v29 = &stru_1E26E9728;
      }
      if (v3)
      {
        if (*((_BYTE *)v3 + 64))
          v31 = "*";
        else
          v31 = "";
        v30.i64[1] = v3[1];
        v30.i64[0] = v3[12];
        v32 = (float64x2_t)vdupq_n_s64(0x3F50000000000000uLL);
        v39 = vmulq_f64(vmulq_f64(vcvtq_f64_u64(v30), v32), v32);
        v33 = (double)(unint64_t)v3[3] * 0.0009765625 * 0.0009765625;
      }
      else
      {
        v39 = 0u;
        v33 = 0.0;
        v31 = "";
      }
      v34 = objc_msgSend(v8, "count");
      objc_msgSend(v8, "_cd_commaSeparatedIndexes");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      *(_DWORD *)buf = 134220802;
      v37 = ", concurrent: ";
      v52 = v41;
      if (!v34)
        v37 = "";
      v53 = 2112;
      v54 = v42;
      v55 = 2112;
      v56 = v40;
      v57 = 2114;
      v58 = v29;
      v59 = 2048;
      v60 = v39.f64[1];
      v61 = 2082;
      v62 = v31;
      v63 = 2048;
      v64 = v39.f64[0];
      v65 = 2082;
      v66 = v44;
      v67 = 2048;
      v68 = v33;
      v69 = 2082;
      v70 = v43;
      v71 = 2082;
      v72 = v37;
      v73 = 2114;
      v74 = v35;
      _os_log_impl(&dword_18DDBE000, v26, v28, "[end]   id=%lu name=%@ client=%@ %{public}@(start: %.1fMB%{public}s, peak: %.1fMB%{public}s, end: %.1fMB%{public}s%{public}s%{public}@)", buf, 0x7Au);

      v4 = v45;
      if (v38)

      if (v24)
    }

    os_unfair_lock_unlock(v4);
  }

}

- (void)beginInterval:(uint64_t)a1
{
  _QWORD *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *context;
  os_unfair_lock_s *lock;
  void *v29;
  _QWORD *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  unint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    context = (void *)MEMORY[0x193FEE914]();
    lock = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    v4 = (*(_QWORD *)(a1 + 16) + 1) % 0x7FFFFFFFFFFFFFFEuLL;
    if (v4 <= 1)
      v4 = 1;
    *(_QWORD *)(a1 + 16) = v4;
    if (v3)
      v3[10] = v4;
    v36 = 0;
    get_memory_usage(v3 + 1, &v36, v3 + 2, 1);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v33;
      v29 = v5;
      v30 = v3;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v33 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * v8);
          if (v9)
          {
            v10 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX) - v9[7];
            if (v10 > *(_QWORD *)(a1 + 40))
            {
              +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                v14 = v9[10];
                objc_msgSend(v9, "name");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "client");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218754;
                v38 = v14;
                v39 = 2112;
                v40 = v15;
                v41 = 2112;
                v42 = v16;
                v43 = 2048;
                v44 = v10 / 0x3B9ACA00;
                _os_log_error_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_ERROR, "[error] id=%lu name=%@ client=%@ tracking stopped due to age %llus", buf, 0x2Au);

                v5 = v29;
                v3 = v30;

              }
              v9[6] = 2;
              objc_msgSend(*(id *)(a1 + 32), "removeObject:", v9);
              goto LABEL_21;
            }
            v12 = v36;
            v13 = v9[10];
            if (v9[11] > v36)
              v12 = v9[11];
            v9[11] = v12;
          }
          else
          {
            v13 = 0;
          }
          objc_msgSend(v31, "addIndex:", v13, context, lock);
          if (v3)
            *((_BYTE *)v3 + 64) = 1;
LABEL_21:
          ++v8;
        }
        while (v6 != v8);
        v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
        v6 = v17;
      }
      while (v17);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    +[_CDLogging instrumentationChannel](_CDLogging, "instrumentationChannel");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      if (v3)
        v19 = v3[10];
      else
        v19 = 0;
      objc_msgSend(v3, "name", context);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "client");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v22 = (double)(unint64_t)v3[1] * 0.0009765625 * 0.0009765625;
        v23 = *((_BYTE *)v3 + 64) != 0;
      }
      else
      {
        v23 = 0;
        v22 = 0.0;
      }
      objc_msgSend(v31, "_cd_commaSeparatedIndexes");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = "";
      *(_DWORD *)buf = 134219266;
      v38 = v19;
      v39 = 2112;
      if (v23)
        v26 = "*, concurrent: ";
      v40 = v20;
      v41 = 2112;
      v42 = v21;
      v43 = 2048;
      v44 = *(_QWORD *)&v22;
      v45 = 2082;
      v46 = v26;
      v47 = 2114;
      v48 = v24;
      _os_log_debug_impl(&dword_18DDBE000, v18, OS_LOG_TYPE_DEBUG, "[begin] id=%ld name=%@ client=%@ (start: %.1fMB%{public}s%{public}@)", buf, 0x3Eu);

    }
    os_unfair_lock_unlock(lock);
    objc_autoreleasePoolPop(context);
  }

}

- (_CDMemoryUsageIntervalTracker)init
{
  _CDMemoryUsageIntervalTracker *v2;
  _CDMemoryUsageIntervalTracker *v3;
  int v4;
  uint64_t v5;
  NSHashTable *activeIntervals;
  _CDMemoryUsageIntervalTracker *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_CDMemoryUsageIntervalTracker;
  v2 = -[_CDMemoryUsageIntervalTracker init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    if (active_memory_limit_onceToken != -1)
      dispatch_once(&active_memory_limit_onceToken, &__block_literal_global_1);
    v4 = active_memory_limit_limit;
    v3->_activeMemoryLimit = active_memory_limit_limit;
    if (!v4)
    {
      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    activeIntervals = v3->_activeIntervals;
    v3->_activeIntervals = (NSHashTable *)v5;

    v3->_intervalTimeout = 60000000000;
  }
  v7 = v3;
LABEL_8:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeIntervals, 0);
}

@end
