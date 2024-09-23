@implementation CLLocationPushServiceExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  uint64_t v2;

  return (id)objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], a2, (uint64_t)&unk_1EE17B3B0, v2);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  uint64_t v2;

  return (id)objc_msgSend_interfaceWithProtocol_(MEMORY[0x1E0CB3B50], a2, (uint64_t)&unk_1EE181D78, v2);
}

@end
