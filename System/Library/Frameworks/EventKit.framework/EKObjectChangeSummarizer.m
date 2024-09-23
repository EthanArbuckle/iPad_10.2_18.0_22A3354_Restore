@implementation EKObjectChangeSummarizer

+ (id)changeSummaryForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v5, "rollback");
  objc_msgSend(a1, "diffSummaryBetweenObject:andObject:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)diffSummaryBetweenObject:(id)a3 andObject:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id obj;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
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
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v46 = 0;
  v41 = v7;
  if (v7 && v8)
  {
    v43 = (void *)objc_opt_class();
    if (v43 != (void *)objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EKObjectChangeSummarizer.m"), 93, CFSTR("Diff summary called on objects of different class"));

    }
    v38 = v9;
    objc_msgSend(v7, "diffWithObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "summaryDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (id)objc_opt_new();
    objc_msgSend(v43, "EKObjectChangeSummarizer_singleValueDiffKeys");
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v56 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v41, "valueForKeyPath:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = v20;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v21 = (id)objc_claimAutoreleasedReturnValue();
            }
            v22 = v21;
            objc_msgSend(v40, "objectForKeyedSubscript:", v18);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "setObject:forKeyedSubscript:", v22, v23);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v15);
    }

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v43, "EKObjectChangeSummarizer_multiValueDiffKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v44)
    {
      v42 = *(_QWORD *)v52;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v52 != v42)
            objc_enumerationMutation(obj);
          v45 = v24;
          v25 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v24);
          objc_msgSend(v43, "EKObjectChangeSummarizer_multiValueDiffKeys");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v28 = objc_msgSend(&unk_1E47B5C08, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v48 != v30)
                  objc_enumerationMutation(&unk_1E47B5C08);
                v32 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v25, v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKey:", v33);
                v34 = (void *)objc_claimAutoreleasedReturnValue();

                if (v34)
                {
                  objc_msgSend(v27, "objectForKeyedSubscript:", v32);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v35)
                  {
                    objc_msgSend(v12, "objectForKeyedSubscript:", v33);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "setObject:forKeyedSubscript:", v36, v35);

                  }
                }

              }
              v29 = objc_msgSend(&unk_1E47B5C08, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            }
            while (v29);
          }

          v24 = v45 + 1;
        }
        while (v45 + 1 != v44);
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v44);
    }

    v9 = v38;
  }

  return v46;
}

@end
