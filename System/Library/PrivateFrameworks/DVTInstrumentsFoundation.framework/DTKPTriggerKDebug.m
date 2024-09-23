@implementation DTKPTriggerKDebug

- (DTKPTriggerKDebug)initWithCounterAllocatorProvider:(id)a3
{
  DTKPTriggerKDebug *v3;
  DTKPTriggerKDebug *v4;
  uint64_t v5;
  DTKPKDebugCodeSet *codeSet;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DTKPTriggerKDebug;
  v3 = -[DTKPTrigger initWithCounterAllocatorProvider:](&v8, sel_initWithCounterAllocatorProvider_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_filterMode = 0;
    v5 = objc_opt_new();
    codeSet = v4->_codeSet;
    v4->_codeSet = (DTKPKDebugCodeSet *)v5;

  }
  return v4;
}

- (void)clearCodeSet
{
  DTKPKDebugCodeSet *v3;
  DTKPKDebugCodeSet *codeSet;

  v3 = (DTKPKDebugCodeSet *)objc_opt_new();
  codeSet = self->_codeSet;
  self->_codeSet = v3;

}

- (void)addCodeSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DTKPTriggerKDebug codeSet](self, "codeSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addCodeSet:", v4);

}

- (void)enableClass:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[DTKPTriggerKDebug codeSet](self, "codeSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addClass:", v3);

}

- (void)enableClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[DTKPTriggerKDebug codeSet](self, "codeSet");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addClass:subclassID:", v5, v4);

}

- (void)enableClass:(unsigned __int8)a3 subclass:(unsigned __int8)a4 code:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v7 = a3;
  -[DTKPTriggerKDebug codeSet](self, "codeSet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addClass:subclassID:code:", v7, v6, v5);

}

- (void)enableDebugID:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(_QWORD *)&a3;
  -[DTKPTriggerKDebug codeSet](self, "codeSet");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCodes:", v6);

}

- (int)start:(id *)a3
{
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  int filterMode;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  _BOOL4 v14;
  _BOOL4 v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;
  void *v22;
  NSObject *v23;
  _DWORD v25[2];
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[DTKPTrigger lock](self, "lock");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  v6 = (id)sDTKPLogClient;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = -[DTKPTrigger triggerID](self, "triggerID");
    filterMode = self->_filterMode;
    -[DTKPTriggerKDebug codeSet](self, "codeSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v25[0] = 67109634;
    v25[1] = v7;
    v26 = 1024;
    v27 = filterMode;
    v28 = 2080;
    v29 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_222B17000, v6, OS_LOG_TYPE_DEBUG, "DTKPTriggerKDebug: Starting KDebug Trigger (%d). Filter Mode: %d. %s.", (uint8_t *)v25, 0x18u);

  }
  -[DTKPTriggerKDebug codeSet](self, "codeSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "kdebugCodes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 0;

  if (!v13)
  {
    v14 = -[DTKPTrigger collectKernelStacks](self, "collectKernelStacks");
    v15 = -[DTKPTrigger collectUserStacks](self, "collectUserStacks");
    v16 = -[DTKPTrigger pmcEventCount](self, "pmcEventCount");
    if (v14)
      v17 = 4;
    else
      v17 = 0;
    if (v15)
      v17 |= 8u;
    if (v16)
      v17 |= 0x20u;
    v18 = v17 | 1u;
    -[DTKPTrigger setSamplers:](self, "setSamplers:", v18);
    -[DTKPTrigger setActionID:](self, "setActionID:", -[DTKPTrigger _actionAlloc](self, "_actionAlloc"));
    if (!-[DTKPTrigger actionID](self, "actionID"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error allocating a Kdebug trigger action"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTriggerKDebug", a3, 0xFFFFFFFFLL, v22);

      goto LABEL_15;
    }
    -[DTKPTriggerKDebug codeSet](self, "codeSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "createKperfFilter");

    -[DTKPTrigger _setSamplers:forAction:](self, "_setSamplers:forAction:", v18, -[DTKPTrigger actionID](self, "actionID"));
    -[DTKPTrigger _setFilterByPid:forAction:](self, "_setFilterByPid:forAction:", -[DTKPTrigger targetPid](self, "targetPid"), -[DTKPTrigger actionID](self, "actionID"));
    kperf_kdebug_filter_set();
    -[DTKPTrigger actionID](self, "actionID");
    kperf_kdebug_action_set();
    +[DTKPKDebugCodeSet releaseKperfFilter:](DTKPKDebugCodeSet, "releaseKperfFilter:", v20);
  }
  v21 = 0;
LABEL_15:
  -[DTKPTrigger lock](self, "lock");
  v23 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v23);

  return v21;
}

- (int)stop:(id *)a3
{
  NSObject *v4;
  NSObject *v5;

  -[DTKPTrigger lock](self, "lock", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

  kperf_kdebug_filter_set();
  kperf_kdebug_action_set();
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
  return 2;
}

- (int)filterMode
{
  return self->_filterMode;
}

- (void)setFilterMode:(int)a3
{
  self->_filterMode = a3;
}

- (DTKPKDebugCodeSet)codeSet
{
  return self->_codeSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeSet, 0);
}

@end
