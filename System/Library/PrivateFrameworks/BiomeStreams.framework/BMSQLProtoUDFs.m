@implementation BMSQLProtoUDFs

+ (void)_addEventClass:(Class)a3 toProtoRegistry:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  NSStringFromClass(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[objc_class protoFields](a3, "protoFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v7);

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[objc_class protoFields](a3, "protoFields", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "subMessageClass"))
            objc_msgSend(a1, "_addEventClass:toProtoRegistry:", objc_msgSend(v15, "subMessageClass"), v6);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

+ (void)registerProtoUDFsWithDatabase:(id)a3 eventClasses:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id *v17;
  uint64_t module_v2;
  uint64_t v19;
  sqlite3 *v20;
  const char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(a1, "_addEventClass:toProtoRegistry:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v15++), v10, (_QWORD)v23);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  objc_msgSend(v8, "registerFunctionWithName:numArgs:function:userData:error:", CFSTR("biome_extract"), 3, &__block_literal_global_2, v10, a5);
  v16 = (id *)bm_sqlite3_malloc(8);
  if (v16)
  {
    v17 = v16;
    objc_storeStrong(v16, v10);
    module_v2 = sqlite3_create_module_v2((sqlite3 *)objc_msgSend(v8, "db"), "biome_each", &biome_each_module, v17, (void (__cdecl *)(void *))biome_each_vtab_destroy);
    if (a5)
    {
      v19 = module_v2;
      if ((_DWORD)module_v2)
      {
        v20 = (sqlite3 *)objc_msgSend(v8, "db");
        v21 = "Unable to create biome_each module";
        v22 = v19;
LABEL_14:
        BMSQLDatabaseError(v22, v20, v21);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else if (a5)
  {
    v20 = (sqlite3 *)objc_msgSend(v8, "db");
    v21 = "Unable to alloc memory for biome_each_vtab_metadata";
    v22 = 7;
    goto LABEL_14;
  }

}

id __67__BMSQLProtoUDFs_registerProtoUDFsWithDatabase_eventClasses_error___block_invoke(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id *v35;
  uint64_t *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  _QWORD v52[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB2D50];
      v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("biome_extract(): eventClassName is null"));
      v51 = v17;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = &v51;
      v36 = &v50;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 != v13)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v14;
        v18 = v15;
        BMFieldPathFromKeyPath(v16, v18, v7);
        v19 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v19;
        if (v19)
        {
          v20 = (void *)v19;
          v43 = v16;
          v44 = v18;
          v42 = a4;
          v45 = v7;
          v21 = v17;
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v22 = v20;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v54;
            while (2)
            {
              v26 = 0;
              v27 = v21;
              do
              {
                if (*(_QWORD *)v54 != v25)
                  objc_enumerationMutation(v22);
                v28 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v26);
                v29 = objc_msgSend(v28, "number");
                v30 = objc_msgSend(v28, "type");
                v47 = 0;
                +[BMPoirotSchematizerShim searchValueIn:withFieldNumber:typeRawValue:error:](_TtC12BiomeStreams23BMPoirotSchematizerShim, "searchValueIn:withFieldNumber:typeRawValue:error:", v27, v29, v30, &v47);
                v21 = (id)objc_claimAutoreleasedReturnValue();
                v31 = v47;

                if (v31)
                {
                  v37 = objc_retainAutorelease(v31);
                  *v42 = v37;

                  v32 = 0;
                  goto LABEL_19;
                }
                ++v26;
                v27 = v21;
              }
              while (v24 != v26);
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v52, 16);
              if (v24)
                continue;
              break;
            }
          }

          v21 = v21;
          v32 = v21;
LABEL_19:
          v7 = v45;
          v38 = v43;
          v18 = v44;
        }
        else
        {
          v39 = (void *)MEMORY[0x1E0CB35C8];
          *(_QWORD *)&v53 = *MEMORY[0x1E0CB2D50];
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Field path is not valid: %@; eventClass: %@"),
                      v16,
                      v18);
          v52[0] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v53, 1);
          v38 = v16;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("BMSQLDatabaseErrorDomain"), 0, v40);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

          v32 = 0;
        }

        goto LABEL_22;
      }
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2D50];
      v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("biome_extract(): key path is null"));
      v49 = v17;
      v34 = (void *)MEMORY[0x1E0C99D80];
      v35 = &v49;
      v36 = &v48;
    }
    objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("BMSQLDatabaseErrorDomain"), 0, v18);
    v32 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  v32 = 0;
LABEL_23:

  return v32;
}

@end
