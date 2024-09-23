@implementation BRStartDownloadForItemsWithOptions

uint64_t __BRStartDownloadForItemsWithOptions_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "br_isInSyncedLocation");
}

@end
