@implementation NSCalendar(HKMenstrualCycles)

- (uint64_t)hkmc_nextDateAfterDate:()HKMenstrualCycles matchingHourComponents:
{
  return objc_msgSend(a1, "nextDateAfterDate:matchingComponents:options:", a3, a4, 2);
}

@end
