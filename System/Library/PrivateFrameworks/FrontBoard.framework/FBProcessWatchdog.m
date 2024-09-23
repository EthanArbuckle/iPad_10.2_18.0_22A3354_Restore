@implementation FBProcessWatchdog

- (id)_policyDesc
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  double v12;
  __CFString *v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[FBSProcessWatchdog policy](self, "policy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provisions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "type");
        if (v10)
          objc_msgSend(v10, "allowance");
        FBSProcessResourceAllowanceGetValue();
        FBSProcessResourceTimeIntervalForValue();
        if (v11 == 2)
        {
          v7 = v7 + v12;
        }
        else if (v11 == 1)
        {
          v8 = v8 + v12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }

  if (v8 <= 0.0 || v7 <= 0.0)
  {
    if (v8 <= 0.0)
    {
      if (v7 <= 0.0)
      {
        v13 = CFSTR("n/a");
        return v13;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2fs cpu"), *(_QWORD *)&v7, v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2fs"), *(_QWORD *)&v8, v15);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2fs cpu over %.2fs"), *(_QWORD *)&v7, *(_QWORD *)&v8);
  }
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v13;
}

- (int64_t)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuStatistics, 0);
  objc_storeStrong((id *)&self->_eventContext, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)activate
{
  FBProcessCPUStatistics *v3;
  FBProcessCPUStatistics *cpuStatistics;
  objc_super v5;

  if (self->_handle)
  {
    v3 = -[FBProcessCPUStatistics initWithProcessHandle:]([FBProcessCPUStatistics alloc], "initWithProcessHandle:", self->_handle);
    cpuStatistics = self->_cpuStatistics;
    self->_cpuStatistics = v3;

  }
  v5.receiver = self;
  v5.super_class = (Class)FBProcessWatchdog;
  -[FBSProcessWatchdog activate](&v5, sel_activate);
}

- (FBProcessWatchdog)initWithProcess:(id)a3 context:(id)a4 policy:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  FBProcessWatchdog *v13;
  uint64_t v14;
  RBSProcessHandle *handle;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "event");
  NSStringFromProcessWatchdogEvent(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)FBProcessWatchdog;
  v13 = -[FBSProcessWatchdog initWithName:process:policy:](&v17, sel_initWithName_process_policy_, v12, v8, v10);

  if (v13)
  {
    v13->_event = v11;
    objc_storeStrong((id *)&v13->_eventContext, a4);
    objc_msgSend(v8, "rbsHandle");
    v14 = objc_claimAutoreleasedReturnValue();
    handle = v13->_handle;
    v13->_handle = (RBSProcessHandle *)v14;

  }
  return v13;
}

- (FBProcessWatchdogEventContext)eventContext
{
  return self->_eventContext;
}

- (FBProcessCPUStatistics)cpuStatistics
{
  return self->_cpuStatistics;
}

@end
