@implementation ICAssetGenerationManager

- (void)setFallbackURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ICAssetGenerationManager)initWithObject:(id)a3 generationKeyPath:(id)a4 containerURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  ICAssetGenerationManager *v12;
  ICAssetGenerationManager *v13;
  NSArray *fallbackURLs;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  ICAssetGenerationManager *v21;
  NSObject *v22;
  void *v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && objc_msgSend(v9, "length"))
  {

    if (v10)
    {
      v25.receiver = self;
      v25.super_class = (Class)ICAssetGenerationManager;
      v12 = -[ICAssetGenerationManager init](&v25, sel_init);
      v13 = v12;
      if (v12)
      {
        objc_storeWeak((id *)&v12->_object, v8);
        objc_storeStrong((id *)&v13->_generationKeyPath, a4);
        objc_storeStrong((id *)&v13->_containerURL, a5);
        fallbackURLs = v13->_fallbackURLs;
        v13->_fallbackURLs = (NSArray *)MEMORY[0x1E0C9AA60];

        v13->_generationTimeout = 3600.0;
        -[ICAssetGenerationManager updateCurrentGeneration](v13, "updateCurrentGeneration");
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *MEMORY[0x1E0C978B0];
        objc_msgSend(v8, "managedObjectContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel_managedObjectContextObjectsDidChange_, v16, v17);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *MEMORY[0x1E0C978A8];
        objc_msgSend(v8, "managedObjectContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObserver:selector:name:object:", v13, sel_managedObjectContextDidSaveObjectIDs_, v19, v20);

      }
      self = v13;
      v21 = self;
      goto LABEL_11;
    }
  }
  else
  {

  }
  v22 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "shortLoggingDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v27 = v24;
    v28 = 2112;
    v29 = v9;
    v30 = 2112;
    v31 = v10;
    _os_log_error_impl(&dword_1BD918000, v22, OS_LOG_TYPE_ERROR, "Cannot create asset generation manager because parameters are invalid {object: %@, generationKeyPath: %@, containerUrl: %@}", buf, 0x20u);

  }
  v21 = 0;
LABEL_11:

  return v21;
}

- (void)dealloc
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "containerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Deallocating asset generation manager while advancing asset generation — rolling back {object: %@, containerUrl: %@}", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)updateCurrentGeneration
{
  void *v3;
  void *v4;
  void *v5;
  ICAssetGeneration *v6;
  void *v7;
  void *v8;
  void *v9;
  ICAssetGeneration *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  int v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  void *v21;
  char v22;
  id v23;

  objc_opt_class();
  -[ICAssetGenerationManager object](self, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAssetGenerationManager generationKeyPath](self, "generationKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v23 = (id)objc_claimAutoreleasedReturnValue();

  if (v23)
    v6 = -[ICAssetGeneration initWithRawValue:]([ICAssetGeneration alloc], "initWithRawValue:", v23);
  else
    v6 = 0;
  -[ICAssetGenerationManager nextGeneration](self, "nextGeneration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_31:
    -[ICAssetGenerationManager setCurrentGeneration:](self, "setCurrentGeneration:", v6);
    goto LABEL_32;
  }
  -[ICAssetGenerationManager currentGeneration](self, "currentGeneration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((ICAssetGeneration *)*MEMORY[0x1E0C9B0D0] == v6)
    v10 = 0;
  else
    v10 = v6;
  v11 = v10;
  if (v9 == v8)
    v12 = 0;
  else
    v12 = v8;
  v13 = v12;
  if (!(v11 | v13))
  {

    goto LABEL_19;
  }
  v14 = (void *)v13;
  if (v11)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (v15)
  {

    goto LABEL_21;
  }
  v16 = objc_msgSend((id)v11, "isEqual:", v13);

  if (v16)
  {
LABEL_19:
    -[ICAssetGenerationManager setAdvancing:](self, "setAdvancing:", 1);
    -[ICAssetGenerationManager rollbackGeneration](self, "rollbackGeneration");
    goto LABEL_32;
  }
LABEL_21:
  -[ICAssetGenerationManager nextGeneration](self, "nextGeneration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)v11;
  if (v9 == v17)
    v19 = 0;
  else
    v19 = v17;
  v20 = v19;
  if (v11 | v20)
  {
    v21 = (void *)v20;
    if (v11 && v20)
    {
      v22 = objc_msgSend(v18, "isEqual:", v20);

      if ((v22 & 1) != 0)
        goto LABEL_32;
    }
    else
    {

    }
    goto LABEL_31;
  }

LABEL_32:
}

- (NSURL)generationURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ICAssetGenerationManager nextGeneration](self, "nextGeneration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICAssetGenerationManager currentGeneration](self, "currentGeneration");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(v6, "rawValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ICAssetGenerationManager containerURL](self, "containerURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rawValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return (NSURL *)v10;
}

- (ICAssetGeneration)nextGeneration
{
  return self->_nextGeneration;
}

- (ICAssetGeneration)currentGeneration
{
  return self->_currentGeneration;
}

- (void)setCurrentGeneration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)objc_loadWeakRetained((id *)&self->_object);
}

- (NSString)generationKeyPath
{
  return self->_generationKeyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextGenerationLock, 0);
  objc_storeStrong((id *)&self->_nextGeneration, 0);
  objc_storeStrong((id *)&self->_currentGeneration, 0);
  objc_storeStrong((id *)&self->_fallbackURLs, 0);
  objc_storeStrong((id *)&self->_containerURL, 0);
  objc_storeStrong((id *)&self->_generationKeyPath, 0);
  objc_destroyWeak((id *)&self->_object);
}

- (void)managedObjectContextObjectsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[ICAssetGenerationManager object](self, "object");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[ICAssetGenerationManager object](self, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "containsObject:", v9) & 1) != 0)
    {
      -[ICAssetGenerationManager object](self, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "changedValuesForCurrentEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAssetGenerationManager generationKeyPath](self, "generationKeyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "containsObject:", v13);

      if (v14)
        -[ICAssetGenerationManager updateCurrentGeneration](self, "updateCurrentGeneration");
    }
    else
    {

    }
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAssetGenerationManager object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortLoggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAssetGenerationManager containerURL](self, "containerURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ICAssetGenerationManager isAdvancing](self, "isAdvancing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, object: %@, containerURL: %@, isAdvancing: %@>"), v5, self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)beginGeneration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  ICAssetGeneration *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v42;
  NSObject *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICAssetGenerationManager object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortLoggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager containerURL](self, "containerURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v46 = v5;
    v47 = 2112;
    v49 = 2080;
    v48 = v6;
    v50 = "-[ICAssetGenerationManager beginGeneration]";
    v51 = 1024;
    v52 = 115;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Beginning asset generation… {object: %@, containerUrl: %@}%s:%d", buf, 0x26u);

  }
  if (!-[ICAssetGenerationManager isAdvancing](self, "isAdvancing"))
  {
    -[ICAssetGenerationManager object](self, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v7 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ICAssetGenerationManager beginGeneration].cold.2(self);
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager containerURL](self, "containerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v12 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v44);
    v13 = v44;
    v14 = v13;
    if ((v12 & 1) != 0)
    {

    }
    else
    {
      v16 = -[NSObject code](v13, "code");

      if (v16 != 516)
      {
        v7 = os_log_create("com.apple.notes", "Media");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          -[ICAssetGenerationManager beginGeneration].cold.6(self);

        goto LABEL_34;
      }
    }
    -[ICAssetGenerationManager nextGeneration](self, "nextGeneration");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAssetGenerationManager generationURL](self, "generationURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v14;
      v21 = objc_msgSend(v19, "removeItemAtURL:error:", v20, &v43);
      v22 = v43;

      if ((v21 & 1) == 0)
      {
        v23 = os_log_create("com.apple.notes", "Media");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[ICAssetGenerationManager beginGeneration].cold.5(self);

      }
    }
    else
    {
      v22 = v14;
    }
    -[ICAssetGenerationManager currentGeneration](self, "currentGeneration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "nextGeneration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      -[ICAssetGenerationManager setNextGeneration:](self, "setNextGeneration:", v25);
    }
    else
    {
      v26 = objc_alloc_init(ICAssetGeneration);
      -[ICAssetGenerationManager setNextGeneration:](self, "setNextGeneration:", v26);

    }
    -[ICAssetGenerationManager setAdvancing:](self, "setAdvancing:", 1);
    -[ICAssetGenerationManager containerURL](self, "containerURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager nextGeneration](self, "nextGeneration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rawValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "URLByAppendingPathComponent:isDirectory:", v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "URLByAppendingPathExtension:", CFSTR("lock"));
    v7 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0D641F0];
    -[NSObject path](v7, "path");
    v32 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lockWithPath:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager setNextGenerationLock:](self, "setNextGenerationLock:", v33);

    -[ICAssetGenerationManager nextGenerationLock](self, "nextGenerationLock");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v32) = objc_msgSend(v34, "tryLock");

    if ((v32 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAssetGenerationManager generationURL](self, "generationURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v22;
      v15 = 1;
      v37 = objc_msgSend(v35, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v36, 1, 0, &v42);
      v14 = v42;

      if ((v37 & 1) != 0)
        goto LABEL_35;
      v38 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[ICAssetGenerationManager beginGeneration].cold.3(self);

      -[ICAssetGenerationManager setNextGeneration:](self, "setNextGeneration:", 0);
      -[ICAssetGenerationManager nextGenerationLock](self, "nextGenerationLock");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "unlock");

    }
    else
    {
      v40 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[ICAssetGenerationManager beginGeneration].cold.4(self);

      -[ICAssetGenerationManager setNextGeneration:](self, "setNextGeneration:", 0);
      v14 = v22;
    }
    -[ICAssetGenerationManager setNextGenerationLock:](self, "setNextGenerationLock:", 0);
    -[ICAssetGenerationManager setAdvancing:](self, "setAdvancing:", 0);
LABEL_34:
    v15 = 0;
    goto LABEL_35;
  }
  v7 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[ICAssetGenerationManager beginGeneration].cold.1();
LABEL_11:
  v15 = 0;
  v14 = v7;
LABEL_35:

  return v15;
}

- (BOOL)commitGeneration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICAssetGenerationManager object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortLoggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager containerURL](self, "containerURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v5;
    v18 = 2112;
    v20 = 2080;
    v19 = v6;
    v21 = "-[ICAssetGenerationManager commitGeneration]";
    v22 = 1024;
    v23 = 172;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Committing asset generation… {object: %@, containerUrl: %@}%s:%d", (uint8_t *)&v16, 0x26u);

  }
  if (-[ICAssetGenerationManager isAdvancing](self, "isAdvancing"))
  {
    -[ICAssetGenerationManager object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ICAssetGenerationManager setAdvancing:](self, "setAdvancing:", 0);
      -[ICAssetGenerationManager object](self, "object");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAssetGenerationManager nextGeneration](self, "nextGeneration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rawValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAssetGenerationManager generationKeyPath](self, "generationKeyPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v11, v12);

      return 1;
    }
    v15 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ICAssetGenerationManager commitGeneration].cold.1(self);

    -[ICAssetGenerationManager rollbackGeneration](self, "rollbackGeneration");
  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICAssetGenerationManager commitGeneration].cold.2();

  }
  return 0;
}

- (BOOL)rollbackGeneration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  os_log_t v12;
  NSObject *v13;
  os_log_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICAssetGenerationManager object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortLoggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager containerURL](self, "containerURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = v5;
    v22 = 2112;
    v24 = 2080;
    v23 = v6;
    v25 = "-[ICAssetGenerationManager rollbackGeneration]";
    v26 = 1024;
    v27 = 197;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Rolling back asset generation… {object: %@, containerUrl: %@}%s:%d", buf, 0x26u);

  }
  v7 = -[ICAssetGenerationManager isAdvancing](self, "isAdvancing");
  if (v7)
  {
    -[ICAssetGenerationManager nextGenerationLock](self, "nextGenerationLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unlock");

    -[ICAssetGenerationManager setNextGenerationLock:](self, "setNextGenerationLock:", 0);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager generationURL](self, "generationURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v11 = objc_msgSend(v9, "removeItemAtURL:error:", v10, &v19);
    v12 = (os_log_t)v19;

    if ((v11 & 1) == 0)
    {
      v13 = os_log_create("com.apple.notes", "Media");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ICAssetGenerationManager beginGeneration].cold.5(self);

    }
    -[ICAssetGenerationManager setNextGeneration:](self, "setNextGeneration:", 0);
    -[ICAssetGenerationManager setAdvancing:](self, "setAdvancing:", 0);
    -[ICAssetGenerationManager object](self, "object");
    v14 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager currentGeneration](self, "currentGeneration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rawValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager generationKeyPath](self, "generationKeyPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setValue:forKey:](v14, "setValue:forKey:", v16, v17);

  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICAssetGenerationManager rollbackGeneration].cold.2();
    v12 = v14;
  }

  return v7;
}

- (void)removeStaleGenerations
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  char v20;
  char v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  ICAssetGeneration *v26;
  ICAssetGenerationManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  BOOL v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  NSObject *v42;
  void *v43;
  char v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  char v57;
  uint64_t v58;
  __int128 v59;
  void *v60;
  id v61;
  ICAssetGenerationManager *v62;
  ICAssetGeneration *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  int v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Media");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ICAssetGenerationManager object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortLoggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager containerURL](self, "containerURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v84 = v5;
    v85 = 2112;
    v87 = 2080;
    v86 = v6;
    v88 = "-[ICAssetGenerationManager removeStaleGenerations]";
    v89 = 1024;
    v90 = 227;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_DEFAULT, "Removing stale generations… {object: %@, containerUrl: %@}%s:%d", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = self;
  -[ICAssetGenerationManager containerURL](self, "containerURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = *MEMORY[0x1E0C999D0];
  v82 = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, v9, 1, &v79);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v79;

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
  v61 = v12;
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v76;
    *(_QWORD *)&v14 = 138412546;
    v59 = v14;
    v65 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v76 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v18, "pathExtension", v59);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqual:", CFSTR("lock"));

        if ((v20 & 1) == 0)
        {
          v73 = 0;
          v74 = 0;
          v21 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v74, v66, &v73);
          v22 = v74;
          v23 = v73;

          if ((v21 & 1) == 0)
          {
            v25 = os_log_create("com.apple.notes", "Media");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v18;
              _os_log_error_impl(&dword_1BD918000, v25, OS_LOG_TYPE_ERROR, "Cannot determine if URL is directory — skipping {url: %@}", buf, 0xCu);
            }
            goto LABEL_48;
          }
          if ((objc_msgSend(v22, "BOOLValue") & 1) == 0)
          {
            v25 = os_log_create("com.apple.notes", "Media");
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v18;
              _os_log_debug_impl(&dword_1BD918000, v25, OS_LOG_TYPE_DEBUG, "Skipping non-directory file {url: %@}", buf, 0xCu);
            }
            goto LABEL_48;
          }
          objc_msgSend(v18, "pathComponents");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastObject");
          v25 = objc_claimAutoreleasedReturnValue();

          v26 = -[ICAssetGeneration initWithRawValue:]([ICAssetGeneration alloc], "initWithRawValue:", v25);
          if (v26)
          {
            v27 = v62;
            -[ICAssetGenerationManager currentGeneration](v62, "currentGeneration");
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v64;
            if (v28)
            {
              -[ICAssetGenerationManager currentGeneration](v62, "currentGeneration");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[ICAssetGeneration isEqual:](v26, "isEqual:", v29))
              {

                goto LABEL_46;
              }
              v27 = v62;
            }
            v63 = v26;
            -[ICAssetGenerationManager nextGeneration](v27, "nextGeneration");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v29;
            if (v30)
            {
              -[ICAssetGenerationManager nextGeneration](v27, "nextGeneration");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = -[ICAssetGeneration isEqual:](v63, "isEqual:", v31);

              if (v28)
              {
                v29 = v64;

                if (!v32)
                  goto LABEL_30;
              }
              else
              {
                v29 = v64;
                if (!v32)
                  goto LABEL_30;
              }
              v26 = v63;
LABEL_47:

              v12 = v61;
LABEL_48:

              v11 = v23;
              v16 = v65;
              continue;
            }

            if (v28)
            {

            }
LABEL_30:
            objc_msgSend(v18, "URLByAppendingPathExtension:", CFSTR("lock"));
            v28 = objc_claimAutoreleasedReturnValue();
            v33 = (void *)MEMORY[0x1E0D641F0];
            -[NSObject path](v28, "path");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "lockWithPath:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            v60 = v35;
            if ((objc_msgSend(v35, "tryLock") & 1) != 0)
            {
LABEL_36:
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = v23;
              v44 = objc_msgSend(v43, "removeItemAtURL:error:", v18, &v72);
              v45 = v72;

              if ((v44 & 1) == 0)
              {
                v46 = os_log_create("com.apple.notes", "Media");
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v84 = v18;
                  _os_log_error_impl(&dword_1BD918000, v46, OS_LOG_TYPE_ERROR, "Cannot remove asset generation {url: %@}", buf, 0xCu);
                }
                v23 = v45;
                v29 = v64;
                goto LABEL_44;
              }
              v23 = v45;
              v29 = v64;
            }
            else
            {
              -[ICAssetGenerationManager generationTimeout](v62, "generationTimeout");
              if (v36 <= 0.0
                || (objc_msgSend(v35, "lockDate"),
                    v37 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v37, "timeIntervalSinceNow"),
                    v39 = v38,
                    -[ICAssetGenerationManager generationTimeout](v62, "generationTimeout"),
                    v41 = v39 + v40,
                    v37,
                    v41 < 0.0))
              {
                v42 = os_log_create("com.apple.notes", "Media");
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v84 = v18;
                  _os_log_impl(&dword_1BD918000, v42, OS_LOG_TYPE_INFO, "Breaking lock for asset generation {url: %@}", buf, 0xCu);
                }

                objc_msgSend(v60, "breakLock");
                goto LABEL_36;
              }
              v46 = os_log_create("com.apple.notes", "Media");
              if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *__error());
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v59;
                v84 = v18;
                v85 = 2112;
                v86 = v47;
                _os_log_impl(&dword_1BD918000, v46, OS_LOG_TYPE_INFO, "Cannot unlock asset generation — skipping {url: %@, errno: %@}", buf, 0x16u);

              }
LABEL_44:

            }
            v26 = v63;
          }
          else
          {
            v28 = os_log_create("com.apple.notes", "Media");
            v29 = v64;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v18;
              _os_log_debug_impl(&dword_1BD918000, v28, OS_LOG_TYPE_DEBUG, "Skipping non-generational directory {url: %@}", buf, 0xCu);
            }
          }
LABEL_46:
          v64 = v29;

          goto LABEL_47;
        }
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
    }
    while (v15);
  }

  -[ICAssetGenerationManager currentGeneration](v62, "currentGeneration");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    -[ICAssetGenerationManager fallbackURLs](v62, "fallbackURLs");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
    if (!v50)
      goto LABEL_64;
    v51 = v50;
    v52 = *(_QWORD *)v69;
    while (1)
    {
      v53 = 0;
      v54 = v11;
      do
      {
        if (*(_QWORD *)v69 != v52)
          objc_enumerationMutation(v49);
        v55 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v53);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v56 = objc_claimAutoreleasedReturnValue();
        v67 = v54;
        v57 = -[NSObject removeItemAtURL:error:](v56, "removeItemAtURL:error:", v55, &v67);
        v11 = v67;

        if ((v57 & 1) == 0)
        {
          v58 = objc_msgSend(v11, "code");

          if (v58 == 4)
            goto LABEL_62;
          v56 = os_log_create("com.apple.notes", "Media");
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v84 = v55;
            _os_log_error_impl(&dword_1BD918000, v56, OS_LOG_TYPE_ERROR, "Cannot remove fallback {url: %@}", buf, 0xCu);
          }
        }

LABEL_62:
        ++v53;
        v54 = v11;
      }
      while (v51 != v53);
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v68, v80, 16);
      if (!v51)
      {
LABEL_64:

        v12 = v61;
        break;
      }
    }
  }

}

- (void)managedObjectContextDidSaveObjectIDs:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[ICAssetGenerationManager isAdvancing](self, "isAdvancing", a3))
  {
    v4 = os_log_create("com.apple.notes", "Media");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[ICAssetGenerationManager managedObjectContextDidSaveObjectIDs:].cold.1();

    -[ICAssetGenerationManager rollbackGeneration](self, "rollbackGeneration");
  }
  else
  {
    -[ICAssetGenerationManager nextGeneration](self, "nextGeneration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICAssetGenerationManager nextGeneration](self, "nextGeneration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAssetGenerationManager setCurrentGeneration:](self, "setCurrentGeneration:", v6);

      -[ICAssetGenerationManager setNextGeneration:](self, "setNextGeneration:", 0);
      -[ICAssetGenerationManager removeStaleGenerations](self, "removeStaleGenerations");
      -[ICAssetGenerationManager nextGenerationLock](self, "nextGenerationLock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unlock");

      -[ICAssetGenerationManager setNextGenerationLock:](self, "setNextGenerationLock:", 0);
    }
  }
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSArray)fallbackURLs
{
  return self->_fallbackURLs;
}

- (double)generationTimeout
{
  return self->_generationTimeout;
}

- (void)setGenerationTimeout:(double)a3
{
  self->_generationTimeout = a3;
}

- (void)setNextGeneration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isAdvancing
{
  return self->_advancing;
}

- (void)setAdvancing:(BOOL)a3
{
  self->_advancing = a3;
}

- (ICDistributedLock)nextGenerationLock
{
  return self->_nextGenerationLock;
}

- (void)setNextGenerationLock:(id)a3
{
  objc_storeStrong((id *)&self->_nextGenerationLock, a3);
}

- (void)beginGeneration
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "containerURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create assets container directory {url: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)commitGeneration
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "containerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Attempting to commit generation before beginning one {object: %@, containerUrl: %@}", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)rollbackGeneration
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "containerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Attempting to roll back generation before beginning one {object: %@, containerUrl: %@}", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)managedObjectContextDidSaveObjectIDs:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_7_1(), "containerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Context was saved while advancing asset generation — rolling back {object: %@, containerUrl: %@}", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
