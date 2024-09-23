@implementation NSDate(CPAnalytics)

+ (uint64_t)cpa_yearsAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "cpa_daysAgo:", a1 * 365.0);
}

+ (uint64_t)cpa_daysAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "cpa_hoursAgo:", a1 * 24.0);
}

+ (uint64_t)cpa_hoursAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "cpa_minutesAgo:", a1 * 60.0);
}

+ (uint64_t)cpa_minutesAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "cpa_secondsAgo:", a1 * 60.0);
}

+ (uint64_t)cpa_secondsAgo:()CPAnalytics
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -a1);
}

@end
