@implementation NSUserDefaults(ClipServicesExtras)

+ (id)cps_clipServicesDefaults
{
  if (cps_clipServicesDefaults_onceToken != -1)
    dispatch_once(&cps_clipServicesDefaults_onceToken, &__block_literal_global_14);
  return (id)cps_clipServicesDefaults_clipServicesDefaults;
}

- (uint64_t)cps_didShowFirstTimeLocationConsent
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPSDidShowFirstTimeLocationConsent"));

  return v1;
}

- (void)setCps_didShowFirstTimeLocationConsent:()ClipServicesExtras
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", a3, CFSTR("CPSDidShowFirstTimeLocationConsent"));

}

- (uint64_t)cps_forceReportProblemErrorFetchProblemTypes
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPSForceReportProblemErrorFetchProblemTypes"));

  return v1;
}

- (uint64_t)cps_forceReportProblemErrorNoDeveloperSupportURL
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPSForceReportProblemErrorNoDeveloperSupportURL"));

  return v1;
}

- (uint64_t)cps_forceReportProblemErrorUnableToSubmitResponse
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BDBCF50], "cps_clipServicesDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("CPSForceReportProblemErrorUnableToSubmitResponse"));

  return v1;
}

@end
