@implementation HDInsertStatisticsForColumnAndDataType

const __CFString *___HDInsertStatisticsForColumnAndDataType_block_invoke()
{
  return CFSTR("INSERT OR IGNORE INTO workout_statistics (workout_activity_id, data_type, quantity) VALUES (?, ?, ?)");
}

uint64_t ___HDInsertStatisticsForColumnAndDataType_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_int64(a2, 3, (uint64_t)*(double *)(a1 + 48));
}

@end
