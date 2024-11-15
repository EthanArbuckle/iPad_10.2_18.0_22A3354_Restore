@implementation SetupOnce

void __sr_SetupOnce_block_invoke()
{
  sStreamingRestrictionsNotificationQueue = (uint64_t)dispatch_queue_create("streamingRestrictionsNotificationQueue", 0);
  sCurrentStreamingRestrictionsMutex = FigSimpleMutexCreate();
  if (!sStreamingRestrictionsPolicy)
  {
    FigGetAllocatorForPermanentAllocations();
    sStreamingRestrictionsPolicy = FigCreatePropertyListFromBundleIdentifier();
  }
  notify_register_dispatch((const char *)*MEMORY[0x1E0C83A00], &sStreamingRestrictionsNotifyListenerToken, (dispatch_queue_t)sStreamingRestrictionsNotificationQueue, &__block_literal_global_15_2);
  sr_checkTokenLevelAndHandleIfNecessary();
}

@end
