@implementation ASLoggingInitialize

void __ASLoggingInitialize_block_invoke()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;

  v0 = os_log_create((const char *)ASLoggingSubsystem, "achievements");
  v1 = (void *)ASLogAchievements;
  ASLogAchievements = (uint64_t)v0;

  v2 = os_log_create((const char *)ASLoggingSubsystem, "activity_data");
  v3 = (void *)ASLogActivityData;
  ASLogActivityData = (uint64_t)v2;

  v4 = os_log_create((const char *)ASLoggingSubsystem, "cloudkit");
  v5 = (void *)ASLogCloudKit;
  ASLogCloudKit = (uint64_t)v4;

  v6 = os_log_create((const char *)ASLoggingSubsystem, "competitions");
  v7 = (void *)ASLogCompetitions;
  ASLogCompetitions = (uint64_t)v6;

  v8 = os_log_create((const char *)ASLoggingSubsystem, "database");
  v9 = (void *)ASLogDatabase;
  ASLogDatabase = (uint64_t)v8;

  v10 = os_log_create((const char *)ASLoggingSubsystem, "default");
  v11 = (void *)ASLogDefault;
  ASLogDefault = (uint64_t)v10;

  v12 = os_log_create((const char *)ASLoggingSubsystem, "friend_list");
  v13 = (void *)ASLogFriendList;
  ASLogFriendList = (uint64_t)v12;

  v14 = os_log_create((const char *)ASLoggingSubsystem, "notifications");
  v15 = (void *)ASLogNotifications;
  ASLogNotifications = (uint64_t)v14;

  v16 = os_log_create((const char *)ASLoggingSubsystem, "periodic_updates");
  v17 = (void *)ASLogPeriodicUpdates;
  ASLogPeriodicUpdates = (uint64_t)v16;

  v18 = os_log_create((const char *)ASLoggingSubsystem, "relationships");
  v19 = (void *)ASLogRelationships;
  ASLogRelationships = (uint64_t)v18;

}

@end
