@implementation EKCalendarEditItem

- (void)setCalendar:(id)a3 store:(id)a4
{
  EKEventStore *v7;
  EKEventStore *store;
  EKCalendar *v9;

  v9 = (EKCalendar *)a3;
  v7 = (EKEventStore *)a4;
  if (self->_calendar != v9)
  {
    objc_storeStrong((id *)&self->_calendar, a3);
    if (!self->_calendar)
      -[EKCalendarEditItem reset](self, "reset");
  }
  store = self->_store;
  self->_store = v7;

}

- (BOOL)configureWithCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
  return 1;
}

- (BOOL)configureWithCalendar:(id)a3 store:(id)a4
{
  EKCalendar *v6;
  EKEventStore *v7;
  EKCalendar *calendar;
  EKCalendar *v9;
  EKEventStore *store;

  v6 = (EKCalendar *)a3;
  v7 = (EKEventStore *)a4;
  calendar = self->_calendar;
  self->_calendar = v6;
  v9 = v6;

  store = self->_store;
  self->_store = v7;

  LOBYTE(v7) = -[EKCalendarEditItem configureWithCalendar:](self, "configureWithCalendar:", v9);
  return (char)v7;
}

- (unint64_t)numberOfSubitems
{
  return 1;
}

- (id)headerTitle
{
  return 0;
}

- (id)footerTitle
{
  return 0;
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  return -1.0;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)calendarEditor:(id)a3 shouldSelectSubitem:(unint64_t)a4
{
  return 1;
}

- (BOOL)saveStateToCalendar:(id)a3
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (EKCalendarEditItemDelegate)delegate
{
  return (EKCalendarEditItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
