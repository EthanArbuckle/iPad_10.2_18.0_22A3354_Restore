@implementation NSCalendar

- (id)_dateOnlyComponentsForDate:(void *)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "components:fromDate:", 542, v3);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

@end
