@implementation NSURLConnectionInternalConnection

- (void)invokeForDelegate:(id)a3
{
  void *v4;

  if (self->super._delegateQueue)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", a3);
    -[NSOperationQueue addOperation:](self->super._delegateQueue, "addOperation:", v4);
    objc_msgSend(v4, "waitUntilFinished");
  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)start
{
  uint64_t v3;
  const void *v4;

  v3 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v3)
  {
    v4 = (const void *)v3;
    if (self)
      self->super._connectionActive = 1;
    CFURLConnectionStart(v3);
    CFRelease(v4);
  }
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  uint64_t v7;
  const void *v8;

  v7 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v7)
  {
    v8 = (const void *)v7;
    CFURLConnectionScheduleWithRunLoop(v7, objc_msgSend(a3, "getCFRunLoop"), (uint64_t)a4);
    if (self)
      self->super._connectionActive = 1;
    CFRelease(v8);
  }
}

- (NSURLConnectionInternalConnection)initWithInfo:(const InternalInit *)a3
{
  id v4;
  _CFURLRequest *CFRequest;
  _CFURLRequest *v6;
  uint64_t v7;
  void *v8;
  void (*v9)(_CFURLConnection *, uint64_t);
  void (*v10)(_CFURLConnection *, _CFURLResponse *, uint64_t);
  void (*v11)(_CFURLConnection *, const __CFData *, uint64_t, uint64_t);
  const _CFCachedURLResponse *(*v12)(_CFURLConnection *, const _CFCachedURLResponse *, uint64_t);
  void (*v13)(_CFURLConnection *, _CFURLAuthChallenge *, uint64_t);
  _OWORD *v14;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void (*v26)(_CFURLConnection *, uint64_t);
  objc_super v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)NSURLConnectionInternalConnection;
  v4 = -[NSURLConnectionInternal initWithInfo:](&v27, sel_initWithInfo_);
  if (!v4)
    return (NSURLConnectionInternalConnection *)v4;
  CFRequest = createCFRequest(a3);
  if (!CFRequest)
  {

    return 0;
  }
  v6 = CFRequest;
  v7 = 0;
  v31 = sel_connection_willSendRequest_redirectResponse_;
  v32 = sel_connection_willSendRequestForEstablishedConnection_properties_;
  v33 = sel_connectionWaiting_;
  v34 = sel_connection_didReceiveResponse_;
  v35 = sel_connection_didWriteData_totalBytesWritten_expectedTotalBytes_;
  v36 = sel_connection_didReceiveData_lengthReceived_;
  v37 = sel_connection_didReceiveData_;
  v38 = sel_connectionDidFinishLoading_;
  v39 = sel_connection_didFailWithError_;
  v40 = sel_connection_willCacheResponse_;
  v41 = sel_connection_didReceiveAuthenticationChallenge_;
  v42 = sel_connection_didSendBodyData_totalBytesWritten_totalBytesExpectedToWrite_;
  v43 = sel_connectionShouldUseCredentialStorage_;
  v44 = sel_connection_needNewBodyStream_;
  v45 = sel_connection_conditionalRequirementsChanged_;
  v46 = sel_connection_canAuthenticateAgainstProtectionSpace_;
  v47 = sel_connection_willSendRequestForAuthenticationChallenge_;
  v48 = sel_connection_didReceiveDataArray_;
  v49 = sel_connectionDidResumeDownloading_totalBytesWritten_expectedTotalBytes_;
  v50 = sel_connectionDidFinishDownloading_destinationURL_;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  do
    *((_BYTE *)&v28 + v7++) = objc_opt_respondsToSelector() & 1;
  while (v7 != 20);
  v26 = 0;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  v22 = 0u;
  v21 = 0u;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16[0] = 9;
  v16[1] = v4;
  v16[2] = 0;
  v16[3] = _NSURLConnectionReleaseClient;
  v16[4] = MEMORY[0x1E0C98350];
  if ((_BYTE)v28)
    *(_QWORD *)&v17 = _NSURLConnectionWillSendRequest;
  if (BYTE1(v28))
    *(_QWORD *)&v25 = _NSURLConnectionWillSendRequestForEstablishedConnection;
  if (BYTE2(v28))
    v26 = _NSURLConnectionConnectionWaiting;
  if (BYTE6(v29))
    *((_QWORD *)&v25 + 1) = _NSURLConnectionConditionalRequirementsChanged;
  if (HIBYTE(v30))
  {
    v8 = _NSURLConnectionDidReceiveResponse_Download;
    if (!BYTE3(v28))
      v8 = _NSURLConnectionDidReceiveResponse_Download_NoDelegate;
    *((_QWORD *)&v17 + 1) = v8;
    if (BYTE4(v28))
      *(_QWORD *)&v18 = _NSURLConnectionDidReceiveData_Download;
    v9 = _NSURLConnectionDidFinishLoading_Download;
    goto LABEL_31;
  }
  v10 = _NSURLConnectionDidReceiveResponse;
  if (!BYTE3(v28))
    v10 = (void (*)(_CFURLConnection *, _CFURLResponse *, uint64_t))_NSURLConnectionDidReceiveResponse_noSelector;
  *((_QWORD *)&v17 + 1) = v10;
  if (!BYTE1(v30))
  {
    if (BYTE5(v28))
    {
      v11 = _NSURLConnectionDidReceiveData_LengthReceived;
    }
    else
    {
      if (!BYTE6(v28))
        goto LABEL_29;
      v11 = _NSURLConnectionDidReceiveData;
    }
    *(_QWORD *)&v18 = v11;
    goto LABEL_29;
  }
  *((_QWORD *)&v23 + 1) = _NSURLConnectionDidReceiveDataArray;
LABEL_29:
  if (!HIBYTE(v28))
    goto LABEL_32;
  v9 = _NSURLConnectionDidFinishLoading;
LABEL_31:
  *(_QWORD *)&v19 = v9;
LABEL_32:
  if ((_BYTE)v29)
    *((_QWORD *)&v19 + 1) = _NSURLConnectionDidFail;
  if (!a3->var4)
  {
    v12 = (const _CFCachedURLResponse *(*)(_CFURLConnection *, const _CFCachedURLResponse *, uint64_t))_NSURLConnectionWillCacheResponse_noCache;
    goto LABEL_38;
  }
  if (BYTE1(v29))
  {
    v12 = _NSURLConnectionWillCacheResponse;
LABEL_38:
    *(_QWORD *)&v20 = v12;
  }
  if (BYTE3(v29))
    *(_QWORD *)&v21 = _NSURLConnectionDidSendBodyData;
  if (BYTE2(v29))
    v13 = _NSURLConnectionDidReceiveAuthenticationChallenge;
  else
    v13 = _NSURLConnectionDidReceiveAuthenticationChallenge_noSelector;
  *((_QWORD *)&v20 + 1) = v13;
  if (BYTE4(v29))
    *((_QWORD *)&v21 + 1) = _NSURLConnectionShouldUseCredentialStorage;
  if (HIBYTE(v29))
    *((_QWORD *)&v22 + 1) = _NSURLConnectionCanRespondToProtectionSpace;
  if (BYTE5(v29))
    *(_QWORD *)&v22 = _NSURLConnectionNeedNewBodyStream;
  if ((_BYTE)v30)
    *(_QWORD *)&v23 = _NSURLConnectionWillSendRequestForAuthenticationChallenge;
  v14 = CFURLConnectionCreateWithProperties(0, v6, v16, *((const __CFDictionary **)v4 + 7));
  *((_QWORD *)v4 + 9) = v14;
  CFMakeCollectable(v14);
  CFRelease(v6);
  return (NSURLConnectionInternalConnection *)v4;
}

- (void)dealloc
{
  uint64_t v3;
  objc_super v4;

  if (self)
  {
    _os_nospin_lock_lock();
    v3 = *(_QWORD *)&self->_cfConnLock;
    _os_nospin_lock_unlock();
    if (v3)
    {
      NSLog(CFSTR("Should've been invalidated"));
      -[NSURLConnectionInternalConnection _invalidate](self, "_invalidate");
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NSURLConnectionInternalConnection;
  -[NSURLConnectionInternal dealloc](&v4, sel_dealloc);
}

- (void)cancel
{
  uint64_t v2;
  const void *v3;

  if (self)
    self->super._connectionActive = 0;
  v2 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v2)
  {
    v3 = (const void *)v2;
    CFURLConnectionCancel(v2);
    CFRelease(v3);
  }
}

- (uint64_t)_retainCFURLConnection
{
  uint64_t v2;

  if (!a1)
    return 0;
  _os_nospin_lock_lock();
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
    CFRetain(*(CFTypeRef *)(a1 + 72));
  _os_nospin_lock_unlock();
  return v2;
}

- (void)_invalidate
{
  uint64_t v3;
  const void *v4;
  NSURLAuthenticationChallenge *currNSChallenge;
  void *v6;
  objc_super v7;

  v3 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v3)
  {
    v4 = (const void *)v3;
    if (!LOBYTE(self->_fileName))
    {
      self->super._connectionActive = 0;
      CFURLConnectionCancel(v3);
    }
    CFRelease(v4);
  }
  currNSChallenge = self->_currNSChallenge;
  if (currNSChallenge)
  {
    CFRelease(currNSChallenge);
    self->_currNSChallenge = 0;
  }

  self->_currCFChallenge = 0;
  self->_cfConn = 0;
  _os_nospin_lock_lock();
  v6 = *(void **)&self->_cfConnLock;
  if (v6)
  {

    *(_QWORD *)&self->_cfConnLock = 0;
  }
  _os_nospin_lock_unlock();
  v7.receiver = self;
  v7.super_class = (Class)NSURLConnectionInternalConnection;
  -[NSURLConnectionInternal _invalidate](&v7, sel__invalidate);
}

- (id)_timingData
{
  id result;
  id v3;
  _QWORD *v4;
  CFTypeRef v5;

  result = (id)-[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (result)
  {
    v3 = result;
    v4 = _CFURLConnectionCopyTimingData(result);
    v5 = (id)CFMakeCollectable(v4);
    CFRelease(v3);
    return (id)v5;
  }
  return result;
}

- (void)_setDelegateQueue:(id)a3
{
  uint64_t v5;
  const void *v6;
  NSObject *v7;
  uint64_t v8;
  unsigned int v9;
  dispatch_queue_t v10;
  objc_super v11;
  char __str[256];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v5)
  {
    v6 = (const void *)v5;
    if (a3)
    {
      if (objc_msgSend(-[NSDictionary objectForKey:](self->super._connectionProperties, "objectForKey:", CFSTR("kCFURLConnectionSocketStreamProperties")), "objectForKey:", CFSTR("_WebKitSynchronousRequest")))
      {
        v7 = dispatch_queue_create("NSURLConnection-WebKitSync", 0);
        CFURLConnectionSetDelegateDispatchQueue((uint64_t)v6, (uint64_t)v7);
        if (v7)
          dispatch_release(v7);
        goto LABEL_13;
      }
      pthread_mutex_lock(&-[NSURLConnectionInternalConnection _setDelegateQueue:]::sLock);
      v9 = -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot;
      if (-[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot >= 0x1E)
      {
        v9 = 0;
        -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot = 0;
      }
      v10 = (dispatch_queue_t)-[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueues[v9];
      if (!v10)
      {
        snprintf(__str, 0x100uLL, "NSURLConnection-%d", v9);
        v10 = dispatch_queue_create(__str, 0);
        v9 = -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot;
        -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueues[-[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot] = v10;
      }
      -[NSURLConnectionInternalConnection _setDelegateQueue:]::sQueueSlot = v9 + 1;
      pthread_mutex_unlock(&-[NSURLConnectionInternalConnection _setDelegateQueue:]::sLock);
      v5 = (uint64_t)v6;
      v8 = (uint64_t)v10;
    }
    else
    {
      v8 = 0;
    }
    CFURLConnectionSetDelegateDispatchQueue(v5, v8);
LABEL_13:
    v11.receiver = self;
    v11.super_class = (Class)NSURLConnectionInternalConnection;
    -[NSURLConnectionInternal _setDelegateQueue:](&v11, sel__setDelegateQueue_, a3);
    CFRelease(v6);
  }
}

- (void)unscheduleFromRunLoop:(id)a3 forMode:(id)a4
{
  uint64_t v6;
  const void *v7;

  v6 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v6)
  {
    v7 = (const void *)v6;
    CFURLConnectionUnscheduleFromRunLoop(v6, objc_msgSend(a3, "getCFRunLoop"), (uint64_t)a4);
    CFRelease(v7);
  }
}

- (void)_suspendLoading
{
  uint64_t v2;
  const void *v3;

  v2 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v2)
  {
    v3 = (const void *)v2;
    CFURLConnectionHalt(v2);
    CFRelease(v3);
  }
}

- (void)_resumeLoading
{
  uint64_t v2;
  const void *v3;

  v2 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v2)
  {
    v3 = (const void *)v2;
    CFURLConnectionResume(v2);
    CFRelease(v3);
  }
}

- (void)_setShouldSkipCancelOnRelease:(BOOL)a3
{
  LOBYTE(self->_fileName) = a3;
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  uint64_t v7;
  const void *v8;

  v7 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v7)
  {
    v8 = (const void *)v7;
    if (self->_currCFChallenge == a4)
    {
      CFURLConnectionUseCredential(v7, objc_msgSend(a3, "_cfurlcredential"), (uint64_t)self->_cfConn);
      -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    }
    CFRelease(v8);
  }
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  uint64_t v5;
  const void *v6;

  v5 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v5)
  {
    v6 = (const void *)v5;
    if (self->_currCFChallenge == a3)
    {
      CFURLConnectionUseCredential(v5, 0, (uint64_t)self->_cfConn);
      -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    }
    CFRelease(v6);
  }
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  uint64_t v4;
  const void *v5;
  id v6;
  id v7;
  id v8;
  NSObject *global_queue;
  void *v10;
  _QWORD block[6];
  _QWORD v12[5];

  v4 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v4)
  {
    v5 = (const void *)v4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v7 = (id)objc_msgSend(v6, "_web_initWithDomain_nowarn:code:URL:", *MEMORY[0x1E0CB32E8], -1012, self->super._url);
      v8 = v7;
      if (self->super._delegateQueue)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke_2;
        block[3] = &unk_1E14FDE88;
        block[4] = self;
        block[5] = v8;
        dispatch_async(global_queue, block);
      }
      else
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke;
        v12[3] = &unk_1E14FE318;
        v12[4] = v7;
        v10 = (void *)MEMORY[0x186DB8C8C]();
        -[NSURLConnectionInternal _withConnectionAndDelegate:onlyActive:]((uint64_t)self, (uint64_t)v12, 0);
        objc_autoreleasePoolPop(v10);
      }
    }
    -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    self->super._connectionActive = 0;
    CFURLConnectionCancel((uint64_t)v5);
    CFRelease(v5);
  }
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  uint64_t v5;
  const void *v6;

  v5 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v5)
  {
    v6 = (const void *)v5;
    if (self->_currCFChallenge == a3)
    {
      CFURLConnectionPerformDefaultHandlingForChallenge(v5, (uint64_t)self->_cfConn);
      -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    }
    CFRelease(v6);
  }
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  uint64_t v5;
  const void *v6;

  v5 = -[NSURLConnectionInternalConnection _retainCFURLConnection]((uint64_t)self);
  if (v5)
  {
    v6 = (const void *)v5;
    if (self->_currCFChallenge == a3)
    {
      CFURLConnectionRejectChallenge(v5, (uint64_t)self->_cfConn);
      -[NSURLConnectionInternalConnection cleanupChallenges]((uint64_t)self);
    }
    CFRelease(v6);
  }
}

- (void)cleanupChallenges
{
  if (a1)
  {

    *(_QWORD *)(a1 + 88) = 0;
    *(_QWORD *)(a1 + 80) = 0;
  }
}

uint64_t __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "connection:didFailWithError:", a2, *(_QWORD *)(a1 + 32));
}

void __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke_3;
  v2[3] = &unk_1E14FE318;
  v1 = *(_QWORD *)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  -[NSURLConnectionInternal _withConnectionAndDelegate:](v1, (uint64_t)v2);
}

uint64_t __67__NSURLConnectionInternalConnection_cancelAuthenticationChallenge___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "connection:didFailWithError:", a2, *(_QWORD *)(a1 + 32));
}

- (void)sendCFChallenge:(uint64_t)a3 toSelector:
{
  void *v4;
  _QWORD v5[7];

  if (a1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __74__NSURLConnectionInternalConnection_Internal__sendCFChallenge_toSelector___block_invoke;
    v5[3] = &unk_1E14FD218;
    v5[4] = a1;
    v5[5] = a2;
    v5[6] = a3;
    v4 = (void *)MEMORY[0x186DB8C8C]();
    -[NSURLConnectionInternal _withConnectionAndDelegate:onlyActive:](a1, (uint64_t)v5, 1);
    objc_autoreleasePoolPop(v4);
  }
}

uint64_t __74__NSURLConnectionInternalConnection_Internal__sendCFChallenge_toSelector___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  CFRetain(*(CFTypeRef *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = *(_QWORD *)(a1 + 40);
  CFMakeCollectable(*(CFTypeRef *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = +[NSURLAuthenticationChallenge _authenticationChallengeForCFAuthChallenge:sender:](NSURLAuthenticationChallenge, "_authenticationChallengeForCFAuthChallenge:sender:", *(_QWORD *)(a1 + 40), a2);
  return objc_msgSend(a3, "performSelector:withObject:withObject:", *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

@end
