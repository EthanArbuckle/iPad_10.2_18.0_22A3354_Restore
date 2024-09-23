@implementation EKREMCompletionStateReminderPredicate

- (id)initForIncompleteRemindersWithDueDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5
{
  id v9;
  id v10;
  EKREMCompletionStateReminderPredicate *v11;
  EKREMCompletionStateReminderPredicate *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKREMCompletionStateReminderPredicate;
  v11 = -[EKREMReminderPredicate initWithCalendars:](&v14, sel_initWithCalendars_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_start, a3);
    objc_storeStrong((id *)&v12->_end, a4);
    v12->_completed = 0;
  }

  return v12;
}

- (id)initForCompletedRemindersWithCompletionDateStarting:(id)a3 ending:(id)a4 calendars:(id)a5
{
  id v9;
  id v10;
  EKREMCompletionStateReminderPredicate *v11;
  EKREMCompletionStateReminderPredicate *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EKREMCompletionStateReminderPredicate;
  v11 = -[EKREMReminderPredicate initWithCalendars:](&v14, sel_initWithCalendars_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_start, a3);
    objc_storeStrong((id *)&v12->_end, a4);
    v12->_completed = 1;
  }

  return v12;
}

- (id)fetchMatchingRemindersInStore:(id)a3 allLists:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSDate *start;
  NSDate *end;
  void *v12;

  v8 = a3;
  -[EKREMReminderPredicate remListIDsWithAllLists:](self, "remListIDsWithAllLists:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  end = self->_end;
  if (self->_completed)
    objc_msgSend(v8, "fetchCompletedRemindersForEventKitBridgingWithCompletionDateFrom:to:withListIDs:error:", start, end, v9, a5);
  else
    objc_msgSend(v8, "fetchIncompleteRemindersForEventKitBridgingWithDueDateFrom:to:withListIDs:error:", start, end, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)evaluateWithObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSDate *start;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EKREMCompletionStateReminderPredicate;
  if (-[EKREMReminderPredicate evaluateWithObject:](&v13, sel_evaluateWithObject_, v4))
  {
    v5 = v4;
    if (self->_completed == objc_msgSend(v5, "isCompleted"))
    {
      if (self->_start || self->_end)
      {
        if (self->_completed)
        {
          objc_msgSend(v5, "completionDate");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "dueDateComponents");
          v8 = objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            v6 = 0;
            goto LABEL_26;
          }
          v9 = (void *)v8;
          objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setCalendar:", v10);

          objc_msgSend(v9, "date");
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        start = self->_start;
        if (self->_completed)
        {
          if (!start)
          {
LABEL_18:
            if (self->_end && (objc_msgSend(v6, "CalIsAfterOrSameAsDate:") & 1) != 0)
              goto LABEL_26;
LABEL_23:
            v7 = 1;
LABEL_27:

            goto LABEL_28;
          }
          if ((objc_msgSend(v6, "CalIsBeforeDate:") & 1) != 0)
            goto LABEL_26;
          goto LABEL_17;
        }
        if (!start)
          goto LABEL_21;
        if ((objc_msgSend(v6, "CalIsBeforeOrSameAsDate:") & 1) == 0)
        {
LABEL_17:
          if (self->_completed)
            goto LABEL_18;
LABEL_21:
          if (self->_end && objc_msgSend(v6, "CalIsAfterDate:"))
            goto LABEL_26;
          goto LABEL_23;
        }
LABEL_26:
        v7 = 0;
        goto LABEL_27;
      }
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
LABEL_28:

    goto LABEL_29;
  }
  v7 = 0;
LABEL_29:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
}

@end
