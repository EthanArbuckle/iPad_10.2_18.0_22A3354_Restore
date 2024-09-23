@implementation FCPruneHistoryItemsForUpload

uint64_t __FCPruneHistoryItemsForUpload_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "lastVisitedAt");
}

unint64_t __FCPruneHistoryItemsForUpload_block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "flags") >> 2) & 1;
}

@end
