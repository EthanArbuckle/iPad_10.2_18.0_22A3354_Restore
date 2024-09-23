@implementation _WKWebExtensionControllerHelper

- (_WKWebExtensionControllerHelper)initWithWebExtensionController:(void *)a3
{
  _WKWebExtensionControllerHelper *v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int *m_ptr;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  _WKWebExtensionControllerHelper *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_WKWebExtensionControllerHelper;
  v4 = -[_WKWebExtensionControllerHelper init](&v14, sel_init);
  if (v4)
  {
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 6, (uint64_t)a3 + 16);
    v6 = (unsigned int *)*((_QWORD *)a3 + 3);
    if (v6)
    {
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 + 1, v6));
    }
    m_ptr = (unsigned int *)v4->_webExtensionController.m_impl.m_ptr;
    v4->_webExtensionController.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr)
    {
      do
      {
        v9 = __ldaxr(m_ptr);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, m_ptr));
      if (!v10)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__didDeleteLocalStorage_, CFSTR("WebExtensionLocalStorageWasDeleted"), 0);

    v12 = v4;
  }

  return v4;
}

- (void)_didDeleteLocalStorage:(id)a3
{
  void *v4;
  void *v5;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WebKit::WebExtensionContext *v10;
  WTF::StringImpl *v11;
  WebKit::WebExtensionContext *v12;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WebKit::objectForKey<NSString>(v4, (uint64_t)CFSTR("uniqueIdentifier"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    m_ptr = self->_webExtensionController.m_impl.m_ptr;
    if (m_ptr)
    {
      v7 = *((_QWORD *)m_ptr + 1);
      if (v7)
      {
        MEMORY[0x19AEABCC8](&v11, v5);
        WebKit::WebExtensionController::extensionContext((WebKit::WebExtensionController *)(v7 - 16), &v11, &v12);
        v9 = v11;
        v11 = 0;
        if (v9)
        {
          if (*(_DWORD *)v9 == 2)
            WTF::StringImpl::destroy(v9, v8);
          else
            *(_DWORD *)v9 -= 2;
        }
        v10 = v12;
        if (v12)
        {
          WebKit::WebExtensionContext::invalidateStorage(v12);
          CFRelease(*((CFTypeRef *)v10 + 1));
        }
      }
    }
  }

}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_webExtensionController.m_impl.m_ptr;
  self->_webExtensionController.m_impl.m_ptr = 0;
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
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
