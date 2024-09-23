@implementation MT

uint64_t __newFetchedRowsForFetchPlan_MT_block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", *(int *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", *(int *)(a1 + 44));
}

uint64_t __newFetchedRowsForFetchPlan_MT_block_invoke_50(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", *(int *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", *(int *)(a1 + 44));
}

@end
