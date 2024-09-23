@implementation CWFSCNetworkInterface

- (CWFSCNetworkInterface)initWithInterfaceName:(id)a3
{
  id v4;
  CWFSCNetworkInterface *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CWFSCNetworkInterface *v10;
  uint64_t v11;
  NSString *interfaceName;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *hardwareAddress;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *mutexQueue;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *eventQueue;
  SCDynamicStoreRef v30;
  SCDynamicStoreContext v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CWFSCNetworkInterface;
  v5 = -[CWFSCNetworkInterface init](&v33, sel_init);
  v10 = v5;
  if (!v4)
    goto LABEL_8;
  if (!v5)
    goto LABEL_8;
  v11 = objc_msgSend_copy(v4, v6, v7, v8, v9);
  interfaceName = v10->_interfaceName;
  v10->_interfaceName = (NSString *)v11;

  objc_msgSend___networkInterfaceHardwareAddress(v10, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend_copy(v17, v18, v19, v20, v21);
  hardwareAddress = v10->_hardwareAddress;
  v10->_hardwareAddress = (NSString *)v22;

  if (!v10->_hardwareAddress)
    goto LABEL_8;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = dispatch_queue_create("com.apple.corewifi.SC-interface-mutex", v24);
  mutexQueue = v10->_mutexQueue;
  v10->_mutexQueue = (OS_dispatch_queue *)v25;

  if (!v10->_mutexQueue)
    goto LABEL_8;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = dispatch_queue_create("com.apple.corewifi.SC-interface-event", v27);
  eventQueue = v10->_eventQueue;
  v10->_eventQueue = (OS_dispatch_queue *)v28;

  if (!v10->_eventQueue
    || (v32.version = 0,
        memset(&v32.retain, 0, 24),
        v32.info = v10,
        v30 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("com.apple.corewifi.SC-interface"), (SCDynamicStoreCallBack)sub_1B06EDEA4, &v32), (v10->_storeRef = v30) == 0)|| !SCDynamicStoreSetDisconnectCallBack())
  {
LABEL_8:

    v10 = 0;
  }

  return v10;
}

- (CWFSCNetworkInterface)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("-[CWFSCNetworkInterface init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  __SCDynamicStore *storeRef;
  objc_super v4;

  storeRef = self->_storeRef;
  if (storeRef)
    CFRelease(storeRef);
  v4.receiver = self;
  v4.super_class = (Class)CWFSCNetworkInterface;
  -[CWFSCNetworkInterface dealloc](&v4, sel_dealloc);
}

- (void)__startEventMonitoring
{
  const __CFAllocator *v3;
  const __CFString *v4;
  CFStringRef NetworkInterfaceEntity;
  CFStringRef v6;
  CFStringRef v7;
  const char *v8;
  uint64_t v9;
  CFStringRef v10;
  const __CFArray *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = (const __CFString *)*MEMORY[0x1E0CE8B30];
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)self->_interfaceName, (CFStringRef)*MEMORY[0x1E0CE8B78]);
  if (NetworkInterfaceEntity)
  {
    v6 = NetworkInterfaceEntity;
    v7 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(v3, v4, (CFStringRef)self->_interfaceName, (CFStringRef)*MEMORY[0x1E0CE8B80]);
    if (v7)
    {
      v10 = v7;
      v12[0] = v6;
      v12[1] = v7;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)v12, 2, v9);
      v11 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      if (SCDynamicStoreSetNotificationKeys(self->_storeRef, v11, 0))
        SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_eventQueue);
      CFRelease(v6);
      CFRelease(v10);

    }
    else
    {
      CFRelease(v6);
    }
  }
}

- (void)restartEventMonitoring
{
  NSObject *mutexQueue;
  _QWORD block[5];

  mutexQueue = self->_mutexQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B06EE398;
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
  block[2] = sub_1B06EE428;
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
  block[2] = sub_1B06EE4C4;
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
  v5[2] = sub_1B06EE5B0;
  v5[3] = &unk_1E6133160;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)airPortStateConfiguration
{
  const __CFString *interfaceName;
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], interfaceName, (CFStringRef)*MEMORY[0x1E0CE8B58])) != 0)
  {
    v5 = NetworkInterfaceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
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

- (id)airPortSetupConfiguration
{
  const __CFString *interfaceName;
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B28], interfaceName, (CFStringRef)*MEMORY[0x1E0CE8B58])) != 0)
  {
    v5 = NetworkInterfaceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
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

- (id)__IPv4StateConfig
{
  const __CFString *interfaceName;
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], interfaceName, (CFStringRef)*MEMORY[0x1E0CE8B78])) != 0)
  {
    v5 = NetworkInterfaceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
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
  const __CFString *interfaceName;
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], interfaceName, (CFStringRef)*MEMORY[0x1E0CE8B80])) != 0)
  {
    v5 = NetworkInterfaceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
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

- (id)__linkStateConfig
{
  const __CFString *interfaceName;
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;

  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], interfaceName, (CFStringRef)*MEMORY[0x1E0CE8B90])) != 0)
  {
    v5 = NetworkInterfaceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
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

- (id)IPv4Addresses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv4StateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8CC8], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv4BroadcastAddresses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv4StateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8CD0], v7, v8);
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

  objc_msgSend___IPv4StateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D18], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6Addresses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv6StateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D28], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)IPv6Flags
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend___IPv6StateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D40], v7, v8);
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

  objc_msgSend___IPv6StateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D50], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isLinkActive
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  objc_msgSend___linkStateConfig(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E0CE8D98], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_BOOLValue(v9, v10, v11, v12, v13);

  return v14;
}

- (id)__networkInterfaceHardwareAddress
{
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  const __SCNetworkInterface *ValueAtIndex;
  const __SCNetworkInterface *v9;
  __CFString *BSDName;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *HardwareAddressString;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = SCNetworkInterfaceCopyAll();
  if (v3)
  {
    v4 = v3;
    Count = CFArrayGetCount(v3);
    if (Count < 1)
    {
LABEL_8:
      v14 = 0;
    }
    else
    {
      v6 = Count;
      v7 = 0;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkInterface *)CFArrayGetValueAtIndex(v4, v7);
        if (ValueAtIndex)
        {
          do
          {
            v9 = ValueAtIndex;
            ValueAtIndex = SCNetworkInterfaceGetInterface(ValueAtIndex);
          }
          while (ValueAtIndex);
          BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(v9);
          if (objc_msgSend_isEqualToString_(BSDName, v11, (uint64_t)self->_interfaceName, v12, v13))
            break;
        }
        if (++v7 == v6)
          goto LABEL_8;
      }
      HardwareAddressString = (__CFString *)SCNetworkInterfaceGetHardwareAddressString(v9);
      CWFCorrectEthernetAddressString(HardwareAddressString);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend_copy(v16, v17, v18, v19, v20);

    }
    CFRelease(v4);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (NSString)hardwareAddress
{
  return self->_hardwareAddress;
}

- (id)eventHandler
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_hardwareAddress, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_mutexQueue, 0);
}

@end
