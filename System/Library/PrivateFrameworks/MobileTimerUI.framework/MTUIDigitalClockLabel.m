@implementation MTUIDigitalClockLabel

- (MTUIDigitalClockLabel)initWithFrame:(CGRect)a3
{
  MTUIDigitalClockLabel *v3;
  id v4;
  uint64_t v5;
  NSCalendar *calendar;
  NSCalendar *v7;
  void *v8;
  uint64_t v9;
  NSDate *baseDate;
  void *v11;
  MTUIDigitalClockLabel *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTUIDigitalClockLabel;
  v3 = -[MTUIDateLabel initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCE48]);
    v5 = objc_msgSend(v4, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
    calendar = v3->_calendar;
    v3->_calendar = (NSCalendar *)v5;

    v7 = v3->_calendar;
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v7, "setTimeZone:", v8);

    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", 0.0);
    baseDate = v3->_baseDate;
    v3->_baseDate = (NSDate *)v9;

    v3->_hour = -1;
    v3->_minute = -1;
    -[MTUIDigitalClockLabel resetFontSizes](v3, "resetFontSizes");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel_significantTimeChange_, *MEMORY[0x24BDF75A0], 0);

    v12 = v3;
  }

  return v3;
}

- (BOOL)setHour:(int64_t)a3 minute:(int64_t)a4
{
  if (self->_hour == a3 && self->_minute == a4)
    return 0;
  -[MTUIDigitalClockLabel forceSetHour:minute:](self, "forceSetHour:minute:");
  return 1;
}

- (void)forceSetHour:(int64_t)a3 minute:(int64_t)a4
{
  void *v7;
  id v8;

  self->_hour = a3;
  self->_minute = a4;
  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 1644, self->_baseDate);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHour:", a3);
  objc_msgSend(v8, "setMinute:", a4);
  -[NSCalendar dateFromComponents:](self->_calendar, "dateFromComponents:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIDateLabel setDateLabelText:](self, "setDateLabelText:", 0);
  -[MTUIDateLabel setDate:](self, "setDate:", v7);

}

- (void)resetFontSizes
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 25.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTUIDateLabel setFont:](self, "setFont:", v3);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 14.0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MTUIDateLabel setTimeDesignatorFont:](self, "setTimeDesignatorFont:", v4);

}

- (void)significantTimeChange:(id)a3
{
  NSCalendar *calendar;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF38], "resetSystemTimeZone", a3);
  calendar = self->_calendar;
  objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar setTimeZone:](calendar, "setTimeZone:", v5);

  -[MTUIDigitalClockLabel refreshUI](self, "refreshUI");
}

- (void)refreshUI
{
  if (self->_hour != -1 && self->_minute != -1)
    -[MTUIDigitalClockLabel forceSetHour:minute:](self, "forceSetHour:minute:");
}

- (void)setTimeLabelText:(id)a3
{
  id v4;

  self->_hour = -1;
  self->_minute = -1;
  v4 = a3;
  -[MTUIDateLabel setDate:](self, "setDate:", 0);
  -[MTUIDateLabel setDateLabelText:](self, "setDateLabelText:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDate, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end
