@implementation LCSSessionURLBuilder

+ (id)_containerBundleIdentifierForBundleProvider:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  objc_msgSend(v3, "containerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    LCSLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[LCSSessionURLBuilder _containerBundleIdentifierForBundleProvider:].cold.1();

  }
  return v4;
}

+ (id)_bundleRecordForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    LCSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LCSCaptureApplicationMonitor _bundleRecordForBundleIdentifier:].cold.1((uint64_t)v3, v5, v6);

  }
  return v4;
}

+ (id)_containerURLForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  objc_msgSend(a1, "_bundleRecordForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataContainerURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    LCSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[LCSSessionURLBuilder _containerURLForBundleIdentifier:].cold.1();

  }
  return v6;
}

+ (id)_libraryURLForCurrentApplication
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  if (sandbox_get_container_expected())
  {
    LCSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      +[LCSSessionURLBuilder _libraryURLForCurrentApplication].cold.2();

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLsForDirectory:inDomains:", 5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
  }
  else
  {
    LCSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[LCSSessionURLBuilder _libraryURLForCurrentApplication].cold.1();

  }
  return v5;
}

- (LCSSessionURLBuilder)initWithTypeIdentifier:(id)a3
{
  id v5;
  LCSSessionURLBuilder *v6;
  LCSSessionURLBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCSSessionURLBuilder;
  v6 = -[LCSSessionURLBuilder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_typeIdentifier, a3);

  return v7;
}

- (id)temporarySessionURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "temporaryDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LCSSessionURLBuilder typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LCSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v9;
    _os_log_impl(&dword_240B1C000, v10, OS_LOG_TYPE_INFO, "New session path: %@", (uint8_t *)&v12, 0xCu);
  }

  return v9;
}

- (id)finalizationStagingSessionURLForBundleProvider:(id)a3 fromTemporaryURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_containerBundleIdentifierForBundleProvider:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_containerURLForBundleIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("tmp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCSSessionURLBuilder typeIdentifier](self, "typeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    -[LCSSessionURLBuilder _nonContainerizedStagingContainerURLForBundleIdentifier:](self, "_nonContainerizedStagingContainerURLForBundleIdentifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
  if (!v14)
  {
    LCSLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[LCSSessionURLBuilder finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LCSLogCommon();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[LCSSessionURLBuilder finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:].cold.1();

  return v17;
}

- (id)_nonContainerizedStagingContainerURLForBundleIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = a3;
  objc_msgSend(v4, "fileURLWithPath:", CFSTR("/var/mobile/tmp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[LCSSessionURLBuilder typeIdentifier](self, "typeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isWritableFileAtPath:", v11);

  if (v12)
    v13 = v9;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (id)finalizedSessionURLForBundleProvider:(id)a3 fromSessionURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v6 = a3;
  objc_msgSend(a4, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v7);
  if (!v8)
  {
    LCSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[LCSSessionURLBuilder finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)objc_opt_class(), "_containerBundleIdentifierForBundleProvider:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_containerURLForBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("Library"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    -[LCSSessionURLBuilder _nonContainerizedLibraryURLForBundleIdentifier:](self, "_nonContainerizedLibraryURLForBundleIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[LCSSessionURLBuilder typeIdentifier](self, "typeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LCSLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[LCSSessionURLBuilder finalizedSessionURLForBundleProvider:fromSessionURL:].cold.1();

  return v16;
}

- (id)_nonContainerizedLibraryURLForBundleIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = a3;
  objc_msgSend(v3, "fileURLWithPath:", CFSTR("/var/mobile/Library"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isWritableFileAtPath:", v8);

  if (v9)
    v10 = v6;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (id)finalizedSessionURLsForBundleProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_containerBundleIdentifierForBundleProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[LCSSessionURLBuilder finalizedSessionURLsForBundleIdentifier:](self, "finalizedSessionURLsForBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)finalizedSessionsContainerURLForCurrentApplication
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_libraryURLForCurrentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCSSessionURLBuilder typeIdentifier](self, "typeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)finalizedSessionURLsForCurrentApplication
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "_libraryURLForCurrentApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LCSSessionURLBuilder _finalizedSessionURLsInContainerDirectory:](self, "_finalizedSessionURLsInContainerDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)finalizedSessionURLsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_containerURLForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("Library"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LCSSessionURLBuilder _finalizedSessionURLsInContainerDirectory:](self, "_finalizedSessionURLsInContainerDirectory:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_finalizedSessionURLsInContainerDirectory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  BOOL v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  id v48;
  _QWORD v49[3];
  _BYTE v50[128];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LCSSessionURLBuilder typeIdentifier](self, "typeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDBCBF0];
  v51[0] = *MEMORY[0x24BDBCC60];
  v8 = v51[0];
  v51[1] = v9;
  v39 = v9;
  v10 = 0x24BDBC000uLL;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __66__LCSSessionURLBuilder__finalizedSessionURLsInContainerDirectory___block_invoke;
  v45[3] = &unk_251104B38;
  v32 = v4;
  v33 = (void *)v6;
  v46 = v32;
  objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v11, 7, v45);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v8;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v42;
    v17 = *MEMORY[0x24BDBCCD0];
    v38 = *MEMORY[0x24BDBCCD0];
    v35 = *(_QWORD *)v42;
    do
    {
      v18 = 0;
      v36 = v15;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v18);
        v49[0] = v13;
        v49[1] = v17;
        v49[2] = v39;
        objc_msgSend(*(id *)(v10 + 3632), "arrayWithObjects:count:", v49, 3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0;
        objc_msgSend(v19, "resourceValuesForKeys:error:", v20, &v40);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v40;

        if (v22)
        {
          LCSLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v22;
            _os_log_error_impl(&dword_240B1C000, v23, OS_LOG_TYPE_ERROR, "Error fetching resource values: %@", buf, 0xCu);
          }
        }
        else
        {
          v24 = v10;
          v25 = v13;
          objc_msgSend(v21, "objectForKeyedSubscript:", v13);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "BOOLValue");

          objc_msgSend(v21, "objectForKeyedSubscript:", v17);
          v23 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v23);

          if (v27)
            v29 = v28 == 0;
          else
            v29 = 1;
          if (!v29)
            objc_msgSend(v34, "addObject:", v19);
          v13 = v25;
          v10 = v24;
          v16 = v35;
          v15 = v36;
        }

        ++v18;
        v17 = v38;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v15);
  }

  objc_msgSend(v34, "sortedArrayUsingComparator:", &__block_literal_global_1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

uint64_t __66__LCSSessionURLBuilder__finalizedSessionURLsInContainerDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LCSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_error_impl(&dword_240B1C000, v7, OS_LOG_TYPE_ERROR, "Error enumerating directory %@, on URL %@: %@", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

uint64_t __66__LCSSessionURLBuilder__finalizedSessionURLsInContainerDirectory___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x24BDBCBF0];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v6, "compare:", v9);
  return v7;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

+ (void)_containerBundleIdentifierForBundleProvider:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_240B1C000, v0, v1, "Unable to resolve container bundle identifier for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_containerURLForBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_240B1C000, v0, v1, "Unable to resolve data container URL for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_libraryURLForCurrentApplication
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_240B1C000, v0, v1, "Error encountered while checking if container expected, assuming current process is containerized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_240B1C000, v0, v1, "Finalization staging path:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_240B1C000, v0, v1, "Temporary path for finalizing does not have a UUID as its last path component, we'll just build a completely new path instead.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)finalizedSessionURLForBundleProvider:fromSessionURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_240B1C000, v0, v1, "Finalization Library path:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
