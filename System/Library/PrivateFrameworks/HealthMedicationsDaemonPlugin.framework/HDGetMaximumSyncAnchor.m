@implementation HDGetMaximumSyncAnchor

uint64_t ___HDGetMaximumSyncAnchor_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

@end
