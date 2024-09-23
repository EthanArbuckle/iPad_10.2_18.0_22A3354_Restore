@implementation DTKPTriggerTime

- (DTKPTriggerTime)initWithCounterAllocatorProvider:(id)a3
{
  DTKPTriggerTime *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DTKPTriggerTime;
  result = -[DTKPTrigger initWithCounterAllocatorProvider:](&v4, sel_initWithCounterAllocatorProvider_, a3);
  if (result)
  {
    result->_sampleRate = 0;
    result->_profileEveryThread = 0;
    result->_timerID = -1;
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_timerID != -1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A %@ trigger was deallocated without freeing up its timer ID."), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", 0, 4294966893, v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)DTKPTriggerTime;
  -[DTKPTrigger dealloc](&v4, sel_dealloc);
}

+ (int)reinitializeKperf:(id *)a3
{
  void *v4;
  id *v5;
  uint64_t v6;
  int v7;

  if (qword_25576FA20)
  {
    free((void *)qword_25576FA20);
    qword_25576FA20 = 0;
    byte_25576FA28 = 0;
  }
  if (kperf_timer_count_set())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to set the number of kperf timers: %d"), *__error());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a3;
    v6 = 4294966894;
LABEL_5:
    v7 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", v5, v6, v4);

    return v7;
  }
  qword_25576FA20 = (uint64_t)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
  if (!qword_25576FA20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to allocate memory for kperf timers: %d."), *__error());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = a3;
    v6 = 4294967096;
    goto LABEL_5;
  }
  byte_25576FA28 = 1;
  return 0;
}

- (unint64_t)_recordConfigWordsIntoBuffer:(unint64_t *)a3
{
  void *v4;
  unint64_t v5;

  -[DTKPTrigger counterAllocator](self, "counterAllocator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "recordConfigWordsIntoBuffer:", a3);

  return v5;
}

- (unsigned)_timerIDAlloc
{
  unint64_t v2;

  if (byte_25576FA28 == 1)
  {
    v2 = 0;
    while (*(_BYTE *)(qword_25576FA20 + v2))
    {
      if (v2++ >= 7)
        goto LABEL_6;
    }
    *(_BYTE *)(qword_25576FA20 + v2) = 1;
  }
  else
  {
LABEL_6:
    LODWORD(v2) = -1;
  }
  return v2;
}

- (void)_timerIDDdealloc:(unsigned int)a3
{
  if (a3 > 7 || !byte_25576FA28 || !*(_BYTE *)(qword_25576FA20 + a3))
    sub_222BC6014();
  *(_BYTE *)(qword_25576FA20 + a3) = 0;
}

- (int)_configureTimer:(unsigned int)a3 actionID:(unsigned int)a4 period:(unint64_t)a5 userData:(unsigned int)a6
{
  int result;

  result = -4;
  if (a3 <= 7)
  {
    if (byte_25576FA28)
    {
      kperf_ns_to_ticks();
      kperf_timer_action_set();
      kperf_timer_period_set();
      kperf_action_userdata_set();
      return 0;
    }
  }
  return result;
}

- (int)start:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  NSObject *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  unsigned int v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[DTKPTrigger lock](self, "lock");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  v6 = (id)sDTKPLogClient;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    v24 = -[DTKPTrigger triggerID](self, "triggerID");
    v25 = 2048;
    v26 = -[DTKPTriggerTime sampleRate](self, "sampleRate") / 0x3E8;
    v27 = 2048;
    v28 = -[DTKPTrigger pmcEventCount](self, "pmcEventCount");
    _os_log_impl(&dword_222B17000, v6, OS_LOG_TYPE_DEBUG, "DTKPTriggerTime: Starting Time Trigger (%d). Period: %lld us. PMCs: %lu", buf, 0x1Cu);
  }

  v7 = -[DTKPTrigger collectKernelStacks](self, "collectKernelStacks");
  v8 = -[DTKPTrigger collectUserStacks](self, "collectUserStacks");
  v9 = -[DTKPTrigger pmcEventCount](self, "pmcEventCount");
  if (v7)
    v10 = 5;
  else
    v10 = 1;
  if (v8)
    v10 |= 8u;
  if (v9)
    v11 = v10 | 0x20;
  else
    v11 = v10;
  -[DTKPTrigger setSamplers:](self, "setSamplers:", v11);
  -[DTKPTrigger setActionID:](self, "setActionID:", -[DTKPTrigger _actionAlloc](self, "_actionAlloc"));
  if (-[DTKPTrigger actionID](self, "actionID"))
  {
    v12 = -[DTKPTrigger _setSamplers:forAction:](self, "_setSamplers:forAction:", -[DTKPTrigger samplers](self, "samplers"), -[DTKPTrigger actionID](self, "actionID"));
    if ((_DWORD)v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error setting the Time trigger samplers (0x%x)"), -[DTKPTrigger samplers](self, "samplers"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, v12, v13);

    }
    else
    {
      v16 = -[DTKPTrigger _setFilterByPid:forAction:](self, "_setFilterByPid:forAction:", -[DTKPTrigger targetPid](self, "targetPid"), -[DTKPTrigger actionID](self, "actionID"));
      if ((_DWORD)v16)
      {
        v17 = CFSTR("Error configuring the Time trigger task filter");
      }
      else
      {
        v20 = -[DTKPTriggerTime _timerIDAlloc](self, "_timerIDAlloc");
        self->_timerID = v20;
        if ((_DWORD)v20 == -1)
        {
          v17 = CFSTR("Error allocating a Time trigger ID");
          v16 = 0xFFFFFFFFLL;
        }
        else
        {
          v16 = -[DTKPTriggerTime _configureTimer:actionID:period:userData:](self, "_configureTimer:actionID:period:userData:", v20, -[DTKPTrigger actionID](self, "actionID"), -[DTKPTriggerTime sampleRate](self, "sampleRate"), -[DTKPTrigger triggerID](self, "triggerID"));
          if (!(_DWORD)v16)
          {
            if (-[DTKPTriggerTime profileEveryThread](self, "profileEveryThread"))
            {
              *(_DWORD *)buf = 1;
              if (sysctlbyname("kperf.lightweight_pet", 0, 0, buf, 4uLL))
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error enabling LPET mode: %d"), *__error());
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, 4294967290, v21);

                goto LABEL_18;
              }
              if (kperf_timer_pet_set())
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error enabling the PET mode timer: %d"), *__error());
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, 4294967290, v22);

                goto LABEL_18;
              }
            }
            v14 = 0;
            goto LABEL_18;
          }
          v17 = CFSTR("Error configuring the Time trigger action");
        }
      }
      v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, v16, v17);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error allocating a Time trigger action"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerTime", a3, 0xFFFFFFFFLL, v15);

  }
LABEL_18:
  -[DTKPTrigger lock](self, "lock");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v18);

  return v14;
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
  if (self->_timerID != -1)
  {
    -[DTKPTriggerTime _timerIDDdealloc:](self, "_timerIDDdealloc:");
    self->_timerID = -1;
  }
  -[DTKPTrigger lock](self, "lock");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v5);

  return 0;
}

- (unint64_t)triggerKind
{
  return 0;
}

- (unint64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(unint64_t)a3
{
  self->_sampleRate = a3;
}

- (BOOL)profileEveryThread
{
  return self->_profileEveryThread;
}

- (void)setProfileEveryThread:(BOOL)a3
{
  self->_profileEveryThread = a3;
}

- (unsigned)timerID
{
  return self->_timerID;
}

@end
