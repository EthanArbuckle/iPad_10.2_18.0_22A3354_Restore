@implementation Reachability

+ (Reachability)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;

  v4 = SCNetworkReachabilityCreateWithName(0, (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  if (v4)
  {
    v5 = v4;
    v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((_QWORD *)v4 + 1) = v5;
    }
    else
    {
      CFRelease(v5);
      v4 = 0;
    }
  }
  return (Reachability *)v4;
}

+ (Reachability)reachabilityWithAddress:(const sockaddr *)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;

  v4 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, a3);
  if (v4)
  {
    v5 = v4;
    v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((_QWORD *)v4 + 1) = v5;
    }
    else
    {
      CFRelease(v5);
      v4 = 0;
    }
  }
  return (Reachability *)v4;
}

+ (id)reachabilityForInternetConnection
{
  _QWORD v3[2];

  v3[1] = 0;
  v3[0] = 528;
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "reachabilityWithAddress:", v3));
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
  v3 = SCNetworkReachabilitySetCallback(self->_reachabilityRef, (SCNetworkReachabilityCallBack)sub_100028738, &v7);
  if (v3)
  {
    reachabilityRef = self->_reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode) != 0;
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
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
  }
}

- (void)dealloc
{
  __SCNetworkReachability *reachabilityRef;
  objc_super v4;

  -[Reachability stopNotifier](self, "stopNotifier");
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v4.receiver = self;
  v4.super_class = (Class)Reachability;
  -[Reachability dealloc](&v4, "dealloc");
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
  SCNetworkReachabilityFlags flags;

  flags = 0;
  if (SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags))
    return -[Reachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
  else
    return 0;
}

@end
