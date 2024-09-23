@implementation DTKPSession

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    DTKPSetupLogging();
}

+ (int)blessPid:(int)a3
{
  if (kperf_bless_set())
    return -1;
  else
    return 0;
}

- (DTKPSession)init
{
  __assert_rtn("-[DTKPSession init]", "DTKPSession.mm", 83, "0");
}

- (DTKPSession)initWithConfig:(id)a3 andAggregator:(id)a4
{
  id v7;
  id v8;
  id v9;
  id *v10;
  unsigned int v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DTKPSession;
  v9 = -[DTKPSession init](&v13, sel_init);
  v10 = (id *)v9;
  if (v9)
  {
    objc_storeStrong((id *)v9 + 11, a3);
    objc_storeStrong(v10 + 12, a4);
    do
      v11 = __ldxr((unsigned int *)&unk_25576FAC8);
    while (__stxr(v11 + 1, (unsigned int *)&unk_25576FAC8));
    *((_DWORD *)v10 + 2) = v11;
    *((_BYTE *)v10 + 104) = 10;
  }

  return (DTKPSession *)v10;
}

- (void)dealloc
{
  id v3;
  void *v4;
  objc_super v5;
  id v6;

  v6 = 0;
  -[DTKPSession stop:](self, "stop:", &v6);
  v3 = v6;
  v4 = v3;
  if (v3)
    NSLog(CFSTR("Error stopping recording while deallocating DTKPSession object: %@"), v3);

  v5.receiver = self;
  v5.super_class = (Class)DTKPSession;
  -[DTKPSession dealloc](&v5, sel_dealloc);
}

- (unsigned)sessionID
{
  return *((_DWORD *)self + 2);
}

- (id)swapOutCurrentDatastream:(id *)a3
{
  return (id)objc_msgSend(*((id *)self + 12), "swapOutCurrentDatastream:", a3);
}

- (id)_lockKPerf
{
  if (__ldxr(&qword_25576FAD0))
  {
    __clrex();
  }
  else if (!__stlxr((unint64_t)self, &qword_25576FAD0))
  {
    return 0;
  }
  sub_222B583A8(CFSTR("_lockKPerf: could not lock kperf. Likely another session just started."), -1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)_unlockKperf
{
  DTKPSession *v2;
  int result;

  v2 = (DTKPSession *)atomic_load(&qword_25576FAD0);
  if (v2 != self)
    return -1;
  result = 0;
  atomic_store(0, &qword_25576FAD0);
  return result;
}

- (BOOL)start:(id *)a3
{
  std::mutex *v5;
  id v6;
  BOOL v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;
  uint8_t buf[4];
  unsigned int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  if (CSTaskIsTranslated())
  {
    sub_222B583A8(CFSTR("ktrace cannot trace the system under Rosetta translation"), -500);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
      *a3 = v6;
    v7 = 0;
    *((_DWORD *)self + 20) = 4;
  }
  else
  {
    v8 = *((_DWORD *)self + 20);
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot start session unless it's idle. Current state: %s"), sub_222B587E8(v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      sub_222B583A8(v9, -500);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (a3)
        *a3 = v10;

    }
    else
    {
      v11 = (id)sDTKPLogClient;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v25 = -[DTKPSession sessionID](self, "sessionID");
        _os_log_impl(&dword_222B17000, v11, OS_LOG_TYPE_INFO, "DTKPSession: Starting recording. ID %d.", buf, 8u);
      }

      -[DTKPSession _lockKPerf](self, "_lockKPerf");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (a3)
      {
        v13 = 0;
        *a3 = v12;
      }
      if (!v12)
      {
        -[DTKPSession recordingPriority](self, "recordingPriority");
        if (kperf_bless_allow_preemption())
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not set the recording priority."));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          sub_222B583A8(v14, -6);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (a3)
            *a3 = v15;
          else
            v13 = v15;

        }
        else
        {
          objc_msgSend(*((id *)self + 11), "apply");
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (a3)
          {
            *a3 = v16;
            v17 = v13;
          }
          if (v16)
          {
            v13 = v17;
          }
          else
          {
            objc_msgSend(*((id *)self + 12), "start");
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v13 = v22;
            if (a3)
            {
              *a3 = v22;
              v13 = v17;
            }
            if (!v22)
            {
              v7 = 1;
              *((_DWORD *)self + 20) = 1;
              goto LABEL_29;
            }
            v23 = (id)objc_msgSend(*((id *)self + 11), "reset");
          }
        }
        -[DTKPSession _unlockKperf](self, "_unlockKperf");
      }
      *((_DWORD *)self + 20) = 4;
      if (!a3)
      {
        v18 = v13;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v18, "localizedDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          sub_222BC662C(v19, (uint64_t)buf, v20);
        }

      }
    }
    v7 = 0;
  }
LABEL_29:
  std::mutex::unlock(v5);
  return v7;
}

- (BOOL)pause:(id *)a3
{
  std::mutex *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint8_t buf[4];
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v6 = *((_DWORD *)self + 20);
  if (v6 == 1)
  {
    v7 = (id)sDTKPLogClient;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v15 = -[DTKPSession sessionID](self, "sessionID");
      _os_log_impl(&dword_222B17000, v7, OS_LOG_TYPE_INFO, "DTKPSession: Pausing recording. ID %d.", buf, 8u);
    }

    objc_msgSend(*((id *)self + 12), "pause");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      *((_DWORD *)self + 20) = 2;
      v12 = 1;
      goto LABEL_8;
    }
    sub_222B589E0(v8, a3);
    *((_DWORD *)self + 20) = 4;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot pause session session unless it's running. Current state: %s"), sub_222B587E8(v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B583A8(v10, -500);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    sub_222B589E0(v11, a3);
  }
  v12 = 0;
LABEL_8:
  std::mutex::unlock(v5);
  return v12;
}

- (BOOL)resume:(id *)a3
{
  std::mutex *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint8_t buf[4];
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v6 = *((_DWORD *)self + 20);
  if (v6 == 2)
  {
    v7 = (id)sDTKPLogClient;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v15 = -[DTKPSession sessionID](self, "sessionID");
      _os_log_impl(&dword_222B17000, v7, OS_LOG_TYPE_INFO, "DTKPSession: Resuming recording. ID %d.", buf, 8u);
    }

    objc_msgSend(*((id *)self + 12), "resume");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      v12 = 1;
      *((_DWORD *)self + 20) = 1;
      goto LABEL_8;
    }
    sub_222B589E0(v8, a3);
    *((_DWORD *)self + 20) = 4;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot resume session unless it's paused. Current state: %s"), sub_222B587E8(v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B583A8(v10, -500);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    sub_222B589E0(v11, a3);
  }
  v12 = 0;
LABEL_8:
  std::mutex::unlock(v5);
  return v12;
}

- (BOOL)stop:(id *)a3
{
  std::mutex *v5;
  int v6;
  BOOL v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  _DWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  v6 = *((_DWORD *)self + 20);
  if ((v6 - 1) < 2)
  {
    v10 = (id)sDTKPLogClient;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109120;
      v17[1] = -[DTKPSession sessionID](self, "sessionID");
      _os_log_impl(&dword_222B17000, v10, OS_LOG_TYPE_INFO, "DTKPSession: Stopping recording. ID %d.", (uint8_t *)v17, 8u);
    }

    objc_msgSend(*((id *)self + 12), "stop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      sub_222B589E0(v11, a3);
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(*((id *)self + 11), "reset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      sub_222B589E0(v14, a3);
      v13 = 1;
    }
    v7 = v13 == 0;
    if (v13)
      v15 = 4;
    else
      v15 = 3;
    *((_DWORD *)self + 20) = v15;

    goto LABEL_16;
  }
  v7 = 1;
  if (v6 == 4)
  {
LABEL_16:
    -[DTKPSession _unlockKperf](self, "_unlockKperf");
    goto LABEL_17;
  }
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot stop a session which is currently idle."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_222B583A8(v8, -500);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    sub_222B589E0(v9, a3);
    v7 = 0;
  }
LABEL_17:
  std::mutex::unlock(v5);
  return v7;
}

- (BOOL)isActive
{
  DTKPSession *v2;
  std::mutex *v3;

  v2 = self;
  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  LOBYTE(v2) = (*((_DWORD *)v2 + 20) - 1) < 2;
  std::mutex::unlock(v3);
  return (char)v2;
}

- (BOOL)isPaused
{
  DTKPSession *v2;
  std::mutex *v3;

  v2 = self;
  v3 = (std::mutex *)((char *)self + 16);
  std::mutex::lock((std::mutex *)((char *)self + 16));
  LOBYTE(v2) = *((_DWORD *)v2 + 20) == 2;
  std::mutex::unlock(v3);
  return (char)v2;
}

- (unsigned)recordingPriority
{
  return *((_BYTE *)self + 104);
}

- (void)setRecordingPriority:(unsigned __int8)a3
{
  *((_BYTE *)self + 104) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 12, 0);
  objc_storeStrong((id *)self + 11, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 16));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 850045863;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((_QWORD *)self + 9) = 0;
  return self;
}

@end
