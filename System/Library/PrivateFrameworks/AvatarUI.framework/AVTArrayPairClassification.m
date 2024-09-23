@implementation AVTArrayPairClassification

+ (id)countPairTypesInArray:(id)a3 withClassifier:(id)a4
{
  id v5;
  void (**v6)(id, void *, void *);
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = (void (**)(id, void *, void *))a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 1)
    {
      v8 = 0;
      do
      {
        v9 = v8++;
        if (v8 < objc_msgSend(v5, "count"))
        {
          v10 = v8;
          do
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v11, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue") + 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v13);
            ++v10;
          }
          while (v10 < objc_msgSend(v5, "count"));
        }
      }
      while (v8 < objc_msgSend(v5, "count") - 1);
    }
    v17 = (void *)objc_msgSend(v7, "copy");

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v17;
}

+ (id)clustersForObjectsInArray:(id)a3 withClassifier:(id)a4 likenessThreshold:(id)a5 likenessComparator:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v28 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __108__AVTArrayPairClassification_clustersForObjectsInArray_withClassifier_likenessThreshold_likenessComparator___block_invoke;
        v29[3] = &unk_1EA51E2E0;
        v31 = v28;
        v29[4] = v17;
        v32 = v11;
        v30 = v10;
        objc_msgSend(v12, "keysOfEntriesPassingTest:", v29);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "anyObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
          v20 = v19;
        else
          v20 = v17;
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = v20;
        objc_msgSend(v12, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v23, "integerValue") + 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, v22);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v14);
  }

  objc_msgSend(v12, "allValues");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

BOOL __108__AVTArrayPairClassification_clustersForObjectsInArray_withClassifier_likenessThreshold_likenessComparator___block_invoke(uint64_t a1)
{
  void *v2;
  _BOOL8 v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() != 1;

  return v3;
}

@end
