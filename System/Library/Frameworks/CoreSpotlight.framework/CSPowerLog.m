@implementation CSPowerLog

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CSPowerLog_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, block);
  return (id)sharedInstance_sharedInstance_1;
}

- (void)_addToDictionary:(int64_t)a3 bundleID:(id)a4 itemCount:(unint64_t)a5 reason:(id)a6
{
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v20 = a4;
  v10 = (__CFString *)a6;
  +[CSDeviceListener sharedListener](CSDeviceListener, "sharedListener");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "onBattery");

  if (v12 != -[CSPowerLog onBattery](self, "onBattery"))
    -[CSPowerLog flush](self, "flush");
  if ((unint64_t)-[__CFString length](v10, "length") < 0x21)
  {
    if (v10)
      goto LABEL_7;
  }
  else
  {

  }
  v10 = CFSTR("Unknown");
LABEL_7:
  objc_msgSend((id)objc_opt_class(), "keyNameForOperation:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&logLock);
  -[CSPowerLog reasonedOperationsByBundleID](self, "reasonedOperationsByBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v20);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CSPowerLog reasonedOperationsByBundleID](self, "reasonedOperationsByBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v20);

  }
  objc_msgSend(v15, "objectForKeyedSubscript:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", v19, v13, 0);

    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v10);
  }
  -[CSPowerLog updateDictionaryAndUnlock:cacheCount:keyName:operationDictionary:](self, "updateDictionaryAndUnlock:cacheCount:keyName:operationDictionary:", a5, 1, v13, v17);

}

+ (id)keyNameForOperation:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 8)
    return CFSTR("unknown");
  else
    return off_1E2405340[a3 - 1];
}

- (void)updateDictionaryAndUnlock:(unint64_t)a3 cacheCount:(int64_t)a4 keyName:(id)a5 operationDictionary:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  id v20;

  v10 = a6;
  v11 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  v20 = v12;
  if (v12)
    a3 += objc_msgSend(v12, "unsignedIntegerValue");
  objc_msgSend(v13, "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v11);

  +[CSDeviceListener sharedListener](CSDeviceListener, "sharedListener");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPowerLog setOnBattery:](self, "setOnBattery:", objc_msgSend(v15, "onBattery"));

  v16 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  if (-[CSPowerLog cachedCount](self, "cachedCount") + a4 > 0x1388
    || (-[CSPowerLog startFlushDate](self, "startFlushDate"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "timeIntervalSinceDate:", v17),
        v19 = v18,
        v17,
        v19 >= 1800.0))
  {
    -[CSPowerLog flushToPowerLog_locked_and_unlock](self, "flushToPowerLog_locked_and_unlock");
  }
  else
  {
    -[CSPowerLog setCachedCount:](self, "setCachedCount:", -[CSPowerLog cachedCount](self, "cachedCount") + a4);
    os_unfair_lock_unlock(&logLock);
  }

}

- (unint64_t)cachedCount
{
  return self->_cachedCount;
}

- (void)setCachedCount:(unint64_t)a3
{
  self->_cachedCount = a3;
}

- (NSMutableDictionary)reasonedOperationsByBundleID
{
  return self->_reasonedOperationsByBundleID;
}

- (NSMutableDictionary)operationsByBundleID
{
  return self->_operationsByBundleID;
}

- (void)updateDictionaryAndUnlock:(unint64_t)a3 keyName:(id)a4 operationDictionary:(id)a5
{
  -[CSPowerLog updateDictionaryAndUnlock:cacheCount:keyName:operationDictionary:](self, "updateDictionaryAndUnlock:cacheCount:keyName:operationDictionary:", a3, a3, a4, a5);
}

- (CSPowerLog)logWithBundleID:(id)a3 indexOperation:(int64_t)a4 itemCount:(unint64_t)a5 reason:(id)a6
{
  if (a3)
  {
    if (a5)
      return (CSPowerLog *)-[CSPowerLog _addToDictionary:bundleID:itemCount:reason:](self, "_addToDictionary:bundleID:itemCount:reason:", a4, a3, a5, a6);
  }
  return self;
}

uint64_t __28__CSPowerLog_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

  return atexit_b(&__block_literal_global_32);
}

- (CSPowerLog)init
{
  CSPowerLog *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSPowerLog;
  v2 = -[CSPowerLog init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CSPowerLog setOperationsByBundleID:](v2, "setOperationsByBundleID:", v3);

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CSPowerLog setReasonedOperationsByBundleID:](v2, "setReasonedOperationsByBundleID:", v4);

    v5 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    -[CSPowerLog setStartFlushDate:](v2, "setStartFlushDate:", v5);

    v6 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    -[CSPowerLog setEndFlushDate:](v2, "setEndFlushDate:", v6);

    -[CSPowerLog setCachedCount:](v2, "setCachedCount:", 0);
    +[CSDeviceListener sharedListener](CSDeviceListener, "sharedListener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSPowerLog setOnBattery:](v2, "setOnBattery:", objc_msgSend(v7, "onBattery"));

  }
  return v2;
}

- (void)setReasonedOperationsByBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_reasonedOperationsByBundleID, a3);
}

- (void)setOperationsByBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_operationsByBundleID, a3);
}

uint64_t __28__CSPowerLog_sharedInstance__block_invoke_2()
{
  return objc_msgSend((id)sharedInstance_sharedInstance_1, "flush");
}

- (CSPowerLog)logWithBundleID:(id)a3 indexOperation:(int64_t)a4 itemCount:(unint64_t)a5 code:(int64_t)a6
{
  if (a3)
  {
    if (a5)
      return (CSPowerLog *)-[CSPowerLog _addToDictionary:bundleID:itemCount:code:](self, "_addToDictionary:bundleID:itemCount:code:", a4, a3, a5, a6);
  }
  return self;
}

- (void)_addToDictionary:(int64_t)a3 bundleID:(id)a4 itemCount:(unint64_t)a5 code:(int64_t)a6
{
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v20 = a4;
  +[CSDeviceListener sharedListener](CSDeviceListener, "sharedListener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "onBattery");

  if (v11 != -[CSPowerLog onBattery](self, "onBattery"))
    -[CSPowerLog flush](self, "flush");
  objc_msgSend((id)objc_opt_class(), "keyNameForOperation:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&logLock);
  -[CSPowerLog operationsByBundleID](self, "operationsByBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CSPowerLog operationsByBundleID](self, "operationsByBundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v13);

  }
  objc_msgSend(v15, "objectForKeyedSubscript:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v15, "setObject:forKey:", v18, v20);

  }
  objc_msgSend(v15, "objectForKeyedSubscript:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPowerLog updateDictionaryAndUnlock:keyName:operationDictionary:](self, "updateDictionaryAndUnlock:keyName:operationDictionary:", a5, v12, v19);

}

- (void)flushToPowerLog_locked_and_unlock
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  CSPowerLog *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v39 = self;
  -[CSPowerLog operationsByBundleID](self, "operationsByBundleID");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v34)
  {
    v32 = *(_QWORD *)v50;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(obj);
        v35 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v3);
        v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        -[CSPowerLog operationsByBundleID](v39, "operationsByBundleID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = v7;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v46;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v46 != v10)
                objc_enumerationMutation(v37);
              v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v11);
              v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v4, CFSTR("reason"), 0);
              -[CSPowerLog operationsByBundleID](v39, "operationsByBundleID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", v4);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addEntriesFromDictionary:", v16);

              objc_msgSend(v5, "setObject:forKey:", v13, v12);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v9);
        }

        objc_msgSend(v33, "addObject:", v5);
        v3 = v35 + 1;
      }
      while (v35 + 1 != v34);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v34);
  }

  -[CSPowerLog reasonedOperationsByBundleID](v39, "reasonedOperationsByBundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CSPowerLog setOperationsByBundleID:](v39, "setOperationsByBundleID:", v18);

  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CSPowerLog setReasonedOperationsByBundleID:](v39, "setReasonedOperationsByBundleID:", v19);

  -[CSPowerLog startFlushDate](v39, "startFlushDate");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  -[CSPowerLog endFlushDate](v39, "endFlushDate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSPowerLog setStartFlushDate:](v39, "setStartFlushDate:");
  v20 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  -[CSPowerLog setEndFlushDate:](v39, "setEndFlushDate:", v20);

  -[CSPowerLog setCachedCount:](v39, "setCachedCount:", 0);
  os_unfair_lock_unlock(&logLock);
  if (objc_msgSend(v17, "count") || v33)
  {
    if (objc_msgSend(v33, "count"))
    {
      v40 = v17;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v21 = v33;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v42;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v42 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v25);
            if (PLShouldLogRegisteredEvent())
            {
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v38, CFSTR("timestamp"));
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v36, CFSTR("timestampEnd"));
              objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "processName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("processName"));

              PLLogRegisteredEvent();
            }
            ++v25;
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        }
        while (v23);
      }

      v17 = v40;
    }
    if (objc_msgSend(v17, "count") && PLShouldLogRegisteredEvent())
    {
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v38, CFSTR("timestamp"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("timestampEnd"));
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "processName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("processName"));

      PLLogRegisteredEvent();
    }
  }

}

- (void)flush
{
  os_unfair_lock_lock(&logLock);
  -[CSPowerLog flushToPowerLog_locked_and_unlock](self, "flushToPowerLog_locked_and_unlock");
}

- (NSDate)startFlushDate
{
  return self->_startFlushDate;
}

- (void)setStartFlushDate:(id)a3
{
  objc_storeStrong((id *)&self->_startFlushDate, a3);
}

- (NSDate)endFlushDate
{
  return self->_endFlushDate;
}

- (void)setEndFlushDate:(id)a3
{
  objc_storeStrong((id *)&self->_endFlushDate, a3);
}

- (BOOL)onBattery
{
  return self->_onBattery;
}

- (void)setOnBattery:(BOOL)a3
{
  self->_onBattery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endFlushDate, 0);
  objc_storeStrong((id *)&self->_startFlushDate, 0);
  objc_storeStrong((id *)&self->_reasonedOperationsByBundleID, 0);
  objc_storeStrong((id *)&self->_operationsByBundleID, 0);
}

@end
