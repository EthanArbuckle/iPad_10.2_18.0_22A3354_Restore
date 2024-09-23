@implementation NSDictionary

void __48__NSDictionary_FPFrameworkAdditions__fp_filter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

void __73__NSDictionary_FPFrameworkAdditions__fp_removingObjectsNotKindOfClasses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = a1;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v5;

          v10 = v14;
        }
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v6;

          v11 = v15;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16 = v18;
    objc_msgSend(v11, "fp_removingObjectsNotKindOfClasses:", *(_QWORD *)(v18 + 32));
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v17;
    if (!v10)
      goto LABEL_21;
  }
  else
  {
    v16 = v18;
    if (!v10)
      goto LABEL_21;
  }
  if (v11)
    objc_msgSend(*(id *)(v16 + 40), "setObject:forKeyedSubscript:", v11, v10);
LABEL_21:

}

@end
