@implementation CUTReachability

- (void)dealloc
{
  __SCNetworkReachability *reachabilityRef;
  objc_super v4;

  reachabilityRef = self->reachabilityRef;
  if (reachabilityRef)
  {
    CFRelease(reachabilityRef);
    self->reachabilityRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUTReachability;
  -[CUTReachability dealloc](&v4, sel_dealloc);
}

+ (id)reachabilityWithHostName:(id)a3
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

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  sub_1A0BCBE2C(a3, (uint64_t)"localWiFiStatusForFlags");
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  int64_t v5;

  sub_1A0BCBE2C(a3, (uint64_t)"networkStatusForFlags");
  if ((a3 & 2) == 0)
    return 0;
  LODWORD(v5) = (a3 & 0x28) != 0;
  if ((a3 & 0x10) != 0)
    LODWORD(v5) = 0;
  if ((a3 & 4) != 0)
    v5 = v5;
  else
    v5 = 1;
  if ((a3 & 0x40000) != 0)
    return 2;
  else
    return v5;
}

- (BOOL)connectionRequired
{
  __SCNetworkReachability *reachabilityRef;
  void *v6;
  SCNetworkReachabilityFlags flags;

  reachabilityRef = self->reachabilityRef;
  if (!reachabilityRef)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTReachability.m"), 186, CFSTR("connectionRequired called with NULL reachabilityRef"));

    reachabilityRef = self->reachabilityRef;
  }
  flags = -1431655766;
  return SCNetworkReachabilityGetFlags(reachabilityRef, &flags) && (flags & 4) != 0;
}

- (int64_t)currentReachabilityStatus
{
  __SCNetworkReachability *reachabilityRef;
  void *v6;
  SCNetworkReachabilityFlags flags;

  reachabilityRef = self->reachabilityRef;
  if (!reachabilityRef)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUTReachability.m"), 194, CFSTR("currentNetworkStatus called with NULL reachabilityRef"));

    reachabilityRef = self->reachabilityRef;
  }
  flags = -1431655766;
  if (!SCNetworkReachabilityGetFlags(reachabilityRef, &flags))
    return 0;
  if (self->localWiFiRef)
    return -[CUTReachability localWiFiStatusForFlags:](self, "localWiFiStatusForFlags:", flags);
  return -[CUTReachability networkStatusForFlags:](self, "networkStatusForFlags:", flags);
}

@end
