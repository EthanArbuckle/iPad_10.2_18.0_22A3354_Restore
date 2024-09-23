@implementation IKAppDataStorage

- (IKAppDataStorage)initWithFilePath:(id)a3 identifier:(id)a4
{
  id v7;
  id v8;
  IKAppDataStorage *v9;
  IKAppDataStorage *v10;
  uint64_t v11;
  NSMutableDictionary *storageDict;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *storageQueue;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  IKAppDataStorage *v20;
  id v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  if (initWithFilePath_identifier__onceToken != -1)
  {
    dispatch_once(&initWithFilePath_identifier__onceToken, &__block_literal_global_2);
    if (v7)
      goto LABEL_3;
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
  if (!v7)
    goto LABEL_14;
LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)IKAppDataStorage;
  v9 = -[IKAppDataStorage init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a4);
    objc_storeStrong((id *)&v10->_filePath, a3);
    v10->_format = 200;
    v11 = objc_opt_new();
    storageDict = v10->_storageDict;
    v10->_storageDict = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Storage_Queue"), v8);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    storageQueue = v10->_storageQueue;
    v10->_storageQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v10->_filePath);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v22 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v16, 0, &v10->_format, &v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v22;
      if (v17)
      {
        -[NSMutableDictionary addEntriesFromDictionary:](v10->_storageDict, "addEntriesFromDictionary:", v17);
      }
      else
      {
        ITMLKitGetLogObject(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[IKAppDataStorage initWithFilePath:identifier:].cold.1((uint64_t *)&v10->_filePath, (uint64_t)v18, v19);

      }
    }

  }
  self = v10;
  v20 = self;
LABEL_15:

  return v20;
}

void __48__IKAppDataStorage_initWithFilePath_identifier___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("Storage Write Queue", 0);
  v1 = (void *)sStorageWriteQueue;
  sStorageWriteQueue = (uint64_t)v0;

}

- (unint64_t)count
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[IKAppDataStorage storageQueue](self, "storageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__IKAppDataStorage_count__block_invoke;
  v6[3] = &unk_1E9F4C0D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __25__IKAppDataStorage_count__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count");

}

- (id)keyAtIndex:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  -[IKAppDataStorage storageQueue](self, "storageQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__IKAppDataStorage_keyAtIndex___block_invoke;
  block[3] = &unk_1E9F4C0F8;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __31__IKAppDataStorage_keyAtIndex___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v2 < v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "storageDict");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (id)getDataForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  if (objc_msgSend(v4, "length"))
  {
    -[IKAppDataStorage storageQueue](self, "storageQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__IKAppDataStorage_getDataForKey___block_invoke;
    block[3] = &unk_1E9F4C120;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

  }
  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __34__IKAppDataStorage_getDataForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)setData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length") && objc_msgSend(v6, "length"))
  {
    -[IKAppDataStorage storageQueue](self, "storageQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__IKAppDataStorage_setData_forKey___block_invoke;
    block[3] = &unk_1E9F4C148;
    block[4] = self;
    v11 = v6;
    v12 = v7;
    dispatch_async(v8, block);

  }
  return 0;
}

void __35__IKAppDataStorage_setData_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "storageDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "_saveDict:", v4);

}

- (void)removeDataForKey:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IKAppDataStorage storageQueue](self, "storageQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__IKAppDataStorage_removeDataForKey___block_invoke;
    v6[3] = &unk_1E9F4C170;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __37__IKAppDataStorage_removeDataForKey___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "storageDict");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "storageDict");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v5, "_saveDict:", v6);

  }
}

- (void)clear
{
  NSObject *v3;
  _QWORD block[5];

  -[IKAppDataStorage storageQueue](self, "storageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__IKAppDataStorage_clear__block_invoke;
  block[3] = &unk_1E9F4BD18;
  block[4] = self;
  dispatch_async(v3, block);

}

void __25__IKAppDataStorage_clear__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "storageDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v3, "_saveDict:", v4);

}

- (id)dictionaryRepresentation
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  -[IKAppDataStorage storageQueue](self, "storageQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__IKAppDataStorage_dictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E9F4C0D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__IKAppDataStorage_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "storageDict");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_saveDict:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = sStorageWriteQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__IKAppDataStorage__saveDict___block_invoke;
  block[3] = &unk_1E9F4C198;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__IKAppDataStorage__saveDict___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = WeakRetained[1];
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v3, v4, 0, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v5)
    {
      objc_msgSend(WeakRetained, "filePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "writeToFile:atomically:", v7, 1);

      if ((v8 & 1) != 0)
      {
LABEL_9:

        goto LABEL_10;
      }
      ITMLKitGetLogObject(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __30__IKAppDataStorage__saveDict___block_invoke_cold_2(WeakRetained, v9);
    }
    else
    {
      ITMLKitGetLogObject(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __30__IKAppDataStorage__saveDict___block_invoke_cold_1(WeakRetained, (uint64_t)v6, v9);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableDictionary)storageDict
{
  return self->_storageDict;
}

- (void)setStorageDict:(id)a3
{
  objc_storeStrong((id *)&self->_storageDict, a3);
}

- (OS_dispatch_queue)storageQueue
{
  return self->_storageQueue;
}

- (void)setStorageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_storageQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageQueue, 0);
  objc_storeStrong((id *)&self->_storageDict, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

- (void)initWithFilePath:(NSObject *)a3 identifier:.cold.1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D95F2000, a3, (uint64_t)a3, "Failed to de-serialize merchant storage at path %@. Error: %@", (uint8_t *)&v4);
}

void __30__IKAppDataStorage__saveDict___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D95F2000, a3, v6, "Could serialize storage for path %@. Error: %@", (uint8_t *)&v7);

}

void __30__IKAppDataStorage__saveDict___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1D95F2000, a2, OS_LOG_TYPE_ERROR, "Could not write storage to path %@.", (uint8_t *)&v4, 0xCu);

}

@end
