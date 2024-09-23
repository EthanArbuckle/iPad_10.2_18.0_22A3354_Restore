@implementation _ReachabilityRequest

- (_ReachabilityRequest)initWithHostname:(id)a3
{
  _ReachabilityRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ReachabilityRequest;
  v4 = -[_ReachabilityRequest init](&v6, sel_init);
  if (v4)
  {
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v4->_hostname = (NSString *)objc_msgSend(a3, "copy");
    v4->_observers = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  }
  return v4;
}

- (void)dealloc
{
  __CFDictionary *observers;
  objc_super v4;

  -[NSLock lock](self->_lock, "lock");

  self->_hostname = 0;
  observers = self->_observers;
  if (observers)
  {
    CFRelease(observers);
    self->_observers = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");

  v4.receiver = self;
  v4.super_class = (Class)_ReachabilityRequest;
  -[_ReachabilityRequest dealloc](&v4, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_ReachabilityRequest;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), -[_ReachabilityRequest description](&v3, sel_description), self->_hostname);
}

- (void)reachabilityChangedWithFlags:(unsigned int)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  const __CFAllocator **v7;
  uint64_t v8;
  const __CFAllocator *v9;
  __CFDictionary *observers;
  const __CFDictionary *Copy;
  id v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((a3 & 2) != 0 && (self->_flags & 2) != 0)
  {
    v15[0] = a3 & 0xFFFFFFFD;
    v4 = 1;
  }
  else
  {
    v4 = 0;
  }
  v5 = 0;
  v6 = 4 * v4;
  v15[v4] = a3;
  v7 = (const __CFAllocator **)MEMORY[0x1E0C9AE00];
  v8 = v6 + 4;
  self->_flags = a3;
  v9 = *v7;
  do
  {
    if (((v15[v5 / 4] >> 1) & 1) != self->_isReachable || !self->_receivedAtLeastOneCallback)
    {
      self->_isReachable = (v15[v5 / 4] & 2) != 0;
      self->_receivedAtLeastOneCallback = 1;
      -[NSLock lock](self->_lock, "lock");
      observers = self->_observers;
      if (observers && CFDictionaryGetCount(observers) > 0)
      {
        Copy = CFDictionaryCreateCopy(v9, self->_observers);
        -[NSLock unlock](self->_lock, "unlock");
        if (Copy)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
          v13 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v15[v5 / 4], 4);
          v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_isReachable), CFSTR("CPNetworkObserverReachable"), self->_hostname, CFSTR("CPNetworkObserverHostname"), v13, CFSTR("CPNetworkObserverReachableFlags"), 0);
          CFDictionaryApplyFunction(Copy, (CFDictionaryApplierFunction)_NotifyObserver, (void *)objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("CPNetworkObserverHostnameReachableNotification"), 0, v14));
          CFRelease(Copy);
          objc_msgSend(v12, "drain");
        }
      }
      else
      {
        -[NSLock unlock](self->_lock, "unlock");
      }
    }
    v5 += 4;
  }
  while (v8 != v5);
}

- (void)addObserver:(id)a3 selector:(SEL)a4
{
  __CFDictionary *observers;
  __SCNetworkReachability *v8;
  NSString *hostname;
  sockaddr *ai_addr;
  __SCNetworkReachability *reachability;
  __CFRunLoop *Main;
  _QWORD v13[5];
  int ai_flags;
  SCNetworkReachabilityContext context;
  addrinfo *v16;
  addrinfo v17;

  -[NSLock lock](self->_lock, "lock");
  observers = self->_observers;
  if (observers)
  {
    CFDictionaryAddValue(observers, a3, a4);
    if (!self->_reachability)
    {
      context.version = 0;
      context.info = self;
      context.retain = (const void *(__cdecl *)(const void *))_RetainReachabilityContextInfo;
      context.release = (void (__cdecl *)(const void *))_ReleaseReachabilityContextInfo;
      context.copyDescription = 0;
      v8 = SCNetworkReachabilityCreateWithName((CFAllocatorRef)*MEMORY[0x1E0C9AE00], -[NSString UTF8String](self->_hostname, "UTF8String"));
      self->_reachability = v8;
      if (v8)
      {
        hostname = self->_hostname;
        v16 = 0;
        memset(&v17, 0, sizeof(v17));
        v17.ai_flags = 4;
        if (!getaddrinfo(-[NSString UTF8String](hostname, "UTF8String"), 0, &v17, &v16))
        {
          if (v16)
          {
            ai_addr = v16->ai_addr;
            freeaddrinfo(v16);
            if (ai_addr)
            {
              v17.ai_flags = 0;
              if (SCNetworkReachabilityGetFlags(self->_reachability, (SCNetworkReachabilityFlags *)&v17))
              {
                v13[0] = MEMORY[0x1E0C809B0];
                v13[1] = 3221225472;
                v13[2] = __45___ReachabilityRequest_addObserver_selector___block_invoke;
                v13[3] = &unk_1E2881928;
                v13[4] = self;
                ai_flags = v17.ai_flags;
                dispatch_async(MEMORY[0x1E0C80D38], v13);
              }
            }
          }
        }
        SCNetworkReachabilitySetCallback(self->_reachability, (SCNetworkReachabilityCallBack)_ReachabilityCallback, &context);
        reachability = self->_reachability;
        Main = CFRunLoopGetMain();
        SCNetworkReachabilityScheduleWithRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);
      }
    }
    -[NSLock unlock](self->_lock, "unlock");
  }
  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)removeObserver:(id)a3
{
  __CFDictionary *observers;
  __SCNetworkReachability *reachability;
  __CFRunLoop *Main;

  -[NSLock lock](self->_lock, "lock");
  observers = self->_observers;
  if (observers)
  {
    CFDictionaryRemoveValue(observers, a3);
    if (self->_reachability)
    {
      if (!CFDictionaryGetCount(self->_observers))
      {
        SCNetworkReachabilitySetCallback(self->_reachability, 0, 0);
        reachability = self->_reachability;
        Main = CFRunLoopGetMain();
        SCNetworkReachabilityUnscheduleFromRunLoop(reachability, Main, (CFStringRef)*MEMORY[0x1E0C9B270]);
        CFRelease(self->_reachability);
        self->_reachability = 0;
      }
    }
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)hasObservers
{
  __CFDictionary *observers;
  BOOL v4;

  -[NSLock lock](self->_lock, "lock");
  observers = self->_observers;
  if (observers)
    v4 = CFDictionaryGetCount(observers) > 0;
  else
    v4 = 0;
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (NSString)hostname
{
  return self->_hostname;
}

@end
