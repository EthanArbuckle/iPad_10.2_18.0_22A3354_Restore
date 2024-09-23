@implementation DMTInstallProfileOperation

- (DMTInstallProfileOperation)initWithProfileInstallationPrimitives:(id)a3 profileData:(id)a4
{
  id v7;
  id v8;
  DMTInstallProfileOperation *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *profileInstallationQueue;
  uint64_t v16;
  NSData *profileData;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)DMTInstallProfileOperation;
  v9 = -[DMTInstallProfileOperation init](&v19, sel_init);
  if (v9)
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR(".profileInstallation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    profileInstallationQueue = v9->_profileInstallationQueue;
    v9->_profileInstallationQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_primitives, a3);
    v16 = objc_msgSend(v8, "copy");
    profileData = v9->_profileData;
    v9->_profileData = (NSData *)v16;

  }
  return v9;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DMTInstallProfileOperation;
  -[DMTInstallProfileOperation cancel](&v5, sel_cancel);
  -[DMTInstallProfileOperation profileInstallationQueue](self, "profileInstallationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__DMTInstallProfileOperation_cancel__block_invoke;
  block[3] = &unk_24E59FCE0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __36__DMTInstallProfileOperation_cancel__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "profileInstallationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_suspend(v2);

  v3 = *(void **)(a1 + 32);
  CATErrorWithCodeAndUserInfo();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endOperationWithError:", v4);

}

- (void)main
{
  NSObject *v3;
  _QWORD block[5];

  -[DMTInstallProfileOperation profileInstallationQueue](self, "profileInstallationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__DMTInstallProfileOperation_main__block_invoke;
  block[3] = &unk_24E59FCE0;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __34__DMTInstallProfileOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "installProfile");
}

- (void)installProfile
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_21FD69000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: Installed profile: %{public}@ successfully", v1, 0x16u);
}

- (OS_dispatch_queue)profileInstallationQueue
{
  return self->_profileInstallationQueue;
}

- (DMTProfileInstallationPrimitives)primitives
{
  return self->_primitives;
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
  objc_storeStrong((id *)&self->_profileInstallationQueue, 0);
}

@end
