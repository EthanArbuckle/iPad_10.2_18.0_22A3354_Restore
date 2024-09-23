@implementation HMObjectMergeCollection

- (HMObjectMergeCollection)initWithCurrentObjects:(id)a3 newObjects:(id)a4
{
  return -[HMObjectMergeCollection initWithCurrentObjects:newObjects:commonObjectPredicate:](self, "initWithCurrentObjects:newObjects:commonObjectPredicate:", a3, a4, &__block_literal_global_9694);
}

- (HMObjectMergeCollection)initWithCurrentObjects:(id)a3 newObjects:(id)a4 commonObjectPredicate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMObjectMergeCollection *v11;
  uint64_t v12;
  NSMutableArray *currentUpdatedObjects;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NSArray *addedObjects;
  uint64_t v22;
  NSArray *removedObjects;
  uint64_t v24;
  NSArray *commonObjectPairs;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)HMObjectMergeCollection;
  v11 = -[HMObjectMergeCollection init](&v35, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    currentUpdatedObjects = v11->_currentUpdatedObjects;
    v11->_currentUpdatedObjects = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __83__HMObjectMergeCollection_initWithCurrentObjects_newObjects_commonObjectPredicate___block_invoke;
    v30 = &unk_1E3AAEA38;
    v31 = v15;
    v33 = v14;
    v34 = v10;
    v32 = v16;
    v17 = v14;
    v18 = v16;
    v19 = v15;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v27);
    v20 = objc_msgSend(v17, "copy", v27, v28, v29, v30);
    addedObjects = v11->_addedObjects;
    v11->_addedObjects = (NSArray *)v20;

    v22 = objc_msgSend(v19, "copy");
    removedObjects = v11->_removedObjects;
    v11->_removedObjects = (NSArray *)v22;

    v24 = objc_msgSend(v18, "copy");
    commonObjectPairs = v11->_commonObjectPairs;
    v11->_commonObjectPairs = (NSArray *)v24;

  }
  return v11;
}

- (BOOL)isModified
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[HMObjectMergeCollection addedObjects](self, "addedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[HMObjectMergeCollection removedObjects](self, "removedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;
  -[HMObjectMergeCollection currentUpdatedObjects](self, "currentUpdatedObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = v6 + objc_msgSend(v7, "count") != 0;

  return v6;
}

- (NSArray)finalObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMObjectMergeCollection commonObjectPairs](self, "commonObjectPairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMObjectMergeCollection addedObjects](self, "addedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)replaceAddedObjectsWithObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMObjectMergeCollection addedObjects](self, "addedObjects", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hmf_firstObjectWithValue:forKeyPath:", v11, CFSTR("uniqueIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[HMObjectMergeCollection setAddedObjects:](self, "setAddedObjects:", v5);
}

- (void)mergeCommonObjects
{
  void *v3;
  _QWORD v4[5];

  -[HMObjectMergeCollection commonObjectPairs](self, "commonObjectPairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__HMObjectMergeCollection_mergeCommonObjects__block_invoke;
  v4[3] = &unk_1E3AAEAA0;
  v4[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

- (void)mergeCommonObjectsNoMergeCount
{
  id v2;

  -[HMObjectMergeCollection commonObjectPairs](self, "commonObjectPairs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_8_9669);

}

- (NSArray)addedObjects
{
  return self->_addedObjects;
}

- (void)setAddedObjects:(id)a3
{
  objc_storeStrong((id *)&self->_addedObjects, a3);
}

- (NSArray)removedObjects
{
  return self->_removedObjects;
}

- (NSMutableArray)currentUpdatedObjects
{
  return self->_currentUpdatedObjects;
}

- (NSArray)commonObjectPairs
{
  return self->_commonObjectPairs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonObjectPairs, 0);
  objc_storeStrong((id *)&self->_currentUpdatedObjects, 0);
  objc_storeStrong((id *)&self->_removedObjects, 0);
  objc_storeStrong((id *)&self->_addedObjects, 0);
}

void __57__HMObjectMergeCollection_mergeCommonObjectsNoMergeCount__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "oldObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updatedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mergeFromNewObjectNoMergeCount:", v3);
}

void __45__HMObjectMergeCollection_mergeCommonObjects__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "oldObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "mergeFromNewObject:", v4);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentUpdatedObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oldObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

uint64_t __39__HMObjectMergeCollection_finalObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "oldObject");
}

void __83__HMObjectMergeCollection_initWithCurrentObjects_newObjects_commonObjectPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMObjectMergePair *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__HMObjectMergeCollection_initWithCurrentObjects_newObjects_commonObjectPredicate___block_invoke_2;
  v9[3] = &unk_1E3AAEA10;
  v11 = *(id *)(a1 + 56);
  v8 = v3;
  v10 = v8;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v7 = -[HMObjectMergePair initWithOldObject:updatedObject:]([HMObjectMergePair alloc], "initWithOldObject:updatedObject:", v5, v8);
    objc_msgSend(v6, "addObject:", v7);

    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  }

}

uint64_t __83__HMObjectMergeCollection_initWithCurrentObjects_newObjects_commonObjectPredicate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

uint64_t __61__HMObjectMergeCollection_initWithCurrentObjects_newObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6);
  return v7;
}

@end
