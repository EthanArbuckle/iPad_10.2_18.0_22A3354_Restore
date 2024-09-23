@implementation GKReachability

- (BOOL)_gkStartNotifier
{
  int v3;
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;
  SCNetworkReachabilityContext v7;

  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  v3 = SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)ReachabilityCallback, &v7);
  if (v3)
  {
    reachabilityRef = self->reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x1E0C9B280]) != 0;
  }
  return v3;
}

- (void)_gkStopNotifier
{
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;

  reachabilityRef = self->reachabilityRef;
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

  -[GKReachability _gkStopNotifier](self, "_gkStopNotifier");
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v4.receiver = self;
  v4.super_class = (Class)GKReachability;
  -[GKReachability dealloc](&v4, sel_dealloc);
}

+ (id)_gkReachabilityWithAddress:(const sockaddr_in *)a3
{
  id result;
  id v5;

  result = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const sockaddr *)a3);
  if (result)
  {
    v5 = result;
    result = objc_alloc_init((Class)a1);
    if (result)
    {
      *((_QWORD *)result + 2) = v5;
      *((_BYTE *)result + 8) = 0;
    }
  }
  return result;
}

+ (id)_gkReachabilityForInternetConnection
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[1] = 0;
  v3[0] = 528;
  return (id)objc_msgSend(a1, "_gkReachabilityWithAddress:", v3);
}

- (int)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (int)networkStatusForFlags:(unsigned int)a3
{
  int v3;

  v3 = ((a3 >> 2) & 1) == 0;
  if ((a3 & 0x10) == 0 && (a3 & 0x28) != 0)
    v3 = 1;
  if ((a3 & 0x40000) != 0)
    v3 = 2;
  if ((a3 & 2) != 0)
    return v3;
  else
    return 0;
}

- (int)_gkCurrentReachabilityStatus
{
  int result;
  SCNetworkReachabilityFlags flags;

  flags = 0;
  result = SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags);
  if (result)
  {
    if (self->localWiFiRef)
      return -[GKReachability localWiFiStatusForFlags:](self, "localWiFiStatusForFlags:", flags);
    else
      return -[GKReachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
  }
  return result;
}

+ (BOOL)_gkIsOnline
{
  return objc_msgSend(+[GKReachability _gkReachabilityForInternetConnection](GKReachability, "_gkReachabilityForInternetConnection"), "_gkCurrentReachabilityStatus") != 0;
}

@end
