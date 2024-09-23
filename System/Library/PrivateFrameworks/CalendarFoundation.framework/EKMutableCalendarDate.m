@implementation EKMutableCalendarDate

- (id)copyWithZone:(_NSZone *)a3
{
  return -[EKCalendarDate initWithDate:components:calendar:]([EKCalendarDate alloc], "initWithDate:components:calendar:", self->super._date, self->super._components, self->super._calendar);
}

- (void)addYears:(int64_t)a3
{
  void *v5;
  NSDate *v6;
  NSDate *date;
  NSString *dateCacheKey;
  NSDateComponents *components;

  -[EKCalendarDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingYears:inCalendar:", a3, self->super._calendar);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;

}

- (void)addMonths:(int64_t)a3
{
  void *v5;
  NSDate *v6;
  NSDate *date;
  NSString *dateCacheKey;
  NSDateComponents *components;

  -[EKCalendarDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingMonths:inCalendar:", a3, self->super._calendar);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;

}

- (void)addDays:(int64_t)a3
{
  void *v5;
  NSDate *v6;
  NSDate *date;
  NSString *dateCacheKey;
  NSDateComponents *components;

  -[EKCalendarDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingDays:inCalendar:", a3, self->super._calendar);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;

}

- (void)addHours:(int64_t)a3
{
  void *v5;
  NSDate *v6;
  NSDate *date;
  NSString *dateCacheKey;
  NSDateComponents *components;

  -[EKCalendarDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingHours:inCalendar:", a3, self->super._calendar);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;

}

- (void)addMinutes:(int64_t)a3
{
  void *v5;
  NSDate *v6;
  NSDate *date;
  NSString *dateCacheKey;
  NSDateComponents *components;

  -[EKCalendarDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingMinutes:inCalendar:", a3, self->super._calendar);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;

}

- (void)addSeconds:(int64_t)a3
{
  void *v5;
  NSDate *v6;
  NSDate *date;
  NSString *dateCacheKey;
  NSDateComponents *components;

  -[EKCalendarDate date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", (double)a3);
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  date = self->super._date;
  self->super._date = v6;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;

}

- (void)addComponents:(id)a3
{
  NSCalendar *calendar;
  id v5;
  void *v6;
  NSDate *v7;
  NSDate *date;
  NSString *dateCacheKey;
  NSDateComponents *components;

  calendar = self->super._calendar;
  v5 = a3;
  -[EKCalendarDate date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateByAddingComponents:toDate:options:](calendar, "dateByAddingComponents:toDate:options:", v5, v6, 0);
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();

  date = self->super._date;
  self->super._date = v7;

  dateCacheKey = self->super._dateCacheKey;
  self->super._dateCacheKey = 0;

  components = self->super._components;
  self->super._components = 0;

}

@end
