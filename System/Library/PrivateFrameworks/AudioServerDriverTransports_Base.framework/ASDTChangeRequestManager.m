@implementation ASDTChangeRequestManager

- (ASDTChangeRequestManager)initWithDelegate:(id)a3
{
  id v4;
  ASDTChangeRequestManager *v5;
  ASDTChangeRequestManager *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  ASDTChangeRequestManager *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ASDTChangeRequestManager;
  v5 = -[ASDTChangeRequestManager init](&v20, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  -[ASDTChangeRequestManager setDelegate:](v5, "setDelegate:", v4);
  v7 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "bundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTChangeRequestManager setBundleID:](v6, "setBundleID:", v8);

  }
  else
  {
    -[ASDTChangeRequestManager setBundleID:](v6, "setBundleID:", CFSTR("ASDTChangeRequestManager"));
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[ASDTChangeRequestManager bundleID](v6, "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.changeRequest"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[ASDTCondition conditionWithName:](ASDTCondition, "conditionWithName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTChangeRequestManager setChangeRequestLock:](v6, "setChangeRequestLock:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  -[ASDTChangeRequestManager setChangeRequestQueues:](v6, "setChangeRequestQueues:", v13);

  -[ASDTChangeRequestManager changeRequestLock](v6, "changeRequestLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[ASDTChangeRequestManager changeRequestQueues](v6, "changeRequestQueues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (!v16)
    {

LABEL_8:
      v17 = v6;
      goto LABEL_12;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[ASDTChangeRequestManager bundleID](v6, "bundleID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTChangeRequestManager initWithDelegate:].cold.1(v18, buf);
  }

  v17 = 0;
LABEL_12:

  return v17;
}

+ (id)forDelegate:(id)a3
{
  id v3;
  ASDTChangeRequestManager *v4;

  v3 = a3;
  v4 = -[ASDTChangeRequestManager initWithDelegate:]([ASDTChangeRequestManager alloc], "initWithDelegate:", v3);

  return v4;
}

- (id)queueForObject:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[ASDTChangeRequestManager changeRequestQueues](self, "changeRequestQueues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[ASDTChangeRequestQueue forObject:withName:andManager:](ASDTChangeRequestQueue, "forObject:withName:andManager:", v6, v7, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[ASDTChangeRequestManager changeRequestQueues](self, "changeRequestQueues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, v7);

    }
  }

  return v9;
}

- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "asdtName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_changeIndex;
  +[ASDTChangeRequest withIndex:andBlock:](ASDTChangeRequest, "withIndex:andBlock:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTChangeRequestManager bundleID](self, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412802;
    v22 = v10;
    v23 = 1024;
    v24 = objc_msgSend(v9, "index");
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Requesting config change %u for device: %@", (uint8_t *)&v21, 0x1Cu);

  }
  -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  -[ASDTChangeRequestManager queueForObject:withName:](self, "queueForObject:withName:", v6, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = objc_msgSend(v12, "addChangeRequest:", v9);
    -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unlock");

    if (v14)
    {
      -[ASDTChangeRequestManager delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "requestConfigurationChange:", v13);

    }
    else
    {
      v17 = 1;
    }
  }
  else
  {
    -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "unlock");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[ASDTChangeRequestManager bundleID](self, "bundleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTChangeRequestManager requestConfigurationChangeForDevice:withBlock:].cold.1(v19, (uint64_t)v8, (uint64_t)&v21);
    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)configurationChangePendingForObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  objc_msgSend(a3, "asdtName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ASDTChangeRequestManager changeRequestQueues](self, "changeRequestQueues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "flags");
  -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return v8 & 1;
}

- (void)doWaitForConfigurationChangesForQueue:(id)a3 withTimeout:(ASDTTime *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  while ((objc_msgSend(v6, "flags") & 3) != 0)
  {
    -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)&a4->var0;
    v12 = *(_QWORD *)&a4->var2;
    v8 = objc_msgSend(v7, "waitUntilTime:", &v11);

    if ((v8 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[ASDTChangeRequestManager bundleID](self, "bundleID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDTChangeRequestManager doWaitForConfigurationChangesForQueue:withTimeout:].cold.1(v9, v10, (uint64_t)v13);
      }
      break;
    }
  }

}

- (void)waitForConfigurationChangesForDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  objc_msgSend(a3, "asdtName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ASDTTime::futureSecs((ASDTTime *)5, (uint64_t)&v11);
  -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[ASDTChangeRequestManager changeRequestQueues](self, "changeRequestQueues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  v10 = v12;
  -[ASDTChangeRequestManager doWaitForConfigurationChangesForQueue:withTimeout:](self, "doWaitForConfigurationChangesForQueue:withTimeout:", v7, &v9);
  -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (void)waitForAllConfigurationChanges
{
  ASDTTime *v3;
  void *v4;
  void *i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v3 = (ASDTTime *)ASDTTime::futureSecs((ASDTTime *)0xA, (uint64_t)&v18);
  ASDTTime::machAbsoluteTime(v3, (uint64_t)&v16);
  -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  for (i = 0; ; i = v8)
  {
    -[ASDTChangeRequestManager changeRequestQueues](self, "changeRequestQueues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      break;
    v9 = v16;
    v10 = v18;

    if (v9 >= v10)
      goto LABEL_6;
    v14 = v18;
    v15 = v19;
    ASDTTime::machAbsoluteTime((ASDTTime *)-[ASDTChangeRequestManager doWaitForConfigurationChangesForQueue:withTimeout:](self, "doWaitForConfigurationChangesForQueue:withTimeout:", v8, &v14), (uint64_t)&v12);
    v16 = v12;
    v17 = v13;
  }

LABEL_6:
  -[ASDTChangeRequestManager changeRequestLock](self, "changeRequestLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (ASDTCondition)changeRequestLock
{
  return self->_changeRequestLock;
}

- (void)setChangeRequestLock:(id)a3
{
  objc_storeStrong((id *)&self->_changeRequestLock, a3);
}

- (NSMutableDictionary)changeRequestQueues
{
  return self->_changeRequestQueues;
}

- (void)setChangeRequestQueues:(id)a3
{
  objc_storeStrong((id *)&self->_changeRequestQueues, a3);
}

- (ASDTChangeRequestManagerDelegate)delegate
{
  return (ASDTChangeRequestManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)changeIndex
{
  return self->_changeIndex;
}

- (void)setChangeIndex:(unsigned int)a3
{
  self->_changeIndex = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_changeRequestQueues, 0);
  objc_storeStrong((id *)&self->_changeRequestLock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (void)initWithDelegate:(void *)a1 .cold.1(void *a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@: Memory allocation error.", buf, 0xCu);

  OUTLINED_FUNCTION_1_5();
}

- (void)requestConfigurationChangeForDevice:(uint64_t)a3 withBlock:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_0_4((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v4, "%@: Failed to create change request queue for %@", v5);

  OUTLINED_FUNCTION_1_5();
}

- (void)doWaitForConfigurationChangesForQueue:(uint64_t)a3 withTimeout:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_0_4((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_1_6(&dword_236CEE000, MEMORY[0x24BDACB70], v5, "%@: Timeout waiting for config changes on %@", v6);

  OUTLINED_FUNCTION_1_5();
}

@end
