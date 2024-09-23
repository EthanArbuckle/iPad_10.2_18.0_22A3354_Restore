@implementation WKWebProcessPlugInFrame

- (Object)_apiObject
{
  return (Object *)&self->_frame;
}

+ (id)lookUpFrameFromHandle:(id)a3
{
  WebKit::WebProcess *v4;
  id result;

  v4 = WebKit::WebProcess::singleton((WebKit::WebProcess *)a1);
  result = (id)WebKit::WebProcess::webFrame((uint64_t)v4, *((_QWORD *)a3 + 3), *((_QWORD *)a3 + 4));
  if (result)
    return (id)*((_QWORD *)result + 1);
  return result;
}

+ (id)lookUpFrameFromJSContext:(id)a3
{
  WebKit::WebFrame *v3;
  const OpaqueJSContext *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t v9;

  v3 = (WebKit::WebFrame *)objc_msgSend(a3, "JSGlobalContextRef");
  WebKit::WebFrame::frameForContext(v3, v4, &v9);
  v5 = v9;
  if (v9)
  {
    v6 = *(const void **)(v9 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v9 + 8));
      v7 = *(const void **)(v5 + 8);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v6 = 0;
  }
  return (id)(id)CFMakeCollectable(v6);
}

+ (id)lookUpContentFrameFromWindowOrFrameElement:(id)a3
{
  WebKit::WebFrame *v4;
  const OpaqueJSContext *v5;
  const OpaqueJSValue *v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  uint64_t v11;

  v4 = (WebKit::WebFrame *)objc_msgSend((id)objc_msgSend(a3, "context"), "JSGlobalContextRef");
  v5 = (const OpaqueJSContext *)objc_msgSend(a3, "JSValueRef");
  WebKit::WebFrame::contentFrameForWindowOrFrameElement(v4, v5, v6, &v11);
  v7 = v11;
  if (v11)
  {
    v8 = *(const void **)(v11 + 8);
    if (v8)
    {
      CFRetain(*(CFTypeRef *)(v11 + 8));
      v9 = *(const void **)(v7 + 8);
    }
    else
    {
      v9 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    v8 = 0;
  }
  return (id)(id)CFMakeCollectable(v8);
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::WebFrame> *))self->_frame.data.__lx)(&self->_frame);
    v4.receiver = self;
    v4.super_class = (Class)WKWebProcessPlugInFrame;
    -[WKWebProcessPlugInFrame dealloc](&v4, sel_dealloc);
  }
}

- (id)jsContextForWorld:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", WebKit::WebFrame::jsContextForWorld((WebKit::WebFrame *)&self->_frame, *(WebCore::DOMWrapperWorld **)(objc_msgSend(a3, "_scriptWorld") + 24)));
}

- (id)jsContextForServiceWorkerWorld:(id)a3
{
  id result;

  result = (id)WebKit::WebFrame::jsContextForServiceWorkerWorld((WebKit::WebFrame *)&self->_frame, *(WebCore::DOMWrapperWorld **)(objc_msgSend(a3, "_scriptWorld") + 24));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", result);
  return result;
}

- (id)hitTest:(CGPoint)a3
{
  unsigned int *lx;
  uint64_t v4;
  const void *v5;
  const void *v6;
  uint64_t v8;
  uint64_t v9;
  CGPoint v10;

  v10 = a3;
  lx = (unsigned int *)self->_frame.data.__lx;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v8, &v10);
  WebKit::WebFrame::hitTest(lx, &v9);
  v4 = v9;
  if (v9)
  {
    v5 = *(const void **)(v9 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v9 + 8));
      v6 = *(const void **)(v4 + 8);
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v5 = 0;
  }
  return (id)(id)CFMakeCollectable(v5);
}

- (id)hitTest:(CGPoint)a3 options:(unint64_t)a4
{
  unsigned int *lx;
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t v9;
  uint64_t v10;
  CGPoint v11;

  v11 = a3;
  lx = (unsigned int *)self->_frame.data.__lx;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v9, &v11);
  WebKit::WebFrame::hitTest(lx, &v10);
  v5 = v10;
  if (v10)
  {
    v6 = *(const void **)(v10 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v10 + 8));
      v7 = *(const void **)(v5 + 8);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v6 = 0;
  }
  return (id)(id)CFMakeCollectable(v6);
}

- (id)jsCSSStyleDeclarationForCSSStyleDeclarationHandle:(id)a3 inWorld:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CBE108], "valueWithJSValueRef:inContext:", WebKit::WebFrame::jsWrapperForWorld((uint64_t)&self->_frame, objc_msgSend(a3, "_cssStyleDeclarationHandle"), objc_msgSend(a4, "_scriptWorld")), -[WKWebProcessPlugInFrame jsContextForWorld:](self, "jsContextForWorld:", a4));
}

- (id)jsNodeForNodeHandle:(id)a3 inWorld:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CBE108], "valueWithJSValueRef:inContext:", WebKit::WebFrame::jsWrapperForWorld((uint64_t)&self->_frame, objc_msgSend(a3, "_nodeHandle"), objc_msgSend(a4, "_scriptWorld")), -[WKWebProcessPlugInFrame jsContextForWorld:](self, "jsContextForWorld:", a4));
}

- (id)jsRangeForRangeHandle:(id)a3 inWorld:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CBE108], "valueWithJSValueRef:inContext:", WebKit::WebFrame::jsWrapperForWorld((uint64_t)&self->_frame, objc_msgSend(a3, "_rangeHandle"), objc_msgSend(a4, "_scriptWorld")), -[WKWebProcessPlugInFrame jsContextForWorld:](self, "jsContextForWorld:", a4));
}

- (id)_browserContextController
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)&self->_frame.data.__lx[24];
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + 24);
  if (!v4)
    return 0;
  v5 = *(_QWORD *)(v4 + 8);
  if (!v5)
    return 0;
  v7 = *(_QWORD **)(*(_QWORD *)(v5 + 48) + 16);
  if (((*(uint64_t (**)(_QWORD *, SEL))(*v7 + 1368))(v7, a2) & 1) != 0 || !*(_QWORD *)(v7[2] + 8))
    return 0;
  v8 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&self->_frame.data.__lx[24] + 8) + 24)
                                          + 8)
                              + 48)
                  + 16);
  (*(void (**)(_QWORD *))(*v8 + 1368))(v8);
  v9 = *(_QWORD *)(v8[2] + 8);
  if (v9)
    v10 = v9 - 16;
  else
    v10 = 0;
  return *(id *)(v10 + 8);
}

- (NSURL)URL
{
  WTF::StringImpl *v2;
  NSURL *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v6;

  WebKit::WebFrame::url((WebKit::WebFrame *)&self->_frame, (uint64_t)&v6);
  v3 = (NSURL *)WTF::URL::operator NSURL *();
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v2);
    else
      *(_DWORD *)v4 -= 2;
  }
  return v3;
}

- (NSArray)childFrames
{
  const void *v2;
  NSArray *v3;
  WebKit *v4;
  WebKit *v6;

  WebKit::WebFrame::childFrames((WebKit::WebFrame *)&self->_frame, &v6);
  v2 = (const void *)*((_QWORD *)v6 + 1);
  if (v2)
    CFRetain(*((CFTypeRef *)v6 + 1));
  v3 = (id)CFMakeCollectable(v2);
  v4 = v6;
  v6 = 0;
  if (v4)
    CFRelease(*((CFTypeRef *)v4 + 1));
  return v3;
}

- (BOOL)containsAnyFormElements
{
  return WebKit::WebFrame::containsAnyFormElements((WebKit::WebFrame *)&self->_frame);
}

- (BOOL)isMainFrame
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self->_frame.data.__lx[24];
  return v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0 && *(_QWORD *)(*(_QWORD *)(v3 + 128) + 8) == v3;
}

- (_WKFrameHandle)handle
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  _WKFrameHandle *v6;

  v2 = *(_QWORD *)&self[1]._frame.data.__lx[24];
  v3 = *(_QWORD *)&self[1]._frame.data.__lx[32];
  v4 = API::Object::newObject(0x28uLL, 11);
  *(_QWORD *)v4 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v4);
  *(_QWORD *)v4 = &off_1E34AD1B8;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  *(_BYTE *)(v4 + 32) = 0;
  v5 = *(const void **)(v4 + 8);
  if (v5)
    CFRetain(*(CFTypeRef *)(v4 + 8));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v4 + 8));
  return v6;
}

- (id)_securityOrigin
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  WebCore::SecurityOrigin *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;

  v2 = *(_QWORD *)&self->_frame.data.__lx[24];
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3 || *(_BYTE *)(v3 + 144))
    return 0;
  v5 = (WebCore::SecurityOrigin *)WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)(*(_QWORD *)(v3 + 296) + 192));
  WebCore::SecurityOrigin::toString(v5);
  if (!v8)
    return &stru_1E351F1B8;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v8 == 2)
    WTF::StringImpl::destroy(v8, v6);
  else
    *(_DWORD *)v8 -= 2;
  return v4;
}

- (NSArray)appleTouchIconURLs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFTypeRef cf;

  v2 = *(_QWORD *)&self->_frame.data.__lx[24];
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
  {
    if (*(_BYTE *)(v3 + 144))
      v4 = 0;
    else
      v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  collectIcons(&cf, v4);
  return (NSArray *)(id)CFMakeCollectable(cf);
}

- (NSArray)faviconURLs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFTypeRef cf;

  v2 = *(_QWORD *)&self->_frame.data.__lx[24];
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
  {
    if (*(_BYTE *)(v3 + 144))
      v4 = 0;
    else
      v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  collectIcons(&cf, v4);
  return (NSArray *)(id)CFMakeCollectable(cf);
}

- (id)_parentFrame
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v6;

  WebKit::WebFrame::parentFrame((unsigned int *)self->_frame.data.__lx, &v6);
  v2 = v6;
  if (v6)
  {
    v3 = *(const void **)(v6 + 8);
    if (v3)
    {
      CFRetain(*(CFTypeRef *)(v6 + 8));
      v4 = *(const void **)(v2 + 8);
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v3 = 0;
  }
  return (id)(id)CFMakeCollectable(v3);
}

- (BOOL)_hasCustomContentProvider
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  WebKit::WebPage *v9;

  v2 = *(_QWORD *)&self->_frame.data.__lx[24];
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3 || *(_QWORD *)(*(_QWORD *)(v3 + 128) + 8) != v3)
    return 0;
  v5 = *(_QWORD *)(v3 + 24);
  if (v5
    && (v6 = *(_QWORD *)(v5 + 8)) != 0
    && (v7 = *(_QWORD **)(*(_QWORD *)(v6 + 48) + 16),
        ((*(uint64_t (**)(_QWORD *, SEL))(*v7 + 1368))(v7, a2) & 1) == 0))
  {
    v8 = *(_QWORD *)(v7[2] + 8);
    if (v8)
      v9 = (WebKit::WebPage *)(v8 - 16);
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  return WebKit::WebPage::mainFrameHasCustomContentProvider(v9);
}

- (id)_certificateChain
{
  WebCore::CertificateInfo *v2;
  __SecTrust *v3;
  CFTypeRef v4;
  WebCore::CertificateInfo *v6;
  CFTypeRef arg;

  WebKit::WebFrame::certificateInfo((unsigned int *)self->_frame.data.__lx, &v6);
  v2 = v6;
  WebCore::CertificateInfo::certificateChainFromSecTrust(v6, v3);
  if (arg)
  {
    CFAutorelease(arg);
    v4 = arg;
  }
  else
  {
    v4 = 0;
  }
  arg = 0;
  if (v2)
    CFRelease(v2);
  return (id)v4;
}

- (__SecTrust)_serverTrust
{
  __SecTrust *result;
  __SecTrust *v3;
  CFTypeRef cf;

  WebKit::WebFrame::certificateInfo((unsigned int *)self->_frame.data.__lx, &cf);
  result = (__SecTrust *)cf;
  if (cf)
  {
    v3 = (__SecTrust *)cf;
    CFRelease(cf);
    return v3;
  }
  return result;
}

- (id)_provisionalURL
{
  void *v2;
  WTF::StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  v2 = (void *)MEMORY[0x1E0C99E98];
  WebKit::WebFrame::provisionalURL((unsigned int *)self->_frame.data.__lx, &v7);
  v4 = (void *)objc_msgSend(v2, "_web_URLWithWTFString:", &v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

@end
