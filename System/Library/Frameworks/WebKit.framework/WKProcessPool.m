@implementation WKProcessPool

- (id).cxx_construct
{
  *((_QWORD *)self + 126) = 0;
  *((_OWORD *)self + 61) = 0u;
  *((_OWORD *)self + 62) = 0u;
  return self;
}

- (void)_setObject:(id)a3 forBundleParameter:(id)a4
{
  const void *v6;
  void *v7;
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  void *v9;
  void *v10;
  const void *v11;
  size_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  IPC::Encoder *v20;
  WTF *v21;
  void *v22;
  WTF::StringImpl *v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  char v26;
  IPC::Encoder *v27;

  v6 = (const void *)objc_msgSend(a3, "copy");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("parameter"));
  objc_msgSend(v7, "finishEncoding");
  p_processPool = &self->_processPool;
  if (v6)
    objc_msgSend(WebKit::WebProcessPool::ensureBundleParameters((WebKit::WebProcessPool *)p_processPool), "setObject:forKey:", v6, a4);
  else
    objc_msgSend(WebKit::WebProcessPool::ensureBundleParameters((WebKit::WebProcessPool *)p_processPool), "removeObjectForKey:", a4);
  v9 = (void *)objc_msgSend(v7, "encodedData");
  MEMORY[0x19AEABCC8](&v24, a4);
  if (v9)
  {
    v11 = (const void *)objc_msgSend(v9, "bytes");
    v12 = objc_msgSend(v9, "length");
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  v13 = *(unsigned int *)&self->_anon_38[36];
  if ((_DWORD)v13)
  {
    v14 = *(uint64_t **)&self->_anon_38[24];
    v15 = 8 * v13;
    do
    {
      v16 = *v14;
      v17 = *(_QWORD *)(*v14 + 136);
      if (v17 && *(_BYTE *)(v17 + 104) || *(_QWORD *)(v16 + 144))
      {
        v18 = WTF::fastMalloc((WTF *)0x240);
        *(_WORD *)v18 = 2638;
        *(_QWORD *)(v18 + 8) = 0;
        *(_QWORD *)(v18 + 528) = v18 + 16;
        *(_QWORD *)(v18 + 536) = v18 + 16;
        *(_OWORD *)(v18 + 544) = xmmword_1978CE2D0;
        *(_OWORD *)(v18 + 560) = 0u;
        IPC::Encoder::encodeHeader((IPC::Encoder *)v18);
        v27 = (IPC::Encoder *)v18;
        IPC::ArgumentCoder<WTF::String,void>::encode<IPC::Encoder>(v18, (uint64_t *)&v24);
        IPC::ArgumentCoder<std::span<unsigned char const,18446744073709551615ul>,void>::encode<IPC::Encoder>(v18, v11, v12);
        LOBYTE(v25) = 0;
        v26 = 0;
        WebKit::AuxiliaryProcessProxy::sendMessage(v16, &v27, 0, (uint64_t)&v25, 1);
        if (v26)
        {
          v19 = v25;
          v25 = 0;
          if (v19)
            (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
        }
        v20 = v27;
        v27 = 0;
        if (v20)
        {
          IPC::Encoder::~Encoder(v20, v10);
          WTF::fastFree(v21, v22);
        }
      }
      ++v14;
      v15 -= 8;
    }
    while (v15);
  }
  v23 = v24;
  v24 = 0;
  if (!v23)
  {
LABEL_20:
    if (!v7)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (*(_DWORD *)v23 != 2)
  {
    *(_DWORD *)v23 -= 2;
    goto LABEL_20;
  }
  WTF::StringImpl::destroy(v23, (WTF::StringImpl *)v10);
  if (v7)
LABEL_21:
    CFRelease(v7);
LABEL_22:
  if (v6)
    CFRelease(v6);
}

- (void)_warmInitialProcess
{
  WebKit::WebProcessPool::prewarmProcess((unsigned int *)self->_processPool.data.__lx);
}

- (id)_initWithConfiguration:(id)a3
{
  WKProcessPool *v4;
  WKProcessPool *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKProcessPool;
  v4 = -[WKProcessPool init](&v7, sel_init);
  v5 = v4;
  if (v4)
    *((_QWORD *)WebKit::WebProcessPool::WebProcessPool((WebKit::WebProcessPool *)-[WKProcessPool _apiObject](v4, "_apiObject"), (API::ProcessPoolConfiguration *)((char *)a3 + 8))+ 1) = v4;
  return v5;
}

- (Object)_apiObject
{
  return (Object *)&self->_processPool;
}

- (void)_registerURLSchemeAsSecure:(id)a3
{
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  const WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  p_processPool = &self->_processPool;
  MEMORY[0x19AEABCC8](&v7, a3);
  WebKit::WebProcessPool::registerURLSchemeAsSecure((WebKit::WebProcessPool *)p_processPool, &v7, v4);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)_registerURLSchemeAsBypassingContentSecurityPolicy:(id)a3
{
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  const WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  p_processPool = &self->_processPool;
  MEMORY[0x19AEABCC8](&v7, a3);
  WebKit::WebProcessPool::registerURLSchemeAsBypassingContentSecurityPolicy((WebKit::WebProcessPool *)p_processPool, &v7, v4);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)_setDomainRelaxationForbiddenForURLScheme:(id)a3
{
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  const WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  uint64_t *v9[3];

  p_processPool = &self->_processPool;
  MEMORY[0x19AEABCC8](&v8, a3);
  WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&self->_anon_38[304], &v8, v5, (uint64_t)v9);
  v9[0] = (uint64_t *)&v8;
  WebKit::WebProcessPool::sendToAllProcesses<Messages::WebProcess::SetDomainRelaxationForbiddenForURLScheme>((uint64_t)p_processPool, v9, 0);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    WebKit::WebProcessPool::~WebProcessPool((WebKit::WebProcessPool *)&self->_processPool);
    v4.receiver = self;
    v4.super_class = (Class)WKProcessPool;
    -[WKProcessPool dealloc](&v4, sel_dealloc);
  }
}

- (WKProcessPool)init
{
  _WKProcessPoolConfiguration *v3;
  WKProcessPool *v4;

  v3 = objc_alloc_init(_WKProcessPoolConfiguration);
  v4 = -[WKProcessPool _initWithConfiguration:](self, "_initWithConfiguration:", v3);
  if (v3)
    CFRelease(v3);
  return v4;
}

+ (BOOL)_lockdownModeEnabledGloballyForTesting
{
  __int16 isLockdownModeEnabledBySystemIgnoringCaching;

  if (HIBYTE(WebKit::cachedLockdownModeEnabledGlobally(void)::cachedLockdownModeEnabledGlobally))
  {
    LOBYTE(isLockdownModeEnabledBySystemIgnoringCaching) = (_BYTE)WebKit::cachedLockdownModeEnabledGlobally(void)::cachedLockdownModeEnabledGlobally != 0;
  }
  else
  {
    isLockdownModeEnabledBySystemIgnoringCaching = WebKit::isLockdownModeEnabledBySystemIgnoringCaching((WebKit *)a1);
    WebKit::cachedLockdownModeEnabledGlobally(void)::cachedLockdownModeEnabledGlobally = isLockdownModeEnabledBySystemIgnoringCaching | 0x100;
  }
  return isLockdownModeEnabledBySystemIgnoringCaching;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_coreLocationProvider.m_ptr;
  self->_coreLocationProvider.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_geolocationProvider.m_ptr;
  self->_geolocationProvider.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_automationSession.m_ptr;
  self->_automationSession.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  objc_destroyWeak(&self->_downloadDelegate.m_weakReference);
  objc_destroyWeak(&self->_automationDelegate.m_weakReference);
}

- (void)_setObjectsForBundleParametersWithDictionary:(id)a3
{
  const void *v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  IPC::Encoder *v17;
  WTF *v18;
  void *v19;
  uint64_t v20;
  char v21;
  IPC::Encoder *v22;

  v4 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", a3, 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("parameters"));
  objc_msgSend(v5, "finishEncoding");
  objc_msgSend(WebKit::WebProcessPool::ensureBundleParameters((WebKit::WebProcessPool *)&self->_processPool), "setValuesForKeysWithDictionary:", v4);
  v6 = (void *)objc_msgSend(v5, "encodedData");
  v7 = v6;
  if (v6)
  {
    v8 = (const void *)objc_msgSend(v6, "bytes");
    v7 = (void *)objc_msgSend(v7, "length");
  }
  else
  {
    v8 = 0;
  }
  v9 = *(unsigned int *)&self->_anon_38[36];
  if ((_DWORD)v9)
  {
    v10 = *(uint64_t **)&self->_anon_38[24];
    v11 = 8 * v9;
    do
    {
      v12 = *v10;
      v13 = *(_QWORD *)(*v10 + 136);
      if (v13 && *(_BYTE *)(v13 + 104) || *(_QWORD *)(v12 + 144))
      {
        v14 = WTF::fastMalloc((WTF *)0x240);
        *(_WORD *)v14 = 2639;
        *(_QWORD *)(v14 + 8) = 0;
        *(_QWORD *)(v14 + 528) = v14 + 16;
        *(_QWORD *)(v14 + 536) = v14 + 16;
        *(_OWORD *)(v14 + 544) = xmmword_1978CE2D0;
        *(_OWORD *)(v14 + 560) = 0u;
        IPC::Encoder::encodeHeader((IPC::Encoder *)v14);
        v22 = (IPC::Encoder *)v14;
        IPC::ArgumentCoder<std::span<unsigned char const,18446744073709551615ul>,void>::encode<IPC::Encoder>(v14, v8, (size_t)v7);
        LOBYTE(v20) = 0;
        v21 = 0;
        WebKit::AuxiliaryProcessProxy::sendMessage(v12, &v22, 0, (uint64_t)&v20, 1);
        if (v21)
        {
          v16 = v20;
          v20 = 0;
          if (v16)
            (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
        }
        v17 = v22;
        v22 = 0;
        if (v17)
        {
          IPC::Encoder::~Encoder(v17, v15);
          WTF::fastFree(v18, v19);
        }
      }
      ++v10;
      v11 -= 8;
    }
    while (v11);
  }
  if (v5)
    CFRelease(v5);
  if (v4)
    CFRelease(v4);
}

- (void)_setDownloadDelegate:(id)a3
{
  uint64_t v5;
  _DWORD *v6;

  objc_storeWeak(&self->_downloadDelegate.m_weakReference, a3);
  v5 = WTF::fastMalloc((WTF *)0x20);
  WebKit::LegacyDownloadClient::LegacyDownloadClient(v5, a3);
  v6 = *(_DWORD **)&self->_anon_38[256];
  *(_QWORD *)&self->_anon_38[256] = v5;
  if (v6)
  {
    if (v6[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v6 + 8))(v6);
    else
      --v6[2];
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
  if ((v3 & 1) == 0 && (+[WKProcessPool accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKProcessPool accessInstanceVariablesDirectly]::didLogFault = 1;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  WKProcessPool *v3;

  if (_MergedGlobals_882 == 1)
  {
    v3 = (WKProcessPool *)qword_1EE341770;
  }
  else
  {
    v3 = 0;
    qword_1EE341770 = 0;
    _MergedGlobals_882 = 1;
  }
  if (v3 == self)
    objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("isSharedProcessPool"));
}

- (WKProcessPool)initWithCoder:(id)a3
{
  WKProcessPool *v4;

  v4 = -[WKProcessPool init](self, "init");
  if (!v4 || !objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isSharedProcessPool")))
    return v4;

  return (WKProcessPool *)+[WKProcessPool _sharedProcessPool](WKProcessPool, "_sharedProcessPool");
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; configuration = %@>"),
                       NSStringFromClass(v4),
                       self,
                       *(_QWORD *)(*(_QWORD *)self->_anon_38 + 8));
}

- (_WKProcessPoolConfiguration)_configuration
{
  const void *v2;
  _WKProcessPoolConfiguration *v3;
  API::ProcessPoolConfiguration *v4;
  API::ProcessPoolConfiguration *v6;

  API::ProcessPoolConfiguration::copy(*(API::ProcessPoolConfiguration **)self->_anon_38, &v6);
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

- (WKGeolocationProviderIOS)_geolocationProvider
{
  WKGeolocationProviderIOS *result;
  void *m_ptr;

  result = (WKGeolocationProviderIOS *)self->_geolocationProvider.m_ptr;
  if (!result)
  {
    result = -[WKGeolocationProviderIOS initWithProcessPool:]([WKGeolocationProviderIOS alloc], "initWithProcessPool:", &self->_processPool);
    m_ptr = self->_geolocationProvider.m_ptr;
    self->_geolocationProvider.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (WKGeolocationProviderIOS *)self->_geolocationProvider.m_ptr;
    }
  }
  return result;
}

+ (id)_sharedProcessPool
{
  id result;

  if (qword_1EE341768 != -1)
    dispatch_once(&qword_1EE341768, &__block_literal_global_19);
  if (_MergedGlobals_882 == 1)
    return (id)qword_1EE341770;
  result = 0;
  qword_1EE341770 = 0;
  _MergedGlobals_882 = 1;
  return result;
}

void __46__WKProcessPool_WKPrivate___sharedProcessPool__block_invoke()
{
  WKProcessPool *v0;
  const void *v1;

  v0 = objc_alloc_init(WKProcessPool);
  if ((_MergedGlobals_882 & 1) != 0)
  {
    v1 = (const void *)qword_1EE341770;
    qword_1EE341770 = (uint64_t)v0;
    if (v1)
      CFRelease(v1);
  }
  else
  {
    _MergedGlobals_882 = 1;
    qword_1EE341770 = (uint64_t)v0;
  }
}

+ (id)_allProcessPoolsForTesting
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeRef v6;
  void *v7;
  uint64_t v9;
  unsigned int v10;

  WebKit::WebProcessPool::allProcessPools((uint64_t)&v9);
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v3 = (void *)objc_msgSend(v2, "initWithCapacity:", v10);
  if (v10)
  {
    v4 = v9;
    v5 = 8 * v10;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)v4 + 8))
        objc_msgSend(v3, "addObject:");
      v4 += 8;
      v5 -= 8;
    }
    while (v5);
  }
  v6 = (id)CFMakeCollectable(v3);
  WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v9, v7);
  return (id)v6;
}

+ (id)_websiteDataURLForContainerWithURL:(id)a3
{
  return +[WKProcessPool _websiteDataURLForContainerWithURL:bundleIdentifierIfNotInContainer:](WKProcessPool, "_websiteDataURLForContainerWithURL:bundleIdentifierIfNotInContainer:", a3, 0);
}

+ (id)_websiteDataURLForContainerWithURL:(id)a3 bundleIdentifierIfNotInContainer:(id)a4
{
  WebKit *v5;
  BOOL HasContainer;

  v5 = (WebKit *)objc_msgSend((id)objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1), "URLByAppendingPathComponent:isDirectory:", CFSTR("WebKit"), 1);
  HasContainer = WebKit::processHasContainer(v5);
  if (a4 && !HasContainer)
    v5 = (WebKit *)-[WebKit URLByAppendingPathComponent:isDirectory:](v5, "URLByAppendingPathComponent:isDirectory:", a4, 1);
  return (id)-[WebKit URLByAppendingPathComponent:isDirectory:](v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("WebsiteData"), 1);
}

- (void)_registerURLSchemeAsCanDisplayOnlyIfCanRequest:(id)a3
{
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  const WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  uint64_t *v9[3];

  p_processPool = &self->_processPool;
  MEMORY[0x19AEABCC8](&v8, a3);
  WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&self->_anon_38[344], &v8, v5, (uint64_t)v9);
  v9[0] = (uint64_t *)&v8;
  WebKit::WebProcessPool::sendToAllProcesses<Messages::WebProcess::RegisterURLSchemeAsCanDisplayOnlyIfCanRequest>((uint64_t)p_processPool, v9, 0);
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (id)_objectForBundleParameter:(id)a3
{
  return (id)objc_msgSend(*(id *)&self->_anon_38[600], "objectForKey:", a3);
}

- (_WKDownloadDelegate)_downloadDelegate
{
  return (_WKDownloadDelegate *)objc_loadWeak(&self->_downloadDelegate.m_weakReference);
}

- (_WKAutomationDelegate)_automationDelegate
{
  return (_WKAutomationDelegate *)objc_loadWeak(&self->_automationDelegate.m_weakReference);
}

- (void)_setAutomationDelegate:(id)a3
{
  _QWORD *v5;
  _QWORD *v6;

  objc_storeWeak(&self->_automationDelegate.m_weakReference, a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  WebKit::AutomationClient::AutomationClient((uint64_t)v5, (uint64_t)self, a3);
  v6 = v5;
  WebKit::WebProcessPool::setAutomationClient((uint64_t)&self->_processPool, &v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
}

- (void)_automationCapabilitiesDidChange
{
  Inspector::RemoteInspector *v2;

  v2 = (Inspector::RemoteInspector *)Inspector::RemoteInspector::singleton((Inspector::RemoteInspector *)self);
  Inspector::RemoteInspector::clientCapabilitiesDidChange(v2);
}

- (void)_setAutomationSession:(id)a3
{
  void *m_ptr;
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  CFTypeRef *v7;
  CFTypeRef *v8;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_automationSession.m_ptr;
  self->_automationSession.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
  p_processPool = &self->_processPool;
  if (a3)
  {
    v7 = (CFTypeRef *)((char *)a3 + 8);
    CFRetain(*((CFTypeRef *)a3 + 2));
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;
  WebKit::WebProcessPool::setAutomationSession((WebKit::WebProcessPool *)p_processPool, (uint64_t *)&v8);
  if (v8)
    CFRelease(v8[1]);
}

- (NSURL)_javaScriptConfigurationDirectory
{
  void *v2;
  const __CFString *v3;

  v2 = (void *)MEMORY[0x1E0C99E98];
  if (*(_QWORD *)&self->_anon_38[464])
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E351F1B8;
  return (NSURL *)objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
}

- (void)_setJavaScriptConfigurationDirectory:(id)a3
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  if (a3 && (objc_msgSend(a3, "isFileURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%@ is not a file URL"), a3);
  MEMORY[0x19AEABCC8](&v7, objc_msgSend(a3, "path"));
  WTF::String::operator=((WTF::StringImpl **)&self->_anon_38[464], (WTF::StringImpl *)&v7);
  v6 = v7;
  v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v5);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)_addSupportedPlugin:(id)a3 named:(id)a4 withMimeTypes:(id)a5 withExtensions:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  const WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  WTF::StringImpl **v23;
  WTF::StringImpl *v24;
  WTF::StringImpl *v25;
  WTF::StringImpl *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  WTF::StringImpl *v31[3];
  WTF::StringImpl *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  WTF::StringImpl **v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(a5);
        MEMORY[0x19AEABCC8](&v32, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v37, &v32, v13, (uint64_t)v31);
        v15 = v32;
        v32 = 0;
        if (v15)
        {
          if (*(_DWORD *)v15 == 2)
            WTF::StringImpl::destroy(v15, v14);
          else
            *(_DWORD *)v15 -= 2;
        }
      }
      v10 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v10);
  }
  v32 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(a6);
        MEMORY[0x19AEABCC8](&v26, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v32, &v26, v19, (uint64_t)v31);
        v21 = v26;
        v26 = 0;
        if (v21)
        {
          if (*(_DWORD *)v21 == 2)
            WTF::StringImpl::destroy(v21, v20);
          else
            *(_DWORD *)v21 -= 2;
        }
      }
      v16 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    }
    while (v16);
  }
  MEMORY[0x19AEABCC8](v31, a3);
  MEMORY[0x19AEABCC8](&v26, a4);
  v23 = (WTF::StringImpl **)v32;
  v32 = 0;
  if (v23)
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v23, v22);
  v24 = v26;
  v26 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy(v24, v22);
    else
      *(_DWORD *)v24 -= 2;
  }
  v25 = v31[0];
  v31[0] = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2)
      WTF::StringImpl::destroy(v25, v22);
    else
      *(_DWORD *)v25 -= 2;
  }
  if (v32)
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable((WTF::StringImpl **)v32, v22);
  if (v37)
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v37, v22);
}

- (void)_terminateServiceWorkers
{
  WebKit::WebProcessPool::terminateServiceWorkers((CFTypeRef *)&self->_processPool);
}

- (void)_setUseSeparateServiceWorkerProcess:(BOOL)a3
{
  WebKit::WebProcessPool::setUseSeparateServiceWorkerProcess(a3);
}

- (int)_prewarmedProcessIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->_anon_38[40];
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0 && (v4 = *(_QWORD *)(v3 + 136)) != 0)
    return *(_DWORD *)(v4 + 108);
  else
    return 0;
}

- (void)_clearWebProcessCache
{
  WebKit::WebProcessCache::clear(*(_QWORD *)&self->_anon_38[720]);
}

- (unint64_t)_webProcessCount
{
  return *(unsigned int *)&self->_anon_38[36];
}

- (int)_gpuProcessIdentifier
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self->_anon_38[128];
  if (v2 && (v3 = *(_QWORD *)(v2 + 136)) != 0)
    return *(_DWORD *)(v3 + 108);
  else
    return 0;
}

- (BOOL)_hasAudibleMediaActivity
{
  return self->_anon_38[776];
}

- (BOOL)_requestWebProcessTermination:(int)a3
{
  int v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  uint64_t v7;

  v3 = *(_DWORD *)&self->_anon_38[36];
  if (v3)
  {
    v4 = **(_QWORD **)&self->_anon_38[24];
    v5 = (unsigned int *)(v4 + 16);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
    v7 = *(_QWORD *)(v4 + 136);
    if (v7)
      LODWORD(v7) = *(_DWORD *)(v7 + 108);
    if ((_DWORD)v7 == a3)
      WebKit::WebProcessProxy::requestTermination((unsigned int *)v4, 2);
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v5);
  }
  return v3 != 0;
}

- (BOOL)_isWebProcessSuspended:(int)a3
{
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;

  v3 = *(unsigned int *)&self->_anon_38[36];
  if (!(_DWORD)v3)
    return 0;
  v5 = *(_QWORD **)&self->_anon_38[24];
  v6 = &v5[v3];
  while (1)
  {
    v7 = *v5;
    v8 = (unsigned int *)(*v5 + 16);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
    v10 = *(_QWORD *)(v7 + 136);
    if (v10)
      LODWORD(v10) = *(_DWORD *)(v10 + 108);
    if ((_DWORD)v10 == a3)
      break;
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v8);
    if (++v5 == v6)
      return 0;
  }
  if (*(_BYTE *)(v7 + 389))
    v11 = *(_QWORD *)(v7 + 224) == 0;
  else
    v11 = 0;
  WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v8);
  return v11;
}

- (void)_makeNextWebProcessLaunchFailForTesting
{
  self->_anon_38[474] = 1;
}

- (BOOL)_hasPrewarmedWebProcess
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  int v8;
  BOOL v9;
  BOOL v10;

  v2 = *(unsigned int *)&self->_anon_38[36];
  if (!(_DWORD)v2)
    return 0;
  v3 = *(_QWORD **)&self->_anon_38[24];
  v4 = &v3[v2];
  do
  {
    v5 = *v3;
    v6 = (unsigned int *)(*v3 + 16);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
    v8 = *(unsigned __int8 *)(v5 + 778);
    v9 = *(_BYTE *)(v5 + 778) != 0;
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v6);
    ++v3;
    if (v8)
      v10 = 1;
    else
      v10 = v3 == v4;
  }
  while (!v10);
  return v9;
}

- (unint64_t)_webProcessCountIgnoringPrewarmed
{
  unint64_t v3;

  v3 = -[WKProcessPool _webProcessCount](self, "_webProcessCount");
  return v3 - -[WKProcessPool _hasPrewarmedWebProcess](self, "_hasPrewarmedWebProcess");
}

- (unint64_t)_webProcessCountIgnoringPrewarmedAndCached
{
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;

  v2 = *(unsigned int *)&self->_anon_38[36];
  if (!(_DWORD)v2)
    return 0;
  v3 = 0;
  v4 = *(_QWORD **)&self->_anon_38[24];
  v5 = &v4[v2];
  do
  {
    v6 = *v4;
    v7 = (unsigned int *)(*v4 + 16);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 + 1, v7));
    if (!*(_BYTE *)(v6 + 712) && !*(_BYTE *)(v6 + 778))
      ++v3;
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v7);
    ++v4;
  }
  while (v4 != v5);
  return v3;
}

- (unint64_t)_webPageContentProcessCount
{
  unint64_t v2;

  v2 = *(unsigned int *)&self->_anon_38[36];
  if (WebKit::WebProcessPool::s_useSeparateServiceWorkerProcess)
    v2 -= WebKit::WebProcessPool::serviceWorkerProxiesCount((WebKit::WebProcessPool *)&self->_processPool);
  return v2;
}

- (unint64_t)_pluginProcessCount
{
  return 0;
}

- (unint64_t)_maximumSuspendedPageCount
{
  return *(unsigned int *)(*(_QWORD *)&self->_anon_38[712] + 16);
}

- (unint64_t)_processCacheCapacity
{
  return *(unsigned int *)(*(_QWORD *)&self->_anon_38[720] + 4);
}

- (unint64_t)_processCacheSize
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)&self->_anon_38[720] + 16);
  if (v2)
    return *(unsigned int *)(v2 - 12);
  else
    return 0;
}

- (unint64_t)_serviceWorkerProcessCount
{
  return WebKit::WebProcessPool::serviceWorkerProxiesCount((WebKit::WebProcessPool *)&self->_processPool);
}

- (void)_isJITDisabledInAllRemoteWorkerProcesses:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BCE08;
  v5[1] = v4;
  v6 = v5;
  WebKit::WebProcessPool::isJITDisabledInAllRemoteWorkerProcesses((uint64_t)&self->_processPool, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

+ (void)_setCaptivePortalModeEnabledGloballyForTesting:(BOOL)a3
{
  WebKit::setLockdownModeEnabledGloballyForTesting(a3 | 0x100);
}

+ (void)_clearCaptivePortalModeEnabledGloballyForTesting
{
  WebKit::setLockdownModeEnabledGloballyForTesting(0);
}

- (BOOL)_isCookieStoragePartitioningEnabled
{
  return self->_anon_38[632];
}

- (void)_setCookieStoragePartitioningEnabled:(BOOL)a3
{
  self->_anon_38[632] = a3;
}

- (_WKGeolocationCoreLocationProvider)_coreLocationProvider
{
  return (_WKGeolocationCoreLocationProvider *)self->_coreLocationProvider.m_ptr;
}

- (void)_setCoreLocationProvider:(id)a3
{
  void *m_ptr;

  if (self->_geolocationProvider.m_ptr)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Changing the location provider is not supported after a web view in the process pool has begun servicing geolocation requests."));
  if (a3)
    CFRetain(a3);
  m_ptr = self->_coreLocationProvider.m_ptr;
  self->_coreLocationProvider.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id)_downloadURLRequest:(id)a3 websiteDataStore:(id)a4 originatingWebView:(id)a5
{
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  WebKit::WebsiteDataStore *v7;
  WebKit::WebPageProxy *v8;
  const void *v9;
  WTF::StringImpl *v10;
  _WKDownload *v11;
  const WebKit::DownloadProxy *v12;
  WTF::StringImpl *v13;
  CFTypeRef v14;
  WTF::StringImpl *v16;
  _BYTE v17[192];
  CFTypeRef cf;
  WebKit::WebPageProxy *v19;
  const WebKit::DownloadProxy *v20;

  p_processPool = &self->_processPool;
  v7 = (WebKit::WebsiteDataStore *)((char *)a4 + 8);
  if (a5)
  {
    objc_msgSend(a5, "_page");
    v8 = v19;
  }
  else
  {
    v8 = 0;
    v19 = 0;
  }
  MEMORY[0x19AEAEC20](v17, a3);
  v16 = 0;
  WebKit::WebProcessPool::download((WebKit::WebProcessPool *)p_processPool, v7, v8, (const WebCore::ResourceRequest *)v17, (const WTF::String *)&v16, &v20);
  v9 = (const void *)*((_QWORD *)v20 + 1);
  if (v9)
    CFRetain(*((CFTypeRef *)v20 + 1));
  v11 = +[_WKDownload downloadWithDownload:](_WKDownload, "downloadWithDownload:", v9);
  if (v9)
    CFRelease(v9);
  v12 = v20;
  v20 = 0;
  if (v12)
    CFRelease(*((CFTypeRef *)v12 + 1));
  v13 = v16;
  v16 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v10);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = cf;
  cf = 0;
  if (v14)
    CFRelease(v14);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v17);
  return v11;
}

- (id)_resumeDownloadFromData:(id)a3 websiteDataStore:(id)a4 path:(id)a5 originatingWebView:(id)a6
{
  WebKit::WebPageProxy *v10;
  WebKit *v11;
  const void *v12;
  WTF::StringImpl *v13;
  _WKDownload *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  WebKit *v17;
  WTF::StringImpl *v19;
  CFTypeRef cf;
  WebKit *v21;
  WebKit::WebPageProxy *v22;
  uint64_t v23;

  if (a6)
  {
    objc_msgSend(a6, "_page");
    v10 = v22;
  }
  else
  {
    v10 = 0;
    v22 = 0;
  }
  cf = a3;
  if (a3)
    CFRetain(a3);
  API::Data::createWithoutCopying((id *)&cf, &v21);
  v11 = v21;
  MEMORY[0x19AEABCC8](&v19, a5);
  WebKit::WebProcessPool::resumeDownload((WebKit::WebProcessPool *)&self->_processPool, (WebKit::WebsiteDataStore *)((char *)a4 + 8), v10, (uint64_t)v11, (uint64_t)&v19, 0, &v23);
  v12 = *(const void **)(v23 + 8);
  if (v12)
    CFRetain(*(CFTypeRef *)(v23 + 8));
  v14 = +[_WKDownload downloadWithDownload:](_WKDownload, "downloadWithDownload:", v12);
  if (v12)
    CFRelease(v12);
  v15 = v23;
  v23 = 0;
  if (v15)
    CFRelease(*(CFTypeRef *)(v15 + 8));
  v16 = v19;
  v19 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v13);
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v21;
  v21 = 0;
  if (v17)
    CFRelease(*((CFTypeRef *)v17 + 1));
  if (cf)
    CFRelease(cf);
  return v14;
}

- (void)_getActivePagesOriginsInWebProcessForTesting:(int)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v7 = off_1E34BCE30;
  v7[1] = v6;
  v9 = v7;
  WebKit::WebProcessPool::activePagesOriginsInWebProcessForTesting((uint64_t)&self->_processPool, a3, (uint64_t *)&v9);
  v8 = (uint64_t)v9;
  v9 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  _Block_release(0);
}

- (void)_clearPermanentCredentialsForProtectionSpace:(id)a3
{
  ObjectStorage<WebKit::WebProcessPool> *p_processPool;
  WTF::StringImpl *v4;
  CFTypeRef v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  CFTypeRef cf;

  p_processPool = &self->_processPool;
  WebCore::ProtectionSpace::ProtectionSpace((WebCore::ProtectionSpace *)&v8, (NSURLProtectionSpace *)a3);
  WebKit::WebProcessPool::clearPermanentCredentialsForProtectionSpace((uint64_t)p_processPool, (WebCore::ProtectionSpace *)&v8);
  v5 = cf;
  cf = 0;
  if (v5)
    CFRelease(v5);
  v6 = v9;
  v9 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v8;
  v8 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v4);
    else
      *(_DWORD *)v7 -= 2;
  }
}

- (void)_seedResourceLoadStatisticsForTestingWithFirstParty:(id)a3 thirdParty:(id)a4 shouldScheduleNotification:(BOOL)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  _QWORD *v17;
  WTF::StringImpl *v18[5];
  WTF::StringImpl *v19;
  WTF::StringImpl *v20[5];
  WTF::StringImpl *v21;

  MEMORY[0x19AEABB18](v20, a3);
  WebCore::RegistrableDomain::RegistrableDomain(&v21, (const WTF::URL *)v20);
  MEMORY[0x19AEABB18](v18, a4);
  WebCore::RegistrableDomain::RegistrableDomain(&v19, (const WTF::URL *)v18);
  v10 = _Block_copy(a6);
  v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v11 = off_1E34BCE58;
  v11[1] = v10;
  v17 = v11;
  WebKit::WebProcessPool::seedResourceLoadStatisticsForTesting((uint64_t)&self->_processPool, (uint64_t *)&v21, (uint64_t *)&v19, a5, (uint64_t *)&v17);
  if (v17)
    (*(void (**)(_QWORD *))(*v17 + 8))(v17);
  _Block_release(0);
  v13 = v19;
  v19 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v18[0];
  v18[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v12);
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v21;
  v21 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v12);
    else
      *(_DWORD *)v15 -= 2;
  }
  v16 = v20[0];
  v20[0] = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v12);
    else
      *(_DWORD *)v16 -= 2;
  }
}

+ (void)_setWebProcessCountLimit:(unsigned int)a3
{
  WebKit::s_maxProcessCount = a3;
}

- (void)_garbageCollectJavaScriptObjectsForTesting
{
  char v2;

  v2 = 0;
  WebKit::WebProcessPool::sendToAllProcesses<Messages::WebProcess::GarbageCollectJavaScriptObjects>((uint64_t)&self->_processPool, &v2, 0);
}

- (unint64_t)_numberOfConnectedGamepadsForTesting
{
  {
    WebKit::UIGamepadProvider::UIGamepadProvider((WebKit::UIGamepadProvider *)&WebKit::UIGamepadProvider::singleton(void)::sharedProvider);
  }
  return dword_1EE341F74;
}

- (unint64_t)_numberOfConnectedHIDGamepadsForTesting
{
  return 0;
}

- (unint64_t)_numberOfConnectedGameControllerFrameworkGamepadsForTesting
{
  return 0;
}

- (void)_terminateAllWebContentProcesses
{
  WebKit::WebProcessPool::terminateAllWebContentProcesses((WebKit::WebProcessPool *)&self->_processPool);
}

- (OpaqueWKNotificationManager)_notificationManagerForTesting
{
  OpaqueWKNotificationManager *result;
  _QWORD v3[2];

  v3[0] = "WebNotificationManagerProxy";
  v3[1] = 28;
  result = (OpaqueWKNotificationManager *)WTF::HashMap<WTF::ASCIILiteral,WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)&self->_anon_38[408], (WTF::ASCIILiteralHash *)v3);
  if (result)
    return (OpaqueWKNotificationManager *)*((_QWORD *)result - 1);
  return result;
}

+ (id)_gpuProcessInfo
{
  unint64_t v2;
  _WKProcessInfo *v3;
  _WKProcessInfo *v4;
  _BYTE v6[32];
  unsigned __int8 v7;

  v2 = (unint64_t)&_MergedGlobals_106;
    goto LABEL_10;
  if (!WebKit::singleton(void)::singleton)
  {
LABEL_7:
    v3 = 0;
    return (id)(id)CFMakeCollectable(v3);
  }
  v3 = *(_WKProcessInfo **)(WebKit::singleton(void)::singleton + 8);
  if (v3)
  {
    WebKit::AuxiliaryProcessProxy::taskInfo((uint64_t)v3, (uint64_t)v6);
    if (v7)
    {
      v4 = [_WKProcessInfo alloc];
      v2 = v7;
      if (v7)
      {
        v3 = -[_WKProcessInfo initWithTaskInfo:](v4, "initWithTaskInfo:", v6);
        return (id)(id)CFMakeCollectable(v3);
      }
      __break(1u);
LABEL_10:
      v3 = 0;
      WebKit::singleton(void)::singleton = 0;
      *(_BYTE *)(v2 + 2320) = 1;
      return (id)(id)CFMakeCollectable(v3);
    }
    goto LABEL_7;
  }
  return (id)(id)CFMakeCollectable(v3);
}

+ (id)_networkingProcessInfo
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  id result;
  const void *v8;
  _BYTE v9[32];
  char v10;
  uint64_t *v11;
  unsigned int v12;

  v2 = (void *)objc_opt_new();
  WebKit::NetworkProcessProxy::allNetworkProcesses(v3, (uint64_t)&v11);
  if (!v12)
  {
LABEL_8:
    WTF::Vector<WTF::Ref<WebKit::NetworkProcessProxy,WTF::RawPtrTraits<WebKit::NetworkProcessProxy>,WTF::DefaultRefDerefTraits<WebKit::NetworkProcessProxy>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v11, v4);
    return (id)(id)CFMakeCollectable(v2);
  }
  v5 = v11;
  v6 = 8 * v12;
  while (1)
  {
    WebKit::AuxiliaryProcessProxy::taskInfo(*v5, (uint64_t)v9);
    if (v10)
      break;
LABEL_7:
    ++v5;
    v6 -= 8;
    if (!v6)
      goto LABEL_8;
  }
  result = [_WKProcessInfo alloc];
  if (v10)
  {
    v8 = (const void *)objc_msgSend(result, "initWithTaskInfo:", v9);
    objc_msgSend(v2, "addObject:", v8);
    if (v8)
      CFRelease(v8);
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

+ (id)_webContentProcessInfo
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id result;
  const void *v10;
  _BYTE v11[32];
  char v12;
  uint64_t v13;
  unsigned int v14;

  v2 = (void *)objc_opt_new();
  WebKit::WebProcessPool::allProcessPools((uint64_t)&v13);
  if (!v14)
  {
LABEL_11:
    WTF::Vector<WTF::Ref<WebKit::WebProcessPool,WTF::RawPtrTraits<WebKit::WebProcessPool>,WTF::DefaultRefDerefTraits<WebKit::WebProcessPool>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v13, v3);
    return (id)(id)CFMakeCollectable(v2);
  }
  v4 = v13;
  v5 = v13 + 8 * v14;
  while (1)
  {
    v6 = *(unsigned int *)(*(_QWORD *)v4 + 84);
    if ((_DWORD)v6)
      break;
LABEL_10:
    v4 += 8;
    if (v4 == v5)
      goto LABEL_11;
  }
  v7 = *(uint64_t **)(*(_QWORD *)v4 + 72);
  v8 = 8 * v6;
  while (1)
  {
    WebKit::AuxiliaryProcessProxy::taskInfo(*v7, (uint64_t)v11);
    if (v12)
      break;
LABEL_9:
    ++v7;
    v8 -= 8;
    if (!v8)
      goto LABEL_10;
  }
  result = [_WKWebContentProcessInfo alloc];
  if (v12)
  {
    v10 = (const void *)objc_msgSend(result, "initWithTaskInfo:process:", v11, *v7);
    objc_msgSend(v2, "addObject:", v10);
    if (v10)
      CFRelease(v10);
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

@end
