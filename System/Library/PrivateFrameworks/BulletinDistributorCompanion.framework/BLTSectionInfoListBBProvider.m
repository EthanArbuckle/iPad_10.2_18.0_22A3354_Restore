@implementation BLTSectionInfoListBBProvider

- (BLTSectionInfoListBBProvider)init
{
  return -[BLTSectionInfoListBBProvider initWithSettingsGateway:](self, "initWithSettingsGateway:", 0);
}

- (BLTSectionInfoListBBProvider)initWithSettingsGateway:(id)a3
{
  id v4;
  BLTSectionInfoListBBProvider *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  BLTSectionInfoObserver *v9;
  BLTSectionInfoObserver *observer;
  uint64_t v11;
  LSApplicationWorkspace *appWorkspace;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BLTSectionInfoListBBProvider;
  v5 = -[BLTSectionInfoListBBProvider init](&v14, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.bulletindistributor.sectioninfolistbbprovider", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = -[BLTSectionInfoObserver initWithSettingsGateway:]([BLTSectionInfoObserver alloc], "initWithSettingsGateway:", v4);
    observer = v5->_observer;
    v5->_observer = v9;

    -[BLTSectionInfoObserver setDelegate:](v5->_observer, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v11 = objc_claimAutoreleasedReturnValue();
    appWorkspace = v5->_appWorkspace;
    v5->_appWorkspace = (LSApplicationWorkspace *)v11;

    -[LSApplicationWorkspace addObserver:](v5->_appWorkspace, "addObserver:", v5);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[LSApplicationWorkspace removeObserver:](self->_appWorkspace, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)BLTSectionInfoListBBProvider;
  -[BLTSectionInfoListBBProvider dealloc](&v3, sel_dealloc);
}

- (void)reloadWithCompletion:(id)a3
{
  -[BLTSectionInfoObserver reloadWithCompletion:](self->_observer, "reloadWithCompletion:", a3);
}

- (void)reloadSection:(id)a3 completion:(id)a4
{
  BLTSectionInfoObserver *observer;
  void *v6;
  id v7;
  id v8;

  observer = self->_observer;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a4;
  objc_msgSend(v6, "setWithObject:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:](observer, "updateSectionInfoBySectionIDs:completion:", v8, v7);

}

- (id)sectionInfoForSectionID:(id)a3
{
  return -[BLTSectionInfoObserver sectionInfoForSectionID:](self->_observer, "sectionInfoForSectionID:", a3);
}

- (void)sectionInfoObserver:(id)a3 updatedSectionInfoForSectionIDs:(id)a4 transaction:(id)a5
{
  BLTSectionInfoListProviderDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "updateSectionInfoForSectionIDs:transaction:", v8, v7);

}

- (void)sectionInfoObserver:(id)a3 removedSectionWithSectionID:(id)a4 transaction:(id)a5
{
  BLTSectionInfoListProviderDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v7 = a5;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "removedSectionWithSectionID:transaction:", v8, v7);

}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "bundleIdentifier", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    -[BLTSectionInfoObserver updateSectionInfoBySectionIDs:completion:](self->_observer, "updateSectionInfoBySectionIDs:completion:", v5, 0);

}

- (BLTSectionInfoListProviderDelegate)delegate
{
  return (BLTSectionInfoListProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end
