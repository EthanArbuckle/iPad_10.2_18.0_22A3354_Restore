@implementation _WKDownload

- (_WKDownload)initWithDownload2:(id)a3
{
  _WKDownload *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_WKDownload;
  v4 = -[_WKDownload init](&v7, sel_init);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->_download.m_ptr;
    v4->_download.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v4;
}

+ (id)downloadWithDownload:(id)a3
{
  id result;
  _WKDownload *v5;

  result = (id)objc_msgSend((id)downloadWrapperMap(), "objectForKey:", a3);
  if (!result)
  {
    v5 = -[_WKDownload initWithDownload2:]([_WKDownload alloc], "initWithDownload2:", a3);
    objc_msgSend((id)downloadWrapperMap(), "setObject:forKey:", v5, a3);
    return (id)(id)CFMakeCollectable(v5);
  }
  return result;
}

- (void)cancel
{
  CFTypeRef *m_ptr;
  _QWORD *v3;
  _QWORD *v4;

  m_ptr = (CFTypeRef *)self->_download.m_ptr;
  CFRetain(m_ptr[2]);
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v3 = &off_1E34C2790;
  v3[1] = m_ptr + 1;
  v4 = v3;
  WebKit::DownloadProxy::cancel((uint64_t)(m_ptr + 1), (uint64_t *)&v4);
  if (v4)
    (*(void (**)(_QWORD *))(*v4 + 8))(v4);
}

- (void)publishProgressAtURL:(id)a3
{
  WebKit::WebsiteDataStore **v3;
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6[5];

  v3 = (WebKit::WebsiteDataStore **)((char *)self->_download.m_ptr + 8);
  MEMORY[0x19AEABB18](v6, a3);
  WebKit::DownloadProxy::publishProgress(v3, (const WTF::URL *)v6);
  v5 = v6[0];
  v6[0] = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy(v5, v4);
    else
      *(_DWORD *)v5 -= 2;
  }
}

- (NSURLRequest)request
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (WKWebView)originatingWebView
{
  uint64_t v2;
  uint64_t v3;
  CFTypeRef cf;

  v2 = *((_QWORD *)self->_download.m_ptr + 37);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return 0;
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  return (WKWebView *)(id)CFMakeCollectable(cf);
}

- (NSArray)redirectChain
{
  _QWORD *m_ptr;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  m_ptr = self->_download.m_ptr;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((unsigned int *)m_ptr + 79));
  v4 = *((unsigned int *)m_ptr + 79);
  if ((_DWORD)v4)
  {
    v5 = m_ptr[38];
    v6 = 40 * v4;
    do
    {
      v7 = WTF::URL::operator NSURL *();
      if (v7)
        objc_msgSend(v3, "addObject:", v7);
      v5 += 40;
      v6 -= 40;
    }
    while (v6);
  }
  return (NSArray *)(id)CFMakeCollectable(v3);
}

- (BOOL)wasUserInitiated
{
  return *((_BYTE *)self->_download.m_ptr + 320);
}

- (NSData)resumeData
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_download.m_ptr + 9);
  if (v2)
    return *(NSData **)(v2 + 8);
  else
    return 0;
}

- (WKFrameInfo)originatingFrame
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_download.m_ptr + 41);
  if (v2)
    return *(WKFrameInfo **)(v2 + 8);
  else
    return 0;
}

- (Object)_apiObject
{
  return (Object *)((char *)self->_download.m_ptr + 8);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_download.m_ptr;
  self->_download.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (_QWORD)cancel
{
  uint64_t v2;

  v2 = a1[1];
  *a1 = &off_1E34C2790;
  a1[1] = 0;
  if (v2)
    CFRelease(*(CFTypeRef *)(v2 + 8));
  return a1;
}

- (uint64_t)cancel
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 8) + 48) + 72))(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 48));
}

@end
