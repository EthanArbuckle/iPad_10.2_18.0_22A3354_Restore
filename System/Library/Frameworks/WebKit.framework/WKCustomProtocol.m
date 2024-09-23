@implementation WKCustomProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  uint64_t v4;
  const char *v5;
  WebKit::LegacyCustomProtocolManager *v6;
  WTF::StringImpl *v7;
  char v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v11[2];

  if (byte_1EE341381 == 1)
  {
    v4 = qword_1EE341388;
  }
  else
  {
    v4 = 0;
    qword_1EE341388 = 0;
    byte_1EE341381 = 1;
  }
  v11[0] = (WTF::StringImpl *)"LegacyCustomProtocolManager";
  v11[1] = (WTF::StringImpl *)28;
  v5 = WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)(v4 + 192), (WTF::ASCIILiteralHash *)v11);
  if (!v5)
    return 0;
  v6 = (WebKit::LegacyCustomProtocolManager *)v5;
  MEMORY[0x19AEABCC8](v11, objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "URL"), "scheme"), "lowercaseString"));
  v8 = WebKit::LegacyCustomProtocolManager::supportsScheme(v6, v11);
  v9 = v11[0];
  v11[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v7);
    else
      *(_DWORD *)v9 -= 2;
  }
  return v8;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (WKCustomProtocol)initWithRequest:(id)a3 cachedResponse:(id)a4 client:(id)a5
{
  WKCustomProtocol *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  CFTypeRef v9;
  CFRunLoopRef Current;
  CFRunLoopRef v11;
  void *m_ptr;
  objc_super v14;
  CFTypeRef cf[2];

  v14.receiver = self;
  v14.super_class = (Class)WKCustomProtocol;
  v5 = -[NSURLProtocol initWithRequest:cachedResponse:client:](&v14, sel_initWithRequest_cachedResponse_client_, a3, a4, a5);
  if (v5)
  {
    if (byte_1EE341381 == 1)
    {
      v6 = qword_1EE341388;
    }
    else
    {
      v6 = 0;
      qword_1EE341388 = 0;
      byte_1EE341381 = 1;
    }
    cf[0] = "LegacyCustomProtocolManager";
    cf[1] = (CFTypeRef)28;
    v7 = WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)(v6 + 192), (WTF::ASCIILiteralHash *)cf);
    if (v7)
    {
      v8 = (uint64_t)v7;
      cf[0] = v5;
      CFRetain(v5);
      v5->_customProtocolID.m_identifier = WebKit::LegacyCustomProtocolManager::addCustomProtocol(v8, (uint64_t *)cf);
      v9 = cf[0];
      cf[0] = 0;
      if (v9)
        CFRelease(v9);
    }
    Current = CFRunLoopGetCurrent();
    v11 = Current;
    if (Current)
      CFRetain(Current);
    m_ptr = v5->_initializationRunLoop.m_ptr;
    v5->_initializationRunLoop.m_ptr = v11;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v5;
}

- (__CFRunLoop)initializationRunLoop
{
  return (__CFRunLoop *)self->_initializationRunLoop.m_ptr;
}

- (void)startLoading
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeRef v6;
  _QWORD v7[24];
  CFTypeRef cf;

  if (byte_1EE341381 == 1)
  {
    v2 = qword_1EE341388;
  }
  else
  {
    v2 = 0;
    qword_1EE341388 = 0;
    byte_1EE341381 = 1;
  }
  v7[0] = "LegacyCustomProtocolManager";
  v7[1] = 28;
  v3 = WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)(v2 + 192), (WTF::ASCIILiteralHash *)v7);
  if (v3)
  {
    v4 = (uint64_t)v3;
    v5 = *(_QWORD *)(a1 + 8);
    MEMORY[0x19AEAEC20](v7, *(_QWORD *)(a1 + 16));
    WebKit::LegacyCustomProtocolManager::startLoading(v4, v5, (WebCore::ResourceRequest *)v7);
    v6 = cf;
    cf = 0;
    if (v6)
      CFRelease(v6);
    WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v7);
  }
}

- (void)stopLoading
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  _QWORD v5[2];

  if (byte_1EE341381 == 1)
  {
    v2 = qword_1EE341388;
  }
  else
  {
    v2 = 0;
    qword_1EE341388 = 0;
    byte_1EE341381 = 1;
  }
  v5[0] = "LegacyCustomProtocolManager";
  v5[1] = 28;
  v3 = WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WTF::ASCIILiteral,std::unique_ptr<WebKit::NetworkProcessSupplement>,WTF::DefaultHash<WTF::ASCIILiteral>,WTF::HashTraits<WTF::ASCIILiteral>,WTF::HashTraits<std::unique_ptr<WebKit::NetworkProcessSupplement>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WTF::ASCIILiteral>>,WTF::ASCIILiteral>((uint64_t *)(v2 + 192), (WTF::ASCIILiteralHash *)v5);
  if (v3)
  {
    v4 = (uint64_t)v3;
    WebKit::LegacyCustomProtocolManager::stopLoading((uint64_t)v3, *(_QWORD *)(a1 + 8));
    WebKit::LegacyCustomProtocolManager::removeCustomProtocol(v4, *(_QWORD *)(a1 + 8));
  }
}

- (ObjectIdentifierGeneric<WebKit::LegacyCustomProtocolIDType,)customProtocolID
{
  return self->_customProtocolID;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_initializationRunLoop.m_ptr;
  self->_initializationRunLoop.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (_QWORD)startLoading
{
  const void *v2;

  *a1 = &off_1E34B49E0;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)startLoading
{
  const void *v3;

  *(_QWORD *)this = &off_1E34B49E0;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

@end
