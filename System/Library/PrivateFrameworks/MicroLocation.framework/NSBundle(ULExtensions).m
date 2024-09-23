@implementation NSBundle(ULExtensions)

+ (uint64_t)ULFrameworkBundle
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

@end
