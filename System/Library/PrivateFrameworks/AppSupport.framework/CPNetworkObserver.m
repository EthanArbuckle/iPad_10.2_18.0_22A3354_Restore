@implementation CPNetworkObserver

- (CPNetworkObserver)init
{
  CPNetworkObserver *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPNetworkObserver;
  v2 = -[CPNetworkObserver init](&v4, sel_init);
  if (v2)
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  return v2;
}

- (void)dealloc
{
  __SCPreferences *wifiPreferences;
  CFStringRef *v4;
  __SCPreferences *v5;
  __CFRunLoop *Main;
  __SCNetworkReachability *networkReach;
  __SCNetworkReachability *v8;
  __CFRunLoop *v9;
  __CFDictionary *wifiObservers;
  __CFDictionary *networkObservers;
  objc_super v12;

  wifiPreferences = self->_wifiPreferences;
  v4 = (CFStringRef *)MEMORY[0x1E0C9B270];
  if (wifiPreferences)
  {
    SCPreferencesSetCallback(wifiPreferences, 0, 0);
    v5 = self->_wifiPreferences;
    Main = CFRunLoopGetMain();
    SCPreferencesUnscheduleFromRunLoop(v5, Main, *v4);
    CFRelease(self->_wifiPreferences);
  }
  networkReach = self->_networkReach;
  if (networkReach)
  {
    SCNetworkReachabilitySetCallback(networkReach, 0, 0);
    v8 = self->_networkReach;
    v9 = CFRunLoopGetMain();
    SCNetworkReachabilityUnscheduleFromRunLoop(v8, v9, *v4);
    CFRelease(self->_networkReach);
  }
  -[NSLock lock](self->_lock, "lock");
  wifiObservers = self->_wifiObservers;
  if (wifiObservers)
  {
    CFRelease(wifiObservers);
    self->_wifiObservers = 0;
  }
  networkObservers = self->_networkObservers;
  if (networkObservers)
  {
    CFRelease(networkObservers);
    self->_networkObservers = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");

  v12.receiver = self;
  v12.super_class = (Class)CPNetworkObserver;
  -[CPNetworkObserver dealloc](&v12, sel_dealloc);
}

+ (id)sharedNetworkObserver
{
  pthread_once(&_CPNetworkObserverSharedOnce, (void (*)(void))_CPNetworkObserverSharedInitialize);
  return (id)_CPNetworkObserverShared;
}

- (void)addObserver:(id)a3 selector:(SEL)a4 forHostname:(id)a5
{
  NSMutableDictionary *reachabilityRequests;
  _ReachabilityRequest *v10;

  -[NSLock lock](self->_lock, "lock");
  reachabilityRequests = self->_reachabilityRequests;
  if (!reachabilityRequests)
  {
    reachabilityRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_reachabilityRequests = reachabilityRequests;
  }
  v10 = (_ReachabilityRequest *)-[NSMutableDictionary objectForKey:](reachabilityRequests, "objectForKey:", a5);
  if (!v10)
  {
    v10 = -[_ReachabilityRequest initWithHostname:]([_ReachabilityRequest alloc], "initWithHostname:", a5);
    -[NSMutableDictionary setObject:forKey:](self->_reachabilityRequests, "setObject:forKey:", v10, -[_ReachabilityRequest hostname](v10, "hostname"));

  }
  -[_ReachabilityRequest addObserver:selector:](v10, "addObserver:selector:", a3, a4);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)removeObserver:(id)a3
{
  NSMutableDictionary *reachabilityRequests;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  reachabilityRequests = self->_reachabilityRequests;
  if (!reachabilityRequests)
  {
    reachabilityRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_reachabilityRequests = reachabilityRequests;
  }
  v6 = (void *)-[NSMutableDictionary allKeys](reachabilityRequests, "allKeys");
  -[NSLock unlock](self->_lock, "unlock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[CPNetworkObserver removeObserver:forHostname:](self, "removeObserver:forHostname:", a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)removeObserver:(id)a3 forHostname:(id)a4
{
  NSMutableDictionary *reachabilityRequests;
  void *v8;
  void *v9;

  -[NSLock lock](self->_lock, "lock");
  reachabilityRequests = self->_reachabilityRequests;
  if (!reachabilityRequests)
  {
    reachabilityRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_reachabilityRequests = reachabilityRequests;
  }
  v8 = (void *)-[NSMutableDictionary objectForKey:](reachabilityRequests, "objectForKey:", a4);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "removeObserver:", a3);
    if ((objc_msgSend(v9, "hasObservers") & 1) == 0)
      -[NSMutableDictionary removeObjectForKey:](self->_reachabilityRequests, "removeObjectForKey:", objc_msgSend(v9, "hostname"));
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_networkObserversInitialize
{
  const __CFAllocator *v3;
  __SCNetworkReachability *v4;
  __SCNetworkReachability *networkReach;
  __CFRunLoop *Main;
  SCNetworkReachabilityContext v7;
  sockaddr address;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  self->_networkObservers = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  address = (sockaddr)xmmword_18EB44520;
  v4 = SCNetworkReachabilityCreateWithAddress(v3, &address);
  self->_networkReach = v4;
  SCNetworkReachabilityGetFlags(v4, &self->_networkReachability);
  self->_networkReachable = (self->_networkReachability & 2) != 0;
  -[CPNetworkObserver performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__networkReachableFirstCallBack_, objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_networkReachability, 4), 0);
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  SCNetworkReachabilitySetCallback(self->_networkReach, (SCNetworkReachabilityCallBack)_NetworkReachabilityCallBack, &v7);
  networkReach = self->_networkReach;
  Main = CFRunLoopGetMain();
  SCNetworkReachabilityScheduleWithRunLoop(networkReach, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);
}

- (void)_networkReachableCallBack:(unsigned int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFAllocator *v7;
  int v8;
  __CFDictionary *networkObservers;
  const __CFDictionary *Copy;
  id v11;
  uint64_t v12;
  _BYTE v13[2];

  if ((a3 & 2) != 0 && (self->_networkReachability & 2) != 0)
  {
    v13[0] = 0;
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  v5 = 0;
  self->_networkReachability = a3;
  v13[v4] = (a3 & 2) >> 1;
  v6 = v4 + 1;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  do
  {
    v8 = v13[v5];
    if (v8 != self->_networkReachable || !self->_networkNotified)
    {
      self->_networkNotified = 1;
      self->_networkReachable = v8;
      -[NSLock lock](self->_lock, "lock");
      networkObservers = self->_networkObservers;
      if (networkObservers && CFDictionaryGetCount(networkObservers) > 0)
      {
        Copy = CFDictionaryCreateCopy(v7, self->_networkObservers);
        -[NSLock unlock](self->_lock, "unlock");
        if (Copy)
        {
          v11 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_networkReachable), CFSTR("CPNetworkObserverReachable"));
          CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)_NotifyObserver, (void *)objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("CPNetworkObserverNetworkReachableNotification"), 0, v12));
          CFRelease(Copy);
          objc_msgSend(v11, "drain");
        }
      }
      else
      {
        -[NSLock unlock](self->_lock, "unlock");
      }
    }
    ++v5;
  }
  while (v6 != v5);
}

- (void)_networkReachableFirstCallBack:(id)a3
{
  -[CPNetworkObserver _networkReachableCallBack:](self, "_networkReachableCallBack:", *(unsigned int *)objc_msgSend(a3, "bytes"));
}

- (BOOL)isNetworkReachable
{
  BOOL networkReachable;

  -[NSLock lock](self->_lock, "lock");
  if (!self->_networkObservers)
    -[CPNetworkObserver _networkObserversInitialize](self, "_networkObserversInitialize");
  networkReachable = self->_networkReachable;
  -[NSLock unlock](self->_lock, "unlock");
  return networkReachable;
}

- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4
{
  __CFDictionary *networkObservers;

  -[NSLock lock](self->_lock, "lock");
  networkObservers = self->_networkObservers;
  if (!networkObservers)
  {
    -[CPNetworkObserver _networkObserversInitialize](self, "_networkObserversInitialize");
    networkObservers = self->_networkObservers;
  }
  CFDictionaryAddValue(networkObservers, a3, a4);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)removeNetworkReachableObserver:(id)a3
{
  __CFDictionary *networkObservers;

  -[NSLock lock](self->_lock, "lock");
  networkObservers = self->_networkObservers;
  if (!networkObservers)
  {
    -[CPNetworkObserver _networkObserversInitialize](self, "_networkObserversInitialize");
    networkObservers = self->_networkObservers;
  }
  CFDictionaryRemoveValue(networkObservers, a3);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_wifiObserversInitialize
{
  const __CFAllocator *v3;
  __CFBundle *MainBundle;
  CFStringRef Identifier;
  const __CFString *v6;
  const char *v7;
  uint64_t v8;
  __SCPreferences *wifiPreferences;
  __CFRunLoop *Main;
  int v11;
  SCPreferencesContext context;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  self->_wifiObservers = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  MainBundle = CFBundleGetMainBundle();
  if (MainBundle && (Identifier = CFBundleGetIdentifier(MainBundle)) != 0)
  {
    v6 = Identifier;
    CFRetain(Identifier);
  }
  else
  {
    v7 = getprogname();
    v8 = getpid();
    v6 = CFStringCreateWithFormat(v3, 0, CFSTR("%s (%d)"), v7, v8);
  }
  self->_wifiPreferences = SCPreferencesCreate(v3, v6, CFSTR("com.apple.wifi.plist"));
  CFRelease(v6);
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  SCPreferencesSetCallback(self->_wifiPreferences, (SCPreferencesCallBack)_WiFiCallBack, &context);
  wifiPreferences = self->_wifiPreferences;
  Main = CFRunLoopGetMain();
  SCPreferencesScheduleWithRunLoop(wifiPreferences, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);
  self->_wifiEnabled = _WiFiIsSettingEnabled(self->_wifiPreferences);
  v11 = 1;
  -[CPNetworkObserver performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__wifiFirstCallBack_, objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v11, 4), 0);
}

- (void)_wifiCallBack:(unsigned int)a3
{
  _BOOL8 IsSettingEnabled;
  _BOOL8 v5;
  __CFDictionary *wifiObservers;
  const __CFDictionary *Copy;
  id v8;
  uint64_t v9;

  if ((a3 & 1) != 0)
  {
    IsSettingEnabled = _WiFiIsSettingEnabled(self->_wifiPreferences);
    v5 = IsSettingEnabled;
    if (self->_wifiEnabled != IsSettingEnabled || !self->_wifiNotified)
    {
      self->_wifiEnabled = IsSettingEnabled;
      self->_wifiNotified = 1;
      -[NSLock lock](self->_lock, "lock");
      wifiObservers = self->_wifiObservers;
      if (wifiObservers && CFDictionaryGetCount(wifiObservers) > 0)
      {
        Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], self->_wifiObservers);
        -[NSLock unlock](self->_lock, "unlock");
        if (Copy)
        {
          v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5), CFSTR("CPNetworkObserverWiFiEnabled"));
          CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)_NotifyObserver, (void *)objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("CPNetworkObserverWiFiNotification"), 0, v9));
          CFRelease(Copy);
          objc_msgSend(v8, "drain");
        }
      }
      else
      {
        -[NSLock unlock](self->_lock, "unlock");
      }
    }
  }
}

- (void)_wifiFirstCallBack:(id)a3
{
  -[CPNetworkObserver _wifiCallBack:](self, "_wifiCallBack:", *(unsigned int *)objc_msgSend(a3, "bytes"));
}

- (BOOL)isWiFiEnabled
{
  BOOL wifiEnabled;

  -[NSLock lock](self->_lock, "lock");
  if (!self->_wifiObservers)
    -[CPNetworkObserver _wifiObserversInitialize](self, "_wifiObserversInitialize");
  wifiEnabled = self->_wifiEnabled;
  -[NSLock unlock](self->_lock, "unlock");
  return wifiEnabled;
}

- (void)addWiFiObserver:(id)a3 selector:(SEL)a4
{
  __CFDictionary *wifiObservers;

  -[NSLock lock](self->_lock, "lock");
  wifiObservers = self->_wifiObservers;
  if (!wifiObservers)
  {
    -[CPNetworkObserver _wifiObserversInitialize](self, "_wifiObserversInitialize");
    wifiObservers = self->_wifiObservers;
  }
  CFDictionaryAddValue(wifiObservers, a3, a4);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)removeWiFiObserver:(id)a3
{
  __CFDictionary *wifiObservers;

  -[NSLock lock](self->_lock, "lock");
  wifiObservers = self->_wifiObservers;
  if (!wifiObservers)
  {
    -[CPNetworkObserver _wifiObserversInitialize](self, "_wifiObserversInitialize");
    wifiObservers = self->_wifiObservers;
  }
  CFDictionaryRemoveValue(wifiObservers, a3);
  -[NSLock unlock](self->_lock, "unlock");
}

@end
