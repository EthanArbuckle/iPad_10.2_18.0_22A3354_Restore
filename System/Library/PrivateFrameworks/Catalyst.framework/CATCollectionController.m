@implementation CATCollectionController

- (CATCollectionControllerDelegate)delegate
{
  return (CATCollectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)automaticallyRearrangesObjects
{
  return self->_automaticallyRearrangesObjects;
}

- (void)setAutomaticallyRearrangesObjects:(BOOL)a3
{
  if (self->_automaticallyRearrangesObjects != a3)
  {
    self->_automaticallyRearrangesObjects = a3;
    -[CATCollectionController updateKeysAffectingArrangementForceUpdate:includeAllContent:](self, "updateKeysAffectingArrangementForceUpdate:includeAllContent:", 0, 0);
  }
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *sortDescriptors;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToArray:", self->_sortDescriptors) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    sortDescriptors = self->_sortDescriptors;
    self->_sortDescriptors = v4;

    -[CATCollectionController updateKeysAffectingArrangementForceUpdate:includeAllContent:](self, "updateKeysAffectingArrangementForceUpdate:includeAllContent:", 1, 0);
  }

}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (void)setFilterPredicate:(id)a3
{
  NSPredicate *v4;
  NSPredicate *filterPredicate;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_filterPredicate) & 1) == 0)
  {
    v4 = (NSPredicate *)objc_msgSend(v6, "copy");
    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v4;

    -[CATCollectionController updateKeysAffectingArrangementForceUpdate:includeAllContent:](self, "updateKeysAffectingArrangementForceUpdate:includeAllContent:", 1, 1);
  }

}

- (NSIndexSet)selectionIndexes
{
  return self->_selectionIndexes;
}

- (void)setSelectionIndexes:(id)a3
{
  NSIndexSet *v4;
  NSIndexSet *selectionIndexes;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[NSIndexSet isEqualToIndexSet:](self->_selectionIndexes, "isEqualToIndexSet:"))
  {
    v4 = (NSIndexSet *)objc_msgSend(v9, "copy");
    selectionIndexes = self->_selectionIndexes;
    self->_selectionIndexes = v4;

    -[CATCollectionController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[CATCollectionController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "controllerDidChangeSelectionIndexes:", self);

    }
  }

}

- (NSArray)selectedObjects
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[CATCollectionController selectionIndexes](self, "selectionIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CATCollectionController arrangedObjects](self, "arrangedObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CATCollectionController selectionIndexes](self, "selectionIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return (NSArray *)v7;
}

- (NSSet)content
{
  return (NSSet *)(id)-[NSMutableSet copy](self->mContent, "copy");
}

- (CATCollectionController)init
{
  CATCollectionController *v2;
  uint64_t v3;
  NSArray *arrangedObjects;
  uint64_t v5;
  NSMutableSet *mContent;
  uint64_t v7;
  NSMutableSet *mObjectsToRearrange;
  uint64_t v9;
  NSMutableArray *mPendingInsertedObjects;
  uint64_t v11;
  NSMutableArray *mPendingDeletedObjects;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CATCollectionController;
  v2 = -[CATCollectionController init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    arrangedObjects = v2->_arrangedObjects;
    v2->_arrangedObjects = (NSArray *)v3;

    v5 = objc_opt_new();
    mContent = v2->mContent;
    v2->mContent = (NSMutableSet *)v5;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v7 = objc_claimAutoreleasedReturnValue();
    mObjectsToRearrange = v2->mObjectsToRearrange;
    v2->mObjectsToRearrange = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    mPendingInsertedObjects = v2->mPendingInsertedObjects;
    v2->mPendingInsertedObjects = (NSMutableArray *)v9;

    v11 = objc_opt_new();
    mPendingDeletedObjects = v2->mPendingDeletedObjects;
    v2->mPendingDeletedObjects = (NSMutableArray *)v11;

  }
  return v2;
}

- (CATCollectionController)initWithObjects:(id)a3
{
  id v5;
  CATCollectionController *v6;
  CATCollectionController *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableIndexSet *mChangingSelection;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = -[CATCollectionController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->mOriginalObjects, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[CATCollectionController addObject:](v7, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++), (_QWORD)v15);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    mChangingSelection = v7->mChangingSelection;
    v7->mChangingSelection = 0;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[CATCollectionController setDelegate:](self, "setDelegate:", 0);
  -[CATCollectionController unbindContent](self, "unbindContent");
  v3.receiver = self;
  v3.super_class = (Class)CATCollectionController;
  -[CATCollectionController dealloc](&v3, sel_dealloc);
}

- (unint64_t)numberOfArrangedObjects
{
  return -[NSArray count](self->_arrangedObjects, "count");
}

- (id)arrangedObjectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_arrangedObjects, "objectAtIndex:", a3);
}

- (id)arrangedObjectsAtIndexes:(id)a3
{
  return -[NSArray objectsAtIndexes:](self->_arrangedObjects, "objectsAtIndexes:", a3);
}

- (void)resolveArrangedObjectsAtIndexes:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x24BDBCF18];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__CATCollectionController_resolveArrangedObjectsAtIndexes_reply___block_invoke;
    v10[3] = &unk_24C1C59C0;
    v12 = v7;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v9, "cat_performBlockOnMainRunLoop:", v10);

  }
}

void __65__CATCollectionController_resolveArrangedObjectsAtIndexes_reply___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  id v2;

  v1 = a1[6];
  objc_msgSend(*(id *)(a1[4] + 152), "objectsAtIndexes:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (unint64_t)arrangedIndexOfObject:(id)a3
{
  return -[NSArray indexOfObject:](self->_arrangedObjects, "indexOfObject:", a3);
}

- (void)bindContentToObject:(id)a3 withKeyPath:(id)a4
{
  -[CATCollectionController bindContentToObject:withKeyPath:usingTransformer:](self, "bindContentToObject:withKeyPath:usingTransformer:", a3, a4, 0);
}

- (void)bindContentToObject:(id)a3 withKeyPath:(id)a4 usingTransformer:(id)a5
{
  id v9;
  id v10;
  NSString *v11;
  NSString *mKeyPath;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  if (v16)
  {
    if (self->mTarget)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATCollectionController.m"), 237, CFSTR("%@ is already observing <%@: %p> on keypath %@"), self, v16, v16, v9);

    }
    if (-[NSMutableSet count](self->mContent, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATCollectionController.m"), 238, CFSTR("%@ cannot call %@ when there is already content set"), self, v15);

    }
    self->mTarget = v16;
    v11 = (NSString *)objc_msgSend(v9, "copy");
    mKeyPath = self->mKeyPath;
    self->mKeyPath = v11;

    objc_storeStrong((id *)&self->mTransformer, a5);
    objc_msgSend(self->mTarget, "addObserver:forKeyPath:options:context:", self, self->mKeyPath, 7, "_CATCollectionControllerContentObservationContext");
  }

}

- (void)unbindContent
{
  id mTarget;
  NSString *mKeyPath;
  NSValueTransformer *mTransformer;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  mTarget = self->mTarget;
  if (mTarget)
  {
    objc_msgSend(mTarget, "removeObserver:forKeyPath:", self, self->mKeyPath);
    mKeyPath = self->mKeyPath;
    self->mTarget = 0;
    self->mKeyPath = 0;

    mTransformer = self->mTransformer;
    self->mTransformer = 0;

    v6 = (void *)-[NSMutableSet copy](self->mContent, "copy");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[CATCollectionController removeObserversFromObject:forKeyPaths:](self, "removeObserversFromObject:forKeyPaths:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), self->mKeysAffectingArrangement, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[CATCollectionController setArrangedObjects:](self, "setArrangedObjects:", MEMORY[0x24BDBD1A8]);
    -[NSMutableSet removeAllObjects](self->mContent, "removeAllObjects");

  }
}

- (void)rearrangeObjects
{
  -[CATCollectionController updateKeysAffectingArrangementForceUpdate:includeAllContent:](self, "updateKeysAffectingArrangementForceUpdate:includeAllContent:", 1, 1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  objc_super v18;
  _QWORD v19[4];
  id v20;
  CATCollectionController *v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == "_CATCollectionControllerContentObservationContext")
  {
    objc_msgSend(v12, "cat_calculateAddedObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cat_calculateRemovedObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v19[3] = &unk_24C1C5A10;
    v20 = v15;
    v21 = self;
    v22 = v14;
    v16 = v14;
    v17 = v15;
    -[CATCollectionController changeContent:](self, "changeContent:", v19);

  }
  else if (a6 == "_CATCollectionControllerArrangementKeyObservationContext")
  {
    -[NSMutableSet addObject:](self->mObjectsToRearrange, "addObject:", v11);
    -[CATCollectionController scheduleRearrangeTimerIfNeed](self, "scheduleRearrangeTimerIfNeed");
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CATCollectionController;
    -[CATCollectionController observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

uint64_t __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v7[3] = &unk_24C1C59E8;
  v3 = (void *)a1[4];
  v7[4] = a1[5];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke_3;
  v6[3] = &unk_24C1C59E8;
  v4 = (void *)a1[6];
  v6[4] = a1[5];
  return objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
}

void __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v4)
  {
    v6 = v3;
    objc_msgSend(v4, "transformedValue:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  if (v3)
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);
    v3 = v7;
  }

}

void __74__CATCollectionController_observeValueForKeyPath_ofObject_change_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v4)
  {
    v6 = v3;
    objc_msgSend(v4, "transformedValue:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  if (v3)
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v7;
  }

}

- (void)addObserversToObject:(id)a3 forKeyPaths:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 3, "_CATCollectionControllerArrangementKeyObservationContext");
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)removeObserversFromObject:(id)a3 forKeyPaths:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->mContent, "containsObject:") & 1) == 0)
  {
    -[NSMutableSet addObject:](self->mContent, "addObject:", v4);
    -[CATCollectionController addObserversToObject:forKeyPaths:](self, "addObserversToObject:forKeyPaths:", v4, self->mKeysAffectingArrangement);
    -[CATCollectionController arrangeObject:](self, "arrangeObject:", v4);
  }

}

- (void)removeObject:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  -[NSMutableSet removeObject:](self->mObjectsToRearrange, "removeObject:", v5);
  if (-[NSMutableSet containsObject:](self->mContent, "containsObject:", v5))
  {
    -[CATCollectionController removeObserversFromObject:forKeyPaths:](self, "removeObserversFromObject:forKeyPaths:", v5, self->mKeysAffectingArrangement);
    v4 = -[NSMutableArray indexOfObject:](self->mPendingArrangedObjects, "indexOfObject:", v5);
    -[NSMutableSet removeObject:](self->mContent, "removeObject:", v5);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      -[CATCollectionController changeObject:atIndex:forChangeType:newIndex:](self, "changeObject:atIndex:forChangeType:newIndex:", v5, v4, 2, 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (void)updateObject:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  -[CATCollectionController arrangeObject:](self, "arrangeObject:", v5);
  v4 = -[NSMutableArray indexOfObject:](self->mPendingArrangedObjects, "indexOfObject:", v5);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[CATCollectionController changeObject:atIndex:forChangeType:newIndex:](self, "changeObject:atIndex:forChangeType:newIndex:", v5, v4, 4, v4);

}

- (void)arrangeObject:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  -[CATCollectionController filterPredicate](self, "filterPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CATCollectionController filterPredicate](self, "filterPredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "evaluateWithObject:", v14);

  }
  else
  {
    v6 = 1;
  }

  v7 = -[NSMutableArray indexOfObject:](self->mPendingArrangedObjects, "indexOfObject:", v14);
  v8 = v7;
  if (v6)
  {
    v9 = self->mPendingArrangedObjects;
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)-[NSMutableArray mutableCopy](self->mPendingArrangedObjects, "mutableCopy");
      objc_msgSend(v10, "removeObjectAtIndex:", v8);
      v11 = objc_msgSend(v10, "copy");

      v9 = (NSMutableArray *)v11;
    }
    v12 = -[CATCollectionController newIndexForObject:inArrangedObjects:](self, "newIndexForObject:inArrangedObjects:", v14, v9);
    if (v8 != v12)
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        v13 = 1;
      else
        v13 = 3;
      -[CATCollectionController changeObject:atIndex:forChangeType:newIndex:](self, "changeObject:atIndex:forChangeType:newIndex:", v14, v8, v13, v12);
    }

  }
  else if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CATCollectionController changeObject:atIndex:forChangeType:newIndex:](self, "changeObject:atIndex:forChangeType:newIndex:", v14, v7, 2, 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (unint64_t)newIndexForObject:(id)a3 inArrangedObjects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id mOriginalObjects;
  id v12;
  id mTarget;
  uint64_t v14;
  id v15;
  unint64_t v16;
  _QWORD v18[5];
  id v19;

  v6 = a4;
  v7 = a3;
  -[CATCollectionController sortDescriptors](self, "sortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    goto LABEL_2;
  mOriginalObjects = self->mOriginalObjects;
  if (mOriginalObjects)
  {
    v12 = mOriginalObjects;
  }
  else
  {
    mTarget = self->mTarget;
    if (!mTarget || !self->mKeyPath)
    {
      v10 = 0;
      goto LABEL_10;
    }
    objc_msgSend(mTarget, "valueForKeyPath:");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v12;
LABEL_10:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_2:
      v10 = 0;
    }
  }
  v14 = objc_msgSend(v6, "count");
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63__CATCollectionController_newIndexForObject_inArrangedObjects___block_invoke;
  v18[3] = &unk_24C1C5A38;
  v18[4] = self;
  v19 = v10;
  v15 = v10;
  v16 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v14, 1024, v18);

  return v16;
}

uint64_t __63__CATCollectionController_newIndexForObject_inArrangedObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "sortDescriptors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "sortDescriptors", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "compareObject:toObject:", v5, v6);
          if (v14)
          {
            v15 = v14;
            goto LABEL_12;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v11)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_12:

  }
  else
  {
    v16 = *(void **)(a1 + 40);
    if (v16)
    {
      v17 = objc_msgSend(v16, "indexOfObject:", v5);
      v18 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v6);
      if (v17 < v18)
        v15 = -1;
      else
        v15 = v17 != v18;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = objc_msgSend(v5, "compare:", v6);
    }
    else if (v5 >= v6)
    {
      v15 = v5 != v6;
    }
    else
    {
      v15 = -1;
    }
  }

  return v15;
}

- (void)rearrangeTimerDidFire:(id)a3
{
  NSTimer *mRearrangeTimer;
  _QWORD v5[5];

  -[NSTimer invalidate](self->mRearrangeTimer, "invalidate", a3);
  mRearrangeTimer = self->mRearrangeTimer;
  self->mRearrangeTimer = 0;

  if (-[NSMutableSet count](self->mObjectsToRearrange, "count"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __49__CATCollectionController_rearrangeTimerDidFire___block_invoke;
    v5[3] = &unk_24C1C5A60;
    v5[4] = self;
    -[CATCollectionController changeContent:](self, "changeContent:", v5);
  }
}

void __49__CATCollectionController_rearrangeTimerDidFire___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "arrangeObject:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)scheduleRearrangeTimerIfNeed
{
  NSTimer *v3;
  NSTimer *mRearrangeTimer;

  if (!self->mRearrangeTimer)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_rearrangeTimerDidFire_, 0, 0, 0.25);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    mRearrangeTimer = self->mRearrangeTimer;
    self->mRearrangeTimer = v3;

  }
}

- (void)updateKeysAffectingArrangementForceUpdate:(BOOL)a3 includeAllContent:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CATCollectionController automaticallyRearrangesObjects](self, "automaticallyRearrangesObjects"))
  {
    -[CATCollectionController sortDescriptors](self, "sortDescriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("key"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v10);

  objc_msgSend(v7, "removeObject:", &stru_24C1C6B98);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", self->mContent);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", self->_arrangedObjects);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __87__CATCollectionController_updateKeysAffectingArrangementForceUpdate_includeAllContent___block_invoke;
  v14[3] = &unk_24C1C5A10;
  v14[4] = self;
  v15 = v7;
  v16 = v11;
  v12 = v11;
  v13 = v7;
  -[CATCollectionController changeContent:](self, "changeContent:", v14);

}

void __87__CATCollectionController_updateKeysAffectingArrangementForceUpdate_includeAllContent___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*((id *)a1[4] + 9), "isEqualToSet:", a1[5]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", *((_QWORD *)a1[4] + 9));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", a1[5]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "minusSet:", a1[5]);
    objc_msgSend(v3, "minusSet:", *((_QWORD *)a1[4] + 9));
    if (objc_msgSend(v2, "count") || objc_msgSend(v3, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v4 = *((id *)a1[4] + 4);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v23 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
            objc_msgSend(a1[4], "removeObserversFromObject:forKeyPaths:", v9, v2);
            objc_msgSend(a1[4], "addObserversToObject:forKeyPaths:", v9, v3);
            objc_msgSend(a1[4], "arrangeObject:", v9);
            objc_msgSend(a1[6], "removeObject:", v9);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v6);
      }

    }
    v10 = objc_msgSend(a1[5], "copy");
    v11 = a1[4];
    v12 = (void *)v11[9];
    v11[9] = v10;

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = a1[6];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(a1[4], "arrangeObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)changeContent:(id)a3
{
  void (**v5)(void);
  id v6;
  void *v7;
  NSMutableIndexSet *v8;
  NSMutableIndexSet *mChangingSelection;
  NSMutableArray *v10;
  NSMutableArray *mPendingArrangedObjects;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSMutableIndexSet *v16;
  NSIndexSet *v17;
  NSIndexSet *selectionIndexes;
  NSMutableIndexSet *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void (**v24)(void);

  v5 = (void (**)(void))a3;
  v24 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATCollectionController.m"), 559, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeBlock"));

    v5 = 0;
  }
  if (self->mChangingSelection)
  {
    v5[2]();
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDD1698]);
    -[CATCollectionController selectionIndexes](self, "selectionIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSMutableIndexSet *)objc_msgSend(v6, "initWithIndexSet:", v7);
    mChangingSelection = self->mChangingSelection;
    self->mChangingSelection = v8;

    v10 = (NSMutableArray *)-[NSArray mutableCopy](self->_arrangedObjects, "mutableCopy");
    mPendingArrangedObjects = self->mPendingArrangedObjects;
    self->mPendingArrangedObjects = v10;

    -[NSMutableArray removeAllObjects](self->mPendingInsertedObjects, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->mPendingDeletedObjects, "removeAllObjects");
    v24[2]();
    -[CATCollectionController notifyArrangedObjectsWillChange](self, "notifyArrangedObjectsWillChange");
    v12 = (void *)-[NSArray copy](self->_arrangedObjects, "copy");
    v13 = (void *)-[NSMutableArray copy](self->mPendingArrangedObjects, "copy");
    -[CATCollectionController setArrangedObjects:](self, "setArrangedObjects:", v13);

    -[CATCollectionController selectionIndexes](self, "selectionIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToIndexSet:", self->mChangingSelection);

    if (v15)
    {
      v16 = self->mChangingSelection;
      self->mChangingSelection = 0;

      -[CATCollectionController notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:](self, "notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:", v12);
    }
    else
    {
      -[CATCollectionController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectionIndexes"));
      v17 = (NSIndexSet *)-[NSMutableIndexSet copy](self->mChangingSelection, "copy");
      selectionIndexes = self->_selectionIndexes;
      self->_selectionIndexes = v17;

      -[CATCollectionController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectionIndexes"));
      v19 = self->mChangingSelection;
      self->mChangingSelection = 0;

      -[CATCollectionController notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:](self, "notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:", v12);
      -[CATCollectionController delegate](self, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        -[CATCollectionController delegate](self, "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "controllerDidChangeSelectionIndexes:", self);

      }
    }

  }
}

- (void)notifyArrangedObjectsWillChange
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int v14;
  NSUInteger v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CATCollectionController *v19;
  uint64_t v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (self->mChangingSelection)
  {
    if ((-[NSMutableArray count](self->mPendingInsertedObjects, "count")
       || -[NSMutableArray count](self->mPendingDeletedObjects, "count"))
      && !self->mDelegateKnowsContentIsChanging)
    {
      -[CATCollectionController delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) != 0)
      {
        -[CATCollectionController delegate](self, "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "controllerWillChangeContent:", self);

      }
      self->mDelegateKnowsContentIsChanging = 1;
    }
    if (self->mChangingSelection)
    {
      -[CATCollectionController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v8 = self->mPendingDeletedObjects;
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v37 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
              v14 = -[NSMutableArray containsObject:](self->mPendingInsertedObjects, "containsObject:", v13);
              v15 = -[NSArray indexOfObject:](self->_arrangedObjects, "indexOfObject:", v13);
              if (v14)
              {
                v16 = -[NSMutableArray indexOfObject:](self->mPendingArrangedObjects, "indexOfObject:", v13);
                -[CATCollectionController delegate](self, "delegate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v17;
                v19 = self;
                v20 = v13;
                v21 = v15;
                v22 = 3;
                v23 = v16;
              }
              else
              {
                -[CATCollectionController delegate](self, "delegate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = v17;
                v19 = self;
                v20 = v13;
                v21 = v15;
                v22 = 2;
                v23 = 0x7FFFFFFFFFFFFFFFLL;
              }
              objc_msgSend(v17, "controller:willChangeObject:atIndex:forChangeType:newIndex:", v19, v20, v21, v22, v23);

            }
            v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          }
          while (v10);
        }

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v24 = self->mPendingInsertedObjects;
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v33;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v33 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
              if ((-[NSMutableArray containsObject:](self->mPendingDeletedObjects, "containsObject:", v29, (_QWORD)v32) & 1) == 0)
              {
                v30 = -[NSMutableArray indexOfObject:](self->mPendingArrangedObjects, "indexOfObject:", v29);
                -[CATCollectionController delegate](self, "delegate");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "controller:willChangeObject:atIndex:forChangeType:newIndex:", self, v29, 0x7FFFFFFFFFFFFFFFLL, 1, v30);

              }
            }
            v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v26);
        }

      }
    }
  }
}

- (void)notifyArrangedObjectsDidChangeWithPreviousArrangedObjects:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CATCollectionController *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->mDelegateKnowsContentIsChanging)
  {
    -[CATCollectionController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CATCollectionController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "controllerDidChangeContent:", self);

    }
  }
  self->mDelegateKnowsContentIsChanging = 0;
  -[CATCollectionController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = self->mPendingDeletedObjects;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          v16 = -[NSMutableArray containsObject:](self->mPendingInsertedObjects, "containsObject:", v15);
          v17 = objc_msgSend(v4, "indexOfObject:", v15);
          if (v16)
          {
            v18 = -[NSMutableArray indexOfObject:](self->mPendingArrangedObjects, "indexOfObject:", v15);
            -[CATCollectionController delegate](self, "delegate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            v21 = self;
            v22 = v15;
            v23 = v17;
            v24 = 3;
            v25 = v18;
          }
          else
          {
            -[CATCollectionController delegate](self, "delegate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            v21 = self;
            v22 = v15;
            v23 = v17;
            v24 = 2;
            v25 = 0x7FFFFFFFFFFFFFFFLL;
          }
          objc_msgSend(v19, "controller:didChangeObject:atIndex:forChangeType:newIndex:", v21, v22, v23, v24, v25);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v12);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v26 = self->mPendingInsertedObjects;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v35 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          if ((-[NSMutableArray containsObject:](self->mPendingDeletedObjects, "containsObject:", v31, (_QWORD)v34) & 1) == 0)
          {
            v32 = -[NSMutableArray indexOfObject:](self->mPendingArrangedObjects, "indexOfObject:", v31);
            -[CATCollectionController delegate](self, "delegate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "controller:didChangeObject:atIndex:forChangeType:newIndex:", self, v31, 0x7FFFFFFFFFFFFFFFLL, 1, v32);

          }
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v28);
    }

  }
}

- (void)changeObject:(id)a3 atIndex:(unint64_t)a4 forChangeType:(unint64_t)a5 newIndex:(unint64_t)a6
{
  id v10;
  uint64_t v11;
  id v12;

  v10 = a3;
  switch(a5)
  {
    case 3uLL:
      v12 = v10;
      -[NSMutableIndexSet cat_moveIndex:toIndex:](self->mChangingSelection, "cat_moveIndex:toIndex:", a4, a6);
      -[NSMutableArray removeObjectAtIndex:](self->mPendingArrangedObjects, "removeObjectAtIndex:", a4);
      -[NSMutableArray insertObject:atIndex:](self->mPendingArrangedObjects, "insertObject:atIndex:", v12, a6);
      -[NSMutableArray addObject:](self->mPendingInsertedObjects, "addObject:", v12);
LABEL_7:
      v11 = 24;
      goto LABEL_8;
    case 2uLL:
      v12 = v10;
      -[NSMutableIndexSet cat_shiftAndRemoveIndex:](self->mChangingSelection, "cat_shiftAndRemoveIndex:", a4);
      -[NSMutableArray removeObjectAtIndex:](self->mPendingArrangedObjects, "removeObjectAtIndex:", a4);
      goto LABEL_7;
    case 1uLL:
      v12 = v10;
      -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->mChangingSelection, "shiftIndexesStartingAtIndex:by:", a6, 1);
      -[NSMutableArray insertObject:atIndex:](self->mPendingArrangedObjects, "insertObject:atIndex:", v12, a6);
      v11 = 16;
LABEL_8:
      objc_msgSend(*(id *)((char *)&self->super.isa + v11), "addObject:", v12);
      v10 = v12;
      break;
  }

}

- (NSArray)arrangedObjects
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setArrangedObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedObjects, 0);
  objc_storeStrong((id *)&self->_selectionIndexes, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->mOriginalObjects, 0);
  objc_storeStrong((id *)&self->mTransformer, 0);
  objc_storeStrong((id *)&self->mRearrangeTimer, 0);
  objc_storeStrong((id *)&self->mObjectsToRearrange, 0);
  objc_storeStrong((id *)&self->mKeysAffectingArrangement, 0);
  objc_storeStrong((id *)&self->mChangingSelection, 0);
  objc_storeStrong((id *)&self->mKeyPath, 0);
  objc_storeStrong((id *)&self->mContent, 0);
  objc_storeStrong((id *)&self->mPendingDeletedObjects, 0);
  objc_storeStrong((id *)&self->mPendingInsertedObjects, 0);
  objc_storeStrong((id *)&self->mPendingArrangedObjects, 0);
}

@end
