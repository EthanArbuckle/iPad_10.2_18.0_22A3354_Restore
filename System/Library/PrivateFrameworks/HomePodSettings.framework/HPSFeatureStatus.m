@implementation HPSFeatureStatus

+ (BOOL)isHomePodBetaEnrollmentEnabled
{
  int v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = _os_feature_enabled_impl();
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[HPSFeatureStatus isHomePodBetaEnrollmentEnabled]";
    v7 = 1024;
    v8 = v2;
    _os_log_impl(&dword_22DF16000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

+ (BOOL)isLocalSettingsEnabled
{
  int v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = _os_feature_enabled_impl();
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "+[HPSFeatureStatus isLocalSettingsEnabled]";
    v7 = 1024;
    v8 = v2;
    _os_log_impl(&dword_22DF16000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
  }

  return v2;
}

+ (BOOL)isAnalyticsAndImprovementSettingsEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isPyreEnabled
{
  return _os_feature_enabled_impl();
}

+ (BOOL)isOpalEnabled
{
  return _os_feature_enabled_impl();
}

@end
