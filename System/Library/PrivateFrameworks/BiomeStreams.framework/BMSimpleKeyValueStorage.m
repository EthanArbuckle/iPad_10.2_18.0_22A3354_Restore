@implementation BMSimpleKeyValueStorage

- (BMSimpleKeyValueStorage)initWithURL:(id)a3
{
  id v5;
  BMSimpleKeyValueStorage *v6;
  BMSimpleKeyValueStorage *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  BMFileManager *fileManager;
  uint64_t v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BMSimpleKeyValueStorage;
  v6 = -[BMSimpleKeyValueStorage init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = dispatch_queue_create("com.apple.biome.kvstorage", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v17 = 0;
    objc_msgSend(v5, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByDeletingLastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x1E0D01D10], "pathIsManaged:domain:", v11, &v17)
      && (objc_msgSend(MEMORY[0x1E0D01D18], "current"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "reliesOnDirectAccessForDomain:", v17),
          v12,
          !v13))
    {
      objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithMediatedAccessToDirectory:useCase:domain:user:", v11, *MEMORY[0x1E0D01C98], v17, geteuid());
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D01D00], "fileManagerWithDirectAccessToDirectory:cachingOptions:", v11, 0);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    fileManager = v7->_fileManager;
    v7->_fileManager = (BMFileManager *)v14;

  }
  return v7;
}

- (void)insertValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[BMSimpleKeyValueStorage queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__BMSimpleKeyValueStorage_insertValue_forKey___block_invoke;
  block[3] = &unk_1E2647818;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_async(v8, block);

}

uint64_t __46__BMSimpleKeyValueStorage_insertValue_forKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertValue:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_insertValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[BMSimpleKeyValueStorage readDictionary](self, "readDictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

  -[BMSimpleKeyValueStorage storeDictionary:](self, "storeDictionary:", v8);
}

- (id)fetchValueForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[BMSimpleKeyValueStorage queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__BMSimpleKeyValueStorage_fetchValueForKey___block_invoke;
  block[3] = &unk_1E2647840;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__BMSimpleKeyValueStorage_fetchValueForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_fetchValueForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_fetchValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[BMSimpleKeyValueStorage readDictionary](self, "readDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)deleteValueForKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[BMSimpleKeyValueStorage queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__BMSimpleKeyValueStorage_deleteValueForKey___block_invoke;
  block[3] = &unk_1E2647868;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __45__BMSimpleKeyValueStorage_deleteValueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteValueForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_deleteValueForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMSimpleKeyValueStorage readDictionary](self, "readDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

  -[BMSimpleKeyValueStorage storeDictionary:](self, "storeDictionary:", v5);
}

- (id)readDictionary
{
  BMFileManager *fileManager;
  NSURL **p_url;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v15;
  id v16;

  fileManager = self->_fileManager;
  p_url = &self->_url;
  -[NSURL path](self->_url, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  -[BMFileManager dataWithContentsOfFileAtPath:error:](fileManager, "dataWithContentsOfFileAtPath:error:", v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;

  if (!v6)
  {
    v9 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0CB3510], "bm_allowedClassesForSecureCodingBMBookmark");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v10, v5, &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;

    if (v6)
    {
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BMSimpleKeyValueStorage readDictionary].cold.2(p_url);
    }
    else
    {
      if (!v11)
        goto LABEL_9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v11;
        goto LABEL_10;
      }
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BMSimpleKeyValueStorage readDictionary].cold.1((uint64_t)v11, p_url);
    }

LABEL_9:
    v13 = (id)objc_opt_new();
LABEL_10:
    v8 = v13;

    goto LABEL_11;
  }
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[BMSimpleKeyValueStorage readDictionary].cold.3(p_url);

  v8 = (void *)objc_opt_new();
LABEL_11:

  return v8;
}

- (void)storeDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  BMFileManager *fileManager;
  void *v12;
  int v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v6)
  {
    v7 = v6;
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D01D10], "privacyURLToString:", self->_url);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2114;
      v19 = v9;
      v20 = 2112;
      v21 = v7;
      v10 = "Failed to archive dictionary:%@ at path:%{public}@ error:%@";
LABEL_7:
      _os_log_error_impl(&dword_18D810000, v8, OS_LOG_TYPE_ERROR, v10, buf, 0x20u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  fileManager = self->_fileManager;
  -[NSURL path](self->_url, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v13 = -[BMFileManager replaceFileAtPath:withData:protection:error:](fileManager, "replaceFileAtPath:withData:protection:error:", v12, v5, 0xFFFFFFFFLL, &v14);
  v7 = v14;

  if (v13)
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D01D10], "privacyURLToString:", self->_url);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v17 = v4;
      v18 = 2114;
      v19 = v9;
      v20 = 2112;
      v21 = v7;
      v10 = "Failed to store dictionary:%@ at path:%{public}@ error:%@";
      goto LABEL_7;
    }
LABEL_8:

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSURL)url
{
  return self->_url;
}

- (BMFileManager)fileManager
{
  return self->_fileManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)readDictionary
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0D01D10], "privacyURLToString:", *a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_7(&dword_18D810000, v2, v3, "Failed to read data from path:%{public}@ error:%@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
