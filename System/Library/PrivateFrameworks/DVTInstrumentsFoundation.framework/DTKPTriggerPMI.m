@implementation DTKPTriggerPMI

- (unint64_t)_recordConfigWordsIntoBuffer:(unint64_t *)a3
{
  void *v4;
  unint64_t v5;

  -[DTKPTrigger counterAllocator](self, "counterAllocator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "recordConfigWordsIntoBuffer:", a3);

  return v5;
}

- (int)setPMIEventNamed:(id)a3 threshold:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  NSString *v11;
  NSString *pmiEventNameOrAlias;

  v8 = a3;
  -[DTKPTrigger counterAllocator](self, "counterAllocator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "setPMIEventName:pmiThreshold:error:", v8, a4, a5);

  if (v10)
  {
    v11 = 0;
    a4 = 0;
  }
  else
  {
    v11 = (NSString *)v8;
  }
  pmiEventNameOrAlias = self->_pmiEventNameOrAlias;
  self->_pmiEventNameOrAlias = v11;

  self->_thresholdCount = a4;
  return v10;
}

- (int)start:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  const char *v8;
  unint64_t thresholdCount;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[DTKPTrigger lock](self, "lock");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  v6 = (id)sDTKPLogClient;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = -[DTKPTrigger triggerID](self, "triggerID");
    v8 = -[NSString UTF8String](self->_pmiEventNameOrAlias, "UTF8String");
    thresholdCount = self->_thresholdCount;
    *(_DWORD *)buf = 67109890;
    v25 = v7;
    v26 = 2080;
    v27 = v8;
    v28 = 2048;
    v29 = thresholdCount;
    v30 = 2048;
    v31 = -[DTKPTrigger pmcEventCount](self, "pmcEventCount");
    _os_log_impl(&dword_222B17000, v6, OS_LOG_TYPE_DEBUG, "DTKPTriggerPMI: Starting PMI Trigger (%d). Event: %s. Threshold: %lld. PMCs: %lu", buf, 0x26u);
  }

  v10 = -[DTKPTrigger collectKernelStacks](self, "collectKernelStacks");
  v11 = -[DTKPTrigger collectUserStacks](self, "collectUserStacks");
  v12 = -[DTKPTrigger requestsPMCSampling](self, "requestsPMCSampling");
  if (v10)
    v13 = 4;
  else
    v13 = 0;
  if (v11)
    v13 |= 8u;
  if (v12)
    v14 = 33;
  else
    v14 = 1;
  -[DTKPTrigger setSamplers:](self, "setSamplers:", v14 | v13);
  -[DTKPTrigger setActionID:](self, "setActionID:", -[DTKPTrigger _actionAlloc](self, "_actionAlloc"));
  if (-[DTKPTrigger actionID](self, "actionID"))
  {
    -[DTKPTrigger actionID](self, "actionID");
    -[DTKPTrigger triggerID](self, "triggerID");
    kperf_action_userdata_set();
    -[DTKPTrigger counterAllocator](self, "counterAllocator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "configurePMIActionID:error:", -[DTKPTrigger actionID](self, "actionID"), a3);

    if (!v16)
    {
      -[DTKPTrigger counterAllocator](self, "counterAllocator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "configureHardwarePMIPeriods:", a3);

      if (!v16)
      {
        v18 = -[DTKPTrigger _setSamplers:forAction:](self, "_setSamplers:forAction:", -[DTKPTrigger samplers](self, "samplers"), -[DTKPTrigger actionID](self, "actionID"));
        if ((_DWORD)v18)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error setting the PMI trigger samplers (0x%x)"), -[DTKPTrigger samplers](self, "samplers"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerPMI", a3, v18, v19);

        }
        else
        {
          v23 = -[DTKPTrigger _setFilterByPid:forAction:](self, "_setFilterByPid:forAction:", -[DTKPTrigger targetPid](self, "targetPid"), -[DTKPTrigger actionID](self, "actionID"));
          if ((_DWORD)v23)
            v16 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerPMI", a3, v23, CFSTR("Error configuring the Time trigger task filter"));
          else
            v16 = 0;
        }
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error allocating a PMI trigger action"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerPMI", a3, 0xFFFFFFFFLL, v20);

  }
  -[DTKPTrigger lock](self, "lock");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v21);

  return v16;
}

- (int)stop:(id *)a3
{
  NSObject *v4;
  NSObject *v5;

  -[DTKPTrigger lock](self, "lock", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  if (-[DTKPTrigger actionID](self, "actionID"))
  {
    -[DTKPTrigger _actionDealloc:](self, "_actionDealloc:", -[DTKPTrigger actionID](self, "actionID"));
    -[DTKPTrigger setActionID:](self, "setActionID:", 0);
  }
  -[DTKPTrigger lock](self, "lock");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v5);

  return 0;
}

- (unint64_t)triggerKind
{
  return 1;
}

- (NSString)pmiEventNameOrAlias
{
  return self->_pmiEventNameOrAlias;
}

- (unint64_t)thresholdCount
{
  return self->_thresholdCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pmiEventNameOrAlias, 0);
}

@end
