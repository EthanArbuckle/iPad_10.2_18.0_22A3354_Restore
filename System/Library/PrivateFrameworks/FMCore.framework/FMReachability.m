@implementation FMReachability

- (BOOL)startNotifier
{
  int v3;
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;
  SCNetworkReachabilityContext v7;

  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  v3 = SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)FMReachabilityCallback, &v7);
  if (v3)
  {
    reachabilityRef = self->reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x1E0C9B280]) != 0;
  }
  return v3;
}

- (void)stopNotifier
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

  -[FMReachability stopNotifier](self, "stopNotifier");
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v4.receiver = self;
  v4.super_class = (Class)FMReachability;
  -[FMReachability dealloc](&v4, sel_dealloc);
}

+ (id)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;

  v4 = (SCNetworkReachabilityRef)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v4)
  {
    v4 = SCNetworkReachabilityCreateWithName(0, (const char *)v4);
    if (v4)
    {
      v5 = v4;
      v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
      if (v4)
      {
        *((_QWORD *)v4 + 2) = v5;
        *((_BYTE *)v4 + 8) = 0;
      }
      else
      {
        CFRelease(v5);
        v4 = 0;
      }
    }
  }
  return v4;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;

  v4 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const sockaddr *)a3);
  if (v4)
  {
    v5 = v4;
    v4 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v4)
    {
      *((_QWORD *)v4 + 2) = v5;
      *((_BYTE *)v4 + 8) = 0;
    }
    else
    {
      CFRelease(v5);
      v4 = 0;
    }
  }
  return v4;
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

- (unint64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (unint64_t)networkStatusForFlags:(unsigned int)a3
{
  unint64_t v4;

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
  return SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags) && (flags & 4) != 0;
}

- (unint64_t)currentReachabilityStatus
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  if (!SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags))
    return 0;
  if (self->localWiFiRef)
    return -[FMReachability localWiFiStatusForFlags:](self, "localWiFiStatusForFlags:", flags);
  return -[FMReachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
}

@end
