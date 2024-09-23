@implementation DTKPTrigger

- (DTKPTrigger)init
{
  return -[DTKPTrigger initWithCounterAllocatorProvider:](self, "initWithCounterAllocatorProvider:", 0);
}

- (DTKPTrigger)initWithCounterAllocatorProvider:(id)a3
{
  DTKPTriggerCounterAllocatorProvider *v4;
  DTKPTrigger *v5;
  DTKPTrigger *v6;
  unsigned int v7;
  unsigned int v8;
  dispatch_semaphore_t v9;
  OS_dispatch_semaphore *lock;
  objc_super v12;

  v4 = (DTKPTriggerCounterAllocatorProvider *)a3;
  v12.receiver = self;
  v12.super_class = (Class)DTKPTrigger;
  v5 = -[DTKPTrigger init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    do
    {
      v7 = __ldxr((unsigned int *)&unk_25576FCC0);
      v8 = v7 + 1;
    }
    while (__stxr(v8, (unsigned int *)&unk_25576FCC0));
    v5->_triggerID = v8;
    v9 = dispatch_semaphore_create(1);
    lock = v6->_lock;
    v6->_lock = (OS_dispatch_semaphore *)v9;

    *(_WORD *)&v6->_collectUserStacks = 0;
    v6->_targetPid = -3;
    v6->_counterAllocatorProvider = v4;
    v6->_requestsPMCSampling = 0;
    -[DTKPTrigger setSamplers:](v6, "setSamplers:", 0);
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_actionID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A %@ trigger was deallocated without freeing up its action ID."), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTrigger", 0, 4294966893, v3);

  }
  v4.receiver = self;
  v4.super_class = (Class)DTKPTrigger;
  -[DTKPTrigger dealloc](&v4, sel_dealloc);
}

+ (int)reinitializeKperf:(id *)a3
{
  void *v4;
  int v5;

  if (qword_25576FCC8)
  {
    free((void *)qword_25576FCC8);
    qword_25576FCC8 = 0;
  }
  if (kperf_action_count_set())
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to set the number of kperf actions: %d"), *__error());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTrigger", a3, 4294966894, v4);

    return v5;
  }
  else
  {
    qword_25576FCC8 = (uint64_t)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
    if (qword_25576FCC8)
    {
      byte_25576FCD0 = 1;
      return 0;
    }
    else
    {
      return DTKPSetErrorAndOrLogWithFileAndLine(1, (uint64_t)"DTKPTrigger", a3, 4294967096, CFSTR("Failed to allocate memory for kperf actions."));
    }
  }
}

- (int)start:(id *)a3
{
  __assert_rtn("-[DTKPTrigger start:]", "DTKPTrigger.m", 73, "0");
}

- (int)stop:(id *)a3
{
  __assert_rtn("-[DTKPTrigger stop:]", "DTKPTrigger.m", 77, "0");
}

- (unsigned)_actionAlloc
{
  unint64_t v2;

  if (byte_25576FCD0 == 1)
  {
    v2 = 1;
    while (*(_BYTE *)(qword_25576FCC8 + v2))
    {
      if (v2++ >= 0x1F)
        goto LABEL_6;
    }
    *(_BYTE *)(qword_25576FCC8 + v2) = 1;
  }
  else
  {
LABEL_6:
    LODWORD(v2) = 0;
  }
  return v2;
}

- (void)_actionDealloc:(unsigned int)a3
{
  BOOL v3;

  v3 = a3 - 1 > 0x1E || byte_25576FCD0 == 0;
  if (v3 || !*(_BYTE *)(qword_25576FCC8 + a3))
    sub_222BC7B9C();
  *(_BYTE *)(qword_25576FCC8 + a3) = 0;
}

- (int)_setSamplers:(unsigned int)a3 forAction:(unsigned int)a4
{
  unsigned int v4;
  int v5;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  _DWORD v14[2];
  __int16 v15;
  DTKPTrigger *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return -4;
  v4 = byte_25576FCD0 ? 32 : 0;
  if (v4 < a4)
    return -4;
  v7 = kperf_action_samplers_set();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("XRKPerfMaxFrames"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = objc_msgSend(v9, "intValue");
  else
    v10 = 128;
  v11 = kperf_action_ucallstack_depth_set();
  if (v11)
  {
    v12 = v11;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109634;
      v14[1] = v10;
      v15 = 2112;
      v16 = self;
      v17 = 1024;
      v18 = v12;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to set the maximum user callstack depth to %u on trigger: %@ - error %d", (uint8_t *)v14, 0x18u);
    }
  }
  if (v7)
    v5 = -1;
  else
    v5 = 0;

  return v5;
}

- (int)_setFilterByPid:(int)a3 forAction:(unsigned int)a4
{
  unsigned int v4;

  if (!a4)
    return -4;
  if (byte_25576FCD0)
    v4 = 32;
  else
    v4 = 0;
  if (v4 < a4)
    return -4;
  if (kperf_action_filter_set_by_pid())
    return -6;
  return 0;
}

- (DTKPCPUCounterAllocator)counterAllocator
{
  return (DTKPCPUCounterAllocator *)-[DTKPTriggerCounterAllocatorProvider counterAllocator](self->_counterAllocatorProvider, "counterAllocator");
}

- (DTKPCPUCounterAllocator)queryCounterAllocator
{
  return (DTKPCPUCounterAllocator *)-[DTKPTriggerCounterAllocatorProvider queryCounterAllocator](self->_counterAllocatorProvider, "queryCounterAllocator");
}

- (int)addPMCEventNamed:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  self->_requestsPMCSampling = 1;
  v6 = a3;
  -[DTKPTrigger counterAllocator](self, "counterAllocator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v7, "addPMCEventName:error:", v6, a4);

  return (int)a4;
}

- (unint64_t)pmcEventCount
{
  void *v2;
  unint64_t v3;

  -[DTKPTrigger queryCounterAllocator](self, "queryCounterAllocator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pmcEventCount");

  return v3;
}

- (unint64_t)triggerKind
{
  __assert_rtn("-[DTKPTrigger triggerKind]", "DTKPTrigger.m", 148, "false && \"Must be override by subclass.\");
}

- (const)triggerKindRepr
{
  return off_24EB2B578[-[DTKPTrigger triggerKind](self, "triggerKind")];
}

- (unsigned)triggerID
{
  return self->_triggerID;
}

- (int)targetPid
{
  return self->_targetPid;
}

- (void)setTargetPid:(int)a3
{
  self->_targetPid = a3;
}

- (BOOL)collectUserStacks
{
  return self->_collectUserStacks;
}

- (void)setCollectUserStacks:(BOOL)a3
{
  self->_collectUserStacks = a3;
}

- (BOOL)collectKernelStacks
{
  return self->_collectKernelStacks;
}

- (void)setCollectKernelStacks:(BOOL)a3
{
  self->_collectKernelStacks = a3;
}

- (unsigned)actionID
{
  return self->_actionID;
}

- (void)setActionID:(unsigned int)a3
{
  self->_actionID = a3;
}

- (unsigned)samplers
{
  return self->_samplers;
}

- (void)setSamplers:(unsigned int)a3
{
  self->_samplers = a3;
}

- (OS_dispatch_semaphore)lock
{
  return self->_lock;
}

- (DTKPTriggerCounterAllocatorProvider)counterAllocatorProvider
{
  return self->_counterAllocatorProvider;
}

- (BOOL)requestsPMCSampling
{
  return self->_requestsPMCSampling;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
