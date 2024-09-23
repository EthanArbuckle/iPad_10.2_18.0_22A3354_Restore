@implementation DTProcessControlService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.processcontrol.capability.signal"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.processcontrol.capability.memorylimits"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.processcontrol.capability.viewdebuggingutils"), 1, a1);

}

- (DTProcessControlService)initWithChannel:(id)a3
{
  id v4;
  DTProcessControlService *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *deathNoteQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *synchronousRedirectionQueue;
  NSMutableArray *v10;
  NSMutableArray *pids;
  NSMutableArray *v12;
  NSMutableArray *sources;
  uint64_t v14;
  NSMutableDictionary *activeIODispatchSources;
  _QWORD v17[4];
  DTProcessControlService *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DTProcessControlService;
  v5 = -[DTXService initWithChannel:](&v19, sel_initWithChannel_, v4);
  if (v5)
  {
    v6 = dispatch_queue_create("process death queue", 0);
    deathNoteQueue = v5->_deathNoteQueue;
    v5->_deathNoteQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("I/O redirection queue", MEMORY[0x24BDAC9C0]);
    synchronousRedirectionQueue = v5->_synchronousRedirectionQueue;
    v5->_synchronousRedirectionQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pids = v5->_pids;
    v5->_pids = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sources = v5->_sources;
    v5->_sources = v12;

    v14 = objc_opt_new();
    activeIODispatchSources = v5->_activeIODispatchSources;
    v5->_activeIODispatchSources = (NSMutableDictionary *)v14;

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_222B5AE34;
    v17[3] = &unk_24EB27E30;
    v18 = v5;
    objc_msgSend(v4, "registerDisconnectHandler:", v17);

  }
  return v5;
}

- (void)startObservingPid:(id)a3
{
  id v4;
  int v5;
  NSObject *deathNoteQueue;
  id v7;
  _QWORD block[5];
  id v9;
  int v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "intValue");
  deathNoteQueue = self->_deathNoteQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B5AFF8;
  block[3] = &unk_24EB297D8;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_sync(deathNoteQueue, block);

}

- (void)stopObservingPid:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v8 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_pids, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndex:](self->_sources, "objectAtIndex:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_activeIODispatchSources, "objectForKeyedSubscript:", v8);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    dispatch_source_cancel(v6);

}

- (void)resumePid:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  int *v5;
  char *v6;
  task_read_t v7;
  int v8;
  int v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a3, "intValue");
  if (!(_DWORD)v3)
    return;
  v4 = v3;
  if ((_DWORD)v3 == getpid())
    return;
  if (!DTProcessIsSigStopped(v4))
    goto LABEL_7;
  if (kill(v4, 19))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v5 = __error();
      v6 = strerror(*v5);
      v8 = 67109378;
      v9 = v4;
      v10 = 2080;
      v11 = v6;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to resume pid %d with SIGCONT (%s), will attempt task_resume() if authorized", (uint8_t *)&v8, 0x12u);
    }
LABEL_7:
    v7 = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:", v4);
    if (v7 - 1 >= 0xFFFFFFFE
      && sub_222B5AF1C()
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v8 = 67109120;
      v9 = v4;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "no task port available to resume pid %d with task_resume()", (uint8_t *)&v8, 8u);
    }
    task_resume(v7);
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v7);
    return;
  }
  if (sub_222B5AF1C() && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v8 = 67109120;
    v9 = v4;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "sent SIGCONT to pid %d", (uint8_t *)&v8, 8u);
  }
}

- (void)suspendPid:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  task_read_t v5;
  mach_port_name_t v6;
  int *v7;
  char *v8;
  int v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a3, "intValue");
  if ((_DWORD)v3)
  {
    v4 = v3;
    if ((_DWORD)v3 != getpid())
    {
      v5 = +[DTInstrumentServer taskForPid:](DTInstrumentServer, "taskForPid:", v4);
      if (v5 - 1 >= 0xFFFFFFFE)
      {
        if (sub_222B5AF1C() && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          v9 = 67109120;
          v10 = v4;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "attempting suspend via SIGSTOP for pid %d", (uint8_t *)&v9, 8u);
        }
        if (kill(v4, 17))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v7 = __error();
            v8 = strerror(*v7);
            v9 = 67109378;
            v10 = v4;
            v11 = 2080;
            v12 = v8;
            _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to suspend pid %d with SIGSTOP: %s", (uint8_t *)&v9, 0x12u);
          }
        }
      }
      else
      {
        v6 = v5;
        task_suspend(v5);
        mach_port_deallocate(*MEMORY[0x24BDAEC58], v6);
      }
    }
  }
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6
{
  return (id)MEMORY[0x24BEDD108](self, sel_launchSuspendedProcessWithDevicePath_bundleIdentifier_environment_arguments_options_);
}

- (id)launchSuspendedProcessWithDevicePath:(id)a3 bundleIdentifier:(id)a4 environment:(id)a5 arguments:(id)a6 options:(id)a7
{
  void *v7;
  objc_class *v8;
  void *v9;

  v7 = (void *)MEMORY[0x24BDBCE88];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", CFSTR("DTProcessControlConcreteImplementationRequiredException"), CFSTR("launchSuspendedProcessWithDevicePath:bundleIdentifier:environment:arguments: not implemented in %@; subclass and override."),
    v9);

  return 0;
}

- (void)killPid:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_sendSignal_toPid_);
}

- (void)sendSignal:(id)a3 toPid:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  BOOL v11;
  int v12;
  id v14;

  v14 = a3;
  v6 = objc_msgSend(a4, "intValue");
  if ((_DWORD)v6)
  {
    v7 = v6;
    if ((_DWORD)v6 != getpid())
    {
      v8 = objc_msgSend(v14, "intValue");
      HIDWORD(v10) = v8 - 9;
      LODWORD(v10) = v8 - 9;
      v9 = v10 >> 1;
      v11 = v9 > 5;
      v12 = (1 << v9) & 0x39;
      if (v11 || v12 == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTProcessControlServiceSendSignalException"), CFSTR("Unsupported signal %i"), v8);
      if (kill(v7, v8) == -1)
      {
        if ((_DWORD)v8 != 15 && (_DWORD)v8 != 9 || *__error() != 3)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTProcessControlServiceSendSignalException"), CFSTR("Failed to send signal %i to process %i: %i"), v8, v7, *__error());
      }
      else if ((_DWORD)v8 == 15 || (_DWORD)v8 == 9)
      {
        -[DTProcessControlService cleanupPid:](self, "cleanupPid:", v7);
      }
    }
  }

}

- (void)_performMemoryWarningForPid:(int)a3
{
  unsigned int v3;

  v3 = a3;
  if (a3 >= 1)
  {
    if (sysctlbyname("kern.memorystatus_vm_pressure_send", 0, 0, &v3, 4uLL))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTSpringBoardProcessControlServiceException"), CFSTR("failed to send memory warning to %d"), v3);
  }
}

- (void)sendProcessControlEvent:(id)a3 toPid:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v6 = a4;
  DTProcessControlEventUnarchive(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "intValue");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[DTProcessControlService _performMemoryWarningForPid:](self, "_performMemoryWarningForPid:", v8);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
      objc_msgSend(v9, "objectForKey:", CFSTR("PCEventType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("MemoryEvent")))
      {
        -[DTProcessControlService _performMemoryWarningForPid:](self, "_performMemoryWarningForPid:", v8);
      }
      else if (objc_msgSend(v10, "isEqualToString:", CFSTR("MetricPayloadsExample")))
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("BundleIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11 && objc_msgSend(v11, "length") && NSClassFromString(CFSTR("MXSourceManager")))
        {
          objc_msgSend(MEMORY[0x24BE66910], "sharedManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "simulatePayloadDeliveryForClient:", v12);

        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BundleID is nil or empty. Couldn't deliver dummy payload", v14, 2u);
        }

      }
    }
  }

}

- (int)cleanupPid:(int)a3
{
  return 0x80000000;
}

- (id)requestDisableMemoryLimitsForPid:(int)a3
{
  int v4;
  int v5;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = memorystatus_control();
  if (v4)
  {
    v5 = v4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      v8 = a3;
      v9 = 1024;
      v10 = v5;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to disable active and inactive memory limits for pid %d (result = %d)", buf, 0xEu);
    }
    return (id)MEMORY[0x24BDBD1C0];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v8 = a3;
      v9 = 1024;
      v10 = 0;
      _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Disabled active and inactive memory limits for pid %d (result = %d)", buf, 0xEu);
    }
    return (id)MEMORY[0x24BDBD1C8];
  }
}

- (id)insertViewDebuggingLibrariesForPid:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  kern_return_t v12;
  kern_return_t v13;
  void *v14;
  RemoteBundleLoader *v15;
  void *v16;
  id v17;
  RemoteBundleLoader *v18;
  id v19;
  id v20;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  mach_port_name_t v27;
  mach_port_name_t v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v3 = *(_QWORD *)&a3;
  v34[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("/usr/lib/libViewDebuggerSupport.dylib");
  v7 = objc_msgSend(v5, "fileExistsAtPath:", CFSTR("/usr/lib/libViewDebuggerSupport.dylib"));

  if ((v7 & 1) != 0)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("/System/Developer/usr/lib/libViewDebuggerSupport.dylib");
  v9 = objc_msgSend(v8, "fileExistsAtPath:", CFSTR("/System/Developer/usr/lib/libViewDebuggerSupport.dylib"));

  if ((v9 & 1) != 0
    || (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = CFSTR("/Developer/Library/PrivateFrameworks/DTDDISupport.framework/libViewDebuggerSupport.dylib"),
        v11 = objc_msgSend(v10, "fileExistsAtPath:", CFSTR("/Developer/Library/PrivateFrameworks/DTDDISupport.framework/libViewDebuggerSupport.dylib")), v10, (v11 & 1) != 0))
  {
LABEL_4:
    v28 = 0;
    v12 = task_for_pid(*MEMORY[0x24BDAEC58], v3, &v28);
    if (v12)
    {
      v13 = v12;
      v31 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get task for pid %d"), v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v15 = (RemoteBundleLoader *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "invokeCompletionWithReturnValue:error:", 0, v16);
      v17 = v4;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        v30 = v3;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Got task for pid %d", buf, 8u);
      }
      v18 = [RemoteBundleLoader alloc];
      v15 = -[RemoteBundleLoader initWithTask:](v18, "initWithTask:", v28);
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = sub_222B5C2C0;
      v25[3] = &unk_24EB29BD8;
      v27 = v28;
      v19 = v4;
      v26 = v19;
      -[RemoteBundleLoader scheduleLibraryLoad:calling:arguments:callback:](v15, "scheduleLibraryLoad:calling:arguments:callback:", v6, CFSTR("_DBGViewHierarchyInitialize"), MEMORY[0x24BDBD1A8], v25);
      v20 = v19;
      v16 = v26;
    }

  }
  else
  {
    v33 = *MEMORY[0x24BDD0FC8];
    v34[0] = CFSTR("Couldn't locate view debugging support libraries");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.dt.instruments"), -1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invokeCompletionWithReturnValue:error:", 0, v23);
    v24 = v4;

  }
  return v4;
}

- (int)maybeRedirectFromFileDescriptor:(int)a3 fromPid:(int)a4 withScratchBuffer:(char *)a5 ofByteLength:(unint64_t)a6
{
  uint64_t v7;
  ssize_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  int v15;

  v7 = *(_QWORD *)&a4;
  v9 = read(a3, a5, a6 - 1);
  if (v9 < 0)
  {
    v14 = *__error();
    if (v14 == 35)
      v15 = 1;
    else
      v15 = 4;
    if (v14 == 4)
      return 2;
    else
      return v15;
  }
  else if (v9)
  {
    a5[v9] = 0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:typesAndArguments:", sel_outputReceived_fromProcess_atTime_, 11, v10, 3, v7, 6, mach_absolute_time(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DTXService channel](self, "channel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendMessageAsync:replyHandler:", v11, 0);

    return 0;
  }
  else
  {
    return 3;
  }
}

- (void)handleRedirectionIterationForFileDescriptor:(int)a3 forPid:(int)a4 withDispatchSource:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *source;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  source = a5;
  v8 = (_QWORD *)MEMORY[0x24BDB03C8];
  v9 = malloc_type_malloc(*MEMORY[0x24BDB03C8], 0x48FD2A4uLL);
  do
    v10 = -[DTProcessControlService maybeRedirectFromFileDescriptor:fromPid:withScratchBuffer:ofByteLength:](self, "maybeRedirectFromFileDescriptor:fromPid:withScratchBuffer:ofByteLength:", v6, v5, v9, *v8);
  while ((v10 & 0xFFFFFFFD) == 0);
  v11 = v10;
  free(v9);
  if ((v11 - 3) <= 1)
    dispatch_source_cancel(source);

}

- (void)watchOutputFileDescriptor:(int)a3 forPid:(int)a4
{
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *deathNoteQueue;
  NSObject *v13;
  _QWORD block[5];
  NSObject *v15;
  int v16;
  _QWORD v17[5];
  NSObject *v18;
  int v19;
  int v20;
  _QWORD v21[5];
  NSObject *v22;
  int v23;
  int v24;
  _QWORD handler[5];
  int v26;
  int v27;

  if ((a3 & 0x80000000) == 0)
  {
    v6 = dup(a3);
    v7 = fcntl(v6, 3);
    if (v7 != -1)
    {
      if ((v7 & 4) == 0)
        fcntl(v6, 4, v7 | 4u);
      v8 = dispatch_source_create(MEMORY[0x24BDACA00], v6, 0, (dispatch_queue_t)self->_deathNoteQueue);
      v9 = MEMORY[0x24BDAC760];
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = sub_222B5C718;
      handler[3] = &unk_24EB28188;
      handler[4] = self;
      v26 = v6;
      v27 = a4;
      dispatch_source_set_cancel_handler(v8, handler);
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = sub_222B5C7CC;
      v21[3] = &unk_24EB29990;
      v21[4] = self;
      v23 = v6;
      v24 = a4;
      v10 = v8;
      v22 = v10;
      dispatch_source_set_registration_handler(v10, v21);
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = sub_222B5C7DC;
      v17[3] = &unk_24EB29990;
      v17[4] = self;
      v19 = v6;
      v20 = a4;
      v11 = v10;
      v18 = v11;
      dispatch_source_set_event_handler(v11, v17);
      deathNoteQueue = self->_deathNoteQueue;
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = sub_222B5C7EC;
      block[3] = &unk_24EB297D8;
      v16 = a4;
      block[4] = self;
      v15 = v11;
      v13 = v11;
      dispatch_sync(deathNoteQueue, block);

    }
  }
}

- (void)watchOutputFileName:(id)a3 directory:(id)a4 forPid:(int)a5
{
  id v8;
  id v9;
  NSObject *synchronousRedirectionQueue;
  _QWORD v11[4];
  id v12;
  DTProcessControlService *v13;
  id v14;
  int v15;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    synchronousRedirectionQueue = self->_synchronousRedirectionQueue;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = sub_222B5C910;
    v11[3] = &unk_24EB29800;
    v12 = v8;
    v13 = self;
    v15 = a5;
    v14 = v9;
    dispatch_async(synchronousRedirectionQueue, v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronousRedirectionQueue, 0);
  objc_storeStrong((id *)&self->_deathNoteQueue, 0);
  objc_storeStrong((id *)&self->_activeIODispatchSources, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_pids, 0);
}

@end
