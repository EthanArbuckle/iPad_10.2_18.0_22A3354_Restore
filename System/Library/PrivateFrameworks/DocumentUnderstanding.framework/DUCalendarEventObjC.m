@implementation DUCalendarEventObjC

- (DUCalendarEventObjC)init
{
  DUCalendarEventObjC *v2;
  _TtC21DocumentUnderstanding15DUCalendarEvent *v3;
  _TtC21DocumentUnderstanding15DUCalendarEvent *underlying;
  DUCalendarEventObjC *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DUCalendarEventObjC;
  v2 = -[DUCalendarEventObjC init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC21DocumentUnderstanding15DUCalendarEvent);
    underlying = v2->_underlying;
    v2->_underlying = v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)isAllDay
{
  return -[DUCalendarEvent isAllDay](self->_underlying, "isAllDay");
}

- (void)setIsAllDay:(BOOL)a3
{
  -[DUCalendarEvent setIsAllDay:](self->_underlying, "setIsAllDay:", a3);
}

- (NSDateComponents)startDateComponents
{
  return -[DUCalendarEvent startDateComponents](self->_underlying, "startDateComponents");
}

- (void)setStartDateComponents:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUCalendarEvent setStartDateComponents:](self->_underlying, "setStartDateComponents:", v4);

}

- (NSTimeZone)startTimezone
{
  return -[DUCalendarEvent startTimezone](self->_underlying, "startTimezone");
}

- (void)setStartTimezone:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUCalendarEvent setStartTimezone:](self->_underlying, "setStartTimezone:", v4);

}

- (NSDateComponents)endDateComponents
{
  return -[DUCalendarEvent endDateComponents](self->_underlying, "endDateComponents");
}

- (void)setEndDateComponents:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUCalendarEvent setEndDateComponents:](self->_underlying, "setEndDateComponents:", v4);

}

- (NSTimeZone)endTimezone
{
  return -[DUCalendarEvent endTimezone](self->_underlying, "endTimezone");
}

- (void)setEndTimezone:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[DUCalendarEvent setEndTimezone:](self->_underlying, "setEndTimezone:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
