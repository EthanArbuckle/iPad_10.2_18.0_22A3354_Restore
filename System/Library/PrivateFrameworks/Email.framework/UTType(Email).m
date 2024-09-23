@implementation UTType(Email)

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__UTType_Email__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_41 != -1)
    dispatch_once(&log_onceToken_41, block);
  return (id)log_log_41;
}

+ (id)em_contentTypeForFilename:()Email fileURL:
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id *)MEMORY[0x1E0CEC4A0];
  if (v7
    && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v7, *MEMORY[0x1E0CEC4A0]),
        (v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138543874;
      v16 = v9;
      v17 = 2112;
      v18 = v5;
      v19 = 2112;
      v20 = v6;
      _os_log_debug_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEBUG, "Content type is %{public}@ for attachment file name '%@', file URL '%@'", (uint8_t *)&v15, 0x20u);
    }

  }
  else
  {
    objc_msgSend(v6, "pathExtension");
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11
      && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:conformingToType:", v11, *v8),
          (v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "log");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412802;
        v16 = v5;
        v17 = 2112;
        v18 = v6;
        v19 = 2112;
        v20 = v9;
        _os_log_error_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_ERROR, "Unable to determine content type for item from its filename '%@'. Falling back to attachment file URL '%@': %@", (uint8_t *)&v15, 0x20u);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[UTType(Email) em_contentTypeForFilename:fileURL:].cold.1((uint64_t)v5, (uint64_t)v6, v13);

      v9 = *v8;
    }
    v7 = (void *)v11;
  }

  return v9;
}

+ (void)em_contentTypeForFilename:()Email fileURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B99BB000, log, OS_LOG_TYPE_ERROR, "Unable to determine content type for item. Attachment file name '%@', file URL: '%@'", (uint8_t *)&v3, 0x16u);
}

@end
