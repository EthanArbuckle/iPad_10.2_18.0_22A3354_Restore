@implementation DKTombstoneNotifier

void __93___DKTombstoneNotifier_sendDistributedNotificationsForTombstoneRequirementIdentifiers_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __93___DKTombstoneNotifier_sendDistributedNotificationsForTombstoneRequirementIdentifiers_queue___block_invoke_cold_1(a1, v2);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("_DKKnowledgeStorageDidTombstoneEventsNotification"), *(_QWORD *)(a1 + 32), 0, 0);

}

void __93___DKTombstoneNotifier_sendDistributedNotificationsForTombstoneRequirementIdentifiers_queue___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "Posting distributed notification for 'did tombstone events' with requirement identifier: %@", (uint8_t *)&v3, 0xCu);
}

@end
