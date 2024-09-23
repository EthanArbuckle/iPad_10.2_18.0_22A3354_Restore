@implementation CPSImageStore

+ (id)keyForMapsCategoryID:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;

  v5 = a3;
  v12 = 0;
  +[CPSImageStore _storeDirectoryURL:](CPSImageStore, "_storeDirectoryURL:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v5, CFSTR("png"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v10;
}

+ (id)keyForImageURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;

  v5 = a3;
  v19 = 0;
  +[CPSImageStore _storeDirectoryURL:](CPSImageStore, "_storeDirectoryURL:", &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v5, "pathExtension");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = -[__CFString length](v9, "length");
    v11 = CFSTR("png");
    if (v10)
      v11 = v9;
    v12 = v11;

    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "absoluteString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cps_sha256String");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@"), v15, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v17;
}

+ (id)keyForGEOStyleAttributes:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  __CFString *v20;
  id v21;

  v5 = a3;
  v21 = 0;
  +[CPSImageStore _storeDirectoryURL:](CPSImageStore, "_storeDirectoryURL:", &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v5, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__6;
    v19 = __Block_byref_object_dispose__6;
    v20 = &stru_24C3BB3D8;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__CPSImageStore_keyForGEOStyleAttributes_error___block_invoke_11;
    v14[3] = &unk_24C3BA358;
    v14[4] = &v15;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v16[5], CFSTR("png"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v12;
}

uint64_t __48__CPSImageStore_keyForGEOStyleAttributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "key");
  if (v6 >= objc_msgSend(v5, "key"))
  {
    v8 = objc_msgSend(v4, "key");
    v7 = v8 > objc_msgSend(v5, "key");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void __48__CPSImageStore_keyForGEOStyleAttributes_error___block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (a3)
    v5 = CFSTR("_");
  else
    v5 = &stru_24C3BB3D8;
  v6 = a2;
  v7 = objc_msgSend(v6, "key");
  v8 = objc_msgSend(v6, "value");

  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("%@%d(%d)"), v5, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

+ (id)keyForPOIMuid:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v14 = 0;
  +[CPSImageStore _storeDirectoryURL:](CPSImageStore, "_storeDirectoryURL:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  v8 = v7;
  if (v6)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("muid_%@.%@"), v10, CFSTR("png"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v12;
}

- (id)storeImageData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[CPSImageStore storeImageData:forKey:error:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
      if (a5)
        goto LABEL_8;
    }
    else if (a5)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x24BDD1540], "cps_errorWithCode:", 1);
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v9 = 0;
    goto LABEL_11;
  }
  v9 = v8;
  v21 = 0;
  objc_msgSend(v7, "writeToURL:options:error:", v9, 1, &v21);
  v10 = v21;
  v11 = v10;
  if (a5 && v10)
    *a5 = objc_retainAutorelease(v10);

LABEL_11:
  return v9;
}

- (id)storedImageForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
      v8 = v4;
    else
      v8 = 0;

  }
  else
  {
    v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CPSImageStore storeImageData:forKey:error:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }

  return v8;
}

- (void)purgeOldImagesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__CPSImageStore_purgeOldImagesWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3B93C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __53__CPSImageStore_purgeOldImagesWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  +[CPSImageStore _storeDirectoryURL:](CPSImageStore, "_storeDirectoryURL:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_purgeOldFilesInDirectory:timeToLive:", v3, 604800.0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)_storeDirectoryURL:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.ClipServices/Images"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v13);
  v9 = v13;

  if ((v8 & 1) == 0)
  {
    v11 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      +[CPSImageStore _storeDirectoryURL:].cold.1(v11, v9);
      if (a3)
        goto LABEL_5;
    }
    else if (a3)
    {
LABEL_5:
      v10 = 0;
      *a3 = objc_retainAutorelease(v9);
      goto LABEL_8;
    }
    v10 = 0;
    goto LABEL_8;
  }
  v10 = v6;
LABEL_8:

  return v10;
}

- (void)_purgeOldFilesInDirectory:(id)a3 timeToLive:(double)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDBCBF0];
    v8 = *MEMORY[0x24BDBCBE0];
    v37[0] = *MEMORY[0x24BDBCBF0];
    v37[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nextObject");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      do
      {
        v35 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v35, v7, 0);
        v17 = v35;
        v34 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v34, v8, 0);
        v18 = v34;
        objc_msgSend(v17, "timeIntervalSinceReferenceDate");
        v20 = v19;
        objc_msgSend(v18, "timeIntervalSinceReferenceDate");
        v22 = v21;

        if (v20 >= v22)
          v23 = v20;
        else
          v23 = v22;
        if (v13 - v23 >= a4)
          objc_msgSend(v14, "addObject:", v16);

        objc_msgSend(v10, "nextObject");
        v24 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v24;
      }
      while (v24);
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v14;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v31;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v31 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(v6, "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v29++), 0, (_QWORD)v30);
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v27);
    }

  }
}

- (void)storeImageData:(uint64_t)a3 forKey:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_20AD44000, a1, a3, "Invalid image store key", a5, a6, a7, a8, 0);
}

+ (void)_storeDirectoryURL:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "cps_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_20AD44000, v3, OS_LOG_TYPE_ERROR, "Cannot create image store folder with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
