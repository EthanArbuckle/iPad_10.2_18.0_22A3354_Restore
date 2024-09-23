@implementation HKMedicationsTokenConceptResolver

- (HKMedicationsTokenConceptResolver)initWithAssetInterface:(id)a3
{
  id v4;
  HKMedicationsTokenConceptResolver *v5;
  HKMedicationsTokenConceptResolver *v6;
  HKMedicationsTokenizer *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationsTokenConceptResolver;
  v5 = -[HKMedicationsTokenConceptResolver init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[HKMedicationsTokenConceptResolver setAssetInterface:](v5, "setAssetInterface:", v4);
    v7 = objc_alloc_init(HKMedicationsTokenizer);
    -[HKMedicationsTokenConceptResolver setTokenizer:](v6, "setTokenizer:", v7);

  }
  return v6;
}

- (id)recognizedMedicationsFromTextBlock:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "getTranscript");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMedicationsTokenConceptResolver recognizedMedicationsFromTranscript:](self, "recognizedMedicationsFromTranscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)recognizedMedicationsFromTranscript:(id)a3
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

  v4 = a3;
  v5 = (void *)MEMORY[0x2276839E4]();
  if (objc_msgSend(v4, "length"))
  {
    -[HKMedicationsTokenConceptResolver tokenizer](self, "tokenizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wordsFromTranscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKMedicationsTokenConceptResolver _collectAllMedicationCandidatesUsingTokens:](self, "_collectAllMedicationCandidatesUsingTokens:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsTokenConceptResolver _expandedMedicationsFromCandidates:](self, "_expandedMedicationsFromCandidates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsTokenConceptResolver removeMedicationsFromNoisyTokensUsingTokens:candidates:](self, "removeMedicationsFromNoisyTokensUsingTokens:candidates:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsTokenConceptResolver removeStowawayIngredientsUsingTokens:candidates:](self, "removeStowawayIngredientsUsingTokens:candidates:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsTokenConceptResolver rankMedicationsUsingTokens:candidates:](self, "rankMedicationsUsingTokens:candidates:", v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_autoreleasePoolPop(v5);

  return v13;
}

- (id)_collectAllMedicationCandidatesUsingTokens:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *context;
  id v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  HKMedicationsTokenConceptResolver *v27;
  __int16 v28;
  id v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  context = (void *)MEMORY[0x2276839E4]();
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v10 = objc_alloc(MEMORY[0x24BDBCF20]);
        -[HKMedicationsTokenConceptResolver assetInterface](self, "assetInterface");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        objc_msgSend(v11, "genericMedicationsFromTokens:error:", v12, &v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v21;
        v15 = (void *)objc_msgSend(v10, "initWithArray:", v13);

        if (v14)
        {
          _HKInitializeLogging();
          HKLogMedication();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v27 = self;
            v28 = 2114;
            v29 = v14;
            _os_log_error_impl(&dword_223139000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Error searching generic medication: %{public}@", buf, 0x16u);
          }

        }
        else if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v9);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v6);
  }

  objc_autoreleasePoolPop(context);
  return v19;
}

- (id)_expandedMedicationsFromCandidates:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *context;
  id obj;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  HKMedicationsTokenConceptResolver *v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  context = (void *)MEMORY[0x2276839E4]();
  v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = v4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v24)
  {
    v21 = *(_QWORD *)v33;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v5);
        v26 = v5;
        objc_msgSend(v23, "objectForKeyedSubscript:", context);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v29;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v29 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v12);
              -[HKMedicationsTokenConceptResolver assetInterface](self, "assetInterface");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = 0;
              objc_msgSend(v14, "expandedGenericMedicationSearchResult:error:", v13, &v27);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v27;

              if (v16)
              {
                _HKInitializeLogging();
                HKLogMedication();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v37 = self;
                  v38 = 2112;
                  v39 = v16;
                  _os_log_error_impl(&dword_223139000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Error expanding generic medication: %@{public}@", buf, 0x16u);
                }

              }
              else
              {
                objc_msgSend(v7, "addObject:", v15);
              }

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
          }
          while (v10);
        }

        objc_msgSend(v22, "setObject:forKeyedSubscript:", v7, v25);
        v5 = v26 + 1;
      }
      while (v26 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v24);
  }

  objc_autoreleasePoolPop(context);
  return v22;
}

- (id)removeMedicationsFromNoisyTokensUsingTokens:(id)a3 candidates:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t m;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *context;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id obj;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v41 = a4;
  context = (void *)MEMORY[0x2276839E4]();
  v40 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v5;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v67;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v67 != v37)
          objc_enumerationMutation(obj);
        v39 = v6;
        objc_msgSend(v41, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * v6), context);
        v43 = (id)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
          if (v46)
          {
            v45 = *(_QWORD *)v63;
            do
            {
              for (i = 0; i != v46; ++i)
              {
                if (*(_QWORD *)v63 != v45)
                  objc_enumerationMutation(v43);
                v8 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                v58 = 0u;
                v59 = 0u;
                v60 = 0u;
                v61 = 0u;
                objc_msgSend(v8, "ingredients");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
                if (v11)
                {
                  v12 = v11;
                  v44 = v8;
                  v47 = i;
                  v48 = v10;
                  v13 = *(_QWORD *)v59;
                  v14 = 0.0;
                  do
                  {
                    for (j = 0; j != v12; ++j)
                    {
                      if (*(_QWORD *)v59 != v13)
                        objc_enumerationMutation(v48);
                      objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * j), "ingredientName");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      -[HKMedicationsTokenConceptResolver tokenizer](self, "tokenizer");
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v17, "wordsFromTranscript:", v16);
                      v18 = (void *)objc_claimAutoreleasedReturnValue();

                      v56 = 0u;
                      v57 = 0u;
                      v54 = 0u;
                      v55 = 0u;
                      v19 = v18;
                      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
                      if (v20)
                      {
                        v21 = v20;
                        v22 = *(_QWORD *)v55;
                        do
                        {
                          for (k = 0; k != v21; ++k)
                          {
                            if (*(_QWORD *)v55 != v22)
                              objc_enumerationMutation(v19);
                            v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
                            objc_msgSend(v9, "addObject:", v24);
                            v14 = v14 + (double)(unint64_t)objc_msgSend(v24, "length");
                          }
                          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
                        }
                        while (v21);
                      }

                    }
                    v12 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
                  }
                  while (v12);

                  i = v47;
                  if (v14 > 0.0)
                  {
                    objc_msgSend(v9, "intersectSet:", obj);
                    v52 = 0u;
                    v53 = 0u;
                    v50 = 0u;
                    v51 = 0u;
                    v25 = v9;
                    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
                    if (v26)
                    {
                      v27 = v26;
                      v28 = *(_QWORD *)v51;
                      v29 = 0.0;
                      do
                      {
                        for (m = 0; m != v27; ++m)
                        {
                          if (*(_QWORD *)v51 != v28)
                            objc_enumerationMutation(v25);
                          v29 = v29
                              + (double)(unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * m), "length");
                        }
                        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
                      }
                      while (v27);
                    }
                    else
                    {
                      v29 = 0.0;
                    }

                    v31 = objc_msgSend(v25, "count");
                    if (v29 / v14 >= 0.5)
                    {
                      v32 = v31;
                      objc_msgSend(v41, "allKeys", v29 / v14);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = objc_msgSend(v33, "count");

                      if (v32 == v34)
                        objc_msgSend(v40, "addObject:", v44);
                    }
                  }
                }
                else
                {

                }
              }
              v46 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
            }
            while (v46);
          }
        }

        v6 = v39 + 1;
      }
      while (v39 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    }
    while (v38);
  }

  objc_autoreleasePoolPop(context);
  return v40;
}

- (id)removeStowawayIngredientsUsingTokens:(id)a3 candidates:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  uint64_t j;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t k;
  uint64_t v18;
  void *v19;
  void *context;
  id obj;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v29 = a3;
  v5 = a4;
  context = (void *)MEMORY[0x2276839E4]();
  v23 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v41 != v24)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v7, "ingredients");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (!v31)
        {

LABEL_25:
          objc_msgSend(v23, "addObject:", v7);
          continue;
        }
        v26 = v7;
        v27 = i;
        v9 = 0;
        v30 = *(_QWORD *)v37;
        v28 = v8;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v37 != v30)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "ingredientName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0u;
            v33 = 0u;
            v34 = 0u;
            v35 = 0u;
            v12 = v29;
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
            if (v13)
            {
              v14 = v13;
              v15 = 0;
              v16 = *(_QWORD *)v33;
              do
              {
                for (k = 0; k != v14; ++k)
                {
                  if (*(_QWORD *)v33 != v16)
                    objc_enumerationMutation(v12);
                  v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k);
                  objc_msgSend(v11, "lowercaseString");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v18) = objc_msgSend(v19, "containsString:", v18);

                  v15 |= v18;
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
              }
              while (v14);

              v9 |= v15 ^ 1;
            }
            else
            {

              v9 = 1;
            }

          }
          v31 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        }
        while (v31);

        v7 = v26;
        i = v27;
        if ((v9 & 1) == 0)
          goto LABEL_25;
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v25);
  }

  objc_autoreleasePoolPop(context);
  return v23;
}

- (id)rankMedicationsUsingTokens:(id)a3 candidates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *, void *);
  void *v18;
  HKMedicationsTokenConceptResolver *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x2276839E4]();
  objc_msgSend(v7, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __75__HKMedicationsTokenConceptResolver_rankMedicationsUsingTokens_candidates___block_invoke;
  v18 = &unk_24EC1A3A0;
  v19 = self;
  v10 = v6;
  v20 = v10;
  objc_msgSend(v9, "sortedArrayUsingComparator:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x24BDBCF00]);
  v13 = (void *)objc_msgSend(v12, "initWithArray:", v11, v15, v16, v17, v18, v19);

  objc_autoreleasePoolPop(v8);
  return v13;
}

uint64_t __75__HKMedicationsTokenConceptResolver_rankMedicationsUsingTokens_candidates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_tokenMatchScoreForMedication:usingTokens:", v5, *(_QWORD *)(a1 + 40));
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 32), "_tokenMatchScoreForMedication:usingTokens:", v6, *(_QWORD *)(a1 + 40));
  if (v8 <= v9)
  {
    if (v8 < v9)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "genericMedicationName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "genericMedicationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "caseInsensitiveCompare:", v12);

    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (double)_tokenMatchScoreForMedication:(id)a3 usingTokens:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *context;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x2276839E4]();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = v6;
  objc_msgSend(v6, "ingredients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v13);
        -[HKMedicationsTokenConceptResolver tokenizer](self, "tokenizer", context);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "ingredientName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "wordsFromTranscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unionSet:", v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  v18 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v18, "intersectSet:", v7);
  v19 = objc_msgSend(v18, "count");
  v20 = objc_msgSend(v8, "count");

  objc_autoreleasePoolPop(context);
  return (double)v19 / (double)v20;
}

- (HKMedicationsAssetInterface)assetInterface
{
  return self->_assetInterface;
}

- (void)setAssetInterface:(id)a3
{
  objc_storeStrong((id *)&self->_assetInterface, a3);
}

- (HKMedicationsTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_assetInterface, 0);
}

@end
