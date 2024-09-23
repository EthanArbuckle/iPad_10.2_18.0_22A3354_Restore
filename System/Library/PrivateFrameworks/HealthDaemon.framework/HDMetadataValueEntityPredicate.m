@implementation HDMetadataValueEntityPredicate

+ (id)predicateWithMetadataKey:(id)a3 allowedValues:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  HKMetadataAliasesForKey();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0x1E0C99000uLL;
  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:allowedValues:]((uint64_t)a1, v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:allowedValues:]((uint64_t)a1, v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v19);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v30;
    v9 = 0x1E0C99000;
  }
  else
  {
    v20 = 0;
  }
  HKMetadataAliasRangesForKey();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "count"))
  {
    if (v20)
    {
      v25 = 0;
LABEL_18:
      v28 = v20;
      goto LABEL_19;
    }
LABEL_22:
    +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:allowedValues:]((uint64_t)a1, v6, v7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v22 = objc_alloc_init(*(Class *)(v9 + 3560));
  +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:allowedValues:]((uint64_t)a1, v6, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v23);

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __73__HDMetadataValueEntityPredicate_predicateWithMetadataKey_allowedValues___block_invoke;
  v31[3] = &unk_1E6CF7878;
  v32 = v22;
  v33 = a1;
  v24 = v22;
  objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v31);
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20 || !v25)
  {
    if (v20)
      goto LABEL_18;
    if (v25)
      goto LABEL_20;
    goto LABEL_22;
  }
  v26 = (void *)MEMORY[0x1E0D29840];
  v38[0] = v20;
  v38[1] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "predicateMatchingAnyPredicates:", v27);
  v28 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
  v25 = v28;
LABEL_20:

  return v25;
}

+ (_QWORD)_predicateWithMetadataKey:(void *)a3 allowedValues:
{
  id v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_alloc_init((Class)objc_opt_class());
  HDMetadataKeyPredicateForKey((uint64_t)v5);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v6[1];
  v6[1] = v7;

  -[HDMetadataValueEntityPredicate _valuePredicateForValue:operatorType:]((uint64_t)v6, v4, 10);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v6[2];
  v6[2] = v9;

  *((_BYTE *)v6 + 24) = 0;
  return v6;
}

void __73__HDMetadataValueEntityPredicate_predicateWithMetadataKey_allowedValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
        v11 = *(void **)(a1 + 32);
        +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:valuesWithinRange:](*(_QWORD *)(a1 + 40), v5, *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

+ (id)_predicateWithMetadataKey:(void *)a3 valuesWithinRange:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  objc_msgSend(v4, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v6, v5, v7, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "maxValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v6, v5, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D29840];
  v15[0] = v8;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateMatchingAllPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)predicateWithMetadataKey:(id)a3 value:(id)a4 operatorType:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  BOOL v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = objc_claimAutoreleasedReturnValue();
  HKMetadataAliasesForKey();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v10;
  v47 = v8;
  v49 = v11;
  v50 = v9;
  if (objc_msgSend(v11, "count"))
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v8, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v14 = v11;
    v52 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v52)
    {
      v15 = *(_QWORD *)v59;
      v48 = v14;
      v51 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v59 != v15)
            objc_enumerationMutation(v14);
          v17 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", v17, v46);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");
          v53 = v18;
          if (v9 || v19)
          {
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v20 = v18;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
            if (v21)
            {
              v22 = v21;
              v23 = *(_QWORD *)v55;
              do
              {
                for (j = 0; j != v22; ++j)
                {
                  if (*(_QWORD *)v55 != v23)
                    objc_enumerationMutation(v20);
                  +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v17, *(void **)(*((_QWORD *)&v54 + 1) + 8 * j), a5);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "addObject:", v25);

                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
              }
              while (v22);
              v11 = v49;
              v9 = v50;
              v14 = v48;
            }
            v15 = v51;
          }
          else
          {
            +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v17, 0, a5);
            v20 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v20);
          }

        }
        v52 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
      }
      while (v52);
    }

    if (v9 && a5 == 5)
    {
      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v12);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v12, v46);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v27 = (void *)v26;

    v8 = v47;
  }
  else
  {
    v27 = 0;
  }
  HKMetadataAliasRangesForKey();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v28, "count"))
  {
    if (v27)
    {
      v33 = 0;
LABEL_51:
      v43 = v27;

      v33 = v43;
      goto LABEL_56;
    }
LABEL_55:
    +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v47, v9, a5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_56;
  }
  v29 = v28;
  v30 = objc_opt_self();
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __84__HDMetadataValueEntityPredicate__predicateWithMetadataKeyAliasRanges_operatorType___block_invoke;
  v62[3] = &unk_1E6CF78A0;
  v63 = v31;
  v64 = a5;
  v65 = v30;
  v66 = sel__predicateWithMetadataKeyAliasRanges_operatorType_;
  v32 = v31;
  objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v62);

  if (a5 == 5)
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v32);
  else
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:]((uint64_t)a1, v8, v9, a5);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v9)
    v37 = a5 == 5;
  else
    v37 = 0;
  v38 = v37;
  v39 = (void *)MEMORY[0x1E0D29840];
  if (v37)
  {
    v70[0] = v34;
    v70[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "predicateMatchingAllPredicates:", v40);
  }
  else
  {
    v69[0] = v34;
    v69[1] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "predicateMatchingAnyPredicates:", v40);
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27 || !v33)
  {
    v9 = v50;
    if (v27)
    {
      v11 = v49;
      goto LABEL_51;
    }
    v11 = v49;
    if (v33)
      goto LABEL_56;
    goto LABEL_55;
  }
  v41 = (void *)MEMORY[0x1E0D29840];
  v9 = v50;
  if (v38)
  {
    v68[0] = v27;
    v68[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "predicateMatchingAllPredicates:", v42);
  }
  else
  {
    v67[0] = v27;
    v67[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "predicateMatchingAnyPredicates:", v42);
  }
  v44 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v44;
  v11 = v49;
LABEL_56:

  return v33;
}

+ (_QWORD)_predicateWithMetadataKey:(void *)a3 value:(uint64_t)a4 operatorType:
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  char v14;

  v6 = a3;
  v7 = a2;
  objc_opt_self();
  v8 = objc_alloc_init((Class)objc_opt_class());
  HDMetadataKeyPredicateForKey((uint64_t)v7);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v8[1];
  v8[1] = v9;

  -[HDMetadataValueEntityPredicate _valuePredicateForValue:operatorType:]((uint64_t)v8, v6, a4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v8[2];
  v8[2] = v11;

  if (v6)
    v13 = a4 == 5;
  else
    v13 = 0;
  v14 = v13;
  *((_BYTE *)v8 + 24) = v14;
  return v8;
}

void __84__HDMetadataValueEntityPredicate__predicateWithMetadataKeyAliasRanges_operatorType___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[2];
  _BYTE v42[128];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    v35 = v5;
    v36 = *(_QWORD *)v38;
    v32 = v6;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        switch(a1[5])
        {
          case 0:
          case 3:
            v12 = (void *)a1[4];
            v13 = a1[6];
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v10), "minValue");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          case 1:
          case 2:
            v12 = (void *)a1[4];
            v13 = a1[6];
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v10), "maxValue");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
            v15 = v14;
            +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v13, v5, v14, a1[5]);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v16);

            break;
          case 4:
            v29 = (void *)a1[4];
            +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:valuesWithinRange:](a1[6], v5, *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            v9 = v36;
            objc_msgSend(v30, "addObject:", v15);
            break;
          case 5:
            v33 = (void *)MEMORY[0x1E0D29840];
            v34 = (void *)a1[4];
            +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:exists:](a1[6], v5, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = v15;
            v17 = v11;
            v18 = v35;
            v19 = objc_opt_self();
            objc_msgSend(v17, "minValue");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v19, v18, v20, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v17, "maxValue");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:value:operatorType:](v19, v18, v22, 3);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v36;
            v24 = (void *)MEMORY[0x1E0D29840];
            v43[0] = v21;
            v43[1] = v23;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "predicateMatchingAnyPredicates:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v41[1] = v26;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "predicateMatchingAnyPredicates:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v28);

            v5 = v35;
            v6 = v32;

            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a1[7], a1[6], CFSTR("HDMetadataValueEntity.m"), 455, CFSTR("Unsupported operator type for aliased value range"));
            break;
        }

        ++v10;
      }
      while (v8 != v10);
      v31 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      v8 = v31;
    }
    while (v31);
  }

}

+ (_QWORD)_predicateWithMetadataKey:(char)a3 exists:
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a2;
  objc_opt_self();
  v5 = objc_alloc_init((Class)objc_opt_class());
  HDMetadataKeyPredicateForKey((uint64_t)v4);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = (void *)v5[2];
  v5[2] = 0;

  *((_BYTE *)v5 + 24) = a3 ^ 1;
  return v5;
}

+ (id)predicateWithMetadataKey:(id)a3 exists:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HKMetadataAliasesForKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HKMetadataAliasRangesForKey();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count"))
  {
    v24 = v10;
    v25 = v8;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:exists:]((uint64_t)a1, v6, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = v13;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:exists:]((uint64_t)a1, *(void **)(*((_QWORD *)&v26 + 1) + 8 * i), a4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    if (a4)
      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v14);
    else
      objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v24;
    v8 = v25;

  }
  else
  {
    +[HDMetadataValueEntityPredicate _predicateWithMetadataKey:exists:]((uint64_t)a1, v6, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)_valuePredicateForValue:(uint64_t)a3 operatorType:
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    if (a3 == 10)
    {
      HDPredicateForMetadataValues(v5);
    }
    else
    {
      v7 = HDSQLiteComparisonTypeForPredicateOperator();
      HDPredicateForMetadataValue(v6, v7);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDSQLitePredicate *valuePredicate;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v18;
  uint64_t v19;

  v4 = (void *)-[objc_class entityClassForEnumeration](a3, "entityClassForEnumeration");
  v5 = *MEMORY[0x1E0D29618];
  objc_msgSend(v4, "disambiguatedSQLForProperty:", *MEMORY[0x1E0D29618]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDMetadataValueEntity, "disambiguatedSQLForProperty:", CFSTR("object_id"));
  v19 = objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMetadataValueEntity, "disambiguatedDatabaseTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDMetadataKeyEntity, "disambiguatedDatabaseTable");
  v18 = objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDMetadataValueEntity, "disambiguatedSQLForProperty:", CFSTR("key_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDMetadataKeyEntity, "disambiguatedSQLForProperty:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSQLitePredicate SQLForEntityClass:](self->_keyPredicate, "SQLForEntityClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("("));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  valuePredicate = self->_valuePredicate;
  if (valuePredicate)
  {
    -[HDSQLitePredicate SQLForEntityClass:](valuePredicate, "SQLForEntityClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("EXISTS (SELECT 1 FROM %@ INNER JOIN %@ ON %@=%@ WHERE ((%@=%@) AND %@ AND (%@)))"), v7, v18, v8, v9, v6, v19, v10, v13);

    if (self->_matchObjectsWithoutKey)
      objc_msgSend(v11, "appendString:", CFSTR(" OR "));
    if (self->_valuePredicate)
    {
      v14 = (void *)v19;
      v15 = (void *)v18;
      if (!self->_matchObjectsWithoutKey)
        goto LABEL_13;
    }
    else
    {
      v14 = (void *)v19;
      v15 = (void *)v18;
    }
  }
  else
  {
    v15 = (void *)v18;
    v14 = (void *)v19;
  }
  if (self->_matchObjectsWithoutKey)
    v16 = CFSTR("NOT EXISTS");
  else
    v16 = CFSTR("EXISTS");
  objc_msgSend(v11, "appendFormat:", CFSTR("%@ (SELECT 1 FROM %@ INNER JOIN %@ ON %@=%@ WHERE ((%@=%@) AND %@))"), v16, v7, v15, v8, v9, v6, v14, v10);
LABEL_13:
  objc_msgSend(v11, "appendString:", CFSTR(")"));

  return v11;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  HDSQLitePredicate *valuePredicate;

  -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_keyPredicate, "bindToStatement:bindingIndex:");
  valuePredicate = self->_valuePredicate;
  if (valuePredicate)
  {
    -[HDSQLitePredicate bindToStatement:bindingIndex:](valuePredicate, "bindToStatement:bindingIndex:", a3, a4);
    if (self->_matchObjectsWithoutKey)
      -[HDSQLitePredicate bindToStatement:bindingIndex:](self->_keyPredicate, "bindToStatement:bindingIndex:", a3, a4);
  }
}

- (NSString)description
{
  HDSQLitePredicate *valuePredicate;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  valuePredicate = self->_valuePredicate;
  if (!valuePredicate)
  {
    if (self->_matchObjectsWithoutKey)
      v7 = CFSTR("does not exist");
    else
      v7 = CFSTR("exists");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(key %@)"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (!self->_matchObjectsWithoutKey)
  {
    -[HDSQLitePredicate description](valuePredicate, "description");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (void *)v8;
    goto LABEL_10;
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HDSQLitePredicate description](valuePredicate, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(key does not exist OR %@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[HDSQLitePredicate description](self->_keyPredicate, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<metadata: %@ AND %@>"), v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuePredicate, 0);
  objc_storeStrong((id *)&self->_keyPredicate, 0);
}

@end
