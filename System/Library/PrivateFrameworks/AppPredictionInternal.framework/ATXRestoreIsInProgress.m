@implementation ATXRestoreIsInProgress

uint64_t ___ATXRestoreIsInProgress_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = restoreInProgress;
  return result;
}

@end
