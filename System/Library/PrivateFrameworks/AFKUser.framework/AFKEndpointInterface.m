@implementation AFKEndpointInterface

+ (id)withService:(unsigned int)a3
{
  return -[AFKEndpointInterface initWithService:]([AFKEndpointInterface alloc], "initWithService:", *(_QWORD *)&a3);
}

+ (id)withService:(unsigned int)a3 properties:(id)a4
{
  uint64_t v4;
  id v5;
  AFKEndpointInterface *v6;
  uint64_t v7;
  NSMutableDictionary *properties;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = -[AFKEndpointInterface initWithService:]([AFKEndpointInterface alloc], "initWithService:", v4);
  if (v6)
  {
    v7 = objc_msgSend(v5, "mutableCopy");
    properties = v6->_properties;
    v6->_properties = (NSMutableDictionary *)v7;

  }
  return v6;
}

- (AFKEndpointInterface)initWithService:(unsigned int)a3
{
  AFKEndpointInterface *v5;

  if (IOObjectRetain(a3))
  {
    v5 = 0;
  }
  else
  {
    self->_service = a3;
    IORegistryEntryGetRegistryEntryID(a3, &self->_regID);
    v5 = self;
  }

  return v5;
}

- (void)activate
{
  -[AFKEndpointInterface activate:](self, "activate:", 0);
}

- (void)activate:(unsigned int)a3
{
  uint64_t v4;
  unsigned int *p_state;
  unsigned int v6;
  OS_dispatch_queue *v7;
  unsigned int *v8;
  unsigned int *p_connect;
  kern_return_t v10;
  NSMutableDictionary *properties;
  _QWORD *v12;
  NSSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  size_t v18;
  IONotificationPort *v19;
  unint64_t v20;
  mach_port_t NotificationPort;
  OS_dispatch_mach *v22;
  OS_dispatch_mach *dataQueueMachChannel;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *queue;
  uint64_t v28;
  unint64_t v29;
  NSMutableDictionary *v30;
  void *v31;
  _QWORD block[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id location;
  unint64_t v40;
  _IODataQueueMemory *v41;
  __int128 v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  AFKEndpointInterface *v46;
  _BYTE v47[128];
  _QWORD v48[4];
  uint8_t buf[32];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t input[5];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = 0;
  input[1] = a3;
  v40 = 0;
  v41 = 0;
  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __33__AFKEndpointInterface_activate___block_invoke;
  v37[3] = &unk_1E94E5AE8;
  objc_copyWeak(&v38, &location);
  v31 = (void *)MEMORY[0x1D824BDFC](v37);
  p_state = &self->_state;
  do
    v6 = __ldaxr(p_state);
  while (__stlxr(v6 | 1, p_state));
  if ((v6 & 1) != 0)
    goto LABEL_34;
  v7 = self->_queue;
  if (!v7)
  {
    v48[0] = 0;
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    memset(buf, 0, sizeof(buf));
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    LODWORD(v42) = 134217984;
    *(_QWORD *)((char *)&v42 + 4) = 0;
    _os_log_send_and_compose_impl();
    v24 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v24);
  }

  v8 = (unsigned int *)MEMORY[0x1E0C83DA0];
  p_connect = &self->_connect;
  v10 = IOServiceOpen(self->_service, *MEMORY[0x1E0C83DA0], 0x696F706Bu, &self->_connect);
  if (v10)
  {
    _AFKUserLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[AFKEndpointInterface regID](self, "regID");
      -[AFKMemoryDescriptorManager initWithService:].cold.3();
    }
    goto LABEL_54;
  }
  properties = self->_properties;
  if (properties)
  {
    v10 = IOConnectSetCFProperties(*p_connect, properties);
    if (v10)
    {
      _AFKUserLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = -[AFKEndpointInterface regID](self, "regID");
        v30 = self->_properties;
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v30;
        _os_log_error_impl(&dword_1D3221000, v25, OS_LOG_TYPE_ERROR, "0x%llx: Set IOConnectSetCFProperties:0x%x for:%@", buf, 0x1Cu);
      }
LABEL_54:
      v12 = 0;
      goto LABEL_55;
    }
  }
  if (self->_reportHandler)
    input[0] |= 1uLL;
  if (self->_commandHandlerWithReturn || self->_commandHandler)
    input[0] |= 2uLL;
  if (self->_descriptorHandler)
    input[0] |= 3uLL;
  if (-[NSSet count](self->_descriptorManagers, "count"))
  {
    if (-[NSSet count](self->_descriptorManagers, "count") >= 0x10000)
    {
      v48[0] = 0;
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      memset(buf, 0, sizeof(buf));
      os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      LODWORD(v42) = 134217984;
      *(_QWORD *)((char *)&v42 + 4) = 0;
      _os_log_send_and_compose_impl();
      v28 = _os_crash_msg();
      -[AFKEndpointInterface activate:].cold.1(v28);
    }
    v12 = malloc_type_calloc(-[NSSet count](self->_descriptorManagers, "count"), 8uLL, 0x100004000313F17uLL);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = self->_descriptorManagers;
    v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    if (v14)
    {
      v15 = 0;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v12[v15 + i] = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "regID");
        }
        v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
        v15 += i;
      }
      while (v14);
    }

    v4 = MEMORY[0x1E0C809B0];
    v18 = 8 * -[NSSet count](self->_descriptorManagers, "count");
  }
  else
  {
    v18 = 0;
    v12 = 0;
  }
  v19 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  self->_asyncPort = v19;
  if (v19)
  {
    IONotificationPortSetDispatchQueue(v19, (dispatch_queue_t)self->_queue);
    v10 = MEMORY[0x1D824BB68](*p_connect, 0, *v8, &v41, &v40, 1);
    if (!v10)
    {
      v20 = v40;
      self->_dataQueue = v41;
      self->_dataQueueSize = v20;
      NotificationPort = IODataQueueAllocateNotificationPort();
      self->_dataQueuePort = NotificationPort;
      if (NotificationPort)
      {
        v22 = (OS_dispatch_mach *)dispatch_mach_create();
        dataQueueMachChannel = self->_dataQueueMachChannel;
        self->_dataQueueMachChannel = v22;

        if (self->_dataQueueMachChannel)
        {
          dispatch_mach_connect();
          objc_storeStrong(&self->me, self);
          v10 = MEMORY[0x1D824BB80](self->_connect, 0, self->_dataQueuePort, 0);
          if (v10)
          {
            _AFKUserLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              -[AFKEndpointInterface regID](self, "regID");
              -[AFKEndpointInterface activate:].cold.6();
            }
          }
          else
          {
            v10 = IOConnectCallMethod(*p_connect, 0, input, 2u, v12, v18, 0, 0, 0, 0);
            if (!v10)
              goto LABEL_32;
            _AFKUserLog();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              -[AFKEndpointInterface regID](self, "regID");
              -[AFKEndpointInterface activate:].cold.5();
            }
          }
          goto LABEL_55;
        }
        _AFKUserLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[AFKEndpointInterface activate:].cold.4((uint64_t)buf, -[AFKEndpointInterface regID](self, "regID"), v26);
      }
      else
      {
        _AFKUserLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[AFKEndpointInterface activate:].cold.3((uint64_t)buf, -[AFKEndpointInterface regID](self, "regID"), v26);
      }

      goto LABEL_32;
    }
    _AFKUserLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[AFKEndpointInterface regID](self, "regID");
      -[AFKMemoryDescriptor mapDescriptor].cold.1();
    }
  }
  else
  {
    _AFKUserLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v10 = -536870210;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[AFKEndpointInterface activate:].cold.2((uint64_t)v48, -[AFKEndpointInterface regID](self, "regID"), v25);
  }
LABEL_55:

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy_;
  *(_QWORD *)&v50 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.IOKit"), v10, 0);
  *((_QWORD *)&v50 + 1) = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v42 = 0;
  *((_QWORD *)&v42 + 1) = &v42;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = self;
  queue = self->_queue;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __33__AFKEndpointInterface_activate___block_invoke_18;
  block[3] = &unk_1E94E5B10;
  block[4] = &v42;
  block[5] = buf;
  dispatch_async(queue, block);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(buf, 8);
LABEL_32:
  if (v12)
    free(v12);
LABEL_34:

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);
}

void __33__AFKEndpointInterface_activate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = v9;
    v7 = WeakRetained;
    v8 = v7;
    if (a2 == 8)
    {
      objc_msgSend(v7, "_cancel");
    }
    else if (a2 == 2)
    {
      objc_msgSend(v7, "dequeueDataMessage:", v7[13]);
    }

  }
}

uint64_t __33__AFKEndpointInterface_activate___block_invoke_18(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 96);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)cancel
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

uint64_t __30__AFKEndpointInterface_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void)_cancel
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  uint64_t v5;

  v4 = (OS_dispatch_queue *)a3;
  if (self->_queue)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v5 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v5);
  }
  self->_queue = v4;

}

- (void)setResponseHandler:(id)a3
{
  void *v4;
  id responseHandler;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }
  v4 = (void *)MEMORY[0x1D824BDFC]();
  responseHandler = self->_responseHandler;
  self->_responseHandler = v4;

}

- (void)setReportHandler:(id)a3
{
  void *v4;
  id reportHandler;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }
  v4 = (void *)MEMORY[0x1D824BDFC]();
  reportHandler = self->_reportHandler;
  self->_reportHandler = v4;

}

- (void)setCommandHandlerWithReturn:(id)a3
{
  void *v4;
  id commandHandlerWithReturn;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }
  v4 = (void *)MEMORY[0x1D824BDFC]();
  commandHandlerWithReturn = self->_commandHandlerWithReturn;
  self->_commandHandlerWithReturn = v4;

}

- (void)setCommandHandler:(id)a3
{
  void *v4;
  id commandHandler;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }
  v4 = (void *)MEMORY[0x1D824BDFC]();
  commandHandler = self->_commandHandler;
  self->_commandHandler = v4;

}

- (void)setDescriptorHandler:(id)a3
{
  void *v4;
  id descriptorHandler;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }
  v4 = (void *)MEMORY[0x1D824BDFC]();
  descriptorHandler = self->_descriptorHandler;
  self->_descriptorHandler = v4;

}

- (void)setDescriptorManagers:(id)a3
{
  NSSet *v4;
  NSSet *v5;
  NSSet *descriptorManagers;
  uint64_t v7;
  uint64_t v8;

  v4 = (NSSet *)a3;
  v5 = v4;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v7 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v7);
  }
  if (-[NSSet count](v4, "count") >= 0x10000)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v8 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v8);
  }
  descriptorManagers = self->_descriptorManagers;
  self->_descriptorManagers = v5;

}

- (void)setEventHandler:(id)a3
{
  void *v4;
  id eventHandler;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (self->_state)
  {
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }
  v4 = (void *)MEMORY[0x1D824BDFC]();
  eventHandler = self->_eventHandler;
  self->_eventHandler = v4;

}

- (void)dealloc
{
  mach_port_name_t dataQueuePort;
  io_object_t service;
  unsigned int state;
  uint64_t v6;
  objc_super v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_queue && self->_state != 7)
  {
    v8 = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    state = self->_state;
    v9 = 67109120;
    v10 = state;
    _os_log_send_and_compose_impl();
    v6 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v6);
  }
  dataQueuePort = self->_dataQueuePort;
  if (dataQueuePort)
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], dataQueuePort, 1u, -1);
  service = self->_service;
  if (service)
  {
    IOObjectRelease(service);
    self->_service = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AFKEndpointInterface;
  -[AFKEndpointInterface dealloc](&v7, sel_dealloc);
}

- (int)enqueueCommand:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 outputPayloadSize:(unint64_t)a7 context:(void *)a8 options:(unsigned int)a9
{
  _QWORD *v16;
  kern_return_t v17;
  uint64_t v19;
  uint64_t input[11];

  input[10] = *MEMORY[0x1E0C80C00];
  if (self->_state != 1)
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1(&v19, input);
  kdebug_trace();
  v16 = malloc_type_calloc(0x18uLL, 1uLL, 0x3EB6965uLL);
  v16[2] = a7;
  *v16 = a8;
  input[0] = a3;
  input[1] = a4;
  input[2] = (uint64_t)a5;
  input[3] = a6;
  input[4] = (uint64_t)v16;
  input[5] = a7;
  input[6] = ~(a9 >> 2) & 8 | a9;
  v17 = IOConnectCallMethod(self->_connect, 2u, input, 7u, 0, 0, 0, 0, 0, 0);
  if (v17)
    free(v16);
  return v17;
}

- (int)enqueueCommand:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 outputPayloadSize:(unint64_t)a6 context:(void *)a7 options:(unsigned int)a8
{
  uint64_t v9;

  LODWORD(v9) = a8;
  return -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:](self, "enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:", *(_QWORD *)&a3, 0, a4, a5, a6, a7, v9);
}

- (int)enqueueCommandSync:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 responseTimestamp:(unint64_t *)a7 outputBuffer:(void *)a8 inOutBufferSize:(unint64_t *)a9 options:(unsigned int)a10
{
  int result;
  uint64_t v18;
  unint64_t v19;
  uint64_t outputCnt;
  uint64_t input[11];

  input[10] = *MEMORY[0x1E0C80C00];
  if (self->_state != 1)
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1(&outputCnt, input);
  kdebug_trace();
  input[0] = a3;
  input[1] = a4;
  input[2] = a10;
  input[3] = (uint64_t)a8;
  input[4] = *a9;
  LODWORD(outputCnt) = 2;
  result = IOConnectCallMethod(self->_connect, 7u, input, 5u, a5, a6, &v18, (uint32_t *)&outputCnt, 0, 0);
  if (!result)
  {
    result = -536870210;
    if ((_DWORD)outputCnt == 2)
    {
      if (v19 <= *a9)
      {
        *a9 = v19;
        result = 0;
        if (a7)
          *a7 = v18;
      }
    }
    else
    {
      return -536870199;
    }
  }
  return result;
}

- (int)enqueueReport:(unsigned int)a3 timestamp:(unint64_t)a4 inputBuffer:(const void *)a5 inputBufferSize:(unint64_t)a6 options:(unsigned int)a7
{
  uint64_t v14;
  uint64_t input[11];

  input[10] = *MEMORY[0x1E0C80C00];
  if (self->_state != 1)
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1(&v14, input);
  kdebug_trace();
  input[0] = a3;
  input[1] = a4;
  input[2] = ~(4 * a7) & 0x20 | a7;
  return IOConnectCallMethod(self->_connect, 4u, input, 3u, a5, a6, 0, 0, 0, 0);
}

- (int)enqueueReport:(unsigned int)a3 inputBuffer:(const void *)a4 inputBufferSize:(unint64_t)a5 options:(unsigned int)a6
{
  return -[AFKEndpointInterface enqueueReport:timestamp:inputBuffer:inputBufferSize:options:](self, "enqueueReport:timestamp:inputBuffer:inputBufferSize:options:", *(_QWORD *)&a3, 0, a4, a5, *(_QWORD *)&a6);
}

- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 timestamp:(unint64_t)a5 outputBuffer:(void *)a6 outputBufferSize:(unint64_t)a7 options:(unsigned int)a8
{
  uint64_t v16;
  uint64_t input[11];

  input[10] = *MEMORY[0x1E0C80C00];
  if (self->_state != 1)
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1(&v16, input);
  kdebug_trace();
  input[0] = (uint64_t)a3;
  input[1] = a4;
  input[2] = a5;
  input[3] = a8 | 8;
  return IOConnectCallMethod(self->_connect, 3u, input, 4u, a6, a7, 0, 0, 0, 0);
}

- (int)enqueueResponseForContext:(void *)a3 status:(int)a4 outputBuffer:(void *)a5 outputBufferSize:(unint64_t)a6 options:(unsigned int)a7
{
  return -[AFKEndpointInterface enqueueResponseForContext:status:timestamp:outputBuffer:outputBufferSize:options:](self, "enqueueResponseForContext:status:timestamp:outputBuffer:outputBufferSize:options:", a3, *(_QWORD *)&a4, 0, a5, a6, *(_QWORD *)&a7);
}

- (int)enqueueDescriptor:(id)a3 packetType:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6
{
  id v10;
  void *v11;
  void *v12;
  kern_return_t v13;
  uint64_t v15;
  uint64_t input[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = v10;
  if (self->_state != 1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    *(_OWORD *)input = 0u;
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    v15 = _os_crash_msg();
    -[AFKEndpointInterface activate:].cold.1(v15);
  }
  objc_msgSend(v10, "token");
  kdebug_trace();
  if (v11)
  {
    input[0] = a4;
    input[1] = a5;
    *(_QWORD *)&v17 = objc_msgSend(v11, "token");
    objc_msgSend(v11, "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *((_QWORD *)&v17 + 1) = objc_msgSend(v12, "regID");
    *(_QWORD *)&v18 = ~(a6 >> 2) & 8 | a6;

    v13 = IOConnectCallScalarMethod(self->_connect, 6u, input, 5u, 0, 0);
    if (!v13)
      objc_msgSend(v11, "handleEnqueue");
  }
  else
  {
    v13 = -536870206;
  }

  return v13;
}

- (void)dequeueDataMessage:(_IODataQueueMemory *)a3
{
  IODataQueueEntry *v5;
  IODataQueueEntry *v6;
  NSObject *v7;
  UInt8 *data;
  int v9;
  unint64_t v10;
  unint64_t v11;
  uint32_t v12;
  unsigned int *v13;
  unsigned int v15;
  NSObject *v16;
  uint32_t dataSize;
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  uint32_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  dataSize = 0;
  v5 = IODataQueuePeek(a3);
  if (v5)
  {
    v6 = v5;
    do
    {
      dataSize = v6->size;
      if (dataSize > 0xF)
      {
        v9 = v6->data[0];
        data = v6->data;
        switch(v9)
        {
          case 1:
            -[AFKEndpointInterface handleReport:size:](self, "handleReport:size:", data);
            break;
          case 2:
            -[AFKEndpointInterface handleCommand:size:](self, "handleCommand:size:", data);
            break;
          case 3:
            -[AFKEndpointInterface handleDescriptor:size:](self, "handleDescriptor:size:", data);
            break;
          case 4:
            -[AFKEndpointInterface handleResponse:size:](self, "handleResponse:size:", data);
            break;
          case 5:
            -[AFKEndpointInterface handleQueue:size:](self, "handleQueue:size:", data);
            break;
          default:
            _AFKUserLog();
            v7 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            {
              v11 = -[AFKEndpointInterface regID](self, "regID");
              v12 = *data;
              *(_DWORD *)buf = 134218240;
              v19 = v11;
              v20 = 1024;
              v21 = v12;
              _os_log_error_impl(&dword_1D3221000, v7, OS_LOG_TYPE_ERROR, "0x%llx: Unknown message type:0x%x", buf, 0x12u);
            }
            goto LABEL_6;
        }
      }
      else
      {
        _AFKUserLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v10 = -[AFKEndpointInterface regID](self, "regID");
          *(_DWORD *)buf = 134218240;
          v19 = v10;
          v20 = 1024;
          v21 = dataSize;
          _os_log_error_impl(&dword_1D3221000, v7, OS_LOG_TYPE_ERROR, "0x%llx: Data queue entry size:0x%x", buf, 0x12u);
        }
LABEL_6:

      }
      IODataQueueDequeue(a3, 0, &dataSize);
      v6 = IODataQueuePeek(a3);
    }
    while (v6);
  }
  v13 = (unsigned int *)((char *)a3->queue + a3->queueSize);
  if (atomic_load(v13))
  {
    do
      v15 = __ldaxr(v13);
    while (__stlxr(v15 - 1, v13));
    if (IOConnectCallScalarMethod(self->_connect, 8u, 0, 0, 0, 0))
    {
      _AFKUserLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        -[AFKEndpointInterface regID](self, "regID");
        -[AFKEndpointInterface dequeueDataMessage:].cold.1();
      }

    }
  }
}

- (void)handleReport:(char *)a3 size:(unsigned int)a4
{
  char *v6;
  id reportHandler;
  uint64_t v8;
  uint64_t v9;

  v6 = a3 + 24;
  kdebug_trace();
  reportHandler = self->_reportHandler;
  v8 = *((unsigned int *)a3 + 1);
  v9 = *((_QWORD *)a3 + 1);
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    (*((void (**)(id, AFKEndpointInterface *, uint64_t, uint64_t, _QWORD, _QWORD))reportHandler + 2))(reportHandler, self, v8, v9, *((_QWORD *)a3 + 3), *((_QWORD *)a3 + 2));
    -[AFKEndpointInterface compleOOBBuffer:](self, "compleOOBBuffer:", *((_QWORD *)a3 + 3));
  }
  else
  {
    (*((void (**)(id, AFKEndpointInterface *, uint64_t, uint64_t, char *, _QWORD))reportHandler + 2))(reportHandler, self, v8, v9, v6, *((_QWORD *)a3 + 2));
  }
}

- (void)handleCommand:(char *)a3 size:(unsigned int)a4
{
  id commandHandler;
  id commandHandlerWithReturn;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    if (a4 <= 7)
      -[AFKEndpointInterface handleCommand:size:].cold.1(&v8, v9);
    kdebug_trace();
    commandHandlerWithReturn = self->_commandHandlerWithReturn;
    if (commandHandlerWithReturn || (commandHandlerWithReturn = self->_commandHandler) != 0)
      (*((void (**)(id, AFKEndpointInterface *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))commandHandlerWithReturn
       + 2))(commandHandlerWithReturn, self, *((_QWORD *)a3 + 3), *((unsigned int *)a3 + 1), *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 5), *((_QWORD *)a3 + 4), *((unsigned int *)a3 + 4));
    -[AFKEndpointInterface compleOOBBuffer:](self, "compleOOBBuffer:", *((_QWORD *)a3 + 5));
  }
  else
  {
    if (a4 <= 7)
      -[AFKEndpointInterface handleCommand:size:].cold.1(&v8, v9);
    kdebug_trace();
    commandHandler = self->_commandHandlerWithReturn;
    if (commandHandler || (commandHandler = self->_commandHandler) != 0)
      (*((void (**)(id, AFKEndpointInterface *, _QWORD, _QWORD, _QWORD, char *, _QWORD, _QWORD))commandHandler
       + 2))(commandHandler, self, *((_QWORD *)a3 + 3), *((unsigned int *)a3 + 1), *((_QWORD *)a3 + 1), a3 + 40, *((_QWORD *)a3 + 4), *((unsigned int *)a3 + 4));
  }
}

- (void)handleResponse:(char *)a3 size:(unsigned int)a4
{
  void *v6;
  uint64_t v7;
  _OWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((*(_WORD *)a3 & 0x100) != 0)
  {
    if (a4 <= 7)
      -[AFKEndpointInterface handleResponse:size:].cold.1(&v7, v8);
    v6 = (void *)*((_QWORD *)a3 + 2);
    kdebug_trace();
    (*((void (**)(void))self->_responseHandler + 2))();
    -[AFKEndpointInterface compleOOBBuffer:](self, "compleOOBBuffer:", *((_QWORD *)a3 + 5));
  }
  else
  {
    if (a4 <= 7)
      -[AFKEndpointInterface handleResponse:size:].cold.1(&v7, v8);
    v6 = (void *)*((_QWORD *)a3 + 2);
    kdebug_trace();
    (*((void (**)(void))self->_responseHandler + 2))();
  }
  free(v6);
}

- (void)handleDescriptor:(char *)a3 size:(unsigned int)a4
{
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __objc2_class **v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint8_t v23[128];
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a4 <= 7)
    -[AFKEndpointInterface handleDescriptor:size:].cold.2(&v22, buf);
  kdebug_trace();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_descriptorManagers;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
LABEL_4:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      if (objc_msgSend(v10, "regID", (_QWORD)v18) == *((_QWORD *)a3 + 3))
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        if (v7)
          goto LABEL_4;
        goto LABEL_10;
      }
    }
    v11 = v10;

    if (!v11)
      goto LABEL_17;
    if (a3[36])
      v12 = off_1E94E5878;
    else
      v12 = off_1E94E5888;
    -[__objc2_class withManager:capacity:token:](*v12, "withManager:capacity:token:", v11, *((unsigned int *)a3 + 8), *((_QWORD *)a3 + 2));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      (*((void (**)(void))self->_descriptorHandler + 2))();
      goto LABEL_21;
    }
    _AFKUserLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = -[AFKEndpointInterface regID](self, "regID");
      v17 = *((_QWORD *)a3 + 2);
      v16 = *((_QWORD *)a3 + 3);
      *(_DWORD *)buf = 134218496;
      v25 = v15;
      v26 = 2048;
      v27 = v16;
      v28 = 2048;
      v29 = v17;
      _os_log_error_impl(&dword_1D3221000, v14, OS_LOG_TYPE_ERROR, "0x%llx: Couldn't create descriptor for AFKDescMsg (regID:0x%llx token:0x%llx)", buf, 0x20u);
    }
  }
  else
  {
LABEL_10:

LABEL_17:
    _AFKUserLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AFKEndpointInterface handleDescriptor:size:].cold.1((uint64_t)a3, buf, -[AFKEndpointInterface regID](self, "regID"), v14);
    v11 = 0;
  }

  v13 = 0;
LABEL_21:

}

- (void)handleQueue:(char *)a3 size:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  _OWORD v11[5];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a4 <= 7)
    -[AFKEndpointInterface handleQueue:size:].cold.1(&v10, v11, (uint64_t)a3, *(uint64_t *)&a4, v4, v5, v6, v7, v10, *(size_t **)&v11[0]);
  -[AFKEndpointInterface dequeueDataMessage:](self, "dequeueDataMessage:", *((_QWORD *)a3 + 3));
  -[AFKEndpointInterface compleOOBBuffer:](self, "compleOOBBuffer:", *((_QWORD *)a3 + 3));
}

- (int)compleOOBBuffer:(unint64_t)a3
{
  kern_return_t v5;
  NSObject *v6;
  uint8_t buf[4];
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  kern_return_t v13;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a3;
  v5 = IOConnectCallMethod(self->_connect, 9u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (v5)
  {
    _AFKUserLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      v9 = -[AFKEndpointInterface regID](self, "regID");
      v10 = 2048;
      v11 = a3;
      v12 = 1024;
      v13 = v5;
      _os_log_error_impl(&dword_1D3221000, v6, OS_LOG_TYPE_ERROR, "0x%llx: kDataQueueFreeOOBMsgMethod (%llx):0x%x", buf, 0x1Cu);
    }

  }
  return v5;
}

- (int)startSession:(BOOL)a3
{
  uint64_t v4;
  uint64_t input[11];

  input[10] = *MEMORY[0x1E0C80C00];
  if (self->_state != 1)
    -[AFKEndpointInterface enqueueCommand:timestamp:inputBuffer:inputBufferSize:outputPayloadSize:context:options:].cold.1(&v4, input);
  input[0] = a3;
  return IOConnectCallMethod(self->_connect, 5u, input, 1u, 0, 0, 0, 0, 0, 0);
}

- (unint64_t)regID
{
  return self->_regID;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->me, 0);
  objc_storeStrong((id *)&self->_descriptorManagers, 0);
  objc_storeStrong((id *)&self->_dataQueueMachChannel, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong(&self->_descriptorHandler, 0);
  objc_storeStrong(&self->_commandHandler, 0);
  objc_storeStrong(&self->_commandHandlerWithReturn, 0);
  objc_storeStrong(&self->_reportHandler, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)activate:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_7(&dword_1D3221000, a2, a3, "0x%llx: _asyncPort", (uint8_t *)a1);
}

- (void)activate:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_7(&dword_1D3221000, a2, a3, "0x%llx: IODataQueueAllocateNotificationPort", (uint8_t *)a1);
}

- (void)activate:(NSObject *)a3 .cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_7(&dword_1D3221000, a2, a3, "0x%llx: dispatch_mach_create", (uint8_t *)a1);
}

- (void)activate:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1D3221000, "0x%llx: kOpenMethod:0x%x", v3, v4);
}

- (void)activate:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1D3221000, "0x%llx: IOConnectSetNotificationPort:0x%x", v3, v4);
}

- (void)enqueueCommand:(_QWORD *)a1 timestamp:(_OWORD *)a2 inputBuffer:inputBufferSize:outputPayloadSize:context:options:.cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

- (void)dequeueDataMessage:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v0, v1, v2, 3.8521e-34);
  OUTLINED_FUNCTION_1(&dword_1D3221000, "0x%llx: kDataQueueSpaceAvailableMethod:0x%x", v3, v4);
}

- (void)handleCommand:(_QWORD *)a1 size:(_OWORD *)a2 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

- (void)handleResponse:(_QWORD *)a1 size:(_OWORD *)a2 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  __break(1u);
}

- (void)handleDescriptor:(uint64_t)a3 size:(os_log_t)log .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 24);
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = v4;
  _os_log_error_impl(&dword_1D3221000, log, OS_LOG_TYPE_ERROR, "0x%llx: Couldn't find manager for AFKDescMsg (regID:0x%llx)", buf, 0x16u);
}

- (void)handleDescriptor:(_QWORD *)a1 size:(_OWORD *)a2 .cold.2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_9(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  _os_crash_msg();
  __break(1u);
}

- (void)handleQueue:(uint64_t)a3 size:(uint64_t)a4 .cold.1(_QWORD *a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, size_t *a10)
{
  mach_port_t v10;
  uint32_t v11;
  const uint64_t *v12;
  uint32_t v13;
  const void *v14;
  size_t v15;
  uint64_t *v16;
  uint32_t *v17;

  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0();
  v10 = OUTLINED_FUNCTION_4();
  __break(1u);
  IOConnectCallMethod(v10, v11, v12, v13, v14, v15, v16, v17, a9, a10);
}

@end
