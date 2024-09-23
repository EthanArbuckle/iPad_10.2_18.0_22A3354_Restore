@implementation CSCodedDataDealloctor

CFAllocatorRef __CSCodedDataDealloctor_block_invoke()
{
  const __CFAllocator *v0;
  CFAllocatorRef result;
  CFAllocatorContext v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  sCSCodedDataDeallocatorDictionary = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
  *(_OWORD *)&v2.reallocate = unk_1E2401E88;
  v2.preferredSize = 0;
  memset(&v2, 0, 48);
  result = CFAllocatorCreate(v0, &v2);
  sCSCodedDataDeallocator = (uint64_t)result;
  return result;
}

@end
