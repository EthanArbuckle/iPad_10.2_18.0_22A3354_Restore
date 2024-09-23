@implementation _LSStartupJournalledDatabaseRebuiltNotification

+ (id)sharedNotification
{
  if (sharedNotification_onceToken != -1)
    dispatch_once(&sharedNotification_onceToken, &__block_literal_global_81);
  return (id)sharedNotification_instance;
}

- (void)dispatchToObserver:(id)a3 forInstallProgressService:(id)a4
{
  objc_msgSend(a4, "sendDatabaseRebuiltNotificationToObserver:", a3);
}

@end
