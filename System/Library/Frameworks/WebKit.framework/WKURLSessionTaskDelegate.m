@implementation WKURLSessionTaskDelegate

- (WKURLSessionTaskDelegate)initWithTask:(id)a3 identifier:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long long>)a4 :(void *)a5 ObjectIdentifierMainThreadAccessTraits<uint64_t> :DataTaskIdentifierType session:
{
  WKURLSessionTaskDelegate *v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *m_ptr;
  unsigned int v13;
  unsigned int v14;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_signpost_id_t v22;
  os_signpost_id_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  uint8_t buf[4];
  _BYTE v28[10];
  _BYTE v29[10];
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)WKURLSessionTaskDelegate;
  v8 = -[WKURLSessionTaskDelegate init](&v26, sel_init);
  if (v8)
  {
    if (kdebug_is_enabled())
    {
      v16 = *MEMORY[0x1E0CBE150] == 0;
      v17 = WTFSignpostLogHandle();
      v18 = v17;
      if (v16)
      {
        v22 = os_signpost_id_make_with_pointer(v17, v8);
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v23 = v22;
          if (os_signpost_enabled(v18))
          {
            v24 = objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "HTTPMethod");
            v25 = objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "URL");
            *(_DWORD *)buf = 138543619;
            *(_QWORD *)v28 = v24;
            *(_WORD *)&v28[8] = 2113;
            *(_QWORD *)v29 = v25;
            _os_signpost_emit_with_name_impl(&dword_196BCC000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v23, "DataTask", "%{public}@ %{private}@", buf, 0x16u);
          }
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v19 = WTFCurrentContinuousTime();
        v20 = objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "HTTPMethod");
        v21 = objc_msgSend((id)objc_msgSend(a3, "originalRequest"), "URL");
        *(_DWORD *)buf = 67110403;
        *(_DWORD *)v28 = 1;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = 0;
        *(_WORD *)v29 = 2048;
        *(_QWORD *)&v29[2] = v8;
        v30 = 2048;
        v31 = v19;
        v32 = 2114;
        v33 = v20;
        v34 = 2113;
        v35 = v21;
        _os_log_impl(&dword_196BCC000, v18, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu %{public}@ %{private}@", buf, 0x36u);
      }
    }
    v8->_identifier = a4;
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a5 + 2, (uint64_t)a5);
    v10 = (unsigned int *)*((_QWORD *)a5 + 1);
    if (v10)
    {
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
    }
    m_ptr = (unsigned int *)v8->_session.m_impl.m_ptr;
    v8->_session.m_impl.m_ptr = (DefaultWeakPtrImpl *)v10;
    if (m_ptr)
    {
      do
      {
        v13 = __ldaxr(m_ptr);
        v14 = v13 - 1;
      }
      while (__stlxr(v14, m_ptr));
      if (!v14)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v9);
      }
    }
  }
  return v8;
}

- (void)dealloc
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  objc_super v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  int v11;
  __int16 v12;
  WKURLSessionTaskDelegate *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (kdebug_is_enabled())
  {
    v3 = *MEMORY[0x1E0CBE150];
    v4 = WTFSignpostLogHandle();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        v9 = 2;
        v10 = 1024;
        v11 = 0;
        v12 = 2048;
        v13 = self;
        v14 = 2048;
        v15 = WTFCurrentContinuousTime();
        _os_log_impl(&dword_196BCC000, v5, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu ", buf, 0x22u);
      }
    }
    else
    {
      if (self)
      {
        v6 = os_signpost_id_make_with_pointer(v4, self);
        if (v6 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_2;
      }
      else
      {
        v6 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_196BCC000, v5, OS_SIGNPOST_INTERVAL_END, v6, "DataTask", (const char *)&unk_1979B1919, buf, 2u);
      }
    }
  }
LABEL_2:
  v7.receiver = self;
  v7.super_class = (Class)WKURLSessionTaskDelegate;
  -[WKURLSessionTaskDelegate dealloc](&v7, sel_dealloc);
}

- (void)connection
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v3;

  m_ptr = self->_session.m_impl.m_ptr;
  if (m_ptr && (v3 = *((_QWORD *)m_ptr + 1)) != 0)
    return *(void **)(*(_QWORD *)(v3 + 32) + 32);
  else
    return 0;
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  IPC::Encoder *v17;
  WTF *v18;
  void *v19;
  WTF::StringImpl *v20;
  CFTypeRef v21;
  CFTypeRef v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  uint64_t v27[2];
  IPC::Encoder *v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  WKURLSessionTaskDelegate *v34;
  __int16 v35;
  uint64_t v36;
  CFTypeRef v37;
  CFTypeRef cf;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (kdebug_is_enabled())
  {
    v23 = *MEMORY[0x1E0CBE150];
    v24 = WTFSignpostLogHandle();
    v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        v30 = 0;
        v31 = 1024;
        v32 = 0;
        v33 = 2048;
        v34 = self;
        v35 = 2048;
        v36 = WTFCurrentContinuousTime();
        _os_log_impl(&dword_196BCC000, v25, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received challenge", buf, 0x22u);
      }
    }
    else
    {
      if (self)
      {
        v26 = os_signpost_id_make_with_pointer(v24, self);
        if (v26 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_2;
      }
      else
      {
        v26 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_196BCC000, v25, OS_SIGNPOST_EVENT, v26, "DataTask", "received challenge", buf, 2u);
      }
    }
  }
LABEL_2:
  v9 = -[WKURLSessionTaskDelegate connection](self, "connection");
  v10 = v9;
  if (v9)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((unsigned __int8 **)v9);
    MEMORY[0x19AEB2658](buf, a5);
    v11 = _Block_copy(a6);
    v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v12 = off_1E34B6648;
    v12[1] = v11;
    _Block_release(0);
    v13 = WTF::ObjectIdentifierGeneric<IPC::AsyncReplyIDType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>::generate();
    v14 = WTF::fastMalloc((WTF *)0x240);
    *(_WORD *)v14 = 305;
    *(_QWORD *)(v14 + 8) = 0;
    *(_QWORD *)(v14 + 528) = v14 + 16;
    *(_QWORD *)(v14 + 536) = v14 + 16;
    *(_OWORD *)(v14 + 544) = xmmword_1978CE2D0;
    *(_OWORD *)(v14 + 560) = 0u;
    IPC::Encoder::encodeHeader((IPC::Encoder *)v14);
    v28 = (IPC::Encoder *)v14;
    IPC::ArgumentCoder<WebKit::CallbackID,void>::encode((IPC::Encoder *)v14, (uint64_t *)&self->_identifier);
    IPC::ArgumentCoder<WebCore::AuthenticationChallenge,void>::encode((IPC::Encoder *)v14, (WebCore::AuthenticationChallengeBase *)buf);
    v27[0] = (uint64_t)v12;
    v27[1] = v13;
    IPC::Connection::sendMessageWithAsyncReply(v10, &v28, v27, 0, 0);
    v16 = v27[0];
    v27[0] = 0;
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    v17 = v28;
    v28 = 0;
    if (v17)
    {
      IPC::Encoder::~Encoder(v17, v15);
      WTF::fastFree(v18, v19);
    }
    _Block_release(0);
    v21 = cf;
    cf = 0;
    if (v21)
      CFRelease(v21);
    v22 = v37;
    v37 = 0;
    if (v22)
      CFRelease(v22);
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)buf, v20);
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::Connection,(WTF::DestructionThread)2>::deref((unsigned __int8 **)v10);
  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))a6 + 2))(a6, 3, 0);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  IPC::Encoder *v19;
  WTF *v20;
  void *v21;
  CFTypeRef v22;
  WTF::StringImpl *v23;
  CFTypeRef v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  _BYTE v29[192];
  CFTypeRef v30;
  uint64_t v31[2];
  IPC::Encoder *v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  WKURLSessionTaskDelegate *v38;
  __int16 v39;
  uint64_t v40;
  CFTypeRef cf;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (kdebug_is_enabled())
  {
    v25 = *MEMORY[0x1E0CBE150];
    v26 = WTFSignpostLogHandle();
    v27 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        v34 = 0;
        v35 = 1024;
        v36 = 0;
        v37 = 2048;
        v38 = self;
        v39 = 2048;
        v40 = WTFCurrentContinuousTime();
        _os_log_impl(&dword_196BCC000, v27, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu redirect", buf, 0x22u);
      }
    }
    else
    {
      if (self)
      {
        v28 = os_signpost_id_make_with_pointer(v26, self);
        if (v28 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_2;
      }
      else
      {
        v28 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v27))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_196BCC000, v27, OS_SIGNPOST_EVENT, v28, "DataTask", "redirect", buf, 2u);
      }
    }
  }
LABEL_2:
  v11 = -[WKURLSessionTaskDelegate connection](self, "connection");
  v12 = v11;
  if (v11)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((unsigned __int8 **)v11);
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)buf, (NSURLResponse *)a5);
    MEMORY[0x19AEAEC20](v29, a6);
    v13 = _Block_copy(a7);
    if (a6)
      CFRetain(a6);
    v14 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v14 = off_1E34B6670;
    v14[1] = v13;
    v14[2] = a6;
    _Block_release(0);
    v15 = WTF::ObjectIdentifierGeneric<IPC::AsyncReplyIDType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>::generate();
    v16 = WTF::fastMalloc((WTF *)0x240);
    *(_WORD *)v16 = 306;
    *(_QWORD *)(v16 + 8) = 0;
    *(_QWORD *)(v16 + 528) = v16 + 16;
    *(_QWORD *)(v16 + 536) = v16 + 16;
    *(_OWORD *)(v16 + 544) = xmmword_1978CE2D0;
    *(_OWORD *)(v16 + 560) = 0u;
    IPC::Encoder::encodeHeader((IPC::Encoder *)v16);
    v32 = (IPC::Encoder *)v16;
    IPC::ArgumentCoder<WebKit::CallbackID,void>::encode((IPC::Encoder *)v16, (uint64_t *)&self->_identifier);
    IPC::ArgumentCoder<WebCore::ResourceResponse,void>::encode((IPC::Encoder *)v16, (WebCore::ResourceResponseBase *)buf);
    IPC::ArgumentCoder<WebCore::ResourceRequest,void>::encode((IPC::Encoder *)v16, (WebCore::ResourceRequest *)v29);
    v31[0] = (uint64_t)v14;
    v31[1] = v15;
    IPC::Connection::sendMessageWithAsyncReply(v12, &v32, v31, 0, 0);
    v18 = v31[0];
    v31[0] = 0;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
    v19 = v32;
    v32 = 0;
    if (v19)
    {
      IPC::Encoder::~Encoder(v19, v17);
      WTF::fastFree(v20, v21);
    }
    _Block_release(0);
    v22 = v30;
    v30 = 0;
    if (v22)
      CFRelease(v22);
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v29);
    v24 = cf;
    cf = 0;
    if (v24)
      CFRelease(v24);
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)buf, v23);
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::Connection,(WTF::DestructionThread)2>::deref((unsigned __int8 **)v12);
  }
  else
  {
    (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  IPC::Encoder *v17;
  WTF *v18;
  void *v19;
  WTF::StringImpl *v20;
  CFTypeRef v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  uint64_t v26[2];
  IPC::Encoder *v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  WKURLSessionTaskDelegate *v33;
  __int16 v34;
  uint64_t v35;
  CFTypeRef cf;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (kdebug_is_enabled())
  {
    v22 = *MEMORY[0x1E0CBE150];
    v23 = WTFSignpostLogHandle();
    v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109888;
        v29 = 0;
        v30 = 1024;
        v31 = 0;
        v32 = 2048;
        v33 = self;
        v34 = 2048;
        v35 = WTFCurrentContinuousTime();
        _os_log_impl(&dword_196BCC000, v24, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received response headers", buf, 0x22u);
      }
    }
    else
    {
      if (self)
      {
        v25 = os_signpost_id_make_with_pointer(v23, self);
        if (v25 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_2;
      }
      else
      {
        v25 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_196BCC000, v24, OS_SIGNPOST_EVENT, v25, "DataTask", "received response headers", buf, 2u);
      }
    }
  }
LABEL_2:
  v9 = -[WKURLSessionTaskDelegate connection](self, "connection");
  v10 = v9;
  if (v9)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref((unsigned __int8 **)v9);
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)buf, (NSURLResponse *)a5);
    v11 = _Block_copy(a6);
    v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v12 = off_1E34B6698;
    v12[1] = v11;
    _Block_release(0);
    v13 = WTF::ObjectIdentifierGeneric<IPC::AsyncReplyIDType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>::generate();
    v14 = WTF::fastMalloc((WTF *)0x240);
    *(_WORD *)v14 = 304;
    *(_QWORD *)(v14 + 8) = 0;
    *(_QWORD *)(v14 + 528) = v14 + 16;
    *(_QWORD *)(v14 + 536) = v14 + 16;
    *(_OWORD *)(v14 + 544) = xmmword_1978CE2D0;
    *(_OWORD *)(v14 + 560) = 0u;
    IPC::Encoder::encodeHeader((IPC::Encoder *)v14);
    v27 = (IPC::Encoder *)v14;
    IPC::ArgumentCoder<WebKit::CallbackID,void>::encode((IPC::Encoder *)v14, (uint64_t *)&self->_identifier);
    IPC::ArgumentCoder<WebCore::ResourceResponse,void>::encode((IPC::Encoder *)v14, (WebCore::ResourceResponseBase *)buf);
    v26[0] = (uint64_t)v12;
    v26[1] = v13;
    IPC::Connection::sendMessageWithAsyncReply(v10, &v27, v26, 0, 0);
    v16 = v26[0];
    v26[0] = 0;
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    v17 = v27;
    v27 = 0;
    if (v17)
    {
      IPC::Encoder::~Encoder(v17, v15);
      WTF::fastFree(v18, v19);
    }
    _Block_release(0);
    v21 = cf;
    cf = 0;
    if (v21)
      CFRelease(v21);
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)buf, v20);
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::Connection,(WTF::DestructionThread)2>::deref((unsigned __int8 **)v10);
  }
  else
  {
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  unsigned __int8 **v7;
  unsigned __int8 **v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  _QWORD v15[2];
  __int128 buf;
  WKURLSessionTaskDelegate *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (kdebug_is_enabled())
  {
    v11 = *MEMORY[0x1E0CBE150];
    v12 = WTFSignpostLogHandle();
    v13 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)&buf = 67110144;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = 0;
        HIWORD(buf) = 2048;
        v17 = self;
        v18 = 2048;
        v19 = WTFCurrentContinuousTime();
        v20 = 2048;
        v21 = objc_msgSend(a5, "length");
        _os_log_impl(&dword_196BCC000, v13, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu received %zu bytes", (uint8_t *)&buf, 0x2Cu);
      }
    }
    else
    {
      if (self)
      {
        v14 = os_signpost_id_make_with_pointer(v12, self);
        if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_2;
      }
      else
      {
        v14 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v13))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = objc_msgSend(a5, "length");
        _os_signpost_emit_with_name_impl(&dword_196BCC000, v13, OS_SIGNPOST_EVENT, v14, "DataTask", "received %zu bytes", (uint8_t *)&buf, 0xCu);
      }
    }
  }
LABEL_2:
  v7 = -[WKURLSessionTaskDelegate connection](self, "connection");
  v8 = v7;
  if (v7)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref(v7);
    if (a5)
    {
      v9 = objc_msgSend(a5, "bytes");
      v10 = objc_msgSend(a5, "length");
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    v15[0] = v9;
    v15[1] = v10;
    *(_QWORD *)&buf = &self->_identifier;
    *((_QWORD *)&buf + 1) = v15;
    IPC::Connection::send<Messages::NetworkProcessProxy::DataTaskDidReceiveData>((uint64_t)v8, (uint64_t)&buf, 0, 0, 0);
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::Connection,(WTF::DestructionThread)2>::deref(v8);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  unsigned __int8 **v7;
  unsigned __int8 **v8;
  WTF::StringImpl *v9;
  CFTypeRef v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  _QWORD v20[2];
  uint8_t buf[8];
  WTF::StringImpl *v22;
  WKURLSessionTaskDelegate *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  _BOOL4 v27;
  WTF::StringImpl *v28;
  CFTypeRef cf;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (kdebug_is_enabled())
  {
    v16 = *MEMORY[0x1E0CBE150];
    v17 = WTFSignpostLogHandle();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110144;
        *(_DWORD *)&buf[4] = 0;
        LOWORD(v22) = 1024;
        *(_DWORD *)((char *)&v22 + 2) = 0;
        HIWORD(v22) = 2048;
        v23 = self;
        v24 = 2048;
        v25 = WTFCurrentContinuousTime();
        v26 = 1024;
        v27 = a5 != 0;
        _os_log_impl(&dword_196BCC000, v18, OS_LOG_TYPE_DEFAULT, "type=%d name=%d p=%lu ts=%llu completed with error: %d", buf, 0x28u);
      }
    }
    else
    {
      if (self)
      {
        v19 = os_signpost_id_make_with_pointer(v17, self);
        if (v19 - 1 > 0xFFFFFFFFFFFFFFFDLL)
          goto LABEL_2;
      }
      else
      {
        v19 = 0xEEEEB0B5B2B2EEEELL;
      }
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a5 != 0;
        _os_signpost_emit_with_name_impl(&dword_196BCC000, v18, OS_SIGNPOST_EVENT, v19, "DataTask", "completed with error: %d", buf, 8u);
      }
    }
  }
LABEL_2:
  v7 = -[WKURLSessionTaskDelegate connection](self, "connection");
  v8 = v7;
  if (v7)
  {
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::WorkQueueMessageReceiver,(WTF::DestructionThread)0>::ref(v7);
    MEMORY[0x19AEADCC0](buf, a5);
    v20[0] = &self->_identifier;
    v20[1] = buf;
    IPC::Connection::send<Messages::NetworkProcessProxy::DataTaskDidCompleteWithError>((uint64_t)v8, (uint64_t)v20, 0, 0, 0);
    v10 = cf;
    cf = 0;
    if (v10)
      CFRelease(v10);
    v11 = v28;
    v28 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v9);
      else
        *(_DWORD *)v11 -= 2;
    }
    v12 = v22;
    v22 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v9);
      else
        *(_DWORD *)v12 -= 2;
    }
    v13 = *(WTF::StringImpl **)buf;
    *(_QWORD *)buf = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v9);
      else
        *(_DWORD *)v13 -= 2;
    }
    m_ptr = self->_session.m_impl.m_ptr;
    if (m_ptr)
    {
      v15 = *((_QWORD *)m_ptr + 1);
      if (v15)
        WebKit::NetworkSessionCocoa::removeDataTask(v15, self->_identifier.m_identifier);
    }
    WTF::ThreadSafeRefCountedAndCanMakeThreadSafeWeakPtr<IPC::Connection,(WTF::DestructionThread)2>::deref(v8);
  }
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_session.m_impl.m_ptr;
  self->_session.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (uint64_t)URLSession:task:didReceiveChallenge:completionHandler:
{
  void *v2;

  *a1 = off_1E34B6648;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (WTF::StringImpl)URLSession:task:didReceiveChallenge:completionHandler:
{
  uint64_t v2;
  unsigned __int16 v4;
  char v6;
  WTF::StringImpl *v7;
  __int128 v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  _BYTE v14[8];
  __int128 v15;
  char v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  char v20;
  uint64_t v21;
  char v22;

  v2 = a1 + 8;
  if (!a2 || !*a2)
    return IPC::Connection::cancelReply<Messages::NetworkProcessProxy::DataTaskReceivedChallenge,-[WKURLSessionTaskDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_0>(a1 + 8);
  v4 = IPC::Decoder::decode<WebKit::AuthenticationChallengeDisposition>(a2);
  if (v4 <= 0xFFu)
  {
    v14[0] = 0;
    v18 = 0;
LABEL_9:
    v10 = (WTF::StringImpl *)*a2;
    v11 = a2[1];
    *a2 = 0;
    a2[1] = 0;
    v12 = a2[3];
    if (v12 && v11)
      (*(void (**)(uint64_t, WTF::StringImpl *))(*(_QWORD *)v12 + 16))(v12, v10);
    goto LABEL_10;
  }
  v6 = v4;
  IPC::Decoder::decode<WebCore::Credential>(a2, (uint64_t)&v19);
  if (!v22)
  {
    v14[0] = 0;
    v18 = 0;
    std::__optional_destruct_base<WebCore::Credential,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v19, v7);
    goto LABEL_9;
  }
  v8 = v19;
  v19 = 0uLL;
  v15 = v8;
  v16 = v20;
  v9 = v21;
  v21 = 0;
  v17 = v9;
  v14[0] = v6;
  v18 = 1;
  std::__optional_destruct_base<WebCore::Credential,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v19, v7);
LABEL_10:
  if (v18)
  {
    WebKit::fromAuthenticationChallengeDisposition(v14[0]);
    WebCore::Credential::nsCredential((WebCore::Credential *)&v15);
    (*(void (**)(void))(*(_QWORD *)v2 + 16))();
    return (WTF::StringImpl *)std::__optional_destruct_base<std::tuple<WebKit::AuthenticationChallengeDisposition,WebCore::Credential>,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v14, v13);
  }
  else
  {
    std::__optional_destruct_base<std::tuple<WebKit::AuthenticationChallengeDisposition,WebCore::Credential>,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v14, v10);
    return IPC::Connection::cancelReply<Messages::NetworkProcessProxy::DataTaskReceivedChallenge,-[WKURLSessionTaskDelegate URLSession:task:didReceiveChallenge:completionHandler:]::$_0>(v2);
  }
}

- (WTF::StringImpl)URLSession:(uint64_t)a1 task:didReceiveChallenge:completionHandler:
{
  WTF::StringImpl *v2;
  CFTypeRef v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *result;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  CFTypeRef cf;

  WebCore::CredentialBase::CredentialBase((WebCore::CredentialBase *)&v6);
  cf = 0;
  WebKit::fromAuthenticationChallengeDisposition(0);
  WebCore::Credential::nsCredential((WebCore::Credential *)&v6);
  (*(void (**)(void))(*(_QWORD *)a1 + 16))();
  v3 = cf;
  cf = 0;
  if (v3)
    CFRelease(v3);
  v4 = v7;
  v7 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v2);
    else
      *(_DWORD *)v4 -= 2;
  }
  result = v6;
  v6 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

- (uint64_t)URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:
{
  uint64_t (*v3)(void);

  if (a2 && *a2 && (unsigned __int16)IPC::Decoder::decode<std::tuple<BOOL>>(a2) >= 0x100u)
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16);
  else
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16);
  return v3();
}

- (uint64_t)URLSession:dataTask:didReceiveResponse:completionHandler:
{
  uint64_t (*v3)(void);

  if (a2 && *a2 && (unsigned __int16)IPC::Decoder::decode<std::tuple<BOOL>>(a2) >= 0x100u)
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16);
  else
    v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16);
  return v3();
}

@end
