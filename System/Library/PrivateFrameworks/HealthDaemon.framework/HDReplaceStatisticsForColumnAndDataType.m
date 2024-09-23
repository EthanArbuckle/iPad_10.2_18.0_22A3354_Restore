@implementation HDReplaceStatisticsForColumnAndDataType

const __CFString *___HDReplaceStatisticsForColumnAndDataType_block_invoke()
{
  return CFSTR("INSERT OR REPLACE INTO workout_statistics (workout_activity_id, data_type, quantity) VALUES (?, ?, ?)");
}

uint64_t ___HDReplaceStatisticsForColumnAndDataType_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
  return sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
}

@end
