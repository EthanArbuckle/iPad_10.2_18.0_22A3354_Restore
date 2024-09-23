@implementation NSMutableArray

uint64_t __102__NSMutableArray_EmailFoundationAdditions__ef_insertObject_usingSortFunction_context_allowDuplicates___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(a2, a3, *(_QWORD *)(a1 + 40));
}

uint64_t __81__NSMutableArray_EmailFoundationAdditions__ef_insertObject_usingSortDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v7);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "compareObject:toObject:", v5, v6, (_QWORD)v15);
      v12 = v11;
      if (v11 == -1 || v11 == 1)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v12 = 0;
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __86__NSMutableArray_EmailFoundationAdditions__ef_removeObject_usingSortFunction_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(a2, a3, *(_QWORD *)(a1 + 40));
}

@end
