@implementation CSProcessManager

+ (id)sharedInstanceWithEnrolledProcesses:(id)a3 andExemptions:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__CSProcessManager_sharedInstanceWithEnrolledProcesses_andExemptions___block_invoke;
  v12[3] = &unk_250A16908;
  v13 = v5;
  v14 = v6;
  v7 = sharedInstanceWithEnrolledProcesses_andExemptions__onceToken;
  v8 = v6;
  v9 = v5;
  if (v7 != -1)
    dispatch_once(&sharedInstanceWithEnrolledProcesses_andExemptions__onceToken, v12);
  v10 = (id)sharedInstanceWithEnrolledProcesses_andExemptions___sharedInstance;

  return v10;
}

void __70__CSProcessManager_sharedInstanceWithEnrolledProcesses_andExemptions___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = -[CSProcessManager _initWithEnrolledProcesses:andExemptions:]([CSProcessManager alloc], "_initWithEnrolledProcesses:andExemptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)sharedInstanceWithEnrolledProcesses_andExemptions___sharedInstance;
  sharedInstanceWithEnrolledProcesses_andExemptions___sharedInstance = (uint64_t)v1;

}

- (id)_initWithEnrolledProcesses:(id)a3 andExemptions:(id)a4
{
  id v6;
  id v7;
  CSProcessManager *v8;
  uint64_t v9;
  OS_os_log *logger;
  uint64_t v11;
  NSMutableDictionary *allProcessesMap;
  uint64_t v13;
  NSMutableDictionary *processNameIdentiferByPID;
  uint64_t v15;
  NSSet *enrolledProcessesSet;
  uint64_t v17;
  NSSet *exemptProcessesSet;
  OS_dispatch_source *timer;
  uint64_t v20;
  NSMutableSet *observers;
  CSProcessManager *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)CSProcessManager;
  v8 = -[CSProcessManager init](&v24, sel_init);
  if (v8)
  {
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSProcessManager"));
    v9 = objc_claimAutoreleasedReturnValue();
    logger = v8->_logger;
    v8->_logger = (OS_os_log *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    allProcessesMap = v8->_allProcessesMap;
    v8->_allProcessesMap = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    processNameIdentiferByPID = v8->_processNameIdentiferByPID;
    v8->_processNameIdentiferByPID = (NSMutableDictionary *)v13;

    v15 = objc_msgSend(v6, "copy");
    enrolledProcessesSet = v8->_enrolledProcessesSet;
    v8->_enrolledProcessesSet = (NSSet *)v15;

    v17 = objc_msgSend(v7, "copy");
    exemptProcessesSet = v8->_exemptProcessesSet;
    v8->_exemptProcessesSet = (NSSet *)v17;

    v8->_onlyMonitorDaemons = 1;
    timer = v8->_timer;
    v8->_timer = 0;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSMutableSet *)v20;

    -[CSProcessManager schedulePIDPolling](v8, "schedulePIDPolling");
    v22 = v8;
  }

  return v8;
}

- (id)processForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_allProcessesMap, "objectForKeyedSubscript:", a3);
}

- (void)schedulePIDPolling
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2383F5000, log, OS_LOG_TYPE_DEBUG, "Repeating timer for PID polling armed.", v1, 2u);
}

void __38__CSProcessManager_schedulePIDPolling__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pollPIDs");

}

- (void)pollPIDs
{
  void *v3;
  unsigned int v4;
  int v5;
  size_t v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *logger;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  CSProcess *v36;
  void *v37;
  int v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *log;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  _BYTE v48[14];
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = proc_listpids(1u, 0, 0, 0);
  if ((v4 & 0x80000000) == 0)
  {
    v5 = v4;
    v6 = v4;
    v7 = malloc_type_malloc(v4, 0xAB321DA3uLL);
    if (v7)
    {
      v8 = v7;
      v44 = v3;
      memset(v7, 255, v6);
      v43 = v8;
      v9 = proc_listpids(1u, 0, v8, v5);
      if (v9 < 4)
      {
LABEL_4:
        free(v43);
        v3 = v44;
        -[CSProcessManager notifyObserversOfNewInstances:](self, "notifyObserversOfNewInstances:", v44);
        goto LABEL_5;
      }
      if ((unint64_t)v9 >> 2 <= 1)
        v10 = 1;
      else
        v10 = (unint64_t)v9 >> 2;
      v11 = 0x24BE80000uLL;
      v12 = 0x24BDD1000uLL;
      v13 = (int *)v8;
      while (1)
      {
        v15 = *v13++;
        v14 = v15;
        if (v15 >= 1)
          break;
LABEL_47:
        if (!--v10)
          goto LABEL_4;
      }
      v16 = *(void **)(v11 + 3192);
      objc_msgSend(*(id *)(v12 + 1760), "numberWithInt:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend(v16, "handleForIdentifier:error:", v17, &v46);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v46;

      if (v19)
      {
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v48 = v14;
          *(_WORD *)&v48[4] = 2112;
          *(_QWORD *)&v48[6] = v19;
          _os_log_error_impl(&dword_2383F5000, logger, OS_LOG_TYPE_ERROR, "Error grabbing RBSProcessHandle (pid%i) to perform isDaemon check %@", buf, 0x12u);
        }
        goto LABEL_46;
      }
      objc_msgSend(v18, "identity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (self->_onlyMonitorDaemons && (objc_msgSend(v21, "isDaemon") & 1) == 0)
      {
        v33 = self->_logger;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v48 = v14;
          _os_log_debug_impl(&dword_2383F5000, v33, OS_LOG_TYPE_DEBUG, "Skipping pid: %d since it is not a daemon", buf, 8u);
        }
        goto LABEL_45;
      }
      v45 = v22;
      if (objc_msgSend(v22, "isDaemon"))
      {
        objc_msgSend(v18, "daemonJobLabel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = self->_logger;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v48 = v23;
          *(_WORD *)&v48[8] = 1024;
          *(_DWORD *)&v48[10] = v14;
          _os_log_debug_impl(&dword_2383F5000, v24, OS_LOG_TYPE_DEBUG, "Using daemonJobLabel:%@ for pid: %d", buf, 0x12u);
        }
        goto LABEL_27;
      }
      objc_msgSend(v18, "bundle");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
        goto LABEL_25;
      v26 = (void *)v25;
      objc_msgSend(v18, "bundle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v18, "bundle");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = self->_logger;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v48 = v23;
          *(_WORD *)&v48[8] = 1024;
          *(_DWORD *)&v48[10] = v14;
          v31 = v30;
          v32 = "Using bundleID:%@ for pid: %d";
LABEL_50:
          _os_log_debug_impl(&dword_2383F5000, v31, OS_LOG_TYPE_DEBUG, v32, buf, 0x12u);
        }
      }
      else
      {
LABEL_25:
        objc_msgSend(v18, "name");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = self->_logger;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v48 = v23;
          *(_WORD *)&v48[8] = 1024;
          *(_DWORD *)&v48[10] = v14;
          v31 = v34;
          v32 = "Using name:%@ for pid: %d";
          goto LABEL_50;
        }
      }
      v22 = v45;
LABEL_27:
      if (v23)
      {
        if (!-[NSSet containsObject:](self->_enrolledProcessesSet, "containsObject:", v23))
        {
          v35 = self->_logger;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v48 = v23;
            *(_WORD *)&v48[8] = 1024;
            *(_DWORD *)&v48[10] = v14;
            _os_log_debug_impl(&dword_2383F5000, v35, OS_LOG_TYPE_DEBUG, "Process:%@[%d] is not explicitly enrolled, it will get default restrictions.", buf, 0x12u);
          }
        }
        -[NSMutableDictionary objectForKey:](self->_allProcessesMap, "objectForKey:", v23);
        v36 = (CSProcess *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processNameIdentiferByPID, "setObject:forKeyedSubscript:", v23, v37);
        if (v36)
        {
          v38 = -[CSProcess currentPID](v36, "currentPID");
          if (v38 == -1)
          {
            -[CSProcess setCurrentPID:](v36, "setCurrentPID:", v14);
            objc_msgSend(v44, "addObject:", v23);
          }
          else
          {
            v39 = v38;
            if ((_DWORD)v14 != v38)
            {
              log = self->_logger;
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)v48 = v23;
                *(_WORD *)&v48[8] = 1024;
                *(_DWORD *)&v48[10] = v39;
                v49 = 1024;
                v50 = v14;
                _os_log_error_impl(&dword_2383F5000, log, OS_LOG_TYPE_ERROR, "%@ was PID: %d before, is %d now. Exit handler should fire soon.", buf, 0x18u);
              }
            }
          }
        }
        else
        {
          v36 = -[CSProcess initWithIdentifier:andPID:]([CSProcess alloc], "initWithIdentifier:andPID:", v23, v14);
          if (-[NSSet containsObject:](self->_exemptProcessesSet, "containsObject:", v23))
            -[CSProcess setExemptFromMitigations:](v36, "setExemptFromMitigations:", 1);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_allProcessesMap, "setObject:forKeyedSubscript:", v36, v23);
          objc_msgSend(v44, "addObject:", v23);
          v41 = self->_logger;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v48 = v14;
            *(_WORD *)&v48[4] = 2112;
            *(_QWORD *)&v48[6] = v23;
            _os_log_debug_impl(&dword_2383F5000, v41, OS_LOG_TYPE_DEBUG, "Tracking pid: %d for process:%@", buf, 0x12u);
          }
        }

        v22 = v45;
      }
      else
      {
        v40 = self->_logger;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v48 = v14;
          _os_log_debug_impl(&dword_2383F5000, v40, OS_LOG_TYPE_DEBUG, "Skipping pid: %d since we could not get daemonJobLabel, bundleIDidentifier or name", buf, 8u);
        }
      }

      v11 = 0x24BE80000;
      v12 = 0x24BDD1000;
LABEL_45:

LABEL_46:
      goto LABEL_47;
    }
  }
LABEL_5:

}

- (void)notifyObserversOfNewInstances:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "observeNewRunningProcesses:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addObserver:(id)a3
{
  -[NSMutableSet addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", a3);
}

- (id)identiferForPID:(int)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_processNameIdentiferByPID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getProcessForPID:(int)a3
{
  NSMutableDictionary *processNameIdentiferByPID;
  void *v5;
  void *v6;
  void *v7;

  processNameIdentiferByPID = self->_processNameIdentiferByPID;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](processNameIdentiferByPID, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_allProcessesMap, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)recordTerminationForPID:(int)a3
{
  uint64_t v3;
  NSObject *logger;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[5];
  int v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x24BDAC8D0];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v13 = v3;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_INFO, "Process %d exited", buf, 8u);
  }
  -[CSProcessManager getProcessForPID:](self, "getProcessForPID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "performCleanupOnExit");
  v8 = dispatch_time(0, 5000000000);
  getMainQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__CSProcessManager_recordTerminationForPID___block_invoke;
  v10[3] = &unk_250A16958;
  v10[4] = self;
  v11 = v3;
  dispatch_after(v8, v9, v10);

}

void __44__CSProcessManager_recordTerminationForPID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "processNameIdentiferByPID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (NSSet)enrolledProcessesSet
{
  return self->_enrolledProcessesSet;
}

- (void)setEnrolledProcessesSet:(id)a3
{
  objc_storeStrong((id *)&self->_enrolledProcessesSet, a3);
}

- (NSSet)exemptProcessesSet
{
  return self->_exemptProcessesSet;
}

- (void)setExemptProcessesSet:(id)a3
{
  objc_storeStrong((id *)&self->_exemptProcessesSet, a3);
}

- (NSMutableDictionary)allProcessesMap
{
  return self->_allProcessesMap;
}

- (void)setAllProcessesMap:(id)a3
{
  objc_storeStrong((id *)&self->_allProcessesMap, a3);
}

- (NSMutableDictionary)processNameIdentiferByPID
{
  return self->_processNameIdentiferByPID;
}

- (void)setProcessNameIdentiferByPID:(id)a3
{
  objc_storeStrong((id *)&self->_processNameIdentiferByPID, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BOOL)onlyMonitorDaemons
{
  return self->_onlyMonitorDaemons;
}

- (void)setOnlyMonitorDaemons:(BOOL)a3
{
  self->_onlyMonitorDaemons = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_processNameIdentiferByPID, 0);
  objc_storeStrong((id *)&self->_allProcessesMap, 0);
  objc_storeStrong((id *)&self->_exemptProcessesSet, 0);
  objc_storeStrong((id *)&self->_enrolledProcessesSet, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
