@implementation CUKeychainManager

- (id)_copyItemsMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CUKeychainItem *v25;
  BOOL v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  objc_class *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_class *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CFTypeRef result;
  _BYTE v65[128];
  uint64_t v66;

  v6 = *(_QWORD *)&a4;
  v66 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "persistentRef");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD70E0]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6F38], *MEMORY[0x1E0CD6F30]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7010]);
    if ((v6 & 8) != 0)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7020]);
    if ((v6 & 1) != 0)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7018]);
LABEL_10:
    result = 0;
    LODWORD(v11) = SecItemCopyMatching((CFDictionaryRef)v9, &result);
    v18 = (void *)result;
    if (result)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = v9;
        v56 = v8;
        v57 = v7;
        v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v61;
LABEL_14:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v61 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v23);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = objc_alloc_init(CUKeychainItem);
              v59 = 0;
              v26 = -[CUKeychainItem _updateWithAttributesDictionary:flags:error:](v25, "_updateWithAttributesDictionary:flags:error:", v24, v6, &v59);
              v27 = v59;
              v34 = v27;
              if (v26)
              {
                objc_msgSend(v58, "addObject:", v25);
              }
              else if ((v6 & 2) == 0)
              {
                v8 = v56;
                v7 = v57;
                v9 = v55;
                v35 = v58;
                if (a5)
                {
                  if (v27)
                  {
                    *a5 = objc_retainAutorelease(v27);
                  }
                  else
                  {
                    NSErrorWithOSStatusF(4294960534, (uint64_t)"Update item failed", v28, v29, v30, v31, v32, v33, v54);
                    v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    *a5 = v52;

                  }
                }

LABEL_43:
                goto LABEL_44;
              }

            }
            else if ((v6 & 2) == 0)
            {
              v8 = v56;
              v7 = v57;
              v9 = v55;
              v35 = v58;
              if (a5)
              {
                v45 = (objc_class *)objc_opt_class();
                NSStringFromClass(v45);
                v25 = (CUKeychainItem *)objc_claimAutoreleasedReturnValue();
                NSErrorWithOSStatusF(4294960540, (uint64_t)"SecItemCopyMatching array contained non-dictionary (%@)", v46, v47, v48, v49, v50, v51, (uint64_t)v25);
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_43;
              }
LABEL_44:

              v36 = 0;
              goto LABEL_45;
            }
            if (v21 == ++v23)
            {
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
              if (v21)
                goto LABEL_14;
              break;
            }
          }
        }

        v35 = v58;
        v36 = (void *)objc_msgSend(v58, "copy");
        v8 = v56;
        v7 = v57;
        v9 = v55;
LABEL_45:

        goto LABEL_46;
      }
      if (a5)
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        NSErrorWithOSStatusF(4294960540, (uint64_t)"SecItemCopyMatching returned non-array (%@)", v39, v40, v41, v42, v43, v44, (uint64_t)v38);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a5)
    {
      if ((_DWORD)v11)
        v11 = v11;
      else
        v11 = 4294941996;
      NSErrorWithOSStatusF(v11, (uint64_t)"SecItemCopyMatching failed", v12, v13, v14, v15, v16, v17, v54);
      v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    v36 = 0;
LABEL_46:

    goto LABEL_47;
  }
  if ((v6 & 1) != 0)
    v10 = 458752;
  else
    v10 = 327680;
  objc_msgSend(v7, "_attributesDictionaryWithFlags:error:", v10 | (v6 & 8), a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_10;
  v36 = 0;
LABEL_47:

  return v36;
}

- (id)copyItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CUKeychainItem *v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CUKeychainItem *v29;
  objc_class *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v40;
  id v41;
  CFTypeRef result;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  objc_msgSend(v7, "persistentRef");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD70E0]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7010]);
    if ((v6 & 8) != 0)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7020]);
    if ((v6 & 1) != 0)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7018]);
LABEL_10:
    result = 0;
    LODWORD(v11) = SecItemCopyMatching((CFDictionaryRef)v9, &result);
    v18 = (void *)result;
    if (result)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = objc_alloc_init(CUKeychainItem);
        v41 = 0;
        v20 = -[CUKeychainItem _updateWithAttributesDictionary:flags:error:](v19, "_updateWithAttributesDictionary:flags:error:", v18, v6, &v41);
        v21 = v41;
        v28 = v21;
        if (v20)
        {
          v29 = v19;
LABEL_28:

          goto LABEL_29;
        }
        if (a5)
        {
          if (v21)
          {
            v29 = 0;
            *a5 = objc_retainAutorelease(v21);
            goto LABEL_28;
          }
          NSErrorWithOSStatusF(4294960534, (uint64_t)"Update item failed", v22, v23, v24, v25, v26, v27, v40);
          v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *a5 = v38;

        }
        v29 = 0;
        goto LABEL_28;
      }
      if (a5)
      {
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        NSErrorWithOSStatusF(4294960540, (uint64_t)"SecItemCopyMatching returned non-dictionary (%@)", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a5)
    {
      if ((_DWORD)v11)
        v11 = v11;
      else
        v11 = 4294941996;
      NSErrorWithOSStatusF(v11, (uint64_t)"SecItemCopyMatching failed", v12, v13, v14, v15, v16, v17, v40);
      v29 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    v29 = 0;
LABEL_29:

    goto LABEL_30;
  }
  if ((v6 & 1) != 0)
    v10 = 196608;
  else
    v10 = 0x10000;
  objc_msgSend(v7, "_attributesDictionaryWithFlags:error:", v10 | (v6 & 8), a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    goto LABEL_10;
  v29 = 0;
LABEL_30:

  return v29;
}

- (id)_copyItemsMatchingItemSeparate:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  CUKeychainItem *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id *v36;
  id v37;
  id *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v6 = *(_QWORD *)&a4;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[CUKeychainManager _copyItemsMatchingItem:flags:error:](self, "_copyItemsMatchingItem:flags:error:", v8, v6 & 0xFFFFFFFE, a5);
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "count"))
    {
      v39 = a5;
      v11 = objc_alloc_init(CUKeychainItem);
      objc_msgSend(v8, "accessGroup");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUKeychainItem setAccessGroup:](v11, "setAccessGroup:", v12);

      -[CUKeychainItem setLegacy:](v11, "setLegacy:", objc_msgSend(v8, "legacy"));
      -[CUKeychainItem setSyncType:](v11, "setSyncType:", objc_msgSend(v8, "syncType"));
      objc_msgSend(v8, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUKeychainItem setType:](v11, "setType:", v13);

      objc_msgSend(v8, "viewHint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUKeychainItem setViewHint:](v11, "setViewHint:", v14);

      v41 = v8;
      objc_msgSend(v8, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v40 = v10;
      v16 = v10;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v17)
      {
        v18 = v17;
        v42 = 0;
        v19 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v46 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend(v21, "identifier", v39);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22)
            {
              objc_msgSend(v21, "identifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[CUKeychainItem setIdentifier:](v11, "setIdentifier:", v23);

              if (!v15)
              {
                objc_msgSend(v21, "type");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[CUKeychainItem setType:](v11, "setType:", v24);

              }
              objc_msgSend(v21, "viewHint");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[CUKeychainItem setViewHint:](v11, "setViewHint:", v25);

              v44 = 0;
              v26 = -[CUKeychainManager copyItemMatchingItem:flags:error:](self, "copyItemMatchingItem:flags:error:", v11, v6, &v44);
              v27 = v44;
              v28 = v27;
              if (v26)
              {
                objc_msgSend(v43, "addObject:", v26);
              }
              else if (!v42)
              {
                v42 = v27;
              }

            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        }
        while (v18);
      }
      else
      {
        v42 = 0;
      }

      if (objc_msgSend(v43, "count"))
      {
        v29 = (void *)objc_msgSend(v43, "copy");
        v10 = v40;
        v8 = v41;
        v35 = v42;
LABEL_29:

        goto LABEL_30;
      }
      v10 = v40;
      v8 = v41;
      v36 = v39;
      v35 = v42;
      if (v39)
      {
        if (v42)
        {
          v29 = 0;
          *v39 = objc_retainAutorelease(v42);
          goto LABEL_29;
        }
        NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"No data-accessible items", v30, v31, v32, v33, v34, (uint64_t)v39);
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *v36 = v37;

      }
      v29 = 0;
      goto LABEL_29;
    }
    v29 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v29 = 0;
  }
LABEL_30:

  return v29;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  return -[CUKeychainManager addItem:flags:error:](self, "addItem:flags:error:", a3, 0, a4);
}

- (BOOL)addItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  const char *v26;
  uint64_t v28;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (a5)
    {
      v26 = "No identifier";
LABEL_11:
      NSErrorWithOSStatusF(4294960591, (uint64_t)v26, v9, v10, v11, v12, v13, v14, v28);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
LABEL_12:
    v25 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v7, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    if (a5)
    {
      v26 = "No type";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  objc_msgSend(v7, "_attributesDictionaryWithFlags:error:", v6, a5);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = SecItemAdd(v16, 0);
    v25 = (_DWORD)v18 == 0;
    if (a5 && (_DWORD)v18)
    {
      NSErrorWithOSStatusF(v18, (uint64_t)"SecItemAdd failed", v19, v20, v21, v22, v23, v24, v28);
      v25 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v25 = 0;
  }

LABEL_15:
  return v25;
}

- (id)addItem:(id)a3 returnFlags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  CUKeychainItem *v27;
  const char *v28;
  CUKeychainItem *v29;
  BOOL v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v49;
  id v50;
  CFTypeRef result;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if ((v6 & 1) != 0)
        v16 = 196608;
      else
        v16 = 0x10000;
      objc_msgSend(v7, "_attributesDictionaryWithFlags:error:", v16 | v6, a5);
      v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
      {
        v27 = 0;
LABEL_30:

        goto LABEL_31;
      }
      result = 0;
      v19 = SecItemAdd(v17, &result);
      v26 = (void *)result;
      if ((_DWORD)v19)
      {
        if (a5)
        {
          NSErrorWithOSStatusF(v19, (uint64_t)"SecItemAdd failed", v20, v21, v22, v23, v24, v25, v49);
          v27 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:

          goto LABEL_30;
        }
LABEL_22:
        v27 = 0;
        goto LABEL_29;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          NSErrorWithOSStatusF(4294960540, (uint64_t)"SecItemAdd returned non-dictionary (%@)", v41, v42, v43, v44, v45, v46, (uint64_t)v40);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_22;
      }
      v29 = objc_alloc_init(CUKeychainItem);
      v50 = 0;
      v30 = -[CUKeychainItem _updateWithAttributesDictionary:flags:error:](v29, "_updateWithAttributesDictionary:flags:error:", v26, v6, &v50);
      v31 = v50;
      v38 = v31;
      if (v30)
      {
        v27 = v29;
LABEL_28:

        goto LABEL_29;
      }
      if (a5)
      {
        if (v31)
        {
          v27 = 0;
          *a5 = objc_retainAutorelease(v31);
          goto LABEL_28;
        }
        NSErrorWithOSStatusF(4294960534, (uint64_t)"Update item failed", v32, v33, v34, v35, v36, v37, v49);
        v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v47;

      }
      v27 = 0;
      goto LABEL_28;
    }
    if (a5)
    {
      v28 = "No type";
      goto LABEL_14;
    }
LABEL_15:
    v27 = 0;
    goto LABEL_31;
  }
  if (!a5)
    goto LABEL_15;
  v28 = "No identifier";
LABEL_14:
  NSErrorWithOSStatusF(4294960591, (uint64_t)v28, v9, v10, v11, v12, v13, v14, v49);
  v27 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v27;
}

- (BOOL)addOrUpdateOrReAddItem:(id)a3 logCategory:(LogCategory *)a4 logLabel:(id)a5 error:(id *)a6
{
  return -[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:](self, "addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:", a3, 0, a4, a5, a6);
}

- (BOOL)addOrUpdateOrReAddItem:(id)a3 flags:(unsigned int)a4 logCategory:(LogCategory *)a5 logLabel:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  CUKeychainItem *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int var0;
  BOOL v36;
  BOOL v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  id v50;
  id v51;
  id v52;
  id v53;

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a6;
  v53 = 0;
  v14 = -[CUKeychainManager addItem:flags:error:](self, "addItem:flags:error:", v12, v10, &v53);
  v19 = v53;
  if (!v14)
  {
    v20 = objc_alloc_init(CUKeychainItem);
    objc_msgSend(v12, "accessGroup");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUKeychainItem setAccessGroup:](v20, "setAccessGroup:", v21);

    objc_msgSend(v12, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUKeychainItem setIdentifier:](v20, "setIdentifier:", v22);

    -[CUKeychainItem setLegacy:](v20, "setLegacy:", objc_msgSend(v12, "legacy"));
    -[CUKeychainItem setSyncType:](v20, "setSyncType:", objc_msgSend(v12, "syncType"));
    objc_msgSend(v12, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUKeychainItem setType:](v20, "setType:", v23);

    objc_msgSend(v12, "viewHint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUKeychainItem setViewHint:](v20, "setViewHint:", v24);

    if (objc_msgSend(v19, "code") == -25299)
    {
      v52 = v19;
      v29 = -[CUKeychainManager updateItem:matchingItem:flags:error:](self, "updateItem:matchingItem:flags:error:", v12, v20, v10, &v52);
      v30 = v52;

      var0 = a5->var0;
      if (v29)
      {
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu)))
          LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x1Eu, (uint64_t)"%@ updated: %@\n", v31, v32, v33, v34, (uint64_t)v13);
        goto LABEL_40;
      }
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au)))
        LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x5Au, (uint64_t)"### %@ update failed: %@, %{error}\n", v31, v32, v33, v34, (uint64_t)v13);
    }
    else
    {
      if (a5->var0 <= 90 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au)))
        LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x5Au, (uint64_t)"### %@ add failed: %@, %{error}\n", v25, v26, v27, v28, (uint64_t)v13);
      v30 = v19;
    }
    v51 = v30;
    v37 = -[CUKeychainManager removeItemMatchingItem:flags:error:](self, "removeItemMatchingItem:flags:error:", v20, v10, &v51);
    v38 = v51;

    if (!v37 && a5->var0 <= 90 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au)))
      LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x5Au, (uint64_t)"### %@ delete to re-add failed: %@, %{error}\n", v39, v40, v41, v42, (uint64_t)v13);
    v50 = v38;
    v43 = -[CUKeychainManager addItem:flags:error:](self, "addItem:flags:error:", v12, v10, &v50);
    v30 = v50;

    v48 = a5->var0;
    if (!v43)
    {
      if (v48 <= 90 && (v48 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x5Au)))
        LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x5Au, (uint64_t)"### %@ re-add failed: %@, %{error}\n", v44, v45, v46, v47, (uint64_t)v13);
      if (a7)
      {
        v30 = objc_retainAutorelease(v30);
        v36 = 0;
        *a7 = v30;
      }
      else
      {
        v36 = 0;
      }
      goto LABEL_41;
    }
    if (v48 <= 30 && (v48 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu)))
      LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x1Eu, (uint64_t)"%@ deleted and re-added: %@\n", v44, v45, v46, v47, (uint64_t)v13);
LABEL_40:
    v36 = 1;
LABEL_41:

    v19 = v30;
    goto LABEL_42;
  }
  if (a5->var0 <= 30 && (a5->var0 != -1 || _LogCategory_Initialize((uint64_t)a5, 0x1Eu)))
    LogPrintF((uint64_t)a5, (uint64_t)"-[CUKeychainManager addOrUpdateOrReAddItem:flags:logCategory:logLabel:error:]", 0x1Eu, (uint64_t)"%@ added: %@\n", v15, v16, v17, v18, (uint64_t)v13);
  v36 = 1;
LABEL_42:

  return v36;
}

- (BOOL)removeItemMatchingItem:(id)a3 error:(id *)a4
{
  return -[CUKeychainManager removeItemMatchingItem:flags:error:](self, "removeItemMatchingItem:flags:error:", a3, 0, a4);
}

- (BOOL)removeItemMatchingItem:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const __CFDictionary *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[2];

  v6 = *(_QWORD *)&a4;
  v40[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "persistentRef");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v39 = *MEMORY[0x1E0CD70E0];
    v40[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = SecItemDelete(v10);
    v18 = (_DWORD)v11 == 0;
    if (!a5 || !(_DWORD)v11)
      goto LABEL_6;
    NSErrorWithOSStatusF(v11, (uint64_t)"SecItemDelete failed", v12, v13, v14, v15, v16, v17, v38);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v7, "identifier");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v28 = (void *)v21;
    objc_msgSend(v7, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v7, "_attributesDictionaryWithFlags:error:", v6, a5);
      v30 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v10 = v30;
      if (!v30)
      {
        v18 = 0;
        goto LABEL_6;
      }
      v31 = SecItemDelete(v30);
      v18 = (_DWORD)v31 == 0;
      if (!a5 || !(_DWORD)v31)
        goto LABEL_6;
      NSErrorWithOSStatusF(v31, (uint64_t)"SecItemDelete failed", v32, v33, v34, v35, v36, v37, v38);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v18 = 0;
LABEL_5:
      *a5 = v19;
LABEL_6:

      goto LABEL_7;
    }
  }
  if (a5)
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No type and ID or persistent ref", v22, v23, v24, v25, v26, v27, v38);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_7:

  return v18;
}

- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 error:(id *)a5
{
  return -[CUKeychainManager updateItem:matchingItem:flags:error:](self, "updateItem:matchingItem:flags:error:", a3, a4, 0, a5);
}

- (BOOL)updateItem:(id)a3 matchingItem:(id)a4 flags:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v27;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "secrets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[CUKeychainManager copyItemMatchingItem:flags:error:](self, "copyItemMatchingItem:flags:error:", v11, (v12 != 0) | v7, a6);
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "_mergeItem:", v10);
    objc_msgSend(v14, "_attributesDictionaryWithFlags:error:", v7 | 0x80000, a6);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v11, "_attributesDictionaryWithFlags:error:", v7, a6);
      v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = SecItemUpdate(v16, v15);
        v25 = (_DWORD)v18 == 0;
        if (a6 && (_DWORD)v18)
        {
          NSErrorWithOSStatusF(v18, (uint64_t)"SecItemUpdate failed", v19, v20, v21, v22, v23, v24, v27);
          v25 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end
