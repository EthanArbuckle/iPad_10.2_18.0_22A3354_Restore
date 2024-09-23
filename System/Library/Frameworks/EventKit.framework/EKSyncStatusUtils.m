@implementation EKSyncStatusUtils

+ (id)dataFromErrorUserInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "_permittedClassesForArchivingLastSyncErrorUserInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0D0C3B8], "archiveDictionary:permittedClasses:error:", v3, v4, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v15;
    if (!v5)
    {
      v7 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        +[EKSyncStatusUtils dataFromErrorUserInfo:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)errorUserInfoFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  if (a3)
  {
    v3 = a3;
    objc_msgSend((id)objc_opt_class(), "_permittedClassesForArchivingLastSyncErrorUserInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0D0C3B8], "unarchiveDictionaryFromData:permittedClasses:error:", v3, v4, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v15;
    if (!v5)
    {
      v7 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        +[EKSyncStatusUtils errorUserInfoFromData:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)_permittedClassesForArchivingLastSyncErrorUserInfo
{
  if (_permittedClassesForArchivingLastSyncErrorUserInfo_onceToken != -1)
    dispatch_once(&_permittedClassesForArchivingLastSyncErrorUserInfo_onceToken, &__block_literal_global_56);
  return (id)_permittedClassesForArchivingLastSyncErrorUserInfo_permittedClasses;
}

void __71__EKSyncStatusUtils__permittedClassesForArchivingLastSyncErrorUserInfo__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_permittedClassesForArchivingLastSyncErrorUserInfo_permittedClasses;
  _permittedClassesForArchivingLastSyncErrorUserInfo_permittedClasses = v2;

}

+ (void)dataFromErrorUserInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Could not archive last sync user info, error = %@", a5, a6, a7, a8, 2u);
}

+ (void)errorUserInfoFromData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A2318000, a2, a3, "Could not unarchive last sync user info, error = %@", a5, a6, a7, a8, 2u);
}

@end
