@implementation BCShared

+ (uint64_t)classBundle
{
  objc_opt_self();
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

@end
