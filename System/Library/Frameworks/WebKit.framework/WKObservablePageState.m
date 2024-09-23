@implementation WKObservablePageState

- (WKObservablePageState)initWithPage:(void *)a3
{
  WKObservablePageState *v4;
  objc_object *v5;
  WebPageProxy *v6;
  WebPageProxy *m_ptr;
  WebKit::PageLoadStateObserver *v8;
  Class isa;
  objc_super v11;
  _BYTE v12[24];

  v11.receiver = self;
  v11.super_class = (Class)WKObservablePageState;
  v4 = -[WKObservablePageState init](&v11, sel_init);
  v5 = (objc_object *)v4;
  if (v4)
  {
    v6 = *(WebPageProxy **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = v4->_page.m_ptr;
    v4->_page.m_ptr = v6;
    if (m_ptr)
      CFRelease(*((CFTypeRef *)m_ptr + 1));
    v8 = (WebKit::PageLoadStateObserver *)WTF::fastMalloc((WTF *)0x20);
    WebKit::PageLoadStateObserver::PageLoadStateObserver(v8, v5, CFSTR("URL"));
    isa = v5[2].isa;
    v5[2].isa = v8;
    if (isa)
    {
      (*(void (**)(Class))(*(_QWORD *)isa + 8))(isa);
      v8 = v5[2].isa;
    }
    WTF::WeakHashSet<WebKit::FrameLoadStateObserver,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::add<WebKit::FrameLoadStateObserver>(*((_QWORD *)v5[1].isa + 4) + 944, (unsigned int *)v8, (uint64_t)v12);
  }
  return (WKObservablePageState *)v5;
}

- (void)dealloc
{
  PageLoadStateObserver *value;
  WebPageProxy *m_ptr;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v7;
  _QWORD *v8;

  objc_storeWeak((id *)self->_observer.__ptr_.__value_ + 2, 0);
  m_ptr = self->_page.m_ptr;
  value = self->_observer.__ptr_.__value_;
  self->_page.m_ptr = 0;
  self->_observer.__ptr_.__value_ = 0;
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v5 = &off_1E34BA170;
  v5[1] = m_ptr;
  v5[2] = value;
  v8 = v5;
  WTF::ensureOnMainRunLoop();
  v6 = v8;
  v8 = 0;
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  v7.receiver = self;
  v7.super_class = (Class)WKObservablePageState;
  -[WKObservablePageState dealloc](&v7, sel_dealloc);
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

- (NSURL)URL
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

- (BOOL)hasOnlySecureContent
{
  return WebKit::PageLoadState::hasOnlySecureContent((WebKit::PageLoadState *)(*((_QWORD *)self->_page.m_ptr + 4) + 968), (const Data *)a2);
}

- (BOOL)_webProcessIsResponsive
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_page.m_ptr + 26);
  return *(_BYTE *)(v2 + 104) && *(_BYTE *)(v2 + 496) != 0;
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

- (NSURL)unreachableURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithWTFString:", *((_QWORD *)self->_page.m_ptr + 4) + 1040);
}

- (__SecTrust)serverTrust
{
  return *(__SecTrust **)(*((_QWORD *)self->_page.m_ptr + 4) + 1128);
}

- (void).cxx_destruct
{
  PageLoadStateObserver *value;
  WebPageProxy *m_ptr;

  value = self->_observer.__ptr_.__value_;
  self->_observer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(PageLoadStateObserver *, SEL))(*(_QWORD *)value + 8))(value, a2);
  m_ptr = self->_page.m_ptr;
  self->_page.m_ptr = 0;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (_QWORD)dealloc
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &off_1E34BA170;
  v2 = a1[2];
  a1[2] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(*(CFTypeRef *)(v3 + 8));
  return a1;
}

- (uint64_t)dealloc
{
  return WTF::WeakHashSet<WebKit::FrameLoadStateObserver,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::remove<WebKit::FrameLoadStateObserver>(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 32) + 944, *(_QWORD **)(a1 + 16));
}

@end
