@implementation CoreSpotlightUtils

+ (void)initialize
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  CSFastUserActivites = objc_msgSend(v2, "BOOLForKey:", CFSTR("CSFastUserActivities"));
  CSForceDataMigration = objc_msgSend(v2, "BOOLForKey:", CFSTR("CSForceDataMigration"));
  gDisableUserActivities = objc_msgSend(v2, "BOOLForKey:", CFSTR("CSDisableBackgroundHarvesting"));
  gCSLogDetailedActivity = objc_msgSend(v2, "BOOLForKey:", CFSTR("CSLogDetailedActivity"));

}

+ (BOOL)fastUserActivites
{
  return CSFastUserActivites;
}

+ (BOOL)detailedLoggingEnabled
{
  return gCSLogDetailedActivity;
}

+ (BOOL)disabledUserActivities
{
  return gDisableUserActivities;
}

+ (BOOL)forceDataMigration
{
  return CSForceDataMigration;
}

@end
