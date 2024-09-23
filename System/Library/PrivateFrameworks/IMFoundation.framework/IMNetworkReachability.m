@implementation IMNetworkReachability

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
  v4.super_class = (Class)IMNetworkReachability;
  -[IMNetworkReachability dealloc](&v4, sel_dealloc);
}

+ (id)reachabilityWithHostName:(id)a3
{
  id v4;
  uint64_t (*v5)(_QWORD, uint64_t);
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  v4 = a3;
  if (qword_1EE1DDE50 != -1)
    dispatch_once(&qword_1EE1DDE50, &unk_1E2C42FC8);
  v5 = (uint64_t (*)(_QWORD, uint64_t))off_1EE1DDE48;
  v6 = objc_retainAutorelease(v4);
  v10 = objc_msgSend_UTF8String(v6, v7, v8, v9);
  v11 = v5(0, v10);
  if (v11)
  {
    v12 = v11;
    v13 = objc_alloc_init((Class)a1);
    v14 = v13;
    if (v13)
    {
      *((_QWORD *)v13 + 2) = v12;
      *((_BYTE *)v13 + 8) = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  _QWORD *v5;
  _QWORD *v6;

  if (qword_1EE1DD558 != -1)
    dispatch_once(&qword_1EE1DD558, &unk_1E2C43488);
  v5 = (_QWORD *)off_1EE1DD1D8(*MEMORY[0x1E0C9AE00], a3);
  if (v5)
  {
    v6 = v5;
    v5 = objc_alloc_init((Class)a1);
    if (v5)
    {
      v5[2] = v6;
      *((_BYTE *)v5 + 8) = 0;
    }
  }
  return v5;
}

+ (id)reachabilityForInternetConnection
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[1] = 0;
  v4[0] = 528;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v4, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)reachabilityForLocalWiFi
{
  uint64_t v2;
  _BYTE *v3;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[1] = 0;
  v5[0] = 0xFEA900000210;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v5, v2);
  v3 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v3[8] = 1;
  return v3;
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  sub_1906AC9B0(a3, (uint64_t)"localWiFiStatusForFlags");
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  int64_t v5;

  sub_1906AC9B0(a3, (uint64_t)"networkStatusForFlags");
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

- (int64_t)currentReachabilityStatus
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  unsigned int v11;

  if (!self->reachabilityRef)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("IMNetworkAvailability.m"), 195, CFSTR("currentNetworkStatus called with NULL reachabilityRef"));

  }
  if (qword_1EE1DD1E8 != -1)
    dispatch_once(&qword_1EE1DD1E8, &unk_1E2C46468);
  v11 = -1431655766;
  if (!off_1EE1DD1E0(self->reachabilityRef, &v11))
    return 0;
  if (self->localWiFiRef)
    return objc_msgSend_localWiFiStatusForFlags_(self, v5, v11, v6);
  return objc_msgSend_networkStatusForFlags_(self, v5, v11, v6);
}

@end
