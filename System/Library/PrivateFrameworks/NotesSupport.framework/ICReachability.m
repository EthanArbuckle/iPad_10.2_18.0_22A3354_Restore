@implementation ICReachability

+ (id)sharedReachabilityForInternetConnection
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)sharedReachabilityForInternetConnection_sharedReachability;
  if (!sharedReachabilityForInternetConnection_sharedReachability)
  {
    +[ICReachability reachabilityForInternetConnection](ICReachability, "reachabilityForInternetConnection");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sharedReachabilityForInternetConnection_sharedReachability;
    sharedReachabilityForInternetConnection_sharedReachability = v3;

    v2 = (void *)sharedReachabilityForInternetConnection_sharedReachability;
  }
  return v2;
}

+ (id)reachabilityForInternetConnection
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[1] = 0;
  v3[0] = 528;
  objc_msgSend(a1, "reachabilityWithAddress:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;
  _QWORD *v6;

  v4 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const sockaddr *)a3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc_init((Class)a1);
    if (v6)
    {
      v6[2] = CFRetain(v5);
      *((_BYTE *)v6 + 8) = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;
  _QWORD *v6;

  v4 = SCNetworkReachabilityCreateWithName(0, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  if (v4)
  {
    v5 = v4;
    v6 = objc_alloc_init((Class)a1);
    if (v6)
    {
      v6[2] = CFRetain(v5);
      *((_BYTE *)v6 + 8) = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)reachabilityForLocalWiFi
{
  _BYTE *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  objc_msgSend(a1, "reachabilityWithAddress:", v4);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v2[8] = 1;
  return v2;
}

- (BOOL)startNotifier
{
  int v3;
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;
  SCNetworkReachabilityContext v7;

  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  v3 = SCNetworkReachabilitySetCallback(self->_reachabilityRef, (SCNetworkReachabilityCallBack)ReachabilityCallback, &v7);
  if (v3)
  {
    reachabilityRef = self->_reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x1E0C9B280]) != 0;
  }
  return v3;
}

- (void)stopNotifier
{
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;

  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x1E0C9B280]);
  }
}

- (void)dealloc
{
  __SCNetworkReachability *reachabilityRef;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[ICReachability stopNotifier](self, "stopNotifier");
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v4.receiver = self;
  v4.super_class = (Class)ICReachability;
  -[ICReachability dealloc](&v4, sel_dealloc);
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  int64_t v4;

  if ((a3 & 2) == 0)
    return 0;
  LODWORD(v4) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0)
    LODWORD(v4) = 0;
  if ((a3 & 4) != 0)
    v4 = v4;
  else
    v4 = 1;
  if ((a3 & 0x40000) != 0)
    return 2;
  else
    return v4;
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  return SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int64_t)currentReachabilityStatus
{
  void *v3;
  void *v4;
  int64_t v5;
  SCNetworkReachabilityFlags flags;

  -[ICReachability overrideReachabilityStatus](self, "overrideReachabilityStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICReachability overrideReachabilityStatus](self, "overrideReachabilityStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (int)objc_msgSend(v4, "intValue");

  }
  else
  {
    flags = 0;
    if (SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags))
    {
      if (self->_alwaysReturnLocalWiFiStatus)
        return -[ICReachability localWiFiStatusForFlags:](self, "localWiFiStatusForFlags:", flags);
      else
        return -[ICReachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (NSNumber)overrideReachabilityStatus
{
  return self->_overrideReachabilityStatus;
}

- (void)setOverrideReachabilityStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideReachabilityStatus, 0);
}

@end
