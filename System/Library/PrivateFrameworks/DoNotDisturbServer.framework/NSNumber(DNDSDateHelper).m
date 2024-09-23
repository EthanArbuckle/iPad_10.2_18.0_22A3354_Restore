@implementation NSNumber(DNDSDateHelper)

+ (uint64_t)dnds_numberWithDate:()DNDSDateHelper
{
  void *v3;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  return objc_msgSend(v3, "numberWithDouble:");
}

+ (id)dnds_safeNumberWithDate:()DNDSDateHelper
{
  if (!a3)
    return 0;
  objc_msgSend(a1, "dnds_numberWithDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)dnds_dateValue
{
  void *v1;

  v1 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "doubleValue");
  return objc_msgSend(v1, "dateWithTimeIntervalSinceReferenceDate:");
}

@end
