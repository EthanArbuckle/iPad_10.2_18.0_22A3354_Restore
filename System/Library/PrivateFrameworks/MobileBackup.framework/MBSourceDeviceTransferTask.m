@implementation MBSourceDeviceTransferTask

- (int64_t)taskType
{
  return 1;
}

- (MBSourceDeviceTransferTask)initWithFileTransferSession:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MBSourceDeviceTransferTask;
  return -[MBDeviceTransferTask initWithFileTransferSession:](&v4, sel_initWithFileTransferSession_, a3);
}

- (BOOL)_startWithError:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint8_t buf[4];
  MBSourceDeviceTransferTask *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MBDeviceTransferTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  MBGetDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = self;
    _os_log_impl(&dword_1D5213000, v6, OS_LOG_TYPE_DEFAULT, "%@: Starting the device transfer task", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Starting the device transfer task", v7, v8, v9, v10, v11, v12, (uint64_t)self);
  }

  v13 = (void *)objc_opt_new();
  -[MBDeviceTransferTask fileTransferSession](self, "fileTransferSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFileTransferSession:", v14);

  -[MBDeviceTransferTask manager](self, "manager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    -[MBSourceDeviceTransferTask _startWithError:].cold.1();
  v16 = v15;
  v17 = objc_msgSend(v15, "startDeviceTransferWithTaskType:sessionInfo:error:", -[MBSourceDeviceTransferTask taskType](self, "taskType"), v13, a3);

  return v17;
}

- (void)start
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MBSourceDeviceTransferTask;
  -[MBDeviceTransferTask start](&v2, sel_start);
}

- (void)_cancel
{
  NSObject *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MBDeviceTransferTask queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[MBDeviceTransferTask manager](self, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v5 = objc_msgSend(v4, "cancelDeviceTransferWithTaskType:error:", -[MBSourceDeviceTransferTask taskType](self, "taskType"), &v17);
  v6 = v17;

  if ((v5 & 1) == 0)
  {
    MBGetDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[MBSourceDeviceTransferTask taskType](self, "taskType");
      *(_DWORD *)buf = 134218242;
      v19 = v8;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_ERROR, "Failed to cancel device transfer from source. taskType: %ld error:%@", buf, 0x16u);
      v9 = -[MBSourceDeviceTransferTask taskType](self, "taskType");
      _MBLog(CFSTR("ERROR"), (uint64_t)"Failed to cancel device transfer from source. taskType: %ld error:%@", v10, v11, v12, v13, v14, v15, v9);
    }

  }
  +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 202, CFSTR("Source device transfer canceled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[MBSourceDeviceTransferTask _finishWithError:](self, "_finishWithError:", v16);
}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MBSourceDeviceTransferTask;
  -[MBDeviceTransferTask cancel](&v2, sel_cancel);
}

- (void)_finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[MBDeviceTransferTask queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MBDeviceTransferTask setProgressHandler:](self, "setProgressHandler:", 0);
  v6.receiver = self;
  v6.super_class = (Class)MBSourceDeviceTransferTask;
  -[MBDeviceTransferTask _finishWithError:](&v6, sel__finishWithError_, v4);

}

- (void)_shortenPrebuddyExpirationIfNeeded
{
  id v2;

  +[MBPrebuddyManager sharedManager](MBPrebuddyManager, "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortenPrebuddyExpiration");

}

- (void)manager:(id)a3 didFinishDeviceTransferWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
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
  uint8_t buf[4];
  MBSourceDeviceTransferTask *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MBDeviceTransferTask queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  MBGetDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v22 = self;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_ERROR, "%@: Failed the source transfer task: %@", buf, 0x16u);
      _MBLog(CFSTR("ERROR"), (uint64_t)"%@: Failed the source transfer task: %@", v9, v10, v11, v12, v13, v14, (uint64_t)self);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = self;
      _os_log_impl(&dword_1D5213000, v8, OS_LOG_TYPE_DEFAULT, "%@: Finished the source transfer task", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"%@: Finished the source transfer task", v15, v16, v17, v18, v19, v20, (uint64_t)self);
    }

    -[MBSourceDeviceTransferTask _shortenPrebuddyExpirationIfNeeded](self, "_shortenPrebuddyExpirationIfNeeded");
  }
  -[MBSourceDeviceTransferTask _finishWithError:](self, "_finishWithError:", v5);

}

- (void)manager:(id)a3 didFinishDeviceTransferKeychainTransfer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  __assert_rtn("-[MBSourceDeviceTransferTask manager:didFinishDeviceTransferKeychainTransfer:]", "MBSourceDeviceTransferTask.m", 99, "0 && \"Unexpected call\");
}

- (void)manager:(id)a3 didFinishDeviceTransferPreflight:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  __assert_rtn("-[MBSourceDeviceTransferTask manager:didFinishDeviceTransferPreflight:error:]", "MBSourceDeviceTransferTask.m", 103, "0 && \"Unexpected call\");
}

- (void)manager:(id)a3 didUpdateDeviceTransferProgress:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[MBDeviceTransferTask queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  MBGetDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1D5213000, v7, OS_LOG_TYPE_DEFAULT, "Updated progress: %@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Updated progress: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v5);
  }

  -[MBDeviceTransferTask progressHandler](self, "progressHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[MBDeviceTransferTask progressHandler](self, "progressHandler");
    v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v15)[2](v15, v5);

  }
}

- (void)_startWithError:.cold.1()
{
  __assert_rtn("-[MBSourceDeviceTransferTask _startWithError:]", "MBSourceDeviceTransferTask.m", 43, "manager");
}

@end
