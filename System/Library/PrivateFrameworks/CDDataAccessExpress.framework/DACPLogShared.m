@implementation DACPLogShared

+ (DACPLogShared)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__DACPLogShared_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (DACPLogShared *)(id)shared_sharedInstance;
}

void __23__DACPLogShared_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_sharedInstance;
  shared_sharedInstance = v0;

}

- (DACPLogShared)init
{
  DACPLogShared *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *UUIDToFileMap;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DACPLogShared;
  v2 = -[DACPLogShared init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    UUIDToFileMap = v2->_UUIDToFileMap;
    v2->_UUIDToFileMap = v3;

  }
  return v2;
}

- (BOOL)_array:(id)a3 beginsWithArray:(id)a4 outRemainingArray:(id *)a5
{
  id v7;
  id v8;
  int v9;
  BOOL v10;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "DACPLogArrayBeginsWithArray:", v8);
  v10 = v9;
  if (a5 && v9)
  {
    objc_msgSend(v7, "DACPLogSubarrayFromIndexToEndOfArray:", objc_msgSend(v8, "count"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)_getUUIDForFolder:(id)a3 baseName:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  uid_t v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t i;
  void *v19;
  id v20;
  char *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  char *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  char *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  id v41;
  id v43;
  void *v44;
  void *v45;
  char *v46;
  _QWORD block[4];
  char *v48;
  DACPLogShared *v49;
  id v50;
  uint64_t *v51;
  uint8_t *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint8_t buf[8];
  uint8_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  uint8_t v66[4];
  char *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v46 = (char *)a3;
  v43 = a4;
  DALoggingwithCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1D11000, v5, OS_LOG_TYPE_INFO, "Handling getUUIDForPath", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v61 = buf;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__0;
  v64 = __Block_byref_object_dispose__0;
  v65 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  if (_getUUIDForFolder_baseName__onceToken != -1)
    dispatch_once(&_getUUIDForFolder_baseName__onceToken, &__block_literal_global_79);
  DALoggingwithCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v66 = 138412290;
    v67 = v46;
    _os_log_impl(&dword_1C1D11000, v6, OS_LOG_TYPE_INFO, "Testing requested log folder %@", v66, 0xCu);
  }

  v7 = geteuid();
  _homeDirectoryPathComponentsForUID(v7);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(v46, "pathComponents");
    v8 = objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v9 = -[DACPLogShared _array:beginsWithArray:outRemainingArray:](self, "_array:beginsWithArray:outRemainingArray:", v8, &unk_1E7BA40B8, &v55);
    v10 = v55;
    v11 = v10;
    v45 = (void *)v8;
    if (!v9)
    {
      v54 = v10;
      v12 = -[DACPLogShared _array:beginsWithArray:outRemainingArray:](self, "_array:beginsWithArray:outRemainingArray:", v8, &unk_1E7BA40D0, &v54);
      v13 = v54;

      if (v12)
      {
        v11 = v13;
      }
      else
      {
        v53 = v13;
        v15 = -[DACPLogShared _array:beginsWithArray:outRemainingArray:](self, "_array:beginsWithArray:outRemainingArray:", v45, &unk_1E7BA40E8, &v53);
        v41 = v53;

        if (!v15)
        {
          v16 = v45;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v45, "count"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          for (i = 1; i - 1 < (unint64_t)objc_msgSend(v16, "count", v41); ++i)
          {
            objc_msgSend(v16, "objectAtIndexedSubscript:", i - 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v19);
            objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v17);
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v21 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v20, "fileSystemRepresentation"), 0);

            if (v21)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "pathComponents");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "isEqualToArray:", v44);

              if (v24)
              {
                DALoggingwithCategory(0);
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v66 = 136315138;
                  v67 = v21;
                  _os_log_impl(&dword_1C1D11000, v26, OS_LOG_TYPE_INFO, "Matched client home directory: %s", v66, 0xCu);
                }

                if (i - 1 >= (unint64_t)(objc_msgSend(v45, "count") - 1))
                {
                  v11 = (void *)MEMORY[0x1E0C9AA60];
                }
                else
                {
                  objc_msgSend(v45, "subarrayWithRange:", i, objc_msgSend(v45, "count") - i);
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                }

                free(v21);
                goto LABEL_31;
              }
              free(v21);
            }

            v16 = v45;
          }

          DALoggingwithCategory(0);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v66 = 138412290;
            v67 = v46;
            _os_log_impl(&dword_1C1D11000, v25, OS_LOG_TYPE_ERROR, "The path %@ does not begin with the caller's home directory.", v66, 0xCu);
          }

          *((_BYTE *)v57 + 24) = 1;
          v11 = v41;
          goto LABEL_46;
        }
        v11 = v41;
      }
    }
LABEL_31:
    DALoggingwithCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v66 = 138412290;
      v67 = (char *)v11;
      _os_log_impl(&dword_1C1D11000, v27, OS_LOG_TYPE_INFO, "Requested path into client home directory: %@", v66, 0xCu);
    }

    if ((unint64_t)objc_msgSend(v11, "count") >= 2)
    {
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v28, "isEqualToString:", CFSTR("Library")) & 1) != 0)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("Logs"));

        if ((v30 & 1) != 0)
        {
          objc_msgSend((id)_getUUIDForFolder_baseName__homeDirComponents, "arrayByAddingObjectsFromArray:", v11);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v31);
          v32 = (char *)objc_claimAutoreleasedReturnValue();
          DALoggingwithCategory(0);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v66 = 138412290;
            v67 = v32;
            _os_log_impl(&dword_1C1D11000, v33, OS_LOG_TYPE_INFO, "Resolved log file folder to %@", v66, 0xCu);
          }

          if (objc_msgSend(v32, "length")
            && objc_msgSend(v32, "characterAtIndex:", objc_msgSend(v32, "length") - 1) == 47)
          {
            objc_msgSend(v32, "substringToIndex:", objc_msgSend(v32, "length") - 1);
            v34 = objc_claimAutoreleasedReturnValue();

            v32 = (char *)v34;
          }
          _fileOpsQueue();
          v35 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __44__DACPLogShared__getUUIDForFolder_baseName___block_invoke_100;
          block[3] = &unk_1E7B9D620;
          v51 = &v56;
          v48 = v32;
          v49 = self;
          v50 = v43;
          v52 = buf;
          v36 = v32;
          dispatch_sync(v35, block);

LABEL_46:
          goto LABEL_47;
        }
      }
      else
      {

      }
    }
    DALoggingwithCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v66 = 138412290;
      v67 = v46;
      _os_log_impl(&dword_1C1D11000, v37, OS_LOG_TYPE_ERROR, "Log folder: “%@” must begin with /Library/Logs in the user’s home directory.", v66, 0xCu);
    }

    *((_BYTE *)v57 + 24) = 1;
    goto LABEL_46;
  }
  DALoggingwithCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v66 = 0;
    _os_log_impl(&dword_1C1D11000, v14, OS_LOG_TYPE_ERROR, "Could not resolve client home directory. Not granting access to write logs.", v66, 2u);
  }

  *((_BYTE *)v57 + 24) = 1;
LABEL_47:

  if (*((_BYTE *)v57 + 24))
  {
    DALoggingwithCategory(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v66 = 138412546;
      v67 = v46;
      v68 = 2112;
      v69 = v43;
      _os_log_impl(&dword_1C1D11000, v38, OS_LOG_TYPE_ERROR, "Get UUID for for folder resulted in an error. Folder: %@. Basename: %@.", v66, 0x16u);
    }

  }
  v39 = *((id *)v61 + 5);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(buf, 8);

  return v39;
}

void __44__DACPLogShared__getUUIDForFolder_baseName___block_invoke()
{
  uid_t v0;
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  v0 = getuid();
  _homeDirectoryPathComponentsForUID(v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_getUUIDForFolder_baseName__homeDirComponents;
  _getUUIDForFolder_baseName__homeDirComponents = v1;

  if (!_getUUIDForFolder_baseName__homeDirComponents)
  {
    DALoggingwithCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C1D11000, v3, OS_LOG_TYPE_DEFAULT, "Could not resolve home directory. Falling back to /var/mobile.", v6, 2u);
    }

    objc_msgSend(CFSTR("/var/mobile"), "pathComponents");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_getUUIDForFolder_baseName__homeDirComponents;
    _getUUIDForFolder_baseName__homeDirComponents = v4;

  }
}

void __44__DACPLogShared__getUUIDForFolder_baseName___block_invoke_100(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  DACPLogDFile *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  char v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];

  v41[1] = *MEMORY[0x1E0C80C00];
  v34 = 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:isDirectory:", a1[4], &v34) & 1) != 0)
  {
    if (!v34)
    {
      DALoggingwithCategory(0);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v4 = a1[4];
        *(_DWORD *)buf = 138412290;
        v37 = v4;
        _os_log_impl(&dword_1C1D11000, v3, OS_LOG_TYPE_ERROR, "Folder path %@ does not refer to a directory.", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
      goto LABEL_26;
    }
  }
  else
  {
    v40 = *MEMORY[0x1E0CB2AA8];
    v41[0] = &unk_1E7BA4048;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    v33 = 0;
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, v5, &v33);
    v8 = v33;

    DALoggingwithCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = a1[4];
        *(_DWORD *)buf = 138412546;
        v37 = v11;
        v38 = 2112;
        v39 = v8;
        _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_ERROR, "Could not create directory %@. Error: %@", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
      goto LABEL_26;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = a1[4];
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_INFO, "Created directory at path: %@", buf, 0xCu);
    }

  }
  v28 = v2;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = (DACPLogDFile *)*(id *)(a1[5] + 8);
  v14 = -[DACPLogDFile countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1[5] + 8), "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "folder");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "isEqualToString:", a1[4]) & 1) != 0)
        {
          objc_msgSend(v19, "baseName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", a1[6]);

          if (v22)
          {
            objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v18);

            goto LABEL_25;
          }
        }
        else
        {

        }
      }
      v15 = -[DACPLogDFile countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v15);
  }

  v13 = -[DACPLogDFile initWithFolder:baseName:]([DACPLogDFile alloc], "initWithFolder:baseName:", a1[4], a1[6]);
  v23 = *(void **)(a1[5] + 8);
  -[DACPLogDFile UUID](v13, "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v13, v24);

  -[DACPLogDFile UUID](v13, "UUID");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(a1[8] + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

LABEL_25:
  v2 = v28;
LABEL_26:

}

- (BOOL)_logData:(id)a3 UUID:(id)a4 startNewFile:(BOOL)a5 sizeCheck:(int64_t)a6 wantsCompressed:(BOOL)a7 maxFileCount:(int64_t)a8 outDidCreateNewFile:(BOOL *)a9 outNewFilePath:(id *)a10
{
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  BOOL v22;
  _QWORD block[5];
  id v27;
  id v28;
  uint64_t *v29;
  uint8_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  int64_t v33;
  int64_t v34;
  BOOL v35;
  BOOL v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint8_t v55[4];
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  DALoggingwithCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1D11000, v16, OS_LOG_TYPE_INFO, "Handling logData", buf, 2u);
  }

  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  *(_QWORD *)buf = 0;
  v38 = buf;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__0;
  v41 = __Block_byref_object_dispose__0;
  v42 = 0;
  _fileOpsQueue();
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__DACPLogShared__logData_UUID_startNewFile_sizeCheck_wantsCompressed_maxFileCount_outDidCreateNewFile_outNewFilePath___block_invoke;
  block[3] = &unk_1E7B9D648;
  block[4] = self;
  v18 = v15;
  v27 = v18;
  v29 = &v47;
  v30 = buf;
  v35 = a5;
  v31 = &v43;
  v32 = &v51;
  v19 = v14;
  v28 = v19;
  v36 = a7;
  v33 = a6;
  v34 = a8;
  dispatch_sync(v17, block);

  if (*((_BYTE *)v52 + 24))
  {
    DALoggingwithCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v55 = 138412290;
      v56 = v18;
      _os_log_impl(&dword_1C1D11000, v20, OS_LOG_TYPE_ERROR, "Log data resulted in an error. UUID: %@.", v55, 0xCu);
    }

  }
  else
  {
    *((_BYTE *)v48 + 24) ^= 1u;
    if (a9)
      *a9 = *((_BYTE *)v44 + 24);
    if (a10)
    {
      v21 = (void *)*((_QWORD *)v38 + 5);
      if (v21)
        *a10 = objc_retainAutorelease(v21);
    }
  }
  v22 = *((_BYTE *)v48 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v22;
}

void __118__DACPLogShared__logData_UUID_startNewFile_sizeCheck_wantsCompressed_maxFileCount_outDidCreateNewFile_outNewFilePath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19[2];
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    DALoggingwithCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C1D11000, v7, OS_LOG_TYPE_ERROR, "Cannot find UUID. Asking client to retry.", buf, 2u);
    }

    v8 = *(_QWORD *)(a1 + 56);
    goto LABEL_11;
  }
  if (!*(_BYTE *)(a1 + 104))
  {
    if (*(uint64_t *)(a1 + 88) < 1)
    {
      v9 = 0;
    }
    else
    {
      v19[1] = 0;
      objc_msgSend(v2, "checkForMaximumFileSize:wantsCompressed:outDidCreateNewFile:outNewFilePath:");
      v9 = 0;
    }
    buf[0] = 0;
    v10 = *(_QWORD *)(a1 + 48);
    v19[0] = 0;
    v11 = objc_msgSend(v3, "logData:outDidCreateNewFile:outNewFilePath:", v10, buf, v19);
    v12 = v19[0];
    v13 = v12;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v11 ^ 1;
    if (buf[0])
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v14 = v12;

      v9 = v14;
    }
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v9;
    v17 = v9;

    goto LABEL_16;
  }
  objc_msgSend(v2, "startNewFile");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v8 = *(_QWORD *)(a1 + 80);
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) = 1;
    goto LABEL_19;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v3, "logData:outDidCreateNewFile:outNewFilePath:", *(_QWORD *)(a1 + 48), 0, 0) ^ 1;
LABEL_16:
  v18 = *(_QWORD *)(a1 + 96);
  if (v18 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    objc_msgSend(v3, "cullFilesMaxFileCount:", v18 - 1);
LABEL_19:

}

- (BOOL)_slurpToFileUUID:(id)a3 slurpeeFileDescriptor:(int)a4 prefix:(id)a5 suffix:(id)a6 startNewFile:(BOOL)a7 sizeCheck:(int64_t)a8 wantsCompressed:(BOOL)a9 maxLogFileCount:(int)a10 outDidCreateNewFile:(BOOL *)a11 outNewFilePath:(id *)a12
{
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  int64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  BOOL v31;
  void *v33;
  void *v34;
  _QWORD block[5];
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  uint8_t *v41;
  uint64_t *v42;
  int64_t v43;
  int v44;
  int v45;
  BOOL v46;
  BOOL v47;
  uint8_t buf[8];
  uint8_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint8_t v66[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a5;
  v20 = a6;
  DALoggingwithCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1D11000, v21, OS_LOG_TYPE_INFO, "Handling slurpFile", buf, 2u);
  }

  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  *(_QWORD *)buf = 0;
  v49 = buf;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__0;
  v52 = __Block_byref_object_dispose__0;
  v53 = 0;
  if (v19)
  {
    objc_msgSend(v19, "dataUsingEncoding:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v34 = v19;
  if (v20)
  {
    objc_msgSend(v20, "dataUsingEncoding:", 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a4;
    v25 = a8;
  }
  else
  {
    v24 = a4;
    v25 = a8;
    v23 = 0;
  }
  _fileOpsQueue();
  v26 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __160__DACPLogShared__slurpToFileUUID_slurpeeFileDescriptor_prefix_suffix_startNewFile_sizeCheck_wantsCompressed_maxLogFileCount_outDidCreateNewFile_outNewFilePath___block_invoke;
  block[3] = &unk_1E7B9D698;
  block[4] = self;
  v36 = v18;
  v37 = v23;
  v46 = a7;
  v40 = &v62;
  v41 = buf;
  v38 = v22;
  v39 = &v58;
  v42 = &v54;
  v43 = v25;
  v47 = a9;
  v44 = v24;
  v45 = a10;
  v27 = v36;
  v28 = v22;
  v29 = v23;
  dispatch_sync(v26, block);

  if (*((_BYTE *)v63 + 24))
  {
    DALoggingwithCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v66 = 138412290;
      v67 = v27;
      _os_log_impl(&dword_1C1D11000, v30, OS_LOG_TYPE_ERROR, "Slurp to file UUID resulted in an error. UUID: %@.", v66, 0xCu);
    }

  }
  else
  {
    *((_BYTE *)v59 + 24) ^= 1u;
    if (a11)
      *a11 = *((_BYTE *)v55 + 24);
    if (a12)
    {
      v33 = (void *)*((_QWORD *)v49 + 5);
      if (v33)
        *a12 = objc_retainAutorelease(v33);
    }
  }
  v31 = *((_BYTE *)v59 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v31;
}

void __160__DACPLogShared__slurpToFileUUID_slurpeeFileDescriptor_prefix_suffix_startNewFile_sizeCheck_wantsCompressed_maxLogFileCount_outDidCreateNewFile_outNewFilePath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20[2];
  _QWORD aBlock[4];
  id v22;
  id v23;
  uint64_t v24;
  int v25;
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __160__DACPLogShared__slurpToFileUUID_slurpeeFileDescriptor_prefix_suffix_startNewFile_sizeCheck_wantsCompressed_maxLogFileCount_outDidCreateNewFile_outNewFilePath___block_invoke_102;
    aBlock[3] = &unk_1E7B9D670;
    v25 = *(_DWORD *)(a1 + 104);
    v24 = *(_QWORD *)(a1 + 72);
    v4 = v2;
    v22 = v4;
    v23 = *(id *)(a1 + 48);
    v5 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (*(_BYTE *)(a1 + 112))
    {
      objc_msgSend(v4, "startNewFile");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
LABEL_20:

        goto LABEL_21;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      v9 = *(_QWORD *)(a1 + 56);
      if (v9)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v4, "logData:outDidCreateNewFile:outNewFilePath:", v9, 0, 0) ^ 1;
      v5[2](v5);
    }
    else
    {
      if (*(uint64_t *)(a1 + 96) < 1)
      {
        v11 = 0;
      }
      else
      {
        v20[1] = 0;
        objc_msgSend(v4, "checkForMaximumFileSize:wantsCompressed:outDidCreateNewFile:outNewFilePath:");
        v11 = 0;
      }
      buf[0] = 0;
      v12 = *(_QWORD *)(a1 + 56);
      v20[0] = 0;
      v13 = objc_msgSend(v4, "logData:outDidCreateNewFile:outNewFilePath:", v12, buf, v20);
      v14 = v20[0];
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v13 ^ 1;
      v5[2](v5);
      if (buf[0])
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
        v15 = v14;

        v11 = v15;
      }
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v11;
      v18 = v11;

    }
    v19 = *(int *)(a1 + 108);
    if ((_DWORD)v19 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      objc_msgSend(v4, "cullFilesMaxFileCount:", v19 - 1);
    goto LABEL_20;
  }
  DALoggingwithCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C1D11000, v10, OS_LOG_TYPE_ERROR, "Cannot find UUID. Asking client to retry.", buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_21:

}

uint64_t __160__DACPLogShared__slurpToFileUUID_slurpeeFileDescriptor_prefix_suffix_startNewFile_sizeCheck_wantsCompressed_maxLogFileCount_outDidCreateNewFile_outNewFilePath___block_invoke_102(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  stat v7;

  if (*(_DWORD *)(a1 + 56) != -1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", *(unsigned int *)(a1 + 56), 0);
    if (v2)
    {
      memset(&v7, 0, sizeof(v7));
      if (fstat(*(_DWORD *)(a1 + 56), &v7))
      {
        v3 = 0;
      }
      else if (v7.st_size < 4096)
      {
LABEL_10:
        objc_msgSend(v2, "readDataToEndOfFile");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v3, "length"))
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= objc_msgSend(*(id *)(a1 + 32), "logData:outDidCreateNewFile:outNewFilePath:", v3, 0, 0) ^ 1;
      }
      else
      {
        v4 = 0;
        v3 = 0;
        while (1)
        {
          v5 = v3;
          objc_msgSend(v2, "readDataOfLength:", 4096);
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v3, "length"))
            break;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= objc_msgSend(*(id *)(a1 + 32), "logData:outDidCreateNewFile:outNewFilePath:", v3, 0, 0) ^ 1;
          v4 -= 4096;
          if (v7.st_size + v4 < 4096)
          {

            goto LABEL_10;
          }
        }
      }

    }
  }
  result = objc_msgSend(*(id *)(a1 + 32), "logData:outDidCreateNewFile:outNewFilePath:", *(_QWORD *)(a1 + 40), 0, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= result ^ 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDToFileMap, 0);
}

@end
