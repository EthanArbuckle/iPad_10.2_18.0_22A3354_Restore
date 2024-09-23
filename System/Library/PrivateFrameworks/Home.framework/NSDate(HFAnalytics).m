@implementation NSDate(HFAnalytics)

- (uint64_t)hf_analyticsTimestamp
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (unint64_t)(v1 * 1000.0));
}

@end
