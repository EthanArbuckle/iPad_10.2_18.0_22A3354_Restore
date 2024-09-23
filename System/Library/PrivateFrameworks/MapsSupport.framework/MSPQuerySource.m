@implementation MSPQuerySource

- (id)_initWithOwningContainer:(id)a3
{
  id v4;
  MSPQuerySource *v5;
  MSPQuerySource *v6;
  uint64_t v7;
  NSHashTable *observers;
  id v9;
  _QWORD v11[4];
  MSPQuerySource *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSPQuerySource;
  v5 = -[MSPQuerySource init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_owningContainer, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    v9 = v4;
    objc_msgSend(v9, "addObserver:", v6);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__MSPQuerySource__initWithOwningContainer___block_invoke;
    v11[3] = &unk_1E6653800;
    v12 = v6;
    objc_msgSend(v9, "accessContentsUsingConcurrentBlock:", v11);

  }
  return v6;
}

uint64_t __43__MSPQuerySource__initWithOwningContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveContainerContents:context:", a2, 0);
}

- (id)_initWithParentSource:(id)a3 preprocessingBlock:(id)a4 mappingBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  MSPQuerySource *v12;
  MSPQuerySource *v13;
  uint64_t v14;
  id preprocessingBlock;
  uint64_t v16;
  id mappingBlock;
  uint64_t v18;
  NSHashTable *observers;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MSPQuerySource;
  v12 = -[MSPQuerySource init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parentSource, a3);
    v14 = objc_msgSend(v10, "copy");
    preprocessingBlock = v13->_preprocessingBlock;
    v13->_preprocessingBlock = (id)v14;

    v16 = objc_msgSend(v11, "copy");
    mappingBlock = v13->_mappingBlock;
    v13->_mappingBlock = (id)v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v18;

    -[MSPQuerySource _addObserver:](v13->_parentSource, "_addObserver:", v13);
  }

  return v13;
}

- (void)_addObserver:(id)a3
{
  MSPQuerySource *v4;
  _MSPQueryState *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](v4->_observers, "addObject:", v7);
  v5 = v4->_state;
  objc_sync_exit(v4);

  if (v5)
  {
    -[MSPQuerySource _container](v4, "_container");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_didChangeSourceWithNewState:context:inContainer:", v5, 0, v6);

  }
}

- (id)_container
{
  MSPQuerySource *parentSource;
  void *WeakRetained;

  parentSource = self->_parentSource;
  if (parentSource)
  {
    -[MSPQuerySource _container](parentSource, "_container");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_owningContainer);
  }
  return WeakRetained;
}

- (void)_removeObserver:(id)a3
{
  MSPQuerySource *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](v4->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)container:(id)a3 didEditWithNewContents:(id)a4 orderedEdits:(id)a5 cause:(int64_t)a6 context:(id)a7
{
  -[MSPQuerySource _didReceiveContainerContents:context:](self, "_didReceiveContainerContents:context:", a4, a7, a5, a6);
}

- (void)_didReceiveContainerContents:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  MSPQuerySource *v8;
  _MSPQueryState *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[_MSPQueryState initWithContainerContents:]([_MSPQueryState alloc], "initWithContainerContents:", v6);
  objc_storeStrong((id *)&v8->_state, v9);
  -[NSHashTable allObjects](v8->_observers, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  objc_sync_exit(v8);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
        -[MSPQuerySource _container](v8, "_container", (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "_didChangeSourceWithNewState:context:inContainer:", v9, v7, v17);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

}

- (void)_didChangeSourceWithNewState:(id)a3 context:(id)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSPQuerySource *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  objc_msgSend(v8, "stateByInvokingPreprocessingBlock:mappingBlock:", v11->_preprocessingBlock, v11->_mappingBlock);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&v11->_state, v12);
  -[NSHashTable allObjects](v11->_observers, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_sync_exit(v11);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "_didChangeSourceWithNewState:context:inContainer:", v12, v9, v10, (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (id)sourceByMappingContentsUsingBlock:(id)a3
{
  id v4;
  MSPQuerySource *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = [MSPQuerySource alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__MSPQuerySource_sourceByMappingContentsUsingBlock___block_invoke;
  v9[3] = &unk_1E6653828;
  v10 = v4;
  v6 = v4;
  v7 = -[MSPQuerySource _initWithParentSource:preprocessingBlock:mappingBlock:](v5, "_initWithParentSource:preprocessingBlock:mappingBlock:", self, 0, v9);

  return v7;
}

uint64_t __52__MSPQuerySource_sourceByMappingContentsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)sourceByMappingContentsUsingPreprocessingBlock:(id)a3 mappingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MSPQuerySource _initWithParentSource:preprocessingBlock:mappingBlock:]([MSPQuerySource alloc], "_initWithParentSource:preprocessingBlock:mappingBlock:", self, v7, v6);

  return v8;
}

- (id)newQuery
{
  return -[MSPQuery _initWithSource:]([MSPQuery alloc], "_initWithSource:", self);
}

- (id)newEditableQuery
{
  return -[MSPEditableQuery _initWithSource:]([MSPEditableQuery alloc], "_initWithSource:", self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_preprocessingBlock, 0);
  objc_storeStrong(&self->_mappingBlock, 0);
  objc_storeStrong((id *)&self->_parentSource, 0);
  objc_destroyWeak((id *)&self->_owningContainer);
}

@end
