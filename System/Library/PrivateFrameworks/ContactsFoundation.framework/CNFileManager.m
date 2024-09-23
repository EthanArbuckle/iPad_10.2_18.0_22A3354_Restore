@implementation CNFileManager

- (CNFileManager)init
{
  void *v3;
  CNFileManager *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNFileManager initWithFileManager:](self, "initWithFileManager:", v3);

  return v4;
}

- (CNFileManager)initWithFileManager:(id)a3
{
  id v5;
  CNFileManager *v6;
  CNFileManager *v7;
  CNFileManager *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFileManager;
  v6 = -[CNFileManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileManager, a3);
    v8 = v7;
  }

  return v7;
}

- (id)dataWithContentsOfURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__CNFileManager_dataWithContentsOfURL___block_invoke;
  v7[3] = &unk_1E29B94B8;
  v8 = v3;
  v4 = v3;
  +[CNResult resultWithBlock:](CNResult, "resultWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__CNFileManager_dataWithContentsOfURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", *(_QWORD *)(a1 + 32), 0, a2);
}

- (id)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__CNFileManager_writeData_toURL_options___block_invoke;
  v14[3] = &unk_1E29BB2B0;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = a5;
  v10 = v8;
  v11 = v9;
  +[CNResult resultWithBlock:](CNResult, "resultWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __41__CNFileManager_writeData_toURL_options___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  id v13;
  id v15;
  id v16;

  v4 = *(_QWORD *)(a1 + 56);
  if ((v4 & 1) != 0)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 40), "URLByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v7 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v16);
    v8 = v16;

    if (!v7)
      goto LABEL_6;

    v4 = *(_QWORD *)(a1 + 56);
  }
  v9 = +[CNData NSDataWritingOptionsFromCNDataWritingOptions:](CNData, "NSDataWritingOptionsFromCNDataWritingOptions:", v4);
  v11 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v15 = 0;
  v12 = objc_msgSend(v10, "writeToURL:options:error:", v11, v9, &v15);
  v8 = v15;
  if (v12)
  {
    v13 = *(id *)(a1 + 40);
    goto LABEL_8;
  }
LABEL_6:
  v13 = 0;
  if (a2)
    *a2 = objc_retainAutorelease(v8);
LABEL_8:

  return v13;
}

- (id)asyncDataWithContentsOfURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__CNFileManager_asyncDataWithContentsOfURL___block_invoke;
  v8[3] = &unk_1E29BB2D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  +[CNFuture futureWithBlock:](CNFuture, "futureWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __44__CNFileManager_asyncDataWithContentsOfURL___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "dataWithContentsOfURL:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (a2 && !v6)
    *a2 = objc_retainAutorelease(v5);

  return v7;
}

- (id)asyncWriteData:(id)a3 toURL:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __46__CNFileManager_asyncWriteData_toURL_options___block_invoke;
  v14[3] = &unk_1E29BB2B0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a5;
  v10 = v9;
  v11 = v8;
  +[CNFuture futureWithBlock:](CNFuture, "futureWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __46__CNFileManager_asyncWriteData_toURL_options___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "writeData:toURL:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v6;
  if (a2 && !v6)
    *a2 = objc_retainAutorelease(v5);

  return v7;
}

- (id)observableWithContentsOfURL:(id)a3
{
  id v3;
  CNData *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(CNData);
  -[CNData observableWithContentsOfURL:](v4, "observableWithContentsOfURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)fileExistsAtURL:(id)a3
{
  NSFileManager *fileManager;
  void *v4;

  fileManager = self->_fileManager;
  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(fileManager) = -[NSFileManager fileExistsAtPath:](fileManager, "fileExistsAtPath:", v4);

  return (char)fileManager;
}

- (BOOL)fileExistsAtURL:(id)a3 isDirectory:(BOOL *)a4
{
  NSFileManager *fileManager;
  void *v6;

  fileManager = self->_fileManager;
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[NSFileManager fileExistsAtPath:isDirectory:](fileManager, "fileExistsAtPath:isDirectory:", v6, a4);

  return (char)a4;
}

- (id)removeItemAtURL:(id)a3
{
  NSFileManager *fileManager;
  _BOOL4 v4;
  id v5;
  void *v6;
  id v8;

  fileManager = self->_fileManager;
  v8 = 0;
  v4 = -[NSFileManager removeItemAtURL:error:](fileManager, "removeItemAtURL:error:", a3, &v8);
  v5 = v8;
  if (v4)
    +[CNResult successWithValue:](CNResult, "successWithValue:", MEMORY[0x1E0C9AAB0]);
  else
    +[CNResult failureWithError:](CNResult, "failureWithError:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__CNFileManager_createDirectoryAtURL_withIntermediateDirectories_attributes___block_invoke;
  v14[3] = &unk_1E29BB300;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  +[CNResult resultWithBlock:](CNResult, "resultWithBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __77__CNFileManager_createDirectoryAtURL_withIntermediateDirectories_attributes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a2) = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);

  if ((_DWORD)a2)
    v5 = *(void **)(a1 + 40);
  else
    v5 = 0;
  return v5;
}

- (id)contentsOfDirectoryAtURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5
{
  NSFileManager *fileManager;
  void *v6;
  id v7;
  void *v8;
  id v10;

  fileManager = self->_fileManager;
  v10 = 0;
  -[NSFileManager contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:](fileManager, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, a4, a5, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  +[CNResult resultWithValue:orError:](CNResult, "resultWithValue:orError:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  -[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](self->_fileManager, "containerURLForSecurityApplicationGroupIdentifier:", a3);
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

- (id)setValue:(id)a3 forExtendedAttribute:(id)a4 atURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSFileManager *fileManager;
  void *v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  fileManager = self->_fileManager;
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v19 = 0;
    v16 = -[NSFileManager _cn_removeExtendedAttributeForKey:path:error:](fileManager, "_cn_removeExtendedAttributeForKey:path:error:", v9, v12, &v19);
    v14 = v19;

    if (v16)
      goto LABEL_3;
LABEL_5:
    +[CNResult failureWithError:](CNResult, "failureWithError:", v14);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v20 = 0;
  v13 = -[NSFileManager _cn_setValue:forExtendedAttribute:path:error:](fileManager, "_cn_setValue:forExtendedAttribute:path:error:", v8, v9, v12, &v20);
  v14 = v20;

  if (!v13)
    goto LABEL_5;
LABEL_3:
  +[CNResult successWithValue:](CNResult, "successWithValue:", MEMORY[0x1E0C9AAB0]);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v17 = (void *)v15;

  return v17;
}

- (id)valueForExtendedAttribute:(id)a3 atURL:(id)a4
{
  NSFileManager *fileManager;
  id v6;
  void *v7;
  _BOOL4 v8;
  __CFString *v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  id v15;
  id v16;

  fileManager = self->_fileManager;
  v16 = 0;
  v6 = a3;
  objc_msgSend(a4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = -[NSFileManager _cn_getValue:forExtendendAttribute:path:error:](fileManager, "_cn_getValue:forExtendendAttribute:path:error:", &v16, v6, v7, &v15);

  v9 = (__CFString *)v16;
  v10 = v15;

  if (v8)
  {
    if (v9)
      v11 = v9;
    else
      v11 = &stru_1E29BCC70;
    +[CNResult successWithValue:](CNResult, "successWithValue:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CNResult failureWithError:](CNResult, "failureWithError:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (BOOL)getValue:(id *)a3 forExtendendAttribute:(id)a4 url:(id)a5 error:(id *)a6
{
  return -[NSFileManager _cn_getValue:forExtendendAttribute:url:error:](self->_fileManager, "_cn_getValue:forExtendendAttribute:url:error:", a3, a4, a5, a6);
}

- (id)removeExtendedAttribute:(id)a3 atURL:(id)a4
{
  NSFileManager *fileManager;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  fileManager = self->_fileManager;
  v6 = a3;
  objc_msgSend(a4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  LODWORD(fileManager) = -[NSFileManager _cn_removeExtendedAttributeForKey:path:error:](fileManager, "_cn_removeExtendedAttributeForKey:path:error:", v6, v7, &v11);

  v8 = v11;
  if ((_DWORD)fileManager)
    +[CNResult successWithValue:](CNResult, "successWithValue:", MEMORY[0x1E0C9AAB0]);
  else
    +[CNResult failureWithError:](CNResult, "failureWithError:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
