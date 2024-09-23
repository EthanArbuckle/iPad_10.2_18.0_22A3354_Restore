@implementation DOCItemCollectionObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD v7[5];

  if (a6 == &DOCItemCollectionObserverObservationContext)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __76__DOCItemCollectionObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_24C0FE168;
    v7[4] = self;
    DOCRunInMainThread(v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DOCItemCollectionObserver;
    -[DOCItemCollectionObserver observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (FPItemCollection)itemCollection
{
  return (FPItemCollection *)objc_getProperty(self, a2, 8, 1);
}

uint64_t __76__DOCItemCollectionObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifySubscribers");
}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__DOCItemCollectionObserver_dataForCollectionShouldBeReloaded___block_invoke;
  v6[3] = &unk_24C0FEE80;
  v7 = v4;
  v5 = v4;
  -[DOCItemCollectionObserver _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:](self, "_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:", v6);
  -[DOCItemCollectionObserver notifySubscribers](self, "notifySubscribers");

}

- (id)addSubscriber:(id)a3
{
  id v4;
  DOCItemCollectionSubscriber *v5;
  void *v6;

  v4 = a3;
  v5 = -[DOCItemCollectionSubscriber initWithUpdateBlock:]([DOCItemCollectionSubscriber alloc], "initWithUpdateBlock:", v4);

  -[DOCItemCollectionObserver subscribers](self, "subscribers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  return v5;
}

- (void)notifySubscribers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((-[FPItemCollection isGathering](self->_itemCollection, "isGathering") & 1) == 0)
  {
    -[FPItemCollection items](self->_itemCollection, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[DOCItemCollectionObserver subscribers](self, "subscribers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v9, "updateBlock");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v9, "updateBlock");
            v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v11)[2](v11, v3);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (NSMutableArray)subscribers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  NSMutableArray *v6;
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
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_soleUpdatableDelegate)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_delegates;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "weakObjectValue", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "conformsToProtocol:", &unk_254597328))
            ((void (**)(_QWORD, void *))v5)[2](v5, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (DOCItemCollectionObserver)initWithItemCollection:(id)a3
{
  id v5;
  DOCItemCollectionObserver *v6;
  uint64_t v7;
  NSMutableArray *subscribers;
  uint64_t v9;
  NSMutableArray *delegates;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DOCItemCollectionObserver;
  v6 = -[DOCItemCollectionObserver init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    subscribers = v6->_subscribers;
    v6->_subscribers = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v6->_itemCollection, a3);
    -[FPItemCollection setDelegate:](v6->_itemCollection, "setDelegate:", v6);
    -[FPItemCollection addObserver:forKeyPath:options:context:](v6->_itemCollection, "addObserver:forKeyPath:options:context:", v6, CFSTR("gathering"), 1, &DOCItemCollectionObserverObservationContext);
    -[FPItemCollection doc_startObserving](v6->_itemCollection, "doc_startObserving");
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[DOCItemCollectionObserver itemCollection](self, "itemCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doc_stopObserving");

  -[DOCItemCollectionObserver itemCollection](self, "itemCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("gathering"));

  v5.receiver = self;
  v5.super_class = (Class)DOCItemCollectionObserver;
  -[DOCItemCollectionObserver dealloc](&v5, sel_dealloc);
}

- (void)removeSubscriber:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[DOCItemCollectionObserver subscribers](self, "subscribers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __46__DOCItemCollectionObserver_removeSubscriber___block_invoke;
  v9[3] = &unk_24C0FEDC0;
  v8 = v4;
  v10 = v8;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[DOCItemCollectionObserver subscribers](self, "subscribers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectAtIndex:", v6);

  }
}

uint64_t __46__DOCItemCollectionObserver_removeSubscriber___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

- (void)addItemCollectionDelegate:(id)a3
{
  id v4;
  NSMutableArray *delegates;
  NSMutableArray *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  delegates = self->_delegates;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__DOCItemCollectionObserver_addItemCollectionDelegate___block_invoke;
  v9[3] = &unk_24C0FEDE8;
  v8 = v4;
  v10 = v8;
  if (-[NSMutableArray indexOfObjectPassingTest:](delegates, "indexOfObjectPassingTest:", v9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = self->_delegates;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithWeakObject:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v6, "addObject:", v7);

  }
  if (-[NSMutableArray count](self->_delegates, "count"))
    -[DOCItemCollectionObserver _purgeOrphanedContainers](self, "_purgeOrphanedContainers");

}

uint64_t __55__DOCItemCollectionObserver_addItemCollectionDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "weakObjectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (void)removeItemCollectionDelegate:(id)a3
{
  FPItemCollectionIndexPathBasedDelegate *v4;
  FPItemCollectionIndexPathBasedDelegate *v5;
  NSMutableArray *delegates;
  uint64_t v7;
  FPItemCollectionIndexPathBasedDelegate *v8;
  _QWORD v9[4];
  FPItemCollectionIndexPathBasedDelegate *v10;

  v4 = (FPItemCollectionIndexPathBasedDelegate *)a3;
  v5 = v4;
  if (self->_soleUpdatableDelegate == v4)
  {
    self->_soleUpdatableDelegate = 0;

  }
  delegates = self->_delegates;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__DOCItemCollectionObserver_removeItemCollectionDelegate___block_invoke;
  v9[3] = &unk_24C0FEDE8;
  v8 = v5;
  v10 = v8;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](delegates, "indexOfObjectPassingTest:", v9);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_delegates, "removeObjectAtIndex:", v7);
  if (-[NSMutableArray count](self->_delegates, "count"))
    -[DOCItemCollectionObserver _purgeOrphanedContainers](self, "_purgeOrphanedContainers");

}

uint64_t __58__DOCItemCollectionObserver_removeItemCollectionDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "weakObjectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
    *a4 = 1;
  return v7;
}

- (void)_purgeOrphanedContainers
{
  id v3;

  -[NSMutableArray indexesOfObjectsPassingTest:](self->_delegates, "indexesOfObjectsPassingTest:", &__block_literal_global_11);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    -[NSMutableArray removeObjectsAtIndexes:](self->_delegates, "removeObjectsAtIndexes:", v3);

}

BOOL __53__DOCItemCollectionObserver__purgeOrphanedContainers__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "weakObjectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)collection:(id)a3 didInsertItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __67__DOCItemCollectionObserver_collection_didInsertItemsAtIndexPaths___block_invoke;
  v13 = &unk_24C0FEE30;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  -[DOCItemCollectionObserver _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:](self, "_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:", &v10);
  -[DOCItemCollectionObserver notifySubscribers](self, "notifySubscribers", v10, v11, v12, v13);

}

uint64_t __67__DOCItemCollectionObserver_collection_didInsertItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collection:didInsertItemsAtIndexPaths:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)collection:(id)a3 didMoveItemsFromIndexPaths:(id)a4 toIndexPaths:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__DOCItemCollectionObserver_collection_didMoveItemsFromIndexPaths_toIndexPaths___block_invoke;
  v14[3] = &unk_24C0FEE58;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[DOCItemCollectionObserver _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:](self, "_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:", v14);
  -[DOCItemCollectionObserver notifySubscribers](self, "notifySubscribers");

}

uint64_t __80__DOCItemCollectionObserver_collection_didMoveItemsFromIndexPaths_toIndexPaths___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:didMoveItemsFromIndexPaths:toIndexPaths:", a1[4], a1[5], a1[6]);
}

- (void)collection:(id)a3 didDeleteItemsAtIndexPaths:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __67__DOCItemCollectionObserver_collection_didDeleteItemsAtIndexPaths___block_invoke;
  v13 = &unk_24C0FEE30;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  -[DOCItemCollectionObserver _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:](self, "_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:", &v10);
  -[DOCItemCollectionObserver notifySubscribers](self, "notifySubscribers", v10, v11, v12, v13);

}

uint64_t __67__DOCItemCollectionObserver_collection_didDeleteItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "collection:didDeleteItemsAtIndexPaths:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)collection:(id)a3 didUpdateItemsAtIndexPaths:(id)a4 changes:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__DOCItemCollectionObserver_collection_didUpdateItemsAtIndexPaths_changes___block_invoke;
  v14[3] = &unk_24C0FEE58;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[DOCItemCollectionObserver _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:](self, "_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:", v14);
  -[DOCItemCollectionObserver notifySubscribers](self, "notifySubscribers");

}

uint64_t __75__DOCItemCollectionObserver_collection_didUpdateItemsAtIndexPaths_changes___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "collection:didUpdateItemsAtIndexPaths:changes:", a1[4], a1[5], a1[6]);
}

uint64_t __63__DOCItemCollectionObserver_dataForCollectionShouldBeReloaded___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dataForCollectionShouldBeReloaded:", *(_QWORD *)(a1 + 32));
}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  DOCItemCollectionObserver *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__DOCItemCollectionObserver_collection_didPerformBatchUpdateWithReplayBlock___block_invoke;
  v10[3] = &unk_24C0FEED0;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[DOCItemCollectionObserver _enumerateItemCollectionIndexPathBasedDelegatesWithBlock:](self, "_enumerateItemCollectionIndexPathBasedDelegatesWithBlock:", v10);
  -[DOCItemCollectionObserver notifySubscribers](self, "notifySubscribers");

}

void __77__DOCItemCollectionObserver_collection_didPerformBatchUpdateWithReplayBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__DOCItemCollectionObserver_collection_didPerformBatchUpdateWithReplayBlock___block_invoke_2;
  v6[3] = &unk_24C0FEEA8;
  v4 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v5 = v3;
  objc_msgSend(v5, "collection:didPerformBatchUpdateWithReplayBlock:", v4, v6);

}

uint64_t __77__DOCItemCollectionObserver_collection_didPerformBatchUpdateWithReplayBlock___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSoleUpdatableDelegate:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setSoleUpdatableDelegate:", 0);
}

- (void)setItemCollection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setSubscribers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)delegates
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDelegates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (FPItemCollectionIndexPathBasedDelegate)soleUpdatableDelegate
{
  return (FPItemCollectionIndexPathBasedDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSoleUpdatableDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soleUpdatableDelegate, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_itemCollection, 0);
}

@end
