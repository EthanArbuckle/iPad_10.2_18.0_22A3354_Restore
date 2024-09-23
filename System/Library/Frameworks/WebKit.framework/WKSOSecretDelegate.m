@implementation WKSOSecretDelegate

- (WKSOSecretDelegate)initWithSession:(void *)a3
{
  void *v4;
  WKSOSecretDelegate *v5;
  WTF::ThreadSafeWeakPtrControlBlock *v6;
  unsigned __int8 *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKSOSecretDelegate;
  v5 = -[WKSOSecretDelegate init](&v9, sel_init);
  if (v5)
  {
    v6 = (WTF::ThreadSafeWeakPtrControlBlock *)*((_QWORD *)a3 + 1);
    if (v6)
      v6 = WTF::ThreadSafeWeakPtrControlBlock::weakRef(v6);
    m_ptr = (unsigned __int8 *)v5->_weakSession.m_controlBlock.m_ptr;
    v5->_weakSession.m_controlBlock.m_ptr = (ThreadSafeWeakPtrControlBlock *)v6;
    if (m_ptr)
      WTF::ThreadSafeWeakPtrControlBlock::weakDeref(m_ptr, v4);
    v5->_weakSession.m_objectOfCorrectType = (PopUpSOAuthorizationSession *)a3;
    v5->_isFirstNavigation = 1;
  }
  return v5;
}

- (void)webViewDidClose:(id)a3
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  WebKit::PopUpSOAuthorizationSession *v5;
  WebKit::PopUpSOAuthorizationSession *v6;

  m_ptr = self->_weakSession.m_controlBlock.m_ptr;
  if (m_ptr)
  {
    WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::LibWebRTCCodecsProxy>(&v6, (WTF::Lock *)m_ptr, (uint64_t)self->_weakSession.m_objectOfCorrectType);
    v5 = v6;
    if (v6)
    {
      WebKit::PopUpSOAuthorizationSession::close(v6, (WKWebView *)a3);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::SOAuthorizationSession,(WTF::DestructionThread)2>(*((unsigned __int8 **)v5 + 1));
    }
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v5;

  if (self->_isFirstNavigation)
  {
    v5 = 0;
    self->_isFirstNavigation = 0;
  }
  else
  {
    v5 = 3;
  }
  (*((void (**)(id, uint64_t))a5 + 2))(a5, v5);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  WebKit::PopUpSOAuthorizationSession *v6;
  WebKit::PopUpSOAuthorizationSession *v7;

  m_ptr = self->_weakSession.m_controlBlock.m_ptr;
  if (m_ptr)
  {
    WTF::ThreadSafeWeakPtrControlBlock::makeStrongReferenceIfPossible<WebKit::LibWebRTCCodecsProxy>(&v7, (WTF::Lock *)m_ptr, (uint64_t)self->_weakSession.m_objectOfCorrectType);
    v6 = v7;
    if (v7)
    {
      WebKit::PopUpSOAuthorizationSession::close(v7, (WKWebView *)a3);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebKit::SOAuthorizationSession,(WTF::DestructionThread)2>(*((unsigned __int8 **)v6 + 1));
    }
  }
}

- (void).cxx_destruct
{
  unsigned __int8 *m_ptr;

  m_ptr = (unsigned __int8 *)self->_weakSession.m_controlBlock.m_ptr;
  self->_weakSession.m_controlBlock.m_ptr = 0;
  if (m_ptr)
    WTF::ThreadSafeWeakPtrControlBlock::weakDeref(m_ptr, (void *)a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
