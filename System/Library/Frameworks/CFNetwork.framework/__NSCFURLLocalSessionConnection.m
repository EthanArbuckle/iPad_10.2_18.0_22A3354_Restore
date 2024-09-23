@implementation __NSCFURLLocalSessionConnection

- (void)suspend
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42____NSCFURLLocalSessionConnection_suspend__block_invoke;
  v2[3] = &unk_1E14F7970;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v2);
}

- (void)resume
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41____NSCFURLLocalSessionConnection_resume__block_invoke;
  v2[3] = &unk_1E14F7970;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v2);
}

- (void)setPoolPriority:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51____NSCFURLLocalSessionConnection_setPoolPriority___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  v3[4] = a3;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v3);
}

- (void)withLoaderAsync:(id)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  workQueue = self->super._workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51____NSCFURLLocalSessionConnection_withLoaderAsync___block_invoke;
  v4[3] = &unk_1E14FDF00;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(workQueue, v4);
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41____NSCFURLLocalSessionConnection_cancel__block_invoke;
  v2[3] = &unk_1E14F7970;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v2);
}

- (void)_ackBytes:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45____NSCFURLLocalSessionConnection__ackBytes___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  v3[4] = a3;
  -[__NSCFURLLocalSessionConnection withLoaderOnQueue:]((uint64_t)self, (uint64_t)v3);
}

- (void)_didReceiveData:(id)a3
{
  NSObject *pendingData;
  NSObject *alloc;
  _QWORD applier[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a3 && dispatch_data_get_size((dispatch_data_t)a3))
  {
    if (self->_sniffData)
    {
      conCatData((dispatch_object_t *)&self->_sniffData, (dispatch_object_t)a3);
    }
    else
    {
      conCatData((dispatch_object_t *)&self->_pendingData, (dispatch_object_t)a3);
      if (self->_maxDataSegmentCount)
      {
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        v8 = 0;
        v9 = &v8;
        v10 = 0x2020000000;
        v11 = 0;
        pendingData = self->_pendingData;
        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = __51____NSCFURLLocalSessionConnection__didReceiveData___block_invoke;
        applier[3] = &unk_1E14FD160;
        applier[4] = &v12;
        applier[5] = &v8;
        dispatch_data_apply(pendingData, applier);
        if (v13[3] > self->_maxDataSegmentCoalesceThreshhold && v9[3] > self->_maxDataSegmentCount)
        {
          alloc = dispatch_data_create_alloc();
          if (alloc)
            dispatch_release(alloc);
        }
        _Block_object_dispose(&v8, 8);
        _Block_object_dispose(&v12, 8);
      }
    }
    -[__NSCFURLLocalSessionConnection _tick]((uint64_t)self);
  }
}

- (void)_tick
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  NSObject *v8;
  void *v9;
  NSCachedURLResponse *v10;
  NSObject *v11;
  uint64_t v12;
  size_t size;
  size_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSCachedURLResponse *v22;
  size_t v23;
  int v24;

  if (!a1)
    return;
  v2 = *(_DWORD *)(a1 + 136);
  if ((v2 - 1) >= 2)
  {
    if (v2 != 3)
    {
      if (!v2)
      {
        *(_DWORD *)(a1 + 136) = 1;
        v17 = MEMORY[0x1E0C809B0];
        v18 = 3221225472;
        v19 = __51____NSCFURLLocalSessionConnection__tick_initialize__block_invoke;
        v20 = &unk_1E14F7970;
        v3 = *(_QWORD *)(a1 + 80);
        v21 = a1;
        if (v3)
          v4 = v3 + 48;
        else
          v4 = 0;
        v5 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 136))(v4);
        __51____NSCFURLLocalSessionConnection__tick_initialize__block_invoke((uint64_t)&v17, v5);
        (*(void (**)(const char *))(*(_QWORD *)v5 + 144))(v5);
      }
      return;
    }
    if (*(uint64_t *)(a1 + 112) > 0)
      return;
    if (*(_QWORD *)(a1 + 128))
    {
      -[__NSCFURLSessionConnection _tossCache](a1);
      v8 = *(NSObject **)(a1 + 152);
      if (v8)
      {
        dispatch_release(v8);
        *(_QWORD *)(a1 + 152) = 0;
      }
      v9 = *(void **)(a1 + 160);
      if (v9)
      {

        *(_QWORD *)(a1 + 160) = 0;
      }
    }
    if (*(_QWORD *)(a1 + 152))
      __assert_rtn("-[__NSCFURLLocalSessionConnection _tick_finishing]", "SessionConnection.mm", 892, "_sniffData == NULL");
    v10 = -[__NSCFURLSessionConnection _cachedResponse](a1);
    if (v10)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __50____NSCFURLLocalSessionConnection__tick_finishing__block_invoke;
      v20 = &unk_1E14F7A98;
      v21 = a1;
      v22 = v10;
LABEL_40:
      -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:](a1, (uint64_t)&v17);
      return;
    }
    *(_DWORD *)(a1 + 136) = 4;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __51____NSCFURLLocalSessionConnection__task_sendFinish__block_invoke;
    v20 = &unk_1E14F7A48;
LABEL_39:
    v21 = a1;
    goto LABEL_40;
  }
  if (*(uint64_t *)(a1 + 112) >= 1 && !*(_BYTE *)(a1 + 168))
    return;
  v6 = *(NSObject **)(a1 + 152);
  if (v6)
  {
    if (dispatch_data_get_size(v6) > 0x1FF || v2 != 1)
      -[__NSCFURLLocalSessionConnection _tick_sniffNow]((_QWORD *)a1);
  }
  else
  {
    v11 = *(NSObject **)(a1 + 104);
    if (v11)
    {
      if (v2 == 2)
      {
        v12 = 0;
        *(_QWORD *)(a1 + 144) = 0;
        v11 = *(NSObject **)(a1 + 104);
      }
      else
      {
        v12 = *(_QWORD *)(a1 + 144);
      }
      size = dispatch_data_get_size(v11);
      if (v12 >= 1 && size < v12)
        return;
      v15 = size;
      *(_QWORD *)(a1 + 104) = 0;
      -[__NSCFURLSessionConnection _appendDataToCache:](a1, v11);
      v16 = *(_DWORD *)(a1 + 192);
      *(_DWORD *)(a1 + 192) = v16 + 1;
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __48____NSCFURLLocalSessionConnection__tick_running__block_invoke;
      v20 = &unk_1E14F7A20;
      v24 = v16;
      v22 = (NSCachedURLResponse *)v11;
      v23 = v15;
      goto LABEL_39;
    }
    if (v2 == 2)
    {
      *(_DWORD *)(a1 + 136) = 3;
      -[__NSCFURLLocalSessionConnection _tick](a1);
    }
  }
}

- (uint64_t)withDelegateAndPendingCompletion:(uint64_t)result
{
  _QWORD *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (result)
  {
    v3 = (_QWORD *)result;
    v4 = *(NSObject **)(result + 16);
    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "_workQueue is NULL", v5, 2u);
        v4 = v3[2];
      }
      else
      {
        v4 = 0;
      }
    }
    dispatch_assert_queue_V2(v4);
    ++v3[14];
    return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, v3[3]);
  }
  return result;
}

- (void)_didFinishWithError:(id)a3
{
  _QWORD v4[5];

  if (self->_state <= 1)
  {
    if (a3)
    {
      self->_state = 3;
      self->_pendingError = (NSError *)objc_msgSend(a3, "copy");
    }
    else
    {
      self->_state = 2;
    }
  }
  if (self->super._delegate && self->super._workQueue)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55____NSCFURLLocalSessionConnection__didFinishWithError___block_invoke;
    v4[3] = &unk_1E14F7A48;
    v4[4] = self;
    -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
  }
  -[__NSCFURLLocalSessionConnection _tick]((uint64_t)self);
}

- (void)_didReceiveResponse:(id)a3 sniff:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  _BOOL4 v8;
  NSURLRequest *v9;
  _CFURLResponse *v10;
  _QWORD v11[6];

  v4 = a4;
  if (self->_didCheckMixedReplace)
  {
    if (!self->_isMixedReplace)
      goto LABEL_11;
  }
  else
  {
    self->_didCheckMixedReplace = 1;
    v7 = *(_QWORD *)(objc_msgSend(a3, "_inner") + 88);
    v8 = v7 && (*(_WORD *)(v7 + 297) & 0x8000) != 0;
    self->_isMixedReplace = v8;
    if (!v8)
      goto LABEL_11;
  }
  -[__NSCFURLSessionConnection _tossCache]((uint64_t)self);
  if (self->_sniffResponse)
    -[__NSCFURLLocalSessionConnection _tick_sniffNow](self);
LABEL_11:
  if (v4
    && !self->super._isFromCache
    && (v9 = -[NSURLSessionTask currentRequest](self->super._task, "currentRequest"),
        HTTPSniffing::checkRequestAndUpdateResponseForSniffingPurposes((HTTPSniffing *)v9, (_CFURLRequest *)a3, v10)))
  {
    self->_sniffData = (OS_dispatch_data *)dispatch_data_create("", 0, 0, 0);
    self->_sniffResponse = (NSURLResponse *)objc_msgSend(a3, "copy");
  }
  else
  {
    if (self->_isMixedReplace)
      -[__NSCFURLLocalSessionConnection suspend](self, "suspend");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59____NSCFURLLocalSessionConnection__sendResponseToDelegate___block_invoke;
    v11[3] = &unk_1E14F7A98;
    v11[4] = a3;
    v11[5] = self;
    -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v11);
  }
}

- (void)_didReceiveChallenge:(id)a3
{
  NSURLAuthenticationChallenge *v3;
  uint64_t v5;
  uint64_t v6;
  NSURL *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  NSURLCredential *v11;
  NSObject *v12;
  _QWORD v13[6];
  _QWORD v14[7];
  uint8_t buf[16];

  v3 = (NSURLAuthenticationChallenge *)a3;
  if (!a3)
    goto LABEL_14;
  v5 = objc_msgSend((id)objc_msgSend(a3, "protectionSpace"), "_CFURLProtectionSpace");
  if (!v5)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v12 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_183ECA000, v12, OS_LOG_TYPE_ERROR, "_isPasswordBasedChallenge called with nil protection space", buf, 2u);
    }
    goto LABEL_14;
  }
  v6 = v5;
  if (URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace != -1)
    dispatch_once(&URLProtectionSpace::Class(void)::sOnce_URLProtectionSpace, &__block_literal_global_8641);
  if ((*(_DWORD *)(v6 + 72) - 1) > 5 || self->_didCheckCredentialsSuppliedInURL)
  {
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  self->_didCheckCredentialsSuppliedInURL = 1;
  v7 = -[NSURLSessionTask currentRequest_URL](self->super._task, "currentRequest_URL");
  v8 = -[NSURL user](v7, "user");
  v9 = -[NSURL password](v7, "password");
  v10 = 0;
  if (v8 && v9)
  {
    v10 = 1;
    v11 = +[NSURLCredential credentialWithUser:password:persistence:](NSURLCredential, "credentialWithUser:password:persistence:", v8, v9, 1);
    self->_actuallyTriedCredentialsSuppliedInURL = 1;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke;
    v14[3] = &unk_1E14FE1E0;
    v14[4] = self;
    v14[5] = v3;
    v14[6] = v11;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v14);
  }
LABEL_15:
  if (self->_actuallyTriedCredentialsSuppliedInURL
    && -[NSURLAuthenticationChallenge previousFailureCount](v3, "previousFailureCount") == 1
    && -[NSURLAuthenticationChallenge proposedCredential](v3, "proposedCredential")
    && -[NSString isEqualToString:](-[NSURLCredential user](-[NSURLAuthenticationChallenge proposedCredential](v3, "proposedCredential"), "user"), "isEqualToString:", -[NSURL user](-[NSURLSessionTask currentRequest_URL](self->super._task, "currentRequest_URL"), "user"))&& -[NSString isEqualToString:](-[NSURLCredential password](-[NSURLAuthenticationChallenge proposedCredential](v3, "proposedCredential"), "password"), "isEqualToString:", -[NSURL password](-[NSURLSessionTask currentRequest_URL](self->super._task, "currentRequest_URL"), "password")))
  {
    v3 = -[NSURLAuthenticationChallenge initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:]([NSURLAuthenticationChallenge alloc], "initWithProtectionSpace:proposedCredential:previousFailureCount:failureResponse:error:sender:", -[NSURLAuthenticationChallenge protectionSpace](v3, "protectionSpace"), 0, 1, -[NSURLAuthenticationChallenge failureResponse](v3, "failureResponse"), -[NSURLAuthenticationChallenge error](v3, "error"), -[NSURLAuthenticationChallenge sender](v3, "sender"));
  }
  if ((v10 & 1) == 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56____NSCFURLLocalSessionConnection__didReceiveChallenge___block_invoke_3;
    v13[3] = &unk_1E14F7A98;
    v13[4] = v3;
    v13[5] = self;
    -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v13);
  }
}

- (void)_didSendBodyData:(UploadProgressInfo *)a3
{
  _QWORD v3[5];
  UploadProgressInfo v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52____NSCFURLLocalSessionConnection__didSendBodyData___block_invoke;
  v3[3] = &unk_1E14F7AE8;
  v3[4] = self;
  v4 = *a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_didUseCachedResponse
{
  self->super._isFromCache = 1;
}

- (void)_tick_sniffNow
{
  _CFURLResponse *v2;
  NSObject *v3;
  uint64_t v4;
  const __CFData *v5;
  _OWORD *v6;
  const void *v7;
  uint64_t v8;
  BOOL v9;
  const __CFData *v10;
  char v11;

  if (a1)
  {
    v2 = (_CFURLResponse *)a1[20];
    v3 = a1[19];
    a1[20] = 0;
    a1[19] = 0;
    if (v3)
      CFRetain(v3);
    v4 = *(_QWORD *)(-[_CFURLResponse _inner](v2, "_inner") + 88);
    v5 = (const __CFData *)v3;
    if (v4)
    {
      v5 = (const __CFData *)v3;
      if (((*(unsigned __int16 *)(v4 + 297) | (*(unsigned __int8 *)(v4 + 299) << 16)) & 0x10000) != 0)
      {
        v6 = CFURLDataDecoderCreateWithResponse((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v2);
        v5 = (const __CFData *)v3;
        if (v6)
        {
          v7 = v6;
          v11 = 0;
          v8 = CFURLDataDecoderDecodeData((uint64_t)v6, (uint64_t)v3, (uint64_t)&v11);
          if (v8)
            v5 = (const __CFData *)v8;
          else
            v5 = (const __CFData *)v3;
          if (v3)
            v9 = v8 == 0;
          else
            v9 = 1;
          if (!v9)
          {
            v10 = (const __CFData *)v8;
            CFRelease(v3);
            v5 = v10;
          }
          CFRelease(v7);
        }
      }
    }
    URLResponse::guessMIMEType((URLResponse *)-[_CFURLResponse _inner](v2, "_inner"), v5);
    if (v5)
      CFRelease(v5);
    objc_msgSend(a1, "_didReceiveResponse:sniff:", v2, 0);
    objc_msgSend(a1, "_didReceiveData:", v3);

    dispatch_release(v3);
  }
}

- (void)_redirectRequest:(id)a3 redirectResponse:(id)a4 completion:(id)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __80____NSCFURLLocalSessionConnection__redirectRequest_redirectResponse_completion___block_invoke;
  v5[3] = &unk_1E14F7BD8;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = self;
  v5[7] = a5;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v5);
}

- (void)_willSendRequestForEstablishedConnection:(id)a3 completion:(id)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87____NSCFURLLocalSessionConnection__willSendRequestForEstablishedConnection_completion___block_invoke;
  v4[3] = &unk_1E14F7B10;
  v4[4] = self;
  v4[5] = a4;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
}

- (uint64_t)withLoaderOnQueue:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = *(_QWORD *)(result + 80);
    if (v3)
      v4 = v3 + 48;
    else
      v4 = 0;
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 136))(v4);
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 144))(v5);
  }
  return result;
}

- (void)dealloc
{
  URLConnectionLoader *loader;
  SessionConnectionLoadable *loaderClient;
  NSError *pendingError;
  NSObject *pendingData;
  NSObject *sniffData;
  NSURLResponse *sniffResponse;
  objc_super v9;

  loader = self->_loader;
  if (loader)
  {
    (*((void (**)(URLConnectionLoader *, SEL))loader->var0 + 1))(loader, a2);
    self->_loader = 0;
  }
  loaderClient = self->_loaderClient;
  if (loaderClient)
  {
    (*((void (**)(SessionConnectionLoadable *, SEL))loaderClient->var0 + 1))(loaderClient, a2);
    self->_loaderClient = 0;
  }
  pendingError = self->_pendingError;
  if (pendingError)
  {

    self->_pendingError = 0;
  }
  pendingData = self->_pendingData;
  if (pendingData)
  {
    dispatch_release(pendingData);
    self->_pendingData = 0;
  }
  sniffData = self->_sniffData;
  if (sniffData)
  {
    dispatch_release(sniffData);
    self->_sniffData = 0;
  }
  sniffResponse = self->_sniffResponse;
  if (sniffResponse)
  {

    self->_sniffResponse = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)__NSCFURLLocalSessionConnection;
  -[__NSCFURLSessionConnection dealloc](&v9, sel_dealloc);
}

- (__NSCFURLLocalSessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  __NSCFURLLocalSessionConnection *v5;
  const char *v6;
  __NSCFURLLocalSessionConnection *v7;
  NSURLSessionTask *task;
  uint64_t internalDelegateWrapper;
  const char *v10;
  char v11;
  NSURLSessionTask *v12;
  __NSCFURLSessionDelegateWrapper *publicDelegateWrapper;
  __NSCFURLSessionDelegateWrapper *v14;
  NSURLSessionTask *v15;
  __NSCFURLSessionDelegateWrapper *v16;
  NSURLSessionTask *v17;
  __NSCFURLSessionDelegateWrapper *v18;
  const char *v19;
  SessionConnectionLoadable *v20;
  const __CFAllocator *v21;
  URLConnectionLoader_Classic *v22;
  _QWORD v24[5];
  _BYTE v25[17];

  *(_QWORD *)&v25[1] = self;
  *(_QWORD *)&v25[9] = __NSCFURLLocalSessionConnection;
  v5 = (__NSCFURLLocalSessionConnection *)objc_msgSendSuper2((objc_super *)&v25[1], sel_initWithTask_delegate_delegateQueue_, a3, a4, a5);
  v7 = v5;
  if (v5)
  {
    v5->_didReceiveResponseDisposition = 0;
    v25[0] = 3;
    task = v5->super._task;
    if (task)
    {
      internalDelegateWrapper = (uint64_t)task->_internalDelegateWrapper;
      if (!internalDelegateWrapper)
        internalDelegateWrapper = (uint64_t)task->_publicDelegateWrapper;
    }
    else
    {
      internalDelegateWrapper = 0;
    }
    if (-[__NSCFURLSessionDelegateWrapper _willSendRequestForEstablishedConnection](internalDelegateWrapper, v6))
    {
      v11 = 11;
      v25[0] = 11;
    }
    else
    {
      v11 = 3;
    }
    v12 = v7->super._task;
    if (!v12)
      goto LABEL_33;
    publicDelegateWrapper = v12->_internalDelegateWrapper;
    if (publicDelegateWrapper || (publicDelegateWrapper = v12->_publicDelegateWrapper) != 0)
    {
      if ((-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withError](publicDelegateWrapper, v10) & 1) != 0|| (-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withError](publicDelegateWrapper->_fallbackDelegateWrapper, v10) & 1) != 0|| (-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withoutError](publicDelegateWrapper, v10) & 1) != 0|| (-[__NSCFURLSessionDelegateWrapper check__isWaitingForConnection_withoutError](publicDelegateWrapper->_fallbackDelegateWrapper, v10) & 1) != 0)
      {
        goto LABEL_20;
      }
      v12 = v7->super._task;
      if (!v12)
      {
LABEL_33:
        v20 = (SessionConnectionLoadable *)operator new();
        v20->var0 = (void **)&off_1E14ED570;
        v20->var1 = (void **)&unk_1E14ED670;
        v20->var2 = (void **)&unk_1E14ED730;
        v20->var3 = v7;
        v7->_loaderClient = v20;
        v21 = CFGetAllocator(v7);
        v22 = (URLConnectionLoader_Classic *)CFAllocatorAllocate(v21, 224, 0);
        *(_OWORD *)v22 = 0u;
        *((_OWORD *)v22 + 1) = 0u;
        *((_OWORD *)v22 + 2) = 0u;
        *((_OWORD *)v22 + 3) = 0u;
        *((_OWORD *)v22 + 4) = 0u;
        *((_OWORD *)v22 + 5) = 0u;
        *((_OWORD *)v22 + 6) = 0u;
        *((_OWORD *)v22 + 7) = 0u;
        *((_OWORD *)v22 + 8) = 0u;
        *((_OWORD *)v22 + 9) = 0u;
        *((_OWORD *)v22 + 10) = 0u;
        *((_OWORD *)v22 + 11) = 0u;
        *((_OWORD *)v22 + 12) = 0u;
        *((_OWORD *)v22 + 13) = 0u;
        URLConnectionLoader_Classic::URLConnectionLoader_Classic(v22, (InterfaceRequiredForLoader *)v7->_loaderClient, (const ConfigFlags *)v25, (__NSURLSessionLocal *)-[NSURLSessionTask session](v7->super._task, "session"), v7->super._workQueue);
        v7->_loader = (URLConnectionLoader *)v22;
        v7->_state = 0;
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __71____NSCFURLLocalSessionConnection_initWithTask_delegate_delegateQueue___block_invoke;
        v24[3] = &unk_1E14FE118;
        v24[4] = v7;
        -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v7, (const char *)v24);
        return v7;
      }
    }
    v14 = v12->_internalDelegateWrapper;
    if (!v14 && (v14 = v12->_publicDelegateWrapper) == 0
      || (-[__NSCFURLSessionDelegateWrapper check_isWaitingForConnectivity]((unsigned __int8 *)v14, v10) & 1) == 0
      && !-[__NSCFURLSessionDelegateWrapper check_isWaitingForConnectivity]((unsigned __int8 *)v14->_fallbackDelegateWrapper, v10))
    {
LABEL_21:
      v15 = v7->super._task;
      if (v15)
      {
        v16 = v15->_internalDelegateWrapper;
        if ((v16 || (v16 = v15->_publicDelegateWrapper) != 0)
          && ((-[__NSCFURLSessionDelegateWrapper check__conditionalRequirementsChanged]((unsigned __int8 *)v16, v10) & 1) != 0
           || -[__NSCFURLSessionDelegateWrapper check__conditionalRequirementsChanged]((unsigned __int8 *)v16->_fallbackDelegateWrapper, v10)))
        {
          v11 |= 0x20u;
          v25[0] = v11;
        }
        v17 = v7->super._task;
        if (v17)
        {
          v18 = v17->_internalDelegateWrapper;
          if ((v18 || (v18 = v17->_publicDelegateWrapper) != 0)
            && ((-[__NSCFURLSessionDelegateWrapper check__alternatePathAvailable]((unsigned __int8 *)v18, v10) & 1) != 0
             || -[__NSCFURLSessionDelegateWrapper check__alternatePathAvailable]((unsigned __int8 *)v18->_fallbackDelegateWrapper, v19)))
          {
            v25[0] = v11 | 0x40;
          }
        }
      }
      goto LABEL_33;
    }
LABEL_20:
    v11 |= 0x10u;
    v25[0] = v11;
    goto LABEL_21;
  }
  return v7;
}

- (void)setPriorityHint:(float)a3 incremental:(BOOL)a4
{
  _QWORD v4[4];
  float v5;
  BOOL v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63____NSCFURLLocalSessionConnection_setPriorityHint_incremental___block_invoke;
  v4[3] = &__block_descriptor_37_e29_v16__0__LoaderInterface_____8l;
  v5 = a3;
  v6 = a4;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v4);
}

- (void)setIsDownload:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49____NSCFURLLocalSessionConnection_setIsDownload___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__LoaderInterface_____8l;
  v4 = a3;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v3);
}

- (void)setBytesPerSecondLimit:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58____NSCFURLLocalSessionConnection_setBytesPerSecondLimit___block_invoke;
  v3[3] = &__block_descriptor_40_e29_v16__0__LoaderInterface_____8l;
  v3[4] = a3;
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", v3);
}

- (void)expectedProgressTargetChanged
{
  -[__NSCFURLLocalSessionConnection withLoaderAsync:](self, "withLoaderAsync:", &__block_literal_global_3465);
}

- (void)_didReceiveInformationalResponse:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68____NSCFURLLocalSessionConnection__didReceiveInformationalResponse___block_invoke;
  v3[3] = &unk_1E14F7A98;
  v3[4] = a3;
  v3[5] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_connectionIsWaitingWithReason:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66____NSCFURLLocalSessionConnection__connectionIsWaitingWithReason___block_invoke;
  v3[3] = &unk_1E14F7B38;
  v3[4] = self;
  v3[5] = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_conditionalRequirementsChanged:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67____NSCFURLLocalSessionConnection__conditionalRequirementsChanged___block_invoke;
  v3[3] = &unk_1E14F7B60;
  v4 = a3;
  v3[4] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_alternatePathAvailable:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59____NSCFURLLocalSessionConnection__alternatePathAvailable___block_invoke;
  v3[3] = &unk_1E14F7B88;
  v3[4] = self;
  v4 = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_needNewBodyStream
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53____NSCFURLLocalSessionConnection__needNewBodyStream__block_invoke;
  v2[3] = &unk_1E14F7A48;
  v2[4] = self;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v2);
}

- (void)_needNewBodyStreamFromOffset:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64____NSCFURLLocalSessionConnection__needNewBodyStreamFromOffset___block_invoke;
  v3[3] = &unk_1E14F7B38;
  v3[4] = self;
  v3[5] = a3;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v3);
}

- (void)_capturedSocketInputStream:(id)a3 outputStream:(id)a4
{
  _QWORD v4[7];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75____NSCFURLLocalSessionConnection__capturedSocketInputStream_outputStream___block_invoke;
  v4[3] = &unk_1E14F7CC8;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v4);
}

- (void)_captureTransportConnection:(shared_ptr<TransportConnection>)a3 extraBytes:(id)a4
{
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v11[7];
  std::__shared_weak_count *v12;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3321888768;
  v11[2] = __74____NSCFURLLocalSessionConnection__captureTransportConnection_extraBytes___block_invoke;
  v11[3] = &unk_1E14F3E80;
  v5 = *(_QWORD *)a3.__ptr_;
  v4 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v11[4] = self;
  v11[6] = v5;
  v12 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v11[5] = a3.__cntrl_;
  -[__NSCFURLLocalSessionConnection withDelegateAndPendingCompletion:]((uint64_t)self, (uint64_t)v11);
  v8 = v12;
  if (v12)
  {
    v9 = (unint64_t *)&v12->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

@end
