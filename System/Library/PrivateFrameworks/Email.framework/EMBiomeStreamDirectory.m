@implementation EMBiomeStreamDirectory

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__EMBiomeStreamDirectory_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, block);
  return (OS_os_log *)(id)log_log_4;
}

void __29__EMBiomeStreamDirectory_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;

}

+ (id)url
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v14;

  +[EMPersistenceLayoutManager mailDataDirectory](EMPersistenceLayoutManager, "mailDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:relativeToURL:", CFSTR("BiomeStream"), 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) != 0
    || ((v14 = 0,
         v7 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v14),
         (v8 = v14) == 0)
      ? (v9 = v7)
      : (v9 = 0),
        (v9 & 1) != 0))
  {
    v10 = v3;
  }
  else
  {
    v11 = v8;
    +[EMBiomeStreamDirectory log](EMBiomeStreamDirectory, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[EMBiomeStreamDirectory url].cold.1((uint64_t)v11, v12);

    v10 = 0;
  }

  return v10;
}

+ (void)url
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B99BB000, a2, OS_LOG_TYPE_ERROR, "Error creating Biome storage directory: %@", (uint8_t *)&v2, 0xCu);
}

@end
