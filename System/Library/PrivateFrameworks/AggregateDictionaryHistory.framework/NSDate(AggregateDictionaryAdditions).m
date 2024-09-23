@implementation NSDate(AggregateDictionaryAdditions)

+ (uint64_t)dateForDaysSince1970:()AggregateDictionaryAdditions
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(86400 * a3));
}

+ (uint64_t)daysSince1970
{
  return ((int)time(0) / 86400);
}

@end
