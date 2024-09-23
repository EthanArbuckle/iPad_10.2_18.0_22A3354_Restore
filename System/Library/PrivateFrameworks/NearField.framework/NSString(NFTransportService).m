@implementation NSString(NFTransportService)

- (uint64_t)encodeToCBOR
{
  return objc_msgSend(getCBORClass(), "cborWithUTF8String:", a1);
}

@end
