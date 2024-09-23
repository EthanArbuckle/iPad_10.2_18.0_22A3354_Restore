@implementation CRKConcreteFileSystemPrimitives

- (CRKConcreteFileSystemPrimitives)init
{
  CRKConcreteFileSystemPrimitives *v2;
  uint64_t v3;
  NSFileManager *fileManager;
  uint64_t v5;
  NSOperationQueue *accessQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKConcreteFileSystemPrimitives;
  v2 = -[CRKConcreteFileSystemPrimitives init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = objc_claimAutoreleasedReturnValue();
    fileManager = v2->_fileManager;
    v2->_fileManager = (NSFileManager *)v3;

    v5 = objc_opt_new();
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (NSOperationQueue *)v5;

  }
  return v2;
}

- (NSURL)temporaryDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (BOOL)fileExistsAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CRKConcreteFileSystemPrimitives fileManager](self, "fileManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "fileExistsAtPath:", v6);
  return (char)v4;
}

- (id)dataWithContentsOfURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", a3, 0, a4);
}

- (id)contentsOfDirectoryAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, MEMORY[0x24BDBD1A8], 2, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)resourceValuesForKeys:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  void *v5;
  CRKURLResources *v6;

  objc_msgSend(a4, "resourceValuesForKeys:error:", a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[CRKURLResources initWithResources:]([CRKURLResources alloc], "initWithResources:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)promisedResourceValuesForKeys:(id)a3 fromURL:(id)a4 error:(id *)a5
{
  void *v5;
  CRKURLResources *v6;

  objc_msgSend(a4, "promisedItemResourceValuesForKeys:error:", a3, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[CRKURLResources initWithResources:]([CRKURLResources alloc], "initWithResources:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)openURL:(id)a3 options:(int)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  CRKConcreteFileDescriptor *v9;
  id v10;

  objc_msgSend(a3, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), a4);

  if ((v8 & 0x80000000) != 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "crk_errorWithPOSIXCode:", *__error());
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      *a5 = v10;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = -[CRKConcreteFileDescriptor initWithRawValue:]([CRKConcreteFileDescriptor alloc], "initWithRawValue:", v8);
  }
  return v9;
}

- (id)dispatchSourceForFileDescriptor:(id)a3 options:(unint64_t)a4
{
  int v5;

  v5 = objc_msgSend(a3, "rawValue");
  return dispatch_source_create(MEMORY[0x24BDACA28], v5, a4, MEMORY[0x24BDAC9B8]);
}

- (BOOL)makeDirectoryAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, a4);

  return (char)a4;
}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v11;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v11);

  v9 = v11;
  if ((v8 & 1) != 0 || (objc_msgSend((id)objc_opt_class(), "isNoSuchFileError:", v9) & 1) == 0)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BDD1580];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "moveItemAtURL:toURL:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BDD1580];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)writeData:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  return objc_msgSend(a3, "writeToURL:options:error:", a4, a5, a6);
}

- (BOOL)setResources:(id)a3 onURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a4;
  objc_msgSend(a3, "underlyingResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v7, "setResourceValues:error:", v8, a5);

  return (char)a5;
}

- (void)coordinateMoveWithActionPairs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  CRKConcreteFileSystemPrimitives *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke;
  v26[3] = &unk_24D9C6EB0;
  v27 = v7;
  v10 = v7;
  v11 = (void *)MEMORY[0x219A226E8](v26);
  objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_64);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_11_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteFileSystemPrimitives accessQueue](self, "accessQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_5;
  v20[3] = &unk_24D9C9430;
  v24 = v6;
  v25 = v11;
  v21 = v12;
  v22 = v13;
  v23 = self;
  v16 = v6;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  objc_msgSend(v8, "coordinateAccessWithIntents:queue:byAccessor:", v14, v15, v20);

}

void __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_2;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1568];
  objc_msgSend(a2, "sourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writingIntentWithURL:options:", v3, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1568];
  objc_msgSend(a2, "destinationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writingIntentWithURL:options:", v3, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __76__CRKConcreteFileSystemPrimitives_coordinateMoveWithActionPairs_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = (void *)objc_opt_new();
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v4 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = *(void **)(a1 + 48);
        v17 = 0;
        v10 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v6, v8, &v17);
        v11 = v17;
        if ((v10 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sourceURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v13);
        }

        ++v4;
      }
      while (v4 < objc_msgSend(*(id *)(a1 + 32), "count"));
    }
    if (objc_msgSend(v3, "count"))
    {
      v18 = CFSTR("CRKPartialErrorsByItemIdentifier");
      v14 = (void *)objc_msgSend(v3, "copy");
      v19[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CRKErrorWithCodeAndUserInfo(29, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

- (void)coordinateCopyWithActionPairs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  CRKConcreteFileSystemPrimitives *v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
  v9 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke;
  v26[3] = &unk_24D9C6EB0;
  v27 = v7;
  v10 = v7;
  v11 = (void *)MEMORY[0x219A226E8](v26);
  objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "crk_mapUsingBlock:", &__block_literal_global_16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKConcreteFileSystemPrimitives accessQueue](self, "accessQueue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_5;
  v20[3] = &unk_24D9C9430;
  v24 = v6;
  v25 = v11;
  v21 = v12;
  v22 = v13;
  v23 = self;
  v16 = v6;
  v17 = v13;
  v18 = v12;
  v19 = v11;
  objc_msgSend(v8, "coordinateAccessWithIntents:queue:byAccessor:", v14, v15, v20);

}

void __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_2;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1568];
  objc_msgSend(a2, "sourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "readingIntentWithURL:options:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1568];
  objc_msgSend(a2, "destinationURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "writingIntentWithURL:options:", v3, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __76__CRKConcreteFileSystemPrimitives_coordinateCopyWithActionPairs_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = (void *)objc_opt_new();
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v4 = 0;
      do
      {
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = *(void **)(a1 + 48);
        v17 = 0;
        v10 = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v6, v8, &v17);
        v11 = v17;
        if ((v10 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sourceURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v13);
        }

        ++v4;
      }
      while (v4 < objc_msgSend(*(id *)(a1 + 32), "count"));
    }
    if (objc_msgSend(v3, "count"))
    {
      v18 = CFSTR("CRKPartialErrorsByItemIdentifier");
      v14 = (void *)objc_msgSend(v3, "copy");
      v19[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      CRKErrorWithCodeAndUserInfo(29, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    }

  }
}

- (void)removeCoordinatedItemsAtURLs:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CRKConcreteFileSystemPrimitives *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDD1570];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithFilePresenter:", 0);
  v10 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke;
  v21[3] = &unk_24D9C6EB0;
  v22 = v6;
  v11 = v6;
  v12 = (void *)MEMORY[0x219A226E8](v21);
  objc_msgSend(v8, "crk_mapUsingBlock:", &__block_literal_global_18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKConcreteFileSystemPrimitives accessQueue](self, "accessQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_4;
  v17[3] = &unk_24D9C7E90;
  v19 = self;
  v20 = v12;
  v18 = v13;
  v15 = v13;
  v16 = v12;
  objc_msgSend(v9, "coordinateAccessWithIntents:queue:byAccessor:", v15, v14, v17);

}

void __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_2;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDD1568], "writingIntentWithURL:options:", a2, 1);
}

void __75__CRKConcreteFileSystemPrimitives_removeCoordinatedItemsAtURLs_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  const __CFString *v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "URL");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = *(void **)(a1 + 40);
          v16 = 0;
          v11 = objc_msgSend(v10, "removeItemAtURL:error:", v9, &v16);
          v12 = v16;
          if ((v11 & 1) == 0)
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v3, "count"))
    {
      v21 = CFSTR("CRKPartialErrorsByItemIdentifier");
      v13 = (void *)objc_msgSend(v3, "copy");
      v22 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CRKErrorWithCodeAndUserInfo(29, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

- (id)nodeForURL:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  CRKFileWrapperBackedFileSystemNode *v8;

  v5 = (objc_class *)MEMORY[0x24BDD1598];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithURL:options:error:", v6, 0, a4);

  if (v7)
    v8 = -[CRKFileWrapperBackedFileSystemNode initWithFileWrapper:]([CRKFileWrapperBackedFileSystemNode alloc], "initWithFileWrapper:", v7);
  else
    v8 = 0;

  return v8;
}

- (id)emptyDirectoryNode
{
  id v2;
  void *v3;
  CRKFileWrapperBackedFileSystemNode *v4;

  v2 = objc_alloc(MEMORY[0x24BDD1598]);
  v3 = (void *)objc_msgSend(v2, "initDirectoryWithFileWrappers:", MEMORY[0x24BDBD1B8]);
  v4 = -[CRKFileWrapperBackedFileSystemNode initWithFileWrapper:]([CRKFileWrapperBackedFileSystemNode alloc], "initWithFileWrapper:", v3);

  return v4;
}

- (id)bookmarkDataForURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 512, MEMORY[0x24BDBD1A8], 0, a4);
}

- (id)URLFromBookmarkData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLByResolvingBookmarkData:options:relativeToURL:bookmarkDataIsStale:error:", a3, 256, 0, 0, a4);
}

- (BOOL)startAccessingBookmarkURL:(id)a3
{
  return objc_msgSend(a3, "startAccessingSecurityScopedResource");
}

- (void)stopAccessingBookmarkURL:(id)a3
{
  objc_msgSend(a3, "stopAccessingSecurityScopedResource");
}

- (id)resourcesDirectoryURLForBundle:(id)a3
{
  return (id)objc_msgSend(a3, "resourceURL");
}

- (id)URLsForResourcesWithExtension:(id)a3 inBundle:(id)a4
{
  return (id)objc_msgSend(a4, "URLsForResourcesWithExtension:subdirectory:", a3, 0);
}

+ (BOOL)isNoSuchFileError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    v5 = objc_msgSend(v3, "code") == 4;
  else
    v5 = 0;

  return v5;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (NSOperationQueue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

@end
