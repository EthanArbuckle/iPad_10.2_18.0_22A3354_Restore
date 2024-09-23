@implementation ICDataPersister

- (ICDataPersister)init
{
  -[ICDataPersister doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICDataPersister)initWithObjectIdentifier:(id)a3 forPasteboard:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  ICDataPersister *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *cacheDirectoryURL;
  uint64_t v15;
  NSMutableArray *allURLs;
  uint64_t v17;
  NSMutableDictionary *identifierToDataDictionary;
  objc_super v20;

  v4 = a4;
  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICDataPersister;
  v8 = -[ICDataPersister init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "rootCacheDirectoryPathForPasteboard:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    cacheDirectoryURL = v8->_cacheDirectoryURL;
    v8->_cacheDirectoryURL = (NSURL *)v13;

    objc_storeStrong((id *)&v8->_objectIdentifier, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    allURLs = v8->_allURLs;
    v8->_allURLs = (NSMutableArray *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    identifierToDataDictionary = v8->_identifierToDataDictionary;
    v8->_identifierToDataDictionary = (NSMutableDictionary *)v17;

    -[ICDataPersister createDataCryptorIfNecessary](v8, "createDataCryptorIfNecessary");
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICDataPersister;
  -[ICDataPersister description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[ICDataPersister cacheDirectoryURL](self, "cacheDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDataPersister objectIdentifier](self, "objectIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ <%@, %@>"), v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)createDataCryptorIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  ICDataCryptor *v7;
  void *v8;
  ICDataCryptor *v9;
  ICDataCryptor *dataCryptor;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  -[ICDataPersister objectIdentifier](self, "objectIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    +[ICNoteContext sharedContext](ICNoteContext, "sharedContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "snapshotManagedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__ICDataPersister_createDataCryptorIfNecessary__block_invoke;
    v11[3] = &unk_1E76C95A8;
    v11[4] = self;
    v6 = v5;
    v12 = v6;
    v13 = &v14;
    objc_msgSend(v6, "performBlockAndWait:", v11);
    if (*((_BYTE *)v15 + 24))
    {
      v7 = [ICDataCryptor alloc];
      -[ICDataPersister objectIdentifier](self, "objectIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ICDataCryptor initWithObjectIdentifier:](v7, "initWithObjectIdentifier:", v8);
      dataCryptor = self->_dataCryptor;
      self->_dataCryptor = v9;

    }
    _Block_object_dispose(&v14, 8);
  }
}

void __47__ICDataPersister_createDataCryptorIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCloudSyncingObject cloudObjectWithIdentifier:context:](ICCloudSyncingObject, "cloudObjectWithIdentifier:context:", v2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "isPasswordProtected");
}

+ (id)rootCacheDirectoryPathForPasteboard:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("pasteboardDataPersister");
  else
    v6 = CFSTR("dataPersister");
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)makeSureCacheDirectoryExists
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v8;

  -[ICDataPersister cacheDirectoryURL](self, "cacheDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v8);
  v5 = v8;

  if ((v4 & 1) == 0)
  {
    v6 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICDataPersister makeSureCacheDirectoryExists].cold.1();

  }
  return v4;
}

- (BOOL)saveData:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;

  v6 = a3;
  v7 = a4;
  if (-[ICDataPersister makeSureCacheDirectoryExists](self, "makeSureCacheDirectoryExists"))
  {
    -[ICDataPersister dataCryptor](self, "dataCryptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ICDataPersister dataCryptor](self, "dataCryptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encryptData:", v6);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v10;
    }
    -[ICDataPersister cacheDirectoryURL](self, "cacheDirectoryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "writeToFile:atomically:", v13, 1);

    if ((v14 & 1) != 0)
    {
      -[ICDataPersister setAccumulatedDataSize:](self, "setAccumulatedDataSize:", -[ICDataPersister accumulatedDataSize](self, "accumulatedDataSize") + objc_msgSend(v6, "length"));
      -[ICDataPersister allURLs](self, "allURLs");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObject:](v15, "addObject:", v12);
    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ICDataPersister saveData:identifier:].cold.1();
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)loadDataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ICDataPersister identifierToDataDictionary](self, "identifierToDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[ICDataPersister cacheDirectoryURL](self, "cacheDirectoryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v6 = (void *)v9;
      -[ICDataPersister dataCryptor](self, "dataCryptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_10;
      -[ICDataPersister dataCryptor](self, "dataCryptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "decryptData:", v6);
      v12 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v12;
      if (v12)
        goto LABEL_10;
      v13 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v8;
        _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEFAULT, "Unable to decrypt data at: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      v13 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[ICDataPersister loadDataForIdentifier:].cold.1();
    }

    v6 = 0;
LABEL_10:

  }
  return v6;
}

- (void)deleteDataFiles
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Failed to delete large data temp directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)verifyDataFiles
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  __int128 v17;
  NSObject *obj;
  char v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[ICDataPersister allURLs](self, "allURLs");
  obj = objc_claimAutoreleasedReturnValue();
  v3 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v22;
    *(_QWORD *)&v4 = 138412290;
    v17 = v4;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "lastPathComponent", v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICDataPersister identifierToDataDictionary](self, "identifierToDataDictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {

          v12 = 0;
        }
        else
        {
          v20 = 0;
          v19 = objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", &v20);
          v12 = v20;

          if ((v19 & 1) == 0)
          {
            if (objc_msgSend(v12, "code") != 4)
            {
              v15 = os_log_create("com.apple.notes", "Topotext");
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v17;
                v26 = v12;
                _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_DEFAULT, "Got error when checking if data persister file exists: %@", buf, 0xCu);
              }

            }
            obj = os_log_create("com.apple.notes", "Topotext");
            if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
              -[ICDataPersister verifyDataFiles].cold.1();
            v14 = 0;
            goto LABEL_21;
          }
        }
        v13 = os_log_create("com.apple.notes", "Topotext");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v17;
          v26 = v8;
          _os_log_debug_impl(&dword_1BD918000, v13, OS_LOG_TYPE_DEBUG, "Verified file exists at %@", buf, 0xCu);
        }

      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v5)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_21:

  return v14;
}

+ (void)deletePasteboardDataFiles
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Failed to delete pasteboard data directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDataPersister)initWithCoder:(id)a3
{
  id v4;
  ICDataPersister *v5;
  uint64_t v6;
  NSURL *cacheDirectoryURL;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *allURLs;
  uint64_t v13;
  NSString *objectIdentifier;
  uint64_t v15;
  ICDataCryptor *dataCryptor;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSMutableDictionary *identifierToDataDictionary;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ICDataPersister;
  v5 = -[ICDataPersister init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cacheDirectoryURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    cacheDirectoryURL = v5->_cacheDirectoryURL;
    v5->_cacheDirectoryURL = (NSURL *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("allURLs"));
    v11 = objc_claimAutoreleasedReturnValue();
    allURLs = v5->_allURLs;
    v5->_allURLs = (NSMutableArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataCryptor"));
    v15 = objc_claimAutoreleasedReturnValue();
    dataCryptor = v5->_dataCryptor;
    v5->_dataCryptor = (ICDataCryptor *)v15;

    v5->_accumulatedDataSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("accumulatedDataSize"));
    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("identifierToDataDictionary"));
    v21 = objc_claimAutoreleasedReturnValue();
    identifierToDataDictionary = v5->_identifierToDataDictionary;
    v5->_identifierToDataDictionary = (NSMutableDictionary *)v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ICDataPersister accumulatedDataSize](self, "accumulatedDataSize"), CFSTR("accumulatedDataSize"));
  -[ICDataPersister cacheDirectoryURL](self, "cacheDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cacheDirectoryURL"));

  -[ICDataPersister allURLs](self, "allURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("allURLs"));

  -[ICDataPersister objectIdentifier](self, "objectIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ICDataPersister objectIdentifier](self, "objectIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("objectIdentifier"));

  }
  -[ICDataPersister dataCryptor](self, "dataCryptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ICDataPersister dataCryptor](self, "dataCryptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("dataCryptor"));

  }
  v11 = -[ICDataPersister accumulatedDataSize](self, "accumulatedDataSize");
  v12 = os_log_create("com.apple.notes", "Topotext");
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11 >> 21 > 0x4A)
  {
    if (v13)
      -[ICDataPersister encodeWithCoder:].cold.2(self, v12);

  }
  else
  {
    v29 = v4;
    if (v13)
      -[ICDataPersister encodeWithCoder:].cold.1(self, v12);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[ICDataPersister allURLs](self, "allURLs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v19, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICDataPersister identifierToDataDictionary](self, "identifierToDataDictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v19);
            v23 = objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              v24 = (void *)v23;
              -[ICDataPersister dataCryptor](self, "dataCryptor");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v25
                || (-[ICDataPersister dataCryptor](self, "dataCryptor"),
                    v26 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v26, "decryptData:", v24),
                    v27 = objc_claimAutoreleasedReturnValue(),
                    v24,
                    v26,
                    (v24 = (void *)v27) != 0))
              {
                -[ICDataPersister identifierToDataDictionary](self, "identifierToDataDictionary");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v24, v20);

              }
            }
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v16);
    }

    -[ICDataPersister identifierToDataDictionary](self, "identifierToDataDictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    v4 = v29;
    objc_msgSend(v29, "encodeObject:forKey:", v12, CFSTR("identifierToDataDictionary"));
  }

}

- (unint64_t)accumulatedDataSize
{
  return self->_accumulatedDataSize;
}

- (void)setAccumulatedDataSize:(unint64_t)a3
{
  self->_accumulatedDataSize = a3;
}

- (ICDataCryptor)dataCryptor
{
  return self->_dataCryptor;
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (NSMutableArray)allURLs
{
  return self->_allURLs;
}

- (NSMutableDictionary)identifierToDataDictionary
{
  return self->_identifierToDataDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToDataDictionary, 0);
  objc_storeStrong((id *)&self->_allURLs, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_dataCryptor, 0);
}

- (void)makeSureCacheDirectoryExists
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Failed to create large data directory with error %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveData:identifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Unable to write data at URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)loadDataForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Unable to find large data at URL: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)verifyDataFiles
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, v0, v1, "Not all files exists for ICDataPersister: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)encodeWithCoder:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accumulatedDataSize");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v3, "Encoding all data for pasteboard: %lu", v4);
  OUTLINED_FUNCTION_4_0();
}

- (void)encodeWithCoder:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accumulatedDataSize");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_2(&dword_1BD918000, a2, v3, "Data is too large to be encoded for the pasteboard: %lu", v4);
  OUTLINED_FUNCTION_4_0();
}

@end
