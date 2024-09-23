@implementation WKScrollViewDelegateForwarder

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKScrollViewDelegateForwarder;
  if (-[WKScrollViewDelegateForwarder respondsToSelector:](&v7, sel_respondsToSelector_)
    || (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
    v4 = objc_opt_respondsToSelector();
    if (WeakRetained)
      CFRelease(WeakRetained);
  }
  return v4 & 1;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  char v5;
  char v6;
  id WeakRetained;

  v5 = objc_opt_respondsToSelector();
  if (sel_isEqual(a3, sel_viewForZoomingInScrollView_))
  {
    v6 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
    v6 = objc_opt_respondsToSelector();
    if (WeakRetained)
      CFRelease(WeakRetained);
  }
  if ((v5 & 1) != 0 && (v6 & 1) == 0)
    return self->_internalDelegate;
  if (v5 & 1 | ((v6 & 1) == 0))
    return 0;
  return objc_loadWeak(&self->_externalDelegate.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (WKScrollViewDelegateForwarder)initWithInternalDelegate:(id)a3 externalDelegate:(id)a4
{
  WKScrollViewDelegateForwarder *v6;
  WKScrollViewDelegateForwarder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKScrollViewDelegateForwarder;
  v6 = -[WKScrollViewDelegateForwarder init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_internalDelegate = (WKWebView *)a3;
    objc_storeWeak(&v6->_externalDelegate.m_weakReference, a4);
  }
  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id WeakRetained;
  id v6;
  objc_super v8;

  WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
  v8.receiver = self;
  v8.super_class = (Class)WKScrollViewDelegateForwarder;
  v6 = -[WKScrollViewDelegateForwarder methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_, a3);
  if (!v6)
  {
    v6 = (id)-[WKWebView methodSignatureForSelector:](self->_internalDelegate, "methodSignatureForSelector:", a3);
    if (!v6)
      v6 = (id)objc_msgSend(WeakRetained, "methodSignatureForSelector:", a3);
  }
  if (WeakRetained)
    CFRelease(WeakRetained);
  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id WeakRetained;
  const char *v6;
  int v7;
  int v8;
  char v9;
  objc_super v10;

  WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
  v6 = (const char *)objc_msgSend(a3, "selector");
  v7 = objc_opt_respondsToSelector();
  if (sel_isEqual(v6, sel_viewForZoomingInScrollView_))
  {
    v8 = 0;
    goto LABEL_6;
  }
  v8 = objc_opt_respondsToSelector();
  if ((v7 & v8 & 1) == 0)
  {
LABEL_6:
    v9 = 1;
    if ((v7 & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  -[WKWebView _willInvokeUIScrollViewDelegateCallback](self->_internalDelegate, "_willInvokeUIScrollViewDelegateCallback");
  v9 = 0;
  v8 = 1;
  if ((v7 & 1) != 0)
LABEL_7:
    objc_msgSend(a3, "invokeWithTarget:", self->_internalDelegate);
LABEL_8:
  if ((v8 & 1) != 0)
    objc_msgSend(a3, "invokeWithTarget:", WeakRetained);
  if ((v9 & 1) == 0)
    -[WKWebView _didInvokeUIScrollViewDelegateCallback](self->_internalDelegate, "_didInvokeUIScrollViewDelegateCallback");
  if (((v7 | v8) & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)WKScrollViewDelegateForwarder;
    -[WKScrollViewDelegateForwarder forwardInvocation:](&v10, sel_forwardInvocation_, a3);
  }
  if (WeakRetained)
    CFRelease(WeakRetained);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_externalDelegate.m_weakReference);
}

@end
