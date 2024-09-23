@implementation NSBundle(IRExtensions)

+ (uint64_t)IRFrameworkBundle
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

@end
