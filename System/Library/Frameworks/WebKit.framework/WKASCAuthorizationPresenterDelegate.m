@implementation WKASCAuthorizationPresenterDelegate

- (WKASCAuthorizationPresenterDelegate)initWithCoordinator:(void *)a3
{
  void *v4;
  WKASCAuthorizationPresenterDelegate *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WKASCAuthorizationPresenterDelegate;
  v5 = -[WKASCAuthorizationPresenterDelegate init](&v15, sel_init);
  if (v5)
  {
    v6 = *(_QWORD *)a3;
    if (*(_QWORD *)a3)
      goto LABEL_16;
    v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v6 = 1;
    *(_QWORD *)(v6 + 8) = a3;
    v7 = *(unsigned int **)a3;
    *(_QWORD *)a3 = v6;
    if (!v7)
      goto LABEL_16;
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, v4);
    }
    v6 = *(_QWORD *)a3;
    if (*(_QWORD *)a3)
    {
LABEL_16:
      do
        v10 = __ldaxr((unsigned int *)v6);
      while (__stlxr(v10 + 1, (unsigned int *)v6));
    }
    m_ptr = (unsigned int *)v5->_coordinator.m_impl.m_ptr;
    v5->_coordinator.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr)
    {
      do
      {
        v12 = __ldaxr(m_ptr);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, m_ptr));
      if (!v13)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v4);
      }
    }
  }
  return v5;
}

- (void)authorizationPresenter:(id)a3 credentialRequestedForLoginChoice:(id)a4 authenticatedContext:(id)a5 completionHandler:(id)a6
{
  void *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WebKit *v12;
  uint64_t isKindOfClass;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  _QWORD *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  _QWORD *v20;
  _QWORD *v21;
  WTF::StringImpl *v22;
  _QWORD *v23;
  WTF::StringImpl *v24;

  v9 = _Block_copy(a6);
  v10 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v10 = off_1E34CC770;
  *((_QWORD *)v10 + 1) = v9;
  v24 = v10;
  -[WKASCAuthorizationPresenterDelegate dispatchCoordinatorCallback:](self, "dispatchCoordinatorCallback:", &v24);
  v11 = v24;
  v24 = 0;
  if (v11)
    (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v11 + 8))(v11);
  _Block_release(0);
  WebKit::getASCPlatformPublicKeyCredentialLoginChoiceClass[0](v12);
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    if (objc_msgSend(a4, "isRegistrationRequest"))
    {
      if (a5)
        CFRetain(a5);
      v14 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
      *(_QWORD *)v14 = &off_1E34CC7C0;
      *((_QWORD *)v14 + 1) = a5;
      v24 = v14;
      -[WKASCAuthorizationPresenterDelegate dispatchCoordinatorCallback:](self, "dispatchCoordinatorCallback:", &v24);
      v15 = v24;
      v24 = 0;
      if (v15)
        (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v15 + 8))(v15);
      goto LABEL_21;
    }
    MEMORY[0x19AEABCC8](&v24, objc_msgSend(a4, "name"));
    v19 = v24;
    v24 = 0;
    if (a5)
      CFRetain(a5);
    v20 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v20 = &off_1E34CC7E8;
    v20[1] = v19;
    v20[2] = a5;
    v23 = v20;
    -[WKASCAuthorizationPresenterDelegate dispatchCoordinatorCallback:](self, "dispatchCoordinatorCallback:", &v23);
  }
  else
  {
    WebKit::getASCSecurityKeyPublicKeyCredentialLoginChoiceClass[0]((WebKit *)isKindOfClass);
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(a4, "credentialKind") != 1)
      goto LABEL_21;
    MEMORY[0x19AEABCC8](&v24, objc_msgSend(a4, "name"));
    v16 = v24;
    v24 = 0;
    v17 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v17 = &off_1E34CC810;
    v17[1] = v16;
    v23 = v17;
    -[WKASCAuthorizationPresenterDelegate dispatchCoordinatorCallback:](self, "dispatchCoordinatorCallback:", &v23);
  }
  v21 = v23;
  v23 = 0;
  if (v21)
    (*(void (**)(_QWORD *))(*v21 + 8))(v21);
  v22 = v24;
  v24 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy(v22, v18);
    else
      *(_DWORD *)v22 -= 2;
  }
LABEL_21:
  _Block_release(0);
}

- (void)authorizationPresenter:(id)a3 validateUserEnteredPIN:(id)a4 completionHandler:(id)a5
{
  void *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  _QWORD *v11;
  WTF::StringImpl *v12;
  _QWORD *v13;
  WTF::StringImpl *v14;
  _QWORD *v15;
  WTF::StringImpl *v16;

  v7 = _Block_copy(a5);
  v8 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(_QWORD *)v8 = off_1E34CC838;
  *((_QWORD *)v8 + 1) = v7;
  v16 = v8;
  -[WKASCAuthorizationPresenterDelegate dispatchCoordinatorCallback:](self, "dispatchCoordinatorCallback:", &v16);
  v9 = v16;
  v16 = 0;
  if (v9)
    (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v9 + 8))(v9);
  _Block_release(0);
  MEMORY[0x19AEABCC8](&v16, a4);
  v10 = v16;
  v16 = 0;
  v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v11 = &off_1E34CC888;
  v11[1] = v10;
  v15 = v11;
  -[WKASCAuthorizationPresenterDelegate dispatchCoordinatorCallback:](self, "dispatchCoordinatorCallback:", &v15);
  v13 = v15;
  v15 = 0;
  if (v13)
    (*(void (**)(_QWORD *))(*v13 + 8))(v13);
  v14 = v16;
  v16 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy(v14, v12);
    else
      *(_DWORD *)v14 -= 2;
  }
  _Block_release(0);
}

- (void)dispatchCoordinatorCallback:(void *)a3
{
  unsigned int *m_ptr;
  unsigned int v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  WTF::RunLoop::main((WTF::RunLoop *)self);
  m_ptr = (unsigned int *)self->_coordinator.m_impl.m_ptr;
  if (m_ptr)
  {
    do
      v6 = __ldaxr(m_ptr);
    while (__stlxr(v6 + 1, m_ptr));
  }
  v7 = *(_QWORD *)a3;
  *(_QWORD *)a3 = 0;
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v8 = &off_1E34CC8B0;
  v8[1] = m_ptr;
  v8[2] = v7;
  v9 = v8;
  WTF::RunLoop::dispatch();
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_coordinator.m_impl.m_ptr;
  self->_coordinator.m_impl.m_ptr = 0;
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

- (uint64_t)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)authorizationPresenter:(const void *)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:
{
  void *v2;

  *a1 = off_1E34CC798;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(uint64_t)a2 authenticatedContext:completionHandler:
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;

  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  *v4 = off_1E34CC798;
  v4[1] = v5;
  result = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 56) = v4;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

- (_QWORD)authorizationPresenter:(_QWORD *)a1 credentialRequestedForLoginChoice:authenticatedContext:completionHandler:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E34CC7C0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)authorizationPresenter:(WTF *)this credentialRequestedForLoginChoice:(void *)a2 authenticatedContext:completionHandler:
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34CC7C0;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (void)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(WebKit::AuthenticatorPresenterCoordinator *)this authenticatedContext:completionHandler:
{
  WebKit::AuthenticatorPresenterCoordinator::setLAContext(this, *(CFTypeRef *)(a1 + 8));
}

- (_QWORD)authorizationPresenter:(_QWORD *)a1 credentialRequestedForLoginChoice:(WTF::StringImpl *)a2 authenticatedContext:completionHandler:
{
  WTF::StringImpl *v3;

  v3 = (WTF::StringImpl *)a1[1];
  *a1 = &off_1E34CC810;
  a1[1] = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      WTF::StringImpl::destroy(v3, a2);
    else
      *(_DWORD *)v3 -= 2;
  }
  return a1;
}

- (uint64_t)authorizationPresenter:(WTF *)this credentialRequestedForLoginChoice:(WTF::StringImpl *)a2 authenticatedContext:completionHandler:
{
  WTF::StringImpl *v3;

  v3 = (WTF::StringImpl *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34CC810;
  *((_QWORD *)this + 1) = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      WTF::StringImpl::destroy(v3, a2);
    else
      *(_DWORD *)v3 -= 2;
  }
  return WTF::fastFree(this, a2);
}

- (_DWORD)authorizationPresenter:(uint64_t)a1 credentialRequestedForLoginChoice:(WebKit::AuthenticatorPresenterCoordinator *)this authenticatedContext:completionHandler:
{
  return WebKit::AuthenticatorPresenterCoordinator::didSelectAssertionResponse(this, (WTF::StringImpl **)(a1 + 8), 0);
}

- (uint64_t)authorizationPresenter:(uint64_t)a1 validateUserEnteredPIN:completionHandler:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)authorizationPresenter:(const void *)a1 validateUserEnteredPIN:completionHandler:
{
  void *v2;

  *a1 = off_1E34CC860;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)authorizationPresenter:(uint64_t)a1 validateUserEnteredPIN:(uint64_t)a2 completionHandler:
{
  return WTF::CompletionHandler<void ()(WTF::String const&)>::operator()((WTF::RefCountedBase *)(a2 + 96), a1 + 8);
}

- (_QWORD)authorizationPresenter:(_QWORD *)a1 validateUserEnteredPIN:(WTF::StringImpl *)a2 completionHandler:
{
  WTF::StringImpl *v3;

  v3 = (WTF::StringImpl *)a1[1];
  *a1 = &off_1E34CC888;
  a1[1] = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      WTF::StringImpl::destroy(v3, a2);
    else
      *(_DWORD *)v3 -= 2;
  }
  return a1;
}

- (uint64_t)authorizationPresenter:(WTF *)this validateUserEnteredPIN:(WTF::StringImpl *)a2 completionHandler:
{
  WTF::StringImpl *v3;

  v3 = (WTF::StringImpl *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E34CC888;
  *((_QWORD *)this + 1) = 0;
  if (v3)
  {
    if (*(_DWORD *)v3 == 2)
      WTF::StringImpl::destroy(v3, a2);
    else
      *(_DWORD *)v3 -= 2;
  }
  return WTF::fastFree(this, a2);
}

- (_QWORD)dispatchCoordinatorCallback:(_QWORD *)a1
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  *a1 = &off_1E34CC8B0;
  v3 = a1[2];
  a1[2] = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = (unsigned int *)a1[1];
  a1[1] = 0;
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
      WTF::fastFree((WTF *)v4, a2);
    }
  }
  return a1;
}

- (uint64_t)dispatchCoordinatorCallback:(WTF *)this
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;

  *(_QWORD *)this = &off_1E34CC8B0;
  v3 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = (unsigned int *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
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
      WTF::fastFree((WTF *)v4, a2);
    }
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)dispatchCoordinatorCallback:(uint64_t)result
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 8);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 8))
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(result + 16) + 16))(*(_QWORD *)(result + 16));
  }
  return result;
}

@end
