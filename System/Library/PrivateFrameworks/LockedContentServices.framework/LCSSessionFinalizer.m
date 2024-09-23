@implementation LCSSessionFinalizer

+ (id)finalizeTemporarySessionAtURL:(id)a3 forBundleProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  LCSSessionURLBuilder *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char v17;
  char v18;
  NSObject *v19;
  char v20;
  char v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  const __CFString *v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  id v58;
  char v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  void *v63;
  id v64[2];
  id v65;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  NSObject *v72;
  __int16 v73;
  const __CFString *v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  objc_msgSend(v7, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, MEMORY[0x24BDBD1A8], 0, &v68);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v68;
  v10 = 0;
  if (objc_msgSend(v8, "count"))
    v11 = 0;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    objc_msgSend(v5, "pathComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") < 2)
    {
      v10 = 0;
LABEL_43:

      goto LABEL_44;
    }
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v12, "count") - 2);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[LCSSessionURLBuilder initWithTypeIdentifier:]([LCSSessionURLBuilder alloc], "initWithTypeIdentifier:", v63);
    -[LCSSessionURLBuilder finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:](v13, "finalizationStagingSessionURLForBundleProvider:fromTemporaryURL:", v6, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      LCSLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.1(v16, v23, v24, v25, v26, v27, v28, v29);
      v10 = 0;
      goto LABEL_42;
    }
    objc_msgSend(v14, "URLByDeletingLastPathComponent");
    v16 = objc_claimAutoreleasedReturnValue();
    v67 = 0;
    v17 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v67);
    v62 = v67;
    if ((v17 & 1) == 0)
    {
      LCSLogCommon();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.7();
      v10 = 0;
      goto LABEL_41;
    }
    v66 = 0;
    v18 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v15, &v66);
    v61 = v66;
    if ((v18 & 1) == 0)
    {
      LCSLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      v60 = v30;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.6((uint64_t)v61, v30, v31, v32, v33, v34, v35, v36);
      v10 = 0;
      goto LABEL_40;
    }
    -[LCSSessionURLBuilder finalizedSessionURLForBundleProvider:fromSessionURL:](v13, "finalizedSessionURLForBundleProvider:fromSessionURL:", v6, v15);
    v19 = objc_claimAutoreleasedReturnValue();
    v60 = v19;
    if (!v19)
    {
      LCSLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.3(v37, v38, v39, v40, v41, v42, v43, v44);

      v65 = 0;
      v59 = objc_msgSend(v7, "removeItemAtURL:error:", v15, &v65);
      v45 = v65;
      if ((v59 & 1) != 0)
      {
        v10 = 0;
LABEL_39:

LABEL_40:
LABEL_41:

LABEL_42:
        goto LABEL_43;
      }
      v58 = v45;
      LCSLogCommon();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.2((uint64_t)v58, v57, v46, v47, v48, v49, v50, v51);
      v10 = 0;
LABEL_38:

      v45 = v58;
      goto LABEL_39;
    }
    -[NSObject URLByDeletingLastPathComponent](v19, "URLByDeletingLastPathComponent");
    v64[1] = 0;
    v58 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
    v57 = 0;
    if ((v20 & 1) != 0)
    {
      v64[0] = 0;
      v21 = objc_msgSend(v7, "moveItemAtURL:toURL:error:", v15, v60, v64);
      v56 = v64[0];
      LCSLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if ((v21 & 1) != 0)
      {
        v55 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.4();

        v10 = v60;
        goto LABEL_37;
      }
      v52 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v54 = CFSTR("no error returned");
        *(_DWORD *)buf = 138412802;
        if (v56)
          v54 = (const __CFString *)v56;
        v70 = v15;
        v71 = 2112;
        v72 = v60;
        v73 = 2112;
        v74 = v54;
        _os_log_error_impl(&dword_240B1C000, v52, OS_LOG_TYPE_ERROR, "Failed moving from %@ to %@: %@", buf, 0x20u);
      }

    }
    else
    {
      LCSLogCommon();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        +[LCSSessionFinalizer finalizeTemporarySessionAtURL:forBundleProvider:].cold.5();
    }
    v10 = 0;
LABEL_37:

    goto LABEL_38;
  }
LABEL_44:

  return v10;
}

+ (BOOL)removeContentsOfExtensionDataContainerForBundleProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v23;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BE80CD8];
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateMatchingBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80D40]), "initWithExplanation:", CFSTR("LockedContentServices deleting contents of extension data container"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE80D50]), "initWithPredicate:context:", v6, v7);
  v23 = 0;
  v9 = objc_msgSend(v8, "acquireWithError:", &v23);
  v10 = v23;
  if ((v9 & 1) != 0)
  {
    objc_msgSend(v3, "bundleIdentifier");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v11, "cStringUsingEncoding:", 4);
    v12 = container_delete_all_data_container_content_for_current_user();

    v13 = v12 == 1;
    if (v12 != 1)
    {
      LCSLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[LCSSessionFinalizer removeContentsOfExtensionDataContainerForBundleProvider:].cold.1(v12, v14, v15, v16, v17, v18, v19, v20);

    }
    objc_msgSend(v8, "invalidate");
  }
  else
  {
    LCSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[LCSSessionFinalizer removeContentsOfExtensionDataContainerForBundleProvider:].cold.2(v3, (uint64_t)v10, v21);

    v13 = 0;
  }

  return v13;
}

+ (void)finalizeTemporarySessionAtURL:(uint64_t)a3 forBundleProvider:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_240B1C000, a1, a3, "Failed to resolve a staging URL, will not finalize contents.", a5, a6, a7, a8, 0);
}

+ (void)finalizeTemporarySessionAtURL:(uint64_t)a3 forBundleProvider:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_240B1C000, a2, a3, "Failed to remove staging dir after failure to resolve finalized URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)finalizeTemporarySessionAtURL:(uint64_t)a3 forBundleProvider:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_240B1C000, a1, a3, "Failed to resolve a finalized URL, will not finalize contents, attempting to remove staging dir.", a5, a6, a7, a8, 0);
}

+ (void)finalizeTemporarySessionAtURL:forBundleProvider:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_1();
  v3 = v0;
  _os_log_debug_impl(&dword_240B1C000, v1, OS_LOG_TYPE_DEBUG, "Finalized %@ to %@", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

+ (void)finalizeTemporarySessionAtURL:forBundleProvider:.cold.5()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_240B1C000, v0, (uint64_t)v0, "Failed creating finalized Library container directory %@:%@", v1);
  OUTLINED_FUNCTION_4();
}

+ (void)finalizeTemporarySessionAtURL:(uint64_t)a3 forBundleProvider:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_240B1C000, a2, a3, "Error copying directory to staging: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

+ (void)finalizeTemporarySessionAtURL:forBundleProvider:.cold.7()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_1(&dword_240B1C000, v0, (uint64_t)v0, "Failed creating staging container directory %@:%@", v1);
  OUTLINED_FUNCTION_4();
}

+ (void)removeContentsOfExtensionDataContainerForBundleProvider:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_240B1C000, a2, a3, "Error removing contents of data container: %llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)removeContentsOfExtensionDataContainerForBundleProvider:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1();
  v8 = a2;
  OUTLINED_FUNCTION_3_1(&dword_240B1C000, a3, v6, "Unable to acquire termination assertion for %@: %@", v7);

}

@end
