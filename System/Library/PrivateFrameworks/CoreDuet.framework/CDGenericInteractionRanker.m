@implementation CDGenericInteractionRanker

void __47___CDGenericInteractionRanker_isDateInWeekend___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isDateInWeekend__calendar;
  isDateInWeekend__calendar = v0;

}

@end
