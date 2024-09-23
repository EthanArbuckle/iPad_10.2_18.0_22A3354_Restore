@implementation NSCalendar(BSTimeUtilities)

- (uint64_t)date:()BSTimeUtilities isSameDayAsDate:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  -[NSCalendar _dateOnlyComponentsForDate:](a1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar _dateOnlyComponentsForDate:](a1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isSameDayAsComponents:", v8);

  return v9;
}

- (uint64_t)date:()BSTimeUtilities isSameYearAsDate:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  -[NSCalendar _dateOnlyComponentsForDate:](a1, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar _dateOnlyComponentsForDate:](a1, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isSameYearAsComponents:", v8);

  return v9;
}

@end
