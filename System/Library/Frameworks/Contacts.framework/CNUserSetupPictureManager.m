@implementation CNUserSetupPictureManager

+ (id)log
{
  if (log_cn_once_token_0_8 != -1)
    dispatch_once(&log_cn_once_token_0_8, &__block_literal_global_99);
  return (id)log_cn_once_object_0_8;
}

void __32__CNUserSetupPictureManager_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNUserSetupPictureData");
  v1 = (void *)log_cn_once_object_0_8;
  log_cn_once_object_0_8 = (uint64_t)v0;

}

+ (id)userSetupPictureData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18[8];
  id v19;
  uint8_t buf[16];

  if (!objc_msgSend(a1, "hasUserSetupPictureData"))
    return 0;
  if ((objc_msgSend(a1, "userSetupPictureDataIsFresh") & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_DEFAULT, "Setup user picture data is outdated. Removing.", buf, 2u);
    }

    objc_msgSend(a1, "clearUserSetupPictureData");
    return 0;
  }
  v3 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a1, "userSetupPictureFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v3, "dataWithContentsOfFile:options:error:", v4, 0, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;

  objc_msgSend((id)objc_opt_class(), "log");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18F8BD000, v8, OS_LOG_TYPE_DEFAULT, "Did read setup user picture data from disk", v18, 2u);
    }

    +[CNUserSetupPictureData userSetupPictureDataFromData:](CNUserSetupPictureData, "userSetupPictureDataFromData:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CNUserSetupPictureManager userSetupPictureData].cold.1((uint64_t)v6, v8, v12, v13, v14, v15, v16, v17);

    objc_msgSend(a1, "clearUserSetupPictureData");
    v9 = 0;
  }

  return v9;
}

+ (BOOL)hasUserSetupPictureData
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userSetupPictureFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  return v5;
}

+ (id)userSetupPictureFilePath
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CNUserSetupPictureManager_userSetupPictureFilePath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userSetupPictureFilePath_cn_once_token_4 != -1)
    dispatch_once(&userSetupPictureFilePath_cn_once_token_4, block);
  return (id)userSetupPictureFilePath_cn_once_object_4;
}

void __53__CNUserSetupPictureManager_userSetupPictureFilePath__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "userSetupPicturePath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("SetupUserPictureData"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)userSetupPictureFilePath_cn_once_object_4;
  userSetupPictureFilePath_cn_once_object_4 = v1;

}

+ (id)userSetupPicturePath
{
  if (userSetupPicturePath_cn_once_token_5 != -1)
    dispatch_once(&userSetupPicturePath_cn_once_token_5, &__block_literal_global_8_3);
  return (id)userSetupPicturePath_cn_once_object_5;
}

void __49__CNUserSetupPictureManager_userSetupPicturePath__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NSHomeDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library/Application Support/AddressBook/.UserSetupDrafts/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)userSetupPicturePath_cn_once_object_5;
  userSetupPicturePath_cn_once_object_5 = v0;

}

+ (BOOL)userSetupPictureDataIsFresh
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userSetupPictureFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;

  if (!v5)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CNUserSetupPictureManager userSetupPictureDataIsFresh].cold.1((uint64_t)v6, v7, v11, v12, v13, v14, v15, v16);
    goto LABEL_6;
  }
  objc_msgSend(v5, "fileCreationDate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v7);
  v10 = v9 < 604800.0;

LABEL_7:
  return v10;
}

+ (BOOL)clearUserSetupPictureData
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "userSetupPicturePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v15);
  v6 = v15;

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CNUserSetupPictureManager clearUserSetupPictureData].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  return v5;
}

+ (void)userSetupPictureData
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Will remove setup user picture data that cannot be read from disk: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)userSetupPictureDataIsFresh
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Could not read attributes from setup user picture data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

+ (void)clearUserSetupPictureData
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Could not remove setup user picture data from disk: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
