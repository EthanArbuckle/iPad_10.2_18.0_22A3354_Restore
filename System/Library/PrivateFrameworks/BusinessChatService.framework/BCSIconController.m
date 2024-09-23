@implementation BCSIconController

- (BCSIconController)init
{
  BCSIconController *v2;
  BCSCoalesceHelper *v3;
  id *v4;
  BCSIconRemoteFetch *iconRemoteFetch;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BCSIconController;
  v2 = -[BCSIconController init](&v7, sel_init);
  if (v2)
  {
    v3 = -[BCSCoalesceHelper initWithQOSClass:]([BCSCoalesceHelper alloc], "initWithQOSClass:", 25);
    v4 = -[BCSIconRemoteFetch initWithCoalesceHelper:]((id *)[BCSIconRemoteFetch alloc], v3);
    iconRemoteFetch = v2->_iconRemoteFetch;
    v2->_iconRemoteFetch = (BCSIconRemoteFetch *)v4;

  }
  return v2;
}

- (void)fetchSquareIconDataForBusinessItem:(id)a3 forClientBundleID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  id *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, void *, _QWORD);

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  if (v10)
  {
    +[BCSBusinessItemMemoryCache sharedCache]();
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    -[BCSBusinessItemMemoryCache lastFetchedBusinessItemIconDataForBizItem:](v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v10[2](v10, v12, 0);
    }
    else
    {
      -[BCSIconController iconRemoteFetch](self, "iconRemoteFetch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __85__BCSIconController_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke;
      v14[3] = &unk_24C39D548;
      v15 = v8;
      v16 = v10;
      -[BCSIconRemoteFetch fetchSquareIconDataForBusinessItem:forClientBundleID:completion:](v13, v15, v9, v14);

    }
  }

}

void __85__BCSIconController_fetchSquareIconDataForBusinessItem_forClientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7 && !v5)
  {
    +[BCSBusinessItemMemoryCache sharedCache]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSBusinessItemMemoryCache setLastFetchedBusinesIconData:withMatchingBusinessItem:]((uint64_t)v6, v7, *(void **)(a1 + 32));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BCSIconRemoteFetch)iconRemoteFetch
{
  return self->_iconRemoteFetch;
}

- (void)setIconRemoteFetch:(id)a3
{
  objc_storeStrong((id *)&self->_iconRemoteFetch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconRemoteFetch, 0);
}

@end
