@implementation SecCFCalendarDoWithZuluCalendar

uint64_t __SecCFCalendarDoWithZuluCalendar_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (SecCFCalendarGetZulu_onceToken != -1)
    dispatch_once(&SecCFCalendarGetZulu_onceToken, &__block_literal_global_51);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, sZuluCalendar);
}

@end
