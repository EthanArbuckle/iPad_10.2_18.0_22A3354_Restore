@implementation CPDistributedMessagingCenter

+ (id)centerNamed:(id)a3
{
  return (id)objc_msgSend(a1, "_centerNamed:requireLookupByPID:", a3, 0);
}

+ (id)pidRestrictedCenterNamed:(id)a3
{
  return (id)objc_msgSend(a1, "_centerNamed:requireLookupByPID:", a3, 1);
}

+ (id)_centerNamed:(id)a3 requireLookupByPID:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;

  v4 = a4;
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ center name cannont be nil"), a1);
  pthread_mutex_lock(&_centerNamed_requireLookupByPID__instanceLock);
  v7 = (id)_centerNamed_requireLookupByPID__centers;
  if (!_centerNamed_requireLookupByPID__centers)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    _centerNamed_requireLookupByPID__centers = (uint64_t)v7;
  }
  v8 = (void *)objc_msgSend(v7, "objectForKey:", a3);
  if (!v8)
  {
    if ((unint64_t)objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4) >= 0x81)
    {
      pthread_mutex_unlock(&_centerNamed_requireLookupByPID__instanceLock);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ center name cannot be longer than %i UTF8 bytes"), a1, 128);
    }
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithServerName:requireLookupByPID:", a3, v4);
    objc_msgSend((id)_centerNamed_requireLookupByPID__centers, "setObject:forKey:", v8, a3);

  }
  pthread_mutex_unlock(&_centerNamed_requireLookupByPID__instanceLock);
  return v8;
}

- (id)_initWithServerName:(id)a3 requireLookupByPID:(BOOL)a4
{
  CPDistributedMessagingCenter *v6;

  v6 = -[CPDistributedMessagingCenter init](self, "init");
  if (v6)
  {
    v6->_centerName = (NSString *)objc_msgSend(a3, "copy");
    v6->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v6->_requireLookupByPID = a4;
  }
  return v6;
}

- (id)_initWithServerName:(id)a3
{
  return -[CPDistributedMessagingCenter _initWithServerName:requireLookupByPID:](self, "_initWithServerName:requireLookupByPID:", a3, 0);
}

- (id)_initAnonymousServer
{
  mach_port_name_t *v2;
  uint64_t v3;

  v2 = -[CPDistributedMessagingCenter _initWithServerName:](self, "_initWithServerName:", 0);
  if (v2)
  {
    v3 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, v2 + 16);
    if ((_DWORD)v3)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ unable to create anonymous server port. Error code: %d"), objc_opt_class(), v3);
  }
  return v2;
}

- (id)_initClientWithPort:(unsigned int)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  v4 = -[CPDistributedMessagingCenter _initWithServerName:](self, "_initWithServerName:", 0);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "_setSendPort:", v3);
  return v5;
}

- (void)dealloc
{
  __CFRunLoopSource *serverSource;
  mach_port_name_t v4;
  mach_port_name_t sendPort;
  mach_port_name_t parkedServerPort;
  objc_super v7;

  serverSource = self->_serverSource;
  if (serverSource)
  {
    v4 = CPGetMachPortForMIGServerSource(serverSource);
    CFRunLoopSourceInvalidate(self->_serverSource);
    CFRelease(self->_serverSource);
    if (v4 - 1 <= 0xFFFFFFFD)
      mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v4, 1u, -1);
  }
  sendPort = self->_sendPort;
  if (sendPort + 1 >= 2)
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], sendPort);
  parkedServerPort = self->_parkedServerPort;
  if (parkedServerPort + 1 >= 2)
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], parkedServerPort, 1u, -1);

  v7.receiver = self;
  v7.super_class = (Class)CPDistributedMessagingCenter;
  -[CPDistributedMessagingCenter dealloc](&v7, sel_dealloc);
}

- (id)name
{
  return self->_centerName;
}

- (void)setTargetPID:(int)a3
{
  self->_targetPID = a3;
}

- (void)_setupInvalidationSource
{
  uintptr_t sendPort;
  NSObject *global_queue;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[7];
  _QWORD handler[5];

  sendPort = self->_sendPort;
  if ((sendPort + 1) >= 2)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6 = dispatch_source_create(MEMORY[0x1E0C80DA0], sendPort, 1uLL, global_queue);
    if (!v6)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CPDistributedMessagingCenter.m"), 316, CFSTR("unable to monitor server port for invalidation"));
    v7 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke;
    handler[3] = &unk_1E2881840;
    handler[4] = v6;
    dispatch_source_set_event_handler(v6, handler);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke_2;
    v8[3] = &unk_1E28818C8;
    v8[4] = v6;
    v8[5] = self;
    v8[6] = a2;
    dispatch_source_set_cancel_handler(v6, v8);
    dispatch_resume(v6);
  }
}

void __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke_2(uint64_t a1)
{
  uintptr_t handle;
  uint64_t v3;
  _QWORD block[5];

  handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "lock");
  v3 = *(_QWORD *)(a1 + 40);
  if (handle == *(_DWORD *)(v3 + 24))
  {
    *(_DWORD *)(v3 + 24) = 0;
    v3 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend(*(id *)(v3 + 16), "unlock");
  if (mach_port_deallocate(*MEMORY[0x1E0C83DA0], handle))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("CPDistributedMessagingCenter.m"), 339, CFSTR("failed to deallocate dead name"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke_3;
  block[3] = &unk_1E2881840;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __56__CPDistributedMessagingCenter__setupInvalidationSource__block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("CPDistributedMessagingCenterServerDidTerminateNotification"), *(_QWORD *)(a1 + 32));

}

- (unsigned)_sendPort
{
  mach_port_name_t sendPort;
  _BOOL4 requireLookupByPID;
  mach_port_t v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;
  mach_port_type_t ptype;

  -[NSLock lock](self->_lock, "lock");
  ptype = 0;
  if (self->_centerName)
  {
    sendPort = self->_sendPort;
    if (sendPort + 1 < 2 || mach_port_type(*MEMORY[0x1E0C83DA0], sendPort, &ptype) || (ptype & 0x100000) != 0)
    {
      self->_sendPort = 0;
      requireLookupByPID = self->_requireLookupByPID;
      v5 = *MEMORY[0x1E0C81720];
      v6 = -[NSString UTF8String](self->_centerName, "UTF8String");
      if (requireLookupByPID)
      {
        v7 = bootstrap_look_up2();
        if ((_DWORD)v7)
        {
          NSLog((NSString *)CFSTR("Failed looking up per pid service %d for name %@"), v7, self->_centerName);
          self->_sendPort = 0;
        }
      }
      else
      {
        bootstrap_look_up(v5, v6, &self->_sendPort);
      }
      -[CPDistributedMessagingCenter _setupInvalidationSource](self, "_setupInvalidationSource");
    }
  }
  v8 = self->_sendPort;
  -[NSLock unlock](self->_lock, "unlock");
  return v8;
}

- (void)_setSendPort:(unsigned int)a3
{
  -[NSLock lock](self->_lock, "lock");
  if (self->_sendPort - 1 <= 0xFFFFFFFD)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CPDistributedMessagingCenter.m"), 385, CFSTR("%@ already has a send port allocated."), objc_opt_class());
  self->_sendPort = a3;
  -[CPDistributedMessagingCenter _setupInvalidationSource](self, "_setupInvalidationSource");
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)sendMessageName:(id)a3 userInfo:(id)a4
{
  return -[CPDistributedMessagingCenter _sendMessage:userInfo:receiveReply:error:toTarget:selector:context:](self, "_sendMessage:userInfo:receiveReply:error:toTarget:selector:context:", a3, a4, 0, 0, 0, 0, 0);
}

- (BOOL)sendNonBlockingMessageName:(id)a3 userInfo:(id)a4
{
  uint64_t v5;

  LOBYTE(v5) = 1;
  return -[CPDistributedMessagingCenter _sendMessage:userInfo:receiveReply:error:toTarget:selector:context:nonBlocking:](self, "_sendMessage:userInfo:receiveReply:error:toTarget:selector:context:nonBlocking:", a3, a4, 0, 0, 0, 0, 0, v5);
}

- (id)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4
{
  void *v5;

  v5 = 0;
  -[CPDistributedMessagingCenter _sendMessage:userInfo:receiveReply:error:toTarget:selector:context:](self, "_sendMessage:userInfo:receiveReply:error:toTarget:selector:context:", a3, a4, &v5, 0, 0, 0, 0);
  return v5;
}

- (id)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  void *v6;

  v6 = 0;
  -[CPDistributedMessagingCenter _sendMessage:userInfo:receiveReply:error:toTarget:selector:context:](self, "_sendMessage:userInfo:receiveReply:error:toTarget:selector:context:", a3, a4, &v6, a5, 0, 0, 0);
  return v6;
}

- (void)sendMessageAndReceiveReplyName:(id)a3 userInfo:(id)a4 toTarget:(id)a5 selector:(SEL)a6 context:(void *)a7
{
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ target cannont be nil"), objc_opt_class());
    if (a6)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ selector cannont be nil"), objc_opt_class());
    goto LABEL_3;
  }
  if (!a6)
    goto LABEL_5;
LABEL_3:
  -[CPDistributedMessagingCenter _sendMessage:userInfo:receiveReply:error:toTarget:selector:context:](self, "_sendMessage:userInfo:receiveReply:error:toTarget:selector:context:", a3, a4, 0, 0, a5, a6, a7);
}

- (BOOL)_sendMessage:(id)a3 userInfo:(id)a4 receiveReply:(id *)a5 error:(id *)a6 toTarget:(id)a7 selector:(SEL)a8 context:(void *)a9
{
  uint64_t v10;

  LOBYTE(v10) = 0;
  return -[CPDistributedMessagingCenter _sendMessage:userInfo:receiveReply:error:toTarget:selector:context:nonBlocking:](self, "_sendMessage:userInfo:receiveReply:error:toTarget:selector:context:nonBlocking:", a3, a4, a5, a6, a7, a8, a9, v10);
}

- (BOOL)_sendMessage:(id)a3 userInfo:(id)a4 receiveReply:(id *)a5 error:(id *)a6 toTarget:(id)a7 selector:(SEL)a8 context:(void *)a9 nonBlocking:(BOOL)a10
{
  id v13;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSOperationQueue *v27;
  CPDistributedMessagingAsyncOperation *v28;
  CPDistributedMessagingAsyncOperation *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v13 = a4;
  if (a3)
  {
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ message name cannot be nil"), objc_opt_class());
    if (!v13)
      goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    v18 = objc_opt_class();
    objc_msgSend(v16, "raise:format:", v17, CFSTR("%@ userInfo is not an NSDictionary: %@ %@"), v18, objc_opt_class(), v13);
  }
LABEL_7:
  v19 = (__CFString *)objc_msgSend(v13, "objectForKey:", CFSTR("_kCPDistributedMessagingMagicCenterCreationKeyValue"));
  if (v19 == CFSTR("_kCPDistributedMessagingMagicCenterCreationKeyValue"))
  {
    v13 = (id)objc_msgSend(v13, "mutableCopy");
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("_kCPDistributedMessagingMagicCenterCreationKeyValue"));
  }
  v37 = 0;
  v38 = 0;
  v20 = dictionaryWithoutLargestNSData(v13, &v38, &v37);
  if (v20)
  {
    v21 = v20;
    v36 = 0;
    v22 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v20, 200, 0, &v36);
    if (!v22)
    {
      v34 = a7;
      v23 = a6;
      v24 = (void *)MEMORY[0x1E0C99DA0];
      v25 = *MEMORY[0x1E0C99778];
      v32 = objc_opt_class();
      v26 = v24;
      a6 = v23;
      a7 = v34;
      objc_msgSend(v26, "raise:format:", v25, CFSTR("%@ Unable to serialize userInfo: %@ error: %@"), v32, v21, v36);
    }
    if (a7)
      goto LABEL_13;
LABEL_17:
    LOBYTE(v31) = a10;
    return -[CPDistributedMessagingCenter _sendMessage:userInfoData:oolKey:oolData:makeServer:receiveReply:nonBlocking:error:](self, "_sendMessage:userInfoData:oolKey:oolData:makeServer:receiveReply:nonBlocking:error:", a3, v22, v38, v37, v19 == CFSTR("_kCPDistributedMessagingMagicCenterCreationKeyValue"), a5, v31, a6);
  }
  v22 = 0;
  if (!a7)
    goto LABEL_17;
LABEL_13:
  -[NSLock lock](self->_lock, "lock");
  if (!self->_asyncQueue)
  {
    v27 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    self->_asyncQueue = v27;
    -[NSOperationQueue setMaxConcurrentOperationCount:](v27, "setMaxConcurrentOperationCount:", 1);
  }
  -[NSLock unlock](self->_lock, "unlock");
  v28 = [CPDistributedMessagingAsyncOperation alloc];
  LOBYTE(v33) = v19 == CFSTR("_kCPDistributedMessagingMagicCenterCreationKeyValue");
  v29 = -[CPDistributedMessagingAsyncOperation initWithCenter:messageName:userInfoData:oolKey:oolData:target:selector:context:makeServer:](v28, "initWithCenter:messageName:userInfoData:oolKey:oolData:target:selector:context:makeServer:", self, a3, v22, v38, v37, a7, a8, a9, v33);
  -[NSOperationQueue addOperation:](self->_asyncQueue, "addOperation:", v29);

  return 0;
}

- (BOOL)_sendMessage:(id)a3 userInfoData:(id)a4 oolKey:(id)a5 oolData:(id)a6 makeServer:(BOOL)a7 receiveReply:(id *)a8 nonBlocking:(BOOL)a9 error:(id *)a10
{
  _BOOL4 v11;
  const char *v16;
  int v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  id v22;
  mach_error_t v23;
  mach_error_t v24;
  id v25;
  void *v26;
  CFDataRef DataFromVMDeallocateBytes;
  id *v28;
  id v29;
  void *v30;
  BOOL v31;
  int v32;
  _BOOL8 v33;
  uint64_t v34;
  id v35;
  unsigned int *v36;
  uint64_t v37;
  NSString *centerName;
  char *v39;
  uint64_t v40;
  id v43;
  unsigned int v44;
  unsigned int v45;
  const UInt8 *v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  _QWORD v50[2];

  v11 = a7;
  v44 = -[CPDistributedMessagingCenter _sendPort](self, "_sendPort");
  v43 = a3;
  v16 = (const char *)objc_msgSend(a3, "UTF8String");
  v17 = strlen(v16);
  if (a4)
  {
    v18 = objc_msgSend(a4, "bytes");
    v19 = objc_msgSend(a4, "length");
    if (a5)
      goto LABEL_3;
LABEL_6:
    v20 = 0;
    if (a6)
      goto LABEL_4;
    goto LABEL_7;
  }
  v18 = 0;
  v19 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v20 = (const char *)objc_msgSend(a5, "UTF8String");
  LODWORD(a5) = strlen(v20);
  if (a6)
  {
LABEL_4:
    v21 = objc_msgSend(a6, "bytes");
    LODWORD(a6) = objc_msgSend(a6, "length");
    goto LABEL_8;
  }
LABEL_7:
  v21 = 0;
LABEL_8:
  if (a8)
  {
    v50[0] = 0;
    v49 = 0;
    v48 = 0;
    v47 = 0;
    v46 = 0;
    v45 = 0;
    if (v11)
    {
      v22 = -[CPDistributedMessagingCenter _initAnonymousServer]([CPDistributedMessagingCenter alloc], "_initAnonymousServer");
      v23 = CPDMTwoWayMessageWithPortPassing(v44, objc_msgSend(v22, "_serverPort"), (uint64_t)v16, v17, v18, v19, v50, &v49, (uint64_t)v20, (int)a5, v21, (int)a6, &v48, &v47, &v46, &v45);
    }
    else
    {
      v23 = CPDMTwoWayMessage(v44, (uint64_t)v16, v17, v18, v19, v50, &v49, (uint64_t)v20, (int)a5, v21, (int)a6, &v48, &v47, &v46, &v45);
      v22 = 0;
    }
    *a8 = 0;
    if (!v23 && v49)
    {
      if (v46)
      {
        v25 = objc_alloc(MEMORY[0x1E0CB3940]);
        v26 = (void *)objc_msgSend(v25, "initWithBytes:length:encoding:", v48, v47, 4);
        DataFromVMDeallocateBytes = createDataFromVMDeallocateBytes(v46, (void *)v45);
        v46 = 0;
        v45 = 0;
      }
      else
      {
        DataFromVMDeallocateBytes = 0;
        v26 = 0;
      }
      v29 = objc_alloc(MEMORY[0x1E0C99D50]);
      v30 = (void *)objc_msgSend(v29, "initWithBytesNoCopy:length:freeWhenDone:", v50[0], v49, 0);
      if (v26)
        v31 = DataFromVMDeallocateBytes == 0;
      else
        v31 = 1;
      v32 = !v31;
      v33 = !v31 || v22 != 0;
      *a8 = (id)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v30, v33, 0, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v34 = objc_opt_class();
        NSLog((NSString *)CFSTR("%@ ignoring non-dictionary return type in message named %@"), v34, v43);
        *a8 = 0;
      }
      if (v32)
        objc_msgSend(*a8, "setObject:forKey:", DataFromVMDeallocateBytes, v26);

    }
    if (v22)
    {
      v35 = *a8;
      if (!*a8)
      {
        v35 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        *a8 = v35;
      }
      objc_msgSend(v35, "setObject:forKey:", v22, CFSTR("_kCPDistributedMessagingMagicCenterCreationKeyValue"));
    }
    v36 = (unsigned int *)MEMORY[0x1E0C83DA0];
    if (v50[0])
      MEMORY[0x193FF7DD8](*MEMORY[0x1E0C83DA0], v50[0], v49);
    v28 = a10;
    if (v48)
      MEMORY[0x193FF7DD8](*v36, v48, v47);
    if (v46)
      MEMORY[0x193FF7DD8](*v36, v46, v45);
  }
  else
  {
    if (a9)
      v24 = CPDMNonBlockingMessage(v44, (vm_address_t)v16, v17, v18, v19, (uint64_t)v20, (int)a5, v21, (int)a6, 0);
    else
      v24 = CPDMMessage(v44, (uint64_t)v16, v17, v18, v19, (uint64_t)v20, (int)a5, v21, (int)a6);
    v23 = v24;
    v28 = a10;
  }
  if (v23)
  {
    if (v23 != -308 && v23 != 268435459 && (v23 != 268435460 || !a9))
    {
      v37 = objc_opt_class();
      centerName = self->_centerName;
      v39 = mach_error_string(v23);
      NSLog((NSString *)CFSTR("Unable to send %@ message named %@ to %@: %s"), v37, v43, centerName, v39);
    }
    if (v28)
    {
      v40 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2D98], v23, 0);
LABEL_55:
      *v28 = (id)v40;
    }
  }
  else if (v28)
  {
    v40 = 0;
    goto LABEL_55;
  }
  return v23 == 0;
}

- (unsigned)_serverPort
{
  __CFRunLoopSource *serverSource;
  unsigned int parkedServerPort;

  -[NSLock lock](self->_lock, "lock");
  serverSource = self->_serverSource;
  if (serverSource)
    parkedServerPort = CPGetMachPortForMIGServerSource(serverSource);
  else
    parkedServerPort = self->_parkedServerPort;
  -[NSLock unlock](self->_lock, "unlock");
  return parkedServerPort;
}

- (void)runServerOnCurrentThread
{
  -[CPDistributedMessagingCenter runServerOnCurrentThreadProtectedByEntitlement:](self, "runServerOnCurrentThreadProtectedByEntitlement:", 0);
}

- (void)runServerOnCurrentThreadProtectedByEntitlement:(id)a3
{
  uint64_t *v5;
  const char *v6;
  ipc_space_t *v7;
  __CFRunLoop *Current;
  NSString *centerName;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t sp;

  -[NSLock lock](self->_lock, "lock");
  v5 = (uint64_t *)MEMORY[0x1E0C99778];
  if (self->_serverSource)
  {
    -[NSLock unlock](self->_lock, "unlock");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v5, CFSTR("Already a %@ server for %@"), objc_opt_class(), self->_centerName);
  }
  sp = 0;
  if (self->_parkedServerPort + 1 >= 2)
  {
    sp = self->_parkedServerPort;
    self->_parkedServerPort = 0;
    goto LABEL_12;
  }
  v6 = -[NSString UTF8String](self->_centerName, "UTF8String");
  if (self->_requireLookupByPID)
  {
    if (!bootstrap_check_in2())
      goto LABEL_12;
  }
  else if (!bootstrap_check_in(*MEMORY[0x1E0C81720], v6, &sp))
  {
    goto LABEL_12;
  }
  v7 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (!mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &sp) && !mach_port_insert_right(*v7, sp, sp, 0x14u))
  {
    bootstrap_register2();
    mach_port_deallocate(*v7, sp);
  }
LABEL_12:
  if (sp - 1 > 0xFFFFFFFD)
  {
    -[NSLock unlock](self->_lock, "unlock");
    centerName = self->_centerName;
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *v5;
    v12 = objc_opt_class();
    if (centerName)
      objc_msgSend(v10, "raise:format:", v11, CFSTR("%@ unable to register for '%@'"), v12, self->_centerName);
    else
      objc_msgSend(v10, "raise:format:", v11, CFSTR("%@ unable to create server for invalid right: %i"), v12, sp);
  }
  else
  {
    self->_serverSource = CPCreateMIGServerSourceWithContext((uint64_t)_CPDMCPDistributedMessaging_subsystem, sp, 0, (uint64_t)self);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, self->_serverSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    self->_requiredEntitlement = (NSString *)objc_msgSend(a3, "copy");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)stopServer
{
  __CFRunLoopSource *serverSource;
  mach_port_name_t v4;
  CPDistributedMessagingCenter *v5;
  CPDistributedMessagingCenter *v6;

  serverSource = self->_serverSource;
  if (serverSource)
  {
    v6 = self;
    v4 = CPGetMachPortForMIGServerSource(serverSource);
    CFRunLoopSourceInvalidate(v6->_serverSource);
    CFRelease(v6->_serverSource);
    v5 = v6;
    v6->_serverSource = 0;
    if (v4 - 1 <= 0xFFFFFFFD)
    {
      mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v4, 1u, -1);
      v5 = v6;
    }

  }
}

- (void)registerForMessageName:(id)a3 target:(id)a4 selector:(SEL)a5
{
  NSMutableDictionary *callouts;
  CPDistributedMessagingCallout *v10;

  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ target cannont be nil"), objc_opt_class());
    if (a5)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ message name cannont be nil"), objc_opt_class());
  if (!a4)
    goto LABEL_8;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ selector cannont be nil"), objc_opt_class());
LABEL_4:
  v10 = -[CPDistributedMessagingCallout initWithTarget:selector:]([CPDistributedMessagingCallout alloc], "initWithTarget:selector:", a4, a5);
  -[NSLock lock](self->_lock, "lock");
  callouts = self->_callouts;
  if (!callouts)
  {
    callouts = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_callouts = callouts;
  }
  -[NSMutableDictionary setObject:forKey:](callouts, "setObject:forKey:", v10, a3);
  -[NSLock unlock](self->_lock, "unlock");

}

- (id)delayReply
{
  _QWORD *v3;
  unsigned int replyPort;
  uint64_t v6;

  v3 = (_QWORD *)MEMORY[0x1E0C99750];
  if (!self->_currentCallout)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%@ delayReply cannot be called outside of a callout"), objc_opt_class());
  if (self->_delayedReply)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v3, CFSTR("%@ delayReply cannot be called more than once in a single callout: %@"), objc_opt_class(), self->_currentCallout);
  replyPort = self->_replyPort;
  if (!replyPort)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v3, CFSTR("%@ delayReply cannot be called when servicing a one-way message during callout: %@"), objc_opt_class(), self->_currentCallout);
    replyPort = self->_replyPort;
  }
  if (replyPort == -1)
  {
    v6 = objc_opt_class();
    NSLog((NSString *)CFSTR("%@ delayReply is about to return nil because the peer seems to have died."), v6);
    return 0;
  }
  else
  {
    self->_delayedReply = 1;
    return -[CPDistributedMessagingDelayedReplyContext initWithReplyPort:portPassing:]([CPDistributedMessagingDelayedReplyContext alloc], "initWithReplyPort:portPassing:", self->_replyPort, self->_portPassing);
  }
}

- (void)sendDelayedReply:(id)a3 dictionary:(id)a4
{
  -[CPDistributedMessagingCenter _sendReplyMessage:portPassing:onMachPort:](self, "_sendReplyMessage:portPassing:onMachPort:", a4, objc_msgSend(a3, "portPassing"), objc_msgSend(a3, "replyPort"));
  objc_msgSend(a3, "setReplyPort:", 0);
}

- (void)unregisterForMessageName:(id)a3
{
  NSMutableDictionary *callouts;
  id v6;
  id v7;

  -[NSLock lock](self->_lock, "lock");
  callouts = self->_callouts;
  if (a3)
  {
    v6 = (id)-[NSMutableDictionary objectForKey:](callouts, "objectForKey:", a3);
    -[NSMutableDictionary removeObjectForKey:](self->_callouts, "removeObjectForKey:", a3);
  }
  else
  {
    v7 = (id)-[NSMutableDictionary allValues](callouts, "allValues");
    -[NSMutableDictionary removeAllObjects](self->_callouts, "removeAllObjects");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)doesServerExist
{
  unsigned int v3;

  v3 = -[CPDistributedMessagingCenter _sendPort](self, "_sendPort");
  if (v3)
    LOBYTE(v3) = -[CPDistributedMessagingCenter _sendPort](self, "_sendPort") != -1;
  return v3;
}

- (void)_dispatchMessageNamed:(id)a3 userInfo:(id)a4 reply:(id *)a5 auditToken:(id *)a6
{
  CPDistributedMessagingCenter *v11;
  __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  CPDistributedMessagingCallout *v15;

  -[NSLock lock](self->_lock, "lock");
  v15 = (CPDistributedMessagingCallout *)(id)-[NSMutableDictionary objectForKey:](self->_callouts, "objectForKey:", a3);
  if (!self->_centerName)
    v11 = self;
  -[NSLock unlock](self->_lock, "unlock");
  if (!v15)
  {
    v13 = objc_opt_class();
    NSLog((NSString *)CFSTR("%@ ignoring message named %@ since no target and selector are registered"), v13, a3);
    return;
  }
  self->_currentCallout = v15;
  *a5 = objc_msgSend(-[CPDistributedMessagingCallout target](v15, "target"), -[CPDistributedMessagingCallout selector](v15, "selector"), a3, a4, a6);
  self->_currentCallout = 0;
  if (!self->_delayedReply || -[CPDistributedMessagingCallout returnsVoid](v15, "returnsVoid"))
  {
    if (-[CPDistributedMessagingCallout returnsVoid](v15, "returnsVoid"))
    {
LABEL_14:
      *a5 = 0;
      goto LABEL_15;
    }
    if (!*a5)
      goto LABEL_15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_15;
    v12 = CFSTR("%@ ignoring non-dictionary return type in message named %@");
LABEL_13:
    v14 = objc_opt_class();
    NSLog((NSString *)v12, v14, a3);
    goto LABEL_14;
  }
  if (*a5)
  {
    v12 = CFSTR("%@ ignoring non-nil return from message named %@, which has requested a delayed reply");
    goto LABEL_13;
  }
LABEL_15:

}

- (void)_sendReplyMessage:(id)a3 portPassing:(BOOL)a4 onMachPort:(unsigned int)a5
{
  _BOOL4 v6;
  void *v7;
  const char *v8;
  int v9;
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;

  v6 = a4;
  if (a3)
  {
    v17 = 0;
    v18 = 0;
    v7 = dictionaryWithoutLargestNSData(a3, (uint64_t *)&v18, &v17);
    if (v18)
    {
      v8 = (const char *)objc_msgSend(v18, "UTF8String");
      v9 = strlen(v8);
      v10 = v17;
      v11 = objc_msgSend(v17, "bytes");
      v12 = objc_msgSend(v10, "length");
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v11 = 0;
      v12 = 0;
    }
    v16 = 0;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 200, 0, &v16);
    if (!v13)
      NSLog((NSString *)CFSTR("Unable to serialize userInfo: %@. Ignoring."), v16);
  }
  else
  {
    v13 = 0;
    v8 = 0;
    v9 = 0;
    v11 = 0;
    v12 = 0;
  }
  v14 = objc_msgSend(v13, "length");
  v15 = objc_msgSend(v13, "bytes");
  if (v6)
    CPDMTwoWayMessageReplyWithPortPassing(a5, 0, v15, v14, (uint64_t)v8, v9, v11, v12);
  else
    CPDMTwoWayMessageReply(a5, 0, v15, v14, (uint64_t)v8, v9, v11, v12);
}

- (BOOL)_isTaskEntitled:(id *)a3
{
  __int128 v4;
  __SecTask *v5;
  __SecTask *v6;
  const __CFBoolean *v7;
  const __CFBoolean *v8;
  CFTypeID v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  audit_token_t token;

  if (!self->_requiredEntitlement)
    return 1;
  v4 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v4;
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    *(_QWORD *)token.val = 0;
    v7 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v5, (CFStringRef)self->_requiredEntitlement, (CFErrorRef *)&token);
    if (v7)
    {
      v8 = v7;
      v9 = CFGetTypeID(v7);
      v10 = v9 == CFBooleanGetTypeID() && CFBooleanGetValue(v8) != 0;
      CFRelease(v8);
    }
    else
    {
      v10 = 0;
    }
    if (*(_QWORD *)token.val)
    {
      v12 = objc_opt_class();
      NSLog((NSString *)CFSTR("%@ unable to get entitlements for client task. Error: %@"), v12, *(_QWORD *)token.val);
      CFRelease(*(CFTypeRef *)token.val);
    }
    CFRelease(v6);
  }
  else
  {
    v11 = objc_opt_class();
    NSLog((NSString *)CFSTR("%@ unable to create security task from audit token"), v11);
    return 0;
  }
  return v10;
}

- (id)_requiredEntitlement
{
  return self->_requiredEntitlement;
}

@end
