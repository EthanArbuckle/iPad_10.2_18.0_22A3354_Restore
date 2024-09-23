@implementation NSNumber(NFTransportService)

- (uint64_t)encodeToCBOR
{
  return objc_msgSend(getCBORClass(), "cborWithInteger:", objc_msgSend(a1, "integerValue"));
}

@end
