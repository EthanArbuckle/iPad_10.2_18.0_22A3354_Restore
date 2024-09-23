@implementation _BMLibraryNode

+ (id)streamWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  id v33;
  id *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v42;
  id v43;
  id *v44;
  id v45;
  void *v46;
  id obj;
  id obja;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  void *v59;
  _BYTE v60[128];
  uint64_t v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = a1;
  if (objc_msgSend(v7, "count") == 1)
  {
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(a1, "streamNames");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v55 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v6, "lowercaseString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lowercaseString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
          {
            objc_msgSend(v45, "streamWithName:", v12);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_32;
          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
        if (v9)
          continue;
        break;
      }
    }

    if (a4)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v61 = *MEMORY[0x1E0CB2D50];
      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v45, "identifier");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("Stream %@ could not be found, it is not a member of %@"), v6, obja);
      v62 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", CFSTR("BMLibraryErrorDomain"), 1, v19);

      v20 = 0;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v44 = a4;
    objc_msgSend(v7, "firstObject");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subarrayWithRange:", 1, objc_msgSend(v7, "count") - 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(a1, "sublibraries");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
    if (v22)
    {
      v23 = v22;
      v42 = v7;
      v43 = v6;
      v24 = 0;
      v25 = *(_QWORD *)v51;
LABEL_14:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v51 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v26);
        objc_msgSend(obj, "lowercaseString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "lowercaseString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v28, "isEqualToString:", v30);

        if (v31)
        {
          objc_msgSend(v46, "componentsJoinedByString:", CFSTR("."));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v24;
          objc_msgSend(v27, "streamWithIdentifier:error:", v32, &v49);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v49;

          if (v20)
          {

            goto LABEL_27;
          }
          v24 = v33;
        }
        if (v23 == ++v26)
        {
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
          if (v23)
            goto LABEL_14;

          v34 = v44;
          if (v44)
          {
            v7 = v42;
            v6 = v43;
            if (!v24)
              goto LABEL_29;
            v33 = objc_retainAutorelease(v24);
            v20 = 0;
            *v44 = v33;
            goto LABEL_31;
          }
          v20 = 0;
          v33 = v24;
LABEL_27:
          v7 = v42;
          v6 = v43;
          goto LABEL_31;
        }
      }
    }

    v34 = a4;
    if (a4)
    {
LABEL_29:
      v35 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v58 = *MEMORY[0x1E0CB2D50];
      v36 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v45, "identifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("Library %@ could not be found, it is not a member of %@"), obj, v37);
      v59 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_retainAutorelease((id)objc_msgSend(v35, "initWithDomain:code:userInfo:", CFSTR("BMLibraryErrorDomain"), 1, v39));
      *v34 = v40;

    }
    v33 = 0;
    v20 = 0;
LABEL_31:

LABEL_32:
  }

  return v20;
}

+ (id)streams
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *context;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x193FECFB4](a1, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(a1, "streamNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "streamWithName:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v3, "addObject:", v10);
        }
        else
        {
          __biome_log_for_category();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(a1, "identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v21 = v9;
            v22 = 2112;
            v23 = v12;
            v24 = 2112;
            v25 = 0;
            _os_log_fault_impl(&dword_18D810000, v11, OS_LOG_TYPE_FAULT, "Failure to fetch stream for known name %@ in library node %@, %@", buf, 0x20u);

          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  objc_autoreleasePoolPop(context);
  return v13;
}

+ (id)allStreams
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x193FECFB4](a1, a2);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  v6 = v5;
  while (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLastObject");
    objc_msgSend(v7, "sublibraries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v8);

    objc_msgSend(v7, "streams");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v9);

    v5 = v6;
  }
  v10 = (void *)objc_msgSend(v4, "copy");

  objc_autoreleasePoolPop(v3);
  return v10;
}

+ (id)allStreamIdentifiers
{
  id v3;
  id v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  void *context;
  id obj;
  __int128 v31;
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
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x193FECFB4](a1, a2);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = a1;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("BMLibrary")) & 1) != 0)
  {
    v6 = &stru_1E2672FA8;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@."), v8);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v4, "streamNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(v9);
        -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v11);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = v4;
  objc_msgSend(v4, "sublibraries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v18);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        objc_msgSend(v19, "allStreamIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v20);
              -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v24));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v25);

              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
          }
          while (v22);
        }

        ++v18;
      }
      while (v18 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v16);
  }

  v26 = (void *)objc_msgSend(v3, "copy");
  objc_autoreleasePoolPop(context);
  return v26;
}

+ (id)allValidKeyPaths
{
  void *v3;
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

  v3 = (void *)MEMORY[0x193FECFB4](a1, a2);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0D01BA0], "genericValidKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  +[BMEventBase validKeyPaths](BMEventBase, "validKeyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", a1, 0);
  v8 = v7;
  while (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);
    objc_msgSend(v9, "validKeyPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v11);

    objc_msgSend(v9, "sublibraries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v12);

    v7 = v8;
  }
  v13 = (void *)objc_msgSend(v4, "copy");

  objc_autoreleasePoolPop(v3);
  return v13;
}

+ (id)allValidEventClasses
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x193FECFB4]();
  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend((id)objc_opt_class(), "allStreams");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "allStreams", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", objc_msgSend(v11, "eventClass"));

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  objc_autoreleasePoolPop(v2);
  return v12;
}

+ (id)identifier
{
  id result;

  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1();
  return result;
}

+ (id)streamNames
{
  id result;

  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1();
  return result;
}

+ (id)validKeyPaths
{
  id result;

  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1();
  return result;
}

+ (id)streamWithName:(id)a3
{
  id result;

  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1();
  return result;
}

+ (id)sublibraries
{
  id result;

  OUTLINED_FUNCTION_2_2();
  objc_opt_class();
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1();
  return result;
}

@end
