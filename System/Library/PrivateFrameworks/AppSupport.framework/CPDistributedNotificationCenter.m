@implementation CPDistributedNotificationCenter

+ (id)centerNamed:(id)a3
{
  id v5;
  void *v6;

  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ center name cannont be nil"), a1);
  pthread_mutex_lock(&centerNamed__instanceLock);
  v5 = (id)centerNamed__centers;
  if (!centerNamed__centers)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    centerNamed__centers = (uint64_t)v5;
  }
  v6 = (void *)objc_msgSend(v5, "objectForKey:", a3);
  if (!v6)
  {
    if ((unint64_t)objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4) >= 0x81)
    {
      pthread_mutex_unlock(&centerNamed__instanceLock);
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ center name cannont be longer than %i UTF8 bytes"), a1, 128);
    }
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithServerName:", a3);
    objc_msgSend((id)centerNamed__centers, "setObject:forKey:", v6, a3);

  }
  pthread_mutex_unlock(&centerNamed__instanceLock);
  return v6;
}

+ (id)_serverPortToNotificationCenterMapDispatchQueue
{
  if (_serverPortToNotificationCenterMapDispatchQueue_onceToken != -1)
    dispatch_once(&_serverPortToNotificationCenterMapDispatchQueue_onceToken, &__block_literal_global_3);
  return (id)_serverPortToNotificationCenterMapDispatchQueue_queue;
}

dispatch_queue_t __82__CPDistributedNotificationCenter__serverPortToNotificationCenterMapDispatchQueue__block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("CPDistributedNotificationCenter server port to notification center queue", 0);
  _serverPortToNotificationCenterMapDispatchQueue_queue = (uint64_t)result;
  return result;
}

+ (__CFDictionary)_serverPortToNotificationCenterMap
{
  if (_serverPortToNotificationCenterMap_onceToken != -1)
    dispatch_once(&_serverPortToNotificationCenterMap_onceToken, &__block_literal_global_12);
  return (__CFDictionary *)_serverPortToNotificationCenterMap_map;
}

CFMutableDictionaryRef __69__CPDistributedNotificationCenter__serverPortToNotificationCenterMap__block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(0, 0, &sNoRetainDictionaryKeyCallbacks, &sNoRetainDictionaryValueCallbacks);
  _serverPortToNotificationCenterMap_map = (uint64_t)result;
  return result;
}

+ (void)setCenter:(id)a3 forServerPort:(unsigned int)a4
{
  NSObject *v7;
  _QWORD block[6];
  unsigned int v9;

  v7 = objc_msgSend(a1, "_serverPortToNotificationCenterMapDispatchQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CPDistributedNotificationCenter_setCenter_forServerPort___block_invoke;
  block[3] = &unk_1E28817F0;
  v9 = a4;
  block[4] = a1;
  block[5] = a3;
  dispatch_async(v7, block);
}

void __59__CPDistributedNotificationCenter_setCenter_forServerPort___block_invoke(uint64_t a1)
{
  __CFDictionary *v2;

  v2 = (__CFDictionary *)objc_msgSend(*(id *)(a1 + 32), "_serverPortToNotificationCenterMap");
  if (v2)
    CFDictionarySetValue(v2, (const void *)*(unsigned int *)(a1 + 48), *(const void **)(a1 + 40));
}

+ (id)centerForServerPort:(unsigned int)a3
{
  NSObject *v5;
  void *v6;
  _QWORD block[6];
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  v5 = objc_msgSend(a1, "_serverPortToNotificationCenterMapDispatchQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CPDistributedNotificationCenter_centerForServerPort___block_invoke;
  block[3] = &unk_1E2881818;
  block[4] = a1;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(v5, block);
  v6 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

const __CFDictionary *__55__CPDistributedNotificationCenter_centerForServerPort___block_invoke(uint64_t a1)
{
  const __CFDictionary *result;

  result = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 32), "_serverPortToNotificationCenterMap");
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, (const void *)*(unsigned int *)(a1 + 48));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)_initWithServerName:(id)a3
{
  CPDistributedNotificationCenter *v4;

  v4 = -[CPDistributedNotificationCenter init](self, "init");
  if (v4)
  {
    v4->_centerName = (NSString *)objc_msgSend(a3, "copy");
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v4->_sendPorts = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  }
  return v4;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;

  -[CPDistributedNotificationCenter _checkOutAndRemoveSource](self, "_checkOutAndRemoveSource");

  CFRelease(self->_sendPorts);
  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  v4.receiver = self;
  v4.super_class = (Class)CPDistributedNotificationCenter;
  -[CPDistributedNotificationCenter dealloc](&v4, sel_dealloc);
}

- (id)name
{
  return self->_centerName;
}

- (void)_createReceiveSourceForRunLoop:(__CFRunLoop *)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  unsigned int *v6;
  kern_return_t v7;
  mach_error_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  mach_error_t v12;
  mach_error_t v13;
  uint64_t v14;
  char *v15;
  __CFRunLoopSource *v16;
  int v17;
  mach_port_name_t name;

  if (!self->_receiveNotificationSource)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_notificationServerWasRestarted, (CFStringRef)objc_msgSend(CFSTR("CPDistributedNotificationCenterDidRestartNotification-"), "stringByAppendingString:", self->_centerName), 0, (CFNotificationSuspensionBehavior)0);
    name = 0;
    v6 = (unsigned int *)MEMORY[0x1E0C83DA0];
    v7 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name);
    if (v7)
    {
      v8 = v7;
      -[NSLock unlock](self->_lock, "unlock");
      v9 = (void *)MEMORY[0x1E0C99DA0];
      v10 = *MEMORY[0x1E0C99768];
      v11 = objc_opt_class();
      objc_msgSend(v9, "raise:format:", v10, CFSTR("%@ unable to allocate notification receive port: %s"), v11, mach_error_string(v8));
    }
    v17 = 128;
    v12 = MEMORY[0x193FF752C](*v6, name, 1, &v17, 1);
    if (v12)
    {
      v13 = v12;
      v14 = objc_opt_class();
      v15 = mach_error_string(v13);
      NSLog((NSString *)CFSTR("Unable to increaase %@ notification receive queue depth: %s"), v14, v15);
    }
    v16 = CPCreateMIGServerSourceWithContext((uint64_t)&_CPDNCPDistributedNotification_subsystem, name, 0, (uint64_t)self);
    self->_receiveNotificationSource = v16;
    CFRunLoopAddSource(a3, v16, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    if (CFRunLoopGetCurrent() != a3)
      CFRunLoopWakeUp(a3);
  }
}

- (void)_checkIn
{
  mach_port_t v3;
  int v4;
  mach_error_t v5;
  mach_error_t v6;
  uint64_t v7;
  NSString *centerName;
  char *v9;
  mach_port_t sp;

  if (self->_receiveNotificationSource)
  {
    sp = 0;
    bootstrap_look_up(*MEMORY[0x1E0C81720], -[NSString UTF8String](self->_centerName, "UTF8String"), &sp);
    v3 = sp;
    if (sp - 1 <= 0xFFFFFFFD)
    {
      v4 = CPGetMachPortForMIGServerSource(self->_receiveNotificationSource);
      v5 = CPDNCheckIn(v3, v4);
      if (v5)
      {
        v6 = v5;
        v7 = objc_opt_class();
        centerName = self->_centerName;
        v9 = mach_error_string(v6);
        NSLog((NSString *)CFSTR("Unable to check into %@ notfication center '%@': %s"), v7, centerName, v9);
      }
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], sp);
    }
  }
}

- (void)_checkOutAndRemoveSource
{
  __CFNotificationCenter *DarwinNotifyCenter;
  ipc_space_t *v4;

  if (self->_receiveNotificationSource)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)objc_msgSend(CFSTR("CPDistributedNotificationCenterDidRestartNotification-"), "stringByAppendingString:", self->_centerName), 0);
    LODWORD(DarwinNotifyCenter) = CPGetMachPortForMIGServerSource(self->_receiveNotificationSource);
    CFRunLoopSourceInvalidate(self->_receiveNotificationSource);
    CFRelease(self->_receiveNotificationSource);
    v4 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    self->_receiveNotificationSource = 0;
    mach_port_mod_refs(*v4, (mach_port_name_t)DarwinNotifyCenter, 1u, -1);
  }
}

- (void)_notificationServerWasRestarted
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[NSLock lock](self->_lock, "lock");
  -[CPDistributedNotificationCenter _checkIn](self, "_checkIn");
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)startDeliveringNotificationsToMainThread
{
  -[CPDistributedNotificationCenter startDeliveringNotificationsToRunLoop:](self, "startDeliveringNotificationsToRunLoop:", CFRunLoopGetMain());
}

- (void)startDeliveringNotificationsToRunLoop:(__CFRunLoop *)a3
{
  -[NSLock lock](self->_lock, "lock");
  ++self->_startCount;
  if (!self->_receiveNotificationSource)
  {
    -[CPDistributedNotificationCenter _createReceiveSourceForRunLoop:](self, "_createReceiveSourceForRunLoop:", a3);
    -[CPDistributedNotificationCenter _checkIn](self, "_checkIn");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)stopDeliveringNotifications
{
  unint64_t startCount;
  unint64_t v4;

  -[NSLock lock](self->_lock, "lock");
  startCount = self->_startCount;
  if (!startCount || (v4 = startCount - 1, (self->_startCount = v4) == 0))
    -[CPDistributedNotificationCenter _checkOutAndRemoveSource](self, "_checkOutAndRemoveSource");
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)deliverNotification:(id)a3 userInfo:(id)a4
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", a3, self, a4);
}

- (void)runServer
{
  _QWORD *v3;
  const char *v4;
  kern_return_t v5;
  ipc_space_t *v6;
  mach_error_t v7;
  mach_error_t v8;
  uint64_t v9;
  char *v10;
  NSObject *queue;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD handler[5];
  int v15;
  mach_port_t sp;

  -[NSLock lock](self->_lock, "lock");
  v3 = (_QWORD *)MEMORY[0x1E0C99778];
  if (self->_isServer)
  {
    -[NSLock unlock](self->_lock, "unlock");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v3, CFSTR("Already a %@ server for '%@'"), objc_opt_class(), self->_centerName);
  }
  v4 = -[NSString UTF8String](self->_centerName, "UTF8String");
  sp = 0;
  v5 = bootstrap_check_in(*MEMORY[0x1E0C81720], v4, &sp);
  v6 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (v5 && !mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &sp) && !mach_port_insert_right(*v6, sp, sp, 0x14u))
  {
    bootstrap_register2();
    mach_port_deallocate(*v6, sp);
  }
  if (sp - 1 > 0xFFFFFFFD)
  {
    -[NSLock unlock](self->_lock, "unlock");
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v3, CFSTR("%@ unable to register for '%@'"), objc_opt_class(), self->_centerName);
  }
  else
  {
    v15 = 128;
    v7 = MEMORY[0x193FF752C](*v6);
    if (v7)
    {
      v8 = v7;
      v9 = objc_opt_class();
      v10 = mach_error_string(v8);
      NSLog((NSString *)CFSTR("Unable to increaase %@ notification server queue depth: %s"), v9, v10);
    }
    queue = self->_queue;
    if (queue)
      dispatch_release(queue);
    self->_queue = (OS_dispatch_queue *)dispatch_queue_create("CPDistributedNotificationCenter", 0);
    +[CPDistributedNotificationCenter setCenter:forServerPort:](CPDistributedNotificationCenter, "setCenter:forServerPort:", self, sp);
    v12 = dispatch_source_create(MEMORY[0x1E0C80D98], sp, 0, (dispatch_queue_t)self->_queue);
    if (!v12)
    {
      dispatch_release((dispatch_object_t)self->_queue);
      self->_queue = 0;
      -[NSLock unlock](self->_lock, "unlock");
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v3, CFSTR("%@ unable to create server queue for '%@'"), objc_opt_class(), self->_centerName);
    }
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __44__CPDistributedNotificationCenter_runServer__block_invoke;
    handler[3] = &unk_1E2881840;
    handler[4] = v12;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(v12);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)objc_msgSend(CFSTR("CPDistributedNotificationCenterDidRestartNotification-"), "stringByAppendingString:", self->_centerName), 0, 0, 0);
    self->_isServer = 1;
  }
  -[NSLock unlock](self->_lock, "unlock");
}

uint64_t __44__CPDistributedNotificationCenter_runServer__block_invoke()
{
  return dispatch_mig_server();
}

- (void)postNotificationName:(id)a3
{
  -[CPDistributedNotificationCenter postNotificationName:userInfo:toBundleIdentifier:](self, "postNotificationName:userInfo:toBundleIdentifier:", a3, 0, 0);
}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  -[CPDistributedNotificationCenter postNotificationName:userInfo:toBundleIdentifier:](self, "postNotificationName:userInfo:toBundleIdentifier:", a3, a4, 0);
}

- (BOOL)postNotificationName:(id)a3 userInfo:(id)a4 toBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  CPDistributedNotificationCenter *v14;
  CFIndex Count;
  uint64_t v16;
  const void **v17;
  id *v18;
  size_t v19;
  const char *v20;
  int v21;
  uint64_t v22;
  mach_error_t v23;
  id v24;
  NSString *centerName;
  char *v26;
  NSString *v28;
  uint64_t v29;
  id v30;
  int v31;
  CPDistributedNotificationCenter *v32;
  _QWORD v33[2];

  v7 = a3;
  v33[1] = *MEMORY[0x1E0C80C00];
  v32 = self;
  if (self->_isServer)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Must be running %@ '%@' server to send post notifications"), objc_opt_class(), v32->_centerName);
    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ message name cannont be nil"), objc_opt_class());
LABEL_3:
  v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v30 = v8;
  if (a4)
  {
    v9 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99778];
      v12 = objc_opt_class();
      objc_msgSend(v10, "raise:format:", v11, CFSTR("Notification %@ userInfo is not an NSDictionary: %@ %@"), v12, objc_opt_class(), a4);
    }
    v33[0] = 0;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a4, 200, 0, v33);
    if (!v13)
    {

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ Unable to serialize userInfo: %@ error: %@"), objc_opt_class(), a4, v33[0]);
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = v32;
  -[NSLock lock](v32->_lock, "lock");
  Count = CFDictionaryGetCount(v32->_sendPorts);
  v16 = Count;
  v17 = (const void **)((char *)&v29 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = (id *)v17;
  if ((unint64_t)(8 * Count) >= 0x200)
    v19 = 512;
  else
    v19 = 8 * Count;
  bzero((char *)&v29 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0), v19);
  CFDictionaryGetKeysAndValues(v14->_sendPorts, v17, v17);
  -[NSLock unlock](v14->_lock, "unlock");
  v20 = (const char *)objc_msgSend(v7, "UTF8String");
  v21 = strlen(v20);
  if (v13)
  {
    v22 = objc_msgSend(v13, "bytes");
    LODWORD(v13) = objc_msgSend(v13, "length");
  }
  else
  {
    v22 = 0;
  }
  if (v16 < 1)
  {
    v31 = 0;
  }
  else
  {
    v31 = 0;
    do
    {
      if (!a5 || objc_msgSend(*v18, "isEqual:", a5))
      {
        v23 = CPDNDeliverNotification(*(_DWORD *)v17, (vm_address_t)v20, v21, v22, (int)v13);
        if (v23 != -308)
        {
          if (v23)
          {
            if (v23 != 268435459)
            {
              v24 = v7;
              centerName = v32->_centerName;
              v26 = mach_error_string(v23);
              v28 = centerName;
              v7 = v24;
              NSLog((NSString *)CFSTR("Unable to deliver %@ notification to port %@: %s"), v24, v28, v26);
            }
          }
          else
          {
            v31 = 1;
          }
        }
      }
      ++v17;
      ++v18;
      --v16;
    }
    while (v16);
  }

  return v31 & 1;
}

- (void)_receivedCheckIn:(unsigned int)a3 auditToken:(id *)a4
{
  uintptr_t v8;
  id v9;
  const void *v10;
  uint64_t v11;
  NSObject *global_queue;
  NSObject *v13;
  _QWORD v14[9];
  _QWORD handler[5];
  _QWORD block[6];

  -[NSLock lock](self->_lock, "lock");
  v8 = a3;
  if (CFDictionaryContainsKey(self->_sendPorts, (const void *)a3))
  {
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], a3);
  }
  else
  {
    v9 = CPCopyBundleIdentifierFromAuditToken((uint64_t)a4);
    if (v9)
      v10 = v9;
    else
      v10 = (const void *)*MEMORY[0x1E0C9B0D0];
    CFDictionarySetValue(self->_sendPorts, (const void *)v8, v10);
    v11 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke;
    block[3] = &unk_1E2881868;
    block[4] = v9;
    block[5] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    global_queue = dispatch_get_global_queue(0, 0);
    v13 = dispatch_source_create(MEMORY[0x1E0C80DA0], v8, 1uLL, global_queue);
    if (!v13)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CPDistributedNotificationCenter.m"), 502, CFSTR("unable to monitor server port for invalidation"));
    handler[0] = v11;
    handler[1] = 3221225472;
    handler[2] = __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_2;
    handler[3] = &unk_1E2881840;
    handler[4] = v13;
    dispatch_source_set_event_handler(v13, handler);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_3;
    v14[3] = &unk_1E2881890;
    v14[4] = v13;
    v14[5] = self;
    v14[7] = a2;
    v14[8] = v8;
    v14[6] = v9;
    dispatch_source_set_cancel_handler(v13, v14);
    dispatch_resume(v13);

  }
  -[NSLock unlock](self->_lock, "unlock");
}

void __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (*(_QWORD *)(a1 + 32))
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", *(_QWORD *)(a1 + 32), CFSTR("CPBundleIdentifier"), 0);
  else
    v2 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v3 = v2;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CPDistributedNotificationCenterClientDidStartListeningNotification"), *(_QWORD *)(a1 + 40), v2);

}

void __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_3(uint64_t a1)
{
  mach_port_name_t handle;
  _QWORD v3[4];
  int8x16_t v4;

  handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  if (mach_port_deallocate(*MEMORY[0x1E0C83DA0], handle))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("CPDistributedNotificationCenter.m"), 512, CFSTR("failed to deallocate dead name"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "lock");
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 40), *(const void **)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "unlock");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_4;
  v3[3] = &unk_1E2881868;
  v4 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __63__CPDistributedNotificationCenter__receivedCheckIn_auditToken___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (*(_QWORD *)(a1 + 32))
    v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", *(_QWORD *)(a1 + 32), CFSTR("CPBundleIdentifier"), 0);
  else
    v2 = objc_alloc_init(MEMORY[0x1E0C99D80]);
  v3 = v2;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("CPDistributedNotificationCenterClientDidStopListeningNotification"), *(_QWORD *)(a1 + 40), v2);

}

@end
