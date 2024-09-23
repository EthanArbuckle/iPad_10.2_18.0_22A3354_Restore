@implementation MFSearchableIndexManager_iOS

- (void)enableIndexingAndBeginScheduling:(BOOL)a3 budgetConfiguration:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  MFSearchableIndex_iOS *v8;
  void *v9;
  MFSearchableIndex_iOS *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v4 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_indexLock);
  -[MFSearchableIndexManager_iOS index](self, "index");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [MFSearchableIndex_iOS alloc];
    objc_msgSend((id)objc_opt_class(), "searchableIndexName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MFSearchableIndex_iOS initWithName:dataSource:](v8, "initWithName:dataSource:", v9, self->_persistence);
    -[MFSearchableIndexManager_iOS setIndex:](self, "setIndex:", v10);

    objc_msgSend((id)objc_opt_class(), "searchableIndexBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSearchableIndexManager_iOS index](self, "index");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSearchableIndexBundleID:", v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EC30]), "initWithSchedulable:budgetConfiguration:", self->_index, v6);
    -[MFSearchableIndexManager_iOS setScheduler:](self, "setScheduler:", v13);

    -[MFSearchableIndexManager_iOS scheduler](self, "scheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSearchableIndexManager_iOS index](self, "index");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSchedulableDelegate:", v14);

    v16 = objc_alloc(MEMORY[0x1E0D1EC60]);
    -[MFSearchableIndexManager_iOS index](self, "index");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexPersistence messagePersistence](self->_persistence, "messagePersistence");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithSearchableIndex:persistence:", v17, v18);
    -[EDSearchableIndexManager setSpotlightDaemonClient:](self, "setSpotlightDaemonClient:", v19);

  }
  os_unfair_lock_unlock(&self->_indexLock);
  v20.receiver = self;
  v20.super_class = (Class)MFSearchableIndexManager_iOS;
  -[EDSearchableIndexManager enableIndexingAndBeginScheduling:budgetConfiguration:](&v20, sel_enableIndexingAndBeginScheduling_budgetConfiguration_, v4, v6);

}

- (EDSearchableIndex)index
{
  return self->_index;
}

- (EDSearchableIndexScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (void)setIndex:(id)a3
{
  objc_storeStrong((id *)&self->_index, a3);
}

- (void)enableIndexingAndBeginScheduling:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1EC00], "defaultConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFSearchableIndexManager_iOS enableIndexingAndBeginScheduling:budgetConfiguration:](self, "enableIndexingAndBeginScheduling:budgetConfiguration:", v3);

}

- (MFSearchableIndexManager_iOS)initWithDatabase:(id)a3 messagePersistence:(id)a4 richLinkPersistence:(id)a5 hookResponder:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MFSearchableIndexManager_iOS *v14;
  MFSearchableIndexPersistence_iOS *v15;
  EDSearchableIndexPersistence *persistence;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MFSearchableIndexManager_iOS;
  v14 = -[EDSearchableIndexManager initWithDatabase:messagePersistence:richLinkPersistence:hookResponder:](&v18, sel_initWithDatabase_messagePersistence_richLinkPersistence_hookResponder_, v10, v11, v12, v13);
  if (v14)
  {
    v15 = -[EDSearchableIndexPersistence initWithDatabase:messagePersistence:richLinkPersistence:hookResponder:]([MFSearchableIndexPersistence_iOS alloc], "initWithDatabase:messagePersistence:richLinkPersistence:hookResponder:", v10, v11, v12, v13);
    persistence = v14->_persistence;
    v14->_persistence = &v15->super;

  }
  return v14;
}

+ (BOOL)shouldCancelSearchQuery
{
  void *v2;
  char v3;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCancel");

  return v3;
}

+ (void)addSearchQueryCancelable:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addCancelable:", v4);

}

+ (void)removeSearchQueryCancelable:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeCancelable:", v4);

}

- (EDSearchableIndexPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_index, 0);
}

@end
