@implementation LSBundleRecord(IconServicesAdditions)

- (id)_IS_iconProvidingLineageForRecord:()IconServicesAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v4 = a3;
  objc_msgSend(a1, "importedTypeRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "exportedTypeRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke_2;
  v26[3] = &unk_1E5800768;
  v8 = v6;
  v27 = v8;
  v9 = v5;
  v28 = v9;
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF4232B8](v26);
  v11 = (void *)objc_opt_new();
  ((void (**)(_QWORD, id))v10)[2](v10, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    if ((__75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke(objc_msgSend(v11, "addObject:", v12), v12) & 1) != 0)
    {
      *((_BYTE *)v23 + 24) = 1;
    }
    else
    {
      v16[0] = v7;
      v16[1] = 3221225472;
      v16[2] = __75__LSBundleRecord_IconServicesAdditions___IS_iconProvidingLineageForRecord___block_invoke_3;
      v16[3] = &unk_1E5800790;
      v19 = v10;
      v20 = &__block_literal_global_72;
      v13 = v11;
      v17 = v13;
      v21 = &v22;
      v18 = v12;
      objc_msgSend(v18, "enumeratePedigreeWithBlock:", v16);

      if (!*((_BYTE *)v23 + 24))
        objc_msgSend(v13, "removeAllObjects");
    }
    _Block_object_dispose(&v22, 8);
  }
  v14 = (void *)objc_msgSend(v11, "copy");

  return v14;
}

- (id)_IS_iconDictionaryForTag:()IconServicesAdditions tagClass:
{
  id v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __CFString *v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v32 = a1;
  objc_msgSend(a1, "claimRecords");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v35)
  {
    v36 = 0;
    v34 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v43 != v34)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v37 = v9;
        objc_msgSend(v9, "typeIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v39;
LABEL_8:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v39 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v14));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "_ICP_filenameExtensions");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "containsObject:", v6);

            if ((v17 & 1) != 0)
              break;

            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
              if (v12)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v18 = v37;

          if (v18)
            goto LABEL_22;
          v36 = v15;
        }
        else
        {
LABEL_14:

        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v35);
    v18 = 0;
    v15 = v36;
  }
  else
  {
    v15 = 0;
    v18 = 0;
  }
LABEL_22:

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "iconDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_IF_stringForKey:", 0x1E5801BF8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)objc_msgSend(v19, "mutableCopy");
      objc_msgSend(v21, "removeObjectForKey:", 0x1E5801BF8);
      objc_msgSend(v21, "setObject:forKey:", v20, 0x1E5802B18);
      v22 = objc_msgSend(v21, "copy");

      v19 = (void *)v22;
    }
    if (!objc_msgSend(v19, "count") && objc_msgSend(v15, "isDeclared"))
    {
      objc_msgSend(v32, "_IS_iconProvidingLineageForRecord:", v15);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
      {
        objc_msgSend(v24, "iconDictionary");
        v26 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v26;
      }

    }
    if (!objc_msgSend(v19, "count"))
    {
      v27 = v7;
      v28 = v32;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v28, "iconDictionary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = CFSTR("CFBundleIconText");
        v47 = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_IF_dictionaryAddingEntriesFromDictionary:", v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v7 = v27;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_IS_iconDictionaryForType:()IconServicesAdditions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5928], "typeRecordWithIdentifier:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_IS_iconProvidingLineageForRecord:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "iconDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_IF_stringForKey:", 0x1E5801BF8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v8, "removeObjectForKey:", 0x1E5801BF8);
      objc_msgSend(v8, "setObject:forKey:", v7, 0x1E5802B58);
      v9 = objc_msgSend(v8, "copy");

      v6 = (void *)v9;
    }

  }
  else
  {
    v6 = 0;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v10 = a1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "iconDictionary");
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v11;
    }
    objc_msgSend(v2, "preferredTagOfClass:", *MEMORY[0x1E0CA5A88]);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
    {
      v17 = CFSTR("CFBundleIconText");
      v18[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_IF_dictionaryAddingEntriesFromDictionary:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v15;
    }

  }
  return v6;
}

- (uint64_t)_IS_platformToIFPlatform
{
  if (objc_msgSend(a1, "platform") == 1)
    return 1;
  if (objc_msgSend(a1, "platform") == 2 || objc_msgSend(a1, "platform") == 7)
    return 4;
  if (objc_msgSend(a1, "platform") == 6)
    return 2;
  if (objc_msgSend(a1, "platform") == 4 || objc_msgSend(a1, "platform") == 9)
    return 8;
  if (objc_msgSend(a1, "platform") == 11 || objc_msgSend(a1, "platform") == 12)
    return 16;
  if (objc_msgSend(a1, "platform") == 3)
    return 32;
  return 32 * (objc_msgSend(a1, "platform") == 8);
}

@end
