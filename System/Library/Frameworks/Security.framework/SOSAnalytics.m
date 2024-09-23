@implementation SOSAnalytics

+ (id)databasePath
{
  if (databasePath_onceToken != -1)
    dispatch_once(&databasePath_onceToken, &__block_literal_global_3901);
  return +[SFAnalytics defaultAnalyticsDatabasePath:](SOSAnalytics, "defaultAnalyticsDatabasePath:", CFSTR("sos_analytics"));
}

+ (id)logger
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SOSAnalytics;
  objc_msgSendSuper2(&v3, sel_logger);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __28__SOSAnalytics_databasePath__block_invoke()
{
  WithPathInKeychainDirectory((uint64_t)CFSTR("sos_analytics.db"), (uint64_t)&__block_literal_global_19);
  WithPathInKeychainDirectory((uint64_t)CFSTR("sos_analytics.db-wal"), (uint64_t)&__block_literal_global_22_3907);
  WithPathInKeychainDirectory((uint64_t)CFSTR("sos_analytics.db-shm"), (uint64_t)&__block_literal_global_25_3909);
}

BOOL __28__SOSAnalytics_databasePath__block_invoke_4(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __28__SOSAnalytics_databasePath__block_invoke_3(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

BOOL __28__SOSAnalytics_databasePath__block_invoke_2(int a1, std::__fs::filesystem::path *__p)
{
  return remove(__p, (std::error_code *)__p);
}

@end
