@implementation NTKFaceSupportDateDatabase

- (NTKFaceSupportDateDatabase)initWithFileAtPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NTKFaceSupportDateDatabase *v7;
  uint64_t v8;
  NSString *filePath;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *fileQueue;
  NTKFaceSupportDateDatabase *v13;
  objc_super v15;

  v4 = a3;
  if (objc_msgSend(v4, "length")
    && (objc_msgSend(v4, "pathExtension"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("db")),
        v5,
        v6))
  {
    v15.receiver = self;
    v15.super_class = (Class)NTKFaceSupportDateDatabase;
    v7 = -[NTKFaceSupportDateDatabase init](&v15, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v4, "copy");
      filePath = v7->_filePath;
      v7->_filePath = (NSString *)v8;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = dispatch_queue_create("com.apple.facesupport.dateDatabase", v10);
      fileQueue = v7->_fileQueue;
      v7->_fileQueue = (OS_dispatch_queue *)v11;

    }
    self = v7;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)recordDate:(id)a3 bundleIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *fileQueue;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    v11 = v9;
    goto LABEL_9;
  }
  v11 = (id)objc_msgSend(v9, "copy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 405, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fileQueue = self->_fileQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke;
    block[3] = &unk_1E6BCE3C8;
    v27 = v13;
    v28 = v10;
    v15 = v13;
    dispatch_async(fileQueue, block);

    v16 = v28;
LABEL_8:

    goto LABEL_9;
  }
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 411, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_fileQueue;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke_2;
    v23[3] = &unk_1E6BCE3C8;
    v24 = v17;
    v25 = v10;
    v15 = v17;
    dispatch_async(v18, v23);

    v16 = v25;
    goto LABEL_8;
  }
  v12 = self->_fileQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke_3;
  v19[3] = &unk_1E6BD1840;
  v19[4] = self;
  v20 = v8;
  v11 = v11;
  v21 = v11;
  v22 = v10;
  dispatch_async(v12, v19);

LABEL_9:
}

uint64_t __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __69__NTKFaceSupportDateDatabase_recordDate_bundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_queue_loadLookup");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "_queue_save");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)retreiveDateForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *fileQueue;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");

    if (objc_msgSend(v8, "length"))
    {
      fileQueue = self->_fileQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__NTKFaceSupportDateDatabase_retreiveDateForBundleIdentifier_completion___block_invoke_2;
      block[3] = &unk_1E6BCD820;
      block[4] = self;
      v8 = v8;
      v14 = v8;
      v15 = v7;
      dispatch_async(fileQueue, block);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 411, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = self->_fileQueue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __73__NTKFaceSupportDateDatabase_retreiveDateForBundleIdentifier_completion___block_invoke;
      v16[3] = &unk_1E6BCE3C8;
      v17 = v10;
      v18 = v7;
      v12 = v10;
      dispatch_async(v11, v16);

    }
  }
  else
  {
    v8 = v6;
  }

}

uint64_t __73__NTKFaceSupportDateDatabase_retreiveDateForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __73__NTKFaceSupportDateDatabase_retreiveDateForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_loadLookup");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 404, 0);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)deleteDateForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *fileQueue;
  _QWORD v16[5];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = (id)objc_msgSend(v6, "copy");

    if (objc_msgSend(v8, "length"))
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("NTKFaceSupportDateDatabaseInvalidDeleteIdentifier")))
      {
        fileQueue = self->_fileQueue;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke_3;
        v16[3] = &unk_1E6BCD820;
        v16[4] = self;
        v8 = v8;
        v17 = v8;
        v18 = v7;
        dispatch_async(fileQueue, v16);

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 503, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_fileQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke_2;
      block[3] = &unk_1E6BCE3C8;
      v20 = v9;
      v21 = v7;
      v11 = v9;
      dispatch_async(v10, block);

      v12 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 411, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_fileQueue;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke;
      v22[3] = &unk_1E6BCE3C8;
      v23 = v13;
      v24 = v7;
      v11 = v13;
      dispatch_async(v14, v22);

      v12 = v24;
    }

  }
  else
  {
    v8 = v6;
  }
LABEL_9:

}

uint64_t __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__NTKFaceSupportDateDatabase_deleteDateForBundleIdentifier_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_queue_loadLookup");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_queue_save");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 404, 0);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_queue_loadLookup
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *lookup;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  id v19;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_fileQueue);
  if (!self->_lookup)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileExistsAtPath:", self->_filePath);

    if ((v4 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", self->_filePath, 1, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 1, &v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v19;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = 0;
        v16 = &v15;
        v17 = 0x2020000000;
        v18 = 1;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __47__NTKFaceSupportDateDatabase__queue_loadLookup__block_invoke;
        v14[3] = &unk_1E6BD8C40;
        v14[4] = &v15;
        objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v14);
        if (*((_BYTE *)v16 + 24))
        {
          v8 = v6;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        }
        lookup = self->_lookup;
        self->_lookup = v8;

        _Block_object_dispose(&v15, 8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v12 = self->_lookup;
        self->_lookup = v11;

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v10 = self->_lookup;
      self->_lookup = v9;

    }
  }
}

void __47__NTKFaceSupportDateDatabase__queue_loadLookup__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)_queue_save
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSString *filePath;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  const __CFString *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_fileQueue);
  -[NTKFaceSupportDateDatabase _queue_loadLookup](self, "_queue_loadLookup");
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", self->_lookup, 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSString stringByDeletingLastPathComponent](self->_filePath, "stringByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", self->_filePath, 0);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0CB2AD8];
      v21[0] = *MEMORY[0x1E0CB2AE0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, v8, 0);

    }
    filePath = self->_filePath;
    v17 = 0;
    v10 = objc_msgSend(v3, "writeToFile:options:error:", filePath, 1, &v17);
    v11 = v17;
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v18 = CFSTR("writeError");
      v19 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 503, v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("NTKFaceSupportDateDatabaseErrorDomain"), 302, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_lookup, 0);
  objc_storeStrong((id *)&self->_fileQueue, 0);
}

@end
