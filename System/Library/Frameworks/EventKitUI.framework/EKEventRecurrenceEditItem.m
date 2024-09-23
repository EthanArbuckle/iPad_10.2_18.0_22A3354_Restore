@implementation EKEventRecurrenceEditItem

- (void)setCalendarItem:(id)a3 store:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKEventRecurrenceEditItem.m"), 17, CFSTR("Tried to set %@ as an event on %@"), v7, self);

    }
  }
  v10.receiver = self;
  v10.super_class = (Class)EKEventRecurrenceEditItem;
  -[EKCalendarItemEditItem setCalendarItem:store:](&v10, sel_setCalendarItem_store_, v7, v8);

}

- (id)event
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventRecurrenceEditItem;
  -[EKCalendarItemEditItem calendarItem](&v3, sel_calendarItem);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)stringForDate:(id)a3
{
  return (id)CUIKStringForDateAndDayOfWeekSystemTime();
}

- (id)recurrenceDate
{
  void *v2;
  void *v3;

  -[EKEventRecurrenceEditItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)recurrenceTimeZone
{
  void *v2;
  void *v3;

  -[EKEventRecurrenceEditItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)minRecurrenceEndDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  -[EKEventRecurrenceEditItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "singleRecurrenceRule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "recurrenceEnd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKEventRecurrenceEditItem event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDateUnadjustedForLegacyClients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (v9 = objc_msgSend(v6, "CalIsBeforeDate:", v8), v10 = v6, (v9 & 1) == 0))
    v10 = v8;
  v11 = v10;

  return v11;
}

@end
