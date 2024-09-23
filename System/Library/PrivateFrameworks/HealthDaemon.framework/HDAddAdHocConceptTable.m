@implementation HDAddAdHocConceptTable

uint64_t ___HDAddAdHocConceptTable_block_invoke(int a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 0);
  HDSQLiteBindStringToStatement();
  return HDSQLiteBindStringToStatement();
}

uint64_t ___HDAddAdHocConceptTable_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB18C](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

uint64_t ___HDAddAdHocConceptTable_block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  double Current;

  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindStringToStatement();
  HDSQLiteBindStringToStatement();
  sqlite3_bind_int64(a2, 4, 0);
  sqlite3_bind_int64(a2, 5, 0);
  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 6, Current);
  return sqlite3_bind_int64(a2, 7, *(_QWORD *)(a1 + 56));
}

@end
