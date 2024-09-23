@implementation PNInitializeSamplePhoneNumbers

void ___PNInitializeSamplePhoneNumbers_block_invoke()
{
  sSamplePhoneNumbers = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue((CFMutableDictionaryRef)sSamplePhoneNumbers, CFSTR("us"), CFSTR("14085551212"));
}

@end
