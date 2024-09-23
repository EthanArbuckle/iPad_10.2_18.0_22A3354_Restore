@implementation CWFSCNetworkConfiguration

- (CWFSCNetworkConfiguration)init
{
  CWFSCNetworkConfiguration *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *mutexQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *eventQueue;
  SCDynamicStoreRef v9;
  SCDynamicStoreContext v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CWFSCNetworkConfiguration;
  v2 = -[CWFSCNetworkConfiguration init](&v12, sel_init);
  if (!v2)
    goto LABEL_6;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.corewifi.SC-global-mutex", v3);
  mutexQueue = v2->_mutexQueue;
  v2->_mutexQueue = (OS_dispatch_queue *)v4;

  if (!v2->_mutexQueue)
    goto LABEL_6;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = dispatch_queue_create("com.apple.corewifi.SC-global-event", v6);
  eventQueue = v2->_eventQueue;
  v2->_eventQueue = (OS_dispatch_queue *)v7;

  if (!v2->_eventQueue
    || (v11.version = 0,
        memset(&v11.retain, 0, 24),
        v11.info = v2,
        v9 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.corewifi.SC-global"), (SCDynamicStoreCallBack)sub_1B06E5224, &v11), (v2->_storeRef = v9) == 0)|| !SCDynamicStoreSetDisconnectCallBack())
  {
LABEL_6:

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  __SCDynamicStore *storeRef;
  objc_super v4;

  storeRef = self->_storeRef;
  if (storeRef)
    CFRelease(storeRef);
  v4.receiver = self;
  v4.super_class = (Class)CWFSCNetworkConfiguration;
  -[CWFSCNetworkConfiguration dealloc](&v4, sel_dealloc);
}

- (void)__startEventMonitoring
{
  const __CFAllocator *v3;
  const __CFString *v4;
  CFStringRef NetworkGlobalEntity;
  CFStringRef v6;
  CFStringRef v7;
  CFStringRef v8;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef NetworkInterface;
  const char *v12;
  uint64_t v13;
  CFStringRef v14;
  const __CFArray *v15;
  const char *v16;
  uint64_t v17;
  const __CFArray *v18;
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = (const __CFString *)*MEMORY[0x1E0CE8B30];
  NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
  if (!NetworkGlobalEntity)
    goto LABEL_16;
  v6 = NetworkGlobalEntity;
  v7 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, v4, (CFStringRef)*MEMORY[0x1E0CE8B80]);
  if (!v7)
  {
    CFRelease(v6);
LABEL_16:
    v18 = 0;
    v15 = 0;
    goto LABEL_14;
  }
  v8 = v7;
  v9 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, v4, (CFStringRef)*MEMORY[0x1E0CE8B70]);
  if (!v9)
  {
    v10 = 0;
    goto LABEL_18;
  }
  v10 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v3, v4, (CFStringRef)*MEMORY[0x1E0CE8B68]);
  if (!v10)
  {
LABEL_18:
    v14 = 0;
    goto LABEL_19;
  }
  NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(v3, v4);
  v14 = NetworkInterface;
  if (NetworkInterface)
  {
    v20[0] = NetworkInterface;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v20, 1, v13);
    v15 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v19[1] = v8;
    v19[2] = v9;
    v19[3] = v10;
    v19[4] = *MEMORY[0x1E0CE8B28];
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v19, 5, v17);
    v18 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    if (SCDynamicStoreSetNotificationKeys(self->_storeRef, v15, v18))
      SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_eventQueue);
    goto LABEL_8;
  }
LABEL_19:
  v15 = 0;
  v18 = 0;
LABEL_8:
  CFRelease(v6);
  CFRelease(v8);
  if (v9)
    CFRelease(v9);
  if (v10)
    CFRelease(v10);
  if (v14)
    CFRelease(v14);
LABEL_14:

}

- (void)restartEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06E5764;
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
  block[2] = sub_1B06E57F4;
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
  block[2] = sub_1B06E5890;
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
  v5[2] = sub_1B06E597C;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)__IPv4StateConfigForServiceID:(id)a3
{
  __CFString *v4;
  const __CFString *NetworkServiceEntity;
  const __CFString *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;

  v4 = (__CFString *)a3;
  if (v4
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], v4, (CFStringRef)*MEMORY[0x1E0CE8B78])) != 0)
  {
    v6 = NetworkServiceEntity;
    v7 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v7)
    {
      v12 = v7;
      v13 = (void *)objc_msgSend_copy(v7, v8, v9, v10, v11);
      CFRelease(v12);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)__IPv6StateConfigForServiceID:(id)a3
{
  __CFString *v4;
  const __CFString *NetworkServiceEntity;
  const __CFString *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;

  v4 = (__CFString *)a3;
  if (v4
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], v4, (CFStringRef)*MEMORY[0x1E0CE8B80])) != 0)
  {
    v6 = NetworkServiceEntity;
    v7 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v7)
    {
      v12 = v7;
      v13 = (void *)objc_msgSend_copy(v7, v8, v9, v10, v11);
      CFRelease(v12);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)__IPv4SetupConfigForServiceID:(id)a3
{
  __CFString *v4;
  const __CFString *NetworkServiceEntity;
  const __CFString *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;

  v4 = (__CFString *)a3;
  if (v4
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B28], v4, (CFStringRef)*MEMORY[0x1E0CE8B78])) != 0)
  {
    v6 = NetworkServiceEntity;
    v7 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v7)
    {
      v12 = v7;
      v13 = (void *)objc_msgSend_copy(v7, v8, v9, v10, v11);
      CFRelease(v12);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)__IPv6SetupConfigForServiceID:(id)a3
{
  __CFString *v4;
  const __CFString *NetworkServiceEntity;
  const __CFString *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;

  v4 = (__CFString *)a3;
  if (v4
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B28], v4, (CFStringRef)*MEMORY[0x1E0CE8B80])) != 0)
  {
    v6 = NetworkServiceEntity;
    v7 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v7)
    {
      v12 = v7;
      v13 = (void *)objc_msgSend_copy(v7, v8, v9, v10, v11);
      CFRelease(v12);
    }
    else
    {
      v13 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)__IPv4GlobalStateConfig
{
  const __CFString *NetworkGlobalEntity;
  const __CFString *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;

  NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
  if (NetworkGlobalEntity)
  {
    v4 = NetworkGlobalEntity;
    v5 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkGlobalEntity);
    if (v5)
    {
      v10 = v5;
      v11 = (void *)objc_msgSend_copy(v5, v6, v7, v8, v9);
      CFRelease(v10);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)__IPv6GlobalStateConfig
{
  const __CFString *NetworkGlobalEntity;
  const __CFString *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;

  NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B80]);
  if (NetworkGlobalEntity)
  {
    v4 = NetworkGlobalEntity;
    v5 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkGlobalEntity);
    if (v5)
    {
      v10 = v5;
      v11 = (void *)objc_msgSend_copy(v5, v6, v7, v8, v9);
      CFRelease(v10);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)__DNSGlobalStateConfig
{
  const __CFString *NetworkGlobalEntity;
  const __CFString *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;

  NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B70]);
  if (NetworkGlobalEntity)
  {
    v4 = NetworkGlobalEntity;
    v5 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkGlobalEntity);
    if (v5)
    {
      v10 = v5;
      v11 = (void *)objc_msgSend_copy(v5, v6, v7, v8, v9);
      CFRelease(v10);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)__nameForServiceWithID:(id)a3
{
  __CFString *v3;
  const __CFAllocator *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  const __SCPreferences *v15;
  const __SCNetworkService *v16;
  const __SCNetworkService *v17;
  __CFString *Name;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v3 = (__CFString *)a3;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_processName(v9, v10, v11, v12, v13);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = SCPreferencesCreate(v4, v14, 0);

  if (v15)
  {
    v16 = SCNetworkServiceCopy(v15, v3);
    if (v16)
    {
      v17 = v16;
      Name = (__CFString *)SCNetworkServiceGetName(v16);
      if (Name)
        v23 = (void *)objc_msgSend_copy(Name, v19, v20, v21, v22);
      else
        v23 = 0;
      CFRelease(v15);
    }
    else
    {
      v23 = 0;
      v17 = v15;
    }
    CFRelease(v17);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)IPv4InterfaceName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv4GlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8B40], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv4ServiceID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv4GlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8B48], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv4ServiceName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_IPv4ServiceID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___nameForServiceWithID_(self, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)IPv4Addresses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend_IPv4ServiceID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___IPv4StateConfigForServiceID_(self, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CE8CC8];
  objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x1E0CE8CC8], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend___IPv4SetupConfigForServiceID_(self, v16, (uint64_t)v6, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v19, v20, v11, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)IPv4Router
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv4GlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D10], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv4SubnetMasks
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv4GlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D18], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6InterfaceName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv6GlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8B40], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6ServiceID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv6GlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8B48], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6Addresses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend_IPv6ServiceID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___IPv6StateConfigForServiceID_(self, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CE8D28];
  objc_msgSend_objectForKeyedSubscript_(v10, v12, *MEMORY[0x1E0CE8D28], v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend___IPv6SetupConfigForServiceID_(self, v16, (uint64_t)v6, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v19, v20, v11, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)IPv6ServiceName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_IPv6ServiceID(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend___nameForServiceWithID_(self, v7, (uint64_t)v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)IPv6Router
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv6GlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D78], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6PrefixLengths
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv6GlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D50], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)DNSServerAddresses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___DNSGlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8C28], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)DNSDomainName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___DNSGlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8C18], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)DNSSearchDomains
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___DNSGlobalStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8C20], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)__networkInterfaceStateConfig
{
  const __CFString *NetworkInterface;
  const __CFString *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  void *v11;

  NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30]);
  if (NetworkInterface)
  {
    v4 = NetworkInterface;
    v5 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterface);
    if (v5)
    {
      v10 = v5;
      v11 = (void *)objc_msgSend_copy(v5, v6, v7, v8, v9);
      CFRelease(v10);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)networkInterfaceNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___networkInterfaceStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8B38], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)__isIEEE80211NetworkInterfaceName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  int v15;
  BOOL v16;
  BOOL v17;
  _QWORD v19[2];
  _OWORD v20[3];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = v3;
  memset(v20, 0, 44);
  v19[0] = 0;
  v19[1] = 0;
  if (v3
    && objc_msgSend_length(v3, v4, v5, v6, v7)
    && (unint64_t)objc_msgSend_length(v8, v9, v10, v11, v12) <= 0x10
    && (v13 = socket(2, 2, 0), v13 != -1))
  {
    v15 = v13;
    objc_msgSend_getCString_maxLength_encoding_(v8, v14, (uint64_t)v19, 16, 30);
    if (LOBYTE(v19[0]))
    {
      __strlcpy_chk();
      if (ioctl(v15, 0xC02C6938uLL, v20))
        v16 = 0;
      else
        v16 = (v20[1] & 0xE0) == 128;
      v17 = v16;
    }
    else
    {
      v17 = 0;
    }
    close(v15);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)IEEE80211NetworkInterfacesNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_networkInterfaceNames(self, a2, v2, v3, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v8)
  {
    v12 = v8;
    v13 = 0;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v6);
        v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend___isIEEE80211NetworkInterfaceName_(self, v9, v16, v10, v11))
        {
          if (!v13)
          {
            objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v17, v10, v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_addObject_(v13, v9, v16, v10, v11);
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  v22 = (void *)objc_msgSend_copy(v13, v18, v19, v20, v21);
  return v22;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
