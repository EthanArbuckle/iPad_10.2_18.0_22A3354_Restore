@implementation NSDate(NSCalendarDateStuff)

- (NSCalendarDate)dateWithCalendarFormat:()NSCalendarDateStuff timeZone:
{
  NSCalendarDate *v6;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v6 = +[NSCalendarDate dateWithTimeIntervalSinceReferenceDate:](NSCalendarDate, "dateWithTimeIntervalSinceReferenceDate:");
  -[NSCalendarDate setTimeZone:](v6, "setTimeZone:", a4);
  -[NSCalendarDate setCalendarFormat:](v6, "setCalendarFormat:", a3);
  return v6;
}

- (uint64_t)descriptionWithCalendarFormat:()NSCalendarDateStuff timeZone:locale:
{
  id v9;
  void *v10;
  uint64_t v11;

  v9 = objc_allocWithZone((Class)NSCalendarDate);
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  v10 = (void *)objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
  objc_msgSend(v10, "setTimeZone:", a4);
  objc_msgSend(v10, "setCalendarFormat:", a3);
  v11 = objc_msgSend(v10, "descriptionWithLocale:", a5);

  return v11;
}

@end
