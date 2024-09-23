@implementation NSDate(NFTransportService)

- (uint64_t)encodeToCBOR
{
  return objc_msgSend(getCBORClass(), "cborWithFullDate:", a1);
}

@end
