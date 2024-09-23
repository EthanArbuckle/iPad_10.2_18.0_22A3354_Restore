@implementation SecGetDebugDescriptionFormatOptions

CFDictionaryRef __SecGetDebugDescriptionFormatOptions_block_invoke(uint64_t a1)
{
  CFDictionaryRef result;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  values = (void *)*MEMORY[0x1E0C9AE50];
  keys[0] = CFSTR("debug");
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
