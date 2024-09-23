@implementation DMTUninstallProfileOperation

- (DMTUninstallProfileOperation)initWithProfileInstallationPrimitives:(id)a3 profileIdentifier:(id)a4
{
  id v7;
  id v8;
  DMTUninstallProfileOperation *v9;
  DMTUninstallProfileOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMTUninstallProfileOperation;
  v9 = -[DMTUninstallProfileOperation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_primitives, a3);
    objc_storeStrong((id *)&v10->_profileIdentifier, a4);
  }

  return v10;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DMTUninstallProfileOperation;
  -[DMTUninstallProfileOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__DMTUninstallProfileOperation_cancel__block_invoke;
  block[3] = &unk_24E59FCE0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __38__DMTUninstallProfileOperation_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  CATErrorWithCodeAndUserInfo();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endOperationWithError:", v2);

}

- (void)uninstallProfile
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_21FD69000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to uninstall profile: %{public}@", (uint8_t *)&v3, 0x16u);
}

- (DMTProfileInstallationPrimitives)primitives
{
  return self->_primitives;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
}

@end
