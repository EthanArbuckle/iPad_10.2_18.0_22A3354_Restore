@implementation GCConfigurationBundleFileSystemSource

- (GCConfigurationBundleFileSystemSource)init
{
  GCConfigurationBundleFileSystemSource *v2;
  uint64_t v3;
  OS_os_log *log;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCConfigurationBundleFileSystemSource;
  v2 = -[GCConfigurationBundleFileSystemSource init](&v6, sel_init);
  gc_log_create_configuration("Filesystem");
  v3 = objc_claimAutoreleasedReturnValue();
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  return v2;
}

- (id)configurationBundleURLsForType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *log;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  uint8_t v28[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  +[NSFileManager defaultManager](&off_1F03AA2A8, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSBundle bundleForClass:](NSBundle_0, "bundleForClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByResolvingSymlinksInPath");
  v8 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)v8;
  +[NSURL fileURLWithPath:](&off_1F03AA4A8, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    -[GCConfigurationBundleFileSystemSource configurationBundleURLsForType:].cold.2(log, v9);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __72__GCConfigurationBundleFileSystemSource_configurationBundleURLsForType___block_invoke;
  v27[3] = &unk_1EA4D2BE0;
  v27[4] = self;
  v22 = v5;
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, MEMORY[0x1E0C9AA60], 7, v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v17 = self->_log;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[GCConfigurationBundleFileSystemSource configurationBundleURLsForType:].cold.1(v28, v17, v16, &v29);
        objc_msgSend(v4, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v13);
  }

  +[GCFuture futureWithResult:](GCFuture, "futureWithResult:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __72__GCConfigurationBundleFileSystemSource_configurationBundleURLsForType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;

  v4 = a3;
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __72__GCConfigurationBundleFileSystemSource_configurationBundleURLsForType___block_invoke_cold_1((uint64_t)v4, v5);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)configurationBundleURLsForType:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl(&dword_1DC79E000, v7, OS_LOG_TYPE_DEBUG, "    %@", a1, 0xCu);

}

- (void)configurationBundleURLsForType:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1DC79E000, v3, OS_LOG_TYPE_DEBUG, "Checking '%{public}@'...", (uint8_t *)&v5, 0xCu);

}

void __72__GCConfigurationBundleFileSystemSource_configurationBundleURLsForType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DC79E000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end
