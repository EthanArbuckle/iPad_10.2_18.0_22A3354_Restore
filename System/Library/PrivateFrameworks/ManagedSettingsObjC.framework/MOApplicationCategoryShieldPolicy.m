@implementation MOApplicationCategoryShieldPolicy

- (id)persistableValue
{
  int64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
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
  const __CFString *v44;
  void *v45;
  _BYTE v46[128];
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = -[MOCategoryShieldPolicy policy](self, "policy");
  if (v3 == 2)
  {
    v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[MOCategoryShieldPolicy excludedContent](self, "excludedContent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[MOCategoryShieldPolicy excludedContent](self, "excludedContent", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v33;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v33 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v29), "persistableValue");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v30);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
      }
      while (v27);
    }

    v44 = CFSTR("activities");
    v45 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 1)
    {
      v22 = (void *)MEMORY[0x1E0C9AA70];
      return v22;
    }
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[MOCategoryShieldPolicy specificCategories](self, "specificCategories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[MOCategoryShieldPolicy specificCategories](self, "specificCategories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v11), "persistableValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      }
      while (v9);
    }

    v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[MOCategoryShieldPolicy excludedContent](self, "excludedContent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[MOCategoryShieldPolicy excludedContent](self, "excludedContent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v37;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v37 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v20), "persistableValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      }
      while (v18);
    }

    v47[0] = CFSTR("categories");
    v47[1] = CFSTR("activities");
    v48[0] = v6;
    v48[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

+ (id)initializeWithPersistableValue:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = 0x1E675D000uLL;
  if (+[MOApplicationCategoryShieldPolicy isValidPersistableRepresentation:](MOApplicationCategoryShieldPolicy, "isValidPersistableRepresentation:", v3))
  {
    v5 = v3;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("categories"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0x1E0C99000uLL;
    if (v6)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
      if (v8)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v9 = v6;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v35 != v12)
                objc_enumerationMutation(v9);
              +[MOCategory initializeWithPersistableValue:](MOCategory, "initializeWithPersistableValue:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v14);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          }
          while (v11);
        }

        v15 = 1;
        v4 = 0x1E675D000;
        v7 = 0x1E0C99000;
LABEL_15:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("activities"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)objc_msgSend(objc_alloc(*(Class *)(v7 + 3560)), "initWithCapacity:", objc_msgSend(v17, "count"));
          if (v18)
          {
            v27 = v15;
            v28 = v6;
            v29 = v5;
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v19 = v17;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v31;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v31 != v22)
                    objc_enumerationMutation(v19);
                  +[MOApplication initializeWithPersistableValue:](MOApplication, "initializeWithPersistableValue:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "addObject:", v24);

                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
              }
              while (v21);
            }

            v6 = v28;
            v5 = v29;
            v4 = 0x1E675D000;
            v25 = v27;
            goto LABEL_27;
          }
        }
        else
        {
          v18 = 0;
        }
        v25 = 0;
LABEL_27:
        v16 = (void *)objc_msgSend(objc_alloc(*(Class *)(v4 + 2976)), "initWithPolicy:specificCategories:excludedContent:", v25, v8, v18);

        goto LABEL_28;
      }
    }
    else
    {
      v8 = 0;
    }
    v15 = 2;
    goto LABEL_15;
  }
  v16 = 0;
LABEL_28:

  return v16;
}

+ (BOOL)isValidPersistableRepresentation:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("categories"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = 0;
LABEL_31:

        goto LABEL_32;
      }
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v23;
LABEL_6:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          if (!+[MOCategory isValidPersistableRepresentation:](MOCategory, "isValidPersistableRepresentation:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10)))goto LABEL_25;
          if (v8 == ++v10)
          {
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
            if (v8)
              goto LABEL_6;
            break;
          }
        }
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activities"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v16 = 1;
      goto LABEL_30;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            if (!+[MOApplication isValidPersistableRepresentation:](MOApplication, "isValidPersistableRepresentation:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18))
            {
              v16 = 0;
              goto LABEL_29;
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v13)
            continue;
          break;
        }
      }
      v16 = 1;
LABEL_29:

      goto LABEL_30;
    }
LABEL_25:
    v16 = 0;
LABEL_30:

    goto LABEL_31;
  }
  v16 = 0;
LABEL_32:

  return v16;
}

@end
