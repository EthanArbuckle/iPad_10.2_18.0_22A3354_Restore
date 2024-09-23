@implementation CalDatabaseCopyScheduledTasksInDateRange

uint64_t ___CalDatabaseCopyScheduledTasksInDateRange_block_invoke(double *a1, uint64_t a2)
{
  sqlite3_bind_double(*(sqlite3_stmt **)(a2 + 8), 1, a1[4]);
  sqlite3_bind_double(*(sqlite3_stmt **)(a2 + 8), 2, a1[5]);
  sqlite3_bind_double(*(sqlite3_stmt **)(a2 + 8), 3, a1[6]);
  sqlite3_bind_double(*(sqlite3_stmt **)(a2 + 8), 4, a1[7]);
  sqlite3_bind_double(*(sqlite3_stmt **)(a2 + 8), 5, a1[4]);
  return sqlite3_bind_double(*(sqlite3_stmt **)(a2 + 8), 6, a1[5]);
}

@end
