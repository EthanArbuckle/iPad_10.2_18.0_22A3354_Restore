@implementation BDSReachability

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

- (int)currentReachabilityStatus
{
  int result;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  SCNetworkReachabilityFlags flags;

  flags = 0;
  result = SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags);
  if (result)
  {
    if (self->localWiFiRef)
      return objc_msgSend_localWiFiStatusForFlags_(self, v4, flags, v5, v6);
    else
      return objc_msgSend_networkStatusForFlags_(self, v4, flags, v5, v6);
  }
  return result;
}

+ (id)sharedReachabilityForInternetConnection
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D69B20;
  block[3] = &unk_24F08A610;
  block[4] = a1;
  if (qword_253F3C6A8 != -1)
    dispatch_once(&qword_253F3C6A8, block);
  return (id)qword_253F3C6B0;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  SCNetworkReachabilityRef v4;
  SCNetworkReachabilityRef v5;

  v4 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x24BDBD240], (const sockaddr *)a3);
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
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[1] = 0;
  v5[0] = 528;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v5, v2, v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)startNotifier
{
  int v3;
  __SCNetworkReachability *reachabilityRef;
  __CFRunLoop *Current;
  SCNetworkReachabilityContext v7;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v7.version = 0;
  memset(&v7.retain, 0, 24);
  v7.info = self;
  v3 = SCNetworkReachabilitySetCallback(self->reachabilityRef, (SCNetworkReachabilityCallBack)sub_227DAEE80, &v7);
  if (v3)
  {
    reachabilityRef = self->reachabilityRef;
    Current = CFRunLoopGetCurrent();
    LOBYTE(v3) = SCNetworkReachabilityScheduleWithRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x24BDBD5A0]) != 0;
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
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, (CFStringRef)*MEMORY[0x24BDBD5A0]);
  }
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __SCNetworkReachability *reachabilityRef;
  objc_super v7;

  objc_msgSend_stopNotifier(self, a2, v2, v3, v4);
  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
    CFRelease(reachabilityRef);
  v7.receiver = self;
  v7.super_class = (Class)BDSReachability;
  -[BDSReachability dealloc](&v7, sel_dealloc);
}

+ (id)reachabilityWithHostName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  SCNetworkReachabilityRef v10;
  SCNetworkReachabilityRef v11;

  v4 = objc_retainAutorelease(a3);
  v9 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7, v8);
  v10 = SCNetworkReachabilityCreateWithName(0, v9);
  if (v10)
  {
    v11 = v10;
    v10 = (SCNetworkReachabilityRef)objc_alloc_init((Class)a1);
    if (v10)
    {
      *((_QWORD *)v10 + 2) = v11;
      *((_BYTE *)v10 + 8) = 0;
    }
    else
    {
      CFRelease(v11);
      v10 = 0;
    }
  }
  return v10;
}

+ (id)reachabilityForLocalWiFi
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v6[1] = 0;
  v6[0] = 0xFEA900000210;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v6, v2, v3);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[8] = 1;
  return v4;
}

- (int)localWiFiStatusForFlags:(unsigned int)a3
{
  return (~a3 & 0x20002) == 0;
}

- (BOOL)connectionRequired
{
  SCNetworkReachabilityFlags flags;

  flags = 0;
  return SCNetworkReachabilityGetFlags(self->reachabilityRef, &flags) && (flags & 4) != 0;
}

+ (void)_updateIsOffline
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_sharedReachabilityForInternetConnection(BDSReachability, a2, v2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  byte_253F3B130 = objc_msgSend_currentReachabilityStatus(v9, v5, v6, v7, v8) == 0;

}

+ (BOOL)isOffline
{
  return byte_253F3B130;
}

@end
