@implementation ASDTChangeRequestQueue

- (id)initForObject:(id)a3 withName:(id)a4 andManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASDTChangeRequestQueue *v11;
  ASDTChangeRequestQueue *v12;
  ASDTChangeRequestQueue *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ASDTChangeRequestQueue;
  v11 = -[ASDTChangeRequestQueue init](&v17, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_6;
  v13 = 0;
  if (v8 && v9 && v10)
  {
    -[ASDTChangeRequestQueue setManager:](v11, "setManager:", v10);
    -[ASDTChangeRequestQueue setObject:](v12, "setObject:", v8);
    -[ASDTChangeRequestQueue setName:](v12, "setName:", v9);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTChangeRequestQueue setQueue:](v12, "setQueue:", v14);

    -[ASDTChangeRequestQueue queue](v12, "queue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
LABEL_6:
      v13 = v12;
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ASDTChangeRequestQueue initForObject:withName:andManager:].cold.1();
    v13 = 0;
  }
LABEL_7:

  return v13;
}

+ (id)forObject:(id)a3 withName:(id)a4 andManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForObject:withName:andManager:", v10, v9, v8);

  return v11;
}

- (BOOL)addChangeRequest:(id)a3
{
  id v4;
  _opaque_pthread_t *v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((-[ASDTChangeRequestQueue flags](self, "flags") & 2) != 0
    && (v5 = pthread_self(), v5 == -[ASDTChangeRequestQueue executionThread](self, "executionThread")))
  {
    -[ASDTChangeRequestQueue manager](self, "manager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changeRequestLock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unlock");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTChangeRequestQueue manager](self, "manager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDTChangeRequestQueue name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 1024;
      v21 = objc_msgSend(v4, "index");
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Change requests already running for %@; running request %u inline.",
        (uint8_t *)&v16,
        0x1Cu);

    }
    -[ASDTChangeRequestQueue executeChangeRequest:](self, "executeChangeRequest:", v4);
    -[ASDTChangeRequestQueue manager](self, "manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "changeRequestLock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lock");

    -[ASDTChangeRequestQueue setChangeRequestsExecuted:](self, "setChangeRequestsExecuted:", -[ASDTChangeRequestQueue changeRequestsExecuted](self, "changeRequestsExecuted") + 1);
    v7 = 0;
  }
  else
  {
    -[ASDTChangeRequestQueue queue](self, "queue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

    v7 = -[ASDTChangeRequestQueue flags](self, "flags") == 0;
    -[ASDTChangeRequestQueue setFlags:](self, "setFlags:", -[ASDTChangeRequestQueue flags](self, "flags") | 1);
  }

  return v7;
}

- (void)executeChangeRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTChangeRequestQueue manager](self, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "index");
    -[ASDTChangeRequestQueue name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v6;
    v17 = 1024;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Starting config change %u for device: %@", (uint8_t *)&v15, 0x1Cu);

  }
  objc_msgSend(v4, "block");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "block");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASDTChangeRequestQueue manager](self, "manager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "index");
    -[ASDTChangeRequestQueue name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v12;
    v17 = 1024;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Completed config change %u for device: %@", (uint8_t *)&v15, 0x1Cu);

  }
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  -[ASDTChangeRequestQueue manager](self, "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changeRequestLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  -[ASDTChangeRequestQueue object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASDTChangeRequestQueue setFlags:](self, "setFlags:", -[ASDTChangeRequestQueue flags](self, "flags") | 2);
    -[ASDTChangeRequestQueue setExecutionThread:](self, "setExecutionThread:", pthread_self());
    while (1)
    {
      -[ASDTChangeRequestQueue queue](self, "queue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (!v7)
        break;
      -[ASDTChangeRequestQueue queue](self, "queue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[ASDTChangeRequestQueue queue](self, "queue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObjectAtIndex:", 0);

      -[ASDTChangeRequestQueue manager](self, "manager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "changeRequestLock");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unlock");

      -[ASDTChangeRequestQueue executeChangeRequest:](self, "executeChangeRequest:", v9);
      -[ASDTChangeRequestQueue manager](self, "manager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "changeRequestLock");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lock");

      -[ASDTChangeRequestQueue setChangeRequestsExecuted:](self, "setChangeRequestsExecuted:", -[ASDTChangeRequestQueue changeRequestsExecuted](self, "changeRequestsExecuted") + 1);
    }
    -[ASDTChangeRequestQueue setFlags:](self, "setFlags:", 0);
    -[ASDTChangeRequestQueue setExecutionThread:](self, "setExecutionThread:", 0);
    -[ASDTChangeRequestQueue manager](self, "manager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "changeRequestQueues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTChangeRequestQueue name](self, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeObjectForKey:", v17);

    -[ASDTChangeRequestQueue manager](self, "manager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "changeRequestLock");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "broadcast");

    -[ASDTChangeRequestQueue manager](self, "manager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "changeRequestLock");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unlock");

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      -[ASDTChangeRequestQueue manager](self, "manager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[ASDTChangeRequestQueue changeRequestsExecuted](self, "changeRequestsExecuted");
      -[ASDTChangeRequestQueue name](self, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v23;
      v35 = 1024;
      v36 = v24;
      v37 = 2112;
      v38 = v25;
      _os_log_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@: Executed %u change requests for device: %@", buf, 0x1Cu);

    }
  }
  else
  {
    -[ASDTChangeRequestQueue manager](self, "manager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "changeRequestQueues");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDTChangeRequestQueue name](self, "name");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeObjectForKey:", v28);

    -[ASDTChangeRequestQueue manager](self, "manager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "changeRequestLock");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "broadcast");

    -[ASDTChangeRequestQueue manager](self, "manager");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "changeRequestLock");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "unlock");

  }
}

- (ASDTChangeRequestManager)manager
{
  return (ASDTChangeRequestManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (void)setManager:(id)a3
{
  objc_storeWeak((id *)&self->_manager, a3);
}

- (ASDObject)object
{
  return (ASDObject *)objc_loadWeakRetained((id *)&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (int)flags
{
  return self->_flags;
}

- (void)setFlags:(int)a3
{
  self->_flags = a3;
}

- (NSMutableArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (_opaque_pthread_t)executionThread
{
  return self->_executionThread;
}

- (void)setExecutionThread:(_opaque_pthread_t *)a3
{
  self->_executionThread = a3;
}

- (unsigned)changeRequestsExecuted
{
  return self->_changeRequestsExecuted;
}

- (void)setChangeRequestsExecuted:(unsigned int)a3
{
  self->_changeRequestsExecuted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_object);
  objc_destroyWeak((id *)&self->_manager);
}

- (void)initForObject:withName:andManager:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_236CEE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ASDTChangeRequestQueue: Memory allocation error.", v0, 2u);
}

@end
