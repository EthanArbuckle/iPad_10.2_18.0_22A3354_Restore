@implementation CKDProxyPCSManager

- (CKDProxyPCSManager)init
{
  const char *v2;
  uint64_t v3;
  CKDProxyPCSManager *v4;
  uint64_t v5;
  Class PCSManagerSuperclass;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDProxyPCSManager;
  v4 = -[CKDProxyPCSManager init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_superclass(CKDPCSManager, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    PCSManagerSuperclass = v4->_PCSManagerSuperclass;
    v4->_PCSManagerSuperclass = (Class)v5;

  }
  return v4;
}

- (void)weAreNeverEverEverUsingEncryption:(id)a3
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;

  v5 = (void *)MEMORY[0x1E0CB3488];
  v6 = a3;
  objc_msgSend_currentHandler(v5, v7, v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (const char *)objc_msgSend_selector(v6, v9, v10);

  NSStringFromSelector(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v13, (uint64_t)a2, self, CFSTR("CKDProxyPCSManager.m"), 29, CFSTR("-[CKDPCSManager %@] was called in a container that should never ever ever use PCS."), v12);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  const char *v4;
  const char *v5;
  void *v6;

  if (objc_msgSend_instancesRespondToSelector_(CKDPCSManager, a2, (uint64_t)a3)
    && (objc_msgSend_instancesRespondToSelector_(MEMORY[0x1E0DE7910], v4, (uint64_t)a3) & 1) == 0)
  {
    objc_msgSend_instanceMethodSignatureForSelector_(CKDPCSManager, v5, (uint64_t)a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  const char *v4;

  return objc_msgSend_instancesRespondToSelector_(CKDPCSManager, a2, (uint64_t)a3)
      && !objc_msgSend_instancesRespondToSelector_(MEMORY[0x1E0DE7910], v4, (uint64_t)a3);
}

- (void)forwardInvocation:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_weAreNeverEverEverUsingEncryption_, a3);
}

- (Class)PCSManagerSuperclass
{
  return self->_PCSManagerSuperclass;
}

- (void)setPCSManagerSuperclass:(Class)a3
{
  objc_storeStrong((id *)&self->_PCSManagerSuperclass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PCSManagerSuperclass, 0);
}

@end
