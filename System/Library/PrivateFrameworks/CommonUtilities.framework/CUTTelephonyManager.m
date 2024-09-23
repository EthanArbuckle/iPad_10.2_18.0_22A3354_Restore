@implementation CUTTelephonyManager

+ (id)sharedInstance
{
  if (qword_1EE5CD708 != -1)
    dispatch_once(&qword_1EE5CD708, &unk_1E448FF98);
  if (qword_1EE5CD6F8 != -1)
    dispatch_once(&qword_1EE5CD6F8, &unk_1E44904C8);
  if (qword_1EE5CD700 != -1)
    dispatch_once(&qword_1EE5CD700, &unk_1E4490018);
  return (id)qword_1EE5CD710;
}

- (CUTTelephonyManager)init
{
  CUTTelephonyManager *v2;
  NSRecursiveLock *v3;
  NSRecursiveLock *lock;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUTTelephonyManager;
  v2 = -[CUTTelephonyManager init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    lock = v2->_lock;
    v2->_lock = v3;

    +[CUTWiFiManager sharedInstance](CUTWiFiManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addDelegate:", v2);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  -[NSMutableSet removeAllObjects](self->_disableFastDormancyTokens, "removeAllObjects");
  -[CUTTelephonyManager _adjustFastDormancyTokens](self, "_adjustFastDormancyTokens");
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  v3.receiver = self;
  v3.super_class = (Class)CUTTelephonyManager;
  -[CUTTelephonyManager dealloc](&v3, sel_dealloc);
}

- (void)_setFastDormancySuspended:(BOOL)a3
{
  _BOOL4 v3;
  __CTServerConnection *serverConnection;
  void *suspendDormancyAssertion;
  BOOL v7;
  __CFBundle *MainBundle;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  __CTServerConnection *v19;
  void *v20;
  uint8_t buf[4];
  _BYTE v22[10];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  serverConnection = self->_serverConnection;
  if (!serverConnection)
  {
    serverConnection = (__CTServerConnection *)_CTServerConnectionCreateWithIdentifier();
    self->_serverConnection = serverConnection;
  }
  suspendDormancyAssertion = self->_suspendDormancyAssertion;
  if (!v3)
  {
    if (!suspendDormancyAssertion)
      return;
    CFRelease(self->_suspendDormancyAssertion);
    self->_suspendDormancyAssertion = 0;
    +[CUTLog network](CUTLog, "network");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0BC3000, v9, OS_LOG_TYPE_DEFAULT, "Fast dormancy suspension removed", buf, 2u);
    }
    goto LABEL_21;
  }
  if (suspendDormancyAssertion)
    v7 = 1;
  else
    v7 = serverConnection == 0;
  if (!v7)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      CFBundleGetIdentifier(MainBundle);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.cuttelephonymanager"), v9);
    v11 = _CTServerConnectionDormancySuspendAssertionCreate();
    v12 = v11;
    v13 = HIDWORD(v11);
    +[CUTLog network](CUTLog, "network");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v13)
    {
      if (v15)
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v22 = v12;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = v13;
        v16 = "Could not suspend fast dormancy: (%i, %i).";
        v17 = v14;
        v18 = 14;
LABEL_19:
        _os_log_impl(&dword_1A0BC3000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else if (v15)
    {
      v20 = self->_suspendDormancyAssertion;
      v19 = self->_serverConnection;
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)v22 = v19;
      *(_WORD *)&v22[8] = 2112;
      v23 = v10;
      v24 = 2048;
      v25 = v20;
      v16 = "Fast dormancy suspended with ctServerConnection %p, name %@, assertion %p";
      v17 = v14;
      v18 = 32;
      goto LABEL_19;
    }

LABEL_21:
  }
}

- (void)__adjustFastDormancyTokens
{
  -[CUTTelephonyManager disableFastDormancy](self, "disableFastDormancy");
  MEMORY[0x1E0DE7D20](self, sel__setFastDormancySuspended_);
}

- (void)_adjustFastDormancyTokens
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[NSRecursiveLock lock](self->_lock, "lock");
  if ((byte_1EE5CD6F0 & 1) == 0)
  {
    byte_1EE5CD6F0 = 1;
    v3 = dispatch_time(0, 200000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1A0BCB90C;
    block[3] = &unk_1E44903C0;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E0C80D38], block);
  }
  -[NSRecursiveLock unlock](self->_lock, "unlock");
}

- (BOOL)disableFastDormancy
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_lock, "lock");
  v3 = -[NSMutableSet count](self->_disableFastDormancyTokens, "count") != 0;
  -[NSRecursiveLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)addFastDormancyDisableToken:(id)a3
{
  id v4;
  NSMutableSet *disableFastDormancyTokens;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSObject *v8;
  NSMutableSet *v9;
  int v10;
  id v11;
  __int16 v12;
  NSMutableSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSRecursiveLock lock](self->_lock, "lock");
    disableFastDormancyTokens = self->_disableFastDormancyTokens;
    if (!disableFastDormancyTokens)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = self->_disableFastDormancyTokens;
      self->_disableFastDormancyTokens = v6;

      disableFastDormancyTokens = self->_disableFastDormancyTokens;
    }
    -[NSMutableSet addObject:](disableFastDormancyTokens, "addObject:", v4);
    +[CUTLog network](CUTLog, "network");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_disableFastDormancyTokens;
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1A0BC3000, v8, OS_LOG_TYPE_DEFAULT, "Client token: %@ being added to fast dormancy clients (%@)", (uint8_t *)&v10, 0x16u);
    }

    -[NSRecursiveLock unlock](self->_lock, "unlock");
    -[CUTTelephonyManager _adjustFastDormancyTokens](self, "_adjustFastDormancyTokens");
  }

}

- (void)removeFastDormancyDisableToken:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableSet *disableFastDormancyTokens;
  int v7;
  id v8;
  __int16 v9;
  NSMutableSet *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    +[CUTLog network](CUTLog, "network");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      disableFastDormancyTokens = self->_disableFastDormancyTokens;
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = disableFastDormancyTokens;
      _os_log_impl(&dword_1A0BC3000, v5, OS_LOG_TYPE_DEFAULT, "Client token: %@ being removed from fast dormancy clients (%@)", (uint8_t *)&v7, 0x16u);
    }

    -[NSRecursiveLock lock](self->_lock, "lock");
    -[NSMutableSet removeObject:](self->_disableFastDormancyTokens, "removeObject:", v4);
    -[NSRecursiveLock unlock](self->_lock, "unlock");
    -[CUTTelephonyManager _adjustFastDormancyTokens](self, "_adjustFastDormancyTokens");
  }

}

- (NSRecursiveLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (NSMutableSet)disableFastDormancyTokens
{
  return self->_disableFastDormancyTokens;
}

- (void)setDisableFastDormancyTokens:(id)a3
{
  objc_storeStrong((id *)&self->_disableFastDormancyTokens, a3);
}

- (BOOL)registered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (void)_suspendDormancyAssertion
{
  return self->_suspendDormancyAssertion;
}

- (void)set_suspendDormancyAssertion:(void *)a3
{
  self->_suspendDormancyAssertion = a3;
}

- (__CTServerConnection)_serverConnection
{
  return self->_serverConnection;
}

- (void)set_serverConnection:(__CTServerConnection *)a3
{
  self->_serverConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableFastDormancyTokens, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
