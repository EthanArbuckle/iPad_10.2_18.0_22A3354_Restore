@implementation CalCopyAbsoluteCalendarItemAlarmsInDateRange

uint64_t ___CalCopyAbsoluteCalendarItemAlarmsInDateRange_block_invoke(uint64_t a1, uint64_t a2)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 1, (int)*(double *)(a1 + 32));
  return sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), 2, (int)*(double *)(a1 + 40));
}

@end
