@implementation DDMatchCalendarEvent

- (DDMatchCalendarEvent)initWithDDScannerResult:(id)a3
{
  id v4;
  DDMatchCalendarEvent *v5;
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)DDMatchCalendarEvent;
  v5 = -[DDMatch initWithDDScannerResult:](&v25, sel_initWithDDScannerResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "coreResult");
    if ((DDResultHasType() & 1) != 0 || DDResultHasType())
    {
      v24 = 0;
      v22 = 0;
      v23 = 0;
      v20 = 0;
      v21 = 0;
      v6 = objc_msgSend(v4, "extractStartDate:startTimezone:endDate:endTimezone:allDayRef:referenceDate:referenceTimezone:", &v23, &v22, &v21, &v20, &v24, 0, 0);
      v7 = v23;
      v18 = v23;
      v8 = v22;
      v9 = v22;
      v10 = v21;
      v11 = v21;
      v12 = v20;
      v13 = v20;
      if (v6)
      {
        objc_storeStrong((id *)&v5->_startDate, v7);
        objc_storeStrong((id *)&v5->_startTimeZone, v8);
        objc_storeStrong((id *)&v5->_endDate, v10);
        objc_storeStrong((id *)&v5->_endTimeZone, v12);
        v5->_allDay = v24;
      }

    }
    else
    {
      v24 = 0;
      v19 = 0;
      objc_msgSend(v4, "dateFromReferenceDate:referenceTimezone:timezoneRef:allDayRef:", 0, 0, &v19, &v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v19;
      v16 = v19;
      if (v14)
      {
        objc_storeStrong((id *)&v5->_startDate, v14);
        objc_storeStrong((id *)&v5->_startTimeZone, v15);
        v5->_allDay = v24;
      }

    }
  }

  return v5;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSTimeZone)startTimeZone
{
  return self->_startTimeZone;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)endTimeZone
{
  return self->_endTimeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startTimeZone, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
