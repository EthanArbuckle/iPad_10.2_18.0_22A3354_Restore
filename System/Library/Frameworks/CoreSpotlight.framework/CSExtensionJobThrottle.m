@implementation CSExtensionJobThrottle

- (CSExtensionJobThrottle)initWithDictionary:(id)a3
{
  id v4;
  CSExtensionJobThrottle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *countersByBundleID;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSExtensionJobThrottle;
  v5 = -[CSExtensionJobThrottle init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxRetryCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxRetryCount = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minSecondsBetweenRetries"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minSecondsBetweenRetries = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxSecondsBetweenRetries"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxSecondsBetweenRetries = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("minSecondsBetweenRetriesUnderMemoryPressure"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_minSecondsBetweenRetriesUnderMemoryPressure = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxSecondsBetweenRetriesUnderMemoryPressure"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxSecondsBetweenRetriesUnderMemoryPressure = objc_msgSend(v10, "unsignedIntegerValue");

    if (v5->_minSecondsBetweenRetries > v5->_maxSecondsBetweenRetries)
      -[CSExtensionJobThrottle initWithDictionary:].cold.1();
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    countersByBundleID = v5->_countersByBundleID;
    v5->_countersByBundleID = v11;

  }
  return v5;
}

- (int64_t)nextDispatchTimeDeltaForExtension:(id)a3 job:(id)a4 memoryPressure:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  CSExtensionJobThrottle *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v29;
  unint64_t v30;
  const __CFString *v31;
  int v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  const __CFString *v47;
  uint64_t v48;

  v5 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "containerID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0x8000000000000000;
  if (v9 && v10)
  {
    v13 = self;
    objc_sync_enter(v13);
    -[CSExtensionJobThrottle countersByBundleID](v13, "countersByBundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "unsignedIntegerValue");
    v17 = v16 + 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16 + 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSExtensionJobThrottle countersByBundleID](v13, "countersByBundleID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v11);

    objc_sync_exit(v13);
    if (v5)
    {
      v20 = -[CSExtensionJobThrottle minSecondsBetweenRetriesUnderMemoryPressure](v13, "minSecondsBetweenRetriesUnderMemoryPressure");
      v21 = -[CSExtensionJobThrottle maxSecondsBetweenRetriesUnderMemoryPressure](v13, "maxSecondsBetweenRetriesUnderMemoryPressure");
    }
    else
    {
      v20 = -[CSExtensionJobThrottle minSecondsBetweenRetries](v13, "minSecondsBetweenRetries");
      v21 = -[CSExtensionJobThrottle maxSecondsBetweenRetries](v13, "maxSecondsBetweenRetries");
    }
    v22 = v21;
    if (v16
      && (v16 >= -[CSExtensionJobThrottle maxRetryCount](v13, "maxRetryCount") || v22 >= 0x7FFFFFFFFFFFFFFFLL / v16))
    {
      v12 = 0x8000000000000000;
    }
    else
    {
      v23 = v22 * v16;
      if (0x7FFFFFFFFFFFFFFFuLL >> v16 > v20 && v16 < 0x3F)
        v23 = v20 << v16;
      if (v22 < v23)
        v23 = v22;
      if (v23 <= 1)
        v25 = 1;
      else
        v25 = v23;
      v26 = 1000000000 * v25;
      if ((unint64_t)v23 <= 0x225C17D03)
        v12 = v26;
      else
        v12 = 0x8000000000000000;
    }
    logForCSLogCategoryIndex();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v29 = -[CSExtensionJobThrottle maxRetryCount](v13, "maxRetryCount");
      v32 = 138414082;
      v33 = v9;
      v30 = v12 / 0x3B9ACA00uLL;
      v34 = 2112;
      v35 = v11;
      v31 = CFSTR("NO");
      if (v12 < 0)
        v30 = -1;
      v37 = v17;
      v36 = 2048;
      v38 = 2048;
      if (v5)
        v31 = CFSTR("YES");
      v39 = v29;
      v40 = 2048;
      v41 = v30;
      v42 = 2048;
      v43 = v20;
      v44 = 2048;
      v45 = v22;
      v46 = 2112;
      v47 = v31;
      _os_log_debug_impl(&dword_18C42F000, v27, OS_LOG_TYPE_DEBUG, "job:%@, bundleID:%@, retry:%ld/max:%ld, backoff:%llds/min:%lds/max:%lds, memoryPressure:%@", (uint8_t *)&v32, 0x52u);
    }

  }
  return v12;
}

- (unint64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(unint64_t)a3
{
  self->_maxRetryCount = a3;
}

- (unint64_t)minSecondsBetweenRetries
{
  return self->_minSecondsBetweenRetries;
}

- (void)setMinSecondsBetweenRetries:(unint64_t)a3
{
  self->_minSecondsBetweenRetries = a3;
}

- (unint64_t)maxSecondsBetweenRetries
{
  return self->_maxSecondsBetweenRetries;
}

- (void)setMaxSecondsBetweenRetries:(unint64_t)a3
{
  self->_maxSecondsBetweenRetries = a3;
}

- (unint64_t)minSecondsBetweenRetriesUnderMemoryPressure
{
  return self->_minSecondsBetweenRetriesUnderMemoryPressure;
}

- (void)setMinSecondsBetweenRetriesUnderMemoryPressure:(unint64_t)a3
{
  self->_minSecondsBetweenRetriesUnderMemoryPressure = a3;
}

- (unint64_t)maxSecondsBetweenRetriesUnderMemoryPressure
{
  return self->_maxSecondsBetweenRetriesUnderMemoryPressure;
}

- (void)setMaxSecondsBetweenRetriesUnderMemoryPressure:(unint64_t)a3
{
  self->_maxSecondsBetweenRetriesUnderMemoryPressure = a3;
}

- (NSMutableDictionary)countersByBundleID
{
  return self->_countersByBundleID;
}

- (void)setCountersByBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_countersByBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countersByBundleID, 0);
}

- (void)initWithDictionary:.cold.1()
{
  __assert_rtn("-[CSExtensionJobThrottle initWithDictionary:]", "CSExtensionJobThrottle.m", 35, "_minSecondsBetweenRetries <= _maxSecondsBetweenRetries");
}

@end
