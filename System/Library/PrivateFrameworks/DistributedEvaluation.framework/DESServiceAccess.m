@implementation DESServiceAccess

+ (BOOL)hasToolEntitlement:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 1;
  objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.private.des_tool"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)hasRecordAccessToBundleId:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v8)
  {
    if (a5)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB28A8];
      v38 = *MEMORY[0x1E0CB2D50];
      v39[0] = CFSTR("The connection does not exist");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      v16 = v13;
      v17 = 4099;
LABEL_13:
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v14);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
LABEL_14:
    v11 = 0;
    goto LABEL_22;
  }
  v10 = objc_msgSend(v8, "processIdentifier");
  if (v10 != getpid())
  {
    +[DESBundleRegistry sharedInstance](DESBundleRegistry, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsBundleId:", v7);

    if ((v19 & 1) != 0)
    {
      objc_msgSend(CFSTR("com.apple.private.DistributedEvaluation.RecordAccess-"), "stringByAppendingString:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForEntitlement:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v20, "BOOLValue") & 1) != 0
        || +[DESServiceAccess hasToolEntitlement:](DESServiceAccess, "hasToolEntitlement:", v9))
      {
        v11 = 1;
      }
      else
      {
        if (a5)
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = *MEMORY[0x1E0CB28A8];
          v34 = *MEMORY[0x1E0CB2D50];
          v35 = CFSTR("Missing entitlement; programmer error!");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 3328, v25);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          +[DESServiceAccess hasRecordAccessToBundleId:connection:error:].cold.1((uint64_t)v7, v26, v27, v28, v29, v30, v31, v32);

        v11 = 0;
      }

      goto LABEL_21;
    }
    if (a5)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB28A8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = CFSTR("Fail to locate plugin.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v21;
      v16 = v22;
      v17 = 3328;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v11 = 1;
LABEL_22:

  return v11;
}

+ (BOOL)hasMLRCtlEntitlement:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.mlruntime.mlrctl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (BOOL)hasOnDemandLaunchEntitlement:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(a1, "hasMLRCtlEntitlement:", v4))
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[DESServiceAccess hasOnDemandLaunchEntitlement:].cold.1(v5);
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.mlruntime.host.ondemandplugin"));
    v5 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v9 = v5;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0
              && (-[NSObject isEqualToString:](v8, "isEqualToString:", v14, (_QWORD)v23) & 1) != 0)
            {
              v6 = 1;
              goto LABEL_22;
            }
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v11)
            continue;
          break;
        }
      }

      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[DESServiceAccess hasOnDemandLaunchEntitlement:].cold.2((uint64_t)v8, v9);
      v6 = 0;
LABEL_22:

    }
    else
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[DESServiceAccess hasOnDemandLaunchEntitlement:].cold.3(v8, v15, v16, v17, v18, v19, v20, v21);
      v6 = 0;
    }

  }
  return v6;
}

+ (void)hasRecordAccessToBundleId:(uint64_t)a3 connection:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "No record access to the bundle=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)hasOnDemandLaunchEntitlement:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = CFSTR("com.apple.mlruntime.host.ondemandplugin");
  _os_log_debug_impl(&dword_1B96E5000, log, OS_LOG_TYPE_DEBUG, "Bypass check for %@ for internal tool", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)hasOnDemandLaunchEntitlement:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("com.apple.mlruntime.host.ondemandplugin");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_ERROR, "Missing element in key=%@ with expected value=%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)hasOnDemandLaunchEntitlement:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a1, a3, "Missing key=%@ or wrong type", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
