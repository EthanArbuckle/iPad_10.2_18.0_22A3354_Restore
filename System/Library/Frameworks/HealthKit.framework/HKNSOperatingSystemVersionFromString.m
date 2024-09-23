@implementation HKNSOperatingSystemVersionFromString

uint64_t __HKNSOperatingSystemVersionFromString_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

@end
