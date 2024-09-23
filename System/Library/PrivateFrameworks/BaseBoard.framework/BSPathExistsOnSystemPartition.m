@implementation BSPathExistsOnSystemPartition

void __BSPathExistsOnSystemPartition_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  BSSystemRootDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("System"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v2, "attributesOfFileSystemForPath:error:", v1, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  v5 = *MEMORY[0x1E0CB2B08];
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB2B08]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ECD399A0;
  qword_1ECD399A0 = v6;

  if (!qword_1ECD399A0)
  {
    BSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "descriptionWithMultilinePrefix:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      _os_log_error_impl(&dword_18A184000, v8, OS_LOG_TYPE_ERROR, "Unable to resolve system partition file system number: %{public}@", buf, 0xCu);

    }
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v9, "attributesOfFileSystemForPath:error:", CFSTR("/private/preboot"), &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  objc_msgSend(v10, "objectForKey:", v5);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)qword_1ECD399A8;
  qword_1ECD399A8 = v12;

  if (!qword_1ECD399A8)
  {
    BSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "descriptionWithMultilinePrefix:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v16;
      _os_log_error_impl(&dword_18A184000, v14, OS_LOG_TYPE_ERROR, "Unable to resolve preboot partition file system number: %{public}@", buf, 0xCu);

    }
  }

}

@end
