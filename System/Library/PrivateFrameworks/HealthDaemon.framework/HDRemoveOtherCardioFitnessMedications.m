@implementation HDRemoveOtherCardioFitnessMedications

uint64_t ___HDRemoveOtherCardioFitnessMedications_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >> 2) & 1;
}

uint64_t ___HDRemoveOtherCardioFitnessMedications_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a2, 2, v4);
}

@end
