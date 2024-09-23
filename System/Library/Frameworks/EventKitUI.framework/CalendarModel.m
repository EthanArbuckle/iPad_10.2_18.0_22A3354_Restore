@implementation CalendarModel

- (CalendarModel)init
{
  return -[CalendarModel initWithDataPath:](self, "initWithDataPath:", 0);
}

- (CalendarModel)initWithDataPath:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CalendarModel;
  return -[CUIKCalendarModel initWithDataPath:pasteboardManager:](&v4, sel_initWithDataPath_pasteboardManager_, a3, 0);
}

- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CalendarModel;
  -[CUIKCalendarModel occurrencesForStartDate:endDate:preSorted:waitForLoad:](&v9, sel_occurrencesForStartDate_endDate_preSorted_waitForLoad_, a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asCalendarOccurrencesCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)occurrencesForStartDay:(id)a3 endDay:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CalendarModel;
  -[CUIKCalendarModel occurrencesForStartDay:endDay:preSorted:waitForLoad:](&v9, sel_occurrencesForStartDay_endDay_preSorted_waitForLoad_, a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asCalendarOccurrencesCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)occurrencesForDay:(id)a3 waitForLoad:(BOOL)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalendarModel;
  -[CUIKCalendarModel occurrencesForDay:waitForLoad:](&v7, sel_occurrencesForDay_waitForLoad_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asCalendarOccurrencesCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
