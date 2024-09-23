@implementation MBDeviceTransferTask

- (int64_t)taskType
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  MBDeviceTransferTask *v2;
  OS_dispatch_queue *queue;
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  const char *Name;
  dispatch_queue_t v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;

  v2 = self;
  objc_sync_enter(v2);
  queue = v2->_queue;
  if (!queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (objc_class *)objc_opt_class();
    Name = class_getName(v6);
    v8 = dispatch_queue_create(Name, v5);
    v9 = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    queue = v2->_queue;
  }
  v10 = queue;
  objc_sync_exit(v2);

  return v10;
}

- (void)setQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  MBDeviceTransferTask *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  queue = obj->_queue;
  obj->_queue = v4;

  objc_sync_exit(obj);
}

- (MBManager)manager
{
  uint64_t v3;
  void *v4;
  MBDeviceTransferTask *v5;
  MBManager *manager;
  MBManager *v7;
  MBManager *v8;
  MBManager *v9;

  -[MBDeviceTransferTask queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    -[MBDeviceTransferTask manager].cold.1();
  v4 = (void *)v3;
  v5 = self;
  objc_sync_enter(v5);
  manager = v5->_manager;
  if (!manager)
  {
    v7 = -[MBManager initWithDelegate:eventQueue:]([MBManager alloc], "initWithDelegate:eventQueue:", v5, v4);
    v8 = v5->_manager;
    v5->_manager = v7;

    manager = v5->_manager;
  }
  v9 = manager;
  objc_sync_exit(v5);

  return v9;
}

- (BOOL)started
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_started);
  return v2 & 1;
}

- (BOOL)canceled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_canceled);
  return v2 & 1;
}

- (BOOL)finished
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_finished);
  return v2 & 1;
}

- (MBDeviceTransferTask)initWithFileTransferSession:(id)a3
{
  id v4;
  void *v5;
  MBDeviceTransferTask *v6;
  MBDeviceTransferTask *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;
  uint8_t buf[4];
  MBDeviceTransferTask *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    -[MBDeviceTransferTask initWithFileTransferSession:].cold.1();
  v5 = v4;
  v16.receiver = self;
  v16.super_class = (Class)MBDeviceTransferTask;
  v6 = -[MBDeviceTransferTask init](&v16, sel_init);
  v7 = v6;
  if (v6)
    -[MBDeviceTransferTask setFileTransferSession:](v6, "setFileTransferSession:", v5);
  MBGetDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_DEFAULT, "%@: init, fileTransferSession:%@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: init, fileTransferSession:%@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  }

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[4];
  MBDeviceTransferTask *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  MBGetDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_1D5213000, v3, OS_LOG_TYPE_DEFAULT, "%@: dealloc", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: dealloc", v4, v5, v6, v7, v8, v9, (uint64_t)self);
  }

  v10.receiver = self;
  v10.super_class = (Class)MBDeviceTransferTask;
  -[MBDeviceTransferTask dealloc](&v10, sel_dealloc);
}

- (BOOL)_startWithError:(id *)a3
{
  __assert_rtn("-[MBDeviceTransferTask _startWithError:]", "MBDeviceTransferTask.m", 377, "0 && \"Unexpected call\");
}

- (void)start
{
  __assert_rtn("-[MBDeviceTransferTask start]", "MBDeviceTransferTask.m", 382, "!started");
}

void __29__MBDeviceTransferTask_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  MBGetDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl(&dword_1D5213000, v2, OS_LOG_TYPE_DEFAULT, "%@: Starting", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Starting", v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));
  }

  v10 = objc_msgSend(*(id *)(a1 + 32), "canceled");
  v11 = *(void **)(a1 + 32);
  if (v10)
  {
    objc_msgSend(v11, "_cancel");
  }
  else
  {
    v18 = 0;
    v12 = objc_msgSend(v11, "_startWithError:", &v18);
    v13 = v18;
    v14 = v13;
    if ((v12 & 1) == 0 && !v13)
      __29__MBDeviceTransferTask_start__block_invoke_cold_2();
    v15 = *(unsigned __int8 **)(a1 + 32);
    if (v12)
    {
      v16 = v15 + 24;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(1u, v16));
      if ((v17 & 1) != 0)
        __29__MBDeviceTransferTask_start__block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(v15, "_finishWithError:", v14);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "canceled"))
      objc_msgSend(*(id *)(a1 + 32), "_cancel");

  }
}

- (void)cancel
{
  BOOL *p_canceled;
  unsigned __int8 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[4];
  MBDeviceTransferTask *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_canceled = &self->_canceled;
  do
    v4 = __ldaxr((unsigned __int8 *)p_canceled);
  while (__stlxr(1u, (unsigned __int8 *)p_canceled));
  if ((v4 & 1) == 0 && -[MBDeviceTransferTask started](self, "started"))
  {
    MBGetDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_DEFAULT, "%@: Canceling", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Canceling", v6, v7, v8, v9, v10, v11, (uint64_t)self);
    }

    -[MBDeviceTransferTask queue](self, "queue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__MBDeviceTransferTask_cancel__block_invoke;
    block[3] = &unk_1E995CE70;
    block[4] = self;
    dispatch_async(v12, block);

  }
}

uint64_t __30__MBDeviceTransferTask_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL *p_finished;
  unsigned __int8 v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD);
  uint8_t buf[4];
  MBDeviceTransferTask *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MBDeviceTransferTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  p_finished = &self->_finished;
  do
    v7 = __ldaxr((unsigned __int8 *)p_finished);
  while (__stlxr(1u, (unsigned __int8 *)p_finished));
  if ((v7 & 1) == 0)
  {
    MBGetDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v24 = self;
        v25 = 2112;
        v26 = v4;
        _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_ERROR, "%@: Finishing the device transfer task: %@", buf, 0x16u);
        _MBLog(CFSTR("ERROR"), (uint64_t)"%@: Finishing the device transfer task: %@", v10, v11, v12, v13, v14, v15, (uint64_t)self);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl(&dword_1D5213000, v9, OS_LOG_TYPE_DEFAULT, "%@: Finishing the device transfer task", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Finishing the device transfer task", v16, v17, v18, v19, v20, v21, (uint64_t)self);
    }

    -[MBDeviceTransferTask setCompletionError:](self, "setCompletionError:", v4);
    -[MBDeviceTransferTask completionHandler](self, "completionHandler");
    v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[MBDeviceTransferTask setProgressHandler:](self, "setProgressHandler:", 0);
      -[MBDeviceTransferTask setConnectionInfoHandler:](self, "setConnectionInfoHandler:", 0);
      -[MBDeviceTransferTask setConnectionStateHandler:](self, "setConnectionStateHandler:", 0);
      -[MBDeviceTransferTask setCompletionHandler:](self, "setCompletionHandler:", 0);
      ((void (**)(_QWORD, id))v22)[2](v22, v4);
    }

  }
}

- (BOOL)_handleCompletionWithError:(id *)a3
{
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (!a3)
    -[MBDeviceTransferTask _handleCompletionWithError:].cold.1();
  -[MBDeviceTransferTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MBDeviceTransferTask canceled](self, "canceled"))
  {
    v6 = CFSTR("Canceled");
    v7 = 202;
    goto LABEL_4;
  }
  if (-[MBDeviceTransferTask finished](self, "finished"))
  {
    -[MBDeviceTransferTask completionError](self, "completionError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_8;
    v6 = CFSTR("Invalid state (finished)");
    v7 = 1;
LABEL_4:
    +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      return 1;
LABEL_8:
    v9 = objc_retainAutorelease(v8);
    *a3 = v9;

    return 0;
  }
  return 1;
}

- (void)_suspend
{
  __assert_rtn("-[MBDeviceTransferTask _suspend]", "MBDeviceTransferTask.m", 463, "!suspended");
}

- (void)_resume
{
  __assert_rtn("-[MBDeviceTransferTask _resume]", "MBDeviceTransferTask.m", 474, "resumed");
}

- (void)managerDidLoseConnectionToService:(id)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MBDeviceTransferTask queue](self, "queue", a3);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[MBDeviceTransferTask started](self, "started"))
  {
    +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 19, CFSTR("XPC connection interrupted"));
    v6 = objc_claimAutoreleasedReturnValue();
    MBGetDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_ERROR, "Lost connection, error:%@", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), (uint64_t)"Lost connection, error:%@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    }

    -[MBDeviceTransferTask _finishWithError:](self, "_finishWithError:", v6);
  }
  else
  {
    MBGetDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v14;
      _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring %{public}@", buf, 0xCu);

      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Ignoring %{public}@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);

    }
  }

}

- (void)manager:(id)a3 didUpdateDeviceTransferConnectionInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;

  v12 = a3;
  v6 = a4;
  if (!v6)
    -[MBDeviceTransferTask manager:didUpdateDeviceTransferConnectionInfo:].cold.1();
  v7 = v6;
  if (objc_msgSend(v6, "connectionState") != 1 && objc_msgSend(v7, "connectionState") != 2)
    -[MBDeviceTransferTask manager:didUpdateDeviceTransferConnectionInfo:].cold.2();
  -[MBDeviceTransferTask connectionStateHandler](self, "connectionStateHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MBDeviceTransferTask connectionStateHandler](self, "connectionStateHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, objc_msgSend(v7, "connectionState"));

  }
  -[MBDeviceTransferTask connectionInfoHandler](self, "connectionInfoHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MBDeviceTransferTask connectionInfoHandler](self, "connectionInfoHandler");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v7);

  }
}

- (NSError)completionError
{
  return self->_completionError;
}

- (void)setCompletionError:(id)a3
{
  objc_storeStrong((id *)&self->_completionError, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)connectionStateHandler
{
  return self->_connectionStateHandler;
}

- (void)setConnectionStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)connectionInfoHandler
{
  return self->_connectionInfoHandler;
}

- (void)setConnectionInfoHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (RPFileTransferSession)fileTransferSession
{
  return self->_fileTransferSession;
}

- (void)setFileTransferSession:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_connectionInfoHandler, 0);
  objc_storeStrong(&self->_connectionStateHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_completionError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)manager
{
  __assert_rtn("-[MBDeviceTransferTask manager]", "MBDeviceTransferTask.m", 344, "queue");
}

- (void)initWithFileTransferSession:.cold.1()
{
  __assert_rtn("-[MBDeviceTransferTask initWithFileTransferSession:]", "MBDeviceTransferTask.m", 364, "fileTransferSession");
}

void __29__MBDeviceTransferTask_start__block_invoke_cold_1()
{
  __assert_rtn("-[MBDeviceTransferTask start]_block_invoke", "MBDeviceTransferTask.m", 396, "!started");
}

void __29__MBDeviceTransferTask_start__block_invoke_cold_2()
{
  __assert_rtn("-[MBDeviceTransferTask start]_block_invoke", "MBDeviceTransferTask.m", 392, "started || error");
}

- (void)_handleCompletionWithError:.cold.1()
{
  __assert_rtn("-[MBDeviceTransferTask _handleCompletionWithError:]", "MBDeviceTransferTask.m", 442, "error");
}

- (void)manager:didUpdateDeviceTransferConnectionInfo:.cold.1()
{
  __assert_rtn("-[MBDeviceTransferTask manager:didUpdateDeviceTransferConnectionInfo:]", "MBDeviceTransferTask.m", 493, "info");
}

- (void)manager:didUpdateDeviceTransferConnectionInfo:.cold.2()
{
  __assert_rtn("-[MBDeviceTransferTask manager:didUpdateDeviceTransferConnectionInfo:]", "MBDeviceTransferTask.m", 494, "info.connectionState == MBDeviceTransferConnectionStateConnected || info.connectionState == MBDeviceTransferConnectionStateDisconnected");
}

@end
