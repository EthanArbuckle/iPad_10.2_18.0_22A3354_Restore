@implementation HKMCMutableDaySummary

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKMCDaySummary _initFromDaySummary:]([HKMCDaySummary alloc], "_initFromDaySummary:", self);
}

@end
