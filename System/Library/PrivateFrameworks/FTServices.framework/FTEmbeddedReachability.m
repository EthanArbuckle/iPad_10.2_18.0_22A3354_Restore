@implementation FTEmbeddedReachability

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
  v4.super_class = (Class)FTEmbeddedReachability;
  -[FTEmbeddedReachability dealloc](&v4, sel_dealloc);
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
  id v12;
  void *v13;

  v4 = a3;
  if (qword_1EE788B30 != -1)
    dispatch_once(&qword_1EE788B30, &unk_1E4DD9430);
  v5 = (uint64_t (*)(_QWORD, uint64_t))off_1EE788B28;
  v6 = objc_retainAutorelease(v4);
  v9 = objc_msgSend_UTF8String(v6, v7, v8);
  v10 = v5(0, v9);
  if (v10)
  {
    v11 = v10;
    v12 = objc_alloc_init((Class)a1);
    v13 = v12;
    if (v12)
    {
      *((_QWORD *)v12 + 2) = v11;
      *((_BYTE *)v12 + 8) = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)reachabilityWithAddress:(const sockaddr_in *)a3
{
  _QWORD *v5;
  _QWORD *v6;

  if (qword_1ECF9D748 != -1)
    dispatch_once(&qword_1ECF9D748, &unk_1E4DD9AA0);
  v5 = (_QWORD *)off_1ECF9D740(*MEMORY[0x1E0C9AE00], a3);
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
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[1] = 0;
  v3[0] = 528;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)reachabilityForLocalWiFi
{
  _BYTE *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[1] = 0;
  v4[0] = 0xFEA900000210;
  objc_msgSend_reachabilityWithAddress_(a1, a2, (uint64_t)v4);
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v2[8] = 1;
  return v2;
}

- (int64_t)localWiFiStatusForFlags:(unsigned int)a3
{
  sub_1A4C9429C(a3, (uint64_t)"localWiFiStatusForFlags");
  return (~a3 & 0x20002) == 0;
}

- (int64_t)networkStatusForFlags:(unsigned int)a3
{
  int64_t v5;

  sub_1A4C9429C(a3, (uint64_t)"networkStatusForFlags");
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
  uint64_t v2;
  void *v6;
  const char *v7;
  int v8;

  if (!self->reachabilityRef)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, CFSTR("FTEmbeddedReachability.m"), 190, CFSTR("connectionRequired called with NULL reachabilityRef"));

  }
  if (qword_1EE788B40 != -1)
    dispatch_once(&qword_1EE788B40, &unk_1E4DD9AC0);
  v8 = -1431655766;
  return off_1EE788B38(self->reachabilityRef, &v8) && (v8 & 4) != 0;
}

- (int64_t)currentReachabilityStatus
{
  uint64_t v2;
  const char *v4;
  void *v7;
  const char *v8;
  unsigned int v9;

  if (!self->reachabilityRef)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, CFSTR("FTEmbeddedReachability.m"), 199, CFSTR("currentNetworkStatus called with NULL reachabilityRef"));

  }
  if (qword_1ECF9D758 != -1)
    dispatch_once(&qword_1ECF9D758, &unk_1E4DD9510);
  v9 = -1431655766;
  if (!off_1ECF9D750(self->reachabilityRef, &v9))
    return 0;
  if (self->localWiFiRef)
    return objc_msgSend_localWiFiStatusForFlags_(self, v4, v9);
  return objc_msgSend_networkStatusForFlags_(self, v4, v9);
}

@end
