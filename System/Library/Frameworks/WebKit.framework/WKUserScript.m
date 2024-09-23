@implementation WKUserScript

- (WKUserScript)initWithSource:(NSString *)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly
{
  return -[WKUserScript initWithSource:injectionTime:forMainFrameOnly:inContentWorld:](self, "initWithSource:injectionTime:forMainFrameOnly:inContentWorld:", source, injectionTime, forMainFrameOnly, +[WKContentWorld pageWorld](WKContentWorld, "pageWorld"));
}

- (WKUserScript)initWithSource:(NSString *)source injectionTime:(WKUserScriptInjectionTime)injectionTime forMainFrameOnly:(BOOL)forMainFrameOnly inContentWorld:(WKContentWorld *)contentWorld
{
  _BOOL8 v7;
  WKUserScript *v10;
  void *v11;
  void *v12;
  void *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  WTF::StringImpl *v20[5];
  WTF::StringImpl *v21;
  uint64_t v22[11];
  objc_super v23;

  v7 = forMainFrameOnly;
  v23.receiver = self;
  v23.super_class = (Class)WKUserScript;
  v10 = -[WKUserScript init](&v23, sel_init);
  if (v10)
  {
    MEMORY[0x19AEABCC8](&v21, source);
    WTF::URL::URL((WTF::URL *)v20);
    v19[0] = 0;
    v19[1] = 0;
    v18[0] = 0;
    v18[1] = 0;
    MEMORY[0x19AEAC7C0](v22, &v21, v20, v19, v18, injectionTime != WKUserScriptInjectionTimeAtDocumentStart, v7, 0);
    API::Object::constructInWrapper<API::UserScript,WebCore::UserScript,API::ContentWorld &>(v10, v22, (uint64_t)&contentWorld->_contentWorld);
    WebCore::UserScript::~UserScript((WebCore::UserScript *)v22, v11);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v18, v12);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v19, v13);
    v15 = v20[0];
    v20[0] = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v14);
      else
        *(_DWORD *)v15 -= 2;
    }
    v16 = v21;
    v21 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v14);
      else
        *(_DWORD *)v16 -= 2;
    }
  }
  return v10;
}

- (Object)_apiObject
{
  return (Object *)&self->_userScript;
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
  if ((v3 & 1) == 0 && (+[WKUserScript accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKUserScript accessInstanceVariablesDirectly]::didLogFault = 1;
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

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    v5 = *(_QWORD *)self[2]._userScript.data.__lx;
    *(_QWORD *)self[2]._userScript.data.__lx = 0;
    if (v5)
      CFRelease(*(CFTypeRef *)(v5 + 8));
    WebCore::UserScript::~UserScript((WebCore::UserScript *)&self->_userScript.data.__lx[24], v4);
    v6.receiver = self;
    v6.super_class = (Class)WKUserScript;
    -[WKUserScript dealloc](&v6, sel_dealloc);
  }
}

- (NSString)source
{
  if (*(_QWORD *)&self->_userScript.data.__lx[24])
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (WKUserScriptInjectionTime)injectionTime
{
  return (unint64_t)LOBYTE(self[2].super.isa);
}

- (BOOL)isForMainFrameOnly
{
  return BYTE1(self[2].super.isa);
}

- (_WKUserContentWorld)_userContentWorld
{
  return (_WKUserContentWorld *)(id)CFMakeCollectable(-[_WKUserContentWorld _initWithContentWorld:]([_WKUserContentWorld alloc], "_initWithContentWorld:", *(_QWORD *)(*(_QWORD *)self[2]._userScript.data.__lx + 8)));
}

- (id)_initWithSource:(id)a3 injectionTime:(int64_t)a4 forMainFrameOnly:(BOOL)a5 includeMatchPatternStrings:(id)a6 excludeMatchPatternStrings:(id)a7 associatedURL:(id)a8 contentWorld:(id)a9 deferRunningUntilNotification:(BOOL)a10
{
  _BOOL8 v13;
  WKUserScript *v16;
  API::ContentWorld *v17;
  WebKit *v18;
  void *v19;
  void *v20;
  void *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  _BYTE v26[16];
  _BYTE v27[16];
  WTF::StringImpl *v28[5];
  WTF::StringImpl *v29;
  uint64_t v30[11];
  objc_super v31;

  v13 = a5;
  v31.receiver = self;
  v31.super_class = (Class)WKUserScript;
  v16 = -[WKUserScript init](&v31, sel_init);
  if (v16)
  {
    MEMORY[0x19AEABCC8](&v29, a3);
    MEMORY[0x19AEABB18](v28, a8);
    WTF::makeVector<WTF::String>(a6, (uint64_t)v27);
    WTF::makeVector<WTF::String>(a7, (uint64_t)v26);
    v17 = (API::ContentWorld *)MEMORY[0x19AEAC7C0](v30, &v29, v28, v27, v26, a4 != 0, v13, a10);
    if (a9)
      v18 = (WebKit *)((char *)a9 + 8);
    else
      v18 = API::ContentWorld::pageContentWorld(v17);
    API::Object::constructInWrapper<API::UserScript,WebCore::UserScript,API::ContentWorld &>(v16, v30, (uint64_t)v18);
    WebCore::UserScript::~UserScript((WebCore::UserScript *)v30, v19);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v26, v20);
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v27, v21);
    v23 = v28[0];
    v28[0] = 0;
    if (v23)
    {
      if (*(_DWORD *)v23 == 2)
        WTF::StringImpl::destroy(v23, v22);
      else
        *(_DWORD *)v23 -= 2;
    }
    v24 = v29;
    v29 = 0;
    if (v24)
    {
      if (*(_DWORD *)v24 == 2)
        WTF::StringImpl::destroy(v24, v22);
      else
        *(_DWORD *)v24 -= 2;
    }
  }
  return v16;
}

- (WKContentWorld)_contentWorld
{
  return *(WKContentWorld **)(*(_QWORD *)self[2]._userScript.data.__lx + 8);
}

@end
