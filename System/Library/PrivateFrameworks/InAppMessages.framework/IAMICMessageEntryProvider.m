@implementation IAMICMessageEntryProvider

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)messageEntriesForBundleIdentifiers:(id)a3 completion:(id)a4
{
  -[ICInAppMessageManager messageEntriesForBundleIdentifiers:completion:](self->_iTunesCloudIAMManager, "messageEntriesForBundleIdentifiers:completion:", a3, a4);
}

- (IAMICMessageEntryProvider)init
{
  IAMICMessageEntryProvider *v2;
  uint64_t v3;
  ICInAppMessageManager *iTunesCloudIAMManager;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IAMICMessageEntryProvider;
  v2 = -[IAMICMessageEntryProvider init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEC8810], "sharedManager");
    v3 = objc_claimAutoreleasedReturnValue();
    iTunesCloudIAMManager = v2->_iTunesCloudIAMManager;
    v2->_iTunesCloudIAMManager = (ICInAppMessageManager *)v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__handleMessagesDidChangeNotification, *MEMORY[0x24BEC85C0], 0);

  }
  return v2;
}

- (void)removeMessageEntryWithIdentifier:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICInAppMessageManager *iTunesCloudIAMManager;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  iTunesCloudIAMManager = self->_iTunesCloudIAMManager;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __93__IAMICMessageEntryProvider_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke;
  v13[3] = &unk_24C871098;
  v12 = v10;
  v14 = v12;
  objc_copyWeak(&v15, &location);
  v13[4] = self;
  -[ICInAppMessageManager removeMessageEntryWithIdentifier:forBundleIdentifier:completion:](iTunesCloudIAMManager, "removeMessageEntryWithIdentifier:forBundleIdentifier:completion:", v8, v9, v13);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __93__IAMICMessageEntryProvider_removeMessageEntryWithIdentifier_forBundleIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void (*v3)(void);
  id WeakRetained;
  void *v5;
  id v6;

  v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  if (a2)
  {
    v3();
  }
  else
  {
    v3();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      v6 = WeakRetained;
      objc_msgSend(WeakRetained, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "messageEntriesDidChange:", *(_QWORD *)(a1 + 32));

      WeakRetained = v6;
    }

  }
}

- (void)reportEventForMessageIdentifier:(id)a3 withParams:(id)a4 completion:(id)a5
{
  -[ICInAppMessageManager reportEventForMessageIdentifier:withParams:completion:](self->_iTunesCloudIAMManager, "reportEventForMessageIdentifier:withParams:completion:", a3, a4, a5);
}

- (void)downloadResourcesForMessageWithIdentifier:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  -[ICInAppMessageManager downloadResourcesForMessageWithIdentifier:bundleIdentifier:completion:](self->_iTunesCloudIAMManager, "downloadResourcesForMessageWithIdentifier:bundleIdentifier:completion:", a3, a4, a5);
}

- (void)removeApplicationBadgeForBundleIdentifier:(id)a3 fromPresentedMessageEntry:(id)a4 completion:(id)a5
{
  -[ICInAppMessageManager removeApplicationBadgeForBundleIdentifier:fromPresentedMessageEntry:completion:](self->_iTunesCloudIAMManager, "removeApplicationBadgeForBundleIdentifier:fromPresentedMessageEntry:completion:", a3, a4, a5);
}

- (void)_handleMessagesDidChangeNotification
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[IAMICMessageEntryProvider delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[IAMICMessageEntryProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[IAMICMessageEntryProvider delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "messageEntriesDidChange:", self);

    }
  }
}

- (IAMMessageEntryProviderDelegate)delegate
{
  return (IAMMessageEntryProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_iTunesCloudIAMManager, 0);
}

@end
