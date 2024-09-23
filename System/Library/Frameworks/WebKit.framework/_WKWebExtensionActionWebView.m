@implementation _WKWebExtensionActionWebView

- (_WKWebExtensionActionWebView)initWithFrame:(CGRect)a3 configuration:(id)a4 webExtensionAction:(void *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  _WKWebExtensionActionWebView *v12;
  void *v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *m_ptr;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  _WKWebExtensionActionWebView *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_WKWebExtensionActionWebView;
  v12 = -[WKWebView initWithFrame:configuration:](&v22, sel_initWithFrame_configuration_, v11, x, y, width, height);
  if (v12)
  {
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a5 + 4, (uint64_t)a5);
    v14 = (unsigned int *)*((_QWORD *)a5 + 2);
    if (v14)
    {
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 + 1, v14));
    }
    m_ptr = (unsigned int *)v12->_webExtensionAction.m_impl.m_ptr;
    v12->_webExtensionAction.m_impl.m_ptr = (DefaultWeakPtrImpl *)v14;
    if (m_ptr)
    {
      do
      {
        v17 = __ldaxr(m_ptr);
        v18 = v17 - 1;
      }
      while (__stlxr(v18, m_ptr));
      if (!v18)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v13);
      }
    }
    -[WKWebView scrollView](v12, "scrollView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:forKeyPath:options:context:", v12, CFSTR("contentSize"), 1, kvoContext);

    v20 = v12;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WKWebView scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("contentSize"), kvoContext);

  v4.receiver = self;
  v4.super_class = (Class)_WKWebExtensionActionWebView;
  -[WKWebView dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)kvoContext == a6)
  {
    -[_WKWebExtensionActionWebView _contentSizeDidChange](self, "_contentSizeDidChange");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_WKWebExtensionActionWebView;
    -[_WKWebExtensionActionWebView observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (CGSize)contentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[WKWebView scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_contentSizeDidChange
{
  DefaultWeakPtrImpl *m_ptr;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;

  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    -[_WKWebExtensionActionWebView contentSize](self, "contentSize");
    v6 = v5;
    v7 = v4;
    if (v5 != self->_previousContentSize.width || v4 != self->_previousContentSize.height)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__contentSizeHasStabilized, 0);
      -[_WKWebExtensionActionWebView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__contentSizeHasStabilized, 0, 0.075);
      self->_previousContentSize.width = v6;
      self->_previousContentSize.height = v7;
    }
  }
}

- (void)_contentSizeHasStabilized
{
  DefaultWeakPtrImpl *m_ptr;
  double v4;
  double v5;
  DefaultWeakPtrImpl *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    if (*((_QWORD *)m_ptr + 1))
    {
      if (!-[WKWebView isLoading](self, "isLoading"))
      {
        -[_WKWebExtensionActionWebView contentSize](self, "contentSize");
        if (v5 >= 50.0 && v4 >= 50.0)
        {
          self->_contentSizeHasStabilized = 1;
          v6 = self->_webExtensionAction.m_impl.m_ptr;
          v7 = v6 ? *((_QWORD *)v6 + 1) : 0;
          v8 = *(void **)(v7 + 48);
          WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v8);
          objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "_updatePopoverContentSize");

          if ((*(_BYTE *)(v7 + 124) & 1) != 0)
          {
            v9 = *(void **)(v7 + 56);
            WTF::RetainPtr<_WKWebExtensionDeclarativeNetRequestSQLiteStore>::operator _WKWebExtensionDeclarativeNetRequestSQLiteStore*(v9);
            objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "contentSize");
            v11 = v10;
            v13 = v12;

            v14 = qword_1ECE710C8;
            if (os_log_type_enabled((os_log_t)qword_1ECE710C8, OS_LOG_TYPE_DEBUG))
            {
              v15 = 134349312;
              v16 = v11;
              v17 = 2050;
              v18 = v13;
              _os_log_debug_impl(&dword_196BCC000, v14, OS_LOG_TYPE_DEBUG, "Presenting popup with size { %{public}.0f, %{public}.0f }", (uint8_t *)&v15, 0x16u);
            }
            WebKit::WebExtensionAction::readyToPresentPopup((WebKit::WebExtensionAction *)v7);
          }
        }
      }
    }
  }
}

- (BOOL)contentSizeHasStabilized
{
  return self->_contentSizeHasStabilized;
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_webExtensionAction.m_impl.m_ptr;
  self->_webExtensionAction.m_impl.m_ptr = 0;
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
  *((_QWORD *)self + 222) = 0;
  return self;
}

@end
