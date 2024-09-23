@implementation NSDate

- (BOOL)_isToday
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v3, "isDateInToday:", self);

  return (char)self;
}

- (BOOL)_isYesterday
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  LOBYTE(self) = objc_msgSend(v3, "isDateInYesterday:", self);

  return (char)self;
}

- (BOOL)_isWithinTheLastTimePeriodInDays:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -(uint64_t)a3, v5, 0));

  v8 = -[NSDate compare:](self, "compare:", v7) != NSOrderedAscending
    && (id)-[NSDate compare:](self, "compare:", v5) != (id)1;

  return v8;
}

@end
