@implementation SecGetDebugDescriptionFormatOptions

CFDictionaryRef __SecGetDebugDescriptionFormatOptions_block_invoke(uint64_t a1)
{
  CFDictionaryRef result;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  values = (void *)*MEMORY[0x24BDBD270];
  keys[0] = (void *)kSecDebugFormatOption;
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
