@implementation LSStartupJournalledDatabaseRebuiltNotification

void __69___LSStartupJournalledDatabaseRebuiltNotification_sharedNotification__block_invoke()
{
  _LSStartupJournalledDatabaseRebuiltNotification *v0;
  void *v1;

  v0 = objc_alloc_init(_LSStartupJournalledDatabaseRebuiltNotification);
  v1 = (void *)sharedNotification_instance;
  sharedNotification_instance = (uint64_t)v0;

}

@end
