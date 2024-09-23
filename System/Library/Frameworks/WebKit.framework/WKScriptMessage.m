@implementation WKScriptMessage

- (WKFrameInfo)frameInfo
{
  return (WKFrameInfo *)self->_frameInfo.m_ptr;
}

- (NSString)name
{
  return (NSString *)self->_name.m_ptr;
}

- (id)body
{
  return self->_body.m_ptr;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (id)_initWithBody:(id)a3 webView:(id)a4 frameInfo:(id)a5 name:(id)a6 world:(id)a7
{
  WKScriptMessage *v12;
  uint64_t v13;
  void *m_ptr;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WKScriptMessage;
  v12 = -[WKScriptMessage init](&v20, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(a3, "copy");
    m_ptr = v12->_body.m_ptr;
    v12->_body.m_ptr = (void *)v13;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_storeWeak(&v12->_webView.m_weakReference, a4);
    if (a5)
      CFRetain(a5);
    v15 = v12->_frameInfo.m_ptr;
    v12->_frameInfo.m_ptr = a5;
    if (v15)
      CFRelease(v15);
    v16 = objc_msgSend(a6, "copy");
    v17 = v12->_name.m_ptr;
    v12->_name.m_ptr = (void *)v16;
    if (v17)
      CFRelease(v17);
    if (a7)
      CFRetain(a7);
    v18 = v12->_world.m_ptr;
    v12->_world.m_ptr = a7;
    if (v18)
      CFRelease(v18);
  }
  return v12;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->_world.m_ptr;
  self->_world.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_name.m_ptr;
  self->_name.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_frameInfo.m_ptr;
  self->_frameInfo.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  objc_destroyWeak(&self->_webView.m_weakReference);
  v6 = self->_body.m_ptr;
  self->_body.m_ptr = 0;
  if (v6)
    CFRelease(v6);
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeak(&self->_webView.m_weakReference);
}

- (WKContentWorld)world
{
  return (WKContentWorld *)self->_world.m_ptr;
}

@end
