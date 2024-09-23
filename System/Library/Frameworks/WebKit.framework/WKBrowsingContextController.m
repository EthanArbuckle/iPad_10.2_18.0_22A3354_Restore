@implementation WKBrowsingContextController

+ (void)registerSchemeForCustomProtocol:(id)a3
{
  WTF::WorkQueue *v4;
  const WTF::String *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;

  v4 = (WTF::WorkQueue *)objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if ((_DWORD)v4)
  {
    MEMORY[0x19AEABCC8](&v11, a3);
    WebKit::WebProcessPool::registerGlobalURLSchemeAsHavingCustomProtocolHandlers((WebKit *)&v11, v5);
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v6);
      else
        *(_DWORD *)v7 -= 2;
    }
  }
  else
  {
    v8 = WTF::WorkQueue::main(v4);
    if (a3)
      CFRetain(a3);
    v9 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v9 = &off_1E34BBA88;
    *((_QWORD *)v9 + 1) = a3;
    v11 = v9;
    (*(void (**)(uint64_t, WTF::StringImpl **))(*(_QWORD *)v8 + 32))(v8, &v11);
    v10 = v11;
    v11 = 0;
    if (v10)
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v10 + 8))(v10);
  }
}

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  int *v5;
  WebPageProxy *m_ptr;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  int i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  _QWORD *v26;
  objc_super v27;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    if ((byte_1ECE728B9 & 1) != 0)
    {
      v5 = dword_1ECE72000;
      if (qword_1ECE728C8)
      {
        m_ptr = self->_page.m_ptr;
        v7 = *(_DWORD *)(qword_1ECE728C8 - 8);
        v8 = ((unint64_t)m_ptr + ~((_QWORD)m_ptr << 32)) ^ (((unint64_t)m_ptr + ~((_QWORD)m_ptr << 32)) >> 22);
        v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
        v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
        v11 = v7 & ((v10 >> 31) ^ v10);
        for (i = 1; ; ++i)
        {
          v13 = v11;
          v14 = *(_QWORD *)(qword_1ECE728C8 + 16 * v11);
          if (v14 != -1)
          {
            if (!v14)
              goto LABEL_27;
            v15 = *(_QWORD *)(v14 + 8);
            v16 = v15 ? v15 - 16 : 0;
            if ((WebPageProxy *)v16 == m_ptr)
              break;
          }
          v11 = (v13 + i) & v7;
        }
        if ((_DWORD)v13 != *(_DWORD *)(qword_1ECE728C8 - 4))
        {
          v17 = (_QWORD *)(qword_1ECE728C8 + 16 * v13);
          *v17 = 0;
          do
          {
            v20 = __ldaxr((unsigned int *)v14);
            v21 = v20 - 1;
          }
          while (__stlxr(v21, (unsigned int *)v14));
          if (!v21)
          {
            atomic_store(1u, (unsigned int *)v14);
            v26 = v17;
            WTF::fastFree((WTF *)v14, v4);
            v17 = v26;
            v5 = dword_1ECE72000;
          }
          *v17 = -1;
          v18 = *((_QWORD *)v5 + 281);
          ++*(_DWORD *)(v18 - 16);
          if (v18)
            v19 = *(_DWORD *)(v18 - 12) - 1;
          else
            v19 = -1;
          *(_DWORD *)(v18 - 12) = v19;
          v22 = *((_QWORD *)v5 + 281);
          if (v22)
          {
            v23 = 6 * *(_DWORD *)(v22 - 12);
            v24 = *(_DWORD *)(v22 - 4);
            if (v23 < v24 && v24 >= 9)
              WTF::HashTable<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>>,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WKBrowsingContextController *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>>::rehash(v24 >> 1);
          }
        }
      }
    }
    else
    {
      qword_1ECE728C8 = 0;
      byte_1ECE728B9 = 1;
    }
LABEL_27:
    WTF::WeakHashSet<WebKit::FrameLoadStateObserver,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::remove<WebKit::FrameLoadStateObserver>(*((_QWORD *)self->_page.m_ptr + 4) + 944, self->_pageLoadStateObserver.__ptr_.__value_);
    v27.receiver = self;
    v27.super_class = (Class)WKBrowsingContextController;
    -[WKBrowsingContextController dealloc](&v27, sel_dealloc);
  }
}

+ (void)unregisterSchemeForCustomProtocol:(id)a3
{
  WTF::WorkQueue *v4;
  const WTF::String *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;

  v4 = (WTF::WorkQueue *)objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if ((_DWORD)v4)
  {
    MEMORY[0x19AEABCC8](&v11, a3);
    WebKit::WebProcessPool::unregisterGlobalURLSchemeAsHavingCustomProtocolHandlers((WebKit *)&v11, v5);
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v6);
      else
        *(_DWORD *)v7 -= 2;
    }
  }
  else
  {
    v8 = WTF::WorkQueue::main(v4);
    if (a3)
      CFRetain(a3);
    v9 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(_QWORD *)v9 = &off_1E34BBAB0;
    *((_QWORD *)v9 + 1) = a3;
    v11 = v9;
    (*(void (**)(uint64_t, WTF::StringImpl **))(*(_QWORD *)v8 + 32))(v8, &v11);
    v10 = v11;
    v11 = 0;
    if (v10)
      (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v10 + 8))(v10);
  }
}

- (void)loadRequest:(id)a3
{
  -[WKBrowsingContextController loadRequest:userData:](self, "loadRequest:userData:", a3, 0);
}

- (void)loadRequest:(id)a3 userData:(id)a4
{
  WebPageProxy *m_ptr;
  uint64_t v5;
  CFTypeRef v6;
  _BYTE v7[192];
  CFTypeRef cf;
  uint64_t v9;

  m_ptr = self->_page.m_ptr;
  MEMORY[0x19AEAEC20](v7, a3);
  WebKit::WebPageProxy::loadRequest((uint64_t)m_ptr, (WebCore::ResourceRequestBase *)v7, 0, 0, &v9);
  v5 = v9;
  v9 = 0;
  if (v5)
    CFRelease(*(CFTypeRef *)(v5 + 8));
  v6 = cf;
  cf = 0;
  if (v6)
    CFRelease(v6);
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v7);
}

- (void)loadFileURL:(id)a3 restrictToFilesWithin:(id)a4
{
  -[WKBrowsingContextController loadFileURL:restrictToFilesWithin:userData:](self, "loadFileURL:restrictToFilesWithin:userData:", a3, a4, 0);
}

- (void)loadFileURL:(id)a3 restrictToFilesWithin:(id)a4 userData:(id)a5
{
  const __CFURL *v8;
  WebPageProxy *m_ptr;
  const __CFURL *v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  uint64_t v17;

  if (!objc_msgSend(a3, "isFileURL") || a4 && (objc_msgSend(a4, "isFileURL") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Attempted to load a non-file URL"));
  m_ptr = self->_page.m_ptr;
  WTF::bytesAsString((WTF *)a3, v8);
  WTF::bytesAsString((WTF *)a4, v10);
  WebKit::WebPageProxy::loadFile((WebKit::WebPageProxy *)m_ptr, &v16, &v15, 0, 0, &v17);
  v12 = v17;
  v17 = 0;
  if (v12)
    CFRelease(*(CFTypeRef *)(v12 + 8));
  v13 = v15;
  v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v11);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v16;
  v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v11);
    else
      *(_DWORD *)v14 -= 2;
  }
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4
{
  -[WKBrowsingContextController loadHTMLString:baseURL:userData:](self, "loadHTMLString:baseURL:userData:", a3, a4, 0);
}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4 userData:(id)a5
{
  void *v7;
  void *v8;
  WebPageProxy *m_ptr;
  uint64_t v10;
  const __CFURL *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  uint64_t v18;
  WTF::StringImpl *v19;

  v7 = (void *)objc_msgSend(a3, "dataUsingEncoding:", 4, a4, a5);
  v8 = v7;
  m_ptr = self->_page.m_ptr;
  if (v7)
  {
    v10 = objc_msgSend(v7, "bytes");
    v8 = (void *)objc_msgSend(v8, "length");
  }
  else
  {
    v10 = 0;
  }
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v16 = v19;
  WTF::bytesAsString((WTF *)a4, v11);
  WebKit::WebPageProxy::loadData((uint64_t)m_ptr, v10, (unint64_t)v8, (WTF::StringImpl *)&v17, (WTF::StringImpl *)&v16, (WTF::StringImpl *)&v19, 0, 0, &v18);
  if (v18)
    CFRelease(*(CFTypeRef *)(v18 + 8));
  v13 = v19;
  v19 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v12);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v16;
  v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v12);
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v17;
  v17 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v12);
    else
      *(_DWORD *)v15 -= 2;
  }
}

- (void)loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5
{
  const void *v8;
  WebPageProxy *m_ptr;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  unsigned int *v14;
  const void *v15;
  WTF::StringImpl *v16[5];
  WTF::StringImpl *v17[5];
  WTF::StringImpl *v18;
  const void *v19;
  unsigned int *v20;

  v8 = (const void *)objc_msgSend(a3, "dataUsingEncoding:", 4);
  m_ptr = self->_page.m_ptr;
  v19 = v8;
  if (v8)
    CFRetain(v8);
  WebCore::DataSegment::create();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v17[0];
  MEMORY[0x19AEABB18](v17, a4);
  MEMORY[0x19AEABB18](v16, a5);
  WebKit::WebPageProxy::loadAlternateHTML((uint64_t)m_ptr, (uint64_t *)&v20, (WTF::StringImpl *)&v18, (uint64_t)v17, (uint64_t)v16, 0);
  v11 = v16[0];
  v16[0] = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = v17[0];
  v17[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v10);
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v18;
  v18 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v10);
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v20;
  v20 = 0;
  if (v14)
    WTF::ThreadSafeRefCounted<WebCore::DataSegment,(WTF::DestructionThread)0>::deref(v14, v10);
  v15 = v19;
  v19 = 0;
  if (v15)
    CFRelease(v15);
}

- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6
{
  -[WKBrowsingContextController loadData:MIMEType:textEncodingName:baseURL:userData:](self, "loadData:MIMEType:textEncodingName:baseURL:userData:", a3, a4, a5, a6, 0);
}

- (void)loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6 userData:(id)a7
{
  id v10;
  WebPageProxy *m_ptr;
  uint64_t v12;
  const __CFURL *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  uint64_t v21;

  v10 = a3;
  m_ptr = self->_page.m_ptr;
  if (a3)
  {
    v12 = objc_msgSend(a3, "bytes", a3, a4, a5, a6, a7);
    v10 = (id)objc_msgSend(v10, "length");
  }
  else
  {
    v12 = 0;
  }
  MEMORY[0x19AEABCC8](&v20, a4);
  MEMORY[0x19AEABCC8](&v19, a5);
  WTF::bytesAsString((WTF *)a6, v13);
  WebKit::WebPageProxy::loadData((uint64_t)m_ptr, v12, (unint64_t)v10, (WTF::StringImpl *)&v20, (WTF::StringImpl *)&v19, (WTF::StringImpl *)&v18, 0, 0, &v21);
  if (v21)
    CFRelease(*(CFTypeRef *)(v21 + 8));
  v15 = v18;
  v18 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy(v15, v14);
    else
      *(_DWORD *)v15 -= 2;
  }
  v16 = v19;
  v19 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy(v16, v14);
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v20;
  v20 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy(v17, v14);
    else
      *(_DWORD *)v17 -= 2;
  }
}

- (void)stopLoading
{
  WebKit::WebPageProxy::stopLoading((WebKit::WebPageProxy *)self->_page.m_ptr);
}

- (void)reload
{
  uint64_t v2;
  uint64_t v3;

  WebKit::WebPageProxy::reload((uint64_t)self->_page.m_ptr, 0, &v3);
  v2 = v3;
  v3 = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
}

- (void)reloadFromOrigin
{
  uint64_t v2;
  uint64_t v3;

  WebKit::WebPageProxy::reload((uint64_t)self->_page.m_ptr, 2, &v3);
  v2 = v3;
  v3 = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
}

- (NSString)applicationNameForUserAgent
{
  NSString *result;

  result = (NSString *)*((_QWORD *)self->_page.m_ptr + 39);
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (void)setApplicationNameForUserAgent:(id)a3
{
  WebPageProxy *m_ptr;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF **v8;
  const WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;

  m_ptr = self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v12, a3);
  WTF::String::operator=((WTF::StringImpl **)m_ptr + 40, (WTF::StringImpl *)&v12);
  v7 = v12;
  v12 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v6);
    else
      *(_DWORD *)v7 -= 2;
  }
  v8 = (WTF **)self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v12, a3);
  WebKit::WebPageProxy::setApplicationNameForUserAgent(v8, &v12, v9);
  v11 = v12;
  v12 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
}

- (NSString)customUserAgent
{
  NSString *result;

  result = (NSString *)*((_QWORD *)self->_page.m_ptr + 41);
  if (result)
    return (NSString *)WTF::StringImpl::operator NSString *();
  return result;
}

- (void)setCustomUserAgent:(id)a3
{
  WTF **m_ptr;
  const WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;

  m_ptr = (WTF **)self->_page.m_ptr;
  MEMORY[0x19AEABCC8](&v7, a3);
  WebKit::WebPageProxy::setCustomUserAgent(m_ptr, &v7, v4);
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

- (void)goForward
{
  uint64_t v2;
  uint64_t v3;

  WebKit::WebPageProxy::goForward((WebKit::WebPageProxy *)self->_page.m_ptr, &v3);
  v2 = v3;
  v3 = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
}

- (BOOL)canGoForward
{
  return WebKit::WebBackForwardList::forwardItem(*((_QWORD *)self->_page.m_ptr + 74)) != 0;
}

- (void)goBack
{
  uint64_t v2;
  uint64_t v3;

  WebKit::WebPageProxy::goBack((WebKit::WebPageProxy *)self->_page.m_ptr, &v3);
  v2 = v3;
  v3 = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
}

- (BOOL)canGoBack
{
  return WebKit::WebBackForwardList::backItem(*((_QWORD *)self->_page.m_ptr + 74)) != 0;
}

- (void)goToBackForwardListItem:(id)a3
{
  uint64_t v3;

  WebKit::WebPageProxy::goToBackForwardItem((uint64_t)self->_page.m_ptr, objc_msgSend(a3, "_item"), 3u, &v3);
  if (v3)
    CFRelease(*(CFTypeRef *)(v3 + 8));
}

- (WKBackForwardList)backForwardList
{
  return *(WKBackForwardList **)(*((_QWORD *)self->_page.m_ptr + 74) + 8);
}

- (BOOL)isLoading
{
  uint64_t v2;
  _BOOL4 v3;
  unsigned int v4;

  v2 = *((_QWORD *)self->_page.m_ptr + 4);
  if (*(_QWORD *)(v2 + 984))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v4 = *(unsigned __int8 *)(v2 + 968);
    if (v4 > 2)
      LOBYTE(v3) = 0;
    else
      return (3u >> (v4 & 7)) & 1;
  }
  return v3;
}

- (NSURL)activeURL
{
  void *v2;
  WTF::StringImpl *v3;
  NSURL *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;

  v2 = (void *)MEMORY[0x1E0C99E98];
  WebKit::PageLoadState::activeURL((unsigned __int8 *)(*((_QWORD *)self->_page.m_ptr + 4) + 968), &v7);
  v4 = (NSURL *)objc_msgSend(v2, "_web_URLWithWTFString:", &v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v3);
    else
      *(_DWORD *)v5 -= 2;
  }
  return v4;
}

- (NSURL)provisionalURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", *((_QWORD *)self->_page.m_ptr + 4) + 992);
}

- (NSURL)committedURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", *((_QWORD *)self->_page.m_ptr + 4) + 1000);
}

- (NSURL)unreachableURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", *((_QWORD *)self->_page.m_ptr + 4) + 1040);
}

- (BOOL)hasOnlySecureContent
{
  return WebKit::PageLoadState::hasOnlySecureContent((WebKit::PageLoadState *)(*((_QWORD *)self->_page.m_ptr + 4) + 968), (const Data *)a2);
}

- (double)estimatedProgress
{
  uint64_t v2;
  double result;

  v2 = *((_QWORD *)self->_page.m_ptr + 4);
  result = *(double *)(v2 + 1112);
  if (*(_QWORD *)(v2 + 984))
    return 0.1;
  return result;
}

- (NSString)title
{
  uint64_t v2;
  uint64_t v3;

  v2 = *((_QWORD *)self->_page.m_ptr + 4);
  v3 = 1056;
  if (!*(_QWORD *)(v2 + 1056))
    v3 = 1048;
  if (*(_QWORD *)(v2 + v3))
    return (NSString *)WTF::StringImpl::operator NSString *();
  else
    return (NSString *)&stru_1E351F1B8;
}

- (NSArray)certificateChain
{
  uint64_t v2;
  NSArray *result;
  NSArray *arg;

  v2 = *((_QWORD *)self->_page.m_ptr + 35);
  if (!v2)
    return 0;
  WebCore::CertificateInfo::certificateChainFromSecTrust(*(WebCore::CertificateInfo **)(v2 + 256), (__SecTrust *)a2);
  result = arg;
  if (arg)
  {
    CFAutorelease(arg);
    return arg;
  }
  return result;
}

- (double)textZoom
{
  return *((double *)self->_page.m_ptr + 78);
}

- (void)setTextZoom:(double)a3
{
  WebKit::WebPageProxy::setTextZoomFactor((uint64_t)self->_page.m_ptr, a3);
}

- (double)pageZoom
{
  WebPageProxy *m_ptr;
  uint64_t v3;

  m_ptr = self->_page.m_ptr;
  v3 = 648;
  if (!*((_BYTE *)m_ptr + 857))
    v3 = 632;
  return *(double *)((char *)m_ptr + v3);
}

- (void)setPageZoom:(double)a3
{
  WebKit::WebPageProxy::setPageZoomFactor((uint64_t)self->_page.m_ptr, a3);
}

- (WKBrowsingContextLoadDelegate)loadDelegate
{
  return (WKBrowsingContextLoadDelegate *)objc_loadWeak(&self->_loadDelegate.m_weakReference);
}

- (void)setLoadDelegate:(id)a3
{
  WebPageProxy *m_ptr;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v8[2];
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v13)(uint64_t, uint64_t, void *, uint64_t, uint64_t);
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v16)(uint64_t, uint64_t, void *, uint64_t, uint64_t);
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *, uint64_t);
  void (*v21)(uint64_t, void *, uint64_t);
  void (*v22)(const OpaqueWKPage *, id *);
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  objc_storeWeak(&self->_loadDelegate.m_weakReference, a3);
  m_ptr = self->_page.m_ptr;
  if (a3)
  {
    v10 = 0;
    v17 = 0;
    v25 = 0;
    v23 = 0u;
    v24 = 0u;
    v19 = 0;
    v18 = 0u;
    v8[0] = 0;
    v9 = 0u;
    v8[1] = self;
    v11 = didStartProvisionalNavigation;
    v12 = didReceiveServerRedirectForProvisionalNavigation;
    v13 = didFailProvisionalNavigation;
    v14 = didCommitNavigation;
    v15 = didFinishNavigation;
    v16 = didFailNavigation;
    v20 = canAuthenticateAgainstProtectionSpace;
    v21 = didReceiveAuthenticationChallenge;
    v22 = processDidCrash;
    if (m_ptr)
      v6 = (_QWORD *)*((_QWORD *)m_ptr + 1);
    else
      v6 = 0;
    WKPageSetPageNavigationClient(v6, (unsigned int *)v8);
  }
  else
  {
    if (m_ptr)
      v7 = (_QWORD *)*((_QWORD *)m_ptr + 1);
    else
      v7 = 0;
    WKPageSetPageNavigationClient(v7, 0);
  }
}

- (WKBrowsingContextPolicyDelegate)policyDelegate
{
  return (WKBrowsingContextPolicyDelegate *)objc_loadWeak(&self->_policyDelegate.m_weakReference);
}

- (void)setPolicyDelegate:(id)a3
{
  WebPageProxy *m_ptr;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD *, void *, void *, uint64_t, void *, uint64_t, uint64_t);
  void (*v12)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, void *, void *, void *, void *, uint64_t, uint64_t);

  objc_storeWeak(&self->_policyDelegate.m_weakReference, a3);
  m_ptr = self->_page.m_ptr;
  if (a3)
  {
    v8[2] = 0;
    v9 = 0u;
    v8[0] = 2;
    v8[1] = self;
    v8[3] = setUpPagePolicyClient(WKBrowsingContextController *,WebKit::WebPageProxy &)::$_1::__invoke;
    v10 = 0;
    v11 = setUpPagePolicyClient(WKBrowsingContextController *,WebKit::WebPageProxy &)::$_2::__invoke;
    v12 = setUpPagePolicyClient(WKBrowsingContextController *,WebKit::WebPageProxy &)::$_0::__invoke;
    if (m_ptr)
      v6 = (_QWORD *)*((_QWORD *)m_ptr + 1);
    else
      v6 = 0;
    WKPageSetPagePolicyClient(v6, (unsigned int *)v8);
  }
  else
  {
    if (m_ptr)
      v7 = (_QWORD *)*((_QWORD *)m_ptr + 1);
    else
      v7 = 0;
    WKPageSetPagePolicyClient(v7, 0);
  }
}

- (WKBrowsingContextHistoryDelegate)historyDelegate
{
  return (WKBrowsingContextHistoryDelegate *)objc_loadWeak(&self->_historyDelegate.m_weakReference);
}

- (void)setHistoryDelegate:(id)a3
{
  objc_storeWeak(&self->_historyDelegate.m_weakReference, a3);
}

+ (id)customSchemes
{
  id result;

  if (_MergedGlobals_63 == 1)
    return (id)qword_1ECE728C0;
  result = objc_alloc_init(MEMORY[0x1E0C99E20]);
  qword_1ECE728C0 = (uint64_t)result;
  _MergedGlobals_63 = 1;
  return result;
}

- (id)_initWithPageRef:(OpaqueWKPage *)a3
{
  WKBrowsingContextController *v4;
  WebPageProxy *m_ptr;
  WebKit::PageLoadStateObserver *v6;
  PageLoadStateObserver *value;
  WebPageProxy *v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  int i;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  unsigned int v27;
  unsigned int v28;
  int v29;
  int v30;
  uint64_t v31;
  unint64_t v32;
  objc_super v34;
  _BYTE v35[24];

  v34.receiver = self;
  v34.super_class = (Class)WKBrowsingContextController;
  v4 = -[WKBrowsingContextController init](&v34, sel_init);
  if (!v4)
    return v4;
  if (a3)
  {
    a3 = (OpaqueWKPage *)-[OpaqueWKPage _apiObject](a3, "_apiObject");
    CFRetain(*((CFTypeRef *)a3 + 1));
  }
  m_ptr = v4->_page.m_ptr;
  v4->_page.m_ptr = (WebPageProxy *)a3;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  v6 = (WebKit::PageLoadStateObserver *)WTF::fastMalloc((WTF *)0x20);
  WebKit::PageLoadStateObserver::PageLoadStateObserver(v6, (objc_object *)v4, CFSTR("activeURL"));
  value = v4->_pageLoadStateObserver.__ptr_.__value_;
  v4->_pageLoadStateObserver.__ptr_.__value_ = (PageLoadStateObserver *)v6;
  if (value)
  {
    (*(void (**)(PageLoadStateObserver *))(*(_QWORD *)value + 8))(value);
    v6 = (WebKit::PageLoadStateObserver *)v4->_pageLoadStateObserver.__ptr_.__value_;
  }
  WTF::WeakHashSet<WebKit::FrameLoadStateObserver,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::add<WebKit::FrameLoadStateObserver>(*((_QWORD *)v4->_page.m_ptr + 4) + 944, (unsigned int *)v6, (uint64_t)v35);
  if ((byte_1ECE728B9 & 1) == 0)
  {
    qword_1ECE728C8 = 0;
    byte_1ECE728B9 = 1;
  }
  v8 = v4->_page.m_ptr;
  WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)v8 + 6, (uint64_t)v8 + 16);
  v10 = *((_QWORD *)v8 + 3);
  do
    v11 = __ldaxr((unsigned int *)v10);
  while (__stlxr(v11 + 1, (unsigned int *)v10));
  v12 = qword_1ECE728C8;
  if (qword_1ECE728C8
    || (WTF::HashTable<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>>,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WKBrowsingContextController *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>>::expand(),
        (v12 = qword_1ECE728C8) != 0))
  {
    v13 = *(_DWORD *)(v12 - 8);
  }
  else
  {
    v13 = 0;
  }
  v14 = 0;
  v15 = *(_QWORD *)(v10 + 8);
  v16 = v15 - 16;
  if (!v15)
    v16 = 0;
  v17 = (~(v16 << 32) + v16) ^ ((unint64_t)(~(v16 << 32) + v16) >> 22);
  v18 = (9 * ((v17 + ~(v17 << 13)) ^ ((v17 + ~(v17 << 13)) >> 8))) ^ ((9
                                                                     * ((v17 + ~(v17 << 13)) ^ ((v17 + ~(v17 << 13)) >> 8))) >> 15);
  v19 = ((v18 + ~(v18 << 27)) >> 31) ^ (v18 + ~((_DWORD)v18 << 27));
  for (i = 1; ; ++i)
  {
    v21 = v19 & v13;
    v22 = (uint64_t *)(v12 + 16 * v21);
    v23 = *v22;
    if (*v22 == -1)
    {
      v14 = (_QWORD *)(v12 + 16 * v21);
      goto LABEL_29;
    }
    if (!v23)
    {
      if (v14)
      {
        *v14 = 0;
        v14[1] = 0;
        --*(_DWORD *)(v12 - 16);
        *v14 = v10;
      }
      else
      {
        *v22 = v10;
        v14 = (_QWORD *)(v12 + 16 * v21);
      }
      v14[1] = v4;
      if (qword_1ECE728C8)
        v29 = *(_DWORD *)(qword_1ECE728C8 - 12) + 1;
      else
        v29 = 1;
      *(_DWORD *)(qword_1ECE728C8 - 12) = v29;
      if (qword_1ECE728C8)
        v30 = *(_DWORD *)(qword_1ECE728C8 - 12);
      else
        v30 = 0;
      v31 = (*(_DWORD *)(qword_1ECE728C8 - 16) + v30);
      v32 = *(unsigned int *)(qword_1ECE728C8 - 4);
      if (v32 > 0x400)
      {
        if (v32 > 2 * v31)
          return v4;
      }
      else if (3 * v32 > 4 * v31)
      {
        return v4;
      }
      WTF::HashTable<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *>>,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>,WKBrowsingContextController *,WTF::DefaultHash<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WKBrowsingContextController *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl>>>::expand();
      return v4;
    }
    v24 = *(_QWORD *)(v23 + 8);
    v25 = v15 == v24 && v15 != 0;
    if (v24 ? v25 : v15 == 0)
      break;
LABEL_29:
    v19 = i + v21;
  }
  *(_QWORD *)(v12 + 16 * v21 + 8) = v4;
  if (v10)
  {
    do
    {
      v27 = __ldaxr((unsigned int *)v10);
      v28 = v27 - 1;
    }
    while (__stlxr(v28, (unsigned int *)v10));
    if (!v28)
    {
      atomic_store(1u, (unsigned int *)v10);
      WTF::fastFree((WTF *)v10, v9);
    }
  }
  return v4;
}

+ (id)_browsingContextControllerForPageRef:(OpaqueWKPage *)a3
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  int i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((byte_1ECE728B9 & 1) != 0)
  {
    if (a3)
    {
LABEL_3:
      v3 = -[OpaqueWKPage _apiObject](a3, "_apiObject");
      goto LABEL_4;
    }
  }
  else
  {
    qword_1ECE728C8 = 0;
    byte_1ECE728B9 = 1;
    if (a3)
      goto LABEL_3;
  }
  v3 = 0;
LABEL_4:
  if (!qword_1ECE728C8)
    return 0;
  v4 = *(_DWORD *)(qword_1ECE728C8 - 8);
  v5 = (~(v3 << 32) + v3) ^ ((unint64_t)(~(v3 << 32) + v3) >> 22);
  v6 = 9 * ((v5 + ~(v5 << 13)) ^ ((v5 + ~(v5 << 13)) >> 8));
  v7 = (v6 ^ (v6 >> 15)) + ~((v6 ^ (v6 >> 15)) << 27);
  v8 = v4 & ((v7 >> 31) ^ v7);
  for (i = 1; ; ++i)
  {
    v10 = v8;
    v11 = *(_QWORD *)(qword_1ECE728C8 + 16 * v8);
    if (v11 != -1)
    {
      if (!v11)
        return 0;
      v12 = *(_QWORD *)(v11 + 8);
      v13 = v12 ? v12 - 16 : 0;
      if (v13 == v3)
        break;
    }
    v8 = (v10 + i) & v4;
  }
  return *(id *)(qword_1ECE728C8 + 16 * v10 + 8);
}

- (void).cxx_destruct
{
  PageLoadStateObserver *value;
  WebPageProxy *m_ptr;

  objc_destroyWeak(&self->_policyDelegate.m_weakReference);
  objc_destroyWeak(&self->_loadDelegate.m_weakReference);
  value = self->_pageLoadStateObserver.__ptr_.__value_;
  self->_pageLoadStateObserver.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(PageLoadStateObserver *))(*(_QWORD *)value + 8))(value);
  m_ptr = self->_page.m_ptr;
  self->_page.m_ptr = 0;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  objc_destroyWeak(&self->_historyDelegate.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (OpaqueWKPage)_pageRef
{
  WebPageProxy *m_ptr;

  m_ptr = self->_page.m_ptr;
  if (m_ptr)
    return (OpaqueWKPage *)*((_QWORD *)m_ptr + 1);
  else
    return 0;
}

- (void)setPaginationMode:(unint64_t)a3
{
  if (a3 <= 4)
    WebKit::WebPageProxy::setPaginationMode((uint64_t)self->_page.m_ptr, a3);
}

- (unint64_t)paginationMode
{
  if (((*((_BYTE *)self->_page.m_ptr + 709) - 1) & 0xFC) != 0)
    return 0;
  else
    return (*((_BYTE *)self->_page.m_ptr + 709) - 1) + 1;
}

- (void)setPaginationBehavesLikeColumns:(BOOL)a3
{
  WebKit::WebPageProxy::setPaginationBehavesLikeColumns((uint64_t)self->_page.m_ptr, a3);
}

- (BOOL)paginationBehavesLikeColumns
{
  return *((_BYTE *)self->_page.m_ptr + 710);
}

- (void)setPageLength:(double)a3
{
  WebKit::WebPageProxy::setPageLength((uint64_t)self->_page.m_ptr, a3);
}

- (double)pageLength
{
  return *((double *)self->_page.m_ptr + 89);
}

- (void)setGapBetweenPages:(double)a3
{
  WebKit::WebPageProxy::setGapBetweenPages((uint64_t)self->_page.m_ptr, a3);
}

- (double)gapBetweenPages
{
  return *((double *)self->_page.m_ptr + 90);
}

- (BOOL)paginationLineGridEnabled
{
  return 0;
}

- (unint64_t)pageCount
{
  return *((unsigned int *)self->_page.m_ptr + 215);
}

- (WKBrowsingContextHandle)handle
{
  return (WKBrowsingContextHandle *)(id)CFMakeCollectable(-[WKBrowsingContextHandle _initWithPageProxy:]([WKBrowsingContextHandle alloc], "_initWithPageProxy:", self->_page.m_ptr));
}

- (_WKRemoteObjectRegistry)_remoteObjectRegistry
{
  return 0;
}

- (int)processIdentifier
{
  WebPageProxy *m_ptr;
  uint64_t v4;

  m_ptr = self->_page.m_ptr;
  if (*((_BYTE *)m_ptr + 729))
    return 0;
  v4 = *(_QWORD *)(*((_QWORD *)m_ptr + 26) + 136);
  if (!v4)
    return 0;
  else
    return *(_DWORD *)(v4 + 108);
}

- (BOOL)_webProcessIsResponsive
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 26);
  return *(_BYTE *)(v2 + 104) && *(_BYTE *)(v2 + 496) != 0;
}

+ (_QWORD)registerSchemeForCustomProtocol:(_QWORD *)a1
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34BBA88;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

+ (uint64_t)registerSchemeForCustomProtocol:(WTF *)this
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34BBA88;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

+ (WTF::StringImpl)registerSchemeForCustomProtocol:(uint64_t)a1
{
  const WTF::String *v1;
  WTF::StringImpl *v2;
  WTF::StringImpl *result;
  WTF::StringImpl *v4;

  MEMORY[0x19AEABCC8](&v4, *(_QWORD *)(a1 + 8));
  WebKit::WebProcessPool::registerGlobalURLSchemeAsHavingCustomProtocolHandlers((WebKit *)&v4, v1);
  result = v4;
  v4 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

+ (_QWORD)unregisterSchemeForCustomProtocol:(_QWORD *)a1
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34BBAB0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

+ (uint64_t)unregisterSchemeForCustomProtocol:(WTF *)this
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34BBAB0;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

+ (WTF::StringImpl)unregisterSchemeForCustomProtocol:(uint64_t)a1
{
  const WTF::String *v1;
  WTF::StringImpl *v2;
  WTF::StringImpl *result;
  WTF::StringImpl *v4;

  MEMORY[0x19AEABCC8](&v4, *(_QWORD *)(a1 + 8));
  WebKit::WebProcessPool::unregisterGlobalURLSchemeAsHavingCustomProtocolHandlers((WebKit *)&v4, v1);
  result = v4;
  v4 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2)
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v2);
    else
      *(_DWORD *)result -= 2;
  }
  return result;
}

@end
