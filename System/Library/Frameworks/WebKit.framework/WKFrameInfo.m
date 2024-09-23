@implementation WKFrameInfo

- (BOOL)isMainFrame
{
  return self->_frameInfo.data.__lx[16];
}

- (WKSecurityOrigin)securityOrigin
{
  const void *v2;
  WKSecurityOrigin *v3;
  uint64_t v4;
  uint64_t v6;

  API::SecurityOrigin::create(&v6);
  v2 = *(const void **)(v6 + 8);
  if (v2)
    CFRetain(*(CFTypeRef *)(v6 + 8));
  v3 = (id)CFMakeCollectable(v2);
  v4 = v6;
  v6 = 0;
  if (v4)
    CFRelease(*(CFTypeRef *)(v4 + 8));
  return v3;
}

- (Object)_apiObject
{
  return (Object *)&self->_frameInfo;
}

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::FrameInfo::~FrameInfo((API::FrameInfo *)&self->_frameInfo, v4);
    v5.receiver = self;
    v5.super_class = (Class)WKFrameInfo;
    -[WKFrameInfo dealloc](&v5, sel_dealloc);
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKFrameInfo accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKFrameInfo accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  WKWebView *v6;
  const char *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[WKFrameInfo webView](self, "webView");
  if (-[WKFrameInfo isMainFrame](self, "isMainFrame"))
    v7 = "YES";
  else
    v7 = "NO";
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; webView = %p; isMainFrame = %s; request = %@>"),
                       v5,
                       self,
                       v6,
                       v7,
                       -[WKFrameInfo request](self, "request"));
}

- (NSURLRequest)request
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (WKWebView)webView
{
  WKWebView *result;
  CFTypeRef cf;

  result = *(WKWebView **)&self[5]._frameInfo.data.__lx[32];
  if (result)
  {
    WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)result, &cf);
    return (WKWebView *)(id)CFMakeCollectable(cf);
  }
  return result;
}

- (_WKFrameHandle)_handle
{
  uint64_t v2;
  Class isa;
  uint64_t v4;
  const void *v5;
  _WKFrameHandle *v6;

  v2 = *(_QWORD *)&self[4]._frameInfo.data.__lx[40];
  isa = self[5].super.isa;
  v4 = API::Object::newObject(0x28uLL, 11);
  *(_QWORD *)v4 = off_1E34CC2A8;
  WebKit::InitializeWebKit2((WebKit *)v4);
  *(_QWORD *)v4 = &off_1E34AD1B8;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = isa;
  *(_BYTE *)(v4 + 32) = 0;
  v5 = *(const void **)(v4 + 8);
  if (v5)
    CFRetain(*(CFTypeRef *)(v4 + 8));
  v6 = (id)CFMakeCollectable(v5);
  CFRelease(*(CFTypeRef *)(v4 + 8));
  return v6;
}

- (_WKFrameHandle)_parentFrameHandle
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v6;

  API::FrameInfo::parentFrameHandle((API::FrameInfo *)&self->_frameInfo, &v6);
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
  return (_WKFrameHandle *)(id)CFMakeCollectable(v3);
}

- (int)_processIdentifier
{
  return *(_DWORD *)&self[5]._frameInfo.data.__lx[24];
}

- (BOOL)_isLocalFrame
{
  return self->_frameInfo.data.__lx[17] == 0;
}

- (BOOL)_isFocused
{
  return self[5]._frameInfo.data.__lx[28];
}

- (BOOL)_errorOccurred
{
  return self[5]._frameInfo.data.__lx[29];
}

- (NSString)_title
{
  WTF::StringImpl *v2;
  WTF::StringImpl *v3;
  NSString *v4;
  WTF::StringImpl *v6;

  API::FrameInfo::title((API::FrameInfo *)&self->_frameInfo, &v6);
  v2 = v6;
  if (!v6)
    return (NSString *)&stru_1E351F1B8;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2)
    WTF::StringImpl::destroy(v2, v3);
  else
    *(_DWORD *)v2 -= 2;
  return v4;
}

@end
