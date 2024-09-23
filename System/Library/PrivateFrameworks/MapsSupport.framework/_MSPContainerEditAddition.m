@implementation _MSPContainerEditAddition

- (_MSPContainerEditAddition)initWithObjects:(id)a3 indexes:(id)a4 identifiersAtop:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSArray *objects;
  uint64_t v13;
  NSIndexSet *indexesOfAddedObjects;
  uint64_t v15;
  NSMapTable *identifiersAtopByIdentifier;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  NSMapTable *v25;
  void *v26;
  id v28;
  id v29;
  id obj;
  _MSPContainerEditAddition *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)_MSPContainerEditAddition;
  v31 = -[_MSPContainerEditAddition init](&v36, sel_init);
  if (v31)
  {
    v11 = objc_msgSend(v8, "copy");
    objects = v31->_objects;
    v31->_objects = (NSArray *)v11;

    v28 = v9;
    v13 = objc_msgSend(v9, "copy");
    indexesOfAddedObjects = v31->_indexesOfAddedObjects;
    v31->_indexesOfAddedObjects = (NSIndexSet *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    identifiersAtopByIdentifier = v31->_identifiersAtopByIdentifier;
    v31->_identifiersAtopByIdentifier = (NSMapTable *)v15;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v29 = v8;
    obj = v8;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = 0;
      v20 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v10, "objectAtIndexedSubscript:", v19 + i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23 != v24)
          {
            v25 = v31->_identifiersAtopByIdentifier;
            objc_msgSend(v22, "storageIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMapTable setObject:forKey:](v25, "setObject:forKey:", v23, v26);

          }
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        v19 += i;
      }
      while (v18);
    }

    v9 = v28;
    v8 = v29;
  }

  return v31;
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
  v9.super_class = (Class)_MSPContainerEditAddition;
  -[_MSPContainerEditAddition description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSPContainerEditAddition addedImmutableObjects](self, "addedImmutableObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSPContainerEditAddition indexesOfAddedObjects](self, "indexesOfAddedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { adds objects = %@ at indexes = %@ }"), v4, v5, v6);
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
  NSArray *addedImmutableObjects;
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
  -[_MSPContainerEditAddition objects](self, "objects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = __95___MSPContainerEditAddition_useImmutableObjectsFromMap_intermediateMutableObjectTransferBlock___block_invoke;
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
  addedImmutableObjects = self->_addedImmutableObjects;
  self->_addedImmutableObjects = v21;

}

- (id)identifierForObjectAtopAddedImmutableObject:(id)a3
{
  NSMapTable *identifiersAtopByIdentifier;
  void *v4;
  void *v5;

  identifiersAtopByIdentifier = self->_identifiersAtopByIdentifier;
  objc_msgSend(a3, "storageIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](identifiersAtopByIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)objects
{
  return self->_objects;
}

- (NSArray)addedImmutableObjects
{
  return self->_addedImmutableObjects;
}

- (NSIndexSet)indexesOfAddedObjects
{
  return self->_indexesOfAddedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesOfAddedObjects, 0);
  objc_storeStrong((id *)&self->_addedImmutableObjects, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_identifiersAtopByIdentifier, 0);
}

@end
