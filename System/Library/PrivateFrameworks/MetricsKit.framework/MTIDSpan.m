@implementation MTIDSpan

+ (id)spanForScheme:(id)a3 date:(id)a4 referenceDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  MTIDSpan *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[MTIDSpan initWithScheme:date:referenceDate:]([MTIDSpan alloc], "initWithScheme:date:referenceDate:", v9, v8, v7);

  return v10;
}

- (MTIDSpan)initWithScheme:(id)a3 date:(id)a4 referenceDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTIDSpan *v11;
  MTIDSpan *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSDate *startDate;
  uint64_t v19;
  NSDate *endDate;
  double v21;
  unint64_t v22;
  uint64_t v23;
  NSDate *v24;
  uint64_t v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MTIDSpan;
  v11 = -[MTIDSpan init](&v27, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MTIDSpan setReferenceDate:](v11, "setReferenceDate:", v10);
    if (objc_msgSend(v8, "rotationSchedule") == 1)
    {
      +[MTIDSpan localCalendar](MTIDSpan, "localCalendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "components:fromDate:", 28, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "components:fromDate:", 28, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "components:fromDateComponents:toDateComponents:options:", 16, v15, v14, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12->_serialNumber = objc_msgSend(v16, "day");
      objc_msgSend(v13, "dateFromComponents:", v14);
      v17 = objc_claimAutoreleasedReturnValue();
      startDate = v12->_startDate;
      v12->_startDate = (NSDate *)v17;

      objc_msgSend(v14, "setDay:", objc_msgSend(v14, "day") + 1);
      objc_msgSend(v13, "dateFromComponents:", v14);
      v19 = objc_claimAutoreleasedReturnValue();
      endDate = v12->_endDate;
      v12->_endDate = (NSDate *)v19;

LABEL_9:
      goto LABEL_10;
    }
    if (objc_msgSend(v8, "lifespan") >= 1)
    {
      if (v10)
        objc_msgSend(v9, "timeIntervalSinceDate:", v10);
      else
        objc_msgSend(v9, "timeIntervalSince1970");
      v22 = (unint64_t)(v21 / (double)objc_msgSend(v8, "lifespan"));
      v12->_serialNumber = v22;
      objc_msgSend(v10, "dateByAddingTimeInterval:", (double)(objc_msgSend(v8, "lifespan") * v22));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v12->_startDate;
      v12->_startDate = (NSDate *)v23;

      -[NSDate dateByAddingTimeInterval:](v12->_startDate, "dateByAddingTimeInterval:", (double)objc_msgSend(v8, "lifespan"));
      v25 = objc_claimAutoreleasedReturnValue();
      v13 = v12->_endDate;
      v12->_endDate = (NSDate *)v25;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v12;
}

+ (id)localCalendar
{
  id v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;

  if (localCalendar_onceToken != -1)
    dispatch_once(&localCalendar_onceToken, &__block_literal_global_3);
  v2 = (id)localCalendar_lock;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!localCalendar_calendar
    || (objc_msgSend((id)localCalendar_calendar, "timeZone"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v3, "isEqualToTimeZone:", v4),
        v4,
        (v5 & 1) == 0))
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE48]);
    v7 = objc_msgSend(v6, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    v8 = (void *)localCalendar_calendar;
    localCalendar_calendar = v7;

  }
  objc_sync_exit(v2);

  return (id)localCalendar_calendar;
}

void __25__MTIDSpan_localCalendar__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BEDCDF0]);
  v1 = (void *)localCalendar_lock;
  localCalendar_lock = (uint64_t)v0;

}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unint64_t)a3
{
  self->_serialNumber = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_referenceDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
