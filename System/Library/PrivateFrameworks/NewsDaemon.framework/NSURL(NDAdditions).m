@implementation NSURL(NDAdditions)

+ (id)newsdGroupContainerURL
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.newsd"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("newsd was unable to use the group container for content storage"));
  return v1;
}

+ (id)newsdCachesURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "newsdGroupContainerURL");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v0;
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v0, 0, 4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("shared-assets")))
        {

        }
        else
        {
          objc_msgSend(v8, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple.news"));

          if (!v11)
            continue;
        }
        objc_msgSend(v8, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "URLByAppendingPathComponent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)*MEMORY[0x1E0D585D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D585D8], OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          objc_msgSend(v8, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v16;
          _os_log_impl(&dword_1D7105000, v15, OS_LOG_TYPE_DEFAULT, "will move %{public}@ from group container root to Caches directory", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v18 = objc_msgSend(v17, "moveItemAtURL:toURL:error:", v8, v13, &v31);
        v19 = v31;

        if ((v18 & 1) == 0)
        {
          v20 = *MEMORY[0x1E0D585D8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D585D8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v37 = v19;
            _os_log_impl(&dword_1D7105000, v20, OS_LOG_TYPE_DEFAULT, "failed to move file from group container root to Caches directory with error: %{public}@", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v21, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v30);
  v22 = v30;

  FCURLForFeldsparUserAccountHomeDirectory();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "URLByAppendingPathComponent:isDirectory:", CFSTR("newsd"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fc_removeContentsOfDirectoryAtURL:", v24);

  v26 = *MEMORY[0x1E0D585D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D585D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v37 = v1;
    _os_log_impl(&dword_1D7105000, v26, OS_LOG_TYPE_DEFAULT, "will store newsd caches at %{public}@", buf, 0xCu);
  }
  v27 = v1;

  return v27;
}

+ (id)newsdDocumentsURL
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.newsd"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v7);
  v4 = v7;

  v5 = *MEMORY[0x1E0D585D8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D585D8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v2;
    _os_log_impl(&dword_1D7105000, v5, OS_LOG_TYPE_DEFAULT, "will store newsd documents at %{public}@", buf, 0xCu);
  }

  return v2;
}

@end
