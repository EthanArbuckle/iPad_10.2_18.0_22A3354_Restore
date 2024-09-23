@implementation NSArray(FPFrameworkAdditions)

- (id)fp_mapWithIndex:()FPFrameworkAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__NSArray_FPFrameworkAdditions__fp_mapWithIndex___block_invoke;
  v11[3] = &unk_1E444C4B0;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

+ (id)fp_sortDescriptorByDisplayName
{
  if (fp_sortDescriptorByDisplayName_onceToken != -1)
    dispatch_once(&fp_sortDescriptorByDisplayName_onceToken, &__block_literal_global_18);
  return (id)fp_sortDescriptorByDisplayName_sortDescriptors;
}

- (id)fp_map:()FPFrameworkAdditions
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__NSArray_FPFrameworkAdditions__fp_map___block_invoke;
  v8[3] = &unk_1E444C4D8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "fp_mapWithIndex:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fp_filter:()FPFrameworkAdditions
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1A1B00664](v7);
        if (v4[2](v4, v11))
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v7;
    }
    while (v7);
  }

  return v5;
}

+ (id)fp_sortDescriptorByLastUsedDate
{
  if (fp_sortDescriptorByLastUsedDate_onceToken != -1)
    dispatch_once(&fp_sortDescriptorByLastUsedDate_onceToken, &__block_literal_global_9_0);
  return (id)fp_sortDescriptorByLastUsedDate_sortDescriptors;
}

+ (id)fp_sortDescriptorByModifiedDateDescending
{
  if (fp_sortDescriptorByModifiedDateDescending_onceToken != -1)
    dispatch_once(&fp_sortDescriptorByModifiedDateDescending_onceToken, &__block_literal_global_6_0);
  return (id)fp_sortDescriptorByModifiedDateDescending_sortDescriptors;
}

+ (id)fp_sortDescriptorByDocumentSize
{
  if (fp_sortDescriptorByDocumentSize_onceToken != -1)
    dispatch_once(&fp_sortDescriptorByDocumentSize_onceToken, &__block_literal_global_12_0);
  return (id)fp_sortDescriptorByDocumentSize_sortDescriptors;
}

- (id)fp_categorize:()FPFrameworkAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__NSArray_FPFrameworkAdditions__fp_categorize___block_invoke;
  v11[3] = &unk_1E444C4B0;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)fp_pickItemsFromArray:()FPFrameworkAdditions correspondingToIndexesOfItemsInArray:
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "count");
  if (v8 != objc_msgSend(v6, "count"))
  {
    v9 = objc_msgSend(a1, "count");
    if (v9 != objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+FPFrameworkAdditions.m"), 121, CFSTR("Count of pickable items must match count of own items"));

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v16 = objc_msgSend(a1, "indexOfObject:", v15);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+FPFrameworkAdditions.m"), 126, CFSTR("Object %@ not found"), v15);

        }
        objc_msgSend(v6, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  return v10;
}

- (id)fp_removingObjectsNotKindOfClasses:()FPFrameworkAdditions
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__NSArray_FPFrameworkAdditions__fp_removingObjectsNotKindOfClasses___block_invoke;
  v11[3] = &unk_1E444C500;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

@end
