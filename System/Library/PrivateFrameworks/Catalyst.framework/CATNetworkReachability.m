@implementation CATNetworkReachability

+ (id)keyPathsForValuesAffectingReachable
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("flags"));
}

- (BOOL)isReachable
{
  void *v3;
  int v4;
  uint64_t v5;

  -[CATNetworkReachability address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocalWiFi");

  v5 = -[CATNetworkReachability flags](self, "flags");
  if (v4)
    return +[CATNetworkReachability isReachableForLocalWiFiWithFlags:](CATNetworkReachability, "isReachableForLocalWiFiWithFlags:", v5);
  else
    return +[CATNetworkReachability isReachableForNetworkWithFlags:](CATNetworkReachability, "isReachableForNetworkWithFlags:", v5);
}

+ (id)reachabilityWithAddress:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAddress:", v4);

  return v5;
}

+ (id)reachabilityForInternetConnection
{
  void *v3;
  void *v4;

  +[CATAddress any](CATAddress, "any");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reachabilityWithAddress:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)reachabilityForLocalWiFi
{
  void *v3;
  void *v4;

  +[CATAddress localWiFi](CATAddress, "localWiFi");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "reachabilityWithAddress:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CATNetworkReachability)initWithAddress:(id)a3
{
  id v6;
  CATNetworkReachability *v7;
  CATNetworkReachability *v8;
  id v9;
  void *v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATNetworkReachability.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("address"));

  }
  v7 = -[CATNetworkReachability init](self, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_address, a3);
    objc_msgSend(v6, "data");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8->mReachabilityRef = SCNetworkReachabilityCreateWithAddress(0, (const sockaddr *)objc_msgSend(v9, "bytes"));

    -[CATNetworkReachability configureCallback](v8, "configureCallback");
  }

  return v8;
}

- (void)dealloc
{
  __SCNetworkReachability *mReachabilityRef;
  objc_super v4;

  mReachabilityRef = self->mReachabilityRef;
  if (mReachabilityRef)
  {
    CFRelease(mReachabilityRef);
    self->mReachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CATNetworkReachability;
  -[CATNetworkReachability dealloc](&v4, sel_dealloc);
}

- (id)debugDescription
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = -[CATNetworkReachability flags](self, "flags");
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  v6 = -[CATNetworkReachability isReachable](self, "isReachable");
  v7 = CFSTR("unreachable");
  if (v6)
    v7 = CFSTR("reachable");
  v8 = 100;
  if ((v3 & 0x20000) == 0)
    v8 = 45;
  v22 = v8;
  v9 = 108;
  if ((v3 & 0x10000) == 0)
    v9 = 45;
  v10 = 68;
  if ((v3 & 0x20) == 0)
    v10 = 45;
  v20 = v10;
  v21 = v9;
  v11 = 105;
  if ((v3 & 0x10) == 0)
    v11 = 45;
  v12 = 67;
  if ((v3 & 8) == 0)
    v12 = 45;
  v18 = v12;
  v19 = v11;
  v13 = 99;
  if ((v3 & 4) == 0)
    v13 = 45;
  v14 = 116;
  if ((v3 & 1) == 0)
    v14 = 45;
  v17 = v13;
  v15 = 82;
  if ((v3 & 2) == 0)
    v15 = 45;
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p { %@, flags = '%c %c%c%c%c%c%c%c' }>"), v5, self, v7, v15, v14, v17, v18, v19, v20, v21, v22);
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  __SCNetworkReachability *mReachabilityRef;
  __CFString *v7;
  SCNetworkReachabilityFlags flags;

  mReachabilityRef = self->mReachabilityRef;
  v7 = (__CFString *)a4;
  SCNetworkReachabilityScheduleWithRunLoop(mReachabilityRef, (CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), v7);

  flags = 0;
  if (SCNetworkReachabilityGetFlags(self->mReachabilityRef, &flags))
    -[CATNetworkReachability reachabilityDidChangeWithFlags:](self, "reachabilityDidChangeWithFlags:", flags);
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  __SCNetworkReachability *mReachabilityRef;
  __CFString *runLoopMode;

  mReachabilityRef = self->mReachabilityRef;
  runLoopMode = (__CFString *)a4;
  SCNetworkReachabilityUnscheduleFromRunLoop(mReachabilityRef, (CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), runLoopMode);

}

- (void)reachabilityDidChangeWithFlags:(unsigned int)a3
{
  uint64_t v3;
  _BOOL4 v5;

  v3 = *(_QWORD *)&a3;
  if (-[CATNetworkReachability flags](self, "flags") != a3)
  {
    v5 = -[CATNetworkReachability isReachable](self, "isReachable");
    -[CATNetworkReachability setFlags:](self, "setFlags:", v3);
    if (v5 != -[CATNetworkReachability isReachable](self, "isReachable"))
      -[CATNetworkReachability delegateDidChange](self, "delegateDidChange");
  }
}

- (void)delegateDidChange
{
  void *v3;
  char v4;
  id v5;

  -[CATNetworkReachability delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CATNetworkReachability delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reachabilityDidChange:", self);

  }
}

- (void)configureCallback
{
  SCNetworkReachabilityContext context;

  context.version = 0;
  context.info = self;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x24BDBC2A8];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x24BDBC298];
  context.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x24BDBBC58];
  SCNetworkReachabilitySetCallback(self->mReachabilityRef, (SCNetworkReachabilityCallBack)__REACHABILITY_CALLBACK__, &context);
}

+ (BOOL)isReachableForLocalWiFiWithFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

+ (BOOL)isReachableForNetworkWithFlags:(unsigned int)a3
{
  BOOL v3;
  BOOL v4;

  v3 = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0)
    v3 = 0;
  v4 = (a3 & 4) == 0 || v3;
  return (a3 & 2) != 0 && v4;
}

- (CATAddress)address
{
  return self->_address;
}

- (CATNetworkReachabilityDelegate)delegate
{
  return (CATNetworkReachabilityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
