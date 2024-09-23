@implementation AVTEvaluateNameMatchingRules

void __AVTEvaluateNameMatchingRules_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_30;
  if (*(_BYTE *)(a1 + 56))
  {
    if ((objc_msgSend(v4, "containsString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      goto LABEL_30;
  }
  else if (*(_BYTE *)(a1 + 57))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
LABEL_8:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "containsString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10)) & 1) != 0)
          goto LABEL_29;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          if (v8)
            goto LABEL_8;
          break;
        }
      }
    }

  }
  if (!*(_BYTE *)(a1 + 58))
  {
    if (!*(_BYTE *)(a1 + 59))
      goto LABEL_30;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = *(id *)(a1 + 40);
    v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v6);
          if (objc_msgSend(v5, "containsString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
            goto LABEL_29;
          }
        }
        v12 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
  if (objc_msgSend(v5, "containsString:", *(_QWORD *)(a1 + 40)))
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_30:

}

@end
