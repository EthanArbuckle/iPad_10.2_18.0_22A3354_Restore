@implementation IDSService(MSPExtras)

- (BOOL)_msp_hasValidIDSAccount
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_msp_currentAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (id)_msp_currentAccountIdentifier
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  MSPGetSharedTripLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "_msp_currentAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "aliasStrings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v39 = v4;
    _os_log_impl(&dword_1B39C0000, v2, OS_LOG_TYPE_DEFAULT, "_msp_currentAccountIdentifier choosing from aliasStrings %@", buf, 0xCu);

  }
  objc_msgSend(a1, "_msp_currentAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aliasStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(a1, "_msp_currentAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "aliasStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(a1, "_msp_currentAccount");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "loginID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v14) = objc_msgSend(v14, "isEqualToString:", v16);

          if ((v14 & 1) != 0)
          {
            objc_msgSend(a1, "_msp_currentAccount");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "loginID");
            v24 = objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v11)
          continue;
        break;
      }
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(a1, "_msp_currentAccount", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "aliasStrings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v9);
          v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          if ((objc_msgSend(v22, "containsString:", CFSTR("@")) & 1) != 0)
          {
            v26 = v22;
            goto LABEL_25;
          }
        }
        v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v19)
          continue;
        break;
      }
    }

    objc_msgSend(a1, "_msp_currentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aliasStrings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v25 = (void *)v24;

  }
  else
  {
    objc_msgSend(a1, "_msp_currentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loginID");
    v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    v25 = v26;
  }

  return v25;
}

- (id)_msp_currentAccount
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  objc_msgSend(a1, "accounts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v2, "count");
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__IDSService_MSPExtras___msp_currentAccount__block_invoke;
  v6[3] = &unk_1E6653C98;
  v6[4] = &v7;
  v6[5] = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)_msp_accountFromIdentifier:()MSPExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uniqueID == %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredSetUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  MSPGetSharedTripLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412802;
      v16 = v9;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_INFO, "_msp_accountFromIdentifier foundAccount %@ for identifier %@ from set %@", buf, 0x20u);
    }

    v12 = v9;
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412546;
      v16 = v4;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1B39C0000, v10, OS_LOG_TYPE_INFO, "_msp_accountFromIdentifier no account for identifier %@ from set %@", buf, 0x16u);
    }

    objc_msgSend(v5, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)_msp_removeSelfFrom:()MSPExtras
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v4 = (void *)objc_msgSend(v21, "mutableCopy");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(a1, "activeAliases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v12 = v21;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
              if (objc_msgSend(v17, "containsString:", v11))
                objc_msgSend(v4, "removeObject:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v14);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  v18 = (void *)objc_msgSend(v4, "copy");
  return v18;
}

+ (id)_msp_IDSIdentifiersFor:()MSPExtras
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_opt_class(), "_msp_IDSIdentifierFor:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

+ (id)_msp_IDSIdentifierFor:()MSPExtras
{
  id v3;
  void *v4;
  int IsValid;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D27368], "sharedPlatform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInternalInstall"))
  {
    IsValid = MSPSharedTripVirtualReceiverIsValid(v3);

    if (IsValid)
      goto LABEL_6;
  }
  else
  {

  }
  if (!IDSIDHasToken())
  {
    v6 = (id)IDSCopyBestGuessIDForID();
    goto LABEL_8;
  }
LABEL_6:
  v6 = v3;
LABEL_8:
  v7 = v6;

  return v7;
}

@end
