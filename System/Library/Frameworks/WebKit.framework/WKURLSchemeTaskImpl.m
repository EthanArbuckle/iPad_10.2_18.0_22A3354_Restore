@implementation WKURLSchemeTaskImpl

- (WKURLSchemeTaskImpl)init
{
  WKURLSchemeTaskImpl *result;

  result = (WKURLSchemeTaskImpl *)80;
  __break(0xC471u);
  return result;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::WebURLSchemeTask::~WebURLSchemeTask((WebKit::WebURLSchemeTask *)&self->_urlSchemeTask, v4);
    v5.receiver = self;
    v5.super_class = (Class)WKURLSchemeTaskImpl;
    -[WKURLSchemeTaskImpl dealloc](&v5, sel_dealloc);
  }
}

- (NSURLRequest)request
{
  return (NSURLRequest *)WebKit::WebURLSchemeTask::nsRequest((WebKit::WebURLSchemeTask *)&self->_urlSchemeTask);
}

- (BOOL)_requestOnlyIfCached
{
  return objc_msgSend((id)WebKit::WebURLSchemeTask::nsRequest((WebKit::WebURLSchemeTask *)&self->_urlSchemeTask), "cachePolicy") == 3;
}

- (void)_willPerformRedirection:(id)a3 newRequest:(id)a4 completionHandler:(id)a5
{
  void *v9;
  _QWORD *v10;
  uint64_t ExceptionTypeFromMainRunLoop;
  _QWORD *v12;

  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  v9 = _Block_copy(a5);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x40);
  *v10 = off_1E34BCE80;
  v10[1] = self;
  v10[2] = self;
  v10[3] = a3;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a4;
  v10[7] = v9;
  v12 = v10;
  ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v12);
  if (v12)
    (*(void (**)(_QWORD *))(*v12 + 8))(v12);
  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
  _Block_release(0);
}

- (void)didReceiveResponse:(id)a3
{
  _QWORD *v5;
  uint64_t ExceptionTypeFromMainRunLoop;
  _QWORD *v7;

  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v5 = &off_1E34BCED0;
  v5[1] = self;
  v5[2] = self;
  v5[3] = a3;
  v5[4] = a3;
  v7 = v5;
  ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v7);
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (void)didReceiveData:(id)a3
{
  _QWORD *v5;
  uint64_t ExceptionTypeFromMainRunLoop;
  _QWORD *v7;

  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v5 = &off_1E34BCEF8;
  v5[1] = self;
  v5[2] = self;
  v5[3] = a3;
  v5[4] = a3;
  v7 = v5;
  ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v7);
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (void)didFinish
{
  _QWORD *v3;
  uint64_t ExceptionTypeFromMainRunLoop;
  _QWORD *v5;

  if (self)
    CFRetain(self);
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v3 = &off_1E34BCF20;
  v3[1] = self;
  v3[2] = self;
  v5 = v3;
  ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v5);
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (void)didFailWithError:(id)a3
{
  _QWORD *v5;
  uint64_t ExceptionTypeFromMainRunLoop;
  _QWORD *v7;

  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v5 = &off_1E34BCF48;
  v5[1] = self;
  v5[2] = self;
  v5[3] = a3;
  v5[4] = a3;
  v7 = v5;
  ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v7);
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (void)_didPerformRedirection:(id)a3 newRequest:(id)a4
{
  _QWORD *v7;
  uint64_t ExceptionTypeFromMainRunLoop;
  _QWORD *v9;

  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x38);
  *v7 = &off_1E34BCF70;
  v7[1] = self;
  v7[2] = self;
  v7[3] = a3;
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = a4;
  v9 = v7;
  ExceptionTypeFromMainRunLoop = getExceptionTypeFromMainRunLoop((uint64_t *)&v9);
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
  raiseExceptionIfNecessary(ExceptionTypeFromMainRunLoop);
}

- (WKFrameInfo)_frame
{
  return *(WKFrameInfo **)(*(_QWORD *)&self[4]._urlSchemeTask.data.__lx[32] + 8);
}

- (Object)_apiObject
{
  return (Object *)&self->_urlSchemeTask;
}

- (uint64_t)_willPerformRedirection:(uint64_t)a1 newRequest:completionHandler:
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  CFTypeRef v7;
  WTF::StringImpl *v8;
  CFTypeRef v9;
  _QWORD *v11;
  _BYTE v12[192];
  CFTypeRef v13;
  _BYTE v14[240];
  CFTypeRef cf;

  v2 = *(_QWORD *)(a1 + 16);
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v14, *(NSURLResponse **)(a1 + 32));
  MEMORY[0x19AEAEC20](v12, *(_QWORD *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = 0;
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v4 = off_1E34BCEA8;
  v4[1] = v3;
  v11 = v4;
  v5 = WebKit::WebURLSchemeTask::willPerformRedirection(v2 + 8, (uint64_t)v14, (uint64_t)v12, (uint64_t *)&v11);
  v6 = (uint64_t)v11;
  v11 = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  _Block_release(0);
  v7 = v13;
  v13 = 0;
  if (v7)
    CFRelease(v7);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v12);
  v9 = cf;
  cf = 0;
  if (v9)
    CFRelease(v9);
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v14, v8);
  return v5;
}

- (uint64_t)_willPerformRedirection:newRequest:completionHandler:
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = WebCore::ResourceRequest::nsURLRequest();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);
}

- (_QWORD)didReceiveResponse:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34BCED0;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)didReceiveResponse:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34BCED0;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)didReceiveResponse:(uint64_t)a1
{
  WebKit::WebURLSchemeTask *v1;
  WTF::StringImpl *v2;
  uint64_t v3;
  CFTypeRef v4;
  _BYTE v6[240];
  CFTypeRef cf;

  v1 = (WebKit::WebURLSchemeTask *)(*(_QWORD *)(a1 + 16) + 8);
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v6, *(NSURLResponse **)(a1 + 32));
  v3 = WebKit::WebURLSchemeTask::didReceiveResponse(v1, (const WebCore::ResourceResponse *)v6);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v6, v2);
  return v3;
}

- (_QWORD)didReceiveData:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34BCEF8;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)didReceiveData:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34BCEF8;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)didReceiveData:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int *v7;

  v2 = *(_QWORD *)(a1 + 16) + 8;
  WebCore::SharedBuffer::create<NSData *&>((WebCore::FragmentedSharedBuffer **)(a1 + 32), a2, (uint64_t *)&v7);
  v4 = WebKit::WebURLSchemeTask::didReceiveData(v2, (uint64_t)&v7);
  v5 = v7;
  v7 = 0;
  if (v5)
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v5, v3);
  return v4;
}

- (_QWORD)didFinish
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34BCF20;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)didFinish
{
  WebKit::WebURLSchemeTask *v1;
  WTF::StringImpl *v2;
  uint64_t v3;
  CFTypeRef v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  CFTypeRef cf;
  char v13;

  v1 = (WebKit::WebURLSchemeTask *)(*(_QWORD *)(a1 + 16) + 8);
  WebCore::ResourceErrorBase::ResourceErrorBase((uint64_t)&v9, 0);
  cf = 0;
  v13 = 1;
  v3 = WebKit::WebURLSchemeTask::didComplete(v1, (const WebCore::ResourceError *)&v9);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  v5 = v11;
  v11 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v2);
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v2);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v2);
    else
      *(_DWORD *)v7 -= 2;
  }
  return v3;
}

- (_QWORD)didFailWithError:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34BCF48;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)didFailWithError:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34BCF48;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)didFailWithError:(uint64_t)a1
{
  WebKit::WebURLSchemeTask *v1;
  WTF::StringImpl *v2;
  uint64_t v3;
  CFTypeRef v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  CFTypeRef cf;

  v1 = (WebKit::WebURLSchemeTask *)(*(_QWORD *)(a1 + 16) + 8);
  MEMORY[0x19AEADCC0](&v9, *(_QWORD *)(a1 + 32));
  v3 = WebKit::WebURLSchemeTask::didComplete(v1, (const WebCore::ResourceError *)&v9);
  v4 = cf;
  cf = 0;
  if (v4)
    CFRelease(v4);
  v5 = v11;
  v11 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v2);
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v2);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v2);
    else
      *(_DWORD *)v7 -= 2;
  }
  return v3;
}

- (_QWORD)_didPerformRedirection:(_QWORD *)a1 newRequest:
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E34BCF70;
  v2 = (const void *)a1[5];
  a1[5] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[3];
  a1[3] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)_didPerformRedirection:(WTF *)this newRequest:(void *)a2
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E34BCF70;
  v3 = (const void *)*((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (uint64_t)_didPerformRedirection:(uint64_t)a1 newRequest:
{
  uint64_t v2;
  uint64_t v3;
  CFTypeRef v4;
  WTF::StringImpl *v5;
  CFTypeRef v6;
  _BYTE v8[192];
  CFTypeRef v9;
  _BYTE v10[240];
  CFTypeRef cf;

  v2 = *(_QWORD *)(a1 + 16);
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v10, *(NSURLResponse **)(a1 + 32));
  MEMORY[0x19AEAEC20](v8, *(_QWORD *)(a1 + 48));
  v3 = WebKit::WebURLSchemeTask::didPerformRedirection(v2 + 8, (uint64_t)v10, (uint64_t)v8);
  v4 = v9;
  v9 = 0;
  if (v4)
    CFRelease(v4);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v8);
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v10, v5);
  return v3;
}

@end
