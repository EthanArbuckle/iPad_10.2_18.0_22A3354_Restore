@implementation GSStorageManager

+ (id)manager
{
  return (id)gDefaultGSManager;
}

+ (void)initialize
{
  GSStorageManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  v2 = objc_alloc_init(GSStorageManager);
  v3 = (void *)gDefaultGSManager;
  gDefaultGSManager = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)gPermanentStores;
  gPermanentStores = v4;

  v6 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v7 = (void *)gStagingPrefixes;
  gStagingPrefixes = (uint64_t)v6;

}

- (id)permanentStorageForItemAtURL:(id)a3 allocateIfNone:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  GSDocumentIdentifier *v11;
  GSDocumentIdentifier *v12;
  id v13;
  GSPermanentStorage *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v8 = objc_retainAutorelease(a3);
  v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 33024);
  if ((v9 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to open %@"), v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *__error();
    gs_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a5)
    {
      _GSErrorForErrno(v16, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_11;
  }
  v10 = v9;
  v11 = -[GSDocumentIdentifier initWithFileDescriptor:forItemAtURL:allocateIfNone:error:]([GSDocumentIdentifier alloc], "initWithFileDescriptor:forItemAtURL:allocateIfNone:error:", v9, v8, v6, a5);
  if (!v11)
  {
    close(v10);
LABEL_11:
    v14 = 0;
    goto LABEL_15;
  }
  v12 = v11;
  v13 = (id)gPermanentStores;
  objc_sync_enter(v13);
  objc_msgSend((id)gPermanentStores, "objectForKey:", v12);
  v14 = (GSPermanentStorage *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v13);

  if (v14)
  {
    -[GSPermanentStorage setDocumentURL:](v14, "setDocumentURL:", v8);
  }
  else
  {
    v14 = -[GSPermanentStorage initWithFileDescriptor:documentID:forItemAtURL:error:]([GSPermanentStorage alloc], "initWithFileDescriptor:documentID:forItemAtURL:error:", v10, v12, v8, a5);
    if (v14)
    {
      v18 = (id)gPermanentStores;
      objc_sync_enter(v18);
      -[GSStorageManager stagingPrefixForDocumentID:](self, "stagingPrefixForDocumentID:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[GSPermanentStorage setStagingPrefix:](v14, "setStagingPrefix:", v19);

      v20 = (void *)gPermanentStores;
      -[GSPermanentStorage documentID](v14, "documentID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKey:", v14, v21);

      objc_sync_exit(v18);
    }
  }
  close(v10);

LABEL_15:
  return v14;
}

+ (BOOL)_isPermanentStorageSupportedForStatFSInfo:(statfs *)a3 error:(id *)a4
{
  char *f_fstypename;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  f_fstypename = a3->f_fstypename;
  if (!strcmp(a3->f_fstypename, "apfs") || !strcmp(f_fstypename, "hfs"))
  {
    if (a3->f_blocks * a3->f_bsize > 0x20000000)
      return 1;
    v8 = 28;
  }
  else
  {
    gs_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = f_fstypename;
      _os_log_impl(&dword_1D414C000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] This volume is running \"%s\" which is not supported", (uint8_t *)&v14, 0xCu);
    }

    v8 = 78;
  }
  v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v8, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This volume doesn't support system managed genstore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  gs_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    +[GSStorageManager _isPermanentStorageSupportedForStatFSInfo:error:].cold.1();

  if (a4)
  {
    _GSErrorForStatus(107, v11, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

+ (BOOL)_isPermanentStorageSupportedForFD:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  id v13;

  v5 = *(_QWORD *)&a3;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v5, 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__GSStorageManager__isPermanentStorageSupportedForFD_error___block_invoke;
  v12[3] = &unk_1E9771D38;
  v8 = v6;
  v13 = v8;
  objc_msgSend(v8, "isPermanentStorageSupportedForHandle:reply:", v7, v12);
  objc_msgSend(v8, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (a4)
  {
    objc_msgSend(v8, "error");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __60__GSStorageManager__isPermanentStorageSupportedForFD_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBoolResult:error:", a2, a3);
}

- (BOOL)mayPermanentStorageBeSupportedAtURL:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  void *v7;
  int v8;
  NSObject *v9;
  statfs v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(&v11, 0, 512);
  v5 = objc_retainAutorelease(a3);
  if (statfs((const char *)objc_msgSend(v5, "fileSystemRepresentation"), &v11) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("statfs(%@) failed"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *__error();
    gs_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a4)
    {
      _GSErrorForErrno(v8, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v6 = 0;
  }
  else
  {
    v6 = +[GSStorageManager _isPermanentStorageSupportedForStatFSInfo:error:](GSStorageManager, "_isPermanentStorageSupportedForStatFSInfo:error:", &v11, a4);
  }

  return v6;
}

- (BOOL)mayPermanentStorageBeSupportedWithFD:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  int v8;
  NSObject *v9;
  statfs v10;
  uint64_t v11;

  v5 = *(_QWORD *)&a3;
  v11 = *MEMORY[0x1E0C80C00];
  memset(&v10, 0, 512);
  if ((fstatfs(a3, &v10) & 0x80000000) == 0)
    return +[GSStorageManager _isPermanentStorageSupportedForStatFSInfo:error:](GSStorageManager, "_isPermanentStorageSupportedForStatFSInfo:error:", &v10, a4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fstatfs(%d) failed"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *__error();
  gs_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    _RemoveTreeInternal_cold_1();

  if (a4)
  {
    _GSErrorForErrno(v8, v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (BOOL)isPermanentStorageSupportedAtURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;

  v6 = objc_retainAutorelease(a3);
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 33024);
  if ((v7 & 0x80000000) != 0)
  {
    if (*__error() != 2
      || (objc_msgSend(v6, "URLByDeletingLastPathComponent"),
          v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
          v7 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 1081600),
          v9,
          (v7 & 0x80000000) != 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to open %@"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *__error();
      gs_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        _RemoveTreeInternal_cold_1();

      if (a4)
      {
        _GSErrorForErrno(v11, v10);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_12;
    }
  }
  if (!-[GSStorageManager mayPermanentStorageBeSupportedWithFD:error:](self, "mayPermanentStorageBeSupportedWithFD:error:", v7, a4))
  {
    close(v7);
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v8 = +[GSStorageManager _isPermanentStorageSupportedForFD:error:](GSStorageManager, "_isPermanentStorageSupportedForFD:error:", v7, a4);
  close(v7);
LABEL_13:

  return v8;
}

- (id)stagingPrefixForDocumentID:(id)a3
{
  char *v3;
  void *v4;
  id v5;
  GSStagingPrefix *v6;
  id v7;

  v3 = (char *)a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v3 + 8);
  v5 = (id)gPermanentStores;
  objc_sync_enter(v5);
  objc_msgSend((id)gStagingPrefixes, "objectForKey:", v4);
  v6 = (GSStagingPrefix *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if (!v6)
  {
    v6 = -[GSStagingPrefix initWithDocumentID:]([GSStagingPrefix alloc], "initWithDocumentID:", v3);
    v7 = (id)gPermanentStores;
    objc_sync_enter(v7);
    objc_msgSend((id)gStagingPrefixes, "setObject:forKey:", v6, v4);
    objc_sync_exit(v7);

  }
  return v6;
}

- (void)_connectionWithDaemonWasLost
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (id)gPermanentStores;
  objc_sync_enter(v2);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend((id)gPermanentStores, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v6++), "_connectionWithDaemonWasLost");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v4);
  }

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)gStagingPrefixes, "allObjects", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "_connectionWithDaemonWasLost");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v8);
  }

  objc_sync_exit(v2);
}

- (id)temporaryStorageForItemAtURL:(id)a3 locatedAtURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  GSTemporaryStorage *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[GSTemporaryStorage initWithLibraryURL:forItemAtURL:error:]([GSTemporaryStorage alloc], "initWithLibraryURL:forItemAtURL:error:", v7, v8, a5);

  return v9;
}

- (id)persistentIdentifierInStorage:(id)a3 forAdditionNamed:(id)a4 inNameSpace:(id)a5
{
  id v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (__CFString *)a5;
  v9 = a4;
  if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.ubiquity")) & 1) != 0
    || -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("com.apple.FileProvider.conflict")))
  {
    v10 = CFSTR("com.apple.documentVersions");

    v8 = v10;
  }
  objc_msgSend(v7, "persistentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = v8;
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)additionForItemAtURL:(id)a3 forPersistentIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "count") == 3)
  {
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[GSStorageManager temporaryStorageForItemAtURL:locatedAtURL:error:](self, "temporaryStorageForItemAtURL:locatedAtURL:error:", v8, v10, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[GSStorageManager permanentStorageForItemAtURL:allocateIfNone:error:](self, "permanentStorageForItemAtURL:allocateIfNone:error:", v8, 0, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "additionWithName:inNameSpace:error:", v12, v11, a5);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.documentVersions")))
            {
              objc_msgSend(v15, "additionWithName:inNameSpace:error:", v12, CFSTR("com.apple.ubiquity"), a5);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v13)
              {
                objc_msgSend(v15, "additionWithName:inNameSpace:error:", v12, CFSTR("com.apple.FileProvider.conflict"), a5);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              v13 = 0;
            }
          }

          goto LABEL_18;
        }
      }
    }
    v13 = 0;
    goto LABEL_18;
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (BOOL)removeAdditionsInNamespace:(id)a3 underPath:(id)a4 withMatchingPredicate:(id)a5 errorPerAddition:(id *)a6 error:(id *)a7
{
  unsigned int (**v9)(id, id);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  BOOL v29;
  NSObject *v30;
  void *v32;
  int v33;
  int *v34;
  char *v35;
  void *v36;
  int v37;
  int *v38;
  char *v39;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  _BYTE *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint8_t v67[4];
  void *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  char *v72;
  _BYTE buf[32];
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v43 = a4;
  v9 = (unsigned int (**)(id, id))a5;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__2;
  v65 = __Block_byref_object_dispose__2;
  v66 = &unk_1E9775968;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__2;
  v59 = __Block_byref_object_dispose__2;
  v60 = (id)objc_opt_new();
  v11 = v62[5];
  if (!v11)
  {
LABEL_5:
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v17 = (id)objc_msgSend(v16, "initWithCapacity:", objc_msgSend((id)v56[5], "count"));
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v18 = (id)v56[5];
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v76, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v23 = -[GSAddition _initWithStorage:andDictionary:]([GSAddition alloc], "_initWithStorage:andDictionary:", 0, v22);
          if (v9[2](v9, v23))
            objc_msgSend(v17, "addObject:", v22);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v76, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v17, "count"))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__2;
      v74 = __Block_byref_object_dispose__2;
      v75 = 0;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __102__GSStorageManager_removeAdditionsInNamespace_underPath_withMatchingPredicate_errorPerAddition_error___block_invoke_31;
      v44[3] = &unk_1E9771EA0;
      v46 = buf;
      v24 = v10;
      v45 = v24;
      objc_msgSend(v24, "removeAdditionsUnderPath:additionsList:completionHandler:", v43, v17, v44);
      v25 = (id)objc_msgSend(v24, "result");
      if (a6)
      {
        v26 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v26)
          *a6 = objc_retainAutorelease(v26);
      }
      objc_msgSend(v24, "error", a6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        if (a7)
        {
          objc_msgSend(v24, "error");
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        gs_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        {
          objc_msgSend(v24, "error");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *__error();
          v38 = __error();
          v39 = strerror(*v38);
          *(_DWORD *)v67 = 138412802;
          v68 = v36;
          v69 = 1024;
          v70 = v37;
          v71 = 2080;
          v72 = v39;
          _os_log_error_impl(&dword_1D414C000, v28, (os_log_type_t)0x90u, "[ERROR] found error while removing additions: %@; error %d (%s)",
            v67,
            0x1Cu);

        }
        _Block_object_dispose(buf, 8);

        v29 = 0;
        goto LABEL_31;
      }

      _Block_object_dispose(buf, 8);
    }
    v29 = 1;
    goto LABEL_31;
  }
  v12 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v51[0] = v12;
    v51[1] = 3221225472;
    v51[2] = __102__GSStorageManager_removeAdditionsInNamespace_underPath_withMatchingPredicate_errorPerAddition_error___block_invoke;
    v51[3] = &unk_1E9771E78;
    v13 = v10;
    v52 = v13;
    v53 = &v61;
    v54 = &v55;
    objc_msgSend(v13, "listAdditionsUnderPath:withNameSpace:withOptions:withoutOptions:andEnumerationState:completionHandler:", v43, v42, 0, 0, v11, v51);
    v14 = (id)objc_msgSend(v13, "result");
    objc_msgSend(v13, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      break;

    v11 = v62[5];
    if (!v11)
      goto LABEL_5;
  }
  if (a7)
  {
    objc_msgSend(v13, "error");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  gs_default_log();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
  {
    objc_msgSend(v13, "error");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *__error();
    v34 = __error();
    v35 = strerror(*v34);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v32;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v33;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v35;
    _os_log_error_impl(&dword_1D414C000, v30, (os_log_type_t)0x90u, "[ERROR] found error while fetching additions under namespace %@; error %d (%s)",
      buf,
      0x1Cu);

  }
  v29 = 0;
  v17 = v52;
LABEL_31:

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  return v29;
}

void __102__GSStorageManager_removeAdditionsInNamespace_underPath_withMatchingPredicate_errorPerAddition_error___block_invoke(_QWORD *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  if (a4)
  {
    v8 = (void *)a1[4];
    v9 = 0;
    v10 = a4;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObjectsFromArray:", v11);
    v8 = (void *)a1[4];
    v9 = 1;
    v10 = 0;
  }
  objc_msgSend(v8, "handleBoolResult:error:", v9, v10);

}

void __102__GSStorageManager_removeAdditionsInNamespace_underPath_withMatchingPredicate_errorPerAddition_error___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "handleBoolResult:error:", 1, v7);

}

- (BOOL)removeTemporaryStorage:(id)a3 error:(id *)a4
{
  id v5;

  objc_msgSend(a3, "libraryURL");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LOBYTE(a4) = _RemoveTree((char *)objc_msgSend(v5, "fileSystemRepresentation"), 0, a4);

  return (char)a4;
}

- (BOOL)deallocateDocumentIDOfItemAtURL:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;

  v5 = objc_retainAutorelease(a3);
  v6 = GSChflags((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 64, 0);
  if (v6 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GSChflags(%@, -%x) failed"), v5, 64);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *__error();
    gs_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a4)
    {
      _GSErrorForErrno(v8, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6 >= 0;
}

- (BOOL)isItemAtURLInsidePermanentStorage:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v5 = objc_retainAutorelease(a3);
  real_url((const char *)objc_msgSend(v5, "fileSystemRepresentation"), a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_retainAutorelease(v5);
    mountpoint_url((const char *)objc_msgSend(v7, "fileSystemRepresentation"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR(".DocumentRevisions-V100"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "hasPrefix:", v12);

      if ((v13 & 1) == 0)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("URL %@ is not in permanent storage for volume %@"), v15, v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        gs_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[GSStorageManager isItemAtURLInsidePermanentStorage:error:].cold.1();

        if (a4)
        {
          _GSErrorForStatus(104, v16, 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isItemAtURLValidInsidePermanentStorage:(id)a3 error:(id *)a4
{
  return !-[GSStorageManager isItemAtURLInsidePermanentStorage:error:](self, "isItemAtURLInsidePermanentStorage:error:", a3, a4);
}

- (void)readImportCookieDataForVolumeAtURL:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GSStorageManager.m"), 675, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__GSStorageManager_readImportCookieDataForVolumeAtURL_handler___block_invoke;
  v14[3] = &unk_1E9771EF0;
  v16 = &v17;
  v10 = v9;
  v15 = v10;
  objc_msgSend(v10, "readImportCookieDataForVolumeAtURL:reply:", v7, v14);
  objc_msgSend(v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v12);
  }
  else
  {
    objc_msgSend(v10, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, uint64_t, _QWORD))v8 + 2))(v8, v12, v18[5], 0);
  }

  _Block_object_dispose(&v17, 8);
}

void __63__GSStorageManager_readImportCookieDataForVolumeAtURL_handler___block_invoke(uint64_t a1, void *a2, id obj, void *a4)
{
  id v8;
  id v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v8 = obj;
  v9 = a4;
  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "handleObjResult:error:", v10, v9);

}

- (BOOL)storeImportCookieData:(id)a3 forVolumeURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v7 = a3;
  v8 = a4;
  +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__GSStorageManager_storeImportCookieData_forVolumeURL_error___block_invoke;
  v11[3] = &unk_1E9771F18;
  v11[4] = &v12;
  v11[5] = a5;
  objc_msgSend(v9, "storeImportCookieData:forVolumeURL:reply:", v7, v8, v11);
  LOBYTE(a5) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)a5;
}

_QWORD *__61__GSStorageManager_storeImportCookieData_forVolumeURL_error___block_invoke(_QWORD *result, id a2)
{
  uint64_t v3;

  v3 = (uint64_t)result;
  if (result[5])
  {
    result = objc_retainAutorelease(a2);
    **(_QWORD **)(v3 + 40) = result;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = a2 == 0;
  return result;
}

- (id)permanentStorageForItemWithDocID:(unsigned int)a3 deviceID:(int)a4 allocateIfNone:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v8;
  uint64_t v9;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v25;
  _QWORD v26[4];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD *v30;
  _QWORD v31[4];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  _QWORD v37[4];

  if (a3)
  {
    v8 = a5;
    v9 = *(_QWORD *)&a4;
    v11 = (void *)MEMORY[0x1D825874C](self, a2);
    +[GSDaemonProxySync proxy](GSDaemonProxySync, "proxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v37[0] = &v36;
    v37[1] = 0x2020000000;
    v37[2] = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v31[3] = 0;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __GSLibraryResolveDocumentIdToURL_block_invoke;
    v26[3] = &unk_1E9771EC8;
    v28 = &v36;
    v29 = &v32;
    v30 = v31;
    v13 = v12;
    v27 = v13;
    objc_msgSend(v13, "getFileIdForDocumentId:onDevice:reply:", a3, v9, v26);
    v14 = (id)objc_msgSend(v13, "result");
    if (*((_DWORD *)v33 + 6))
    {
      v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v16 = (id)objc_msgSend(v15, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *((int *)v33 + 6), 0);
      v17 = 0;
    }
    else
    {
      v20 = *(_QWORD *)(v37[0] + 24);
      v25 = 0;
      _GSPathResolveByID(v9, v20, &v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v25;
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v21, 0);
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        gs_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
          -[GSStorageManager permanentStorageForItemWithDocID:deviceID:allocateIfNone:error:].cold.3((uint64_t)v37, (uint64_t)v16, v22);

        v17 = 0;
      }

    }
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v36, 8);

    objc_autoreleasePoolPop(v11);
    if (a6)
      *a6 = objc_retainAutorelease(v16);

    if (v17)
    {
      -[GSStorageManager permanentStorageForItemAtURL:allocateIfNone:error:](self, "permanentStorageForItemAtURL:allocateIfNone:error:", v17, v8, a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
  }
  else
  {
    gs_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      -[GSStorageManager permanentStorageForItemWithDocID:deviceID:allocateIfNone:error:].cold.2(v18);

    if (a6)
    {
      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      *a6 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    }
  }
  gs_default_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    -[GSStorageManager permanentStorageForItemWithDocID:deviceID:allocateIfNone:error:].cold.1((uint64_t *)a6, a3, v17);
  v23 = 0;
LABEL_21:

  return v23;
}

+ (void)_isPermanentStorageSupportedForStatFSInfo:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_0(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)isItemAtURLInsidePermanentStorage:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_0(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)permanentStorageForItemWithDocID:(os_log_t)log deviceID:allocateIfNone:error:.cold.1(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
    v3 = *a1;
  else
    v3 = 0;
  v4 = 136315650;
  v5 = "-[GSStorageManager permanentStorageForItemWithDocID:deviceID:allocateIfNone:error:]";
  v6 = 1024;
  v7 = a2;
  v8 = 2112;
  v9 = v3;
  _os_log_error_impl(&dword_1D414C000, log, (os_log_type_t)0x90u, "[ERROR] %s: failed to resolve url for %u: %@", (uint8_t *)&v4, 0x1Cu);
}

- (void)permanentStorageForItemWithDocID:(os_log_t)log deviceID:allocateIfNone:error:.cold.2(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "GSLibraryResolveDocumentIdToURL";
  v3 = 1024;
  v4 = 0;
  _os_log_error_impl(&dword_1D414C000, log, (os_log_type_t)0x90u, "[ERROR] %s: invalid docID %u", (uint8_t *)&v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)permanentStorageForItemWithDocID:(os_log_t)log deviceID:allocateIfNone:error:.cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = 136315650;
  v5 = "GSLibraryResolveDocumentIdToURL";
  v6 = 2048;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1D414C000, log, (os_log_type_t)0x90u, "[ERROR] %s: failed to resolve path for %llu: %@", (uint8_t *)&v4, 0x20u);
}

@end
