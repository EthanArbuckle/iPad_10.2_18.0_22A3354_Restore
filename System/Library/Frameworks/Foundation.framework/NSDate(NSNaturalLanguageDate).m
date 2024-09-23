@implementation NSDate(NSNaturalLanguageDate)

+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate date:locale:
{
  NSCalendarDate *v2;

  v2 = +[NSCalendarDate dateWithNaturalLanguageString:date:locale:](NSCalendarDate, "dateWithNaturalLanguageString:date:locale:");
  if (!v2 || (void *)objc_opt_self() == a1)
    return (uint64_t)v2;
  -[NSCalendarDate timeIntervalSinceReferenceDate](v2, "timeIntervalSinceReferenceDate");
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate
{
  return objc_msgSend(a1, "dateWithNaturalLanguageString:date:locale:", a3, 0, 0);
}

+ (uint64_t)dateWithNaturalLanguageString:()NSNaturalLanguageDate locale:
{
  return objc_msgSend(a1, "dateWithNaturalLanguageString:date:locale:", a3, 0, a4);
}

@end
