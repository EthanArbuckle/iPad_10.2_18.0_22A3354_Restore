@implementation NetworkChangeNotifier

+ (id)sharedInstance
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_enableNotifications(a1, a2, v2, v3);
  return (id)qword_1ECD90B78;
}

+ (BOOL)enableNotifications
{
  uint64_t v2;
  id v3;
  void *v4;

  v2 = qword_1ECD90B78;
  if (!qword_1ECD90B78)
  {
    v3 = objc_alloc_init((Class)a1);
    v4 = (void *)qword_1ECD90B78;
    qword_1ECD90B78 = (uint64_t)v3;

    v2 = qword_1ECD90B78;
  }
  return v2 != 0;
}

+ (void)disableNotifications
{
  void *v2;

  v2 = (void *)qword_1ECD90B78;
  qword_1ECD90B78 = 0;

}

- (void)_clearIPCache
{
  NSArray *myIPs;
  NSString *myIP;

  myIPs = self->_myIPs;
  self->_myIPs = 0;

  myIP = self->_myIP;
  self->_myIP = 0;

}

- (BOOL)_listenForChanges
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  __SCDynamicStore *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const CFArrayCallBacks *v18;
  __CFArray *Mutable;
  __CFArray *v20;
  const __CFString *v21;
  const __CFString *v22;
  CFStringRef NetworkGlobalEntity;
  CFStringRef NetworkInterfaceEntity;
  CFStringRef v25;
  CFStringRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  IMConnectionMonitor *v35;
  const char *v36;
  IMConnectionMonitor *v37;
  IMConnectionMonitor *connectionMonitor;
  char v40;
  SCDynamicStoreContext context;

  if (self->_store)
  {
    _IMWarn(CFSTR("Illegal second call to _listenForChanges"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v40);
    return 1;
  }
  else
  {
    context.version = 0;
    memset(&context.retain, 0, 24);
    context.info = self;
    v10 = SCDynamicStoreCreate(0, CFSTR("com.apple.messagingagent"), (SCDynamicStoreCallBack)sub_1906901D4, &context);
    self->_store = v10;
    if (v10)
    {
      v18 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
      v20 = CFArrayCreateMutable(0, 0, v18);
      SCDynamicStoreSetDispatchQueue(self->_store, MEMORY[0x1E0C80D38]);
      v21 = (const __CFString *)*MEMORY[0x1E0CE8B30];
      v22 = (const __CFString *)*MEMORY[0x1E0CE8B78];
      NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
      CFArrayAppendValue(Mutable, NetworkGlobalEntity);
      if (NetworkGlobalEntity)
        CFRelease(NetworkGlobalEntity);
      NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, v21, (CFStringRef)*MEMORY[0x1E0CE8B20], v22);
      CFArrayAppendValue(v20, NetworkInterfaceEntity);
      if (NetworkInterfaceEntity)
        CFRelease(NetworkInterfaceEntity);
      v25 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, v21, (CFStringRef)*MEMORY[0x1E0CE8B70]);
      CFArrayAppendValue(Mutable, v25);
      if (v25)
        CFRelease(v25);
      v26 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, v21, (CFStringRef)*MEMORY[0x1E0CE8BA8]);
      CFArrayAppendValue(Mutable, v26);
      if (v26)
        CFRelease(v26);
      v34 = SCDynamicStoreSetNotificationKeys(self->_store, Mutable, v20);
      v8 = v34 != 0;
      if (Mutable)
        CFRelease(Mutable);
      if (v20)
        CFRelease(v20);
      if (!v34)
        _IMWarn(CFSTR("*** SCDynamicStoreSetNotificationKeys() failed"), v27, v28, v29, v30, v31, v32, v33, v40);
      v35 = [IMConnectionMonitor alloc];
      v37 = (IMConnectionMonitor *)objc_msgSend_initWithRemoteHost_delegate_(v35, v36, 0, (uint64_t)self);
      connectionMonitor = self->_connectionMonitor;
      self->_connectionMonitor = v37;

    }
    else
    {
      _IMWarn(CFSTR("*** %s:%d SCDynamicStoreCreate() failed"), v11, v12, v13, v14, v15, v16, v17, (char)"/Library/Caches/com.apple.xbs/Sources/IMFoundation/IMFoundation/NetworkChangeNotifier.m");
      return 0;
    }
  }
  return v8;
}

- (NetworkChangeNotifier)init
{
  NetworkChangeNotifier *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  NetworkChangeNotifier *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NetworkChangeNotifier *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NetworkChangeNotifier;
  v2 = -[NetworkChangeNotifier init](&v20, sel_init);
  v6 = v2;
  if (v2)
  {
    if (!objc_msgSend__listenForChanges(v2, v3, v4, v5))
    {
      v18 = 0;
      goto LABEL_7;
    }
    objc_msgSend_sharedInstance(IMSystemMonitor, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__addEarlyListener_(v10, v11, (uint64_t)v6, v12);

    if (_IMWillLog(CFSTR("Network")))
      _IMAlwaysLog(0, CFSTR("Network"), CFSTR("Now listening for network changes"), v13, v14, v15, v16, v17, (char)v20.receiver);
  }
  v18 = v6;
LABEL_7:

  return v18;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  __SCDynamicStore *store;
  __SCDynamicStore *v19;
  objc_super v20;

  objc_msgSend_clear(self->_connectionMonitor, a2, v2, v3);
  objc_msgSend_setDelegate_(self->_connectionMonitor, v5, 0, v6);
  objc_msgSend_sharedInstance(IMSystemMonitor, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__removeEarlyListener_(v10, v11, (uint64_t)self, v12);

  objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v16, v17, (uint64_t)self, 0, 0);

  store = self->_store;
  if (store)
  {
    SCDynamicStoreSetDispatchQueue(store, 0);
    v19 = self->_store;
    if (v19)
    {
      CFRelease(v19);
      self->_store = 0;
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)NetworkChangeNotifier;
  -[NetworkChangeNotifier dealloc](&v20, sel_dealloc);
}

- (NSArray)myIPAddresses
{
  NSArray *myIPs;
  NSArray *v3;

  myIPs = self->_myIPs;
  if (myIPs)
    v3 = myIPs;
  return myIPs;
}

- (NSString)myGatewayAddress
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const __SCDynamicStore *DynamicStore;
  const __CFString *NetworkGlobalEntity;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend_sharedInstance(NetworkChangeNotifier, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DynamicStore = (const __SCDynamicStore *)objc_msgSend_getDynamicStore(v4, v5, v6, v7);

  if (DynamicStore)
  {
    NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
    v12 = (void *)SCDynamicStoreCopyValue(DynamicStore, NetworkGlobalEntity);
    if (NetworkGlobalEntity)
      CFRelease(NetworkGlobalEntity);
    if (v12)
    {
      objc_msgSend_objectForKey_(v12, v10, (uint64_t)CFSTR("Router"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return (NSString *)v13;
}

- (NSString)myIPAddress
{
  return 0;
}

- (__SCDynamicStore)getDynamicStore
{
  return self->_store;
}

- (int)linkQualityValueForInterfaceType:(unint64_t)a3
{
  const __CFString *v3;

  if (a3 == 3)
    v3 = CFSTR("pdp_ip0");
  else
    v3 = CFSTR("en0");
  return ((uint64_t (*)(NetworkChangeNotifier *, char *, const __CFString *))MEMORY[0x1E0DE7D20])(self, sel_linkQualityValueForInterface_, v3);
}

- (int)linkQualityValueForInterface:(id)a3
{
  __CFString *v4;
  const void *v5;
  const __CFString *NetworkInterfaceEntity;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  CFTypeID v9;
  const __CFNumber *Value;
  const __CFNumber *v11;
  CFTypeID v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int valuePtr;

  v4 = (__CFString *)a3;
  valuePtr = 0;
  v5 = (const void *)*MEMORY[0x1E0CE8BA0];
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)*MEMORY[0x1E0CE8B30], v4, (CFStringRef)*MEMORY[0x1E0CE8BA0]);
  v7 = (const __CFDictionary *)SCDynamicStoreCopyValue(self->_store, NetworkInterfaceEntity);
  v8 = v7;
  if (v7)
  {
    v9 = CFGetTypeID(v7);
    if (v9 == CFDictionaryGetTypeID())
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(v8, v5);
      if (Value)
      {
        v11 = Value;
        v12 = CFGetTypeID(Value);
        if (v12 == CFNumberGetTypeID())
          CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
      }
    }
  }
  if (NetworkInterfaceEntity)
    CFRelease(NetworkInterfaceEntity);
  if (v8)
    CFRelease(v8);
  if (_IMWillLog(CFSTR("Network")))
    _IMAlwaysLog(0, CFSTR("Network"), CFSTR("Link quality for interface %@ is %d"), v13, v14, v15, v16, v17, (char)v4);
  v18 = valuePtr;

  return v18;
}

- (unint64_t)linkQualityForInterfaceType:(unint64_t)a3
{
  uint64_t v3;
  int v4;

  v4 = objc_msgSend_linkQualityValueForInterfaceType_(self, a2, a3, v3);
  if (v4 <= 99)
    return v4 > 49;
  else
    return 2;
}

- (void)connectionMonitorDidUpdate:(id)a3
{
  uint64_t v3;
  uint64_t isImmediatelyReachable;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (self->_connectionMonitor == a3)
  {
    isImmediatelyReachable = objc_msgSend_isImmediatelyReachable(a3, a2, (uint64_t)a3, v3);
    if (_IMWillLog(CFSTR("Network")))
    {
      v13 = CFSTR("NO");
      if ((_DWORD)isImmediatelyReachable)
        v13 = CFSTR("YES");
      _IMAlwaysLog(0, CFSTR("Network"), CFSTR("NetworkChangeNotifier isNetworkUp: %@"), v8, v9, v10, v11, v12, (char)v13);
    }
    if (self->_lastPostedNetworkUp != (_DWORD)isImmediatelyReachable)
    {
      self->_lastPostedNetworkUp = isImmediatelyReachable;
      objc_msgSend_defaultCenter(MEMORY[0x1E0CB37D0], v6, v7, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("__kIMNetworkChangedNotificationNetworkAvailableKey");
      objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v15, isImmediatelyReachable, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v22, (uint64_t)&v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v14, v20, (uint64_t)CFSTR("__kIMNetworkChangedNotification"), 0, v19);

    }
  }
}

- (BOOL)isNetworkUp
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_isImmediatelyReachable(self->_connectionMonitor, a2, v2, v3);
}

- (BOOL)isPrimaryCellular
{
  BOOL v3;

  v3 = 0;
  sub_190690794(self->_store, (char *)&v3, 0);
  return v3;
}

- (id)primaryInterfaceName
{
  id v3;

  v3 = 0;
  sub_190690794(self->_store, 0, (CFTypeRef *)&v3);
  return v3;
}

- (__SCDynamicStore)store
{
  return self->_store;
}

- (void)setStore:(__SCDynamicStore *)a3
{
  self->_store = a3;
}

- (NSString)myIP
{
  return self->_myIP;
}

- (void)setMyIP:(id)a3
{
  objc_storeStrong((id *)&self->_myIP, a3);
}

- (NSArray)myIPs
{
  return self->_myIPs;
}

- (void)setMyIPs:(id)a3
{
  objc_storeStrong((id *)&self->_myIPs, a3);
}

- (IMConnectionMonitor)connectionMonitor
{
  return self->_connectionMonitor;
}

- (void)setConnectionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_connectionMonitor, a3);
}

- (BOOL)lastPostedNetworkUp
{
  return self->_lastPostedNetworkUp;
}

- (void)setLastPostedNetworkUp:(BOOL)a3
{
  self->_lastPostedNetworkUp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionMonitor, 0);
  objc_storeStrong((id *)&self->_myIPs, 0);
  objc_storeStrong((id *)&self->_myIP, 0);
}

@end
