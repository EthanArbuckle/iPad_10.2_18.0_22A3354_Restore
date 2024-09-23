@implementation AFContextManager

- (void)startCenter:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a3;
  v4 = (void *)MEMORY[0x1A1AC0A74]();
  objc_msgSend(v11, "runServerOnCurrentThreadProtectedByEntitlement:", CFSTR("com.apple.assistant.contextprovider"));
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99E88]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFireDate:interval:target:selector:userInfo:repeats:", v7, self, sel_nothing, 0, 0, 15.0);

  objc_msgSend(v5, "addTimer:forMode:", v8, *MEMORY[0x1E0C99748]);
  do
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 15.0);
    objc_msgSend(v5, "runUntilDate:", v9);
    v10 = objc_msgSend(v11, "doesServerExist");

  }
  while ((v10 & 1) != 0);
  objc_msgSend(v8, "invalidate");

  objc_autoreleasePoolPop(v4);
}

void __41__AFContextManager_defaultContextManager__block_invoke()
{
  AFContextManager *v0;
  void *v1;

  v0 = objc_alloc_init(AFContextManager);
  v1 = (void *)__defaultContextManager;
  __defaultContextManager = (uint64_t)v0;

}

- (AFContextManager)init
{
  AFContextManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AFContextManager;
  v2 = -[AFContextManager init](&v4, sel_init);
  if (v2)
    v2->_contextProviders = CFArrayCreateMutable(0, 0, 0);
  return v2;
}

- (BOOL)addContextProvider:(id)a3
{
  id v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  CFIndex v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __assert_rtn("-[AFContextManager addContextProvider:]", "AFContextManager.m", 197, "[NSThread isMainThread]");
  Count = CFArrayGetCount(self->_contextProviders);
  v6 = Count - 1;
  if (Count < 1)
  {
LABEL_7:
    CFArrayAppendValue(self->_contextProviders, v4);
    -[AFContextManager _startListening](self, "_startListening");
    v12 = 1;
  }
  else
  {
    v7 = Count;
    v8 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(self->_contextProviders, v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v4)
        break;
      if (v7 == ++v8)
      {
        CFArrayGetValueAtIndex(self->_contextProviders, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "allowContextProvider:", v4);

        if (v11)
          goto LABEL_7;
        break;
      }
    }
    v12 = 0;
  }

  return v12;
}

- (void)_startListening
{
  CPDistributedMessagingCenter *v3;
  CPDistributedMessagingCenter *center;
  id v5;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__shutdownServer, 0);
  if (!self->_center)
  {
    -[AFContextManager _serverName](self, "_serverName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFA990], "pidRestrictedCenterNamed:", v5);
    v3 = (CPDistributedMessagingCenter *)objc_claimAutoreleasedReturnValue();
    center = self->_center;
    self->_center = v3;

    -[CPDistributedMessagingCenter setTargetPID:](self->_center, "setTargetPID:", getpid());
    -[CPDistributedMessagingCenter registerForMessageName:target:selector:](self->_center, "registerForMessageName:target:selector:", CFSTR("CollateContexts"), self, sel__collateContexts);
    objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel_startCenter_, self, self->_center);

  }
}

- (id)_serverName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AFContextProviderNameForBundleId(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultContextManager
{
  if (defaultContextManager_onceToken != -1)
    dispatch_once(&defaultContextManager_onceToken, &__block_literal_global_5135);
  return (id)__defaultContextManager;
}

- (void)_collateContextsIntoArray:(id)a3
{
  id v4;
  NSObject *v5;
  CFIndex Count;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __assert_rtn("-[AFContextManager _collateContextsIntoArray:]", "AFContextManager.m", 77, "[NSThread isMainThread]");
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[AFContextManager _collateContextsIntoArray:]";
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }
  Count = CFArrayGetCount(self->_contextProviders);
  if (Count >= 1)
  {
    v7 = Count + 1;
    do
    {
      CFArrayGetValueAtIndex(self->_contextProviders, v7 - 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getCurrentContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D87F40], "dictionaryArrayWithAceObjectArray:", v9);
          v11 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v11;
        }
      }
      if (v9)
        objc_msgSend(v4, "addObject:", v9);

      --v7;
    }
    while (v7 > 1);
  }

}

- (id)_collateContexts
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFContextManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__collateContextsIntoArray_, v3, 1);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v3, CFSTR("Contexts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_shutdownServer
{
  CPDistributedMessagingCenter *center;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[CPDistributedMessagingCenter stopServer](self->_center, "stopServer");
  center = self->_center;
  self->_center = 0;

}

- (void)_stopListening
{
  if (self->_center)
    -[AFContextManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__shutdownServer, 0, 15.0);
}

- (void)removeContextProvider:(id)a3
{
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  id v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    __assert_rtn("-[AFContextManager removeContextProvider:]", "AFContextManager.m", 222, "[NSThread isMainThread]");
  Count = CFArrayGetCount(self->_contextProviders);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = 0;
    while (1)
    {
      CFArrayGetValueAtIndex(self->_contextProviders, v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
        break;

      if (v5 == ++v6)
        goto LABEL_8;
    }
    CFArrayRemoveValueAtIndex(self->_contextProviders, v6);

  }
LABEL_8:
  if (!CFArrayGetCount(self->_contextProviders))
    -[AFContextManager _stopListening](self, "_stopListening");

}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_contextProviders);
  v3.receiver = self;
  v3.super_class = (Class)AFContextManager;
  -[AFContextManager dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_center, 0);
}

@end
