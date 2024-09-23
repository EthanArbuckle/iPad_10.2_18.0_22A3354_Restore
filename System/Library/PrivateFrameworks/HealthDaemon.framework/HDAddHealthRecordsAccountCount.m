@implementation HDAddHealthRecordsAccountCount

uint64_t ___HDAddHealthRecordsAccountCount_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t ___HDAddHealthRecordsAccountCount_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;

  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  HDSQLiteBindFoundationValueToStatement();
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 7, *(_QWORD *)(a1 + 40));
}

@end
