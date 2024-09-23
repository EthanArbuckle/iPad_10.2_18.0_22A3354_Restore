@implementation MXPowerlogService

+ (id)sharedPowerlogService
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__MXPowerlogService_sharedPowerlogService__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPowerlogService_onceToken != -1)
    dispatch_once(&sharedPowerlogService_onceToken, block);
  return (id)sharedPowerlogService_sharedPowerlogService;
}

void __42__MXPowerlogService_sharedPowerlogService__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedPowerlogService_sharedPowerlogService;
  sharedPowerlogService_sharedPowerlogService = (uint64_t)v1;

}

- (MXPowerlogService)init
{
  MXPowerlogService *v2;
  os_log_t v3;
  OS_os_log *MXPowerLogServiceLogHandle;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *requestQueue;
  NSMutableArray *v8;
  NSMutableArray *powerlogDataPaths;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MXPowerlogService;
  v2 = -[MXService initWithSourceID:](&v11, sel_initWithSourceID_, 2);
  if (v2)
  {
    v3 = os_log_create("com.apple.metrickit.service.powerlog", (const char *)&unk_229EF5085);
    MXPowerLogServiceLogHandle = v2->_MXPowerLogServiceLogHandle;
    v2->_MXPowerLogServiceLogHandle = (OS_os_log *)v3;

    if (!v2->_MXPowerLogServiceLogHandle)
      objc_storeStrong((id *)&v2->_MXPowerLogServiceLogHandle, MEMORY[0x24BDACB70]);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.metrickitd.service.powerlog.requestqueue", v5);
    requestQueue = v2->_requestQueue;
    v2->_requestQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    powerlogDataPaths = v2->_powerlogDataPaths;
    v2->_powerlogDataPaths = v8;

  }
  return v2;
}

- (BOOL)startService
{
  NSObject *MXPowerLogServiceLogHandle;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MXPowerlogService;
  if (!-[MXService startService](&v8, sel_startService))
    return -[MXService isStarted](self, "isStarted");
  MXPowerLogServiceLogHandle = self->_MXPowerLogServiceLogHandle;
  if (os_log_type_enabled(MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_229EEF000, MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Starting powerlog service.", buf, 2u);
  }
  if (-[MXPowerlogService _updateService](self, "_updateService"))
    return 1;
  v5 = self->_MXPowerLogServiceLogHandle;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[MXPowerlogService startService].cold.1(v5);
  v6.receiver = self;
  v6.super_class = (Class)MXPowerlogService;
  -[MXService stopService](&v6, sel_stopService);
  return 0;
}

- (BOOL)stopService
{
  NSMutableArray *unarchivedPowerlogData;
  NSObject *MXPowerLogServiceLogHandle;
  uint8_t v6[16];
  objc_super v7;

  unarchivedPowerlogData = self->_unarchivedPowerlogData;
  self->_unarchivedPowerlogData = 0;

  v7.receiver = self;
  v7.super_class = (Class)MXPowerlogService;
  if (-[MXService stopService](&v7, sel_stopService))
  {
    MXPowerLogServiceLogHandle = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_229EEF000, MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Stopping powerlog service.", v6, 2u);
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
  id v8;
  NSObject *MXPowerLogServiceLogHandle;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  NSMutableArray *powerlogDataPaths;
  NSObject *v14;
  NSMutableArray *v15;
  id v17;
  uint8_t buf[4];
  NSMutableArray *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray removeAllObjects](self->_powerlogDataPaths, "removeAllObjects");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MXUtilities containerPath](MXUtilities, "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24F33C3C0, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;

  if (v8)
  {
    MXPowerLogServiceLogHandle = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(MXPowerLogServiceLogHandle, OS_LOG_TYPE_ERROR))
      -[MXSpinTracerService _updateService].cold.1((uint64_t)v8, MXPowerLogServiceLogHandle);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF BEGINSWITH[cd] 'log-'"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (NSMutableArray *)objc_msgSend(v11, "mutableCopy");
    powerlogDataPaths = self->_powerlogDataPaths;
    self->_powerlogDataPaths = v12;

    v14 = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_powerlogDataPaths;
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_229EEF000, v14, OS_LOG_TYPE_DEFAULT, "Found log files: %@", buf, 0xCu);
    }

  }
  return v8 == 0;
}

- (id)getMetricsForClient:(id)a3
{
  id v4;
  NSObject *MXPowerLogServiceLogHandle;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MXPowerlogService *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!self->_unarchivedPowerlogData)
  {
    MXPowerLogServiceLogHandle = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_229EEF000, MXPowerLogServiceLogHandle, OS_LOG_TYPE_DEFAULT, "Unarchived powerlog data not yet set, running unarchive.", buf, 2u);
    }
    -[MXPowerlogService unarchivePowerlogData](self, "unarchivePowerlogData");
  }
  v6 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v6, "setLocale:");
  v25 = v6;
  objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy-MM-dd"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_unarchivedPowerlogData;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "metrics");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "datestamp");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringFromDate:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "metrics");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MXService pruneSourceData:](self, "pruneSourceData:", v18);
          v19 = self;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v20, v16);

          self = v19;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v26, "count"))
  {
    v21 = v26;
  }
  else
  {
    v22 = self->_MXPowerLogServiceLogHandle;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v4;
      _os_log_impl(&dword_229EEF000, v22, OS_LOG_TYPE_DEFAULT, "No data for client: %@", buf, 0xCu);
    }
    v21 = 0;
  }

  return v21;
}

- (void)unarchivePowerlogData
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_229EEF000, log, OS_LOG_TYPE_DEBUG, "Log file consistent, assigning client data.", buf, 2u);
}

- (BOOL)metricsAvailable
{
  return -[MXService isStarted](self, "isStarted") && -[NSMutableArray count](self->_powerlogDataPaths, "count");
}

- (BOOL)metricsSupported
{
  return 1;
}

- (NSMutableArray)powerlogDataPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPowerlogDataPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)unarchivedPowerlogData
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnarchivedPowerlogData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_os_log)MXPowerLogServiceLogHandle
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMXPowerLogServiceLogHandle:(id)a3
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
  objc_storeStrong((id *)&self->_MXPowerLogServiceLogHandle, 0);
  objc_storeStrong((id *)&self->_unarchivedPowerlogData, 0);
  objc_storeStrong((id *)&self->_powerlogDataPaths, 0);
}

- (void)startService
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_229EEF000, log, OS_LOG_TYPE_ERROR, "Failed to start powerlog service.", v1, 2u);
}

@end
