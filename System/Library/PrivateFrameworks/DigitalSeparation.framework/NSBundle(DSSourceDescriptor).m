@implementation NSBundle(DSSourceDescriptor)

+ (uint64_t)dssd_bundleForSourceDescriptor
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

@end
