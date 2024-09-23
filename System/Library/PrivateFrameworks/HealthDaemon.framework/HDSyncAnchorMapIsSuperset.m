@implementation HDSyncAnchorMapIsSuperset

uint64_t __HDSyncAnchorMapIsSuperset_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "anchorForSyncEntityIdentifier:", a2);
  if (result < a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

@end
