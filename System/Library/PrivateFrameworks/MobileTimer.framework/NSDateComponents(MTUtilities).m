@implementation NSDateComponents(MTUtilities)

- (double)mtTimeIntervalSinceComponents:()MTUtilities
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "mtNow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mtTimeIntervalSinceComponents:now:", v5, v6);
  v8 = v7;

  return v8;
}

- (double)mtTimeIntervalSinceComponents:()MTUtilities now:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v6 = (void *)MEMORY[0x1E0C99D48];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "mtGregorianCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mtNextDateAfterDate:matchingComponents:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "mtNextDateAfterDate:matchingComponents:", v10, a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  v13 = v12;

  return v13;
}

@end
