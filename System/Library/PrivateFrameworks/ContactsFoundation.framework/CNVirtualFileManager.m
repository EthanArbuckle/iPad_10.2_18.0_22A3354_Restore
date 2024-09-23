@implementation CNVirtualFileManager

- (CNVirtualFileManager)init
{
  CNVirtualFileManager *v2;
  uint64_t v3;
  NSMutableDictionary *files;
  uint64_t v5;
  NSMutableOrderedSet *directories;
  uint64_t v7;
  NSMutableDictionary *containers;
  CNVirtualFileManager *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CNVirtualFileManager;
  v2 = -[CNVirtualFileManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    files = v2->_files;
    v2->_files = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    directories = v2->_directories;
    v2->_directories = (NSMutableOrderedSet *)v5;

    v7 = objc_opt_new();
    containers = v2->_containers;
    v2->_containers = (NSMutableDictionary *)v7;

    v9 = v2;
  }

  return v2;
}

- (id)dataWithContentsOfURL:(id)a3
{
  id v4;
  NSMutableDictionary *files;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNVirtualFileManager dataWithContentsOfURL:].cold.1();
  }
  files = self->_files;
  objc_msgSend(v4, "absoluteURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](files, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "contents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNResult successWithValue:](CNResult, "successWithValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB28A8];
    v16[0] = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v16[1] = *MEMORY[0x1E0CB3388];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 260, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNResult failureWithError:](CNResult, "failureWithError:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _CNVirtualFile *v19;
  NSMutableDictionary *files;
  void *v21;
  char v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v5 = a5;
  v25[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNVirtualFileManager dataWithContentsOfURL:].cold.1();
  }
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 1) != 0)
  {
    v18 = -[CNVirtualFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:](self, "createDirectoryAtURL:withIntermediateDirectories:attributes:", v10, 1, 0);
LABEL_11:
    v19 = objc_alloc_init(_CNVirtualFile);
    -[_CNVirtualFile setContents:](v19, "setContents:", v8);
    files = self->_files;
    objc_msgSend(v9, "absoluteURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](files, "setObject:forKeyedSubscript:", v19, v21);

    +[CNResult successWithValue:](CNResult, "successWithValue:", MEMORY[0x1E0C9AAB0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v23 = 0;
  if (-[CNVirtualFileManager fileExistsAtURL:isDirectory:](self, "fileExistsAtURL:isDirectory:", v10, &v23) && v23)
    goto LABEL_11;
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB28A8];
  v24[0] = *MEMORY[0x1E0CB2AA0];
  objc_msgSend(v9, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = *MEMORY[0x1E0CB3388];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 4, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult failureWithError:](CNResult, "failureWithError:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v17;
}

- (id)asyncDataWithContentsOfURL:(id)a3
{
  id v3;
  CNData *v4;
  void *v5;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNVirtualFileManager dataWithContentsOfURL:].cold.1();
  }
  v4 = objc_alloc_init(CNData);
  -[CNData dataWithContentsOfURL:](v4, "dataWithContentsOfURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)observableWithContentsOfURL:(id)a3
{
  id v3;
  CNData *v4;
  void *v5;

  v3 = a3;
  if (!v3)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNVirtualFileManager dataWithContentsOfURL:].cold.1();
  }
  v4 = objc_alloc_init(CNData);
  -[CNData observableWithContentsOfURL:](v4, "observableWithContentsOfURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)asyncWriteData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  CNData *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNVirtualFileManager dataWithContentsOfURL:].cold.1();
  }
  v9 = objc_alloc_init(CNData);
  -[CNData writeData:toURL:options:](v9, "writeData:toURL:options:", v7, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)removeItemAtURL:(id)a3
{
  id v4;
  NSMutableDictionary *files;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  NSMutableOrderedSet *directories;
  void *v12;
  NSMutableOrderedSet *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  files = self->_files;
  objc_msgSend(v4, "absoluteURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](files, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_files;
    objc_msgSend(v4, "absoluteURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", 0, v9);

    +[CNResult successWithValue:](CNResult, "successWithValue:", MEMORY[0x1E0C9AAB0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    directories = self->_directories;
    objc_msgSend(v4, "absoluteURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(directories) = -[NSMutableOrderedSet containsObject:](directories, "containsObject:", v12);

    if ((_DWORD)directories)
    {
      v13 = self->_directories;
      objc_msgSend(v4, "absoluteURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet removeObject:](v13, "removeObject:", v14);

      -[NSMutableDictionary allKeys](self->_files, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __40__CNVirtualFileManager_removeItemAtURL___block_invoke;
      v32[3] = &unk_1E29B9F68;
      v17 = v4;
      v33 = v17;
      objc_msgSend(v15, "_cn_filter:", v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v31[0] = v16;
      v31[1] = 3221225472;
      v31[2] = __40__CNVirtualFileManager_removeItemAtURL___block_invoke_2;
      v31[3] = &unk_1E29B9F90;
      v31[4] = self;
      objc_msgSend(v18, "_cn_each:", v31);
      -[NSMutableOrderedSet array](self->_directories, "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v16;
      v29[1] = 3221225472;
      v29[2] = __40__CNVirtualFileManager_removeItemAtURL___block_invoke_3;
      v29[3] = &unk_1E29B9F68;
      v30 = v17;
      objc_msgSend(v19, "_cn_filter:", v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __40__CNVirtualFileManager_removeItemAtURL___block_invoke_4;
      v28[3] = &unk_1E29B9F90;
      v28[4] = self;
      objc_msgSend(v20, "_cn_each:", v28);
      +[CNResult successWithValue:](CNResult, "successWithValue:", MEMORY[0x1E0C9AAB0]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB28A8];
      v34[0] = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v4, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v23;
      v34[1] = *MEMORY[0x1E0CB3388];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 4, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNResult failureWithError:](CNResult, "failureWithError:", v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

uint64_t __40__CNVirtualFileManager_removeItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasPrefix:", v4);

  return v5;
}

uint64_t __40__CNVirtualFileManager_removeItemAtURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, a2);
}

uint64_t __40__CNVirtualFileManager_removeItemAtURL___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasPrefix:", v4);

  return v5;
}

uint64_t __40__CNVirtualFileManager_removeItemAtURL___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", a2);
}

- (BOOL)fileExistsAtURL:(id)a3
{
  id v4;
  NSMutableDictionary *files;
  void *v6;
  void *v7;
  char v8;
  NSMutableOrderedSet *directories;
  void *v10;

  v4 = a3;
  if (!v4)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNVirtualFileManager dataWithContentsOfURL:].cold.1();
  }
  files = self->_files;
  objc_msgSend(v4, "absoluteURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](files, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = 1;
  }
  else
  {
    directories = self->_directories;
    objc_msgSend(v4, "absoluteURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSMutableOrderedSet containsObject:](directories, "containsObject:", v10);

  }
  return v8;
}

- (BOOL)fileExistsAtURL:(id)a3 isDirectory:(BOOL *)a4
{
  id v6;
  NSMutableDictionary *files;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;

  v6 = a3;
  if (!v6)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_28);
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
      -[CNVirtualFileManager dataWithContentsOfURL:].cold.1();
  }
  files = self->_files;
  objc_msgSend(v6, "absoluteURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](files, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (a4)
      *a4 = 0;
    v10 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "URLByNormalizingDirectoryURL:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NSMutableOrderedSet containsObject:](self->_directories, "containsObject:", v11);
    v10 = v12;
    if (a4)
      *a4 = v12;

  }
  return v10;
}

- (void)setContainerURL:(id)a3 forSecurityApplicationGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "URLByNormalizingDirectoryURL:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_containers, "setObject:forKeyedSubscript:", v8, v6);
  -[NSMutableOrderedSet addObject:](self->_directories, "addObject:", v8);

}

- (id)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5
{
  id v6;
  void *v7;
  NSMutableOrderedSet *directories;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLByNormalizingDirectoryURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  directories = self->_directories;
  objc_msgSend((id)objc_opt_class(), "allParentFoldersOfURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet addObjectsFromArray:](directories, "addObjectsFromArray:", v9);

  -[NSMutableOrderedSet addObject:](self->_directories, "addObject:", v7);
  +[CNResult successWithValue:](CNResult, "successWithValue:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  CNVirtualFileManager *v25;
  unint64_t v26;
  _QWORD v27[4];
  id v28;
  CNVirtualFileManager *v29;
  unint64_t v30;

  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "URLByNormalizingDirectoryURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_files, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __84__CNVirtualFileManager_contentsOfDirectoryAtURL_includingPropertiesForKeys_options___block_invoke;
  v27[3] = &unk_1E29B9FB8;
  v12 = v9;
  v29 = self;
  v30 = a5;
  v28 = v12;
  objc_msgSend(v10, "_cn_filter:", v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableOrderedSet array](self->_directories, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __84__CNVirtualFileManager_contentsOfDirectoryAtURL_includingPropertiesForKeys_options___block_invoke_2;
  v22[3] = &unk_1E29B9FE0;
  v23 = v12;
  v24 = v7;
  v25 = self;
  v26 = a5;
  v15 = v7;
  v16 = v12;
  objc_msgSend(v14, "_cn_filter:", v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "addObjectsFromArray:", v13);
  objc_msgSend(v18, "addObjectsFromArray:", v17);
  objc_msgSend(v18, "_cn_distinctObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNResult successWithValue:](CNResult, "successWithValue:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

BOOL __84__CNVirtualFileManager_contentsOfDirectoryAtURL_includingPropertiesForKeys_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(a1 + 32));

  v6 = v5 && ((*(_BYTE *)(a1 + 48) & 4) == 0 || (objc_msgSend((id)objc_opt_class(), "isHiddenURL:", v3) & 1) == 0);
  return v6;
}

uint64_t __84__CNVirtualFileManager_contentsOfDirectoryAtURL_includingPropertiesForKeys_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", *(_QWORD *)(a1 + 32));

  if (!v7)
    goto LABEL_8;
  v8 = *(_QWORD *)(a1 + 56);
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v3, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");
    objc_msgSend(*(id *)(a1 + 40), "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") + 1;

    if (v10 > v12)
      goto LABEL_8;
    v8 = *(_QWORD *)(a1 + 56);
  }
  if ((v8 & 4) == 0 || (objc_msgSend((id)objc_opt_class(), "isHiddenURL:", v3) & 1) == 0)
  {
    v13 = 1;
    goto LABEL_9;
  }
LABEL_8:
  v13 = 0;
LABEL_9:

  return v13;
}

+ (BOOL)isHiddenURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("."));

  return v4;
}

- (BOOL)getValue:(id *)a3 forExtendendAttribute:(id)a4 url:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSMutableDictionary *files;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  files = self->_files;
  objc_msgSend(v11, "absoluteURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](files, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "extendedAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_retainAutorelease(v16);
    *a3 = v17;

  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB28A8];
    v26[0] = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(v11, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v20;
    v26[1] = *MEMORY[0x1E0CB3388];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 2, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 4, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a6)
      *a6 = objc_retainAutorelease(v23);

  }
  return v14 != 0;
}

- (id)valueForExtendedAttribute:(id)a3 atURL:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v18 = 0;
  v19 = 0;
  v7 = -[CNVirtualFileManager getValue:forExtendendAttribute:url:error:](self, "getValue:forExtendendAttribute:url:error:", &v19, a3, v6, &v18);
  v8 = v19;
  v9 = v18;
  if (v7)
  {
    if (!v8)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v20[0] = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v6, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v14;
      v20[1] = *MEMORY[0x1E0CB3388];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 93, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 1302, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNResult failureWithError:](CNResult, "failureWithError:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    +[CNResult successWithValue:](CNResult, "successWithValue:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNResult failureWithError:](CNResult, "failureWithError:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_6:

  return v11;
}

- (id)setValue:(id)a3 forExtendedAttribute:(id)a4 atURL:(id)a5
{
  NSMutableDictionary *files;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  files = self->_files;
  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "absoluteURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](files, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "extendedAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v8);

  +[CNResult successWithValue:](CNResult, "successWithValue:", MEMORY[0x1E0C9AAB0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)removeExtendedAttribute:(id)a3 atURL:(id)a4
{
  return -[CNVirtualFileManager setValue:forExtendedAttribute:atURL:](self, "setValue:forExtendedAttribute:atURL:", 0, a3, a4);
}

- (id)containerURLForSecurityApplicationGroupIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_containers, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Failed to find the container URL for the given application group identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNContactsFoundationErrorDomain"), 13, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  +[CNResult resultWithValue:orError:](CNResult, "resultWithValue:orError:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)URLByNormalizingDirectoryURL:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)allParentFoldersOfURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v6, "_cn_take:", ++v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "URLByNormalizingDirectoryURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addObject:", v10);
    }
    while (objc_msgSend(v6, "count") > v7);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_directories, 0);
  objc_storeStrong((id *)&self->_files, 0);
}

- (void)dataWithContentsOfURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, v0, v1, "parameter ‘url’ must be nonnull", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
