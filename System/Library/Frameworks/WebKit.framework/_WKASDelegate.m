@implementation _WKASDelegate

- (_WKASDelegate)initWithPage:(void *)a3 completionHandler:(void *)a4
{
  WebKit::WebPageProxy *v4;
  uint64_t v6;
  objc_super v7;
  uint64_t *v8;
  uint64_t *v9;
  SEL v10;
  void *v11;

  v11 = self;
  v10 = a2;
  v9 = (uint64_t *)a3;
  v8 = (uint64_t *)a4;
  v7.receiver = self;
  v7.super_class = (Class)_WKASDelegate;
  v11 = -[_WKASDelegate init](&v7, sel_init);
  if (!v11)
    return 0;
  if (WTF::WeakPtr<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>::operator BOOL(v9))
  {
    v4 = (WebKit::WebPageProxy *)WTF::WeakPtr<WebKit::WebPageProxy,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>::operator->(v9);
    WebKit::WebPageProxy::cocoaView(v4, &v6);
    WTF::RetainPtr<__IOHIDManager *>::operator=((uint64_t *)v11 + 1, &v6);
    WTF::RetainPtr<NSURLRequest>::~RetainPtr(&v6);
  }
  WTF::BlockPtr<void ()(ASAuthorization *,NSError *)>::operator=((const void **)v11 + 2, v8);
  return (_WKASDelegate *)v11;
}

- (id)presentationAnchorForAuthorizationController:(id)a3
{
  if (WTF::RetainPtr<WKWebView>::operator BOOL(&self->m_view.m_ptr))
    return (id)objc_msgSend((id)WTF::RetainPtr<__IOHIDDevice *>::get((uint64_t *)&self->m_view), "window", a3, a2);
  else
    return 0;
}

- (void)authorizationController:(id)a3 didCompleteWithAuthorization:(id)a4
{
  WTF::BlockPtr<void ()(ASAuthorization *,NSError *)>::operator()((uint64_t)&self->m_completionHandler);
}

- (void)authorizationController:(id)a3 didCompleteWithError:(id)a4
{
  WTF::BlockPtr<void ()(ASAuthorization *,NSError *)>::operator()((uint64_t)&self->m_completionHandler);
}

- (void).cxx_destruct
{
  WTF::BlockPtr<void ()(void)>::~BlockPtr((const void **)&self->m_completionHandler.m_block);
  WTF::RetainPtr<NSURLRequest>::~RetainPtr((uint64_t *)&self->m_view);
}

- (id).cxx_construct
{
  WTF::HashTable<WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>,WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>>,WTF::HashTraits<WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>>,WTF::HashTraits<WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>>>::HashTable(&self->m_view.m_ptr);
  WTF::HashTable<WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>,WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>>,WTF::HashTraits<WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>>,WTF::HashTraits<WTF::Ref<WebKit::Authenticator,WTF::RawPtrTraits<WebKit::Authenticator>,WTF::DefaultRefDerefTraits<WebKit::Authenticator>>>>::HashTable(&self->m_completionHandler.m_block);
  return self;
}

@end
