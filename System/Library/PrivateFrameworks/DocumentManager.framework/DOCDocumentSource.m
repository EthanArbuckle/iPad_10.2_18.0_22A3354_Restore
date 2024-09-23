@implementation DOCDocumentSource

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDocumentContentTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconsBySize, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_searching_fileProviderDomain, 0);
  objc_storeStrong((id *)&self->_promptText, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_documentContentTypes, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (DOCDocumentSource)init
{
  DOCDocumentSource *v2;
  DOCDocumentSource *v3;
  DOCDocumentSource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCDocumentSource;
  v2 = -[DOCDocumentSource init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)setSearching_fileProviderDomain:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (BOOL)isValidForConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v21;
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

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "documentContentTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *MEMORY[0x24BDF8428]);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[DOCDocumentSource documentContentTypes](self, "documentContentTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v4, "documentContentTypes");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v23 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                if ((objc_msgSend(v19, "conformsToType:", v13) & 1) != 0
                  || (objc_msgSend(v13, "conformsToType:", v19) & 1) != 0)
                {

                  v7 = 1;
                  goto LABEL_22;
                }
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              v11 = v21;
              if (v16)
                continue;
              break;
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        v7 = 0;
      }
      while (v10);
    }
    else
    {
      v7 = 0;
    }
LABEL_22:

  }
  return v7;
}

- (NSString)promptText
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPromptText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

+ (void)endSearchingSources:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDC82F8];
  objc_msgSend(a3, "monitoringContext");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endMonitoringProviderDomainChanges:", v4);

}

void __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject **v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, void *);
  void *v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (v6)
  {
    v8 = (NSObject **)MEMORY[0x24BE2DF90];
    v9 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke_cold_1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke_26;
    v21 = &unk_24C0F12D8;
    v22 = *(id *)(a1 + 32);
    v23 = v7;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v18);

  }
  v16 = *(_QWORD *)(a1 + 40);
  v17 = (void *)objc_msgSend(v7, "copy", v18, v19, v20, v21);
  (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v17, v6);

}

void __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject **v23;
  NSObject **v24;

  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 80);
  objc_sync_enter(v7);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v8 + 24))
  {
    objc_sync_exit(v7);

  }
  else
  {
    *(_BYTE *)(v8 + 24) = 1;
    objc_sync_exit(v7);

    if (v6)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
      v9 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        v23 = (NSObject **)MEMORY[0x24BE2DF90];
        DOCInitLogging();
        v9 = *v23;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_cold_2(a1 + 64, v9, v10, v11, v12, v13, v14, v15);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 80), "defaultSourceForBundleIdentifier:defaultSourceIdentifier:sources:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      {
        v19 = *MEMORY[0x24BE2DF90];
        if (!*MEMORY[0x24BE2DF90])
        {
          v24 = (NSObject **)MEMORY[0x24BE2DF90];
          DOCInitLogging();
          v19 = *v24;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_cold_1((uint64_t *)(a1 + 32), (uint64_t)v5, v19);
        DOCErrorNoLocationAvailableError(0);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v22 = *(void **)(v21 + 40);
        *(_QWORD *)(v21 + 40) = v20;

      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

+ (id)defaultSourceForBundleIdentifier:(id)a3 defaultSourceIdentifier:(id)a4 sources:(id)a5
{
  id v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  int v37;
  BOOL v38;
  void *v39;
  char v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  id v54;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  uint64_t v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v65 = a3;
  v8 = a4;
  v9 = a5;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend(a1, "sourceIdentifierOrderWithDefault:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
  if (v67)
  {
    v12 = *(_QWORD *)v83;
    v13 = *MEMORY[0x24BE2DE10];
    v62 = *MEMORY[0x24BE2DE18];
    v58 = *MEMORY[0x24BE2DE20];
    v57 = *MEMORY[0x24BE2DE28];
    *(_QWORD *)&v11 = 138412290;
    v56 = v11;
    v60 = *(_QWORD *)v83;
    v61 = v8;
    v63 = v10;
    v64 = v9;
    v59 = *MEMORY[0x24BE2DE10];
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v83 != v12)
        objc_enumerationMutation(v10);
      v66 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v14);
      objc_msgSend(v9, "objectForKeyedSubscript:", v56);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v8;
      if ((objc_msgSend(v16, "hasPrefix:", v13) & 1) != 0
        || (objc_msgSend(v16, "hasPrefix:", v62) & 1) != 0
        || (objc_msgSend(v16, "hasPrefix:", v58) & 1) != 0)
      {
        v17 = 1;
      }
      else
      {
        v17 = objc_msgSend(v16, "hasPrefix:", v57);
      }

      if (v15)
        v18 = 0;
      else
        v18 = v17;
      if (v8 && !v18)
        goto LABEL_47;
      v68 = v15;
      objc_msgSend(MEMORY[0x24BE2DEF8], "defaultPermission");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v19, "dataOwnerStateForBundleIdentifier:", v65);

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(v9, "allValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v79;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v79 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
            objc_msgSend(v26, "searching_fileProviderDomain");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v27, "isiCloudDriveProvider") & 1) != 0)
            {
              objc_msgSend(v26, "searching_fileProviderDomain");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v28, "isHidden");

              if ((v29 & 1) == 0)
                objc_msgSend(v20, "addObject:", v26);
            }
            else
            {

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
        }
        while (v23);
      }

      if (objc_msgSend(v20, "count") == 1)
      {
        objc_msgSend(v20, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v68;
        v10 = v63;
      }
      else
      {
        v10 = v63;
        if ((unint64_t)objc_msgSend(v20, "count") < 2)
        {
          v15 = v68;
          v12 = v60;
          goto LABEL_46;
        }
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v30 = v20;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v75;
          while (2)
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v75 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
              objc_msgSend(v35, "searching_fileProviderDomain");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "isEnterpriseDomain");

              if (v37)
                v38 = v69 == 1;
              else
                v38 = 0;
              if (!v38)
              {
                objc_msgSend(v35, "searching_fileProviderDomain");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "isEnterpriseDomain");

                if ((v40 & 1) != 0 || v69 == 1)
                  continue;
              }
              v54 = v35;

              v8 = v61;
LABEL_69:
              v9 = v64;
              goto LABEL_72;
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
            if (v32)
              continue;
            break;
          }
        }
        v15 = v68;
      }
      v12 = v60;

LABEL_46:
      v8 = v61;
      v9 = v64;
      v13 = v59;
LABEL_47:
      if (v15)
      {
        v54 = v15;

        goto LABEL_73;
      }
      v41 = *MEMORY[0x24BE2DF90];
      if (!*MEMORY[0x24BE2DF90])
      {
        DOCInitLogging();
        v41 = *MEMORY[0x24BE2DF90];
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v56;
        v88 = v66;
        _os_log_debug_impl(&dword_209052000, v41, OS_LOG_TYPE_DEBUG, "Wanted to use %@, but it isn't available", buf, 0xCu);
      }
      if (++v14 == v67)
      {
        v67 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
        if (v67)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v9, "allValues");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2DEF8], "defaultPermission");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "defaultFileProviderForAppBundle:", v65);
  v44 = objc_claimAutoreleasedReturnValue();

  v68 = (void *)v44;
  if (v44)
  {
    v64 = v9;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v45 = v42;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v71;
      while (2)
      {
        for (k = 0; k != v47; ++k)
        {
          if (*(_QWORD *)v71 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
          objc_msgSend(v50, "searching_fileProviderDomain");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "topLevelBundleIdentifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "isEqualToString:", v44);

          if ((v53 & 1) != 0)
          {
            v54 = v50;
            v10 = v45;

            goto LABEL_69;
          }
          v44 = (uint64_t)v68;
        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
        if (v47)
          continue;
        break;
      }
    }

    v9 = v64;
  }
  if (objc_msgSend(v42, "count") == 1)
  {
    objc_msgSend(v42, "firstObject");
    v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = 0;
  }
  v10 = v42;
LABEL_72:

LABEL_73:
  return v54;
}

- (FPProviderDomain)searching_fileProviderDomain
{
  return (FPProviderDomain *)objc_getProperty(self, a2, 56, 1);
}

+ (id)sourceIdentifierOrderWithDefault:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  int v8;
  _QWORD *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithCapacity:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)MEMORY[0x24BE2DE30];
  if (v3)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.automatic.Local")))
    {
      v6 = (id)*v5;
      v7 = v4;
    }
    else
    {
      v7 = v4;
      v6 = v3;
    }
    objc_msgSend(v7, "addObject:", v6);
  }
  v8 = FPIsCloudDocsWithFPFSEnabled();
  v9 = (_QWORD *)MEMORY[0x24BE2DE10];
  if (!v8)
    v9 = (_QWORD *)MEMORY[0x24BE2DE20];
  objc_msgSend(v4, "addObject:", *v9);
  objc_msgSend(v4, "addObject:", *v5);

  return v4;
}

+ (void)defaultSourceForBundleIdentifier:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "defaultSourceIdentifierForBundleIdentifier:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultSourceForBundleIdentifier:selectedSourceIdentifier:completionBlock:", v7, v8, v6);

}

+ (id)defaultSourceIdentifierForBundleIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCF50]);
  v6 = (void *)objc_msgSend(v5, "initWithSuiteName:", *MEMORY[0x24BE2DDF8]);
  objc_msgSend(v6, "valueForKey:", CFSTR("DOCDefaultFileProviderIdentifierKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.automatic.Local")))
      {
        objc_msgSend(a1, "setDefaultSourceIdentifier:forBundleIdentifier:", CFSTR("com.apple.automatic.Local"), v4);
        v9 = CFSTR("com.apple.automatic.Local");
      }
      else
      {
        v11 = (__CFString *)*MEMORY[0x24BE2DE30];
        if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE2DE30]))
        {
          objc_msgSend(v6, "valueForKey:", CFSTR("DOCDefaultFileProviderAutomaticKey"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (objc_msgSend(v12, "containsObject:", v4))
                v11 = CFSTR("com.apple.automatic.Local");
            }
          }
          v10 = v11;

          goto LABEL_14;
        }
        v9 = v8;
      }
      v10 = v9;
LABEL_14:

      goto LABEL_15;
    }
  }
  v10 = 0;
LABEL_15:

  return v10;
}

+ (void)defaultSourceForBundleIdentifier:(id)a3 selectedSourceIdentifier:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  NSObject *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[3];
  char v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_group_create();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__0;
  v35[4] = __Block_byref_object_dispose__0;
  v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__0;
  v33[4] = __Block_byref_object_dispose__0;
  v34 = 0;
  dispatch_group_enter(v11);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__0;
  v31[4] = __Block_byref_object_dispose__0;
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke;
  v23[3] = &unk_24C0F1328;
  v27 = v37;
  v28 = v33;
  v29 = v35;
  v30 = a1;
  v13 = v8;
  v24 = v13;
  v14 = v9;
  v25 = v14;
  v15 = v11;
  v26 = v15;
  objc_msgSend(a1, "startSearchingSourcesForBundleIdentifier:updateBlock:", v13, v23);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_49;
  v18[3] = &unk_24C0F1350;
  v19 = v10;
  v20 = v35;
  v21 = v33;
  v22 = v31;
  v17 = v10;
  dispatch_group_notify(v15, v16, v18);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

}

+ (id)startSearchingSourcesForBundleIdentifier:(id)a3 updateBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  DOCSourceSearchingContext *v11;
  DOCSourceSearchingContext *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDC82F8];
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke;
  v17 = &unk_24C0F1300;
  v18 = v5;
  v19 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "beginMonitoringProviderDomainChangesWithHandler:", &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [DOCSourceSearchingContext alloc];
  v12 = -[DOCSourceSearchingContext initWithMonitoringContext:](v11, "initWithMonitoringContext:", v10, v14, v15, v16, v17);

  return v12;
}

void __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  DOCSearchingDocumentSource *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "providerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE2DE40]) & 1) != 0
    || (objc_msgSend(v25, "canDisconnect") & 1) != 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v25, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((DOCProviderDomainIDIsRemovable() & 1) != 0)
    goto LABEL_4;
  v6 = objc_msgSend(v25, "isHidden");

  if ((v6 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x24BE2DEF8], "defaultPermission");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE2DEF8], "defaultPermission");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHostIdentifier:", v8);

  objc_msgSend(MEMORY[0x24BE2DEF8], "defaultPermission");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "canHostAppPerformAction:fileProviderDomain:", 0, v25);

  objc_msgSend(MEMORY[0x24BE2DEF8], "defaultPermission");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHostIdentifier:", v4);

  if ((_DWORD)v9)
  {
    if (objc_msgSend(v25, "supportsEnumeration"))
    {
      if (objc_msgSend(v25, "isEnabled"))
      {
        if ((objc_msgSend(v25, "isHidden") & 1) == 0 && (objc_msgSend(v25, "needsAuthentication") & 1) == 0)
        {
          objc_msgSend(v25, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = DOCProviderDomainIDIsDefaultSharedServer();

          if ((v13 & 1) == 0)
          {
            if ((objc_msgSend(v25, "isAvailableSystemWide") & 1) != 0
              || (objc_msgSend(v25, "topLevelBundleIdentifier"),
                  v14 = (void *)objc_claimAutoreleasedReturnValue(),
                  v15 = objc_msgSend(v14, "isEqualToString:", *(_QWORD *)(a1 + 32)),
                  v14,
                  v15))
            {
              objc_msgSend(v25, "extensionBundleURL");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDC1528], "doc_applicationExtensionRecordAtURL:", v5);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "infoDictionary");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_opt_class();
              objc_msgSend(v17, "objectForKey:ofClass:valuesOfClass:", CFSTR("NSExtension"), v18, objc_opt_class());
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v19, "objectForKey:", CFSTR("NSExtensionFileProviderCanBeDefaultLocation"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = v20;
              if (!v20 || objc_msgSend(v20, "BOOLValue"))
              {
                v22 = *(void **)(a1 + 40);
                v23 = -[DOCSearchingDocumentSource initWithProviderDomain:]([DOCSearchingDocumentSource alloc], "initWithProviderDomain:", v25);
                objc_msgSend(v25, "identifier");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setValue:forKey:", v23, v24);

              }
LABEL_4:

            }
          }
        }
      }
    }
  }
LABEL_5:

LABEL_6:
}

+ (void)setDefaultSource:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setDefaultSourceIdentifier:forBundleIdentifier:", v7, v6);

}

uint64_t __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_49(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    return +[DOCDocumentSource endSearchingSources:](DOCDocumentSource, "endSearchingSources:");
  return result;
}

+ (void)setDefaultSourceIdentifier:(id)a3 forBundleIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  dispatch_time_t v14;
  __CFString *v15;

  v15 = (__CFString *)a3;
  v5 = a4;
  v6 = objc_alloc(MEMORY[0x24BDBCF50]);
  v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x24BE2DDF8]);
  objc_msgSend(v7, "valueForKey:", CFSTR("DOCDefaultFileProviderIdentifierKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("DOCDefaultFileProviderAutomaticKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v10 = objc_msgSend(v8, "mutableCopy");
  else
    v10 = objc_opt_new();
  v11 = (void *)v10;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v12 = objc_msgSend(v9, "mutableCopy");
  else
    v12 = objc_opt_new();
  v13 = (void *)v12;
  if (CFSTR("com.apple.automatic.Local") == v15)
  {
    objc_msgSend(v11, "setValue:forKey:", *MEMORY[0x24BE2DE30], v5);
    if ((objc_msgSend(v13, "containsObject:", v5) & 1) == 0)
      objc_msgSend(v13, "addObject:", v5);
  }
  else
  {
    objc_msgSend(v11, "setValue:forKey:", v15, v5);
    objc_msgSend(v13, "removeObject:", v5);
  }
  objc_msgSend(v7, "setValue:forKey:", v11, CFSTR("DOCDefaultFileProviderIdentifierKey"));
  objc_msgSend(v7, "setValue:forKey:", v13, CFSTR("DOCDefaultFileProviderAutomaticKey"));
  notify_post((const char *)DOCDefaultSaveLocationDidChangeNotification);
  v14 = dispatch_time(0, 100000000);
  dispatch_after(v14, MEMORY[0x24BDAC9B8], &__block_literal_global_3);

}

uint64_t __84__DOCDocumentSource_SearchInternal__setDefaultSourceIdentifier_forBundleIdentifier___block_invoke()
{
  return notify_post((const char *)DOCUserPickedNewDefaultSaveLocationNotification);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCDocumentSource)initWithCoder:(id)a3
{
  id v4;
  DOCDocumentSource *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  DOCDocumentSource *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DOCDocumentSource;
  v5 = -[DOCDocumentSource init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCDocumentSource setDisplayName:](v5, "setDisplayName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCDocumentSource setProviderName:](v5, "setProviderName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCDocumentSource setDomainName:](v5, "setDomainName:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCDocumentSource setIdentifier:](v5, "setIdentifier:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promptText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCDocumentSource setPromptText:](v5, "setPromptText:", v10);

    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("iconsBySize"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCDocumentSource setIconsBySize:](v5, "setIconsBySize:", v15);

    v16 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", self->_identifier);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[DOCDocumentSource displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DOCDocumentSource displayName](self, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("displayName"));

  }
  -[DOCDocumentSource providerName](self, "providerName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DOCDocumentSource providerName](self, "providerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("providerName"));

  }
  -[DOCDocumentSource domainName](self, "domainName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DOCDocumentSource domainName](self, "domainName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("domainName"));

  }
  -[DOCDocumentSource identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DOCDocumentSource identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("identifier"));

  }
  -[DOCDocumentSource promptText](self, "promptText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DOCDocumentSource identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("promptText"));

  }
  -[DOCDocumentSource iconsBySize](self, "iconsBySize");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DOCDocumentSource iconsBySize](self, "iconsBySize");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("iconsBySize"));

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  -[DOCDocumentSource sanitizedSource](self, "sanitizedSource", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)sanitizedSource
{
  DOCDocumentSource *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(DOCDocumentSource);
  -[DOCDocumentSource displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCDocumentSource setDisplayName:](v3, "setDisplayName:", v4);

  -[DOCDocumentSource providerName](self, "providerName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCDocumentSource setProviderName:](v3, "setProviderName:", v5);

  -[DOCDocumentSource domainName](self, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCDocumentSource setDomainName:](v3, "setDomainName:", v6);

  -[DOCDocumentSource identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCDocumentSource setIdentifier:](v3, "setIdentifier:", v7);

  -[DOCDocumentSource iconsBySize](self, "iconsBySize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCDocumentSource setIconsBySize:](v3, "setIconsBySize:", v8);

  return v3;
}

- (BOOL)usesEnumeration
{
  return 1;
}

- (BOOL)isAvailableSystemWide
{
  return 1;
}

- (unint64_t)status
{
  return 2;
}

- (NSArray)supportedSearchFilters
{
  return 0;
}

- (BOOL)appearsInMoveUI
{
  return 0;
}

- (BOOL)isiCloudBased
{
  return 0;
}

- (id)iconForSize:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  -[DOCDocumentSource iconsBySize](self, "iconsBySize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[DOCDocumentSource iconsBySize](self, "iconsBySize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DOCDocumentSource setIconsBySize:](self, "setIconsBySize:", v9);

    }
    -[DOCDocumentSource loadIconForSize:](self, "loadIconForSize:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (id)objc_opt_new();
    v7 = v12;

    -[DOCDocumentSource iconsBySize](self, "iconsBySize");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, v14);

  }
  v15 = v7;

  return v15;
}

- (id)loadIconForSize:(int64_t)a3
{
  NSObject **v3;
  NSObject *v4;

  v3 = (NSObject **)MEMORY[0x24BE2DFF0];
  v4 = *MEMORY[0x24BE2DFF0];
  if (!*MEMORY[0x24BE2DFF0])
  {
    DOCInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[DOCDocumentSource loadIconForSize:].cold.1(v4);
  return 0;
}

+ (id)iconForFileProvider:(id)a3 size:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[DOCIconService shared](DOCIconService, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconForFileProvider:size:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)applicationIconForBundleIdentifier:(id)a3 size:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  if (a4 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCDocumentSource.m"), 191, CFSTR("Invalid icon size %@"), v9);

  }
  else if (a4 == 1)
  {
    a4 = 2;
  }
  else
  {
    a4 = 0;
  }
  v10 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  objc_msgSend(v10, "_applicationIconImageForBundleIdentifier:format:scale:", v7, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)providerName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProviderName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)documentContentTypes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)domainName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDomainName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (NSMutableDictionary)iconsBySize
{
  return self->_iconsBySize;
}

- (void)setIconsBySize:(id)a3
{
  objc_storeStrong((id *)&self->_iconsBySize, a3);
}

void __85__DOCDocumentSource_Searching__startSearchingSourcesForBundleIdentifier_updateBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209052000, a2, a3, "Error while trying to search sources. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_209052000, log, OS_LOG_TYPE_ERROR, "Error: could not find a valid source for %@ (sourcesByID: %@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __111__DOCDocumentSource_SearchInternal__defaultSourceForBundleIdentifier_selectedSourceIdentifier_completionBlock___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_209052000, a2, a3, "Error while trying to search the default source. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)loadIconForSize:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = 138412290;
  v3 = objc_opt_class();
  _os_log_fault_impl(&dword_209052000, v1, OS_LOG_TYPE_FAULT, "%@ must implement -loadIconForSize:", (uint8_t *)&v2, 0xCu);

}

@end
