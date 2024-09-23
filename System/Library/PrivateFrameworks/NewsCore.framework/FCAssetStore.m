@implementation FCAssetStore

- (id)filePathForKey:(id)a3
{
  id v4;
  NSMutableSet *knownKeys;
  void *v6;

  v4 = a3;
  if (self)
    knownKeys = self->_knownKeys;
  else
    knownKeys = 0;
  if (-[NSMutableSet containsObject:](knownKeys, "containsObject:", v4))
  {
    -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_filePathForKey:(uint64_t)a1
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(*(id *)(a1 + 8), "stringByAppendingPathComponent:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 16), "length"))
  {
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", v3);

    if ((v5 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("asset store keys should not have an extension"));
      v9 = 136315906;
      v10 = "-[FCAssetStore _filePathForKey:]";
      v11 = 2080;
      v12 = "FCAssetStore.m";
      v13 = 1024;
      v14 = 284;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v9, 0x26u);

    }
    objc_msgSend(v3, "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 16));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return v3;
}

- (id)allKeys
{
  if (self)
    self = (FCAssetStore *)self->_knownKeys;
  return (id)-[FCAssetStore allObjects](self, "allObjects");
}

- (FCAssetStore)initWithDirectoryAtPath:(id)a3 preferredAssetPathExtension:(id)a4 knownKeys:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCAssetStore *v11;
  uint64_t v12;
  NSString *directoryPath;
  uint64_t v14;
  NSString *preferredExtension;
  NSMutableSet *v16;
  NSMutableSet *knownKeys;
  NSObject *v18;
  uint64_t v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *removalQueue;
  FCThreadSafeMutableSet *v22;
  FCThreadSafeMutableSet *keysAwaitingRemoval;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  id v46;
  id v47;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  objc_super v54;
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v54.receiver = self;
  v54.super_class = (Class)FCAssetStore;
  v11 = -[FCAssetStore init](&v54, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    directoryPath = v11->_directoryPath;
    v11->_directoryPath = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    preferredExtension = v11->_preferredExtension;
    v11->_preferredExtension = (NSString *)v14;

    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    knownKeys = v11->_knownKeys;
    v11->_knownKeys = v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v18, QOS_CLASS_BACKGROUND, 0);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.assetstore.removal", (dispatch_queue_attr_t)v19);
    removalQueue = v11->_removalQueue;
    v11->_removalQueue = (OS_dispatch_queue *)v20;

    v22 = objc_alloc_init(FCThreadSafeMutableSet);
    keysAwaitingRemoval = v11->_keysAwaitingRemoval;
    v11->_keysAwaitingRemoval = v22;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0;
    LOBYTE(v19) = objc_msgSend(v24, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 0, 0, &v53);
    v25 = v53;

    if ((v19 & 1) == 0 && objc_msgSend(v25, "code") != 516)
    {
      v26 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v57 = v25;
        _os_log_error_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_ERROR, "error creating asset store directory: %{public}@", buf, 0xCu);
      }
    }
    v44 = v25;
    v46 = v10;
    v47 = v9;
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v44);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "subpathsOfDirectoryAtPath:error:", v8, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v29;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v50 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          v35 = (void *)MEMORY[0x1A8580B64]();
          v36 = v34;
          if (-[NSString length](v11->_preferredExtension, "length"))
          {
            objc_msgSend(v36, "stringByDeletingPathExtension");
            v37 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v37 = v36;
          }
          v38 = v37;

          objc_msgSend(v8, "stringByAppendingPathComponent:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v27)
            goto LABEL_20;
          objc_msgSend(v27, "member:", v38);
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            v41 = (void *)v40;

            v38 = v41;
LABEL_20:
            -[NSMutableSet addObject:](v11->_knownKeys, "addObject:", v38);
            goto LABEL_22;
          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "removeItemAtPath:error:", v39, 0);

LABEL_22:
          objc_autoreleasePoolPop(v35);
        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v31);
    }

    v10 = v46;
    v9 = v47;
  }

  return v11;
}

- (FCAssetStore)initWithDirectoryAtPath:(id)a3 preferredAssetPathExtension:(id)a4
{
  return -[FCAssetStore initWithDirectoryAtPath:preferredAssetPathExtension:knownKeys:](self, "initWithDirectoryAtPath:preferredAssetPathExtension:knownKeys:", a3, a4, 0);
}

- (id)copyFileAtPath:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FCThreadSafeMutableSet *keysAwaitingRemoval;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSMutableSet *knownKeys;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    keysAwaitingRemoval = self->_keysAwaitingRemoval;
  else
    keysAwaitingRemoval = 0;
  -[FCThreadSafeMutableSet removeObject:](keysAwaitingRemoval, "removeObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v13 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v12, v9, &v22);
  v14 = v22;

  if (v13)
  {
    if (self)
      knownKeys = self->_knownKeys;
    else
      knownKeys = 0;
    -[NSMutableSet addObject:](knownKeys, "addObject:", v7);
    goto LABEL_7;
  }
  objc_msgSend(v14, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v18 = objc_msgSend(v14, "code");

    if (v18 == 516)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeItemAtURL:error:", v9, 0);

LABEL_7:
      v16 = v8;
      goto LABEL_15;
    }
  }
  else
  {

  }
  v20 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v24 = v14;
    _os_log_error_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_ERROR, "error copying file into asset store: %{public}@", buf, 0xCu);
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (id)moveFileAtPath:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  FCThreadSafeMutableSet *keysAwaitingRemoval;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSMutableSet *knownKeys;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    keysAwaitingRemoval = self->_keysAwaitingRemoval;
  else
    keysAwaitingRemoval = 0;
  -[FCThreadSafeMutableSet removeObject:](keysAwaitingRemoval, "removeObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v13 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v12, v9, &v22);
  v14 = v22;

  if (v13)
  {
    if (self)
      knownKeys = self->_knownKeys;
    else
      knownKeys = 0;
    -[NSMutableSet addObject:](knownKeys, "addObject:", v7);
  }
  else
  {
    objc_msgSend(v14, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v17 = objc_msgSend(v14, "code");

      if (v17 == 516)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeItemAtURL:error:", v9, 0);

        v19 = -[FCAssetStore moveFileAtPath:withKey:](self, "moveFileAtPath:withKey:", v6, v7);
        goto LABEL_14;
      }
    }
    else
    {

    }
    v20 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v14;
      _os_log_error_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_ERROR, "error moving file into asset store: %{public}@", buf, 0xCu);
    }

    v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)moveFileAtURL:(id)a3 withKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetStore moveFileAtPath:withKey:](self, "moveFileAtPath:withKey:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyData:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  FCThreadSafeMutableSet *keysAwaitingRemoval;
  int v10;
  id v11;
  NSMutableSet *knownKeys;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    keysAwaitingRemoval = self->_keysAwaitingRemoval;
  else
    keysAwaitingRemoval = 0;
  -[FCThreadSafeMutableSet removeObject:](keysAwaitingRemoval, "removeObject:", v6);
  v15 = 0;
  v10 = objc_msgSend(v7, "writeToFile:options:error:", v8, 1, &v15);

  v11 = v15;
  if (v10)
  {
    if (self)
      knownKeys = self->_knownKeys;
    else
      knownKeys = 0;
    -[NSMutableSet addObject:](knownKeys, "addObject:", v6);
  }
  else
  {
    v13 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_error_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_ERROR, "error copying data into asset store: %{public}@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

- (void)removeFileWithKey:(id)a3
{
  id v4;
  NSObject *removalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
  {
    -[NSMutableSet removeObject:](self->_knownKeys, "removeObject:", v4);
    -[FCThreadSafeMutableSet addObject:](self->_keysAwaitingRemoval, "addObject:", v4);
    removalQueue = self->_removalQueue;
  }
  else
  {
    objc_msgSend(0, "removeObject:", v4);
    objc_msgSend(0, "addObject:", v4);
    removalQueue = 0;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__FCAssetStore_removeFileWithKey___block_invoke;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(removalQueue, v7);

}

void __34__FCAssetStore_removeFileWithKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  -[FCAssetStore _filePathForKey:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(void **)(v3 + 40);
  else
    v4 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__FCAssetStore_removeFileWithKey___block_invoke_2;
  v6[3] = &unk_1E463B8A8;
  v7 = *(id *)(a1 + 40);
  v8 = v2;
  v5 = v2;
  objc_msgSend(v4, "readWriteWithAccessor:", v6);

}

void __34__FCAssetStore_removeFileWithKey___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v9 = 0;
    v6 = objc_msgSend(v4, "removeItemAtPath:error:", v5, &v9);
    v7 = v9;

    if ((v6 & 1) == 0)
    {
      v8 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        _os_log_error_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_ERROR, "error deleting file from asset store: %{public}@", buf, 0xCu);
      }
    }
    objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

  }
}

- (void)removeAllFilesExceptKeys:(id)a3
{
  void *v4;
  NSMutableSet *knownKeys;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  if (self)
    knownKeys = self->_knownKeys;
  else
    knownKeys = 0;
  v6 = knownKeys;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v4, "containsObject:", v11, (_QWORD)v12) & 1) == 0)
          -[FCAssetStore removeFileWithKey:](self, "removeFileWithKey:", v11);
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)removeAllFiles
{
  NSMutableSet *knownKeys;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  if (self)
    knownKeys = self->_knownKeys;
  else
    knownKeys = 0;
  v4 = knownKeys;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[FCAssetStore removeFileWithKey:](self, "removeFileWithKey:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9);
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)fileURLForKey:(id)a3
{
  void *v3;
  void *v4;

  -[FCAssetStore filePathForKey:](self, "filePathForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)sizeOfFileForKey:(id)a3
{
  id v4;
  void *v5;
  off_t v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "key");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCAssetStore sizeOfFileForKey:]";
    v11 = 2080;
    v12 = "FCAssetStore.m";
    v13 = 1024;
    v14 = 245;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCAssetStore _filePathForKey:]((uint64_t)self, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FCAssetStore _sizeOfFileAtPath:]((off_t)self, v5);

  return v6;
}

- (off_t)_sizeOfFileAtPath:(off_t)result
{
  stat v2;

  if (result)
  {
    memset(&v2, 0, sizeof(v2));
    if (lstat((const char *)objc_msgSend(objc_retainAutorelease(a2), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v2))
    {
      return 0;
    }
    else
    {
      return v2.st_size;
    }
  }
  return result;
}

- (unint64_t)storeSize
{
  FCAssetStore *v2;
  void *v3;
  unint64_t v4;

  v2 = self;
  if (self)
    self = (FCAssetStore *)self->_knownKeys;
  -[FCAssetStore allObjects](self, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCAssetStore storeSizeForKeys:](v2, "storeSizeForKeys:", v3);

  return v4;
}

- (unint64_t)storeSizeForKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A8580B64]();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        -[FCAssetStore _filePathForKey:]((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += -[FCAssetStore _sizeOfFileAtPath:]((off_t)self, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysAwaitingRemoval, 0);
  objc_storeStrong((id *)&self->_removalQueue, 0);
  objc_storeStrong((id *)&self->_knownKeys, 0);
  objc_storeStrong((id *)&self->_preferredExtension, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);
}

@end
