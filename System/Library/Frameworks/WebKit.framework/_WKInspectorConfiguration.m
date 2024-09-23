@implementation _WKInspectorConfiguration

- (_WKInspectorConfiguration)init
{
  _WKInspectorConfiguration *v2;
  _WKInspectorConfiguration *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_WKInspectorConfiguration;
  v2 = -[_WKInspectorConfiguration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[_WKInspectorConfiguration _apiObject](v2, "_apiObject");
    *(_OWORD *)(v4 + 8) = 0u;
    *(_OWORD *)(v4 + 24) = 0u;
    *(_QWORD *)v4 = off_1E34CC2A8;
    WebKit::InitializeWebKit2((WebKit *)v4);
    *(_QWORD *)(v4 + 24) = 0;
    *(_QWORD *)(v4 + 32) = 0;
    *(_QWORD *)(v4 + 8) = v3;
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)v4 = &off_1E34C2CB8;
  }
  return v3;
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
    v5 = *(_QWORD *)&self->_configuration.data.__lx[32];
    *(_QWORD *)&self->_configuration.data.__lx[32] = 0;
    if (v5)
      CFRelease(*(CFTypeRef *)(v5 + 8));
    WTF::Vector<std::pair<WTF::Ref<WebKit::WebURLSchemeHandler,WTF::RawPtrTraits<WebKit::WebURLSchemeHandler>,WTF::DefaultRefDerefTraits<WebKit::WebURLSchemeHandler>>,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_configuration.data.__lx[16], v4);
    v6.receiver = self;
    v6.super_class = (Class)_WKInspectorConfiguration;
    -[_WKInspectorConfiguration dealloc](&v6, sel_dealloc);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_configuration;
}

- (void)setURLSchemeHandler:(id)a3 forURLScheme:(id)a4
{
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  _DWORD *v9;
  _DWORD *v10;

  WebKit::WebURLSchemeHandlerCocoa::create(a3, (uint64_t *)&v9);
  v10 = v9;
  MEMORY[0x19AEABCC8](&v8, a4);
  API::InspectorConfiguration::addURLSchemeHandler((uint64_t)&self->_configuration, &v10, &v8);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
  if (v10)
  {
    if (v10[2] == 1)
      (*(void (**)(void))(*(_QWORD *)v10 + 8))();
    else
      --v10[2];
  }
}

- (void)setProcessPool:(id)a3
{
  CFTypeRef *v3;

  if (a3)
    v3 = (CFTypeRef *)((char *)a3 + 8);
  else
    v3 = 0;
  API::InspectorConfiguration::setProcessPool((API::InspectorConfiguration *)&self->_configuration, v3);
}

- (WKProcessPool)processPool
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->_configuration.data.__lx[32];
  if (v2)
    return *(WKProcessPool **)(v2 + 8);
  else
    return 0;
}

- (void)applyToWebViewConfiguration:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  const __CFString *v11;
  WTF::StringImpl *v12;
  WKProcessPool *v13;
  NSString *v14;

  v5 = *(unsigned int *)&self->_configuration.data.__lx[28];
  if ((_DWORD)v5)
  {
    v6 = *(_QWORD **)&self->_configuration.data.__lx[16];
    v7 = &v6[2 * v5];
    do
    {
      v8 = *v6;
      v9 = (WTF::StringImpl *)v6[1];
      ++*(_DWORD *)(*v6 + 8);
      if (v9)
      {
        *(_DWORD *)v9 += 2;
        v10 = *(_QWORD *)(v8 + 48);
        v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
      }
      else
      {
        v10 = *(_QWORD *)(v8 + 48);
        v11 = &stru_1E351F1B8;
      }
      objc_msgSend(a3, "setURLSchemeHandler:forURLScheme:", v10, v11);
      if (v9)
      {
        if (*(_DWORD *)v9 == 2)
          WTF::StringImpl::destroy(v9, v12);
        else
          *(_DWORD *)v9 -= 2;
      }
      if (*(_DWORD *)(v8 + 8) == 1)
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
      else
        --*(_DWORD *)(v8 + 8);
      v6 += 2;
    }
    while (v6 != v7);
  }
  v13 = -[_WKInspectorConfiguration processPool](self, "processPool");
  if (v13)
    objc_msgSend(a3, "setProcessPool:", v13);
  v14 = -[_WKInspectorConfiguration groupIdentifier](self, "groupIdentifier");
  if (v14)
    objc_msgSend(a3, "_setGroupIdentifier:", v14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  const __CFString *v11;
  WTF::StringImpl *v12;
  WKProcessPool *v13;
  NSString *v14;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = *(unsigned int *)&self->_configuration.data.__lx[28];
  if ((_DWORD)v5)
  {
    v6 = *(_QWORD **)&self->_configuration.data.__lx[16];
    v7 = &v6[2 * v5];
    do
    {
      v8 = *v6;
      v9 = (WTF::StringImpl *)v6[1];
      ++*(_DWORD *)(*v6 + 8);
      if (v9)
      {
        *(_DWORD *)v9 += 2;
        v10 = *(_QWORD *)(v8 + 48);
        v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
      }
      else
      {
        v10 = *(_QWORD *)(v8 + 48);
        v11 = &stru_1E351F1B8;
      }
      objc_msgSend(v4, "setURLSchemeHandler:forURLScheme:", v10, v11);
      if (v9)
      {
        if (*(_DWORD *)v9 == 2)
          WTF::StringImpl::destroy(v9, v12);
        else
          *(_DWORD *)v9 -= 2;
      }
      if (*(_DWORD *)(v8 + 8) == 1)
        (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
      else
        --*(_DWORD *)(v8 + 8);
      v6 += 2;
    }
    while (v6 != v7);
  }
  v13 = -[_WKInspectorConfiguration processPool](self, "processPool");
  if (v13)
    objc_msgSend(v4, "setProcessPool:", v13);
  v14 = -[_WKInspectorConfiguration groupIdentifier](self, "groupIdentifier");
  if (v14)
    objc_msgSend(v4, "setGroupIdentifier:", v14);
  return v4;
}

- (NSString)groupIdentifier
{
  return *(NSString **)&self->_configuration.data.__lx[40];
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
