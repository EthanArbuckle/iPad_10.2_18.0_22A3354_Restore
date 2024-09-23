@implementation WKReloadFrameErrorRecoveryAttempter

- (WKReloadFrameErrorRecoveryAttempter)initWithWebView:(id)a3 frameHandle:(id)a4 urlString:(const void *)a5
{
  WKReloadFrameErrorRecoveryAttempter *v8;
  WKReloadFrameErrorRecoveryAttempter *v9;
  void *m_ptr;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WKReloadFrameErrorRecoveryAttempter;
  v8 = -[WKReloadFrameErrorRecoveryAttempter init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_webView.m_weakReference, a3);
    if (a4)
      CFRetain(a4);
    m_ptr = v9->_frameHandle.m_ptr;
    v9->_frameHandle.m_ptr = a4;
    if (m_ptr)
      CFRelease(m_ptr);
    WTF::String::operator=((WTF::StringImpl **)&v9->_urlString, (WTF::StringImpl *)a5);
  }
  return v9;
}

- (BOOL)attemptRecovery
{
  id WeakRetained;
  const void *v4;
  uint64_t v5;
  BOOL v6;
  CFTypeRef *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13[5];

  WeakRetained = objc_loadWeakRetained(&self->_webView.m_weakReference);
  if (!WeakRetained)
    return 0;
  v4 = WeakRetained;
  v5 = WebKit::WebFrameProxy::webFrame(*((_QWORD *)self->_frameHandle.m_ptr + 3), *((_QWORD *)self->_frameHandle.m_ptr + 4));
  v6 = v5 != 0;
  if (v5)
  {
    v7 = (CFTypeRef *)v5;
    CFRetain(*(CFTypeRef *)(v5 + 8));
    WTF::URL::URL((uint64_t)v13, (WTF::StringImpl **)&self->_urlString);
    v12 = 0;
    WebKit::WebFrameProxy::loadURL((WebKit::WebFrameProxy *)v7, (const WTF::URL *)v13, (const WTF::String *)&v12);
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v8);
      else
        *(_DWORD *)v9 -= 2;
    }
    v10 = v13[0];
    v13[0] = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v8);
      else
        *(_DWORD *)v10 -= 2;
    }
    CFRelease(v7[1]);
  }
  CFRelease(v4);
  return v6;
}

- (WKReloadFrameErrorRecoveryAttempter)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKReloadFrameErrorRecoveryAttempter;
  return -[WKReloadFrameErrorRecoveryAttempter init](&v4, sel_init, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  StringImpl *m_ptr;
  void *v4;

  m_ptr = self->_urlString.m_impl.m_ptr;
  self->_urlString.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2)
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (WTF::StringImpl *)a2);
    else
      *(_DWORD *)m_ptr -= 2;
  }
  v4 = self->_frameHandle.m_ptr;
  self->_frameHandle.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  objc_destroyWeak(&self->_webView.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
