@implementation CADEventPredicate

void __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v10, v5);
    }
    objc_msgSend(v10, "addObject:", v3);

  }
  else
  {
    logHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke_cold_1((uint64_t)v4, v11);

  }
}

uint64_t __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v21;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = 1;
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v3, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "calendar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "externalID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = v8;
      v6 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v6)
      {
        v23 = v8;
        v24 = v7;
        v25 = v3;
        v26 = v9;
        v11 = *(_QWORD *)v30;
        v27 = v10;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v30 != v11)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "calendar", v23);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "externalID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v9, "isEqualToString:", v14) & 1) != 0)
            {
              objc_msgSend(v28, "source");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "externalID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "source");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "externalID");
              v18 = v6;
              v19 = v11;
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v16, "isEqual:", v20);

              v11 = v19;
              v6 = v18;

              v9 = v26;
              v10 = v27;

              if ((v21 & 1) != 0)
              {
                v6 = 1;
                v8 = v27;
                v7 = v24;
                v3 = v25;
                goto LABEL_19;
              }
            }
            else
            {

            }
          }
          v6 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v6);
        v7 = v24;
        v3 = v25;
        v8 = v23;
      }
LABEL_19:

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "A pending integration event has no uniqueID (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end
