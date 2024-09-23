@implementation _WKWebExtensionContextDelegate

- (_WKWebExtensionContextDelegate)initWithWebExtensionContext:(void *)a3
{
  _WKWebExtensionContextDelegate *v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int *m_ptr;
  unsigned int v9;
  unsigned int v10;
  _WKWebExtensionContextDelegate *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_WKWebExtensionContextDelegate;
  v4 = -[_WKWebExtensionContextDelegate init](&v13, sel_init);
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
    m_ptr = (unsigned int *)v4->_webExtensionContext.m_impl.m_ptr;
    v4->_webExtensionContext.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
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
    v11 = v4;
  }

  return v4;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  WTF::StringImpl *v16;
  const URL *v17;
  unsigned int v18;
  StringImpl *v19;
  id v20;
  URL v21;

  v20 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  m_ptr = self->_webExtensionContext.m_impl.m_ptr;
  if (m_ptr)
  {
    v11 = *((_QWORD *)m_ptr + 1);
    if (v11)
    {
      v12 = v8;
      objc_msgSend(v12, "request", v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "targetFrame");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isMainFrame"))
      {
        MEMORY[0x19AEABB18](&v21, v14);
        if ((*((_BYTE *)&v21 + 8) & 1) != 0)
          v18 = WTF::protocolHostAndPortAreEqual((WTF *)(v11 + 56), &v21, v17);
        else
          v18 = 0;
        v19 = v21.m_string.m_impl.m_ptr;
        v21.m_string.m_impl.m_ptr = 0;
        if (v19)
        {
          if (*(_DWORD *)v19 == 2)
            WTF::StringImpl::destroy((WTF::StringImpl *)v19, v16);
          else
            *(_DWORD *)v19 -= 2;
        }
      }
      else
      {
        v18 = 1;
      }

      v9[2](v9, v18);
    }
  }

}

- (void)_webView:(id)a3 navigationDidFinishDocumentLoad:(id)a4
{
  id v6;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  m_ptr = self->_webExtensionContext.m_impl.m_ptr;
  if (m_ptr)
  {
    v8 = *((_QWORD *)m_ptr + 1);
    if (v8)
    {
      v9 = v11;
      if (WTF::operator==<WKWebView,WKWebView>(v9, (id *)(v8 + 288)))
      {
        v10 = *(_QWORD *)(v8 + 40);
        WebKit::WebExtension::populateBackgroundPropertiesIfNeeded((id *)v10);
        if (!*(_BYTE *)(v10 + 312))
          WebKit::WebExtensionContext::performTasksAfterBackgroundContentLoads(v8 - 16);
      }

    }
  }

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v11;
  id v12;
  id v13;
  _BOOL8 v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  m_ptr = self->_webExtensionContext.m_impl.m_ptr;
  if (m_ptr)
  {
    v11 = *((_QWORD *)m_ptr + 1);
    if (v11)
    {
      v12 = v16;
      v13 = v9;
      v14 = WTF::operator==<WKWebView,WKWebView>(v12, (id *)(v11 + 288));
      if (v14)
      {
        WebKit::WebExtensionContext::createError(v14, 6, 0, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        WTF::RetainPtr<NSError>::operator=((const void **)(v11 + 296), v15);

        WebKit::WebExtensionContext::unloadBackgroundWebView((WebKit::WebExtensionContext *)(v11 - 16));
      }

    }
  }

}

- (void)webViewWebContentProcessDidTerminate:(id)a3
{
  id v4;
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v6;
  id v7;
  id v8;

  v4 = a3;
  m_ptr = self->_webExtensionContext.m_impl.m_ptr;
  if (m_ptr)
  {
    v6 = *((_QWORD *)m_ptr + 1);
    if (v6)
    {
      v8 = v4;
      v7 = v4;
      if (WTF::operator==<WKWebView,WKWebView>(v7, (id *)(v6 + 288)))
      {
        WebKit::WebExtensionContext::unloadBackgroundWebView((WebKit::WebExtensionContext *)(v6 - 16));
        if (WebKit::WebExtension::backgroundContentIsPersistent(*(id **)(v6 + 40)))
          WebKit::WebExtensionContext::loadBackgroundWebView((WebKit::WebExtensionContext *)(v6 - 16));
      }

      v4 = v8;
    }
  }

}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_webExtensionContext.m_impl.m_ptr;
  self->_webExtensionContext.m_impl.m_ptr = 0;
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
