@implementation ASSnapshotDictionaryByIndex

uint64_t __ASSnapshotDictionaryByIndex_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snapshotIndex");
}

@end
