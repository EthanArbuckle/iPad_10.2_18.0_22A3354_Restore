@implementation NSDate(NTPBAdditions)

+ (id)pbDate
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pbDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)pbDate
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D62698]);
  objc_msgSend(a1, "timeIntervalSince1970");
  objc_msgSend(v2, "setTimeIntervalSince1970:");
  return v2;
}

+ (id)dateWithPBDate:()NTPBAdditions
{
  void *v3;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "timeIntervalSince1970");
  objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
