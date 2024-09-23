@implementation NSDate(EDAMAdditions)

- (uint64_t)edamTimestamp
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return (uint64_t)(trunc(v1) * 1000.0);
}

+ (uint64_t)dateWithEDAMTimestamp:()EDAMAdditions
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)a3 / 1000.0);
}

@end
