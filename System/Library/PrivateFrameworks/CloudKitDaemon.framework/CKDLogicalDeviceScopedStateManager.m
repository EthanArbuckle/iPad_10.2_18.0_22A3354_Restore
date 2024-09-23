@implementation CKDLogicalDeviceScopedStateManager

- (CKDLogicalDeviceScopedStateManager)initWithDeviceContext:(id)a3
{
  id v5;
  CKDLogicalDeviceScopedStateManager *v6;
  CKDLogicalDeviceScopedStateManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKDLogicalDeviceScopedStateManager;
  v6 = -[CKDLogicalDeviceScopedStateManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_deviceContext, a3);

  return v7;
}

- (void)clearAllClouddThrottles
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_deviceContext(self, a2, v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_throttleManager(v8, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resetThrottles(v5, v6, v7);

}

- (void)allClouddThrottlesWithCompletionHandler:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a3;
  objc_msgSend_deviceContext(self, v6, v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_throttleManager(v14, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allThrottles(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v13);

}

- (void)addClouddThrottle:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = a3;
  objc_msgSend_deviceContext(self, v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_throttleManager(v11, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addThrottle_(v9, v10, (uint64_t)v4);

}

- (void)postClouddWalrusUpdateNotification
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_msgSend_deviceContext(self, a2, v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accountDataSecurityObserver(v8, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_postClouddWalrusUpdateNotification(v5, v6, v7);

}

- (CKDLogicalDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end
