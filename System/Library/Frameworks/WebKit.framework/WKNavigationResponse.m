@implementation WKNavigationResponse

- (Object)_apiObject
{
  return (Object *)&self->_navigationResponse;
}

- (NSURLResponse)response
{
  return (NSURLResponse *)WebCore::ResourceResponse::nsURLResponse((WebCore::ResourceResponse *)&self[4]._navigationResponse);
}

- (BOOL)isForMainFrame
{
  return *(_BYTE *)(*(_QWORD *)&self->_navigationResponse.data.__lx[16] + 16);
}

- (void)dealloc
{
  objc_class *v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  const void *v6;
  Class isa;
  uint64_t v8;
  objc_super v9;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(WTF::StringImpl **)&self[8]._navigationResponse.data.__lx[40];
    *(_QWORD *)&self[8]._navigationResponse.data.__lx[40] = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v4);
      else
        *(_DWORD *)v5 -= 2;
    }
    v6 = *(const void **)&self[8]._navigationResponse.data.__lx[16];
    *(_QWORD *)&self[8]._navigationResponse.data.__lx[16] = 0;
    if (v6)
      CFRelease(v6);
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&self[4]._navigationResponse, v4);
    isa = self[4].super.isa;
    self[4].super.isa = 0;
    if (isa)
      CFRelease(isa);
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)&self->_navigationResponse.data.__lx[24]);
    v8 = *(_QWORD *)&self->_navigationResponse.data.__lx[16];
    *(_QWORD *)&self->_navigationResponse.data.__lx[16] = 0;
    if (v8)
      CFRelease(*(CFTypeRef *)(v8 + 8));
    v9.receiver = self;
    v9.super_class = (Class)WKNavigationResponse;
    -[WKNavigationResponse dealloc](&v9, sel_dealloc);
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
  if ((v3 & 1) == 0 && (+[WKNavigationResponse accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKNavigationResponse accessInstanceVariablesDirectly]::didLogFault = 1;
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; response = %@>"),
                       NSStringFromClass(v4),
                       self,
                       -[WKNavigationResponse response](self, "response"));
}

- (BOOL)canShowMIMEType
{
  return self[8]._navigationResponse.data.__lx[32];
}

- (WKFrameInfo)_frame
{
  return *(WKFrameInfo **)(*(_QWORD *)&self->_navigationResponse.data.__lx[16] + 8);
}

- (NSURLRequest)_request
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (NSString)_downloadAttribute
{
  NSString *result;

  result = *(NSString **)&self[8]._navigationResponse.data.__lx[40];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

@end
