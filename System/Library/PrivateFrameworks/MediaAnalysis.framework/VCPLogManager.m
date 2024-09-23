@implementation VCPLogManager

+ (id)sharedLogManager
{
  if (+[VCPLogManager sharedLogManager]::once != -1)
    dispatch_once(&+[VCPLogManager sharedLogManager]::once, &__block_literal_global_84);
  return (id)+[VCPLogManager sharedLogManager]::instance;
}

void __33__VCPLogManager_sharedLogManager__block_invoke()
{
  VCPLogManager *v0;
  void *v1;

  v0 = objc_alloc_init(VCPLogManager);
  v1 = (void *)+[VCPLogManager sharedLogManager]::instance;
  +[VCPLogManager sharedLogManager]::instance = (uint64_t)v0;

}

- (VCPLogManager)init
{
  VCPLogManager *v2;
  VCPLogManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VCPLogManager;
  v2 = -[VCPLogManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_logLevel = 6;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentDomainForName:", CFSTR("com.apple.mediaanalysis"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", CFSTR("LogLevel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "intValue");
      if (v8 >= 7)
        v9 = 7;
      else
        v9 = v8;
      v3->_logLevel = v9 & ~(v9 >> 31);
    }
    objc_msgSend(v5, "objectForKey:", CFSTR("EnableDatabaseLog"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v3->_enableDatabaseLog = objc_msgSend(v10, "BOOLValue");

  }
  return v3;
}

+ (id)dateFormatter
{
  if (+[VCPLogManager dateFormatter]::once != -1)
    dispatch_once(&+[VCPLogManager dateFormatter]::once, &__block_literal_global_133);
  return (id)+[VCPLogManager dateFormatter]::formatter;
}

void __30__VCPLogManager_dateFormatter__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)+[VCPLogManager dateFormatter]::formatter;
  +[VCPLogManager dateFormatter]::formatter = (uint64_t)v0;

  objc_msgSend((id)+[VCPLogManager dateFormatter]::formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSSSSXXXX"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)+[VCPLogManager dateFormatter]::formatter, "setLocale:");

}

+ (id)dateFormatterDateTime
{
  if (+[VCPLogManager dateFormatterDateTime]::once != -1)
    dispatch_once(&+[VCPLogManager dateFormatterDateTime]::once, &__block_literal_global_138_1);
  return (id)+[VCPLogManager dateFormatterDateTime]::formatter;
}

void __38__VCPLogManager_dateFormatterDateTime__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)+[VCPLogManager dateFormatterDateTime]::formatter;
  +[VCPLogManager dateFormatterDateTime]::formatter = (uint64_t)v0;

  objc_msgSend((id)+[VCPLogManager dateFormatterDateTime]::formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ssXXXX"));
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)+[VCPLogManager dateFormatterDateTime]::formatter, "setLocale:");

}

- (int)logLevel
{
  return self->_logLevel;
}

- (BOOL)enableDatabaseLog
{
  return self->_enableDatabaseLog;
}

@end
