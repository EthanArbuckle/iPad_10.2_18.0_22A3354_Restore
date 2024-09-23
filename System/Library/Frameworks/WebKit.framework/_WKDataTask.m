@implementation _WKDataTask

- (void)cancel
{
  void *m_ptr;

  API::DataTask::cancel((API::DataTask *)&self->_dataTask);
  m_ptr = self->_delegate.m_ptr;
  self->_delegate.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (WKWebView)webView
{
  uint64_t v2;
  uint64_t v3;
  WKWebView *v4;
  CFTypeRef cf;

  v2 = *(_QWORD *)&self->_dataTask.data.__lx[24];
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return 0;
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  v4 = (WKWebView *)cf;
  if (cf)
    CFRelease(cf);
  return v4;
}

- (_WKDataTaskDelegate)delegate
{
  return (_WKDataTaskDelegate *)self->_delegate.m_ptr;
}

- (void)setDelegate:(id)a3
{
  void *m_ptr;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;
  _DWORD *v11;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_delegate.m_ptr;
  self->_delegate.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
  v6 = WTF::fastMalloc((WTF *)0x20);
  *(_DWORD *)(v6 + 8) = 1;
  *(_QWORD *)v6 = off_1E34C26D8;
  *(_QWORD *)(v6 + 16) = 0;
  objc_initWeak((id *)(v6 + 16), a3);
  *(_BYTE *)(v6 + 24) = *(_BYTE *)(v6 + 24) & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 2;
  else
    v7 = 0;
  *(_BYTE *)(v6 + 24) = *(_BYTE *)(v6 + 24) & 0xFD | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)(v6 + 24) = *(_BYTE *)(v6 + 24) & 0xFB | v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 8;
  else
    v9 = 0;
  *(_BYTE *)(v6 + 24) = *(_BYTE *)(v6 + 24) & 0xF7 | v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 16;
  else
    v10 = 0;
  *(_BYTE *)(v6 + 24) = *(_BYTE *)(v6 + 24) & 0xEF | v10;
  v11 = *(_DWORD **)&self->_anon_38[48];
  *(_QWORD *)&self->_anon_38[48] = v6;
  if (v11)
  {
    if (v11[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v11 + 8))(v11);
    else
      --v11[2];
  }
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<API::DataTask> *))self->_dataTask.data.__lx)(&self->_dataTask);
    v4.receiver = self;
    v4.super_class = (Class)_WKDataTask;
    -[_WKDataTask dealloc](&v4, sel_dealloc);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_dataTask;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_delegate.m_ptr;
  self->_delegate.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  return self;
}

@end
