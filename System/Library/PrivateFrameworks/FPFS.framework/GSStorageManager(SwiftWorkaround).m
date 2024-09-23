@implementation GSStorageManager(SwiftWorkaround)

+ (uint64_t)fp_defaultManager
{
  return objc_msgSend(MEMORY[0x24BE3AE90], "manager");
}

@end
