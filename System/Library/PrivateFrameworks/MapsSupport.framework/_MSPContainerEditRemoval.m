@implementation _MSPContainerEditRemoval

- (_MSPContainerEditRemoval)initWithRemovedObjects:(id)a3 indexes:(id)a4
{
  id v6;
  id v7;
  _MSPContainerEditRemoval *v8;
  uint64_t v9;
  NSArray *originalObjects;
  uint64_t v11;
  NSIndexSet *indexesOfRemovedObjects;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_MSPContainerEditRemoval;
  v8 = -[_MSPContainerEditRemoval init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    originalObjects = v8->_originalObjects;
    v8->_originalObjects = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    indexesOfRemovedObjects = v8->_indexesOfRemovedObjects;
    v8->_indexesOfRemovedObjects = (NSIndexSet *)v11;

  }
  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)_MSPContainerEditRemoval;
  -[_MSPContainerEditRemoval description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSPContainerEditRemoval removedImmutableObjects](self, "removedImmutableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSPContainerEditRemoval indexesOfRemovedObjects](self, "indexesOfRemovedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { removes objects = %@ from indexes = %@ }"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *removedImmutableObjects;
  id v23;
  _QWORD v24[2];
  id (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_MSPContainerEditRemoval originalObjects](self, "originalObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = __94___MSPContainerEditRemoval_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke;
  v26 = &unk_1E6654568;
  v23 = v6;
  v27 = v23;
  v9 = v7;
  v28 = v9;
  v10 = v8;
  v11 = v24;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v30;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v13);
        ((void (*)(_QWORD *, _QWORD, uint64_t))v25)(v11, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v18), v16 + v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v12, "addObject:", v19);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v16 += v18;
    }
    while (v15);
  }

  v20 = (void *)objc_msgSend(v12, "copy");
  v21 = (NSArray *)objc_msgSend(v20, "copy");
  removedImmutableObjects = self->_removedImmutableObjects;
  self->_removedImmutableObjects = v21;

}

- (NSArray)originalObjects
{
  return self->_originalObjects;
}

- (NSArray)removedImmutableObjects
{
  return self->_removedImmutableObjects;
}

- (NSIndexSet)indexesOfRemovedObjects
{
  return self->_indexesOfRemovedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfRemovedObjects, 0);
  objc_storeStrong((id *)&self->_removedImmutableObjects, 0);
  objc_storeStrong((id *)&self->_originalObjects, 0);
}

@end
