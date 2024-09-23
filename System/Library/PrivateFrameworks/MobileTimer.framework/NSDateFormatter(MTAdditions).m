@implementation NSDateFormatter(MTAdditions)

- (id)stringFromDate:()MTAdditions withRelativeToTimeZone:
{
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = objc_msgSend(a4, "secondsFromGMTForDate:", v6);
  objc_msgSend(a1, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (double)(v7 - objc_msgSend(v8, "secondsFromGMTForDate:", v6));

  objc_msgSend(v6, "dateByAddingTimeInterval:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
