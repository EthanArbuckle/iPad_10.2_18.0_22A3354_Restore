@implementation NSArray

uint64_t __47__NSArray__FPComparatorAddition__fp_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "compareObject:toObject:", v5, v6, (_QWORD)v15);
        if (v12)
        {
          v13 = v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

void __45__NSArray__FPSpotlightQueryHelpers___fp_map___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __49__NSArray_FPFrameworkAdditions__fp_mapWithIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1A1B00664]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  objc_autoreleasePoolPop(v3);
}

uint64_t __40__NSArray_FPFrameworkAdditions__fp_map___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__NSArray_FPFrameworkAdditions__fp_sortDescriptorByDisplayName__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_displayName);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortDescriptorWithKey:ascending:selector:", v1, 1, sel_localizedCaseInsensitiveCompare_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v3 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_itemIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)fp_sortDescriptorByDisplayName_sortDescriptors;
  fp_sortDescriptorByDisplayName_sortDescriptors = v6;

}

void __64__NSArray_FPFrameworkAdditions__fp_sortDescriptorByLastUsedDate__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_lastUsedDate);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortDescriptorWithKey:ascending:", v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_displayName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:selector:", v4, 1, sel_localizedCaseInsensitiveCompare_, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v6 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_itemIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)fp_sortDescriptorByLastUsedDate_sortDescriptors;
  fp_sortDescriptorByLastUsedDate_sortDescriptors = v9;

}

void __74__NSArray_FPFrameworkAdditions__fp_sortDescriptorByModifiedDateDescending__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_contentModificationDate);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortDescriptorWithKey:ascending:", v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_displayName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:selector:", v4, 1, sel_localizedCaseInsensitiveCompare_, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v6 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_itemIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)fp_sortDescriptorByModifiedDateDescending_sortDescriptors;
  fp_sortDescriptorByModifiedDateDescending_sortDescriptors = v9;

}

void __64__NSArray_FPFrameworkAdditions__fp_sortDescriptorByDocumentSize__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_documentSize);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sortDescriptorWithKey:ascending:", v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_displayName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:selector:", v4, 1, sel_localizedCaseInsensitiveCompare_, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v6 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_itemIdentifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortDescriptorWithKey:ascending:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)fp_sortDescriptorByDocumentSize_sortDescriptors;
  fp_sortDescriptorByDocumentSize_sortDescriptors = v9;

}

void __47__NSArray_FPFrameworkAdditions__fp_categorize___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)MEMORY[0x1A1B00664]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);
    }
    objc_msgSend(v5, "addObject:", v6);

  }
  objc_autoreleasePoolPop(v3);

}

void __68__NSArray_FPFrameworkAdditions__fp_removingObjectsNotKindOfClasses___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  char *v6;
  uint64_t v7;
  char *i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1B00664]();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v6 = (char *)v3;
          goto LABEL_11;
        }
      }
      v6 = (char *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "fp_removingObjectsNotKindOfClasses:", *(_QWORD *)(a1 + 32), v10);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (char *)v9;
  }
  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  objc_autoreleasePoolPop(v4);
}

uint64_t __39__NSArray_FPAction__fp_itemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemIdentifier");
}

uint64_t __31__NSArray_FPAction__fp_itemIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "itemID");
}

void __48__NSArray__FPSpotlightQueryHelpers___fp_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __66__NSArray__FPSpotlightQueryHelpers___fp_componentsWrappedInQuotes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), a2);
}

@end
