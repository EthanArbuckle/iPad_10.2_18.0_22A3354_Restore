@implementation CalDatabasePostDBOrSyncStatusChangeNotification

void ___CalDatabasePostDBOrSyncStatusChangeNotification_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("CalDatabaseAsyncNotificationQueue", v2);
  v1 = (void *)_CalDatabasePostDBOrSyncStatusChangeNotification_queue;
  _CalDatabasePostDBOrSyncStatusChangeNotification_queue = (uint64_t)v0;

}

void ___CalDatabasePostDBOrSyncStatusChangeNotification_block_invoke_2(uint64_t a1)
{
  _CalDatabasePostDBOrSyncStatusChangeNotificationSync(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 52), *(_QWORD *)(a1 + 40));
}

@end
