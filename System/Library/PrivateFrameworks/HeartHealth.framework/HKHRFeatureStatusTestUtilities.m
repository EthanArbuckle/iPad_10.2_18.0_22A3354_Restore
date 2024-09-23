@implementation HKHRFeatureStatusTestUtilities

+ (id)evaluationWithRequirementIdentifiers:(id)a3 unsatisfiedRequirementIdentifiers:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v12 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v6, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = v6;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v28;
      v18 = MEMORY[0x1E0C9AAA0];
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v7, "objectForKeyedSubscript:", v20, (_QWORD)v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v16);
    }

  }
  v22 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(v7, "allKeys", (_QWORD)v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "orderedSetWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6700]), "initWithRequirementIdentifiersOrderedByPriority:satisfactionByRequirementIdentifier:", v24, v7);
  return v25;
}

@end
