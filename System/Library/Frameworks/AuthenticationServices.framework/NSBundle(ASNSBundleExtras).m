@implementation NSBundle(ASNSBundleExtras)

+ (uint64_t)as_authenticationServicesBundle
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

@end
