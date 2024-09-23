@implementation CLSReachability

- (CLSReachability)initWithNetworkReachability:(__SCNetworkReachability *)a3
{
  CLSReachability *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSReachability;
  v4 = -[CLSReachability init](&v6, sel_init);
  if (v4)
  {
    if (a3)
      v4->_reachabilityRef = (__SCNetworkReachability *)CFRetain(a3);
    v4->_localWiFiRef = 0;
  }
  return v4;
}

- (void)dealloc
{
  __SCNetworkReachability *reachabilityRef;
  objc_super v4;

  -[CLSReachability stopNotifier](self, "stopNotifier");
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    CFRelease(reachabilityRef);
    self->_reachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CLSReachability;
  -[CLSReachability dealloc](&v4, sel_dealloc);
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
  v3 = SCNetworkReachabilitySetCallback(self->_reachabilityRef, (SCNetworkReachabilityCallBack)_CLSReachabilityCallback, &v7);
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

- (int64_t)_localWiFiStatusForFlags:(unsigned int)a3
{
  return 2 * ((~a3 & 0x20002) == 0);
}

- (int64_t)_networkStatusForFlags:(unsigned int)a3
{
  int64_t v3;

  v3 = 2;
  if ((a3 & 0x10) != 0 || (a3 & 0x28) == 0)
    v3 = ~(a3 >> 1) & 2;
  if ((a3 & 0x40000) != 0)
    v3 = 1;
  if ((a3 & 2) != 0)
    return v3;
  else
    return 0;
}

- (int64_t)currentNetworkStatus
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  if (!SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags))
    return 0;
  if (self->_localWiFiRef)
    return -[CLSReachability _localWiFiStatusForFlags:](self, "_localWiFiStatusForFlags:", flags);
  return -[CLSReachability _networkStatusForFlags:](self, "_networkStatusForFlags:", flags);
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  return SCNetworkReachabilityGetFlags(self->_reachabilityRef, &flags) && (flags & 4) != 0;
}

+ (id)reachabilityWithHostName:(id)a3
{
  SCNetworkReachabilityRef v3;
  SCNetworkReachabilityRef v4;
  CLSReachability *v5;

  v3 = SCNetworkReachabilityCreateWithName(0, (const char *)objc_msgSend(a3, "UTF8String"));
  if (v3)
  {
    v4 = v3;
    v5 = -[CLSReachability initWithNetworkReachability:]([CLSReachability alloc], "initWithNetworkReachability:", v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v3;
  SCNetworkReachabilityRef v4;
  CLSReachability *v5;

  v3 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const sockaddr *)a3);
  if (v3)
  {
    v4 = v3;
    v5 = -[CLSReachability initWithNetworkReachability:]([CLSReachability alloc], "initWithNetworkReachability:", v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)reachabilityForInternetConnection
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[1] = 0;
  v3[0] = 528;
  return +[CLSReachability reachabilityWithAddress:](CLSReachability, "reachabilityWithAddress:", v3);
}

+ (id)reachabilityForLocalWiFi
{
  id result;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[1] = 0;
  v3[0] = 0xFEA900000210;
  result = +[CLSReachability reachabilityWithAddress:](CLSReachability, "reachabilityWithAddress:", v3);
  if (result)
    *((_BYTE *)result + 16) = 1;
  return result;
}

@end
