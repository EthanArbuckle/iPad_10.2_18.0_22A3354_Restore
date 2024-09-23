@implementation WKProcessGroup

- (WKProcessGroup)init
{
  return -[WKProcessGroup initWithInjectedBundleURL:](self, "initWithInjectedBundleURL:", 0);
}

- (WKProcessGroup)initWithInjectedBundleURL:(id)a3
{
  WKProcessGroup *v4;
  uint64_t v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WebKit::WebProcessPool *v8;
  WebKit::WebProcessPool *v9;
  WebProcessPool *m_ptr;
  WebProcessPool *v11;
  void *v12;
  objc_super v14;
  WTF::StringImpl *v15[2];
  __int128 v16;
  void (*v17)(uint64_t, uint64_t, void *, void *, void *);
  void (*v18)(uint64_t, uint64_t, void *, void *, void *);
  uint64_t v19;

  v14.receiver = self;
  v14.super_class = (Class)WKProcessGroup;
  v4 = -[WKProcessGroup init](&v14, sel_init);
  if (v4)
  {
    v5 = API::Object::newObject(0xA8uLL, 90);
    API::ProcessPoolConfiguration::ProcessPoolConfiguration((API::ProcessPoolConfiguration *)v5);
    if (a3)
      MEMORY[0x19AEABCC8](v15, objc_msgSend(a3, "path"));
    else
      v15[0] = 0;
    WTF::String::operator=((WTF::StringImpl **)(v5 + 16), (WTF::StringImpl *)v15);
    v7 = v15[0];
    v15[0] = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        v7 = (WTF::StringImpl *)WTF::StringImpl::destroy(v7, v6);
      else
        *(_DWORD *)v7 -= 2;
    }
    WebKit::InitializeWebKit2(v7);
    v8 = (WebKit::WebProcessPool *)API::Object::newObject(0x3C8uLL, 89);
    v9 = WebKit::WebProcessPool::WebProcessPool(v8, (API::ProcessPoolConfiguration *)v5);
    m_ptr = v4->_processPool.m_ptr;
    v4->_processPool.m_ptr = (WebProcessPool *)v9;
    if (m_ptr)
    {
      CFRelease(*((CFTypeRef *)m_ptr + 1));
      v9 = (WebKit::WebProcessPool *)v4->_processPool.m_ptr;
    }
    if (v9)
      v9 = (WebKit::WebProcessPool *)*((_QWORD *)v9 + 1);
    v16 = 0u;
    v15[0] = (WTF::StringImpl *)1;
    v17 = 0;
    v15[1] = (WTF::StringImpl *)v4;
    WKContextSetInjectedBundleClient(v9, (__int128 *)v15);
    v11 = v4->_processPool.m_ptr;
    if (v11)
      v12 = (void *)*((_QWORD *)v11 + 1);
    else
      v12 = 0;
    v15[0] = 0;
    v15[1] = (WTF::StringImpl *)v4;
    *(_QWORD *)&v16 = didNavigateWithNavigationData;
    *((_QWORD *)&v16 + 1) = didPerformClientRedirect;
    v17 = didPerformServerRedirect;
    v18 = didUpdateHistoryTitle;
    v19 = 0;
    WKContextSetHistoryClient(v12, (__int128 *)v15);
    CFRelease(*(CFTypeRef *)(v5 + 8));
  }
  return v4;
}

- (WKProcessGroup)initWithInjectedBundleURL:(id)a3 andCustomClassesForParameterCoder:(id)a4
{
  WKProcessGroup *v5;
  uint64_t v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WebKit::WebProcessPool *v9;
  WebKit::WebProcessPool *v10;
  WebProcessPool *m_ptr;
  WebProcessPool *v12;
  void *v13;
  objc_super v15;
  WTF::StringImpl *v16[2];
  __int128 v17;
  void (*v18)(uint64_t, uint64_t, void *, void *, void *);
  void (*v19)(uint64_t, uint64_t, void *, void *, void *);
  uint64_t v20;

  v15.receiver = self;
  v15.super_class = (Class)WKProcessGroup;
  v5 = -[WKProcessGroup init](&v15, sel_init, a3, a4);
  if (v5)
  {
    v6 = API::Object::newObject(0xA8uLL, 90);
    API::ProcessPoolConfiguration::ProcessPoolConfiguration((API::ProcessPoolConfiguration *)v6);
    if (a3)
      MEMORY[0x19AEABCC8](v16, objc_msgSend(a3, "path"));
    else
      v16[0] = 0;
    WTF::String::operator=((WTF::StringImpl **)(v6 + 16), (WTF::StringImpl *)v16);
    v8 = v16[0];
    v16[0] = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        v8 = (WTF::StringImpl *)WTF::StringImpl::destroy(v8, v7);
      else
        *(_DWORD *)v8 -= 2;
    }
    WebKit::InitializeWebKit2(v8);
    v9 = (WebKit::WebProcessPool *)API::Object::newObject(0x3C8uLL, 89);
    v10 = WebKit::WebProcessPool::WebProcessPool(v9, (API::ProcessPoolConfiguration *)v6);
    m_ptr = v5->_processPool.m_ptr;
    v5->_processPool.m_ptr = (WebProcessPool *)v10;
    if (m_ptr)
    {
      CFRelease(*((CFTypeRef *)m_ptr + 1));
      v10 = (WebKit::WebProcessPool *)v5->_processPool.m_ptr;
    }
    if (v10)
      v10 = (WebKit::WebProcessPool *)*((_QWORD *)v10 + 1);
    v17 = 0u;
    v16[0] = (WTF::StringImpl *)1;
    v18 = 0;
    v16[1] = (WTF::StringImpl *)v5;
    WKContextSetInjectedBundleClient(v10, (__int128 *)v16);
    v12 = v5->_processPool.m_ptr;
    if (v12)
      v13 = (void *)*((_QWORD *)v12 + 1);
    else
      v13 = 0;
    v16[0] = 0;
    v16[1] = (WTF::StringImpl *)v5;
    *(_QWORD *)&v17 = didNavigateWithNavigationData;
    *((_QWORD *)&v17 + 1) = didPerformClientRedirect;
    v18 = didPerformServerRedirect;
    v19 = didUpdateHistoryTitle;
    v20 = 0;
    WKContextSetHistoryClient(v13, (__int128 *)v16);
    CFRelease(*(CFTypeRef *)(v6 + 8));
  }
  return v5;
}

- (void).cxx_destruct
{
  void *m_ptr;
  WebProcessPool *v4;

  m_ptr = self->_geolocationProvider.m_ptr;
  self->_geolocationProvider.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_processPool.m_ptr;
  self->_processPool.m_ptr = 0;
  if (v4)
    CFRelease(*((CFTypeRef *)v4 + 1));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (OpaqueWKContext)_contextRef
{
  WebProcessPool *m_ptr;

  m_ptr = self->_processPool.m_ptr;
  if (m_ptr)
    return (OpaqueWKContext *)*((_QWORD *)m_ptr + 1);
  else
    return 0;
}

- (WKGeolocationProviderIOS)_geolocationProvider
{
  WKGeolocationProviderIOS *result;
  void *m_ptr;

  result = (WKGeolocationProviderIOS *)self->_geolocationProvider.m_ptr;
  if (!result)
  {
    result = -[WKGeolocationProviderIOS initWithProcessPool:]([WKGeolocationProviderIOS alloc], "initWithProcessPool:", self->_processPool.m_ptr);
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

@end
