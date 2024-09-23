@implementation CSAdjunctListModel

- (CSAdjunctListModel)init
{
  CSAdjunctListModel *v2;
  CSAdjunctListModel *v3;
  uint64_t v4;
  NSMutableDictionary *identifiersToItems;
  uint64_t v6;
  NSMutableSet *pendingItems;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSAdjunctListModel;
  v2 = -[CSAdjunctListModel init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_suspended = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    identifiersToItems = v3->_identifiersToItems;
    v3->_identifiersToItems = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    pendingItems = v3->_pendingItems;
    v3->_pendingItems = (NSMutableSet *)v6;

  }
  return v3;
}

- (void)suspendItemHandling
{
  self->_suspended = 1;
}

- (void)resumeItemHandling
{
  self->_suspended = 0;
  -[CSAdjunctListModel _replayPendingChanges](self, "_replayPendingChanges");
}

- (void)addOrUpdateItem:(id)a3
{
  if (self->_suspended)
    -[NSMutableSet addObject:](self->_pendingItems, "addObject:", a3);
  else
    -[CSAdjunctListModel _reallyAddOrUpdateItem:](self, "_reallyAddOrUpdateItem:", a3);
}

- (void)removeItemForIdentifier:(id)a3
{
  id v4;
  NSMutableSet *pendingItems;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    pendingItems = self->_pendingItems;
    v14 = 3221225472;
    v15 = __46__CSAdjunctListModel_removeItemForIdentifier___block_invoke;
    v16 = &unk_1E8E30258;
    v11 = v4;
    v13 = MEMORY[0x1E0C809B0];
    v6 = v4;
    v17 = v6;
    -[NSMutableSet objectsPassingTest:](pendingItems, "objectsPassingTest:", &v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[NSMutableSet removeObject:](self->_pendingItems, "removeObject:", v8);
    -[NSMutableDictionary objectForKey:](self->_identifiersToItems, "objectForKey:", v6, v11, v13, v14, v15, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_identifiersToItems, "removeObjectForKey:", v6);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "adjunctListModel:didRemoveItem:", self, v9);

    }
    v4 = v12;
  }

}

uint64_t __46__CSAdjunctListModel_removeItemForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_reallyAddOrUpdateItem:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_identifiersToItems, "objectForKeyedSubscript:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NSMutableDictionary setObject:forKey:](self->_identifiersToItems, "setObject:forKey:", v4, v7);
  if (v5)
    objc_msgSend(WeakRetained, "adjunctListModel:didUpdateItem:withItem:", self, v5, v4);
  else
    objc_msgSend(WeakRetained, "adjunctListModel:didAddItem:", self, v4);

}

- (void)_replayPendingChanges
{
  NSMutableSet *pendingItems;
  _QWORD v4[5];

  pendingItems = self->_pendingItems;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__CSAdjunctListModel__replayPendingChanges__block_invoke;
  v4[3] = &unk_1E8E30280;
  v4[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](pendingItems, "enumerateObjectsUsingBlock:", v4);
  -[NSMutableSet removeAllObjects](self->_pendingItems, "removeAllObjects");
}

uint64_t __43__CSAdjunctListModel__replayPendingChanges__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyAddOrUpdateItem:", a2);
}

- (CSAdjunctListModelDelegate)delegate
{
  return (CSAdjunctListModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pendingItems, 0);
  objc_storeStrong((id *)&self->_identifiersToItems, 0);
}

@end
