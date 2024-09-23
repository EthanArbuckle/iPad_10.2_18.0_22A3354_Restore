@implementation NSArray(Readable)

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v10 = a1;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v39;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v14), "_intents_readableTitleWithLocalizer:metadata:", v6, v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "length"))
          objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v12);
  }

  v16 = objc_msgSend(v9, "count");
  v17 = (void *)v16;
  if (v16)
  {
    if (v16 == 2)
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      INLocalizedStringWithLocalizer(CFSTR("%@ and %@ (two elements format)"), CFSTR("%@ and %@"), v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v19, "initWithFormat:locale:", v20, v8, v21, v22);
    }
    else
    {
      v18 = v16 - 1;
      if (v16 == 1)
      {
        objc_msgSend(v9, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      INLocalizedStringWithLocalizer(CFSTR("%@, %@ (three or more start format)"), CFSTR("%@, %@"), v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v24, "initWithFormat:locale:", v25, v8, v26, v27);

      if (v18 < 3)
      {
        v22 = v28;
      }
      else
      {
        v29 = 3;
        v37 = v17;
        do
        {
          v30 = v8;
          v31 = objc_alloc(MEMORY[0x1E0CB3940]);
          INLocalizedStringWithLocalizer(CFSTR("%@, %@ (three or more middle format)"), CFSTR("%@, %@"), v6);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndex:", v29 - 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v31;
          v8 = v30;
          v22 = (void *)objc_msgSend(v34, "initWithFormat:locale:", v32, v30, v28, v33);

          ++v29;
          v28 = v22;
        }
        while (v37 != (void *)v29);
      }
      v35 = objc_alloc(MEMORY[0x1E0CB3940]);
      INLocalizedStringWithLocalizer(CFSTR("%@ and %@ (three or more end format)"), CFSTR("%@ and %@"), v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v35, "initWithFormat:locale:", v20, v8, v22, v21);
    }
    v17 = (void *)v23;

  }
LABEL_22:

  return v17;
}

- (id)_intents_localizedCopyWithLocalizer:()Readable
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a1;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "_intents_localizedCopyWithLocalizer:", v4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

@end
