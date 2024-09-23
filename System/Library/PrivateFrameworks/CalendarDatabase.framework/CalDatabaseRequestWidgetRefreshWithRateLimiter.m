@implementation CalDatabaseRequestWidgetRefreshWithRateLimiter

void __CalDatabaseRequestWidgetRefreshWithRateLimiter_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.calendar.database.refreshWidgetQueue", v2);
  v1 = (void *)CalDatabaseRequestWidgetRefreshWithRateLimiter_refreshQueue;
  CalDatabaseRequestWidgetRefreshWithRateLimiter_refreshQueue = (uint64_t)v0;

}

uint64_t __CalDatabaseRequestWidgetRefreshWithRateLimiter_block_invoke_2()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v4[16];

  os_unfair_lock_lock((os_unfair_lock_t)&CalDatabaseRequestWidgetRefreshWithRateLimiter_lock);
  CalDatabaseRequestWidgetRefreshWithRateLimiter_refreshPending = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSinceReferenceDate");
  CalDatabaseRequestWidgetRefreshWithRateLimiter_lastRefreshTimestamp = v1;

  os_unfair_lock_unlock((os_unfair_lock_t)&CalDatabaseRequestWidgetRefreshWithRateLimiter_lock);
  v2 = CDBWidgetReloadHandle;
  if (os_log_type_enabled((os_log_t)CDBWidgetReloadHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A5CCB000, v2, OS_LOG_TYPE_DEFAULT, "Reloading widget timeline because of database change notification", v4, 2u);
  }
  return objc_msgSend(MEMORY[0x1E0D0C408], "refreshEventWidgets");
}

@end
