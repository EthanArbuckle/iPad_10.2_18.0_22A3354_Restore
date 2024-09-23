@implementation CUIKOccurrencesCollection(CalendarOccurrencesCollection)

- (CalendarOccurrencesCollection)asCalendarOccurrencesCollection
{
  CalendarOccurrencesCollection *v2;
  void *v3;
  void *v4;
  void *v5;
  CalendarOccurrencesCollection *v6;

  v2 = [CalendarOccurrencesCollection alloc];
  objc_msgSend(a1, "occurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timedOccurrences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allDayOccurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CalendarOccurrencesCollection initWithOccurrences:timedOccurrences:allDayOccurrences:generation:](v2, "initWithOccurrences:timedOccurrences:allDayOccurrences:generation:", v3, v4, v5, objc_msgSend(a1, "generation"));

  return v6;
}

@end
