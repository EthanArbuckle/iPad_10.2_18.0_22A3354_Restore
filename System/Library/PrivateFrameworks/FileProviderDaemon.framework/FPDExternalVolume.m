@implementation FPDExternalVolume

- (FPDExternalVolume)initWithStatFS:(const statfs *)a3 knownRole:(unsigned int)a4 volumeManager:(id)a5
{
  FPDExternalVolume *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *domainPlistNames;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *linkQueue;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FPDExternalVolume;
  v5 = -[FPDVolume initWithStatFS:knownRole:volumeManager:](&v18, sel_initWithStatFS_knownRole_volumeManager_, a3, *(_QWORD *)&a4, a5);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    domainPlistNames = v5->_domainPlistNames;
    v5->_domainPlistNames = v6;

    v8 = (void *)MEMORY[0x1E0CB3940];
    -[FPDVolume uuid](v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("volume %@: link queue"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    linkQueue = v5->_linkQueue;
    v5->_linkQueue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

- (BOOL)isDefaultVolume
{
  return 0;
}

- (id)_loadDomainPropertiesAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v12;
  uint8_t buf[15];
  char v14;

  v5 = a3;
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "fp_dataWithContentsOfURL:enforceSignatureCheck:shouldUpdateXattr:error:", v5, 1, &v14, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (v14)
    {
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_INFO, "[INFO] signature update is needed", buf, 2u);
      }

      v12 = 0;
      objc_msgSend(v6, "fp_writeToURL:withSignature:options:error:", v5, 1, 1, &v12);
      v8 = v12;
      if (!v8)
      {
        fp_current_or_default_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[FPDExternalVolume _loadDomainPropertiesAtURL:error:].cold.1(v9);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)readDomainsPropertiesUnderDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  FPDExternalVolume *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  __int128 v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v37;
  void *v38;
  uint64_t v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, void *, void *);
  void *v58;
  id v59;
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  _QWORD v66[5];

  v66[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  objc_msgSend(CFSTR("Domains.plist"), "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("Domains.plist"), "pathExtension");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C99A18];
  v39 = *MEMORY[0x1E0C99A90];
  v66[0] = *MEMORY[0x1E0C99A90];
  v66[1] = v7;
  v42 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = MEMORY[0x1E0C809B0];
  v56 = 3221225472;
  v57 = __68__FPDExternalVolume_readDomainsPropertiesUnderDirectoryAtURL_error___block_invoke;
  v58 = &unk_1E8C76288;
  v59 = v4;
  v32 = v59;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v9;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
  if (v43)
  {
    v41 = *(_QWORD *)v52;
    *(_QWORD *)&v10 = 138412546;
    v31 = v10;
    v33 = v5;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D17D1B04]();
        v50 = 0;
        v14 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v50, v42, 0);
        v15 = v50;
        v16 = v15;
        if (v14 && objc_msgSend(v15, "BOOLValue"))
        {
          v49 = 0;
          v17 = objc_msgSend(v12, "getResourceValue:forKey:error:", &v49, v39, 0);
          v18 = v49;
          v19 = v18;
          if (v17)
          {
            if (objc_msgSend(v18, "hasPrefix:", v5))
            {
              objc_msgSend(v19, "pathExtension");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "isEqualToString:", v38);

              if (v21)
              {
                v48 = 0;
                -[FPDExternalVolume _loadDomainPropertiesAtURL:error:](self, "_loadDomainPropertiesAtURL:error:", v12, &v48);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = v48;
                if (v22)
                {
                  objc_msgSend(v34, "addEntriesFromDictionary:", v22);
                  v23 = self;
                  objc_sync_enter(v23);
                  v44 = 0u;
                  v45 = 0u;
                  v46 = 0u;
                  v47 = 0u;
                  v35 = v22;
                  v24 = v22;
                  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
                  if (v25)
                  {
                    v26 = *(_QWORD *)v45;
                    do
                    {
                      for (i = 0; i != v25; ++i)
                      {
                        if (*(_QWORD *)v45 != v26)
                          objc_enumerationMutation(v24);
                        -[NSMutableDictionary setObject:forKey:](v23->_domainPlistNames, "setObject:forKey:", v19, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), v31);
                      }
                      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
                    }
                    while (v25);
                  }

                  v5 = v33;
                  v22 = v35;
                  objc_sync_exit(v23);
                }
                else
                {
                  fp_current_or_default_log();
                  v23 = (FPDExternalVolume *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v12, "fp_shortDescription");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v37, "fp_prettyDescription");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = v31;
                    v62 = v28;
                    v63 = 2112;
                    v64 = v29;
                    _os_log_error_impl(&dword_1CF55F000, &v23->super.super, OS_LOG_TYPE_ERROR, "[ERROR] Unable to load domain properties from plist at '%@': %@", buf, 0x16u);

                  }
                }

              }
            }
          }

        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v11 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v65, 16);
    }
    while (v43);
  }

  return v34;
}

uint64_t __68__FPDExternalVolume_readDomainsPropertiesUnderDirectoryAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fp_shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fp_prettyDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315906;
    v13 = "-[FPDExternalVolume readDomainsPropertiesUnderDirectoryAtURL:error:]_block_invoke";
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_error_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_ERROR, "[ERROR] %s unable to enumerate dir at '%@' (%@): %@", (uint8_t *)&v12, 0x2Au);

  }
  return 1;
}

- (BOOL)_storeDomainProperties:(id)a3 atURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  char v12;

  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "fp_writeToURL:withSignature:options:error:", v9, 1, a5, a6);
  else
    v12 = 0;

  return v12;
}

- (BOOL)writeDomainsProperties:(id)a3 underDirectoryAtURL:(id)a4 error:(id *)a5
{
  id v7;
  FPDExternalVolume *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  uint64_t v34;
  uint64_t v35;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v37 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v10)
  {
    v35 = *(_QWORD *)v43;
    while (2)
    {
      v34 = v10;
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v43 != v35)
          objc_enumerationMutation(v9);
        v12 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        v47 = v12;
        objc_msgSend(v9, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKey:](v8->_domainPlistNames, "objectForKey:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v8->_domainPlistNames, "objectForKeyedSubscript:", v12);
          v16 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "URLByAppendingPathComponent:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v16) = -[FPDExternalVolume _storeDomainProperties:atURL:options:error:](v8, "_storeDomainProperties:atURL:options:error:", v14, v17, 1, a5);
          if ((v16 & 1) == 0)
            goto LABEL_24;
        }
        else
        {
          objc_msgSend(CFSTR("Domains.plist"), "stringByDeletingPathExtension");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("Domains.plist"), "pathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@.%@"), v18, v12, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "URLByAppendingPathComponent:isDirectory:", v20, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[FPDExternalVolume _storeDomainProperties:atURL:options:error:](v8, "_storeDomainProperties:atURL:options:error:", v14, v21, 1, a5))
          {

LABEL_24:
            objc_sync_exit(v8);
            v32 = 0;
            goto LABEL_25;
          }
          -[NSMutableDictionary setObject:forKey:](v8->_domainPlistNames, "setObject:forKey:", v20, v12);

        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v10)
        continue;
      break;
    }
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NSMutableDictionary allKeys](v8->_domainPlistNames, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v22);
        v26 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v9, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 == 0;

        if (v28)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](v8->_domainPlistNames, "objectForKeyedSubscript:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "URLByAppendingPathComponent:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "removeItemAtURL:error:", v30, 0);

          -[NSMutableDictionary removeObjectForKey:](v8->_domainPlistNames, "removeObjectForKey:", v26);
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v23);
  }

  objc_sync_exit(v8);
  v32 = 1;
LABEL_25:

  return v32;
}

- (void)removeBrokenEbihilLinksFromRoot
{
  if (FPFeatureFlagEbihilIsEnabled())
    fp_dispatch_async_with_logs();
}

void __52__FPDExternalVolume_removeBrokenEbihilLinksFromRoot__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E98];
  v5 = *(void **)(a1 + 32);
  v4 = (uint64_t *)(a1 + 32);
  objc_msgSend(v5, "root");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, MEMORY[0x1E0C9AA60], 0, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;

  if (v9)
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __52__FPDExternalVolume_removeBrokenEbihilLinksFromRoot__block_invoke_cold_1(v4, v9, v10);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v8;
    v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v11)
    {
      v12 = v11;
      v9 = 0;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i));
          objc_msgSend(v15, "fileSystemRepresentation");
          if (fpfs_root_exposure_symlink_xattr_exists())
          {
            objc_msgSend(v15, "path");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v2, "fileExistsAtPath:", v16);

            if ((v17 & 1) == 0)
            {

              v21 = 0;
              objc_msgSend(v2, "removeItemAtURL:error:", v15, &v21);
              v9 = v21;
              if (v9)
              {
                fp_current_or_default_log();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v15, "fp_shortDescription");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v9, "fp_prettyDescription");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v28 = v19;
                  v29 = 2114;
                  v30 = v20;
                  _os_log_error_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_ERROR, "[ERROR] Failed to remove broken domain link %{public}@ with error: %{public}@", buf, 0x16u);

                }
              }
            }
          }
        }
        v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v12);
    }
    else
    {
      v9 = 0;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkQueue, 0);
  objc_storeStrong((id *)&self->_domainPlistNames, 0);
}

- (void)_loadDomainPropertiesAtURL:(NSObject *)a1 error:.cold.1(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(0, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1CF55F000, a1, OS_LOG_TYPE_ERROR, "[ERROR] failed to update to newer signature: %@", (uint8_t *)&v3, 0xCu);

}

void __52__FPDExternalVolume_removeBrokenEbihilLinksFromRoot__block_invoke_cold_1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1CF55F000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Unable to list root of volume %{public}@ got error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
