@implementation HDDiagnosticManager

- (void)removeObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_objects, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)addObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_objects, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

+ (id)sharedDiagnosticManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__HDDiagnosticManager_sharedDiagnosticManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDiagnosticManager_onceToken != -1)
    dispatch_once(&sharedDiagnosticManager_onceToken, block);
  return (id)sharedDiagnosticManager___sharedDiagnosticManager;
}

void __46__HDDiagnosticManager_sharedDiagnosticManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDiagnosticManager___sharedDiagnosticManager;
  sharedDiagnosticManager___sharedDiagnosticManager = (uint64_t)v1;

}

- (HDDiagnosticManager)init
{
  HDDiagnosticManager *v2;
  uint64_t v3;
  NSHashTable *objects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HDDiagnosticManager;
  v2 = -[HDDiagnosticManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    objects = v2->_objects;
    v2->_objects = (NSHashTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)logAllDiagnostics
{
  id v2;

  v2 = -[HDDiagnosticManager _diagnosticsForKeys:shouldLog:](self, "_diagnosticsForKeys:shouldLog:", 0, 1);
}

- (id)diagnosticsForKeys:(id)a3
{
  return -[HDDiagnosticManager _diagnosticsForKeys:shouldLog:](self, "_diagnosticsForKeys:shouldLog:", a3, 0);
}

- (id)_diagnosticsForKeys:(id)a3 shouldLog:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  _BOOL4 v40;
  id v41;
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
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v40 = a4;
  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[HDDiagnosticManager _diagnosticsOverview](self, "_diagnosticsOverview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LogOrAppend(v6, v41, v40);

  }
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_objects, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v51 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "count") || objc_msgSend(v5, "containsObject:", v15))
        {
          objc_msgSend(v37, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setObject:forKeyedSubscript:", v16, v15);
          }
          objc_msgSend(v16, "addObject:", v13);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v10);
  }
  v32 = v8;
  v33 = v5;

  objc_msgSend(v37, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v18;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v47;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v47 != v35)
          objc_enumerationMutation(obj);
        v39 = v19;
        v20 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v19);
        objc_msgSend(v37, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n======== %@ =========="), v20);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        _LogOrAppend(v38, v41, v40);
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v22 = v21;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v43;
          do
          {
            for (j = 0; j != v24; ++j)
            {
              if (*(_QWORD *)v43 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              v28 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v27, "diagnosticDescription");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@:%p> %@"), v20, v27, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              _LogOrAppend(v30, v41, v40);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
          }
          while (v24);
        }

        v19 = v39 + 1;
      }
      while (v39 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v36);
  }

  return v41;
}

- (id)_diagnosticsOverview
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("======== Overview ==========\n"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("Date: %@\n"), v4);

  objc_msgSend(MEMORY[0x24BDD4198], "currentDeviceProductType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("Device: %@\n"), v5);

  if (objc_msgSend(MEMORY[0x24BDD4198], "isAppleInternalInstall"))
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentInternalDeviceModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "appendFormat:", CFSTR("Internal Model: %@\n"), v7);

  }
  objc_msgSend(MEMORY[0x24BDD4198], "currentOSVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4198], "currentOSBuild");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("Build: %@ (%@)\n"), v8, v9);

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("Disk capacity: %.1f GB\n"), (double)(unint64_t)objc_msgSend(v10, "totalDiskCapacity") * 9.31322575e-10);

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("Disk space available: %.3f GB"), (double)(unint64_t)objc_msgSend(v11, "currentDiskSpaceAvailable") * 9.31322575e-10);

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
