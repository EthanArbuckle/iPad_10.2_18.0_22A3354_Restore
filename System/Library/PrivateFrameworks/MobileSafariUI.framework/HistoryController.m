@implementation HistoryController

- (HistoryController)init
{
  HistoryController *v2;
  uint64_t v3;
  NSMapTable *frequentlyVisitedSitesBannedURLStores;
  uint64_t v5;
  NSMapTable *frequentlyVisitedSitesControllers;
  HistoryController *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HistoryController;
  v2 = -[WBSHistoryController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    frequentlyVisitedSitesBannedURLStores = v2->_frequentlyVisitedSitesBannedURLStores;
    v2->_frequentlyVisitedSitesBannedURLStores = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    frequentlyVisitedSitesControllers = v2->_frequentlyVisitedSitesControllers;
    v2->_frequentlyVisitedSitesControllers = (NSMapTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)frequentlyVisitedSitesControllerForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  FrequentlyVisitedSitesController *v8;
  void *v9;
  void *v10;
  FrequentlyVisitedSitesController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FrequentlyVisitedSitesController *v16;

  v4 = a4;
  v6 = a3;
  -[NSMapTable objectForKey:](self->_frequentlyVisitedSitesControllers, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    -[HistoryController historyForProfileIdentifier:loadIfNeeded:](self, "historyForProfileIdentifier:loadIfNeeded:", v6, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[HistoryController frequentlyVisitedSitesBannedURLStoreForProfileIdentifier:loadIfNeeded:](self, "frequentlyVisitedSitesBannedURLStoreForProfileIdentifier:loadIfNeeded:", v6, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = [FrequentlyVisitedSitesController alloc];
        objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[Application sharedApplication](Application, "sharedApplication");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "tabGroupManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "tabCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[FrequentlyVisitedSitesController initWithBookmarkCollection:history:bannedURLStore:tabCollection:profileIdentifier:](v11, "initWithBookmarkCollection:history:bannedURLStore:tabCollection:profileIdentifier:", v12, v9, v10, v15, v6);

        -[NSMapTable setObject:forKey:](self->_frequentlyVisitedSitesControllers, "setObject:forKey:", v16, v6);
        if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) == 0)
          -[WBSFrequentlyVisitedSitesController recomputeFrequentlyVisitedSitesIfNecessary](v16, "recomputeFrequentlyVisitedSitesIfNecessary");
        v8 = v16;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (id)frequentlyVisitedSitesBannedURLStoreForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  SafariFrequentlyVisitedSitesBannedURLStoreURLForProfileWithIdentifier(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMapTable objectForKey:](self->_frequentlyVisitedSitesBannedURLStores, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
    }
    else
    {
      -[HistoryController historyForProfileIdentifier:loadIfNeeded:](self, "historyForProfileIdentifier:loadIfNeeded:", v6, v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A968]), "initWithStoreURL:history:", v7, v10);
        -[NSMapTable setObject:forKey:](self->_frequentlyVisitedSitesBannedURLStores, "setObject:forKey:", v11, v6);
        v9 = v11;
      }
      else
      {
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)historyForProfileIdentifier:(id)a3 loadIfNeeded:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HistoryController;
  -[WBSHistoryController historyForProfileIdentifier:loadIfNeeded:](&v5, sel_historyForProfileIdentifier_loadIfNeeded_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_createHistoryForProfileIdentifier:(id)a3
{
  id v3;
  History *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[WBUHistory initWithDatabaseID:]([History alloc], "initWithDatabaseID:", v3);
    -[WBSHistory loadHistoryAsynchronouslyIfNeeded](v4, "loadHistoryAsynchronouslyIfNeeded");
  }
  else
  {
    +[History sharedHistory](History, "sharedHistory");
    v4 = (History *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frequentlyVisitedSitesControllers, 0);
  objc_storeStrong((id *)&self->_frequentlyVisitedSitesBannedURLStores, 0);
}

@end
