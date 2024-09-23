@implementation ABUnregisterAndPrepareToDeleteDelegateDatabasesExcludingAltDSIDs

uint64_t __ABUnregisterAndPrepareToDeleteDelegateDatabasesExcludingAltDSIDs_block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
}

@end
