@implementation HDSyncIdentityUpdateForSourceEntity

uint64_t ___HDSyncIdentityUpdateForSourceEntity_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDSyncIdentityUpdateForSourceEntity_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

@end
