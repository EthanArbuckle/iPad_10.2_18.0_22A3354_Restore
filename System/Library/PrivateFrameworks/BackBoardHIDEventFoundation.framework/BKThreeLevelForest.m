@implementation BKThreeLevelForest

- (void)addLeaf:(id)a3 toBranch:(id)a4 trunk:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *trunkToBranchDictionary;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  id v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  trunkToBranchDictionary = self->_trunkToBranchDictionary;
  if (!trunkToBranchDictionary)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = self->_trunkToBranchDictionary;
    self->_trunkToBranchDictionary = v11;

    trunkToBranchDictionary = self->_trunkToBranchDictionary;
  }
  -[NSMutableDictionary objectForKey:](trunkToBranchDictionary, "objectForKey:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKey:](self->_trunkToBranchDictionary, "setObject:forKey:", v13, v9);
  }
  objc_msgSend(v13, "bs_addObject:toCollectionClass:forKey:", v14, objc_opt_class(), v8);

}

- (id)leavesOnBranch:(id)a3 trunk:(id)a4
{
  NSMutableDictionary *trunkToBranchDictionary;
  id v6;
  void *v7;
  void *v8;

  trunkToBranchDictionary = self->_trunkToBranchDictionary;
  v6 = a3;
  -[NSMutableDictionary objectForKey:](trunkToBranchDictionary, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)removeTrunk:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_trunkToBranchDictionary, "removeObjectForKey:", a3);
}

- (void)enumerate:(id)a3
{
  id v4;
  NSMutableDictionary *trunkToBranchDictionary;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  trunkToBranchDictionary = self->_trunkToBranchDictionary;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__BKThreeLevelForest_enumerate___block_invoke;
  v7[3] = &unk_1E81F71F8;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](trunkToBranchDictionary, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)enumerateTrunk:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[NSMutableDictionary objectForKey:](self->_trunkToBranchDictionary, "objectForKey:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__BKThreeLevelForest_enumerateTrunk_block___block_invoke;
  v9[3] = &unk_1E81F7220;
  v10 = v6;
  v7 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (id)dictionaryContainingBranchesToLeaves
{
  id v3;
  NSMutableDictionary *trunkToBranchDictionary;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  trunkToBranchDictionary = self->_trunkToBranchDictionary;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__BKThreeLevelForest_dictionaryContainingBranchesToLeaves__block_invoke;
  v7[3] = &unk_1E81F7270;
  v5 = v3;
  v8 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](trunkToBranchDictionary, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trunkToBranchDictionary, 0);
}

void __58__BKThreeLevelForest_dictionaryContainingBranchesToLeaves__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__BKThreeLevelForest_dictionaryContainingBranchesToLeaves__block_invoke_2;
  v4[3] = &unk_1E81F7248;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __58__BKThreeLevelForest_dictionaryContainingBranchesToLeaves__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v7);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v7);
  }
  objc_msgSend(v6, "unionSet:", v5);

}

void __43__BKThreeLevelForest_enumerateTrunk_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __32__BKThreeLevelForest_enumerate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__BKThreeLevelForest_enumerate___block_invoke_2;
  v8[3] = &unk_1E81F71D0;
  v6 = *(id *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __32__BKThreeLevelForest_enumerate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

@end
