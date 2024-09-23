@implementation APReceiverSystemInfoCopyFeatures

uint64_t __APReceiverSystemInfoCopyFeatures_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = sysInfo_createFeaturesInternal(*(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
