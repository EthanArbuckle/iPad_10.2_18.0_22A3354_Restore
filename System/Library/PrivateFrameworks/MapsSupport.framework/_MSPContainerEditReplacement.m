@implementation _MSPContainerEditReplacement

- (_MSPContainerEditReplacement)initWithOriginalObjects:(id)a3 replacementObjects:(id)a4 indexes:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MSPContainerEditReplacement *v11;
  uint64_t v12;
  NSArray *originalObjects;
  uint64_t v14;
  NSArray *replacementObjects;
  uint64_t v16;
  NSIndexSet *indexesOfReplacedObjects;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_MSPContainerEditReplacement;
  v11 = -[_MSPContainerEditReplacement init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    originalObjects = v11->_originalObjects;
    v11->_originalObjects = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    replacementObjects = v11->_replacementObjects;
    v11->_replacementObjects = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    indexesOfReplacedObjects = v11->_indexesOfReplacedObjects;
    v11->_indexesOfReplacedObjects = (NSIndexSet *)v16;

  }
  return v11;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)_MSPContainerEditReplacement;
  -[_MSPContainerEditReplacement description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSPContainerEditReplacement originalImmutableObjects](self, "originalImmutableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSPContainerEditReplacement replacementImmutableObjects](self, "replacementImmutableObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSPContainerEditReplacement indexesOfReplacedObjects](self, "indexesOfReplacedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { replaces original objects = %@ with objects = %@ at indexes = %@ }"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
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
  NSArray *originalImmutableObjects;
  void *v23;
  id v24;
  id v25;
  _QWORD *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSArray *v36;
  NSArray *replacementImmutableObjects;
  id v38;
  id v39;
  _QWORD v40[2];
  id (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  id v44;
  _QWORD v45[2];
  id (*v46)(uint64_t, void *);
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_MSPContainerEditReplacement originalObjects](self, "originalObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v46 = __98___MSPContainerEditReplacement_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke;
  v47 = &unk_1E6654568;
  v38 = v6;
  v48 = v38;
  v9 = v7;
  v49 = v9;
  v10 = v8;
  v11 = v45;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v51;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v51 != v17)
          objc_enumerationMutation(v13);
        ((void (*)(_QWORD *, _QWORD, uint64_t))v46)(v11, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v18), v16 + v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v12, "addObject:", v19);

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      v16 += v18;
    }
    while (v15);
  }

  v20 = (void *)objc_msgSend(v12, "copy");
  v21 = (NSArray *)objc_msgSend(v20, "copy");
  originalImmutableObjects = self->_originalImmutableObjects;
  self->_originalImmutableObjects = v21;

  -[_MSPContainerEditReplacement replacementObjects](self, "replacementObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v41 = __98___MSPContainerEditReplacement_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke_2;
  v42 = &unk_1E6654568;
  v39 = v38;
  v43 = v39;
  v24 = v9;
  v44 = v24;
  v25 = v23;
  v26 = v40;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v28 = v25;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v29)
  {
    v30 = v29;
    v31 = 0;
    v32 = *(_QWORD *)v51;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v28);
        ((void (*)(_QWORD *, _QWORD, uint64_t))v41)(v26, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v33), v31 + v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_msgSend(v27, "addObject:", v34);

        ++v33;
      }
      while (v30 != v33);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      v31 += v33;
    }
    while (v30);
  }

  v35 = (void *)objc_msgSend(v27, "copy");
  v36 = (NSArray *)objc_msgSend(v35, "copy");
  replacementImmutableObjects = self->_replacementImmutableObjects;
  self->_replacementImmutableObjects = v36;

}

- (NSArray)originalObjects
{
  return self->_originalObjects;
}

- (NSArray)originalImmutableObjects
{
  return self->_originalImmutableObjects;
}

- (NSArray)replacementObjects
{
  return self->_replacementObjects;
}

- (NSArray)replacementImmutableObjects
{
  return self->_replacementImmutableObjects;
}

- (NSIndexSet)indexesOfReplacedObjects
{
  return self->_indexesOfReplacedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfReplacedObjects, 0);
  objc_storeStrong((id *)&self->_replacementImmutableObjects, 0);
  objc_storeStrong((id *)&self->_replacementObjects, 0);
  objc_storeStrong((id *)&self->_originalImmutableObjects, 0);
  objc_storeStrong((id *)&self->_originalObjects, 0);
}

@end
