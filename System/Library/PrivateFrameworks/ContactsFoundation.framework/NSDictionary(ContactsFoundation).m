@implementation NSDictionary(ContactsFoundation)

- (id)_cn_filter:()ContactsFoundation
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47__NSDictionary_ContactsFoundation___cn_filter___block_invoke;
  v13 = &unk_1E29B9C98;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (void)_cn_each:()ContactsFoundation
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__NSDictionary_ContactsFoundation___cn_each___block_invoke;
  v6[3] = &unk_1E29B9C48;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (id)_cn_keysAndValues
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__NSDictionary_ContactsFoundation___cn_keysAndValues__block_invoke;
  v6[3] = &unk_1E29B9C70;
  v6[4] = a1;
  objc_msgSend(v2, "_cn_map:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPair pairWithFirst:second:](CNPair, "pairWithFirst:second:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_cn_map:()ContactsFoundation
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__NSDictionary_ContactsFoundation___cn_map___block_invoke;
  v11[3] = &unk_1E29B9C98;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)_cn_mapKeys:()ContactsFoundation
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__NSDictionary_ContactsFoundation___cn_mapKeys___block_invoke;
  v11[3] = &unk_1E29B9C98;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)_cn_mapValues:()ContactsFoundation
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
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__NSDictionary_ContactsFoundation___cn_mapValues___block_invoke;
  v11[3] = &unk_1E29B9C98;
  v13 = v4;
  v6 = v5;
  v12 = v6;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v11);
  v8 = v12;
  v9 = v6;

  return v9;
}

- (id)_cn_diff:()ContactsFoundation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend(a1, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend(v4, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingSelector:", sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderedSetWithArray:", v11);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v8;
  objc_msgSend(v8, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  v42 = v15;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v54 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v43, "removeObject:", v20);
        objc_msgSend(v44, "removeObject:", v20);
        objc_msgSend(a1, "objectForKeyedSubscript:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v4;
        objc_msgSend(v4, "objectForKeyedSubscript:", v20);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v21 | v23 && (objc_msgSend((id)v21, "isEqual:", v23) & 1) == 0)
        {
          +[CNPair pairWithFirst:second:](CNPair, "pairWithFirst:second:", v21, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, v20);

          v15 = v42;
        }

        v4 = v22;
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v17);
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v25 = v43;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v50 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
        objc_msgSend(a1, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNPair pairWithFirst:second:](CNPair, "pairWithFirst:second:", v31, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v32, v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v27);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v33 = v44;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v4, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNPair pairWithFirst:second:](CNPair, "pairWithFirst:second:", 0, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v40, v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v35);
  }

  return v12;
}

- (id)_cn_objectForKey:()ContactsFoundation ofClass:
{
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a1, "objectForKey:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
    if (!v7)
      +[CNSimulatedCrashReporter simulateCrashWithMessage:](CNSimulatedCrashReporter, "simulateCrashWithMessage:", CFSTR("Expected class of %@ but was %@"), a4, objc_opt_class());
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
