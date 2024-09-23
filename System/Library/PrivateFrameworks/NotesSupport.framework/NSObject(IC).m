@implementation NSObject(IC)

- (uint64_t)ic_shouldIgnoreObserveValue:()IC ofObject:forKeyPath:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (v13)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v10;
  if (v10 == (void *)v14)
    goto LABEL_10;
  v16 = (void *)v14;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v17)
  {

    v15 = v16;
LABEL_10:

    goto LABEL_11;
  }
  v18 = (void *)v17;
  v19 = objc_msgSend(v10, "isEqual:", v12);

  if ((v19 & 1) != 0)
  {
    v20 = 1;
    goto LABEL_35;
  }
LABEL_11:
  v36 = v12;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v21, "addObject:", v8);
  v37 = v9;
  v38 = v7;
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v44;
    do
    {
      v27 = 0;
      v28 = v23;
      do
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v22);
        objc_msgSend(v28, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v27));
        v23 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v21, "addObject:", v23);
        ++v27;
        v28 = v23;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v25);
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = v21;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v40;
    v7 = v38;
    while (2)
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v40 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if ((objc_msgSend(v34, "isFault") & 1) != 0 || objc_msgSend(v34, "faultingState"))
        {
          v20 = 1;
          goto LABEL_34;
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      v20 = 0;
      if (v31)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
    v7 = v38;
  }
LABEL_34:

  v12 = v36;
  v9 = v37;
LABEL_35:

  return v20;
}

- (uint64_t)ic_didAddObserverForContext:()IC inScope:
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    v4 = a4;
    if (*a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
LABEL_5:
        v6 = objc_msgSend(v5, "isEqualToString:", v4);

        return v6;
      }
    }
    else
    {
      v5 = 0;
      if (!a4)
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return 0;
}

- (uint64_t)ic_addObserver:()IC forKeyPath:context:
{
  return objc_msgSend(a1, "ic_addObserver:forKeyPath:context:explicitOptions:", a3, a4, a5, 3);
}

- (uint64_t)ic_addObserver:()IC forKeyPath:context:explicitOptions:
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:", a3, a4, a6, a5);
}

- (void)ic_removeObserver:()IC forKeyPath:context:
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "removeObserver:forKeyPath:context:", v8, v9, a5);

}

- (void)ic_removeObserver:()IC forKeyPath:context:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_begin_catch(a1);
  v4 = os_log_create("com.apple.notes", "SimulatedCrash");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 138412290;
    v6 = a3;
    _os_log_fault_impl(&dword_1DDAA5000, v4, OS_LOG_TYPE_FAULT, "Attempting to remove a non-existent observer for key path '%@'", (uint8_t *)&v5, 0xCu);
  }

  objc_end_catch();
}

@end
