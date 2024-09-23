@implementation NTPBDate(FCAdditions)

+ (id)date
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pbDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)nsDate
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithPBDate:", a1);
}

- (BOOL)isLaterThan:()FCAdditions
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a1, "timeIntervalSince1970");
  v6 = v5;
  objc_msgSend(v4, "timeIntervalSince1970");
  v8 = v7;

  return v6 > v8;
}

@end
