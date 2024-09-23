@implementation INLocalizedFormatStringFromSlotComposing

id __INLocalizedFormatStringFromSlotComposing_block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v6, "_intents_isInteger") & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        if (!objc_msgSend(v6, "_intents_isDouble"))
          goto LABEL_23;
        v7 = 2;
      }
      *a3 = v7;
      goto LABEL_23;
    }
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "intentSlotDescriptions", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v9)
    goto LABEL_13;
  v10 = v9;
  v11 = *(_QWORD *)v21;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
      objc_msgSend(v13, "facadePropertyName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v5);

      if (v15)
      {
        objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v13, "valueType");
        if (v17 == 24)
        {
          v18 = 0;
        }
        else
        {
          v6 = 0;
          if (v17 != 21)
          {
LABEL_22:

            goto LABEL_23;
          }
          v18 = 2;
        }
        *a3 = v18;
        v6 = v16;
        goto LABEL_22;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
      continue;
    break;
  }
LABEL_13:

  v6 = 0;
LABEL_23:

  return v6;
}

@end
