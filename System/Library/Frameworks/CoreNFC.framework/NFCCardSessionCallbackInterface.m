@implementation NFCCardSessionCallbackInterface

+ (uint64_t)interface
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E02B50);
}

@end
