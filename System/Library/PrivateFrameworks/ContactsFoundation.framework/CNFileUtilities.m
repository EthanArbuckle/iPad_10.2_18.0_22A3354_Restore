@implementation CNFileUtilities

+ (id)os_log
{
  if (os_log_cn_once_token_1_2 != -1)
    dispatch_once(&os_log_cn_once_token_1_2, &__block_literal_global_19);
  return (id)os_log_cn_once_object_1_2;
}

void __25__CNFileUtilities_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "file-utilites");
  v1 = (void *)os_log_cn_once_object_1_2;
  os_log_cn_once_object_1_2 = (uint64_t)v0;

}

+ (id)sharedInstance
{
  if (sharedInstance_cn_once_token_2 != -1)
    dispatch_once(&sharedInstance_cn_once_token_2, &__block_literal_global_3_0);
  return (id)sharedInstance_cn_once_object_2;
}

void __33__CNFileUtilities_sharedInstance__block_invoke()
{
  CNFileUtilities *v0;
  void *v1;

  v0 = objc_alloc_init(CNFileUtilities);
  v1 = (void *)sharedInstance_cn_once_object_2;
  sharedInstance_cn_once_object_2 = (uint64_t)v0;

}

- (CNFileUtilities)init
{
  void *v3;
  CNFileUtilities *v4;

  +[CNFileServices sharedInstance](CNFileServices, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNFileUtilities initWithFileServices:](self, "initWithFileServices:", v3);

  return v4;
}

- (CNFileUtilities)initWithFileServices:(id)a3
{
  id v5;
  CNFileUtilities *v6;
  CNFileUtilities *v7;
  CNFileUtilities *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFileUtilities;
  v6 = -[CNFileUtilities init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_services, a3);
    v8 = v7;
  }

  return v7;
}

+ (CNProcessSharedLock)fileLock
{
  void *v3;
  int v4;
  uint64_t *v5;
  _QWORD block[5];

  +[CNUserDefaults standardPreferences](CNUserDefaults, "standardPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userHasOptedOutOfPreference:", CFSTR("com.apple.private.contacts.disable-file-lock"));

  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__CNFileUtilities_fileLock__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (fileLock_cn_once_token_3 != -1)
      dispatch_once(&fileLock_cn_once_token_3, block);
    v5 = &fileLock_cn_once_object_3;
  }
  else
  {
    if (fileLock_cn_once_token_4 != -1)
      dispatch_once(&fileLock_cn_once_token_4, &__block_literal_global_9_0);
    v5 = &fileLock_cn_once_object_4;
  }
  return (CNProcessSharedLock *)(id)*v5;
}

void __27__CNFileUtilities_fileLock__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "initializeFileLock");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)fileLock_cn_once_object_3;
  fileLock_cn_once_object_3 = v1;

}

void __27__CNFileUtilities_fileLock__block_invoke_2()
{
  CNDoNothingLock *v0;
  void *v1;

  v0 = objc_alloc_init(CNDoNothingLock);
  v1 = (void *)fileLock_cn_once_object_4;
  fileLock_cn_once_object_4 = (uint64_t)v0;

}

+ (id)initializeFileLock
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;

  +[CNFileUtilities sharedInstance](CNFileUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedLockUrlWithName:", CFSTR("database.lock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNProcessSharedLock recursiveSharedLockWithLockFilePath:](CNProcessSharedLock, "recursiveSharedLockWithLockFilePath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "open:", &v10);
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[CNFileUtilities initializeFileLock].cold.1((uint64_t)v5, (uint64_t)v7, v8);

    v5 = 0;
  }

  return v5;
}

- (BOOL)isFileAtUrlOnARemoteFileSystem:(id)a3
{
  id v4;
  uint64_t v5;
  CNFileServices **p_services;
  NSObject *v8;
  _BYTE v9[2168];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "fileSystemRepresentation");

  bzero(v9, 0x878uLL);
  p_services = &self->_services;
  if ((-[CNFileServices statfs::](self->_services, "statfs::", v5, v9) & 0x80000000) == 0)
    return (v9[65] & 0x10) == 0;
  objc_msgSend((id)objc_opt_class(), "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[CNFileUtilities isFileAtUrlOnARemoteFileSystem:].cold.1(v5, (id *)p_services, v8);

  return 0;
}

- (id)sharedLockDirectoryUrl
{
  return (id)objc_msgSend((id)objc_opt_class(), "sharedLockDirectoryURLWithFileServices:", self->_services);
}

+ (id)sharedLockDirectoryURLWithFileServices:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__CNFileUtilities_sharedLockDirectoryURLWithFileServices___block_invoke;
  v9[3] = &unk_1E29B9A98;
  v10 = v4;
  v11 = a1;
  v5 = sharedLockDirectoryURLWithFileServices__cn_once_token_7;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&sharedLockDirectoryURLWithFileServices__cn_once_token_7, v9);
  v7 = (id)sharedLockDirectoryURLWithFileServices__cn_once_object_7;

  return v7;
}

void __58__CNFileUtilities_sharedLockDirectoryURLWithFileServices___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "requestSharedLockDirectoryURLWithFileServices:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)sharedLockDirectoryURLWithFileServices__cn_once_object_7;
  sharedLockDirectoryURLWithFileServices__cn_once_object_7 = v1;

}

+ (id)requestSharedLockDirectoryURLWithFileServices:(id)a3
{
  void *v3;
  void (*v4)(void);
  void *v5;
  void *v6;

  v3 = dlopen("/System/Library/PrivateFrameworks/AppSandbox.framework/AppSandbox", 5);
  v4 = (void (*)(void))dlsym(v3, "AppSandboxUtilAddressBookLockPathURL");
  v4();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  dlclose(v3);
  return v6;
}

- (id)sharedLockUrlWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNFileUtilities sharedLockDirectoryUrl](self, "sharedLockDirectoryUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)proxyLockUrlForFileAtUrl:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByResolvingSymlinksInPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByStandardizingPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingString:", CFSTR("_lock"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNFileUtilities sharedLockUrlWithName:](self, "sharedLockUrlWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
}

+ (void)initializeFileLock
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_fault_impl(&dword_18F80C000, log, OS_LOG_TYPE_FAULT, "Unable to open file lock: %@ %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)isFileAtUrlOnARemoteFileSystem:(NSObject *)a3 .cold.1(uint64_t a1, id *a2, NSObject *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a2, "errnoValue");
  v6 = 136315394;
  v7 = a1;
  v8 = 1024;
  v9 = v5;
  _os_log_error_impl(&dword_18F80C000, a3, OS_LOG_TYPE_ERROR, "Could not statfs file at path: %s: %d", (uint8_t *)&v6, 0x12u);
}

@end
