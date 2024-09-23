@implementation FigHTTPRequestSessionDataDelegate

- (FigHTTPRequestSessionDataDelegate)initWithResponseDispositionOption:(BOOL)a3
{
  FigHTTPRequestSessionDataDelegate *v4;
  NSMutableDictionary *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigHTTPRequestSessionDataDelegate;
  v4 = -[FigHTTPRequestSessionDataDelegate init](&v7, sel_init);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4->_taskToFigHTTPRequest = v5;
    if (v5
      && (v4->_taskToFigHTTPRequestMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate(),
          v4->_taskToFigHTTPRequest))
    {
      v4->_doesIgnoreDidReceiveResponseDisposition = a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (FigHTTPRequestSessionDataDelegate)init
{
  return -[FigHTTPRequestSessionDataDelegate initWithResponseDispositionOption:](self, "initWithResponseDispositionOption:", 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_taskToFigHTTPRequestMutex)
    FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigHTTPRequestSessionDataDelegate;
  -[FigHTTPRequestSessionDataDelegate dealloc](&v3, sel_dealloc);
}

- (void)_registerFigHTTPRequest:(OpaqueFigHTTPRequest *)a3 forDataTask:(id)a4
{
  _QWORD *DerivedStorage;

  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  MEMORY[0x19402EA0C](self->_taskToFigHTTPRequestMutex);
  -[NSMutableDictionary setObject:forKey:](self->_taskToFigHTTPRequest, "setObject:forKey:", *DerivedStorage, a4);
  JUMPOUT(0x19402EA24);
}

- (void)_deregisterFigHTTPRequestForDataTask:(id)a3
{
  MEMORY[0x19402EA0C](self->_taskToFigHTTPRequestMutex, a2);
  -[NSMutableDictionary removeObjectForKey:](self->_taskToFigHTTPRequest, "removeObjectForKey:", a3);
  JUMPOUT(0x19402EA24);
}

- (id)adoptVoucherFromRetainProxy:(FigRetainProxy *)a3
{
  id v3;

  FigRetainProxyGetOwner();
  v3 = *(id *)(CMBaseObjectGetDerivedStorage() + 560);
  return (id)voucher_adopt();
}

- (void)restoreVoucher:(id)a3
{
  if (a3)

}

- (FigRetainProxy)_copyAndLockRequestForTask:(id)a3
{
  FigRetainProxy *v5;

  MEMORY[0x19402EA0C](self->_taskToFigHTTPRequestMutex, a2);
  v5 = (FigRetainProxy *)-[NSMutableDictionary objectForKey:](self->_taskToFigHTTPRequest, "objectForKey:", a3);
  if (v5)
  {
    FigRetainProxyRetain();
    MEMORY[0x19402EA24](self->_taskToFigHTTPRequestMutex);
    FigRetainProxyLockMutex();
    if (FigRetainProxyIsInvalidated())
    {
      FigRetainProxyUnlockMutex();
      FigRetainProxyRelease();
      return 0;
    }
  }
  else
  {
    MEMORY[0x19402EA24](self->_taskToFigHTTPRequestMutex);
  }
  return v5;
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  void *v7;
  const void *ValueAtIndex;
  const void *v9;
  CFTypeID v10;
  const __CFAllocator *v11;
  CFIndex Count;
  __CFArray *MutableCopy;
  __CFArray *v14;
  int v15;
  id v16;
  CFArrayRef theArray;

  v7 = (void *)MEMORY[0x19403137C](self, a2, a3);
  if (!objc_msgSend(a4, "previousFailureCount"))
  {
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
    goto LABEL_17;
  }
  if (objc_msgSend(a4, "previousFailureCount") != 1
    || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "authenticationMethod"), "isEqual:", *MEMORY[0x1E0C92B30]) & 1) != 0)
  {
    goto LABEL_15;
  }
  theArray = 0;
  if (FigCFHTTPCopyClientCertChain((uint64_t *)&theArray))
    goto LABEL_18;
  if (!theArray)
  {
LABEL_15:
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 2, 0);
    goto LABEL_17;
  }
  ValueAtIndex = CFArrayGetValueAtIndex(theArray, 0);
  if (ValueAtIndex
    && (v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 == SecIdentityGetTypeID())
    && (v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
        Count = CFArrayGetCount(theArray),
        (MutableCopy = CFArrayCreateMutableCopy(v11, Count, theArray)) != 0))
  {
    v14 = MutableCopy;
    CFArrayRemoveValueAtIndex(MutableCopy, 0);
    v15 = 1;
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C60]), "initWithIdentity:certificates:persistence:", v9, v14, 1);
    if (v16)
    {
      (*((void (**)(id, _QWORD, id))a5 + 2))(a5, 0, v16);
      v15 = 0;
    }
    CFRelease(v14);
  }
  else
  {
LABEL_18:
    v15 = 1;
  }
  if (theArray)
    CFRelease(theArray);
  if (v15)
    goto LABEL_15;
LABEL_17:
  objc_autoreleasePoolPop(v7);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  void *v10;
  FigRetainProxy *v11;
  id v12;
  uint64_t DerivedStorage;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, _QWORD, uint64_t, uint64_t, void (*)(), uint64_t);
  const void *v18;

  v10 = (void *)MEMORY[0x19403137C](self, a2, a3);
  v11 = -[FigHTTPRequestSessionDataDelegate _copyAndLockRequestForTask:](self, "_copyAndLockRequestForTask:", a4);
  if (!v11)
  {
    (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 2, 0);
    goto LABEL_18;
  }
  v12 = -[FigHTTPRequestSessionDataDelegate adoptVoucherFromRetainProxy:](self, "adoptVoucherFromRetainProxy:", v11);
  FigRetainProxyGetOwner();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!FigRetainProxyIsInvalidated() && !*(_BYTE *)(DerivedStorage + 172))
  {
    if (!objc_msgSend(a5, "previousFailureCount") && objc_msgSend(a5, "proposedCredential"))
    {
      (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 1, 0);
      goto LABEL_17;
    }
    if (a5)
    {
      if (*(_QWORD *)(DerivedStorage + 464))
      {
        if (!FigCustomURLRequestInfoCreateMutable()
          && !FigCustomURLRequestInfoSetNSURLAuthenticationChallenge())
        {
          v14 = *(_QWORD *)(DerivedStorage + 464);
          v15 = *(_QWORD *)DerivedStorage;
          v16 = *(_QWORD *)(DerivedStorage + 64);
          v17 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t, uint64_t, void (*)(), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
          if (v17)
          {
            if (!v17(v14, 0, v15, v16, figHTTPCustomURLLoaderCredentialCallback, DerivedStorage + 480))
            {
              v18 = *(const void **)(DerivedStorage + 472);
              if (v18)
              {
                _Block_release(v18);
                *(_QWORD *)(DerivedStorage + 472) = 0;
              }
              *(_QWORD *)(DerivedStorage + 472) = _Block_copy(a6);
              goto LABEL_17;
            }
          }
        }
      }
    }
  }
  (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 2, 0);
LABEL_17:
  -[FigHTTPRequestSessionDataDelegate restoreVoucher:](self, "restoreVoucher:", v12);
  FigRetainProxyUnlockMutex();
  FigRetainProxyRelease();
LABEL_18:
  objc_autoreleasePoolPop(v10);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  FigRetainProxy *v7;
  id v8;
  uint64_t Owner;
  uint64_t DerivedStorage;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  OpaqueCMBlockBuffer *v25;
  unsigned int OutputBuffer;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const void *v34;
  unsigned int v35;
  _BYTE *v36;
  _BYTE *v37;
  OSStatus v38;
  char blockBufferOut;
  char *dataPointerOut;
  size_t lengthAtOffsetOut;

  v7 = -[FigHTTPRequestSessionDataDelegate _copyAndLockRequestForTask:](self, "_copyAndLockRequestForTask:", a4);
  if (v7)
  {
    v8 = -[FigHTTPRequestSessionDataDelegate adoptVoucherFromRetainProxy:](self, "adoptVoucherFromRetainProxy:", v7);
    Owner = FigRetainProxyGetOwner();
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (!*(_DWORD *)(DerivedStorage + 552))
    {
      if (a5)
      {
        v11 = (void *)objc_msgSend(a5, "domain");
        if (objc_msgSend(v11, "compare:", *MEMORY[0x1E0CB32E8]) || objc_msgSend(a5, "code") != -999)
          v12 = 3;
        else
          v12 = 4;
      }
      else
      {
        v12 = 2;
      }
      *(_DWORD *)(DerivedStorage + 552) = v12;
    }
    if (*(_BYTE *)(DerivedStorage + 172))
      goto LABEL_46;
    *(_QWORD *)(DerivedStorage + 224) = FigGetUpTimeNanoseconds();
    v13 = (void *)MEMORY[0x19403137C]();
    *(_QWORD *)(DerivedStorage + 512) = a5;
    v14 = *(_QWORD *)DerivedStorage;
    v15 = CMBaseObjectGetDerivedStorage();
    if (*(_BYTE *)(v15 + 172))
      goto LABEL_43;
    v16 = v15;
    v17 = *(void **)(v15 + 512);
    if (v17)
    {
      v18 = objc_msgSend(v17, "domain");
      objc_msgSend(*(id *)(v16 + 512), "code");
      _figHTTPRequestCreateErrorComment(v16, v19, CFSTR("Network error: domain=%@, code=%d, %@ for %@"), v20, v21, v22, v23, v24, v18);
      objc_msgSend(*(id *)(v16 + 512), "code");
      OutputBuffer = FigSignalErrorAt();
      if (!OutputBuffer)
        goto LABEL_37;
LABEL_30:
      v34 = (const void *)Owner;
      v35 = OutputBuffer;
      goto LABEL_41;
    }
    if (!*(_BYTE *)(v16 + 169))
    {
LABEL_37:
      if (*(_QWORD *)(v16 + 384) && *(_QWORD *)(v16 + 392) < *(_QWORD *)(v16 + 400))
      {
        figHttpRequestSendOutputBlockBuffer(v14, 2u);
LABEL_42:
        FigRetainProxyIsInvalidated();
        goto LABEL_43;
      }
      v34 = (const void *)Owner;
      v35 = 0;
LABEL_41:
      figHTTPRequestPerformReadCallback(v34, 0, 0, 0, 2u, v35);
      goto LABEL_42;
    }
    v25 = *(OpaqueCMBlockBuffer **)(v16 + 384);
    if (v25)
    {
      if (*(_QWORD *)(v16 + 408))
      {
        dataPointerOut = 0;
        lengthAtOffsetOut = 0;
        if (!CMBlockBufferGetDataPointer(v25, *(_QWORD *)(v16 + 400), &lengthAtOffsetOut, 0, &dataPointerOut)
          && lengthAtOffsetOut)
        {
          OutputBuffer = 0;
          v27 = dataPointerOut;
LABEL_28:
          *v27 = 0;
          *(int64x2_t *)(v16 + 400) = vaddq_s64(*(int64x2_t *)(v16 + 400), (int64x2_t)xmmword_1932FC680);
          goto LABEL_29;
        }
        goto LABEL_35;
      }
      lengthAtOffsetOut = 0;
      figHttpRequestSendOutputBlockBuffer(v14, 0);
      if (FigRetainProxyIsInvalidated())
      {
LABEL_43:
        if (!FigRetainProxyIsInvalidated())
          figHttpRequestCloseNSURLSessionTask();
        objc_autoreleasePoolPop(v13);
LABEL_46:
        -[FigHTTPRequestSessionDataDelegate restoreVoucher:](self, "restoreVoucher:", v8);
        FigRetainProxyUnlockMutex();
        FigRetainProxyRelease();
        return;
      }
    }
    else
    {
      lengthAtOffsetOut = 0;
    }
    if (!*(_QWORD *)(v16 + 16))
    {
      v36 = CFAllocatorAllocate(*(CFAllocatorRef *)(v16 + 160), 1, 0);
      if (v36)
      {
        v37 = v36;
        v38 = CMBlockBufferCreateWithMemoryBlock(*(CFAllocatorRef *)(v16 + 160), v36, 1uLL, *(CFAllocatorRef *)(v16 + 160), 0, 0, 1uLL, 0, (CMBlockBufferRef *)(v16 + 384));
        if (*(_QWORD *)(v16 + 384))
        {
          OutputBuffer = v38;
          *v37 = 0;
          *(_OWORD *)(v16 + 400) = xmmword_1932FC690;
          *(_QWORD *)(v16 + 392) = 0;
LABEL_29:
          *(_BYTE *)(v16 + 169) = 0;
          if (OutputBuffer)
            goto LABEL_30;
          goto LABEL_37;
        }
        CFAllocatorDeallocate(*(CFAllocatorRef *)(v16 + 160), v37);
      }
LABEL_35:
      OutputBuffer = FigSignalErrorAt();
      goto LABEL_36;
    }
    OutputBuffer = figHTTPRequestGetOutputBuffer(Owner, (char **)&lengthAtOffsetOut, (size_t *)&dataPointerOut);
    if (!FigRetainProxyIsInvalidated())
    {
      if (!OutputBuffer)
      {
        v27 = (_BYTE *)lengthAtOffsetOut;
        goto LABEL_28;
      }
LABEL_36:
      _figHTTPRequestCreateErrorComment(v16, v28, CFSTR("Memory error"), v29, v30, v31, v32, v33, blockBufferOut);
      if (OutputBuffer)
        goto LABEL_30;
      goto LABEL_37;
    }
    goto LABEL_43;
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  void *v10;
  FigRetainProxy *v11;
  uint64_t DerivedStorage;
  uint64_t v13;
  void *v14;
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  const __CFAllocator *v22;
  unsigned int (*v23)(const void *, __CFString *, const __CFAllocator *, CFTypeRef *);
  uint64_t IsCellular;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  CFHTTPMessageRef Response;
  CFHTTPMessageRef v42;
  const __CFDictionary *v43;
  const void *v44;
  const void *v45;
  CFTypeRef v46;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  CFTypeRef v56;
  double v57;
  int64_t v58;
  unsigned int Callback;
  unsigned int v60;
  unsigned int v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CFTypeRef v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  CFTypeRef v82;
  uint64_t v83;
  uint64_t v84;
  CFTypeRef v85;
  double v86;
  id v87;
  const void *Owner;
  os_log_type_t type;
  double v90;
  CFTypeRef v91;
  int v92;
  double v93;
  CFTypeRef cf[18];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v92 = 0;
  v91 = 0;
  v10 = (void *)MEMORY[0x19403137C](self, a2, a3);
  v11 = -[FigHTTPRequestSessionDataDelegate _copyAndLockRequestForTask:](self, "_copyAndLockRequestForTask:", a4);
  if (!v11)
  {
    v92 = -12420;
    goto LABEL_78;
  }
  v87 = -[FigHTTPRequestSessionDataDelegate adoptVoucherFromRetainProxy:](self, "adoptVoucherFromRetainProxy:", v11);
  Owner = (const void *)FigRetainProxyGetOwner();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 172))
  {
    v92 = -12420;
    v62 = v87;
    goto LABEL_77;
  }
  v13 = DerivedStorage;
  *(_QWORD *)(DerivedStorage + 216) = FigGetUpTimeNanoseconds();
  v14 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "_incompleteTaskMetrics"), "transactionMetrics"), "lastObject");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = objc_msgSend(v14, "_usesMultipath");
  else
    v15 = 0;
  *(_BYTE *)(v13 + 536) = v15;
  *(_BYTE *)(v13 + 537) = objc_msgSend(v14, "isExpensive");
  objc_msgSend((id)objc_msgSend(v14, "domainLookupEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "domainLookupStartDate"));
  *(_QWORD *)(v13 + 264) = (uint64_t)(v16 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "secureConnectionEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "secureConnectionStartDate"));
  *(_QWORD *)(v13 + 272) = (uint64_t)(v17 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "connectEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "connectStartDate"));
  *(_QWORD *)(v13 + 280) = (uint64_t)(v18 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "connectEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "fetchStartDate"));
  *(_QWORD *)(v13 + 288) = (uint64_t)(v19 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "requestEndDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "requestStartDate"));
  *(_QWORD *)(v13 + 296) = (uint64_t)(v20 * 1000000000.0);
  objc_msgSend((id)objc_msgSend(v14, "requestStartDate"), "timeIntervalSinceDate:", objc_msgSend(v14, "fetchStartDate"));
  *(_QWORD *)(v13 + 312) = (uint64_t)-((double)(uint64_t)(*(_QWORD *)(v13 + 264) + *(_QWORD *)(v13 + 280))
                                    - v21 * 1000000000.0);
  *(_BYTE *)(v13 + 320) = objc_msgSend(v14, "isReusedConnection");
  cf[0] = 0;
  v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v23 = *(unsigned int (**)(const void *, __CFString *, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v23 && !v23(Owner, CFSTR("FHRP_CFNetworkTimingData"), v22, cf))
  {
    v93 = 0.0;
    v90 = 0.0;
    if (!FigCFDictionaryGetDoubleIfPresent()
      && !FigCFDictionaryGetDoubleIfPresent()
      && !FigCFDictionaryGetDoubleIfPresent())
    {
      FigCFDictionaryGetDoubleIfPresent();
    }
    if (v93 > 0.0)
      *(_QWORD *)(v13 + 208) = *(_QWORD *)(v13 + 192) + (uint64_t)((v93 - *(double *)(v13 + 184)) * 1000000000.0);
    FigCFDictionaryGetDoubleIfPresent();
    if (v90 > 0.0)
      *(_QWORD *)(v13 + 216) = *(_QWORD *)(v13 + 192) + (uint64_t)((v90 - *(double *)(v13 + 184)) * 1000000000.0);
    CFRelease(cf[0]);
  }
  if (!*(_QWORD *)(v13 + 208))
    *(_QWORD *)(v13 + 208) = *(_QWORD *)(v13 + 200);
  objc_msgSend(a5, "_CFURLResponse");
  IsCellular = CFURLResponseConnectionIsCellular();
  *(_BYTE *)(v13 + 376) = IsCellular;
  if ((_DWORD)IsCellular)
  {
    objc_msgSend(a5, "_CFURLResponse");
    IsCellular = CFURLResponseConnectionDidFallback();
    *(_BYTE *)(v13 + 377) = IsCellular;
  }
  *(_BYTE *)(v13 + 457) = 1;
  FigBytePumpGetFigBaseObject(IsCellular);
  if (*(_QWORD *)(v13 + 488) && !*(_BYTE *)(v13 + 173))
  {
    if (*(_BYTE *)(v13 + 176))
    {
      figHTTPSetIsDormant((uint64_t)Owner, 0);
    }
    else if (!*(_BYTE *)(v13 + 177))
    {
      *(_BYTE *)(v13 + 177) = 1;
      if (!*(_QWORD *)(v13 + 496))
        FigNetworkHistoryRequestBecameActive();
      FigNetworkHistorySetRequestSentTimestamp();
      FigNetworkHistorySetRequestLatency();
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "URL"), "scheme"), "caseInsensitiveCompare:", CFSTR("data"))|| !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "URL"), "scheme"), "caseInsensitiveCompare:", CFSTR("file")))
    {
      *(_QWORD *)(v13 + 144) = objc_alloc_init(MEMORY[0x1E0C99D80]);
      *(_QWORD *)(v13 + 416) = objc_msgSend(a5, "expectedContentLength");
      v32 = 200;
      goto LABEL_36;
    }
    v33 = objc_opt_class();
    v84 = objc_msgSend((id)objc_msgSend(a5, "URL"), "scheme");
    _figHTTPRequestCreateErrorComment(v13, v34, CFSTR("Received response of type %@ for scheme %@"), v35, v36, v37, v38, v39, v33);
LABEL_63:
    Callback = FigSignalErrorAt();
LABEL_73:
    v60 = Callback;
    v92 = Callback;
    goto LABEL_74;
  }
  v25 = (id)objc_msgSend(a5, "allHeaderFields");
  *(_QWORD *)(v13 + 144) = v25;
  if (!v25)
  {
    _figHTTPRequestCreateErrorComment(v13, v26, CFSTR("NULL HTTP response headers"), v27, v28, v29, v30, v31, v83);
    goto LABEL_63;
  }
  v32 = objc_msgSend(a5, "statusCode");
  *(_QWORD *)(v13 + 416) = 0;
  *(_QWORD *)(v13 + 424) = 0;
LABEL_36:
  v40 = (const __CFString *)objc_msgSend(MEMORY[0x1E0C92C18], "localizedStringForStatusCode:", v32);
  Response = CFHTTPMessageCreateResponse(v22, v32, v40, (CFStringRef)*MEMORY[0x1E0C930E8]);
  *(_QWORD *)(v13 + 152) = Response;
  if (Response)
  {
    v42 = Response;
    v43 = *(const __CFDictionary **)(v13 + 144);
    if (v43)
      CFDictionaryApplyFunction(v43, (CFDictionaryApplierFunction)figApplyHeaderToCFHTTPMessaage, v42);
  }
  if (!*(_QWORD *)(v13 + 80))
    *(_QWORD *)(v13 + 80) = CFRetain((CFTypeRef)objc_msgSend(a5, "URL", v42));
  v44 = *(const void **)(v13 + 368);
  if (v44)
    CFRelease(v44);
  objc_msgSend(a5, "_CFURLResponse", v42);
  *(_QWORD *)(v13 + 368) = CFURLResponseCopyPeerAddress();
  FigCFHTTPCopyErrorCodeAndCommentForHTTPStatusCode(v32, &v92, &v91);
  if (v92)
  {
    v45 = *(const void **)(v13 + 520);
    v46 = v91;
    *(_QWORD *)(v13 + 520) = v91;
    if (v46)
      CFRetain(v46);
    if (v45)
      CFRelease(v45);
    LODWORD(v90) = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_msgSend(*(id *)(v13 + 144), "valueForKey:", CFSTR("X-Error-Description"));
    goto LABEL_64;
  }
  if (*(_BYTE *)(v13 + 170))
  {
    v48 = (void *)objc_msgSend(*(id *)(v13 + 144), "valueForKey:", CFSTR("Content-Encoding"));
    if (v48)
    {
      if (!objc_msgSend(v48, "caseInsensitiveCompare:", CFSTR("gzip")))
        *(_BYTE *)(v13 + 171) = 1;
    }
  }
  if (*(_BYTE *)(v13 + 168))
  {
    cf[0] = 0;
    v93 = 0.0;
    v90 = 0.0;
    type = OS_LOG_TYPE_DEFAULT;
    if (FigCFHTTPGetContentRangeFromHeaderString(objc_msgSend(*(id *)(v13 + 144), "valueForKey:", CFSTR("Content-Range")), cf, &v93, &v90, &type))
    {
      v56 = *(CFTypeRef *)(v13 + 120);
      v55 = *(_QWORD *)(v13 + 128);
      if (cf[0] == v56)
      {
        v57 = v93;
        if (!v55 || *(CFTypeRef *)&v93 == (char *)cf[0] + v55 - 1 || type && *(_QWORD *)&v93 + 1 == *(_QWORD *)&v90)
        {
          v58 = *(_QWORD *)&v93 - (unint64_t)cf[0] + 1;
          *(_QWORD *)(v13 + 416) = v58;
          if (v55 > v58)
            *(_QWORD *)(v13 + 128) = v58;
          goto LABEL_67;
        }
      }
      else
      {
        v57 = v93;
      }
      v85 = cf[0];
      v86 = v57;
      v84 = *(_QWORD *)(v13 + 128);
      _figHTTPRequestCreateErrorComment(v13, v49, CFSTR("content range mismatch - should be start %lld length %lld is start %lld length %lld"), v50, v51, v52, v53, v54, (char)v56);
LABEL_86:
      v92 = FigSignalErrorAt();
      goto LABEL_64;
    }
    if (v32 == 206 && !*(_QWORD *)(v13 + 128))
    {
      v92 = FigSignalErrorAt();
      _figHTTPRequestCreateErrorComment(v13, v70, CFSTR("have 206 with no Content-Range, and no end length"), v71, v72, v73, v74, v75, v83);
      goto LABEL_64;
    }
  }
LABEL_67:
  if (*(_QWORD *)(v13 + 416) || *(_BYTE *)(v13 + 171))
    goto LABEL_69;
  cf[0] = 0;
  if (FigCFHTTPGetContentLengthFromHeaderString((const __CFString *)objc_msgSend(*(id *)(v13 + 144), "valueForKey:", CFSTR("Content-Length")), cf))
  {
    v69 = cf[0];
    *(CFTypeRef *)(v13 + 416) = cf[0];
    if (!*(_BYTE *)(v13 + 168))
      goto LABEL_69;
    if (v32 == 304)
    {
      *(_QWORD *)(v13 + 416) = 0;
      goto LABEL_69;
    }
    v82 = *(CFTypeRef *)(v13 + 128);
    if (v82)
    {
      if (v82 == v69)
      {
LABEL_69:
        if (*(_BYTE *)(v13 + 365))
          v61 = 17;
        else
          v61 = 1;
        Callback = figHTTPRequestPerformReadCallback(Owner, 0, 0, 0, v61, 0);
        goto LABEL_73;
      }
    }
    if (*(_BYTE *)(v13 + 364))
    {
LABEL_99:
      *(_BYTE *)(v13 + 365) = 1;
      goto LABEL_69;
    }
    v84 = (uint64_t)v69;
    _figHTTPRequestCreateErrorComment(v13, v63, CFSTR("byte range length mismatch - should be length %lld is length %lld"), v64, v65, v66, v67, v68, *(_QWORD *)(v13 + 128));
    goto LABEL_86;
  }
  if (v32 == 304 || !*(_BYTE *)(v13 + 168))
    goto LABEL_69;
  if (*(_BYTE *)(v13 + 364))
    goto LABEL_99;
  v92 = FigSignalErrorAt();
  _figHTTPRequestCreateErrorComment(v13, v76, CFSTR("byte range and no content length - error code is %d"), v77, v78, v79, v80, v81, v32);
LABEL_64:
  v60 = v92;
LABEL_74:
  v62 = v87;
  if (v60 != -12785 && v60)
    figHTTPRequestPerformReadCallback(Owner, 0, 0, 0, 2u, v60);
LABEL_77:
  -[FigHTTPRequestSessionDataDelegate restoreVoucher:](self, "restoreVoucher:", v62, v83, v84, v85, *(_QWORD *)&v86);
  FigRetainProxyUnlockMutex();
  FigRetainProxyRelease();
  if (!v92)
  {
    (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
    goto LABEL_81;
  }
LABEL_78:
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
  if (self->_doesIgnoreDidReceiveResponseDisposition)
    objc_msgSend(a4, "cancel");
LABEL_81:
  objc_autoreleasePoolPop(v10);
  if (v91)
    CFRelease(v91);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  const __CFData *v8;
  FigRetainProxy *v9;
  uint64_t v10;
  id v11;
  const void *Owner;
  uint64_t DerivedStorage;
  uint64_t v14;
  uint64_t UpTimeNanoseconds;
  void *v16;
  unint64_t Length;
  unsigned int OutputBuffer;
  int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFIndex v25;
  CFIndex v26;
  unsigned int appended;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  CMBlockBufferRef *v33;
  CFIndex v34;
  unsigned int v35;
  CFIndex v36;
  UInt8 *BytePtr;
  FigHTTPRequestSessionDataDelegate *v38;
  void *v39;
  id v40;
  size_t v41;
  CMBlockBufferCustomBlockSource customBlockSource;
  CFRange v43;

  if (a5)
    v8 = (const __CFData *)CFRetain(a5);
  else
    v8 = 0;
  v9 = -[FigHTTPRequestSessionDataDelegate _copyAndLockRequestForTask:](self, "_copyAndLockRequestForTask:", a4);
  if (!v9)
    goto LABEL_51;
  v10 = (uint64_t)v9;
  v11 = -[FigHTTPRequestSessionDataDelegate adoptVoucherFromRetainProxy:](self, "adoptVoucherFromRetainProxy:", v9);
  Owner = (const void *)FigRetainProxyGetOwner();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)(DerivedStorage + 172))
  {
    v14 = DerivedStorage;
    figHTTPSetIsDormant((uint64_t)Owner, 0);
    UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    *(_QWORD *)(v14 + 232) = UpTimeNanoseconds;
    if (*(_QWORD *)(v14 + 488) && !*(_BYTE *)(v14 + 173))
    {
      objc_msgSend(a5, "length");
      UpTimeNanoseconds = FigNetworkHistoryRequestReceivedBytes();
    }
    v16 = (void *)MEMORY[0x19403137C](UpTimeNanoseconds);
    Length = CFDataGetLength(v8);
    OutputBuffer = figHttpRequestEnsureNotTooManyBytes((uint64_t)Owner, Length);
    v19 = *(unsigned __int8 *)(v14 + 365);
    if (OutputBuffer)
    {
      v21 = 0;
      if (*(_BYTE *)(v14 + 365))
        goto LABEL_46;
    }
    else
    {
      if (*(_BYTE *)(v14 + 365))
      {
        v20 = *(_QWORD *)(v14 + 424);
        v21 = *(_QWORD *)(v14 + 120) - v20;
        if (v21 < Length)
        {
          *(_BYTE *)(v14 + 365) = 0;
          goto LABEL_16;
        }
      }
      else
      {
        v21 = 0;
        if (Length)
          goto LABEL_16;
        v20 = *(_QWORD *)(v14 + 424);
      }
      *(_QWORD *)(v14 + 424) = v20 + Length;
      if (v19)
      {
LABEL_46:
        if (!FigRetainProxyIsInvalidated())
        {
          if (OutputBuffer)
          {
            if (!*(_BYTE *)(v14 + 172))
              figHTTPRequestPerformReadCallback(Owner, 0, 0, 0, 2u, OutputBuffer);
          }
          else
          {
            *(_QWORD *)(v14 + 240) = FigGetUpTimeNanoseconds();
          }
        }
        objc_autoreleasePoolPop(v16);
        goto LABEL_50;
      }
    }
LABEL_16:
    v38 = self;
    v39 = v16;
    v40 = v11;
    if (*(_QWORD *)(v14 + 16))
    {
      v22 = FigRetainProxyGetOwner();
      v23 = CMBaseObjectGetDerivedStorage();
      v24 = CFDataGetLength(v8) - v21;
      *(_QWORD *)(v23 + 424) += v21;
      if (v24 < 1)
      {
LABEL_29:
        OutputBuffer = 0;
      }
      else
      {
        while (1)
        {
          v41 = 0;
          *(_QWORD *)&customBlockSource.version = 0;
          OutputBuffer = figHTTPRequestGetOutputBuffer(v22, (char **)&customBlockSource, &v41);
          if (FigRetainProxyIsInvalidated() || OutputBuffer)
            break;
          if (!*(_QWORD *)(v23 + 384))
            goto LABEL_29;
          if (v41 >= v24)
            v25 = v24;
          else
            v25 = v41;
          v43.location = v21;
          v43.length = v25;
          CFDataGetBytes(v8, v43, *(UInt8 **)&customBlockSource.version);
          v26 = *(_QWORD *)(v23 + 408) - v25;
          *(_QWORD *)(v23 + 400) += v25;
          *(_QWORD *)(v23 + 408) = v26;
          if (*(_BYTE *)(v23 + 362) || !v26)
          {
            appended = figHttpRequestSendOutputBlockBuffer(v10, 0);
            if (appended)
              goto LABEL_54;
          }
          v21 += v25;
          v28 = v24 <= v25;
          v24 -= v25;
          if (v28)
            goto LABEL_29;
        }
      }
      goto LABEL_30;
    }
    v29 = FigRetainProxyGetOwner();
    v30 = CMBaseObjectGetDerivedStorage();
    v31 = v30;
    if (*(_BYTE *)(v30 + 365))
      v32 = *(_QWORD *)(v30 + 120) - *(_QWORD *)(v30 + 424);
    else
      v32 = 0;
    v33 = (CMBlockBufferRef *)(v30 + 384);
    if (CMBlockBufferCreateEmpty(*(CFAllocatorRef *)(v30 + 160), 0, 0, (CMBlockBufferRef *)(v30 + 384)) || !*v33)
    {
      v35 = FigSignalErrorAt();
    }
    else
    {
      v34 = CFDataGetLength(v8);
      v35 = figHttpRequestEnsureNotTooManyBytes(v29, v34);
      if (!v35)
      {
        v36 = v34 - v32;
        if (v34 <= v32)
        {
          *(_QWORD *)(v31 + 424) += v34;
          if (v34 != v32)
          {
            v36 = 0;
            goto LABEL_45;
          }
          v36 = 0;
        }
        else
        {
          HIDWORD(customBlockSource.AllocateBlock) = 0;
          *(_QWORD *)&customBlockSource.version = 0;
          customBlockSource.FreeBlock = (void (__cdecl *)(void *, void *, size_t))figHttpRequestFreeCFData;
          customBlockSource.refCon = (void *)CFRetain(v8);
          BytePtr = (UInt8 *)CFDataGetBytePtr(v8);
          appended = CMBlockBufferAppendMemoryBlock(*v33, BytePtr, v34, 0, &customBlockSource, v32, v34 - v32, 0);
          if (appended)
          {
LABEL_54:
            OutputBuffer = appended;
LABEL_30:
            self = v38;
LABEL_31:
            v16 = v39;
            v11 = v40;
            goto LABEL_46;
          }
          *(_QWORD *)(v31 + 424) += v32;
        }
        *(_BYTE *)(v31 + 365) = 0;
LABEL_45:
        v16 = v39;
        v11 = v40;
        *(_QWORD *)(v31 + 400) = v36;
        *(_QWORD *)(v31 + 408) = 0;
        *(_QWORD *)(v31 + 392) = 0;
        OutputBuffer = figHttpRequestSendOutputBlockBuffer(v10, 0);
        self = v38;
        goto LABEL_46;
      }
    }
    OutputBuffer = v35;
    goto LABEL_31;
  }
LABEL_50:
  -[FigHTTPRequestSessionDataDelegate restoreVoucher:](self, "restoreVoucher:", v11, v38);
  FigRetainProxyUnlockMutex();
  FigRetainProxyRelease();
LABEL_51:
  if (v8)
    CFRelease(v8);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  void *v7;

  v7 = (void *)MEMORY[0x19403137C](self, a2, a3, a4, a5);
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
  objc_autoreleasePoolPop(v7);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  void *v8;
  FigRetainProxy *v9;
  id v10;
  uint64_t DerivedStorage;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (objc_msgSend((id)objc_msgSend(a5, "transactionMetrics", a3), "count") == 1)
  {
    v8 = (void *)objc_msgSend((id)objc_msgSend(a5, "transactionMetrics"), "objectAtIndexedSubscript:", 0);
    v9 = -[FigHTTPRequestSessionDataDelegate _copyAndLockRequestForTask:](self, "_copyAndLockRequestForTask:", a4);
    if (v9)
    {
      v10 = -[FigHTTPRequestSessionDataDelegate adoptVoucherFromRetainProxy:](self, "adoptVoucherFromRetainProxy:", v9);
      FigRetainProxyGetOwner();
      DerivedStorage = CMBaseObjectGetDerivedStorage();
      *(_QWORD *)(DerivedStorage + 256) = a5;
      objc_msgSend((id)objc_msgSend(v8, "responseEndDate"), "timeIntervalSinceDate:", objc_msgSend(v8, "fetchStartDate"));
      *(_QWORD *)(DerivedStorage + 304) = (uint64_t)(v12 * 1000000000.0);
      *(_BYTE *)(DerivedStorage + 321) = objc_msgSend(v8, "resourceFetchType") == 2;
      *(_QWORD *)(DerivedStorage + 328) = objc_msgSend(a5, "redirectCount");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        *(_DWORD *)(DerivedStorage + 336) = objc_msgSend(v8, "_privacyStance");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = *(void **)(DerivedStorage + 344);
        if (v13)
          nw_release(v13);
        *(_QWORD *)(DerivedStorage + 344) = 0;
        v14 = (void *)objc_msgSend(v8, "_establishmentReport");
        *(_QWORD *)(DerivedStorage + 344) = v14;
        if (v14)
          nw_retain(v14);
      }
      v15 = *(void **)(DerivedStorage + 352);
      if (v15)
        nw_release(v15);
      *(_QWORD *)(DerivedStorage + 352) = 0;
      v16 = (void *)objc_msgSend(v8, "_dataTransferReport");
      *(_QWORD *)(DerivedStorage + 352) = v16;
      if (v16)
        nw_retain(v16);
      -[FigHTTPRequestSessionDataDelegate restoreVoucher:](self, "restoreVoucher:", v10);
      FigRetainProxyUnlockMutex();
      FigRetainProxyRelease();
    }
  }
}

@end
