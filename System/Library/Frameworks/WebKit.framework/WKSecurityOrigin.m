@implementation WKSecurityOrigin

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<API::SecurityOrigin> *))self->_securityOrigin.data.__lx)(&self->_securityOrigin);
    v4.receiver = self;
    v4.super_class = (Class)WKSecurityOrigin;
    -[WKSecurityOrigin dealloc](&v4, sel_dealloc);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_securityOrigin;
}

- (NSString)host
{
  if (*(_QWORD *)WebCore::SecurityOriginData::host((WebCore::SecurityOriginData *)&self->_securityOrigin.data.__lx[16]))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
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
  if ((v3 & 1) == 0 && (+[WKSecurityOrigin accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKSecurityOrigin accessInstanceVariablesDirectly]::didLogFault = 1;
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
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; protocol = %@; host = %@; port = %li>"),
                       NSStringFromClass(v4),
                       self,
                       -[WKSecurityOrigin protocol](self, "protocol"),
                       -[WKSecurityOrigin host](self, "host"),
                       -[WKSecurityOrigin port](self, "port"));
}

- (NSString)protocol
{
  if (*(_QWORD *)WebCore::SecurityOriginData::protocol((WebCore::SecurityOriginData *)&self->_securityOrigin.data.__lx[16]))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSInteger)port
{
  NSInteger result;

  result = WebCore::SecurityOriginData::port((WebCore::SecurityOriginData *)&self->_securityOrigin.data.__lx[16]);
  if ((result & 0xFF0000) != 0)
    return (unsigned __int16)result;
  else
    return 0;
}

- (BOOL)isSameSiteAsOrigin:(id)a3
{
  WTF::StringImpl *v4;
  char isSameSiteAs;
  WTF *v7;
  WTF *v8;

  WebCore::SecurityOriginData::securityOrigin((WebCore::SecurityOriginData *)&self->_securityOrigin.data.__lx[16]);
  WebCore::SecurityOriginData::securityOrigin((WebCore::SecurityOriginData *)((char *)a3 + 24));
  isSameSiteAs = WebCore::SecurityOrigin::isSameSiteAs(v8, v7);
  if (v7)
    WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v7, v4);
  if (v8)
    WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v8, v4);
  return isSameSiteAs;
}

- (BOOL)isSameSiteAsURL:(id)a3
{
  const WTF::URL *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  char isSameSiteAs;
  const WebCore::SecurityOrigin *v9;
  WebCore::SecurityOrigin *v10;
  WTF::StringImpl *v12[5];
  const WebCore::SecurityOrigin *v13;
  WebCore::SecurityOrigin *v14;

  WebCore::SecurityOriginData::securityOrigin((WebCore::SecurityOriginData *)&self->_securityOrigin.data.__lx[16]);
  MEMORY[0x19AEABB18](v12, a3);
  WebCore::SecurityOrigin::create((WebCore::SecurityOrigin *)v12, v4);
  v6 = v12[0];
  v12[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
  isSameSiteAs = WebCore::SecurityOrigin::isSameSiteAs(v14, v13);
  v9 = v13;
  v13 = 0;
  if (v9)
    WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v9, v7);
  v10 = v14;
  v14 = 0;
  if (v10)
    WTF::ThreadSafeRefCounted<WebCore::SecurityOrigin,(WTF::DestructionThread)0>::deref((uint64_t)v10, v7);
  return isSameSiteAs;
}

@end
