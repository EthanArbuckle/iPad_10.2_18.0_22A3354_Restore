@implementation FIMindfulnessWeekendDaySelectionForCalendar

uint64_t __FIMindfulnessWeekendDaySelectionForCalendar_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "unsignedIntegerValue");
  if ((unint64_t)(result - 1) > 6)
    v4 = 0;
  else
    v4 = qword_2116C2168[result - 1];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v4;
  return result;
}

@end
