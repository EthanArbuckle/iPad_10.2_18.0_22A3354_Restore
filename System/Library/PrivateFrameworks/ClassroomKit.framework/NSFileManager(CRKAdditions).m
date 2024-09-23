@implementation NSFileManager(CRKAdditions)

- (uint64_t)crk_isStudentdInstalled
{
  return objc_msgSend(a1, "fileExistsAtPath:", CFSTR("/usr/libexec/studentd"));
}

+ (id)crk_nonContainerizedHomeDirectoryURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__NSFileManager_CRKAdditions__crk_nonContainerizedHomeDirectoryURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (crk_nonContainerizedHomeDirectoryURL_onceToken != -1)
    dispatch_once(&crk_nonContainerizedHomeDirectoryURL_onceToken, block);
  return (id)crk_nonContainerizedHomeDirectoryURL_URL;
}

+ (uint64_t)crk_computeNonContainerizedHomeDirectoryURL
{
  return objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile"));
}

- (uint64_t)crk_safeRemoveItemAtURL:()CRKAdditions error:
{
  char v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v5 = objc_msgSend(a1, "removeItemAtURL:error:", a3, &v12);
  v6 = v12;
  v7 = v6;
  if ((v5 & 1) != 0)
    goto LABEL_5;
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
  {
    v9 = objc_msgSend(v7, "code");

    if (v9 == 4)
    {

      v7 = 0;
LABEL_5:
      v10 = 1;
      goto LABEL_10;
    }
  }
  else
  {

  }
  if (a4)
  {
    v7 = objc_retainAutorelease(v7);
    v10 = 0;
    *a4 = v7;
  }
  else
  {
    v10 = 0;
  }
LABEL_10:

  return v10;
}

- (id)crk_deepContentsOfDirectoryAtPath:()CRKAdditions options:error:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+CRKAdditions.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

    v8 = 0;
  }
  v24 = v8;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__5;
  v37 = __Block_byref_object_dispose__5;
  v38 = 0;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __79__NSFileManager_CRKAdditions__crk_deepContentsOfDirectoryAtPath_options_error___block_invoke;
  v32[3] = &unk_24D9CACD0;
  v32[4] = &v33;
  objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v26, MEMORY[0x24BDBD1A8], a4, v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByStandardizingPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringByStandardizingPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "crk_substringAfterString:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "crk_stringByRemovingPrefix:", CFSTR("/"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addObject:", v19);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v13);
  }

  v20 = (void *)v34[5];
  if (v20)
  {
    v21 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v20);
  }
  else
  {
    v21 = (void *)objc_msgSend(v12, "copy");
  }

  _Block_object_dispose(&v33, 8);
  return v21;
}

- (id)crk_collisionAvoidingURLForURL:()CRKAdditions
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "filePathURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "fileExistsAtPath:", v6))
  {
    v7 = 2;
    v8 = v4;
    while (1)
    {
      v9 = v6;
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByDeletingPathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@.%@"), v11, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "filePathURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        break;
      v7 = (v7 + 1);

      v8 = v16;
      if ((objc_msgSend(a1, "fileExistsAtPath:", v6) & 1) == 0)
        goto LABEL_12;
    }
    if (_CRKLogGeneral_onceToken_46 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_46, &__block_literal_global_121);
    v18 = _CRKLogGeneral_logObj_46;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_46, OS_LOG_TYPE_ERROR))
      -[NSFileManager(CRKAdditions) crk_collisionAvoidingURLForURL:].cold.1((uint64_t)v4, (uint64_t)v15, v18);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = v4;
  }
LABEL_12:

  return v16;
}

- (void)crk_collisionAvoidingURLForURL:()CRKAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Unable to create non-colliding URL for %{public}@ using %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
