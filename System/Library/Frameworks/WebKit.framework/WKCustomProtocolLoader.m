@implementation WKCustomProtocolLoader

- (WKCustomProtocolLoader)initWithLegacyCustomProtocolManagerProxy:(void *)a3 customProtocolID:()ObjectIdentifierGeneric<WebKit:()WTF:(unsigned long long>)a4 :(id)a5 ObjectIdentifierThreadSafeAccessTraits<uint64_t> :LegacyCustomProtocolIDType request:
{
  WKCustomProtocolLoader *v8;
  void *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *m_ptr;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WKCustomProtocolLoader;
  v8 = -[WKCustomProtocolLoader init](&v19, sel_init);
  if (v8)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 2, (uint64_t)a3);
    v10 = (unsigned int *)*((_QWORD *)a3 + 1);
    if (v10)
    {
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
    }
    m_ptr = (unsigned int *)v8->_customProtocolManagerProxy.m_impl.m_ptr;
    v8->_customProtocolManagerProxy.m_impl.m_ptr = (DefaultWeakPtrImpl *)v10;
    if (m_ptr)
    {
      do
      {
        v13 = __ldaxr(m_ptr);
        v14 = v13 - 1;
      }
      while (__stlxr(v14, m_ptr));
      if (!v14)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v9);
      }
    }
    v8->_customProtocolID = a4;
    v8->_storagePolicy = 2;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C58]), "initWithRequest:delegate:startImmediately:", a5, v8, 0);
    v16 = v8->_urlConnection.m_ptr;
    v8->_urlConnection.m_ptr = v15;
    if (v16)
    {
      CFRelease(v16);
      v15 = v8->_urlConnection.m_ptr;
    }
    v17 = objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    objc_msgSend(v15, "scheduleInRunLoop:forMode:", v17, *MEMORY[0x1E0C99860]);
    objc_msgSend(v8->_urlConnection.m_ptr, "start");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_urlConnection.m_ptr, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)WKCustomProtocolLoader;
  -[WKCustomProtocolLoader dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_customProtocolManagerProxy.m_impl.m_ptr;
  self->_customProtocolManagerProxy.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
  objc_msgSend(self->_urlConnection.m_ptr, "cancel");
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  DefaultWeakPtrImpl *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  WTF::StringImpl *v11;
  CFTypeRef v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  CFTypeRef cf;

  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    MEMORY[0x19AEADCC0](&v16, a4, a3);
    v6 = self->_customProtocolManagerProxy.m_impl.m_ptr;
    if (v6)
      v7 = *((_QWORD *)v6 + 1);
    else
      v7 = 0;
    WebKit::LegacyCustomProtocolManagerProxy::didFailWithError(v7, self->_customProtocolID.m_identifier, (uint64_t *)&v16);
    v8 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self->_customProtocolManagerProxy.m_impl.m_ptr + 1) + 16) + 8);
    v9 = (unsigned int *)(v8 + 16);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 + 1, v9));
    (*(void (**)(_QWORD))(**(_QWORD **)(v8 + 424) + 24))(*(_QWORD *)(v8 + 424));
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v9);
    v12 = cf;
    cf = 0;
    if (v12)
      CFRelease(v12);
    v13 = v18;
    v18 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v11);
      else
        *(_DWORD *)v13 -= 2;
    }
    v14 = v17;
    v17 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
        WTF::StringImpl::destroy(v14, v11);
      else
        *(_DWORD *)v14 -= 2;
    }
    v15 = v16;
    v16 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v11);
      else
        *(_DWORD *)v15 -= 2;
    }
  }
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  self->_storagePolicy = objc_msgSend(a4, "storagePolicy", a3);
  return a4;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  DefaultWeakPtrImpl *v6;
  uint64_t v7;
  unint64_t storagePolicy;
  WTF::StringImpl *v9;
  CFTypeRef v10;
  uint64_t v11[30];
  CFTypeRef cf;

  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v11, (NSURLResponse *)a4);
    v6 = self->_customProtocolManagerProxy.m_impl.m_ptr;
    if (v6)
      v7 = *((_QWORD *)v6 + 1);
    else
      v7 = 0;
    storagePolicy = self->_storagePolicy;
    if (storagePolicy >= 3)
      LOBYTE(storagePolicy) = 2;
    WebKit::LegacyCustomProtocolManagerProxy::didReceiveResponse(v7, self->_customProtocolID.m_identifier, v11, storagePolicy);
    v10 = cf;
    cf = 0;
    if (v10)
      CFRelease(v10);
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v11, v9);
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;
  unint64_t m_identifier;
  uint64_t v8;
  uint64_t v9;

  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
    {
      m_identifier = self->_customProtocolID.m_identifier;
      if (a4)
      {
        v8 = objc_msgSend(a4, "bytes", a3);
        v9 = objc_msgSend(a4, "length");
      }
      else
      {
        v8 = 0;
        v9 = 0;
      }
      WebKit::LegacyCustomProtocolManagerProxy::didLoadData(v5, m_identifier, v8, v9);
    }
  }
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v6;
  unint64_t m_identifier;
  WTF::StringImpl *v9;
  CFTypeRef v10;
  const void *v11;
  uint64_t v13[30];
  CFTypeRef cf;
  uint64_t v15[24];
  const void *v16;

  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (!m_ptr)
    return 0;
  v6 = *((_QWORD *)m_ptr + 1);
  if (!v6)
    return 0;
  if (a5)
  {
    m_identifier = self->_customProtocolID.m_identifier;
    MEMORY[0x19AEAEC20](v15, a4, a3);
    WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v13, (NSURLResponse *)a5);
    WebKit::LegacyCustomProtocolManagerProxy::wasRedirectedToRequest(v6, m_identifier, v15, v13);
    v10 = cf;
    cf = 0;
    if (v10)
      CFRelease(v10);
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v13, v9);
    v11 = v16;
    v16 = 0;
    if (v11)
      CFRelease(v11);
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v15);
    return 0;
  }
  return a4;
}

- (void)connectionDidFinishLoading:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;

  m_ptr = self->_customProtocolManagerProxy.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
    {
      WebKit::LegacyCustomProtocolManagerProxy::didFinishLoading(v5, self->_customProtocolID.m_identifier);
      v6 = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)self->_customProtocolManagerProxy.m_impl.m_ptr + 1) + 16) + 8);
      v7 = (unsigned int *)(v6 + 16);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 + 1, v7));
      (*(void (**)(_QWORD))(**(_QWORD **)(v6 + 424) + 24))(*(_QWORD *)(v6 + 424));
      WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v7);
    }
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  m_ptr = self->_urlConnection.m_ptr;
  self->_urlConnection.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = (unsigned int *)self->_customProtocolManagerProxy.m_impl.m_ptr;
  self->_customProtocolManagerProxy.m_impl.m_ptr = 0;
  if (v4)
  {
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      WTF::fastFree((WTF *)v4, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
