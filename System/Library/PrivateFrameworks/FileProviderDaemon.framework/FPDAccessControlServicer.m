@implementation FPDAccessControlServicer

- (FPDAccessControlServicer)initWithAccessStore:(id)a3
{
  id v4;
  FPDAccessControlServicer *v5;
  FPDAccessControlServicer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FPDAccessControlServicer;
  v5 = -[FPDAccessControlServicer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_accessStore, v4);

  return v6;
}

- (void)bundleIdentifiersWithAccessToAnyItemCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessStore);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__FPDAccessControlServicer_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke;
  v7[3] = &unk_1E8C77AB0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "performWithDBConnection:", v7);

}

void __82__FPDAccessControlServicer_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __82__FPDAccessControlServicer_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E8C77A88;
    v9 = v7;
    v10 = v5;
    v6 = v5;
    objc_msgSend(v9, "performWithFlags:action:", 0, v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __82__FPDAccessControlServicer_bundleIdentifiersWithAccessToAnyItemCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "fetch:", CFSTR("SELECT identifier FROM bundle_keys LIMIT 100"));
  if (objc_msgSend(v2, "next"))
  {
    do
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v4);

    }
    while ((objc_msgSend(v2, "next") & 1) != 0);
  }

  return 1;
}

- (void)revokeAccessToAllItemsForBundle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessStore);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__FPDAccessControlServicer_revokeAccessToAllItemsForBundle_completionHandler___block_invoke;
  v11[3] = &unk_1E8C77AD8;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  objc_msgSend(WeakRetained, "performWithDBConnection:", v11);

}

void __78__FPDAccessControlServicer_revokeAccessToAllItemsForBundle_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD v5[4];
  id v6;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __78__FPDAccessControlServicer_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_2;
    v5[3] = &unk_1E8C77050;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(a2, "performWithFlags:action:", 16, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

uint64_t __78__FPDAccessControlServicer_revokeAccessToAllItemsForBundle_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "execute:", CFSTR("DELETE FROM bundle_keys WHERE identifier = %@"), *(_QWORD *)(a1 + 32));
}

- (FPDAccessControlStore)accessStore
{
  return (FPDAccessControlStore *)objc_loadWeakRetained((id *)&self->_accessStore);
}

- (void)setAccessStore:(id)a3
{
  objc_storeWeak((id *)&self->_accessStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessStore);
}

@end
