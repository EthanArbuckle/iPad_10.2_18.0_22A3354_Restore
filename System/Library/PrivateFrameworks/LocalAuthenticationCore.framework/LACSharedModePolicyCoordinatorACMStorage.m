@implementation LACSharedModePolicyCoordinatorACMStorage

- (LACSharedModePolicyCoordinatorACMStorage)init
{
  LACSharedModePolicyCoordinatorACMStorage *v2;
  LACSecureStorage *v3;
  LACSecureStorageConfiguration *v4;
  uint64_t v5;
  LACSecureStorage *storage;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LACSharedModePolicyCoordinatorACMStorage;
  v2 = -[LACSharedModePolicyCoordinatorACMStorage init](&v8, sel_init);
  if (v2)
  {
    v3 = [LACSecureStorage alloc];
    v4 = -[LACSecureStorageConfiguration initWithBypassEntitlementChecks:]([LACSecureStorageConfiguration alloc], "initWithBypassEntitlementChecks:", 1);
    v5 = -[LACSecureStorage initWithConfig:](v3, "initWithConfig:", v4);
    storage = v2->_storage;
    v2->_storage = (LACSecureStorage *)v5;

  }
  return v2;
}

- (void)performRequest:(id)a3 completion:(id)a4
{
  id v6;
  LACSecureStorage *storage;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  storage = self->_storage;
  v8 = a3;
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__LACSharedModePolicyCoordinatorACMStorage_performRequest_completion___block_invoke;
  v11[3] = &unk_2510C21B8;
  v12 = v6;
  v10 = v6;
  -[LACSecureStorage setObject:forRequest:connection:completionHandler:](storage, "setObject:forRequest:connection:completionHandler:", v9, v8, 0, v11);

}

uint64_t __70__LACSharedModePolicyCoordinatorACMStorage_performRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
