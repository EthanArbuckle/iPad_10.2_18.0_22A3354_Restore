@implementation CloudTabsForYouDataSource

- (CloudTabsForYouDataSource)initWithTabStore:(id)a3
{
  id v5;
  CloudTabsForYouDataSource *v6;
  CloudTabsForYouDataSource *v7;
  void *v8;
  CloudTabsForYouDataSource *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CloudTabsForYouDataSource;
  v6 = -[WBSForYouCloudTabsDataSource initWithTabStore:](&v11, sel_initWithTabStore_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cloudTabStore, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__cloudTabsDidUpdate_, CFSTR("CloudTabStoreDidUpdateNotification"), 0);

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CloudTabsForYouDataSource;
  -[CloudTabsForYouDataSource dealloc](&v4, sel_dealloc);
}

- (void)_cloudTabsDidUpdate:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__CloudTabsForYouDataSource__cloudTabsDidUpdate___block_invoke;
  v3[3] = &unk_1E9CF25A0;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __49__CloudTabsForYouDataSource__cloudTabsDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyContentsDidChangeFromSource:", 4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudTabStore, 0);
}

@end
