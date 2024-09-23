@implementation _LAKeyStoreBackendFake

- (_LAKeyStoreBackendFake)init
{
  _LAKeyStoreBackendFake *v2;
  void *v3;
  uint64_t v4;
  NSMutableDictionary *keys;
  uint64_t v6;
  NSMutableDictionary *genps;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LAKeyStoreBackendFake;
  v2 = -[_LAKeyStoreBackendFake init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C9AA70];
    v4 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    keys = v2->_keys;
    v2->_keys = (NSMutableDictionary *)v4;

    v6 = objc_msgSend(v3, "mutableCopy");
    genps = v2->_genps;
    v2->_genps = (NSMutableDictionary *)v6;

  }
  return v2;
}

- (BOOL)createKeyWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  const __CFDictionary *v16;
  __SecKey *v17;
  CFErrorRef v18;
  BOOL v19;
  CFDictionaryRef v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _LAKeyStoreBackendFake *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  CFErrorRef error;

  v6 = a3;
  error = 0;
  v7 = *MEMORY[0x1E0CD6FC0];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6FC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CD6908];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6908]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CD6890];
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6890]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke;
  v34[3] = &unk_1E707A1E8;
  v15 = v6;
  v35 = v15;
  __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke((uint64_t)v34);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v17 = SecKeyCreateRandomKey(v16, &error);
  v18 = error;
  if (!error)
  {
    v29 = self;
    v30 = v10;
    v20 = SecKeyCopyAttributes(v17);
    v21 = (void *)-[__CFDictionary mutableCopy](v20, "mutableCopy");

    if (v21 && objc_msgSend(v21, "count"))
    {
      v22 = *MEMORY[0x1E0CD6A90];
      objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, v22);

      objc_msgSend(v21, "setObject:forKeyedSubscript:", v30, v9);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, v12);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CD70E8]);

      v31[0] = v14;
      v31[1] = 3221225472;
      v31[2] = __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke_2;
      v31[3] = &unk_1E707A210;
      v31[4] = v29;
      v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v30, 4);
      v33 = v21;
      v24 = v32;
      __51___LAKeyStoreBackendFake_createKeyWithQuery_error___block_invoke_2(v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v29->_keys, "setObject:forKeyedSubscript:", v25, v24);

      v19 = 1;
    }
    else
    {
      if (v17)
        CFRelease(v17);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key creation failed for query %@"), v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0;
      if (!a4 || !v27)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key creation failed for query %@"), v15);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v24);
      v19 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_16:
    v10 = v30;
    goto LABEL_17;
  }
  if (v17)
  {
    CFRelease(v17);
    v18 = error;
  }
  v19 = 0;
  if (a4 && v18)
  {
    v19 = 0;
    *a4 = objc_retainAutorelease(v18);
  }
LABEL_17:

  return v19;
}

- (BOOL)createGenericPasswordWithQuery:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63___LAKeyStoreBackendFake_createGenericPasswordWithQuery_error___block_invoke;
  v11[3] = &unk_1E707A210;
  v11[4] = self;
  v12 = v6;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  __63___LAKeyStoreBackendFake_createGenericPasswordWithQuery_error___block_invoke(v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_genps, "setObject:forKeyedSubscript:", v9, v8);

  return 1;
}

- (id)fetchItemWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  char v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  _LAKeyStoreBackendFake *v53;
  uint64_t v54;
  id *v55;
  id *v56;
  id *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0CD6C98];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD6CA8]);

  if (v9)
  {
    v55 = a4;
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
    v10 = objc_claimAutoreleasedReturnValue();
    v58 = v6;
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v53 = self;
    v60 = (void *)v10;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_genps, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v75;
      v16 = *MEMORY[0x1E0CD68F8];
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v75 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
          objc_msgSend(v18, "objectForKeyedSubscript:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", v11);

          if ((v20 & 1) != 0)
          {
            v35 = v18;

            v6 = v58;
LABEL_45:

            goto LABEL_46;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
        if (v14)
          continue;
        break;
      }
    }

    a4 = v55;
    v6 = v58;
    self = v53;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0CD6CC0]);

  if (v22)
  {
    v23 = *MEMORY[0x1E0CD6A90];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6908]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithData:encoding:", v25, 4);

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      -[NSMutableDictionary objectForKeyedSubscript:](self->_keys, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
      if (v28)
      {
        v29 = v28;
        v56 = a4;
        v30 = *(_QWORD *)v71;
        while (2)
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v71 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
            objc_msgSend(v32, "objectForKeyedSubscript:", v23);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "isEqualToString:", v60);

            if ((v34 & 1) != 0)
            {
              v35 = v32;
              goto LABEL_44;
            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          if (v29)
            continue;
          break;
        }
        a4 = v56;
      }
    }
    else
    {
      v36 = *MEMORY[0x1E0CD6900];
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6900]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      -[NSMutableDictionary allValues](self->_keys, "allValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
      if (v52)
      {
        v37 = *(_QWORD *)v67;
        v57 = a4;
        v59 = v6;
        v51 = *(_QWORD *)v67;
        do
        {
          v38 = 0;
          do
          {
            if (*(_QWORD *)v67 != v37)
              objc_enumerationMutation(v27);
            v54 = v38;
            v39 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v38);
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v40 = v39;
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v63;
              while (2)
              {
                for (k = 0; k != v42; ++k)
                {
                  if (*(_QWORD *)v63 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
                  objc_msgSend(v45, "objectForKeyedSubscript:", v36);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v46, "isEqualToData:", v26);

                  if ((v47 & 1) != 0)
                  {
                    v35 = v45;

                    v6 = v59;
LABEL_44:

                    goto LABEL_45;
                  }
                }
                v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
                if (v42)
                  continue;
                break;
              }
            }

            v38 = v54 + 1;
            a4 = v57;
            v6 = v59;
            v37 = v51;
          }
          while (v54 + 1 != v52);
          v52 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
        }
        while (v52);
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No results for query %@"), v6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAAuthorizationError resourceNotFoundWithMessage:](LAAuthorizationError, "resourceNotFoundWithMessage:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (id)MEMORY[0x1E0C9AA70];
  if (a4 && v49)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No results for query %@"), v6);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAAuthorizationError resourceNotFoundWithMessage:](LAAuthorizationError, "resourceNotFoundWithMessage:");
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
LABEL_46:

  return v35;
}

- (id)fetchItemsWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  NSMutableDictionary *genps;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a3;
  v7 = *MEMORY[0x1E0CD6C98];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD6CA8]);

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    genps = self->_genps;
    if (!v10)
    {
      -[NSMutableDictionary allValues](genps, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __52___LAKeyStoreBackendFake_fetchItemsWithQuery_error___block_invoke;
      v25[3] = &unk_1E707A238;
      v26 = v11;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);

      v14 = v26;
LABEL_13:

      goto LABEL_14;
    }
LABEL_8:
    -[NSMutableDictionary objectForKeyedSubscript:](genps, "objectForKeyedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v14);
    goto LABEL_13;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CD6CC0]);

  if (v16)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6908]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v17, "initWithData:encoding:", v18, 4);

    v11 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    if (!v10 || !objc_msgSend(v10, "length"))
    {
      -[NSMutableDictionary allValues](self->_keys, "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __52___LAKeyStoreBackendFake_fetchItemsWithQuery_error___block_invoke_2;
      v23[3] = &unk_1E707A238;
      v24 = v11;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v23);

      v14 = v24;
      goto LABEL_13;
    }
    genps = self->_keys;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid fetch query %@"), v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (a4 && v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid fetch query %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

  }
  return v11;
}

- (BOOL)removeItemsWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  NSMutableDictionary *genps;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;

  v6 = a3;
  v7 = *MEMORY[0x1E0CD6C98];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD6CA8]);

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B58]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    genps = self->_genps;
    if (!v10)
      goto LABEL_13;
    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CD6CC0]);

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6908]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v14, "initWithData:encoding:", v15, 4);

    if (!v10 || !objc_msgSend(v10, "length"))
    {
      genps = self->_keys;
LABEL_13:
      -[NSMutableDictionary removeAllObjects](genps, "removeAllObjects");
      goto LABEL_14;
    }
    genps = self->_keys;
LABEL_8:
    -[NSMutableDictionary objectForKeyedSubscript:](genps, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAllObjects");

LABEL_14:
    v19 = 1;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid remove query %@"), v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  if (a4 && v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid remove query %@"), v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[LAAuthorizationError genericErrorWithMessage:](LAAuthorizationError, "genericErrorWithMessage:", v10);
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:

  }
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genps, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
