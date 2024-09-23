@implementation UARPAnalyticsUpdateFirmwareManager

- (UARPAnalyticsUpdateFirmwareManager)initWithController:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  UARPAnalyticsUpdateFirmwareManager *v8;
  UARPAnalyticsUpdateFirmwareManager *v9;
  os_log_t v10;
  OS_os_log *log;
  uint64_t v12;
  NSMutableArray *stateArray;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UARPAnalyticsUpdateFirmwareManager;
  v8 = -[UARPAnalyticsUpdateFirmwareManager init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_controller, v6);
    v10 = os_log_create("com.apple.accessoryupdater.uarp", "analytics");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v9->_queue, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    stateArray = v9->_stateArray;
    v9->_stateArray = (NSMutableArray *)v12;

    -[UARPAnalyticsUpdateFirmwareManager configurePurgeTimer](v9, "configurePurgeTimer");
  }

  return v9;
}

- (void)dealloc
{
  NSObject *purgeTimer;
  objc_super v4;

  purgeTimer = self->_purgeTimer;
  if (purgeTimer)
    dispatch_source_cancel(purgeTimer);
  v4.receiver = self;
  v4.super_class = (Class)UARPAnalyticsUpdateFirmwareManager;
  -[UARPAnalyticsUpdateFirmwareManager dealloc](&v4, sel_dealloc);
}

- (void)configurePurgeTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *purgeTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
  purgeTimer = self->_purgeTimer;
  self->_purgeTimer = v3;

  v5 = self->_purgeTimer;
  v6 = dispatch_time(0, 3600000000000);
  dispatch_source_set_timer(v5, v6, 0x34630B8A000uLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  v7 = self->_purgeTimer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__UARPAnalyticsUpdateFirmwareManager_configurePurgeTimer__block_invoke;
  v8[3] = &unk_24CEA2750;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_purgeTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__UARPAnalyticsUpdateFirmwareManager_configurePurgeTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "purgeStaleUpdateStateRecords");

}

- (id)updateStateForAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_stateArray;
  v9 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "accessoryID", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "analyticsIsEqual:", v13) & 1) != 0)
        {
          objc_msgSend(v12, "assetID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v7, "analyticsIsEqual:", v14);

          if ((v15 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v9 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
LABEL_12:

  return v9;
}

- (id)updateStatesForAccessoryID:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_stateArray;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "accessoryID", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "analyticsIsEqual:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)stagingStartedForAccessoryID:(id)a3 assetID:(id)a4 userIntent:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *log;
  const char *v11;
  UARPAnalyticsUpdateFirmwareState *v12;
  _BYTE v13[22];
  __int16 v14;
  id v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v11 = "NO";
    *(_DWORD *)v13 = 136315906;
    *(_QWORD *)&v13[4] = "-[UARPAnalyticsUpdateFirmwareManager stagingStartedForAccessoryID:assetID:userIntent:]";
    if (v5)
      v11 = "YES";
    *(_WORD *)&v13[12] = 2112;
    *(_QWORD *)&v13[14] = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2080;
    v17 = v11;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: %@ %@ userIntent=%s", v13, 0x2Au);
  }
  -[UARPAnalyticsUpdateFirmwareManager updateStateForAccessoryID:assetID:](self, "updateStateForAccessoryID:assetID:", v8, v9, *(_OWORD *)v13);
  v12 = (UARPAnalyticsUpdateFirmwareState *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[UARPAnalyticsUpdateFirmwareState initWithAccessoryID:assetID:]([UARPAnalyticsUpdateFirmwareState alloc], "initWithAccessoryID:assetID:", v8, v9);
    -[NSMutableArray addObject:](self->_stateArray, "addObject:", v12);
  }
  -[UARPAnalyticsUpdateFirmwareState stagingStartedWithUserIntent:](v12, "stagingStartedWithUserIntent:", v5);

}

- (void)stagingCompleteForAccessoryID:(id)a3 assetID:(id)a4 status:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *log;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v11 = log;
    v17 = 136315906;
    v18 = "-[UARPAnalyticsUpdateFirmwareManager stagingCompleteForAccessoryID:assetID:status:]";
    v19 = 2112;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    v23 = 2080;
    v24 = UARPFirmwareStagingCompletionStatusToString(a5);
    _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "%s: %@ %@ status=%s", (uint8_t *)&v17, 0x2Au);

  }
  -[UARPAnalyticsUpdateFirmwareManager updateStateForAccessoryID:assetID:](self, "updateStateForAccessoryID:assetID:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "stagingCompleteWithStatus:", a5);
    v14 = objc_msgSend(v9, "isUrgentUpdate");
    objc_msgSend(v13, "assetID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIsUrgentUpdate:", v14);

    -[UARPAnalyticsUpdateFirmwareManager updateComplete:](self, "updateComplete:", v13);
  }
  else
  {
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[UARPAnalyticsUpdateFirmwareManager stagingCompleteForAccessoryID:assetID:status:].cold.1((uint64_t)v8, (uint64_t)v9, v16);
  }

}

- (void)setAccessoryIDUnreachable:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *log;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[UARPAnalyticsUpdateFirmwareManager updateStatesForAccessoryID:](self, "updateStatesForAccessoryID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    *(_QWORD *)&v6 = 136315394;
    v12 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          v18 = "-[UARPAnalyticsUpdateFirmwareManager setAccessoryIDUnreachable:]";
          v19 = 2112;
          v20 = v10;
          _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: %@ unreachable", buf, 0x16u);
        }
        objc_msgSend(v10, "accessoryUnreachable", v12);
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v7);
  }

}

- (void)purgeStaleUpdateStateRecords
{
  NSObject *log;
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSObject *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Purge timer fired", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = self->_stateArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v10, "age") >> 7 >= 0x2A3)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeObjectsInArray:](self->_stateArray, "removeObjectsInArray:", v4);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v25;
    *(_QWORD *)&v13 = 138412290;
    v23 = v13;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v18 = self->_log;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v23;
          v33 = v17;
          _os_log_error_impl(&dword_212D08000, v18, OS_LOG_TYPE_ERROR, "Purging %@", buf, 0xCu);
        }
        objc_msgSend(v17, "accessoryUnreachable", v23, (_QWORD)v24);
        WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        objc_msgSend(v17, "accessoryID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "assetID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "eventParams");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:", v20, v21, v22);

      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v14);
  }

}

- (void)updateComplete:(id)a3
{
  id v4;
  NSObject *log;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v10 = 136315394;
    v11 = "-[UARPAnalyticsUpdateFirmwareManager updateComplete:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v10, 0x16u);
  }
  -[NSMutableArray removeObject:](self->_stateArray, "removeObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(v4, "accessoryID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventParams");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "sendUpdateFirmwareAnalyticsEventForAccessoryID:assetID:params:", v7, v8, v9);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n{\n"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_stateArray;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "appendString:", CFSTR("}"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_stateArray, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (void)stagingCompleteForAccessoryID:(uint64_t)a1 assetID:(uint64_t)a2 status:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[UARPAnalyticsUpdateFirmwareManager stagingCompleteForAccessoryID:assetID:status:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl(&dword_212D08000, log, OS_LOG_TYPE_ERROR, "%s: No record for %@ %@", (uint8_t *)&v3, 0x20u);
}

@end
