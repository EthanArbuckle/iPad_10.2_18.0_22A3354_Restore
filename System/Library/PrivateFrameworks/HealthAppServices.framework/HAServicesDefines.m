@implementation HAServicesDefines

+ (NSString)internalHealthAppURLScheme
{
  return (NSString *)(id)*MEMORY[0x1E0CB5118];
}

+ (NSString)internalSettingsAppURLScheme
{
  return (NSString *)CFSTR("prefs");
}

+ (NSString)externalHealthAppURLScheme
{
  return (NSString *)CFSTR("https");
}

+ (NSString)externalHealthAppURLHost
{
  return (NSString *)CFSTR("health.apple.com");
}

+ (NSString)nanoHealthSettingsBundleIdentifier
{
  return (NSString *)CFSTR("com.apple.NanoHealthSettings");
}

+ (NSString)nanoInternalSettingsAppURLScheme
{
  return (NSString *)CFSTR("prefs");
}

+ (NSString)healthProfileResourceSpecifier
{
  return (NSString *)CFSTR("HealthProfile");
}

+ (NSString)healthAppBrowseHostName
{
  return (NSString *)CFSTR("browse");
}

+ (NSString)healthAppSummaryHostName
{
  return (NSString *)CFSTR("summary");
}

+ (NSString)dataTypeDetailHostName
{
  return (NSString *)CFSTR("dataTypeDetail");
}

+ (NSString)healthTrendsHostName
{
  return (NSString *)CFSTR("allTrends");
}

+ (NSString)sampleTypeHostName
{
  return (NSString *)CFSTR("SampleType");
}

+ (NSString)categoryTypeHostName
{
  return (NSString *)CFSTR("CategoryType");
}

+ (NSString)sharingOverviewHostName
{
  return (NSString *)CFSTR("sharingOverview");
}

+ (NSString)authorizationManagementHostName
{
  return (NSString *)CFSTR("AuthorizationManagement");
}

+ (NSString)healthSettingsSourcesHostName
{
  return (NSString *)CFSTR("SOURCES_ITEM");
}

+ (NSString)healthAppMedicalIDPath
{
  return (NSString *)CFSTR("MedicalID");
}

+ (NSString)healthAppNotificationSettingsPath
{
  return (NSString *)CFSTR("notificationSettings");
}

+ (NSString)healthAppSharingInviteFlowPath
{
  return (NSString *)CFSTR("SharingInviteFlow");
}

+ (NSString)healthAppSharingProfilePath
{
  return (NSString *)CFSTR("SharingProfile");
}

+ (NSString)healthAppVisionRXIngestionURLPath
{
  return (NSString *)CFSTR("add-vrx");
}

+ (NSString)queryParameterNameDate
{
  return (NSString *)CFSTR("date");
}

+ (NSString)queryParameterNameStartDate
{
  return (NSString *)CFSTR("startDate");
}

+ (NSString)queryParameterNameEndDate
{
  return (NSString *)CFSTR("endDate");
}

+ (NSString)queryParameterNameDataTypeCode
{
  return (NSString *)CFSTR("dataType");
}

+ (NSString)queryParameterNameTrendOverlay
{
  return (NSString *)CFSTR("trendTimescope");
}

+ (NSString)queryParameterNameSource
{
  return (NSString *)CFSTR("urlSource");
}

+ (NSString)externalSourceAssistantService
{
  return (NSString *)(id)*MEMORY[0x1E0CB77C0];
}

@end
