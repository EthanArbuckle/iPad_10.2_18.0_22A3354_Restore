@implementation SOAuthorizationWrapper

- (SOAuthorizationWrapper)init
{
  SOAuthorizationWrapper *v2;
  SOAuthorizationCore *v3;
  SOAuthorizationCore *authorization;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SOAuthorizationWrapper;
  v2 = -[SOAuthorizationWrapper init](&v7, sel_init);
  if (v2)
  {
    v3 = (SOAuthorizationCore *)objc_alloc_init(MEMORY[0x24BE04390]);
    authorization = v2->_authorization;
    v2->_authorization = v3;

    v5 = dispatch_queue_create("com.apple.AppSSO.wrapper", 0);
    -[SOAuthorizationCore setDelegateDispatchQueue:](v2->_authorization, "setDelegateDispatchQueue:", v5);

    -[SOAuthorizationCore setDelegate:](v2->_authorization, "setDelegate:", v2);
  }
  return v2;
}

- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6 andCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id authorizationCompletion;
  id v17;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v17 = a3;
  v15 = (void *)MEMORY[0x2199EB378](a7);
  authorizationCompletion = self->_authorizationCompletion;
  self->_authorizationCompletion = v15;

  -[SOAuthorizationCore beginAuthorizationWithOperation:url:httpHeaders:httpBody:](self->_authorization, "beginAuthorizationWithOperation:url:httpHeaders:httpBody:", v17, v14, v13, v12);
}

- (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4
{
  return objc_msgSend(MEMORY[0x24BE04390], "canPerformAuthorizationWithURL:responseCode:", a3, a4);
}

- (void)authorizationDidNotHandle:(id)a3
{
  id authorizationCompletion;

  (*((void (**)(void))self->_authorizationCompletion + 2))();
  authorizationCompletion = self->_authorizationCompletion;
  self->_authorizationCompletion = 0;

}

- (void)authorizationDidCancel:(id)a3
{
  id authorizationCompletion;

  (*((void (**)(void))self->_authorizationCompletion + 2))();
  authorizationCompletion = self->_authorizationCompletion;
  self->_authorizationCompletion = 0;

}

- (void)authorizationDidComplete:(id)a3
{
  id authorizationCompletion;

  (*((void (**)(void))self->_authorizationCompletion + 2))();
  authorizationCompletion = self->_authorizationCompletion;
  self->_authorizationCompletion = 0;

}

- (void)authorization:(id)a3 didCompleteWithHTTPAuthorizationHeaders:(id)a4
{
  id authorizationCompletion;

  (*((void (**)(void))self->_authorizationCompletion + 2))();
  authorizationCompletion = self->_authorizationCompletion;
  self->_authorizationCompletion = 0;

}

- (void)authorization:(id)a3 didCompleteWithHTTPResponse:(id)a4 httpBody:(id)a5
{
  void (**authorizationCompletion)(id, uint64_t, void *, _QWORD);
  void *v7;
  id v8;

  authorizationCompletion = (void (**)(id, uint64_t, void *, _QWORD))self->_authorizationCompletion;
  objc_msgSend(a4, "allHeaderFields", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  authorizationCompletion[2](authorizationCompletion, 1, v7, 0);

  v8 = self->_authorizationCompletion;
  self->_authorizationCompletion = 0;

}

- (void)authorization:(id)a3 didCompleteWithError:(id)a4
{
  id authorizationCompletion;

  (*((void (**)(void))self->_authorizationCompletion + 2))();
  authorizationCompletion = self->_authorizationCompletion;
  self->_authorizationCompletion = 0;

}

- (id)authorizationCompletion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAuthorizationCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_authorizationCompletion, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
}

@end
