@implementation ReusableTabManager

- (id)faviconForUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WBReusableTabManager referenceToTabWithUUID:](self, "referenceToTabWithUUID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "tabCollectionItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)reusableTabDocumentWithUUID:(id)a3
{
  -[WBReusableTabManager referenceToTabWithUUID:](self, "referenceToTabWithUUID:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)enumerateReusableTabDocuments:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__ReusableTabManager_enumerateReusableTabDocuments___block_invoke;
  v6[3] = &unk_1E9CF4D38;
  v7 = v4;
  v5 = v4;
  -[WBReusableTabManager enumerateReusableTabs:](self, "enumerateReusableTabs:", v6);

}

uint64_t __52__ReusableTabManager_enumerateReusableTabDocuments___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)windowStates
{
  void *v2;
  void *v3;
  void *v4;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "browserControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __34__ReusableTabManager_windowStates__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "tabController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)tabGroupManager
{
  void *v2;
  void *v3;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabGroupManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
