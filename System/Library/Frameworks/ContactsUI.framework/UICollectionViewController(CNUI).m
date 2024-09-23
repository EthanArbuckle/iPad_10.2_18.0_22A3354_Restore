@implementation UICollectionViewController(CNUI)

- (void)_cnui_updateAccountsRefreshControl
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(a1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 != 5)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __70__UICollectionViewController_CNUI___cnui_updateAccountsRefreshControl__block_invoke;
    v4[3] = &unk_1E204F320;
    v4[4] = a1;
    objc_msgSend(MEMORY[0x1E0C971B0], "_cnui_canRequestRefreshWithCompletion:", v4);
  }
}

- (uint64_t)refreshAccountsNow:()CNUI
{
  objc_msgSend(MEMORY[0x1E0C971B0], "_cnui_requestRefreshWithUserAction:", 1);
  return objc_msgSend(a1, "_cnui_beginRefreshingWithDuration:", 1.0);
}

- (void)_cnui_beginRefreshingWithDuration:()CNUI
{
  void *v3;
  void *v4;
  dispatch_time_t v5;
  _QWORD block[4];
  id v7;

  objc_msgSend(a1, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isRefreshing") & 1) == 0)
    objc_msgSend(v4, "beginRefreshing");
  if (objc_msgSend(v4, "isRefreshing"))
  {
    v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__UICollectionViewController_CNUI___cnui_beginRefreshingWithDuration___block_invoke;
    block[3] = &unk_1E204F648;
    v7 = v4;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);

  }
}

@end
