@implementation CBDevice(HKCBDevice)

- (unint64_t)isGuestPaired
{
  return ((unint64_t)objc_msgSend(a1, "deviceFlags") >> 25) & 1;
}

@end
