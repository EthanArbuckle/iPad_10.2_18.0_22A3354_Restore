@implementation BSMIGServer

- (BSMIGServer)initWithPortName:(id)a3 subsystem:(mig_subsystem *)a4 separateThread:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  BSMIGServer *v9;
  uint64_t v10;
  NSString *portName;
  _QWORD v13[4];
  BSMIGServer *v14;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BSMIGServer;
  v9 = -[BSMIGServer init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    portName = v9->_portName;
    v9->_portName = (NSString *)v10;

    v9->_subsystem = a4;
    if (v5)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__BSMIGServer_initWithPortName_subsystem_separateThread___block_invoke;
      v13[3] = &unk_1E1EBF870;
      v14 = v9;
      BSPthreadCreate(v13);

    }
    else
    {
      v9->_thread = pthread_self();
      -[BSMIGServer _start]((uint64_t)v9);
    }
  }

  return v9;
}

void __57__BSMIGServer_initWithPortName_subsystem_separateThread___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = a2;
    -[BSMIGServer _start](*(_QWORD *)(a1 + 32));
  }
  else
  {
    BSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = 136315138;
      v4 = "-[BSMIGServer initWithPortName:subsystem:separateThread:]_block_invoke";
      _os_log_error_impl(&dword_18A184000, v2, OS_LOG_TYPE_ERROR, "%s ERROR: unable to create new pthread", (uint8_t *)&v3, 0xCu);
    }

  }
}

- (uint64_t)_start
{
  uint64_t v1;
  id v2;
  id v3;
  int v4;
  ipc_space_t *v5;
  mach_error_t inserted;
  uint64_t v7;
  __CFRunLoopSource *v8;
  __CFRunLoop *Current;
  const __CFString *v10;
  char *v11;
  NSObject *v12;
  __CFRunLoop *v13;
  __CFRunLoopObserver *v14;
  CFMutableArrayRef Mutable;
  const __CFString *v16;
  char *v17;
  mach_port_name_t name;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  _BYTE context[48];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = *(id *)(result + 8);
    BSPthreadSetName(*(_QWORD *)(v1 + 24), v2);

    v3 = *(id *)(v1 + 8);
    name = 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    memset(context, 0, sizeof(context));
    objc_msgSend(v3, "getCString:maxLength:encoding:", context, 128, 1);
    v4 = bootstrap_check_in2();
    v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    if (v4)
    {
      inserted = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name);
      if (inserted
        || (inserted = mach_port_insert_right(*v5, name, name, 0x14u)) != 0
        || (inserted = bootstrap_register2(), mach_port_deallocate(*v5, name), inserted))
      {
        mach_port_mod_refs(*v5, name, 1u, -1);
        v17 = 0;
        v11 = mach_error_string(inserted);
        asprintf(&v17, "Couldn't register %s with the bootstrap server. Error: %s (%d).\nThis generally means that another instance of this process was already running or is hung in the debugger.", context, v11, inserted);
        BSLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[BSMIGServer _createPortNamed:]";
          v21 = 2082;
          v22 = v17;
          _os_log_error_impl(&dword_18A184000, v12, OS_LOG_TYPE_ERROR, "%s %{public}s", buf, 0x16u);
        }

        abort();
      }
    }
    v7 = name;

    *(_DWORD *)(v1 + 16) = v7;
    *(_DWORD *)buf = 16;
    MEMORY[0x18D769990](*v5, v7, 1, buf, 1);
    v8 = BSCreateMIGServerSourceWithContext(*(_QWORD *)(v1 + 32), *(_DWORD *)(v1 + 16), 0, 0);
    Current = CFRunLoopGetCurrent();
    v10 = (const __CFString *)*MEMORY[0x1E0C9B270];
    CFRunLoopAddSource(Current, v8, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(v8);
    result = pthread_main_np();
    if (!(_DWORD)result)
    {
      if (!_CFRunLoopSetPerCalloutAutoreleasepoolEnabled())
      {
        v13 = CFRunLoopGetCurrent();
        v14 = *(__CFRunLoopObserver **)(v1 + 40);
        if (!v14)
        {
          Mutable = CFArrayCreateMutable(0, 0, 0);
          *(_QWORD *)context = 0;
          *(_QWORD *)&context[8] = Mutable;
          *(_QWORD *)&context[16] = MEMORY[0x1E0C98BD0];
          *(_QWORD *)&context[24] = MEMORY[0x1E0C98BC0];
          *(_QWORD *)&context[32] = MEMORY[0x1E0C98350];
          *(_QWORD *)(v1 + 40) = CFRunLoopObserverCreate(0, 1uLL, 1u, -2147483647, (CFRunLoopObserverCallBack)_wrapRunLoopWithAutoreleasePoolHandler, (CFRunLoopObserverContext *)context);
          *(_QWORD *)(v1 + 48) = CFRunLoopObserverCreate(0, 0xA0uLL, 1u, 0x7FFFFFFFLL, (CFRunLoopObserverCallBack)_wrapRunLoopWithAutoreleasePoolHandler, (CFRunLoopObserverContext *)context);
          CFRunLoopAddObserver(v13, *(CFRunLoopObserverRef *)(v1 + 40), v10);
          CFRunLoopAddObserver(v13, *(CFRunLoopObserverRef *)(v1 + 48), v10);
          CFRelease(Mutable);
          v14 = *(__CFRunLoopObserver **)(v1 + 40);
        }
        v16 = (const __CFString *)*MEMORY[0x1E0C9B280];
        if (!CFRunLoopContainsObserver(v13, v14, (CFRunLoopMode)*MEMORY[0x1E0C9B280]))
        {
          CFRunLoopAddObserver(v13, *(CFRunLoopObserverRef *)(v1 + 40), v16);
          CFRunLoopAddObserver(v13, *(CFRunLoopObserverRef *)(v1 + 48), v16);
        }
      }
      while (1)
        CFRunLoopRun();
    }
  }
  return result;
}

- (BSMIGServer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSMIGServer.m"), 83, CFSTR("wrong initializer"));

  return 0;
}

- (int)threadPriority
{
  _opaque_pthread_t *thread;
  int v4;
  sched_param v5;

  thread = self->_thread;
  v5 = 0;
  v4 = 0;
  pthread_getschedparam(thread, &v4, &v5);
  return v5.sched_priority;
}

- (void)setThreadPriority:(int)a3
{
  if (!pthread_main_np())
    BSPthreadSetFixedPriority(self->_thread, a3);
}

- (NSString)threadName
{
  void *v2;
  void *v3;

  BSPthreadGetName(self->_thread);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portName, 0);
}

@end
