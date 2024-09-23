@implementation HDCloudSyncUpdateProgressOnQueueByAmountForObjectAndLog

void __HDCloudSyncUpdateProgressOnQueueByAmountForObjectAndLog_block_invoke(uint64_t a1)
{
  HDCloudSyncUpdateProgressAssertQueueForObjectAndLog(*(void **)(a1 + 32), *(NSObject **)(a1 + 40), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56) + objc_msgSend(*(id *)(a1 + 32), "completedUnitCount"));
}

@end
