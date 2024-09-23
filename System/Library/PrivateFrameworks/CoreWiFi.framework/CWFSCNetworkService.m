@implementation CWFSCNetworkService

- (CWFSCNetworkService)initWithInterfaceName:(id)a3
{
  id v4;
  CWFSCNetworkService *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CWFSCNetworkService *v10;
  CWFSCNetworkService *v11;
  uint64_t v12;
  NSString *interfaceName;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *mutexQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *eventQueue;
  const __CFAllocator *v20;
  SCPreferencesRef v21;
  SCDynamicStoreRef v22;
  NSObject *v23;
  _QWORD block[4];
  CWFSCNetworkService *v26;
  SCDynamicStoreContext context;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CWFSCNetworkService;
  v5 = -[CWFSCNetworkService init](&v28, sel_init);
  v10 = v5;
  v11 = 0;
  if (v4 && v5)
  {
    v12 = objc_msgSend_copy(v4, v6, v7, v8, v9);
    interfaceName = v10->_interfaceName;
    v10->_interfaceName = (NSString *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.corewifi.SC-service-mutex", v14);
    mutexQueue = v10->_mutexQueue;
    v10->_mutexQueue = (OS_dispatch_queue *)v15;

    if (!v10->_mutexQueue)
      goto LABEL_10;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.corewifi.SC-service-event", v17);
    eventQueue = v10->_eventQueue;
    v10->_eventQueue = (OS_dispatch_queue *)v18;

    if (!v10->_eventQueue)
      goto LABEL_10;
    v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v21 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.corewifi.SC-service"), 0);
    v10->_prefsRef = v21;
    if (!v21)
      goto LABEL_10;
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = v10;
    v22 = SCDynamicStoreCreate(v20, CFSTR("com.apple.corewifi.SC-service"), (SCDynamicStoreCallBack)sub_1B069F76C, &context);
    v10->_storeRef = v22;
    if (v22 && SCDynamicStoreSetDisconnectCallBack())
    {
      v23 = v10->_mutexQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = sub_1B069FB4C;
      block[3] = &unk_1E6133138;
      v11 = v10;
      v26 = v11;
      dispatch_async(v23, block);
      v10 = v26;
    }
    else
    {
LABEL_10:
      v11 = 0;
    }
  }

  return v11;
}

- (CWFSCNetworkService)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFSCNetworkService init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  __SCDynamicStore *storeRef;
  __SCPreferences *prefsRef;
  objc_super v5;

  storeRef = self->_storeRef;
  if (storeRef)
    CFRelease(storeRef);
  prefsRef = self->_prefsRef;
  if (prefsRef)
    CFRelease(prefsRef);
  v5.receiver = self;
  v5.super_class = (Class)CWFSCNetworkService;
  -[CWFSCNetworkService dealloc](&v5, sel_dealloc);
}

- (BOOL)__updateServiceID
{
  const __SCNetworkSet *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __SCNetworkSet *v8;
  CFArrayRef v9;
  const __CFArray *v10;
  const __CFArray *ServiceOrder;
  const __CFArray *v12;
  CFIndex v13;
  const void *ValueAtIndex;
  const void *v15;
  CFIndex v16;
  const __SCNetworkService *v17;
  const __SCNetworkService *v18;
  CFStringRef ServiceID;
  __CFString *v20;
  CFStringRef Name;
  __CFString *v22;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v24;
  CFStringRef BSDName;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString *v35;
  NSString *v36;
  BOOL v37;
  NSString *v38;
  NSString *v39;
  NSString *serviceName;
  NSString *v41;
  NSString *v42;
  const __SCNetworkSet *cf;
  void *v45;

  SCPreferencesSynchronize(self->_prefsRef);
  v3 = SCNetworkSetCopyCurrent(self->_prefsRef);
  if (v3)
  {
    v8 = v3;
    v9 = SCNetworkSetCopyServices(v3);
    if (v9)
    {
      v10 = v9;
      cf = v8;
      ServiceOrder = SCNetworkSetGetServiceOrder(v8);
      if (ServiceOrder && (v12 = ServiceOrder, CFArrayGetCount(ServiceOrder) >= 1))
      {
        v45 = 0;
        v13 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v12, v13);
          if (ValueAtIndex && (v15 = ValueAtIndex, CFArrayGetCount(v10) >= 1))
          {
            v16 = 0;
            do
            {
              v17 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v10, v16);
              v18 = v17;
              if (v17)
              {
                ServiceID = SCNetworkServiceGetServiceID(v17);
                if (!ServiceID)
                  goto LABEL_20;
                v20 = (__CFString *)ServiceID;
                Name = SCNetworkServiceGetName(v18);
                if (!Name)
                  goto LABEL_20;
                v22 = (__CFString *)Name;
                if (!CFEqual(v20, v15))
                  goto LABEL_20;
                Interface = SCNetworkServiceGetInterface(v18);
                if (!Interface)
                  goto LABEL_20;
                do
                {
                  v24 = Interface;
                  Interface = SCNetworkInterfaceGetInterface(Interface);
                }
                while (Interface);
                if (SCNetworkInterfaceGetInterfaceType(v24)
                  && (BSDName = SCNetworkInterfaceGetBSDName(v24)) != 0
                  && CFEqual(BSDName, self->_interfaceName)
                  && SCNetworkServiceGetEnabled(v18))
                {
                  v18 = (const __SCNetworkService *)objc_msgSend_copy(v20, v26, v27, v28, v29, cf);
                  v34 = objc_msgSend_copy(v22, v30, v31, v32, v33);

                  v45 = (void *)v34;
                }
                else
                {
LABEL_20:
                  v18 = 0;
                }
              }
              ++v16;
            }
            while (CFArrayGetCount(v10) > v16 && !v18);
          }
          else
          {
            v18 = 0;
          }
          ++v13;
        }
        while (CFArrayGetCount(v12) > v13 && !v18);
      }
      else
      {
        v18 = 0;
        v45 = 0;
      }
      CFRelease(cf);
      v35 = (NSString *)v45;
    }
    else
    {
      v18 = 0;
      v35 = 0;
      v10 = v8;
    }
    CFRelease(v10);
  }
  else
  {
    v18 = 0;
    v35 = 0;
  }
  v36 = self->_serviceID;
  if (v36 == (NSString *)v18 || v18 && v36 && (objc_msgSend_isEqual_(v36, v4, (uint64_t)v18, v6, v7) & 1) != 0)
  {
    v37 = 0;
  }
  else
  {
    v38 = (NSString *)objc_msgSend_copy(v18, v4, v5, v6, v7, cf);
    v39 = self->_serviceID;
    self->_serviceID = v38;

    v37 = 1;
  }
  serviceName = self->_serviceName;
  if (serviceName != v35
    && (!serviceName || !v35 || (objc_msgSend_isEqual_(serviceName, v4, (uint64_t)v35, v6, v7) & 1) == 0))
  {
    v41 = (NSString *)objc_msgSend_copy(v35, v4, v5, v6, v7, cf);
    v42 = self->_serviceName;
    self->_serviceName = v41;

  }
  return v37;
}

- (void)__refreshNotificationKeys
{
  const __CFAllocator *v3;
  CFStringRef NetworkServiceEntity;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CFStringRef v8;
  const __CFString *serviceID;
  const __CFString *v10;
  CFStringRef v11;
  CFStringRef v12;
  CFStringRef v13;
  CFStringRef v14;
  CFStringRef v15;
  CFStringRef v16;
  const char *v17;
  uint64_t v18;
  CFStringRef v19;
  void *v20;
  __SCDynamicStore *storeRef;
  const __CFArray *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B28], (CFStringRef)*MEMORY[0x1E0CE8B20], 0);
  if (NetworkServiceEntity)
  {
    v8 = NetworkServiceEntity;
    serviceID = (const __CFString *)self->_serviceID;
    if (serviceID)
    {
      v10 = (const __CFString *)*MEMORY[0x1E0CE8B30];
      v11 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, (CFStringRef)*MEMORY[0x1E0CE8B30], serviceID, (CFStringRef)*MEMORY[0x1E0CE8B78]);
      if (!v11)
      {
        v20 = 0;
LABEL_20:
        CFRelease(v8);

        return;
      }
      v12 = v11;
      v13 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, (CFStringRef)*MEMORY[0x1E0CE8B80]);
      if (!v13)
      {
        v20 = 0;
        v19 = 0;
        v15 = 0;
        v14 = 0;
        goto LABEL_11;
      }
      v14 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, (CFStringRef)*MEMORY[0x1E0CE8B68]);
      if (!v14)
      {
        v20 = 0;
        v19 = 0;
        v15 = 0;
        goto LABEL_11;
      }
      v15 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, (CFStringRef)*MEMORY[0x1E0CE8B70]);
      if (!v15)
      {
        v20 = 0;
        v19 = 0;
        goto LABEL_11;
      }
      v16 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v10, (CFStringRef)self->_serviceID, 0);
      v19 = v16;
      if (!v16)
      {
        v20 = 0;
        goto LABEL_11;
      }
      v23[0] = v12;
      v23[1] = v13;
      v23[2] = v14;
      v23[3] = v15;
      v23[4] = v16;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v17, (uint64_t)v23, 5, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v19 = 0;
      v20 = 0;
    }
    storeRef = self->_storeRef;
    objc_msgSend_arrayWithObject_(MEMORY[0x1E0C99D20], v5, (uint64_t)v8, v6, v7);
    v22 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    SCDynamicStoreSetNotificationKeys(storeRef, (CFArrayRef)v20, v22);

    if (!v12)
    {
LABEL_12:
      if (v13)
        CFRelease(v13);
      if (v14)
        CFRelease(v14);
      if (v15)
        CFRelease(v15);
      if (v19)
        CFRelease(v19);
      goto LABEL_20;
    }
LABEL_11:
    CFRelease(v12);
    goto LABEL_12;
  }
}

- (BOOL)__refreshServiceID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int updated;

  updated = objc_msgSend___updateServiceID(self, a2, v2, v3, v4);
  if (updated)
    objc_msgSend___refreshNotificationKeys(self, v6, v7, v8, v9);
  return updated;
}

- (BOOL)refreshServiceID
{
  NSObject *mutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A0198;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)restartEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A022C;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)startEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A02C8;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (void)stopEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06A0368;
  block[3] = &unk_1E6133138;
  block[4] = self;
  dispatch_sync(mutexQueue, block);
}

- (BOOL)isMonitoringEvents
{
  NSObject *mutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A0454;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__IPv4StateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], serviceID, (CFStringRef)*MEMORY[0x1E0CE8B78])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__DHCPStateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], serviceID, (CFStringRef)*MEMORY[0x1E0CE8B68])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__IPv6StateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], serviceID, (CFStringRef)*MEMORY[0x1E0CE8B80])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__DHCPv6StateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], serviceID, CFSTR("DHCPv6"))) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__IPv4SetupConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B28], serviceID, (CFStringRef)*MEMORY[0x1E0CE8B78])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__IPv6SetupConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B28], serviceID, (CFStringRef)*MEMORY[0x1E0CE8B80])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__DNSStateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], serviceID, (CFStringRef)*MEMORY[0x1E0CE8B70])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__DNSSetupConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B28], serviceID, (CFStringRef)*MEMORY[0x1E0CE8B70])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__proxiesSetupConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B28], serviceID, (CFStringRef)*MEMORY[0x1E0CE8BA8])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)__serviceStateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], serviceID, 0)) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v11 = v6;
      v12 = (void *)objc_msgSend_copy(v6, v7, v8, v9, v10);
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (id)IPv4ARPResolvedHardwareAddress
{
  NSObject *mutexQueue;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A0B60;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  CWFCorrectEthernetAddressString((void *)v7[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4ARPResolvedIPAddress
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A0CC8;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4Router
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A0E30;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4Addresses
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A0F98;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4SubnetMasks
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1100;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6Router
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1268;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6Addresses
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A13D0;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6ConfigMethod
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1538;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4ConfigMethod
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1658;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DNSDomainName
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1778;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DNSServerAddresses
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A18E0;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (NSString)serviceID
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1A48;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (id)serviceName
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1B44;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)__DHCPInfo
{
  const __CFString *serviceID;
  CFDictionaryRef v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CFDictionaryRef v7;
  void *v8;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID && (v3 = SCDynamicStoreCopyDHCPInfo(self->_storeRef, serviceID)) != 0)
  {
    v7 = v3;
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v4, (uint64_t)v3, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)DHCPLeaseStartTimestamp
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1C9C;
  v5[3] = &unk_1E6134120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPLeaseExpirationTimestamp
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1DBC;
  v5[3] = &unk_1E6134120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv4NetworkSignature
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1EDC;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)IPv6NetworkSignature
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A1FF8;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPServerID
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A2114;
  v5[3] = &unk_1E6134120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)DHCPv6ServerID
{
  NSObject *mutexQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1B063EA90;
  v10 = sub_1B063EA10;
  v11 = 0;
  mutexQueue = self->_mutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1B06A2238;
  v5[3] = &unk_1E6134120;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
