@implementation MXSpinTracerService

+ (id)sharedSpinTracerService
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__MXSpinTracerService_sharedSpinTracerService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSpinTracerService_onceToken != -1)
    dispatch_once(&sharedSpinTracerService_onceToken, block);
  return (id)sharedSpinTracerService_sharedSpinTracerService;
}

void __46__MXSpinTracerService_sharedSpinTracerService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedSpinTracerService_sharedSpinTracerService;
  sharedSpinTracerService_sharedSpinTracerService = (uint64_t)v1;

}

- (MXSpinTracerService)init
{
  MXSpinTracerService *v2;
  os_log_t v3;
  OS_os_log *MXSpinTracerServiceLogHandle;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *requestQueue;
  NSMutableArray *v8;
  NSMutableArray *spinTracerDataPaths;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MXSpinTracerService;
  v2 = -[MXService initWithSourceID:](&v11, sel_initWithSourceID_, 4);
  if (v2)
  {
    v3 = os_log_create("com.apple.metrickit.service.spintracer", (const char *)&unk_229EF5085);
    MXSpinTracerServiceLogHandle = v2->_MXSpinTracerServiceLogHandle;
    v2->_MXSpinTracerServiceLogHandle = (OS_os_log *)v3;

    if (!v2->_MXSpinTracerServiceLogHandle)
      objc_storeStrong((id *)&v2->_MXSpinTracerServiceLogHandle, MEMORY[0x24BDACB70]);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.metrickitd.service.spintracer.requestqueue", v5);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    spinTracerDataPaths = v2->_spinTracerDataPaths;
    v2->_spinTracerDataPaths = v8;

  }
  return v2;
}

- (BOOL)startService
{
  NSObject *MXSpinTracerServiceLogHandle;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MXSpinTracerService;
  if (!-[MXService startService](&v8, sel_startService))
    return -[MXService isStarted](self, "isStarted");
  MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
  if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229EEF000, MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Starting spintracer service.", buf, 2u);
  }
  if (-[MXSpinTracerService _updateService](self, "_updateService"))
    return 1;
  v5 = self->_MXSpinTracerServiceLogHandle;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MXSpinTracerService startService].cold.1(v5);
  v6.receiver = self;
  v6.super_class = (Class)MXSpinTracerService;
  -[MXService stopService](&v6, sel_stopService);
  return 0;
}

- (BOOL)stopService
{
  NSMutableArray *unarchivedSpinTracerData;
  NSObject *MXSpinTracerServiceLogHandle;
  uint8_t v6[16];
  objc_super v7;

  unarchivedSpinTracerData = self->_unarchivedSpinTracerData;
  self->_unarchivedSpinTracerData = 0;

  -[MXService setCurrentClient:](self, "setCurrentClient:", 0);
  v7.receiver = self;
  v7.super_class = (Class)MXSpinTracerService;
  if (-[MXService stopService](&v7, sel_stopService))
  {
    MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_229EEF000, MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Stopping spintracer service.", v6, 2u);
    }
  }
  return !-[MXService isStarted](self, "isStarted");
}

- (BOOL)_updateService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *MXSpinTracerServiceLogHandle;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  NSMutableArray *spinTracerDataPaths;
  NSObject *v16;
  NSMutableArray *v17;
  id v19;
  uint8_t buf[4];
  NSMutableArray *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray removeAllObjects](self->_spinTracerDataPaths, "removeAllObjects");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXUtilities containerPath](MXUtilities, "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24F33C348, "objectAtIndexedSubscript:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MXService currentClient](self, "currentClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v8, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;

  if (v10)
  {
    MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_ERROR))
      -[MXSpinTracerService _updateService].cold.1((uint64_t)v10, MXSpinTracerServiceLogHandle);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF BEGINSWITH[cd] 'diag-log-'"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (NSMutableArray *)objc_msgSend(v13, "mutableCopy");
    spinTracerDataPaths = self->_spinTracerDataPaths;
    self->_spinTracerDataPaths = v14;

    v16 = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_spinTracerDataPaths;
      *(_DWORD *)buf = 138412290;
      v21 = v17;
      _os_log_impl(&dword_229EEF000, v16, OS_LOG_TYPE_DEFAULT, "Found log files: %@", buf, 0xCu);
    }

  }
  return v10 == 0;
}

- (void)unarchiveSpinTracerDataForDateString:(id)a3
{
  uint64_t v4;
  NSMutableArray *v5;
  NSMutableArray *unarchivedSpinTracerData;
  uint64_t i;
  void *v8;
  NSObject *MXSpinTracerServiceLogHandle;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MXSpinTracerService *v16;
  void *v17;
  void *v18;
  MXSpinTracerService *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id obj;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF CONTAINS %@"), v40);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  unarchivedSpinTracerData = self->_unarchivedSpinTracerData;
  self->_unarchivedSpinTracerData = v5;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = (void *)v4;
  -[NSMutableArray filteredArrayUsingPredicate:](self->_spinTracerDataPaths, "filteredArrayUsingPredicate:", v4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v42)
  {
    v41 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v42; i = v26 + 1)
      {
        if (*(_QWORD *)v46 != v41)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v43 = i;
        MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
        if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v50 = (uint64_t)v8;
          v51 = 2112;
          v52 = (uint64_t)v40;
          _os_log_impl(&dword_229EEF000, MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Found log file: %@ for date: %@", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[MXUtilities containerPath](MXUtilities, "containerPath");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_24F33C360, "objectAtIndexedSubscript:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingPathComponent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MXService currentClient](self, "currentClient");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingPathComponent:", v8);
        v16 = self;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contentsAtPath:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = v16;
          v20 = (void *)MEMORY[0x24BDD1620];
          v21 = objc_opt_class();
          v44 = 0;
          objc_msgSend(v20, "unarchivedObjectOfClass:fromData:error:", v21, v18, &v44);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v44;
          if (v23)
          {
            self = v16;
            v24 = v16->_MXSpinTracerServiceLogHandle;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = (uint64_t)v23;
              _os_log_error_impl(&dword_229EEF000, v24, OS_LOG_TYPE_ERROR, "Failed to unarchive spin tracer data: %@", buf, 0xCu);
            }
          }
          else
          {
            v38 = v18;
            v27 = objc_alloc_init(MEMORY[0x24BDD1500]);
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
            objc_msgSend(v27, "setLocale:");
            objc_msgSend(v27, "setDateFormat:", CFSTR("yyyy-MM-dd"));
            objc_msgSend(v22, "datestamp");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringFromDate:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            self = v19;
            if (objc_msgSend(v40, "isEqualToString:", v30)
              && (v31 = objc_msgSend(v22, "sourceID"), v31 == -[MXService sourceID](v19, "sourceID")))
            {
              v32 = v19->_MXSpinTracerServiceLogHandle;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_229EEF000, v32, OS_LOG_TYPE_DEFAULT, "Log file consistent, adding client data.", buf, 2u);
              }
              -[NSMutableArray addObject:](v19->_unarchivedSpinTracerData, "addObject:", v22);
            }
            else
            {
              v33 = v19->_MXSpinTracerServiceLogHandle;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v34 = v33;
                v35 = objc_msgSend(v22, "sourceID");
                v36 = -[MXService sourceID](v19, "sourceID");
                *(_DWORD *)buf = 134218754;
                v50 = v35;
                self = v19;
                v51 = 2048;
                v52 = v36;
                v53 = 2112;
                v54 = v30;
                v55 = 2112;
                v56 = v40;
                _os_log_error_impl(&dword_229EEF000, v34, OS_LOG_TYPE_ERROR, "Bad source type: (%ld, expected %ld) or date string: (%@, expected %@)", buf, 0x2Au);

              }
            }

            v18 = v38;
          }

          v26 = v43;
        }
        else
        {
          v25 = v16->_MXSpinTracerServiceLogHandle;
          self = v16;
          v26 = v43;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v50 = (uint64_t)v8;
            _os_log_debug_impl(&dword_229EEF000, v25, OS_LOG_TYPE_DEBUG, "Failed to read spin tracer data contents: %@", buf, 0xCu);
          }
        }

      }
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v42);
  }

}

- (id)getDiagnosticsForClient:(id)a3 dateString:(id)a4
{
  id v6;
  id v7;
  NSObject *MXSpinTracerServiceLogHandle;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_unarchivedSpinTracerData)
  {
    MXSpinTracerServiceLogHandle = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229EEF000, MXSpinTracerServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Unarchived spin tracer data not yet set, running unarchive.", buf, 2u);
    }
    -[MXSpinTracerService unarchiveSpinTracerDataForDateString:](self, "unarchiveSpinTracerDataForDateString:", v7);
  }
  v30 = v7;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = self->_unarchivedSpinTracerData;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v15, "metrics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v15, "metrics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v19);

        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v20 = self->_MXSpinTracerServiceLogHandle;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v6;
      _os_log_impl(&dword_229EEF000, v20, OS_LOG_TYPE_DEFAULT, "Found spin tracer diagnostics for client: %@", buf, 0xCu);
    }
    v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = v9;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          -[MXService pruneSourceData:](self, "pruneSourceData:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v21, "addObject:", v27);

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v24);
    }

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v21);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (BOOL)diagnosticsAvailable
{
  return 1;
}

- (BOOL)diagnosticsSupported
{
  return 1;
}

- (NSMutableArray)spinTracerDataPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSpinTracerDataPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)unarchivedSpinTracerData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnarchivedSpinTracerData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_os_log)MXSpinTracerServiceLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMXSpinTracerServiceLogHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_queue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_MXSpinTracerServiceLogHandle, 0);
  objc_storeStrong((id *)&self->_unarchivedSpinTracerData, 0);
  objc_storeStrong((id *)&self->_spinTracerDataPaths, 0);
}

- (void)startService
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229EEF000, log, OS_LOG_TYPE_ERROR, "Failed to start spintracer service.", v1, 2u);
}

- (void)_updateService
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_229EEF000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain log paths with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
