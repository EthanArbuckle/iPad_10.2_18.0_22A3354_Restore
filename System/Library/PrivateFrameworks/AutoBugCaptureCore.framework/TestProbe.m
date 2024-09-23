@implementation TestProbe

+ (void)autoBugCapturePath:(id *)a3 autoBugCaptureUID:(id *)a4 autoBugCaptureGID:(id *)a5
{
  BOOL v8;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  if (autoBugCapturePath)
    v8 = autoBugCaptureUID == 0;
  else
    v8 = 1;
  if (v8 || autoBugCaptureGID == 0)
  {
    +[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "logArchivePath");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)autoBugCapturePath;
      autoBugCapturePath = v12;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "logArchiveUID"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)autoBugCaptureUID;
      autoBugCaptureUID = v14;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "logArchiveGID"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)autoBugCaptureGID;
      autoBugCaptureGID = v16;

    }
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)autoBugCapturePath);
  if (a4)
    *a4 = objc_retainAutorelease((id)autoBugCaptureUID);
  if (a5)
    *a5 = objc_retainAutorelease((id)autoBugCaptureGID);
}

- (TestProbe)initWithQueue:(id)a3
{
  id v5;
  TestProbe *v6;
  TestProbe *v7;
  uint64_t v8;
  NSUUID *uuid;
  uint64_t v10;
  NSMutableArray *probeOutputFilePaths;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TestProbe;
  v6 = -[TestProbe init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v7->_uuid;
    v7->_uuid = (NSUUID *)v8;

    v7->_status = -1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    probeOutputFilePaths = v7->_probeOutputFilePaths;
    v7->_probeOutputFilePaths = (NSMutableArray *)v10;

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  TestProbe *v4;
  void *v5;
  char v6;

  v4 = (TestProbe *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[TestProbe uuid](v4, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqual:", self->_uuid);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)cancelTest:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TestProbe stopTest](self, "stopTest");
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 4);
    v4 = v5;
  }

}

+ (id)testProbeStatusString:(unsigned int)a3
{
  if (a3 + 1 > 6)
    return CFSTR("UNEXPECTED PROBE STATUS!");
  else
    return off_1EA3B5120[a3 + 1];
}

- (BOOL)startPeriodicTimer
{
  return 0;
}

- (BOOL)startPeriodicTimerAt:(unint64_t)a3 repeatInterval:(unint64_t)a4
{
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  TestProbe *v15;
  NSObject *v16;

  -[TestProbe queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);

  if (v8)
  {
    dispatch_source_set_timer(v8, a3, a4, 0);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __49__TestProbe_startPeriodicTimerAt_repeatInterval___block_invoke;
    v14 = &unk_1EA3B5010;
    v15 = self;
    v9 = v8;
    v16 = v9;
    dispatch_source_set_event_handler(v9, &v11);
    -[TestProbe setPeriodicTimer:](self, "setPeriodicTimer:", v9, v11, v12, v13, v14, v15);
    dispatch_resume(v9);

  }
  return v8 != 0;
}

uint64_t __49__TestProbe_startPeriodicTimerAt_repeatInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "periodicTimerFired:", *(_QWORD *)(a1 + 40));
}

- (void)stopPeriodicTimer
{
  void *v3;
  NSObject *v4;

  -[TestProbe periodicTimer](self, "periodicTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TestProbe periodicTimer](self, "periodicTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[TestProbe setPeriodicTimer:](self, "setPeriodicTimer:", 0);
  }
}

+ (void)loadCoreUtils
{
  return dlopen("/System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils", 6);
}

- (void)removeProbeOutputFiles
{
  NSObject *v3;
  _QWORD block[5];

  -[TestProbe queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__TestProbe_removeProbeOutputFiles__block_invoke;
  block[3] = &unk_1EA3B4960;
  block[4] = self;
  dispatch_async(v3, block);

}

void __35__TestProbe_removeProbeOutputFiles__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  char v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  NSObject *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "probeOutputFilePaths");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = v1;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v2, "fileExistsAtPath:", v8))
          {
            v13 = 0;
            v9 = objc_msgSend(v2, "removeItemAtPath:error:", v8, &v13);
            v10 = v13;
            if ((v9 & 1) == 0)
            {
              symptomsLogHandle();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v19 = v8;
                v20 = 2112;
                v21 = v10;
                _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_INFO, "Couldn't delete canceled file: %@ because %@", buf, 0x16u);
              }

            }
          }
          else
          {
            symptomsLogHandle();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v19 = v8;
              _os_log_impl(&dword_1DBAE1000, v10, OS_LOG_TYPE_ERROR, "Couldn't locate file at %@", buf, 0xCu);
            }
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v5);
    }

    v1 = v12;
  }

}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)diagSessionUUID
{
  return self->_diagSessionUUID;
}

- (void)setDiagSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_diagSessionUUID, a3);
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_source)periodicTimer
{
  return self->_periodicTimer;
}

- (void)setPeriodicTimer:(id)a3
{
  objc_storeStrong((id *)&self->_periodicTimer, a3);
}

- (NSMutableArray)probeOutputFilePaths
{
  return self->_probeOutputFilePaths;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeOutputFilePaths, 0);
  objc_storeStrong((id *)&self->_periodicTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_diagSessionUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
