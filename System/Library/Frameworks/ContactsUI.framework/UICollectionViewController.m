@implementation UICollectionViewController

void __70__UICollectionViewController_CNUI___cnui_updateAccountsRefreshControl__block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (!v2)
  {
    objc_msgSend(v3, "setRefreshControl:", 0);
LABEL_6:

    return;
  }
  objc_msgSend(v3, "refreshControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3BA8]);
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRefreshControl:", v5);

    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refreshControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel_refreshAccountsNow_, 4096);

    goto LABEL_6;
  }
}

void __70__UICollectionViewController_CNUI___cnui_updateAccountsRefreshControl__block_invoke(uint64_t a1, char a2)
{
  _QWORD v2[5];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__UICollectionViewController_CNUI___cnui_updateAccountsRefreshControl__block_invoke_2;
  v2[3] = &unk_1E204C4D0;
  v3 = a2;
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __70__UICollectionViewController_CNUI___cnui_beginRefreshingWithDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endRefreshing");
}

@end
