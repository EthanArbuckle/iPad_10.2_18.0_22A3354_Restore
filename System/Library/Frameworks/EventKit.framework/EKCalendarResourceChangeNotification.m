@implementation EKCalendarResourceChangeNotification

- (EKCalendarResourceChangeNotification)initWithType:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKCalendarResourceChangeNotification;
  return -[EKCalendarNotification initWithType:](&v4, sel_initWithType_, a3);
}

- (id)resourceChangeFromEventStore:(id)a3
{
  return (id)objc_msgSend(a3, "publicObjectWithObjectID:", self->super._objectID);
}

- (BOOL)needsAlert
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarResourceChangeNotification;
  v3 = -[EKCalendarNotification needsAlert](&v5, sel_needsAlert);
  if (v3)
    LOBYTE(v3) = !-[EKCalendarNotification hiddenFromNotificationCenter](self, "hiddenFromNotificationCenter");
  return v3;
}

- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;

  v6 = a3;
  -[EKCalendarResourceChangeNotification resourceChangeFromEventStore:](self, "resourceChangeFromEventStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKCalendarResourceChangeNotification acknowledgeWithEventStore:error:].cold.1((uint64_t)self, v9);
      if (a4)
        goto LABEL_5;
    }
    else if (a4)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", 1010);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v8 = 0;
    goto LABEL_8;
  }
  v8 = objc_msgSend(v6, "removeResourceChange:error:", v7, a4);
LABEL_8:

  return v8;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)calendarName
{
  return self->_calendarName;
}

- (void)setCalendarName:(id)a3
{
  objc_storeStrong((id *)&self->_calendarName, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)startDateForNextOccurrence
{
  return self->_startDateForNextOccurrence;
}

- (void)setStartDateForNextOccurrence:(id)a3
{
  objc_storeStrong((id *)&self->_startDateForNextOccurrence, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (BOOL)allDay
{
  return self->_timeChanged;
}

- (void)setAllDay:(BOOL)a3
{
  self->_timeChanged = a3;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (void)setEventID:(id)a3
{
  objc_storeStrong((id *)&self->_eventID, a3);
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unsigned int)a3
{
  self->_changeType = a3;
}

- (BOOL)dateChanged
{
  return self->_locationChanged;
}

- (void)setDateChanged:(BOOL)a3
{
  self->_locationChanged = a3;
}

- (BOOL)timeChanged
{
  return self->_titleChanged;
}

- (void)setTimeChanged:(BOOL)a3
{
  self->_titleChanged = a3;
}

- (BOOL)locationChanged
{
  return *(&self->_titleChanged + 1);
}

- (void)setLocationChanged:(BOOL)a3
{
  *(&self->_titleChanged + 1) = a3;
}

- (BOOL)titleChanged
{
  return *(&self->_titleChanged + 2);
}

- (void)setTitleChanged:(BOOL)a3
{
  *(&self->_titleChanged + 2) = a3;
}

- (NSNumber)createCount
{
  return self->_createCount;
}

- (void)setCreateCount:(id)a3
{
  objc_storeStrong((id *)&self->_createCount, a3);
}

- (NSNumber)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(id)a3
{
  objc_storeStrong((id *)&self->_updateCount, a3);
}

- (NSNumber)deleteCount
{
  return self->_deleteCount;
}

- (void)setDeleteCount:(id)a3
{
  objc_storeStrong((id *)&self->_deleteCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deleteCount, 0);
  objc_storeStrong((id *)&self->_updateCount, 0);
  objc_storeStrong((id *)&self->_createCount, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDateForNextOccurrence, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_calendarName, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (void)acknowledgeWithEventStore:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Failed to load EKResourceChange with objectID %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
