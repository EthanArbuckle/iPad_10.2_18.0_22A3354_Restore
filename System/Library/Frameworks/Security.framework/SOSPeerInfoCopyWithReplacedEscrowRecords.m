@implementation SOSPeerInfoCopyWithReplacedEscrowRecords

uint64_t __SOSPeerInfoCopyWithReplacedEscrowRecords_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v2;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    SOSPeerInfoV2DictionarySetValue(a2, (const void *)sEscrowRecord, v2);
  return 1;
}

@end
