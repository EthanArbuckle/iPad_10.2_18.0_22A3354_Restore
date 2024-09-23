@implementation WKGeolocationProviderIOS

- (void)_startUpdating
{
  const WTF::StringImpl *v3;
  WebGeolocationPosition *m_ptr;

  self->_isWebCoreGeolocationActive = 1;
  objc_msgSend(self->_coreLocationProvider.m_ptr, "start");
  m_ptr = self->_lastActivePosition.m_ptr;
  if (m_ptr)
    WebKit::WebGeolocationManagerProxy::providerDidChangePosition((WebKit::WebGeolocationManagerProxy *)self->_geolocationManager.m_ptr, (WebKit::WebGeolocationPosition *)m_ptr, v3);
}

- (void)_stopUpdating
{
  WebGeolocationPosition *m_ptr;

  self->_isWebCoreGeolocationActive = 0;
  objc_msgSend(self->_coreLocationProvider.m_ptr, "stop");
  m_ptr = self->_lastActivePosition.m_ptr;
  self->_lastActivePosition.m_ptr = 0;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
}

- (void)_setEnableHighAccuracy:(BOOL)a3
{
  objc_msgSend(self->_coreLocationProvider.m_ptr, "setEnableHighAccuracy:", a3);
}

- (WKGeolocationProviderIOS)init
{

  return 0;
}

- (WKGeolocationProviderIOS)initWithProcessPool:(void *)a3
{
  WKGeolocationProviderIOS *v4;
  const char *v5;
  WebGeolocationManagerProxy *v6;
  WebGeolocationManagerProxy *m_ptr;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  uint64_t (*v14)(uint64_t, void *);
  uint64_t (*v15)(uint64_t, void *);
  uint64_t (*v16)(uint64_t, uint64_t, void *);
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WKGeolocationProviderIOS;
  v4 = -[WKGeolocationProviderIOS init](&v17, sel_init);
  if (v4)
  {
    CFRetain(*((CFTypeRef *)a3 + 1));
    if (objc_msgSend(*((id *)a3 + 1), "_coreLocationProvider"))
    {
      *(_QWORD *)&v13 = "WebGeolocationManagerProxy";
      *((_QWORD *)&v13 + 1) = 27;
      v5 = WTF::HashMap<WTF::ASCIILiteral,WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<WTF::RefPtr<WebKit::WebContextSupplement,WTF::RawPtrTraits<WebKit::WebContextSupplement>,WTF::DefaultRefDerefTraits<WebKit::WebContextSupplement>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)a3 + 57, (WTF::ASCIILiteralHash *)&v13);
      if (v5)
        v6 = (WebGeolocationManagerProxy *)(v5 - 16);
      else
        v6 = 0;
      if (v5)
        CFRetain(*((CFTypeRef *)v5 - 1));
      m_ptr = v4->_geolocationManager.m_ptr;
      v4->_geolocationManager.m_ptr = v6;
      if (m_ptr)
      {
        CFRelease(*((CFTypeRef *)m_ptr + 1));
        v6 = v4->_geolocationManager.m_ptr;
      }
      *(_QWORD *)&v13 = 1;
      *((_QWORD *)&v13 + 1) = v4;
      v14 = startUpdatingCallback;
      v15 = stopUpdatingCallback;
      v16 = setEnableHighAccuracy;
      if (v6)
        v8 = (void *)*((_QWORD *)v6 + 1);
      else
        v8 = 0;
      WKGeolocationManagerSetProvider(v8, &v13);
      v9 = (void *)objc_msgSend(*((id *)a3 + 1), "_coreLocationProvider");
      v10 = v9;
      if (v9)
        CFRetain(v9);
      v11 = v4->_coreLocationProvider.m_ptr;
      v4->_coreLocationProvider.m_ptr = v10;
      if (v11)
      {
        CFRelease(v11);
        v10 = v4->_coreLocationProvider.m_ptr;
      }
      objc_msgSend(v10, "setListener:", v4);
    }
    CFRelease(*((CFTypeRef *)a3 + 1));
  }
  return v4;
}

- (void)decidePolicyForGeolocationRequestFromOrigin:(void *)a3 completionHandler:(void *)a4 view:(id)a5
{
  char *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t m_end;
  unint64_t m_start;
  uint64_t m_capacity;
  uint64_t v17;
  unint64_t v18;
  GeolocationRequestData *m_buffer;
  unsigned int v20;
  GeolocationRequestData *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *m_ptr;
  WTF::StringImpl *v30;
  _QWORD *v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  _QWORD *v34;
  WTF::StringImpl *v35;
  _BYTE v36[33];
  __int16 v37;
  _QWORD v38[25];
  _QWORD v39[5];
  __int128 v40;
  _OWORD v41[2];
  uint64_t v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = (char *)a3 + 208;
  WebCore::RegistrableDomain::RegistrableDomain(&v35, (const WebCore::SecurityOriginData *)((char *)a3 + 208));
  MEMORY[0x19AEABB18](v36, objc_msgSend(a5, "URL"));
  v37 = *(_WORD *)a3;
  WebCore::ResourceRequestBase::ResourceRequestBase((uint64_t)v38, (uint64_t)a3 + 8);
  v10 = *((_QWORD *)a3 + 25);
  *((_QWORD *)a3 + 25) = 0;
  v38[24] = v10;
  std::__variant_detail::__move_constructor<std::__variant_detail::__traits<WebCore::SecurityOriginData::Tuple,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::OpaqueOriginIdentifierType,WTF::ObjectIdentifierThreadSafeAccessTraits<unsigned long long>,unsigned long long>>>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v39, (uint64_t)v9);
  v11 = *((_QWORD *)a3 + 30);
  *((_QWORD *)a3 + 30) = 0;
  v39[4] = v11;
  *(_OWORD *)((char *)v41 + 14) = *(_OWORD *)((char *)a3 + 278);
  v12 = *(_OWORD *)((char *)a3 + 264);
  v40 = *(_OWORD *)((char *)a3 + 248);
  v41[0] = v12;
  v13 = *(_QWORD *)a4;
  *(_QWORD *)a4 = 0;
  v42 = v13;
  v43 = a5;
  if (a5)
    CFRetain(a5);
  m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  m_end = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  if (m_start)
  {
    if (m_end + 1 != m_start)
      goto LABEL_22;
    LODWORD(m_capacity) = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
  }
  else
  {
    m_capacity = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
    if (m_end)
    {
      if (m_end != m_capacity - 1)
        goto LABEL_22;
    }
    else if ((_DWORD)m_capacity)
    {
      m_end = 0;
      goto LABEL_22;
    }
  }
  v17 = m_capacity;
  v18 = ((unint64_t)m_capacity >> 2) + m_capacity;
  if (v18 <= 0xF)
    v18 = 15;
  if (v18 >= 0xBA2E8B)
  {
    __break(0xC471u);
    return;
  }
  m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
  v20 = 352 * v18 + 352;
  v21 = (GeolocationRequestData *)WTF::fastMalloc((WTF *)(352 * v18 + 352));
  self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity = v20 / 0x160;
  self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer = v21;
  v23 = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  v22 = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  if (v23 <= v22)
  {
    WTF::VectorMover<false,GeolocationRequestData>::move((GeolocationRequestData *)((char *)m_buffer + 352 * v23), (GeolocationRequestData *)((char *)m_buffer + 352 * v22), (uint64_t)v21 + 352 * v23);
  }
  else
  {
    WTF::VectorMover<false,GeolocationRequestData>::move(m_buffer, (GeolocationRequestData *)((char *)m_buffer + 352 * v22), (uint64_t)v21);
    v24 = self->_requestsWaitingForCoreLocationAuthorization.m_start;
    v25 = v24 - v17 + self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
    WTF::VectorMover<false,GeolocationRequestData>::move((GeolocationRequestData *)((char *)m_buffer + 352 * v24), (GeolocationRequestData *)((char *)m_buffer + 352 * v17), (uint64_t)self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer + 352 * v25);
    self->_requestsWaitingForCoreLocationAuthorization.m_start = v25;
  }
  if (m_buffer)
  {
    if (self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer == m_buffer)
    {
      self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer = 0;
      self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity = 0;
    }
    WTF::fastFree((WTF *)m_buffer, v26);
  }
  m_end = self->_requestsWaitingForCoreLocationAuthorization.m_end;
LABEL_22:
  GeolocationRequestData::GeolocationRequestData((uint64_t)self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer + 352 * m_end, (uint64_t)v36);
  v27 = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  if (v27 == self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity - 1)
    v28 = 0;
  else
    v28 = v27 + 1;
  self->_requestsWaitingForCoreLocationAuthorization.m_end = v28;
  m_ptr = self->_coreLocationProvider.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "requestGeolocationAuthorization");
  }
  else
  {
    CFRetain(self);
    v31 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v31 = &off_1E34CDE18;
    v31[1] = self;
    v31[2] = self;
    v34 = v31;
    WebCore::CoreLocationGeolocationProvider::requestAuthorization();
    if (v34)
      (*(void (**)(_QWORD *))(*v34 + 8))(v34);
  }
  GeolocationRequestData::~GeolocationRequestData((GeolocationRequestData *)v36, v30);
  v33 = v35;
  v35 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2)
      WTF::StringImpl::destroy(v33, v32);
    else
      *(_DWORD *)v33 -= 2;
  }
}

- (void).cxx_destruct
{
  unint64_t m_start;
  unint64_t m_end;
  GeolocationRequestData *m_buffer;
  uint64_t v6;
  uint64_t v7;
  uint64_t m_capacity;
  uint64_t v9;
  GeolocationRequestData *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GeolocationRequestData *v14;
  unint64_t v15;
  uint64_t v16;
  WebGeolocationPosition *m_ptr;
  void *v18;
  WebGeolocationManagerProxy *v19;

  m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  m_end = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
  if (m_start <= m_end)
  {
    if (m_start == m_end)
      goto LABEL_14;
    v13 = 352 * m_start;
    v14 = (GeolocationRequestData *)((char *)m_buffer + v13);
    v15 = 352 * m_end - v13;
    do
    {
      GeolocationRequestData::~GeolocationRequestData(v14, (WTF::StringImpl *)a2);
      v14 = (GeolocationRequestData *)(v16 + 352);
      v15 -= 352;
    }
    while (v15);
  }
  else
  {
    if (m_end)
    {
      v6 = 352 * m_end;
      do
      {
        GeolocationRequestData::~GeolocationRequestData(m_buffer, (WTF::StringImpl *)a2);
        m_buffer = (GeolocationRequestData *)(v7 + 352);
        v6 -= 352;
      }
      while (v6);
      m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
      m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
    }
    m_capacity = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
    if (m_start != m_capacity)
    {
      v9 = 352 * m_start;
      v10 = (GeolocationRequestData *)((char *)m_buffer + v9);
      v11 = 352 * m_capacity - v9;
      do
      {
        GeolocationRequestData::~GeolocationRequestData(v10, (WTF::StringImpl *)a2);
        v10 = (GeolocationRequestData *)(v12 + 352);
        v11 -= 352;
      }
      while (v11);
    }
  }
  m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
LABEL_14:
  if (m_buffer)
  {
    self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer = 0;
    self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity = 0;
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
  }
  m_ptr = self->_lastActivePosition.m_ptr;
  self->_lastActivePosition.m_ptr = 0;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  v18 = self->_coreLocationProvider.m_ptr;
  self->_coreLocationProvider.m_ptr = 0;
  if (v18)
    CFRelease(v18);
  v19 = self->_geolocationManager.m_ptr;
  self->_geolocationManager.m_ptr = 0;
  if (v19)
    CFRelease(*((CFTypeRef *)v19 + 1));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (void)geolocationAuthorizationGranted
{
  unint64_t m_start;
  WTF::StringImpl *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  WebKit::CompletionHandlerCallChecker *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WKWebAllowDenyPolicyListener *v14;
  const void *v15;
  id v16;
  const WTF::URL *v17;
  WTF::StringImpl *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  char v25;
  uint64_t v26[3];
  int v27;
  _BYTE v28[40];
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  if (m_start != self->_requestsWaitingForCoreLocationAuthorization.m_end)
  {
    GeolocationRequestData::GeolocationRequestData((uint64_t)v28, (uint64_t)self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer + 352 * m_start);
    v5 = self->_requestsWaitingForCoreLocationAuthorization.m_start;
    if (v5 == self->_requestsWaitingForCoreLocationAuthorization.m_end)
    {
      __break(0xC471u);
      JUMPOUT(0x19728C774);
    }
    GeolocationRequestData::~GeolocationRequestData((GeolocationRequestData *)((char *)self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer + 352 * v5), v4);
    v6 = self->_requestsWaitingForCoreLocationAuthorization.m_start;
    if (v6 == self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity - 1)
      v7 = 0;
    else
      v7 = v6 + 1;
    self->_requestsWaitingForCoreLocationAuthorization.m_start = v7;
    v8 = v30;
    v30 = 0;
    CFRetain(self);
    v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v9 = &off_1E34CDE40;
    v9[1] = v8;
    v9[2] = self;
    v24 = v9;
    v10 = (WebKit::CompletionHandlerCallChecker *)objc_msgSend(v31, "UIDelegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = v31[53];
      if (v11)
        CFRetain(*(CFTypeRef *)(v11 + 8));
      v26[0] = v11;
      v12 = API::Object::newObject(0x140uLL, 60);
      v13 = API::FrameInfo::FrameInfo(v12, (uint64_t)&v29, v26);
      v14 = *(WKWebAllowDenyPolicyListener **)(v13 + 8);
      if (v14)
      {
        CFRetain(*(CFTypeRef *)(v13 + 8));
        v15 = *(const void **)(v12 + 8);
      }
      else
      {
        v15 = 0;
      }
      CFRelease(v15);
      if (v26[0])
        CFRelease(*(CFTypeRef *)(v26[0] + 8));
      WebKit::CompletionHandlerCallChecker::create(v10, (objc_object *)sel__webView_requestGeolocationAuthorizationForURL_frame_decisionHandler_, v26);
      v19 = v31;
      v20 = WTF::URL::operator NSURL *();
      v24 = 0;
      v21 = v26[0];
      v22 = malloc_type_malloc(0x30uLL, 0x10E004002B5D1D8uLL);
      *v22 = MEMORY[0x1E0C809A0];
      v22[1] = 50331650;
      v22[2] = WTF::BlockPtr<void ()(BOOL)>::fromCallable<-[WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener) geolocationAuthorizationGranted]::$_1>(-[WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener) geolocationAuthorizationGranted]::$_1)::{lambda(void *,BOOL)#1}::__invoke;
      v22[3] = &WTF::BlockPtr<void ()(BOOL)>::fromCallable<-[WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener) geolocationAuthorizationGranted]::$_1>(-[WKGeolocationProviderIOS(WebGeolocationCoreLocationUpdateListener) geolocationAuthorizationGranted]::$_1)::descriptor;
      v22[4] = v9;
      v22[5] = v21;
      -[WebKit::CompletionHandlerCallChecker _webView:requestGeolocationAuthorizationForURL:frame:decisionHandler:](v10, "_webView:requestGeolocationAuthorizationForURL:frame:decisionHandler:", v19, v20, v14, v22);
      _Block_release(v22);
    }
    else
    {
      v14 = -[WKWebAllowDenyPolicyListener initWithCompletionHandler:]([WKWebAllowDenyPolicyListener alloc], "initWithCompletionHandler:", &v24);
      v16 = +[WKWebGeolocationPolicyDecider sharedPolicyDecider](WKWebGeolocationPolicyDecider, "sharedPolicyDecider");
      WebCore::SecurityOriginData::fromURLWithoutStrictOpaqueness((WebCore::SecurityOriginData *)v28, v17);
      objc_msgSend(v16, "decidePolicyForGeolocationRequestFromOrigin:requestingURL:view:listener:", v26, WTF::URL::operator NSURL *(), v31, v14);
      if (v27 != -1)
        ((void (*)(char *, uint64_t *))off_1E34CDDD8[v27])(&v25, v26);
    }
    if (v14)
      CFRelease(v14);
    v23 = v24;
    v24 = 0;
    if (v23)
      (*(void (**)(_QWORD *))(*v23 + 8))(v23);
    GeolocationRequestData::~GeolocationRequestData((GeolocationRequestData *)v28, v18);
  }
}

- (void)geolocationAuthorizationDenied
{
  unint64_t m_start;
  unint64_t m_end;
  GeolocationRequestData *m_buffer;
  unint64_t m_capacity;
  unint64_t v6;
  uint64_t v7;
  GeolocationRequestData *v8;
  uint64_t v9;
  GeolocationRequestData *v10;
  uint64_t v11;
  uint64_t v12;
  GeolocationRequestData *v13;
  uint64_t v14;
  uint64_t v15;

  m_start = self->_requestsWaitingForCoreLocationAuthorization.m_start;
  m_end = self->_requestsWaitingForCoreLocationAuthorization.m_end;
  self->_requestsWaitingForCoreLocationAuthorization.m_start = 0;
  self->_requestsWaitingForCoreLocationAuthorization.m_end = 0;
  m_buffer = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer;
  self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_buffer = 0;
  m_capacity = self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity;
  self->_requestsWaitingForCoreLocationAuthorization.m_buffer.m_capacity = 0;
  if (m_start != m_end)
  {
    v6 = m_start;
    do
    {
      (*(void (**)(_QWORD, _QWORD))(**((_QWORD **)m_buffer + 44 * v6 + 42) + 16))(*((_QWORD *)m_buffer + 44 * v6 + 42), 0);
      v6 += m_capacity + 1;
      do
        v6 -= m_capacity;
      while (v6 >= m_capacity);
    }
    while (m_end != v6);
    if (m_start <= m_end)
    {
      v13 = (GeolocationRequestData *)((char *)m_buffer + 352 * m_start);
      v14 = 352 * m_end - 352 * m_start;
      do
      {
        GeolocationRequestData::~GeolocationRequestData(v13, (WTF::StringImpl *)a2);
        v13 = (GeolocationRequestData *)(v15 + 352);
        v14 -= 352;
      }
      while (v14);
    }
    else
    {
      if (m_end)
      {
        v7 = 352 * m_end;
        v8 = m_buffer;
        do
        {
          GeolocationRequestData::~GeolocationRequestData(v8, (WTF::StringImpl *)a2);
          v8 = (GeolocationRequestData *)(v9 + 352);
          v7 -= 352;
        }
        while (v7);
      }
      if (m_start != m_capacity)
      {
        v10 = (GeolocationRequestData *)((char *)m_buffer + 352 * m_start);
        v11 = 352 * m_capacity - 352 * m_start;
        do
        {
          GeolocationRequestData::~GeolocationRequestData(v10, (WTF::StringImpl *)a2);
          v10 = (GeolocationRequestData *)(v12 + 352);
          v11 -= 352;
        }
        while (v11);
      }
    }
  }
  if (m_buffer)
    WTF::fastFree((WTF *)m_buffer, (void *)a2);
}

- (void)positionChanged:(id)a3
{
  WebGeolocationPosition *v4;
  WebGeolocationPosition *m_ptr;

  v4 = (WebGeolocationPosition *)((char *)a3 + 8);
  if (a3)
    CFRetain(*((CFTypeRef *)a3 + 2));
  m_ptr = self->_lastActivePosition.m_ptr;
  self->_lastActivePosition.m_ptr = v4;
  if (m_ptr)
  {
    CFRelease(*((CFTypeRef *)m_ptr + 1));
    v4 = self->_lastActivePosition.m_ptr;
  }
  WebKit::WebGeolocationManagerProxy::providerDidChangePosition((WebKit::WebGeolocationManagerProxy *)self->_geolocationManager.m_ptr, (WebKit::WebGeolocationPosition *)v4, (const WTF::StringImpl *)a3);
}

- (void)errorOccurred:(id)a3
{
  WebGeolocationManagerProxy *m_ptr;
  const WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  m_ptr = self->_geolocationManager.m_ptr;
  MEMORY[0x19AEABCC8](&v7, a3);
  WebKit::WebGeolocationManagerProxy::providerDidFailToDeterminePosition((WebKit::WebGeolocationManagerProxy *)m_ptr, (const WTF::String *)&v7, v4);
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

- (void)resetGeolocation
{
  const WTF::StringImpl *v2;

  WebKit::WebGeolocationManagerProxy::resetPermissions((WebKit::WebGeolocationManagerProxy *)self->_geolocationManager.m_ptr, (uint64_t)a2, v2);
}

- (_QWORD)decidePolicyForGeolocationRequestFromOrigin:(_QWORD *)a1 completionHandler:view:
{
  const void *v2;

  *a1 = &off_1E34CDE18;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)decidePolicyForGeolocationRequestFromOrigin:(WTF *)this completionHandler:(void *)a2 view:
{
  const void *v3;

  *(_QWORD *)this = &off_1E34CDE18;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)decidePolicyForGeolocationRequestFromOrigin:(uint64_t)a1 completionHandler:(int)a2 view:
{
  void *v2;

  v2 = *(void **)(a1 + 8);
  if (a2)
    return objc_msgSend(v2, "geolocationAuthorizationGranted");
  else
    return objc_msgSend(v2, "geolocationAuthorizationDenied");
}

@end
