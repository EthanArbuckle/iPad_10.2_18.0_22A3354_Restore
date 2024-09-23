@implementation CalDatabaseRemoveSuggestionsCalendar

uint64_t __CalDatabaseRemoveSuggestionsCalendar_block_invoke(uint64_t a1)
{
  return _CalCalendarRemoveAllPossibleSuggestionsCalendars(*(_QWORD **)(a1 + 32));
}

@end
