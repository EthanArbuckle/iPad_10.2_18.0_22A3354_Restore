@implementation SOSRKNullKey

CFDataRef __SOSRKNullKey_block_invoke()
{
  CFDataRef result;

  result = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)"nullkey", 8);
  SOSRKNullKey_localNullKey = (uint64_t)result;
  return result;
}

@end
