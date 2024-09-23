@implementation HKFirstDayOfWeekForWeeklyGoalCalculations

void __HKFirstDayOfWeekForWeeklyGoalCalculations_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  HKFirstDayOfWeekForWeeklyGoalCalculations_firstDayOfWeek = _HKFirstDayOfWeekForLocale(v0);

}

@end
