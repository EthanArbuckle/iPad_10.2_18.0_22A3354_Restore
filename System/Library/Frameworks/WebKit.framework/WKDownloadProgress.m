@implementation WKDownloadProgress

- (void)performCancel
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v4;
  _QWORD *v5;
  unsigned int v6;
  unsigned int v7;
  _QWORD *v8;

  m_ptr = self->m_download.m_impl.m_ptr;
  if (!m_ptr)
  {
    self->m_download.m_impl.m_ptr = 0;
    return;
  }
  v4 = *((_QWORD *)m_ptr + 1);
  if (!v4)
  {
    self->m_download.m_impl.m_ptr = 0;
    do
    {
LABEL_9:
      v6 = __ldaxr((unsigned int *)m_ptr);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, (unsigned int *)m_ptr));
    if (!v7)
    {
      atomic_store(1u, (unsigned int *)m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
    return;
  }
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E3508010;
  v8 = v5;
  WebKit::Download::cancel(v4, (uint64_t *)&v8, 0);
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
  m_ptr = self->m_download.m_impl.m_ptr;
  self->m_download.m_impl.m_ptr = 0;
  if (m_ptr)
    goto LABEL_9;
}

- (WKDownloadProgress)initWithDownloadTask:(id)a3 download:(void *)a4 URL:(id)a5 sandboxExtension:()RefPtr<WebKit:()WTF:(WTF::DefaultRefDerefTraits<WebKit::SandboxExtension>>)a6 :RawPtrTraits<WebKit::SandboxExtension> :SandboxExtension
{
  WKDownloadProgress *v10;
  void *m_ptr;
  void *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  SandboxExtension *v18;
  const char ***v19;
  void *v20;
  id v22;
  id to;

  v10 = -[WKDownloadProgress initWithParent:userInfo:](self, "initWithParent:userInfo:", 0, 0);
  if (v10)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v10->m_task.m_ptr;
    v10->m_task.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a4 + 2, (uint64_t)a4);
    v13 = (unsigned int *)*((_QWORD *)a4 + 1);
    if (v13)
    {
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 + 1, v13));
    }
    v15 = (unsigned int *)v10->m_download.m_impl.m_ptr;
    v10->m_download.m_impl.m_ptr = (DefaultWeakPtrImpl *)v13;
    if (v15)
    {
      do
      {
        v16 = __ldaxr(v15);
        v17 = v16 - 1;
      }
      while (__stlxr(v17, v15));
      if (!v17)
      {
        atomic_store(1u, v15);
        WTF::fastFree((WTF *)v15, v12);
      }
    }
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", v10, CFSTR("countOfBytesExpectedToReceive"), 5, _MergedGlobals_9);
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", v10, CFSTR("countOfBytesReceived"), 5, off_1ECE70DF8);
    -[WKDownloadProgress setKind:](v10, "setKind:", *MEMORY[0x1E0CB30F8]);
    -[WKDownloadProgress setFileOperationKind:](v10, "setFileOperationKind:", *MEMORY[0x1E0CB30B8]);
    -[WKDownloadProgress setFileURL:](v10, "setFileURL:", a5);
    v18 = *(SandboxExtension **)a6.m_ptr;
    if (*(_QWORD *)a6.m_ptr)
      ++*(_DWORD *)v18;
    v19 = (const char ***)v10->m_sandboxExtension.m_ptr;
    v10->m_sandboxExtension.m_ptr = v18;
    if (v19)
      WTF::RefCounted<WebKit::SandboxExtension>::deref(v19);
    -[WKDownloadProgress setCancellable:](v10, "setCancellable:", 1);
    v22 = 0;
    objc_initWeak(&v22, v10);
    to = 0;
    objc_moveWeak(&to, &v22);
    v20 = malloc_type_malloc(0x28uLL, 0x10E004086F20DB1uLL);
    *(_QWORD *)v20 = MEMORY[0x1E0C809A0];
    *((_QWORD *)v20 + 1) = 50331650;
    *((_QWORD *)v20 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKDownloadProgress initWithDownloadTask:download:URL:sandboxExtension:]::$_0>(-[WKDownloadProgress initWithDownloadTask:download:URL:sandboxExtension:]::$_0)::{lambda(void *)#1}::__invoke;
    *((_QWORD *)v20 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKDownloadProgress initWithDownloadTask:download:URL:sandboxExtension:]::$_0>(-[WKDownloadProgress initWithDownloadTask:download:URL:sandboxExtension:]::$_0)::descriptor;
    *((_QWORD *)v20 + 4) = 0;
    objc_moveWeak((id *)v20 + 4, &to);
    objc_destroyWeak(&to);
    -[WKDownloadProgress setCancellationHandler:](v10, "setCancellationHandler:", v20);
    _Block_release(v20);
    objc_destroyWeak(&v22);
  }
  return v10;
}

- (void)publish
{
  SandboxExtension *m_ptr;
  uint64_t v4;
  objc_super v5;

  m_ptr = self->m_sandboxExtension.m_ptr;
  v4 = *((_QWORD *)m_ptr + 2);
  *((_QWORD *)m_ptr + 2) = v4 + 1;
  if (!v4)
    WebKit::SandboxExtensionImpl::consume(*((WebKit::SandboxExtensionImpl **)m_ptr + 1));
  v5.receiver = self;
  v5.super_class = (Class)WKDownloadProgress;
  -[WKDownloadProgress publish](&v5, sel_publish);
}

- (void)unpublish
{
  SandboxExtension *m_ptr;
  uint64_t v4;
  objc_super v5;

  -[WKDownloadProgress _updateProgressExtendedAttributeOnProgressFile](self, "_updateProgressExtendedAttributeOnProgressFile");
  v5.receiver = self;
  v5.super_class = (Class)WKDownloadProgress;
  -[WKDownloadProgress unpublish](&v5, sel_unpublish);
  m_ptr = self->m_sandboxExtension.m_ptr;
  v4 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v4;
  if (v4)
  {
    self->m_sandboxExtension.m_ptr = 0;
  }
  else
  {
    *(_QWORD *)(*((_QWORD *)m_ptr + 1) + 8) = 0;
    sandbox_extension_release();
    m_ptr = self->m_sandboxExtension.m_ptr;
    self->m_sandboxExtension.m_ptr = 0;
    if (!m_ptr)
      return;
  }
  WTF::RefCounted<WebKit::SandboxExtension>::deref((const char ***)m_ptr);
}

- (void)_updateProgressExtendedAttributeOnProgressFile
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;

  v3 = -[WKDownloadProgress totalUnitCount](self, "totalUnitCount");
  v4 = -[WKDownloadProgress completedUnitCount](self, "completedUnitCount");
  if (v3 < 1)
    v5 = -1.0;
  else
    v5 = (float)((float)v4 / (float)v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v5);
  setxattr((const char *)objc_msgSend((id)-[WKDownloadProgress fileURL](self, "fileURL"), "fileSystemRepresentation"), "com.apple.progress.fractionCompleted", (const void *)objc_msgSend(v6, "UTF8String"), objc_msgSend(v6, "lengthOfBytesUsingEncoding:", 4), 0, 0);
  if (v6)
    CFRelease(v6);
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->m_task.m_ptr, "removeObserver:forKeyPath:", self, CFSTR("countOfBytesExpectedToReceive"));
  objc_msgSend(self->m_task.m_ptr, "removeObserver:forKeyPath:", self, CFSTR("countOfBytesReceived"));
  v3.receiver = self;
  v3.super_class = (Class)WKDownloadProgress;
  -[WKDownloadProgress dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  if (_MergedGlobals_9 == a6)
  {
    v7 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4);
    v8 = v7;
    if (v7)
      CFRetain(v7);
    v9 = objc_msgSend(v8, "longLongValue");
    if (v9 < 1)
      v10 = -1;
    else
      v10 = v9;
    -[WKDownloadProgress setTotalUnitCount:](self, "setTotalUnitCount:", v10);
  }
  else
  {
    if (off_1ECE70DF8 != a6)
    {
      v12.receiver = self;
      v12.super_class = (Class)WKDownloadProgress;
      -[WKDownloadProgress observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
      return;
    }
    v11 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4);
    v8 = v11;
    if (v11)
      CFRetain(v11);
    -[WKDownloadProgress setCompletedUnitCount:](self, "setCompletedUnitCount:", objc_msgSend(v8, "longLongValue"));
  }
  if (v8)
    CFRelease(v8);
}

- (void).cxx_destruct
{
  const char ***m_ptr;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;

  m_ptr = (const char ***)self->m_sandboxExtension.m_ptr;
  self->m_sandboxExtension.m_ptr = 0;
  if (m_ptr)
    WTF::RefCounted<WebKit::SandboxExtension>::deref(m_ptr);
  v4 = (unsigned int *)self->m_download.m_impl.m_ptr;
  self->m_download.m_impl.m_ptr = 0;
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
  v7 = self->m_task.m_ptr;
  self->m_task.m_ptr = 0;
  if (v7)
    CFRelease(v7);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  return self;
}

- (void)initWithDownloadTask:download:URL:sandboxExtension:
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;

  v3 = 0;
  objc_moveWeak(&v3, (id *)(a1 + 32));
  v1 = WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v1 = off_1E3507FE8;
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

- (uint64_t)initWithDownloadTask:download:URL:sandboxExtension:
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 8)), "performCancel");
}

@end
