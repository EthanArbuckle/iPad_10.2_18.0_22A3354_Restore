@implementation NSDate(Epoch)

+ (uint64_t)fm_dateFromEpoch:()Epoch
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)a3 / 1000.0);
}

- (uint64_t)fm_epoch
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return (uint64_t)(v1 * 1000.0);
}

- (uint64_t)fm_epochObject
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a1, "fm_epoch"));
}

@end
