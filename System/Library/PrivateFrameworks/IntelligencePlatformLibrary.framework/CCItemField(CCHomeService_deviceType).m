@implementation CCItemField(CCHomeService_deviceType)

- (uint64_t)homeServiceDeviceType
{
  uint64_t result;

  LODWORD(result) = objc_msgSend(a1, "uint32Value");
  if (result >= 0x2E)
    return 0;
  else
    return result;
}

@end
