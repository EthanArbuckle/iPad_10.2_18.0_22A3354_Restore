@implementation WKDownload

+ (BOOL)accessInstanceVariablesDirectly
{
  char v3;
  NSObject *v4;
  int v6;
  const char *Name;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKDownload accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKDownload accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1ECE70E20;
    if (os_log_type_enabled((os_log_t)qword_1ECE70E20, OS_LOG_TYPE_FAULT))
    {
      v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_196BCC000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (void)cancel:(void *)completionHandler
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;

  v4 = _Block_copy(completionHandler);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E34BBBA0;
  v5[1] = v4;
  v6 = v5;
  WebKit::DownloadProxy::cancel((uint64_t)&self->_download, (uint64_t *)&v6);
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)WebCore::ResourceRequest::nsURLRequest();
}

- (WKWebView)webView
{
  uint64_t v2;
  uint64_t v3;
  CFTypeRef cf;

  v2 = *(_QWORD *)&self->_anon_38[240];
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return 0;
  WebKit::WebPageProxy::cocoaView((WebKit::WebPageProxy *)(v3 - 16), &cf);
  return (WKWebView *)(id)CFMakeCollectable(cf);
}

- (id)delegate
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  return v3;
}

- (void)setDelegate:(id)delegate
{
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  _DWORD *v9;

  objc_storeWeak(&self->_delegate.m_weakReference, delegate);
  v5 = WTF::fastMalloc((WTF *)0x20);
  *(_DWORD *)(v5 + 8) = 1;
  *(_QWORD *)v5 = off_1E34BB920;
  *(_QWORD *)(v5 + 16) = 0;
  objc_initWeak((id *)(v5 + 16), delegate);
  *(_BYTE *)(v5 + 24) = *(_BYTE *)(v5 + 24) & 0xFE | objc_opt_respondsToSelector() & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)(v5 + 24) = *(_BYTE *)(v5 + 24) & 0xFD | v6;
  objc_loadWeak((id *)(v5 + 16));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 4;
  else
    v7 = 0;
  *(_BYTE *)(v5 + 24) = *(_BYTE *)(v5 + 24) & 0xFB | v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 8;
  else
    v8 = 0;
  *(_BYTE *)(v5 + 24) = *(_BYTE *)(v5 + 24) & 0xF7 | v8;
  v9 = *(_DWORD **)self->_anon_38;
  *(_QWORD *)self->_anon_38 = v5;
  if (v9)
  {
    if (v9[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v9 + 8))(v9);
    else
      --v9[2];
  }
}

- (NSProgress)progress
{
  NSProgress *v2;
  void *v4;
  const void *v5;
  id v7;
  id to;

  v2 = *(NSProgress **)&self->_anon_38[288];
  if (!v2)
  {
    v2 = (NSProgress *)objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -1);
    -[NSProgress setKind:](v2, "setKind:", *MEMORY[0x1E0CB30F8]);
    -[NSProgress setFileOperationKind:](v2, "setFileOperationKind:", *MEMORY[0x1E0CB30B8]);
    -[NSProgress setCancellable:](v2, "setCancellable:", 1);
    v7 = 0;
    objc_initWeak(&v7, self);
    to = 0;
    objc_moveWeak(&to, &v7);
    v4 = malloc_type_malloc(0x28uLL, 0x10E004086F20DB1uLL);
    *(_QWORD *)v4 = MEMORY[0x1E0C809A0];
    *((_QWORD *)v4 + 1) = 50331650;
    *((_QWORD *)v4 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKDownload progress]::$_8>(-[WKDownload progress]::$_8)::{lambda(void *)#1}::__invoke;
    *((_QWORD *)v4 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKDownload progress]::$_8>(-[WKDownload progress]::$_8)::descriptor;
    *((_QWORD *)v4 + 4) = 0;
    objc_moveWeak((id *)v4 + 4, &to);
    objc_destroyWeak(&to);
    -[NSProgress setCancellationHandler:](v2, "setCancellationHandler:", v4);
    _Block_release(v4);
    objc_destroyWeak(&v7);
    if (v2)
      CFRetain(v2);
    v5 = *(const void **)&self->_anon_38[288];
    *(_QWORD *)&self->_anon_38[288] = v2;
    if (v5)
      CFRelease(v5);
  }
  return v2;
}

- (void)dealloc
{
  objc_class *v3;
  objc_super v4;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    (**(void (***)(ObjectStorage<WebKit::DownloadProxy> *))self->_download.data.__lx)(&self->_download);
    v4.receiver = self;
    v4.super_class = (Class)WKDownload;
    -[WKDownload dealloc](&v4, sel_dealloc);
  }
}

- (Object)_apiObject
{
  return (Object *)&self->_download;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 44) = 0;
  return self;
}

- (void)progress
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;

  v3 = 0;
  objc_moveWeak(&v3, (id *)(a1 + 32));
  v1 = WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v1 = off_1E34BBA60;
  *(_QWORD *)(v1 + 8) = 0;
  objc_moveWeak((id *)(v1 + 8), &v3);
  v4 = v1;
  WTF::ensureOnMainRunLoop();
  v2 = v4;
  v4 = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  objc_destroyWeak(&v3);
}

- (uint64_t)progress
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 8)), "cancel:", 0);
}

- (uint64_t)cancel:(uint64_t)a1
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result)
  {
    if (a2)
      a2 = *(_QWORD *)(a2 + 8);
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (uint64_t)cancel:(const void *)a1
{
  void *v2;

  *a1 = off_1E34BBBA0;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

@end
