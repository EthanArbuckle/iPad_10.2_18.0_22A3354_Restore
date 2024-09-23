@implementation MOPlatformInfo

+ (id)extractHardwareAndSoftwareMetadata
{
  NSMutableDictionary *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  const __CFString *v9;
  const __CFString *v10;
  id v11;

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlatformInfo getHWModel](MOPlatformInfo, "getHWModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlatformInfo getProductType](MOPlatformInfo, "getProductType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlatformInfo getBuildVersion](MOPlatformInfo, "getBuildVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlatformInfo getProductVersion](MOPlatformInfo, "getProductVersion"));
  v7 = +[MOPlatformInfo isInternalBuild](MOPlatformInfo, "isInternalBuild");
  v8 = +[MOPlatformInfo isSeedBuild](MOPlatformInfo, "isSeedBuild");
  if (v3)
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v3, CFSTR("kMOHardwareModel"));
  if (v4)
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v4, CFSTR("kMOProductType"));
  if (v5)
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v5, CFSTR("kMOBuildVersion"));
  if (v6)
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v6, CFSTR("kMOProductVersion"));
  if (v7)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v9, CFSTR("kMOIsInternalBuild"));
  if (v8)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v10, CFSTR("kMOIsSeedBuild"));
  v11 = -[NSMutableDictionary copy](v2, "copy");

  return v11;
}

+ (id)getHWModel
{
  void *v2;
  id os_log;
  NSObject *v4;
  int v6;

  v6 = 0;
  v2 = (void *)MGCopyAnswerWithError(CFSTR("HWModelStr"), 0, &v6);
  if (!v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[MOPlatformInfo getHWModel].cold.1();

  }
  return v2;
}

+ (id)getProductType
{
  void *v2;
  id os_log;
  NSObject *v4;
  int v6;

  v6 = 0;
  v2 = (void *)MGCopyAnswerWithError(CFSTR("ProductType"), 0, &v6);
  if (!v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[MOPlatformInfo getProductType].cold.1();

  }
  return v2;
}

+ (id)getBuildVersion
{
  void *v2;
  id os_log;
  NSObject *v4;
  int v6;

  v6 = 0;
  v2 = (void *)MGCopyAnswerWithError(CFSTR("BuildVersion"), 0, &v6);
  if (!v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[MOPlatformInfo getBuildVersion].cold.1();

  }
  return v2;
}

+ (id)getProductVersion
{
  void *v2;
  id os_log;
  NSObject *v4;
  int v6;

  v6 = 0;
  v2 = (void *)MGCopyAnswerWithError(CFSTR("ProductVersion"), 0, &v6);
  if (!v2)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[MOPlatformInfo getProductVersion].cold.1();

  }
  return v2;
}

+ (BOOL)isInternalBuild
{
  MODefaultsManager *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  if (!os_variant_has_internal_diagnostics("com.apple.momentsd", a2))
    return 0;
  v2 = objc_opt_new(MODefaultsManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager objectForKey:](v2, "objectForKey:", CFSTR("PlatformInfoOverrideIsInternalBuild")));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

+ (BOOL)isSeedBuild
{
  MODefaultsManager *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = objc_opt_new(MODefaultsManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager objectForKey:](v2, "objectForKey:", CFSTR("PlatformInfoOverrideIsSeedBuild")));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)wasBuildVersionUpdated
{
  MODefaultsManager *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v2 = objc_opt_new(MODefaultsManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlatformInfo extractHardwareAndSoftwareMetadata](MOPlatformInfo, "extractHardwareAndSoftwareMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MODefaultsManager objectForKey:](v2, "objectForKey:", CFSTR("LastBuildVersion")));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("kMOBuildVersion")));
    v6 = objc_msgSend(v4, "isEqualToString:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (void)persistBuildVersion
{
  void *v2;
  void *v3;
  MODefaultsManager *v4;

  v4 = objc_opt_new(MODefaultsManager);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlatformInfo extractHardwareAndSoftwareMetadata](MOPlatformInfo, "extractHardwareAndSoftwareMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("kMOBuildVersion")));
  -[MODefaultsManager setObject:forKey:](v4, "setObject:forKey:", v3, CFSTR("LastBuildVersion"));

}

+ (BOOL)isIpad
{
  if (isIpad_onceToken != -1)
    dispatch_once(&isIpad_onceToken, &__block_literal_global_0);
  return isIpad_result;
}

void __24__MOPlatformInfo_isIpad__block_invoke(id a1)
{
  void *v1;
  void *v2;
  unsigned int v3;
  void *v4;

  v1 = (void *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  v2 = v1;
  if (v1)
  {
    v4 = v1;
    v3 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    v2 = v4;
    if (v3)
      isIpad_result = 1;
  }

}

+ (void)getHWModel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Could not get hardware version string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)getProductType
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Could not get product type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)getBuildVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Could not get build version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)getProductVersion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Could not get product version", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
