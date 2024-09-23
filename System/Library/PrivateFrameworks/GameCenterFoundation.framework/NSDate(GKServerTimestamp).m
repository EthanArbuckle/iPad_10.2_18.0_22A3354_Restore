@implementation NSDate(GKServerTimestamp)

+ (id)_gkDateFromScalarServerTimestamp:()GKServerTimestamp
{
  void *v3;

  if ((double)a3 / 1000.0 <= 0.0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (id)_gkDateFromServerTimestamp:()GKServerTimestamp
{
  double v3;
  void *v4;

  objc_msgSend(a3, "doubleValue");
  if (v3 / 1000.0 <= 0.0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)_gkServerTimestamp
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_gkServerTimestamp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_gkServerTimestamp
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "timeIntervalSince1970");
  return objc_msgSend(v1, "_gkServerTimeInterval:");
}

@end
