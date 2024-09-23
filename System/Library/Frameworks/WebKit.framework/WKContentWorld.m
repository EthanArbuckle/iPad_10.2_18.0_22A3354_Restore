@implementation WKContentWorld

- (Object)_apiObject
{
  return (Object *)&self->_contentWorld;
}

+ (WKContentWorld)pageWorld
{
  return (WKContentWorld *)*((_QWORD *)API::ContentWorld::pageContentWorld((API::ContentWorld *)a1) + 1);
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
  if ((v3 & 1) == 0 && (+[WKContentWorld accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKContentWorld accessInstanceVariablesDirectly]::didLogFault = 1;
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

+ (WKContentWorld)defaultClientWorld
{
  return (WKContentWorld *)*((_QWORD *)API::ContentWorld::defaultClientWorld((API::ContentWorld *)a1) + 1);
}

+ (WKContentWorld)worldWithName:(NSString *)name
{
  const WTF::StringImpl *v3;
  const void *v4;
  WTF::StringImpl *v5;
  WKContentWorld *v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10;
  uint64_t v11;

  MEMORY[0x19AEABCC8](&v10, name);
  API::ContentWorld::sharedWorldWithName(&v10, v3, &v11);
  v4 = *(const void **)(v11 + 8);
  if (v4)
    CFRetain(*(CFTypeRef *)(v11 + 8));
  v6 = (id)CFMakeCollectable(v4);
  v7 = v11;
  v11 = 0;
  if (v7)
    CFRelease(*(CFTypeRef *)(v7 + 8));
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  return v6;
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  const WTF::StringImpl *v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    API::ContentWorld::~ContentWorld((API::ContentWorld *)&self->_contentWorld, v4, v5);
    v6.receiver = self;
    v6.super_class = (Class)WKContentWorld;
    -[WKContentWorld dealloc](&v6, sel_dealloc);
  }
}

- (NSString)name
{
  NSString *result;

  result = *(NSString **)&self->_contentWorld.data.__lx[32];
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (_WKUserContentWorld)_userContentWorld
{
  return (_WKUserContentWorld *)(id)CFMakeCollectable(-[_WKUserContentWorld _initWithContentWorld:]([_WKUserContentWorld alloc], "_initWithContentWorld:", self));
}

@end
