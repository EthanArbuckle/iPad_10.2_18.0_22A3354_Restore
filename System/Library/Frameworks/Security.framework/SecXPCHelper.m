@implementation SecXPCHelper

+ (id)safeErrorClasses
{
  if (safeErrorClasses_onceToken != -1)
    dispatch_once(&safeErrorClasses_onceToken, &__block_literal_global_23);
  return (id)safeErrorClasses_errorClasses;
}

Class __43__SecXPCHelper_safeCKErrorPrimitiveClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t i;
  Class result;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safeCKErrorPrimitiveClasses_errorClasses;
  safeCKErrorPrimitiveClasses_errorClasses = v0;

  for (i = 0; i != 6; ++i)
  {
    result = objc_getClass(off_1E1FCDA20[i]);
    if (result)
      result = (Class)objc_msgSend((id)safeCKErrorPrimitiveClasses_errorClasses, "addObject:", result);
  }
  return result;
}

Class __41__SecXPCHelper_safeErrorPrimitiveClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t i;
  Class result;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safeErrorPrimitiveClasses_errorClasses;
  safeErrorPrimitiveClasses_errorClasses = v0;

  for (i = 0; i != 6; ++i)
  {
    result = objc_getClass(off_1E1FCD9F0[i]);
    if (result)
      result = (Class)objc_msgSend((id)safeErrorPrimitiveClasses_errorClasses, "addObject:", result);
  }
  return result;
}

Class __42__SecXPCHelper_safeErrorCollectionClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t i;
  Class result;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safeErrorCollectionClasses_errorClasses;
  safeErrorCollectionClasses_errorClasses = v0;

  for (i = 0; i != 6; ++i)
  {
    result = objc_getClass(off_1E1FCDA50[i]);
    if (result)
      result = (Class)objc_msgSend((id)safeErrorCollectionClasses_errorClasses, "addObject:", result);
  }
  return result;
}

void __32__SecXPCHelper_safeErrorClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)safeErrorClasses_errorClasses;
  safeErrorClasses_errorClasses = v0;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  +[SecXPCHelper safeErrorPrimitiveClasses](SecXPCHelper, "safeErrorPrimitiveClasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend((id)safeErrorClasses_errorClasses, "addObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v4);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  +[SecXPCHelper safeCKErrorPrimitiveClasses](SecXPCHelper, "safeCKErrorPrimitiveClasses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend((id)safeErrorClasses_errorClasses, "addObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v9);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[SecXPCHelper safeErrorCollectionClasses](SecXPCHelper, "safeErrorCollectionClasses", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend((id)safeErrorClasses_errorClasses, "addObject:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
    }
    while (v14);
  }

}

+ (id)safeErrorPrimitiveClasses
{
  if (safeErrorPrimitiveClasses_onceToken != -1)
    dispatch_once(&safeErrorPrimitiveClasses_onceToken, &__block_literal_global_3385);
  return (id)safeErrorPrimitiveClasses_errorClasses;
}

+ (id)safeErrorCollectionClasses
{
  if (safeErrorCollectionClasses_onceToken != -1)
    dispatch_once(&safeErrorCollectionClasses_onceToken, &__block_literal_global_15);
  return (id)safeErrorCollectionClasses_errorClasses;
}

+ (id)safeCKErrorPrimitiveClasses
{
  if (safeCKErrorPrimitiveClasses_onceToken != -1)
    dispatch_once(&safeCKErrorPrimitiveClasses_onceToken, &__block_literal_global_7);
  return (id)safeCKErrorPrimitiveClasses_errorClasses;
}

+ (id)cleanDictionaryForXPC:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[SecXPCHelper cleanObjectForXPC:](SecXPCHelper, "cleanObjectForXPC:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "cleanObjectForXPC:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)cleanObjectForXPC:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t n;
  void *v39;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
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
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    v14 = 0;
    goto LABEL_53;
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  +[SecXPCHelper safeErrorPrimitiveClasses](SecXPCHelper, "safeErrorPrimitiveClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v59 != v7)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v3;

          goto LABEL_53;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v6);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  +[SecXPCHelper safeErrorCollectionClasses](SecXPCHelper, "safeErrorCollectionClasses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (!v9)
    goto LABEL_23;
  v10 = v9;
  v11 = *(_QWORD *)v55;
  while (2)
  {
    for (j = 0; j != v10; ++j)
    {
      if (*(_QWORD *)v55 != v11)
        objc_enumerationMutation(obj);
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v16 = v3;
          objc_msgSend(v16, "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "code");
          objc_msgSend(v16, "userInfo");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          +[SecXPCHelper cleanDictionaryForXPC:](SecXPCHelper, "cleanDictionaryForXPC:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "errorWithDomain:code:userInfo:", v17, v18, v20);
          v14 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[SecXPCHelper cleanDictionaryForXPC:](SecXPCHelper, "cleanDictionaryForXPC:", v3);
            v14 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = v3;
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v21, "count"));
              v14 = (id)objc_claimAutoreleasedReturnValue();
              v50 = 0u;
              v51 = 0u;
              v52 = 0u;
              v53 = 0u;
              v22 = v21;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v51;
                do
                {
                  for (k = 0; k != v24; ++k)
                  {
                    if (*(_QWORD *)v51 != v25)
                      objc_enumerationMutation(v22);
                    +[SecXPCHelper cleanObjectForXPC:](SecXPCHelper, "cleanObjectForXPC:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v14, "addObject:", v27);

                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
                }
                while (v24);
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v28 = v3;
                objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v28, "count"));
                v14 = (id)objc_claimAutoreleasedReturnValue();
                v46 = 0u;
                v47 = 0u;
                v48 = 0u;
                v49 = 0u;
                v22 = v28;
                v29 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
                if (v29)
                {
                  v30 = v29;
                  v31 = *(_QWORD *)v47;
                  do
                  {
                    for (m = 0; m != v30; ++m)
                    {
                      if (*(_QWORD *)v47 != v31)
                        objc_enumerationMutation(v22);
                      +[SecXPCHelper cleanObjectForXPC:](SecXPCHelper, "cleanObjectForXPC:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * m));
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "addObject:", v33);

                    }
                    v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
                  }
                  while (v30);
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                v34 = v3;
                objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", objc_msgSend(v34, "count"));
                v14 = (id)objc_claimAutoreleasedReturnValue();
                v42 = 0u;
                v43 = 0u;
                v44 = 0u;
                v45 = 0u;
                v22 = v34;
                v35 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
                if (v35)
                {
                  v36 = v35;
                  v37 = *(_QWORD *)v43;
                  do
                  {
                    for (n = 0; n != v36; ++n)
                    {
                      if (*(_QWORD *)v43 != v37)
                        objc_enumerationMutation(v22);
                      +[SecXPCHelper cleanObjectForXPC:](SecXPCHelper, "cleanObjectForXPC:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * n));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "addObject:", v39);

                    }
                    v36 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
                  }
                  while (v36);
                }
              }
            }

          }
        }

        goto LABEL_53;
      }
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v10)
      continue;
    break;
  }
LABEL_23:

  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_53:

  return v14;
}

+ (id)cleanseErrorForXPC:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SecXPCHelper cleanDictionaryForXPC:](SecXPCHelper, "cleanDictionaryForXPC:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v3, "code");

    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)errorFromEncodedData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3710];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initForReadingFromData:error:", v4, 0);

  if (v5)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)encodedDataFromError:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("error"));

  objc_msgSend(v5, "encodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
